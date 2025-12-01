package main

import "core:fmt"
import "core:time"
import "core:sys/posix"

PRINT_EVERY :: 1

should_exit: bool

main :: proc() {
	tick        := time.tick_now()
	accumulator := f32(PRINT_EVERY)

	posix.signal(.SIGTERM, proc "c" (_: posix.Signal) {
		should_exit = true
	})

	for {
		accumulator += f32(time.duration_seconds(time.tick_since(tick)))
		tick         = time.tick_now()

		if accumulator >= PRINT_EVERY {
			accumulator -= PRINT_EVERY
			fmt.println("Hello CI/CD 0")
		}

		if should_exit {
			break
		}
	}

	fmt.println("Done")
}