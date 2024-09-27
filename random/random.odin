// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at https://mozilla.org/MPL/2.0/.

package random

import "core:math/rand"

init :: proc() {
    rng_state = { seed, 1 }
    rng = rand.default_random_generator(&rng_state)
}

init_with_seed :: proc(custom_seed: u64) {
    seed = custom_seed
    init()
}

generate_seed :: proc() -> u64 {
    return rand.uint64()
}

get_seed :: proc() -> u64 {
    return seed
}

uint_limited :: proc(limit: u32) -> u32 {
    return rand.uint32() % limit
}
