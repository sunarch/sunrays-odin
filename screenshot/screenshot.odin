// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at https://mozilla.org/MPL/2.0/.

package screenshot

import "core:fmt"
import "core:os"
import "core:path/filepath"
import "core:strings"
import rl "vendor:raylib"

import "../logging"
import "../system"
import "../timestamp"

DIR_NAME: string : "screenshots"

take :: proc(fh_log: logging.FileHandle, program_name: string, program_version: string) {
    current_dir: string = os.get_current_directory()
    screenshots_dir: string = filepath.join({current_dir, "screenshots"})
    syserrno: Maybe(int) = system.create_dir_if_not_exists(screenshots_dir, "Screenshots dir")
    if syserrno != nil {
        logging.error_console_only("Failed to create directory - error code: ", syserrno)
    }

    timestamp: string = timestamp.full()
    filename: string = fmt.tprintf("%s-v%s-t-%s.png", program_name, program_version, timestamp)

    path: string = filepath.join({screenshots_dir, filename})
    path_c: cstring = strings.clone_to_cstring(path)

    logging.debug(fh_log, "Screenshot path: ", path)
    rl.TakeScreenshot(path_c)
}
