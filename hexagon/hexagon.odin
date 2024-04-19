// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at https://mozilla.org/MPL/2.0/.

package hexagon

import "core:math"
import rl "vendor:raylib"

Hexagon :: struct {
    a: f32,   // Side (a)
    d: f32,   // Long diagonal (d)
    s: f32,   // Short diagonal (s)
    rc: f32,  // Circumcircle radius (R) -> (rc)
    ri: f32,  // Inradius / Apothem (r) -> (ri)

    area: f32,
    perimeter: f32,

    x_outer_left: f32,
    x_inner_left: f32,
    x_mid: f32,
    x_inner_right: f32,
    x_outer_right: f32,

    vertical_correction: f32,
    y_top: f32,
    y_mid: f32,
    y_bottom: f32,

    top_left: rl.Vector2,
    center: rl.Vector2,
}

new :: proc(side: f32,
            col: u8, row: u8,
            h_offset: f32, v_offset: f32,
            ) -> (hex: Hexagon) {

    hex = Hexagon {
        a = side,
        d = d_by_a(side),
        s = s_by_a(side),
        rc = rc_by_a(side),
        ri = ri_by_a(side),

        area = area_by_a(side),
        perimeter = perimeter_by_a(side),

        x_outer_left = 0.0,
        x_inner_left = 0.0,
        x_mid = 0.0,
        x_inner_right = 0.0,
        x_outer_right = 0.0,

        vertical_correction = 0.0,
        y_top = 0.0,
        y_mid = 0.0,
        y_bottom = 0.0,

        top_left = {0, 0},
        center = {0, 0},
    }

    // col
    h_unit: f32 = hex.rc / 2
    hex.x_outer_left = f32(col) * (3 * h_unit) + h_offset
    hex.x_inner_left = hex.x_outer_left + h_unit
    hex.x_mid = hex.x_inner_left + h_unit
    hex.x_inner_right = hex.x_mid + h_unit
    hex.x_outer_right = hex.x_inner_right + h_unit

    // row
    hex.vertical_correction = (col % 2 == 1) ? hex.ri : 0
    hex.y_top = f32(row) * hex.s + hex.vertical_correction + v_offset
    hex.y_mid = hex.y_top + hex.ri
    hex.y_bottom = hex.y_mid + hex.ri

    // vectors
    hex.top_left = {hex.x_outer_left, hex.y_top}
    hex.center = {hex.x_mid, hex.y_mid}

    return
}

/* values by side */

area_by_a :: proc(side: f32) -> (area: f32) {
    // Area = Apothem * Perimeter / 2
    area = ri_by_a(side) * perimeter_by_a(side) / 2
    return
}

perimeter_by_a :: proc(side: f32) -> (perimeter: f32) {
    // Perimeter = 6 * Side
    perimeter = side * 6
    return
}

d_by_a :: proc(side: f32) -> (long_diagonal: f32) {
    // Long diagonal = 2 * Side
    long_diagonal = side * 2
    return
}

s_by_a :: proc(side: f32) -> (short_diagonal: f32) {
    // Short diagonal = √3 * Side
    short_diagonal = math.SQRT_THREE * side
    return
}

rc_by_a :: proc(side: f32) -> (circumference_radius: f32) {
    // Circumcircle radius = Side
    circumference_radius = side
    return
}

ri_by_a :: proc(side: f32) -> (inradius: f32) {
    // Inradius / Apothem = √3/2 * Side
    inradius = math.SQRT_THREE / 2 * side
    return
}

/* side by other values */

a_by_area :: proc(area: f32) -> (side: f32) {
    side = math.sqrt(area / (math.SQRT_THREE * 1.5))
    return
}

a_by_perimeter :: proc(perimeter: f32) -> (side: f32) {
    side = perimeter / 6
    return
}

a_by_d :: proc(long_diagonal: f32) -> (side: f32) {
    side = long_diagonal / 2
    return
}

a_by_s :: proc(short_diagonal: f32) -> (side: f32) {
    side = short_diagonal / math.SQRT_THREE
    return
}

a_by_rc :: proc(circumference_radius: f32) -> (side: f32) {
    side = circumference_radius
    return
}

a_by_ri :: proc(inradius: f32) -> (side: f32) {
    side = inradius * 2 / math.SQRT_THREE
    return
}
