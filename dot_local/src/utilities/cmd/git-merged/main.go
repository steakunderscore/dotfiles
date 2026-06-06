package main

import (
	"bytes"
	"fmt"
	"os"
	"os/exec"
	"regexp"
	"strings"
)

func runCommand(name string, args ...string) (string, error) {
	cmd := exec.Command(name, args...)
	var stdout, stderr bytes.Buffer
	cmd.Stdout = &stdout
	cmd.Stderr = &stderr
	err := cmd.Run()
	if err != nil {
		return "", fmt.Errorf("%v: %s", err, stderr.String())
	}
	return strings.TrimSpace(stdout.String()), nil
}

func main() {
	fmt.Println("🧹 Finding merged branches to remove...")

	// 1. Get all local branches and their upstreams
	outputUpstreams, err := runCommand("git", "for-each-ref", "--format", "%(refname:short) %(upstream:short)", "refs/heads/*")
	if err != nil {
		fmt.Printf("❌ Error getting upstreams: %v\n", err)
		os.Exit(1)
	}

	branchUpstreamMap := make(map[string]string)
	for _, line := range strings.Split(outputUpstreams, "\n") {
		parts := strings.Fields(line)
		if len(parts) >= 1 {
			branch := parts[0]
			upstream := ""
			if len(parts) >= 2 {
				upstream = parts[1]
			}
			branchUpstreamMap[branch] = upstream
		}
	}

	// 2. Get merged branches
	outputMerged, err := runCommand("git", "branch", "--merged")
	if err != nil {
		fmt.Printf("❌ Error listing merged branches: %v\n", err)
		os.Exit(1)
	}

	lines := strings.Split(outputMerged, "\n")
	protectedBranches := regexp.MustCompile(`^(\*|master|main|trunk|dev)$`)

	removedCount := 0
	for _, line := range lines {
		trimmed := strings.TrimSpace(line)
		if trimmed == "" {
			continue
		}

		isCurrent := strings.HasPrefix(trimmed, "*")
		cleanBranch := strings.TrimSpace(strings.TrimPrefix(trimmed, "*"))

		if isCurrent || protectedBranches.MatchString(cleanBranch) {
			continue
		}

		// 3. Find branches that have this branch as upstream
		var dependentBranches []string
		for b, u := range branchUpstreamMap {
			if u == cleanBranch {
				dependentBranches = append(dependentBranches, b)
			}
		}

		fmt.Printf("🗑️  Removing merged branch: %s\n", cleanBranch)
		_, err := runCommand("git", "branch", "-d", cleanBranch)
		if err != nil {
			fmt.Printf("❌ Error removing branch %s: %v\n", cleanBranch, err)
			continue
		}
		removedCount++

		// 4. Update upstreams for dependent branches
		for _, dep := range dependentBranches {
			fmt.Printf("🔗 Updating upstream for %s to origin/master\n", dep)
			_, err := runCommand("git", "branch", "--set-upstream-to=origin/master", dep)
			if err != nil {
				// Fallback to origin/main if master fails? Or just report error.
				// For now, let's try to be smart about the default branch.
				fmt.Printf("⚠️  Could not set upstream for %s: %v\n", dep, err)
			}
		}
	}

	if removedCount == 0 {
		fmt.Println("✅ No merged branches to remove.")
	} else {
		fmt.Printf("✅ Removed %d merged branches.\n", removedCount)
	}
}
