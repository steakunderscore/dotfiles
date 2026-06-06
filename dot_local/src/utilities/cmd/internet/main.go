package main

import (
	"fmt"
	"os"
	"os/exec"
)

func main() {
	fmt.Println("🌐 Pinging 8.8.8.8...")
	cmd := exec.Command("ping", "-c", "4", "8.8.8.8")
	cmd.Stdout = os.Stdout
	cmd.Stderr = os.Stderr
	err := cmd.Run()
	if err != nil {
		fmt.Printf("❌ Error running ping: %v\n", err)
		os.Exit(1)
	}
}
