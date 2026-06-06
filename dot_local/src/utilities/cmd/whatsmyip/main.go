package main

import (
	"fmt"
	"io"
	"net/http"
	"regexp"
	"strings"
	"time"
)

func getIP(url string) (string, error) {
	client := &http.Client{
		Timeout: 1 * time.Second,
	}
	resp, err := client.Get(url)
	if err != nil {
		return "", err
	}
	defer resp.Body.Close()

	body, err := io.ReadAll(resp.Body)
	if err != nil {
		return "", err
	}

	// Dyndns returns HTML, we extract the IP using regex
	re := regexp.MustCompile(`Current IP Address: ([0-9a-fA-F\.:]+)`)
	matches := re.FindStringSubmatch(string(body))
	if len(matches) < 2 {
		return "", fmt.Errorf("could not parse IP from response")
	}

	return matches[1], nil
}

func main() {
	fmt.Println("🌐 Detecting public IP addresses...")

	ipv4, err := getIP("http://checkip.dyndns.org")
	if err != nil {
		fmt.Printf("❌ IPv4 Error: %v\n", err)
	} else {
		fmt.Printf("✅ IPv4: %s\n", ipv4)
	}

	ipv6, err := getIP("http://checkipv6.dyndns.org")
	if err != nil {
		// IPv6 might fail if not supported by the network
		if strings.Contains(err.Error(), "no such host") || strings.Contains(err.Error(), "network is unreachable") || strings.Contains(err.Error(), "Client.Timeout") {
			fmt.Printf("ℹ️  IPv6: Not detected or timed out: %v\n", err)
		} else {
			fmt.Printf("❌ IPv6 Error: %v\n", err)
		}
	} else {
		fmt.Printf("✅ IPv6: %s\n", ipv6)
	}
}
