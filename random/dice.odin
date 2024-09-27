// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at https://mozilla.org/MPL/2.0/.

package random

import "core:math/rand"

d2 :: proc() -> u8 { return rand.choice(FACES_D2, gen=rng) }
d3 :: proc() -> u8 { return rand.choice(FACES_D3, gen=rng) }
d4 :: proc() -> u8 { return rand.choice(FACES_D4, gen=rng) }
d5 :: proc() -> u8 { return rand.choice(FACES_D5, gen=rng) }
d6 :: proc() -> u8 { return rand.choice(FACES_D6, gen=rng) }
d7 :: proc() -> u8 { return rand.choice(FACES_D7, gen=rng) }
d8 :: proc() -> u8 { return rand.choice(FACES_D8, gen=rng) }
d9 :: proc() -> u8 { return rand.choice(FACES_D9, gen=rng) }

d10 :: proc() -> u8 { return rand.choice(FACES_D10, gen=rng) }
d11 :: proc() -> u8 { return rand.choice(FACES_D11, gen=rng) }
d12 :: proc() -> u8 { return rand.choice(FACES_D12, gen=rng) }
d13 :: proc() -> u8 { return rand.choice(FACES_D13, gen=rng) }
d14 :: proc() -> u8 { return rand.choice(FACES_D14, gen=rng) }
d15 :: proc() -> u8 { return rand.choice(FACES_D15, gen=rng) }
d17 :: proc() -> u8 { return rand.choice(FACES_D17, gen=rng) }
d18 :: proc() -> u8 { return rand.choice(FACES_D18, gen=rng) }
d19 :: proc() -> u8 { return rand.choice(FACES_D19, gen=rng) }
d20 :: proc() -> u8 { return rand.choice(FACES_D20, gen=rng) }

d30 :: proc() -> u8 { return rand.choice(FACES_D30, gen=rng) }
d40 :: proc() -> u8 { return rand.choice(FACES_D40, gen=rng) }
d50 :: proc() -> u8 { return rand.choice(FACES_D50, gen=rng) }
d60 :: proc() -> u8 { return rand.choice(FACES_D60, gen=rng) }
d70 :: proc() -> u8 { return rand.choice(FACES_D70, gen=rng) }
d80 :: proc() -> u8 { return rand.choice(FACES_D80, gen=rng) }
d90 :: proc() -> u8 { return rand.choice(FACES_D90, gen=rng) }

d100 :: proc() -> u8 { return rand.choice(FACES_D100, gen=rng) }

d6_symbols_1 :: proc() -> Faces_D6_Symbols_1 { return rand.choice_enum(Faces_D6_Symbols_1, gen=rng) }
d6_poker :: proc() -> Faces_D6_Poker { return rand.choice_enum(Faces_D6_Poker,gen=rng) }
