// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at https://mozilla.org/MPL/2.0/.

//+private package
package random

import "core:math/rand"

seed: u64 = generate_seed()

rng_state: rand.Default_Random_State

rng: rand.Generator
