// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at https://mozilla.org/MPL/2.0/.

package logging

import "core:fmt"
import "core:os"
import "core:path/filepath"

import "../system"
import "../timestamp"

FileHandle :: distinct os.Handle

open_file :: proc(program_name: string, program_version: string) -> FileHandle {

    current_dir: string = os.get_current_directory()
    syserrno: Maybe(int)

    logs_dir: string = filepath.join({current_dir, "logs"})
    syserrno = system.create_dir_if_not_exists(logs_dir, "Logs dir")
    if syserrno != nil {
        error_console_only("Failed to create directory - error code:", syserrno)
    }

    logs_subdir_today: string = filepath.join({logs_dir, timestamp.date()})
    syserrno = system.create_dir_if_not_exists(logs_subdir_today, "Logs subdir for today")
    if syserrno != nil {
        error_console_only("Failed to create directory - error code:", syserrno)
    }

    filename: string =  fmt.tprintf("%s-v%s-t-%s.log", program_name, program_version, timestamp.time())
    path: string = filepath.join({logs_subdir_today, filename})
    info_console_only("Opening log file ", path)

    permissions: int = 0o640

    mode: int
    fh_os: os.Handle
    errno: os.Errno

    mode = os.O_CREATE + os.O_WRONLY
    fh_os, errno = os.open(path, mode, permissions)
    if errno != 0 {
        error_console_only("Failed to open log file - error code: ", errno)
    }

    fh: FileHandle = FileHandle(fh_os)

    info(fh, fmt.tprintf("Log file: %s-v%s-t-%s.log", program_name, program_version, timestamp.time()))

    return fh
}

close_file :: proc(fh: FileHandle) {
    info_console_only("Closing log file")
    errno: os.Errno = os.close(os.Handle(fh))
    if errno != 0 {
        error_console_only("Failed to close log file - error code: ", errno)
    }
}

// NORMAL LOG MESSAGES ====================================================== //

error :: proc(fh: FileHandle, elements: ..any) {
    if log_level < LOG_LEVEL_ERROR { return }
    log(fh, PREFIX_ERROR, ..elements)
}

warning :: proc(fh: FileHandle, elements: ..any) {
    if log_level < LOG_LEVEL_WARNING { return }
    log(fh, PREFIX_WARNING, ..elements)
}

info :: proc(fh: FileHandle, elements: ..any) {
    if log_level < LOG_LEVEL_INFO { return }
    log(fh, PREFIX_INFO, ..elements)
}

debug :: proc(fh: FileHandle, elements: ..any) {
    if log_level < LOG_LEVEL_DEBUG { return }
    log(fh, PREFIX_DEBUG, ..elements)
}

// CONSOLE-ONLY LOG MESSAGES ================================================ //

error_console_only :: proc(elements: ..any) {
    if log_level < LOG_LEVEL_ERROR { return }
    log_console_only(PREFIX_ERROR, ..elements)
}

warning_console_only :: proc(elements: ..any) {
    if log_level < LOG_LEVEL_WARNING { return }
    log_console_only(PREFIX_WARNING, ..elements)
}

info_console_only :: proc(elements: ..any) {
    if log_level < LOG_LEVEL_INFO { return }
    log_console_only(PREFIX_INFO, ..elements)
}

debug_console_only :: proc(elements: ..any) {
    if log_level < LOG_LEVEL_DEBUG { return }
    log_console_only(PREFIX_DEBUG, ..elements)
}

// SET LOG LEVEL ============================================================ //

set_log_level_none :: proc() {
    log_level = LOG_LEVEL_NONE
}

set_log_level_error :: proc() {
    log_level = LOG_LEVEL_ERROR
}

set_log_level_warning :: proc() {
    log_level = LOG_LEVEL_WARNING
}

set_log_level_info :: proc() {
    log_level = LOG_LEVEL_INFO
}

set_log_level_debug :: proc() {
    log_level = LOG_LEVEL_DEBUG
}
