package main

import "core:fmt"
import "core:time"

main :: proc() {
	for {
		fmt.println("Hello CI/CD 0")
		time.sleep(5 * time.Second)
	}
}