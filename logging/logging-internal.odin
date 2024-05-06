// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at https://mozilla.org/MPL/2.0/.

//+private package
package logging

import "core:fmt"
import "core:os"

import "../timestamp"

PREFIX_ERROR:   string : "[ERROR]"
PREFIX_WARNING: string : "[WARN ]"
PREFIX_INFO:    string : "[INFO ]"
PREFIX_DEBUG:   string : "[DEBUG]"

LOG_LEVEL_NONE:    u8 : 0
LOG_LEVEL_ERROR:   u8 : 1
LOG_LEVEL_WARNING: u8 : 2
LOG_LEVEL_INFO:    u8 : 3
LOG_LEVEL_DEBUG:   u8 : 4

log_level: u8 = 0

@(private="file")
log_line :: proc(prefix: string, elements: ..any) -> (line: string) {
    line = fmt.tprintf("[%s]%s ", timestamp.time_display(), prefix)
    for value, _ in elements {
        line = fmt.tprintf("%s%v", line, value)
    }
    return
}

log :: proc(fh: FileHandle, prefix: string, elements: ..any) {
    fh_os: os.Handle = os.Handle(fh)
    log_line: string = log_line(prefix, ..elements)
    fmt.println(log_line)

    errno_write: os.Errno
    _, errno_write = os.write_string(fh_os, fmt.tprintf("%s\n", log_line))
    if errno_write != 0 {
        error_console_only("Failed write to log file - error code:", errno_write)
    }
}

log_console_only :: proc(prefix: string, elements: ..any) {
    fmt.println(log_line(prefix, ..elements))
}
