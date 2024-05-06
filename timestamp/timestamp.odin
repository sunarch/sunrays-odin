// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at https://mozilla.org/MPL/2.0/.

package timestamp

import "core:fmt"
import "core:time"

full :: proc() -> string {
    current_time: time.Time = time.now()
    year: int = time.year(current_time)
    month: int = int(time.month(current_time))
    day: int = time.day(current_time)
    hours, mins, secs: int = time.clock_from_time(current_time)

    return fmt.tprintf("%d-%2d-%2d-%2d%2d-%2d", year, month, day, hours, mins, secs)
}

date :: proc() -> string {
    current_time: time.Time = time.now()
    year: int = time.year(current_time)
    month: int = int(time.month(current_time))
    day: int = time.day(current_time)

    return fmt.tprintf("%d-%2d-%2d", year, month, day)
}

time :: proc() -> string {
    current_time: time.Time = time.now()
    hours, mins, secs: int = time.clock_from_time(current_time)

    return fmt.tprintf("%2d%2d-%2d", hours, mins, secs)
}

time_display :: proc() -> string {
    current_time: time.Time = time.now()
    hours, mins, secs: int = time.clock_from_time(current_time)

    return fmt.tprintf("%2d:%2d:%2d", hours, mins, secs)
}
