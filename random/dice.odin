// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at https://mozilla.org/MPL/2.0/.

package random

import "core:math/rand"

d2 :: proc() -> u8 { return rand.choice(FACES_D2, r=&rng) }
d3 :: proc() -> u8 { return rand.choice(FACES_D3, r=&rng) }
d4 :: proc() -> u8 { return rand.choice(FACES_D4, r=&rng) }
d5 :: proc() -> u8 { return rand.choice(FACES_D5, r=&rng) }
d6 :: proc() -> u8 { return rand.choice(FACES_D6, r=&rng) }
d7 :: proc() -> u8 { return rand.choice(FACES_D7, r=&rng) }
d8 :: proc() -> u8 { return rand.choice(FACES_D8, r=&rng) }
d9 :: proc() -> u8 { return rand.choice(FACES_D9, r=&rng) }

d10 :: proc() -> u8 { return rand.choice(FACES_D10, r=&rng) }
d11 :: proc() -> u8 { return rand.choice(FACES_D11, r=&rng) }
d12 :: proc() -> u8 { return rand.choice(FACES_D12, r=&rng) }
d13 :: proc() -> u8 { return rand.choice(FACES_D13, r=&rng) }
d14 :: proc() -> u8 { return rand.choice(FACES_D14, r=&rng) }
d15 :: proc() -> u8 { return rand.choice(FACES_D15, r=&rng) }
d16 :: proc() -> u8 { return rand.choice(FACES_D16, r=&rng) }
d17 :: proc() -> u8 { return rand.choice(FACES_D17, r=&rng) }
d18 :: proc() -> u8 { return rand.choice(FACES_D18, r=&rng) }
d19 :: proc() -> u8 { return rand.choice(FACES_D19, r=&rng) }
d20 :: proc() -> u8 { return rand.choice(FACES_D20, r=&rng) }

d30 :: proc() -> u8 { return rand.choice(FACES_D30, r=&rng) }
d40 :: proc() -> u8 { return rand.choice(FACES_D40, r=&rng) }
d50 :: proc() -> u8 { return rand.choice(FACES_D50, r=&rng) }
d60 :: proc() -> u8 { return rand.choice(FACES_D60, r=&rng) }
d70 :: proc() -> u8 { return rand.choice(FACES_D70, r=&rng) }
d80 :: proc() -> u8 { return rand.choice(FACES_D80, r=&rng) }
d90 :: proc() -> u8 { return rand.choice(FACES_D90, r=&rng) }

d100 :: proc() -> u8 { return rand.choice(FACES_D100, r=&rng) }

d6_symbols_1 :: proc() -> Faces_D6_Symbols_1 { return rand.choice_enum(Faces_D6_Symbols_1, r=&rng) }
d6_poker :: proc() -> Faces_D6_Poker { return rand.choice_enum(Faces_D6_Poker, r=&rng) }
