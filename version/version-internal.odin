// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at https://mozilla.org/MPL/2.0/.

//+private package
package version

import "core:fmt"

semantic3_to_string :: proc(version: Semantic3) -> string {
    return fmt.tprintf("%d-%d-%d", version.major, version.minor, version.patch)
}
