// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at https://mozilla.org/MPL/2.0/.

package system

import "core:fmt"
import "core:os"

create_dir_if_not_exists :: proc(path: string, dir_name_comment: string) -> Maybe(int) {
    if os.exists(path) do return nil

    fmt.println("[SR:SYSTEM]", dir_name_comment, "does not exist, creating:", path)
    errno: os.Errno = os.make_directory(path)
    if errno == 0 do return nil

    return int(errno)
}
