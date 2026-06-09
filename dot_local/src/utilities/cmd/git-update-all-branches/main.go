package main

import (
	"bytes"
	"fmt"
	"os"
	"os/exec"
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
	// 1. Get current branch
	currentBranch, err := runCommand("git", "rev-parse", "--abbrev-ref", "HEAD")
	if err != nil {
		fmt.Printf("❌ Error getting current branch: %v\n", err)
		os.Exit(1)
	}
	fmt.Printf("🌿 Current branch: %s\n", currentBranch)

	// 2. Fetch all
	fmt.Println("📡 Fetching all updates...")
	if _, err := runCommand("git", "fetch", "--all", "--tags"); err != nil {
		fmt.Printf("❌ Error fetching: %v\n", err)
		os.Exit(1)
	}

	// 3. Get all local branches
	branchesRaw, err := runCommand("git", "for-each-ref", "--format", "%(refname:short)", "refs/heads/*")
	if err != nil {
		fmt.Printf("❌ Error listing branches: %v\n", err)
		os.Exit(1)
	}
	branches := strings.Split(branchesRaw, "\n")

	// 3.5 Get branches checked out in worktrees
	wtOut, err := runCommand("git", "worktree", "list", "--porcelain")
	if err != nil {
		fmt.Printf("❌ Error listing worktrees: %v\n", err)
		os.Exit(1)
	}
	checkedOutBranches := make(map[string]bool)
	for _, line := range strings.Split(wtOut, "\n") {
		if strings.HasPrefix(line, "branch refs/heads/") {
			b := strings.TrimPrefix(line, "branch refs/heads/")
			checkedOutBranches[b] = true
		}
	}

	// 4. Update each branch
	for _, branch := range branches {
		if branch == "" {
			continue
		}
		if checkedOutBranches[branch] && branch != currentBranch {
			fmt.Printf("⏭️  Skipping %s: checked out in another worktree\n", branch)
			continue
		}
		fmt.Printf("🔄 Updating branch: %s\n", branch)

		if _, err := runCommand("git", "checkout", branch); err != nil {
			fmt.Printf("❌ Error checking out %s: %v\n", branch, err)
			continue
		}

		if _, err := runCommand("git", "rebase"); err != nil {
			fmt.Printf("❌ Error rebasing %s: %v\n", branch, err)
			// Optional: git rebase --abort if we wanted to be safer
			continue
		}
	}

	// 5. Return to original branch
	fmt.Printf("🔙 Returning to original branch: %s\n", currentBranch)
	if _, err := runCommand("git", "checkout", currentBranch); err != nil {
		fmt.Printf("❌ Error returning to %s: %v\n", currentBranch, err)
		os.Exit(1)
	}

	fmt.Println("✅ All branches updated successfully!")
}
