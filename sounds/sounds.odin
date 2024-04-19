// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at https://mozilla.org/MPL/2.0/.

package sounds

import "core:fmt"
import "core:strings"
import rl "vendor:raylib"

SoundEffect :: struct {
    name: string,
    p_sound: ^rl.Sound,
}

init :: proc(format: cstring, sound_data: []u8) -> (sound: rl.Sound) {
    wave: rl.Wave = rl.LoadWaveFromMemory(format, raw_data(sound_data), i32(len(sound_data)))
    sound = rl.LoadSoundFromWave(wave)
    rl.UnloadWave(wave)
    return
}

deinit :: proc(sound: rl.Sound) {
    rl.UnloadSound(sound)
}

play :: proc(sound: rl.Sound) {
    rl.PlaySound(sound)
}

pause_or_resume :: proc(sound: rl.Sound, status: bool) {
    switch status {
        case true: rl.PauseSound(sound)
        case false: rl.ResumeSound(sound)
    }
}

debug :: proc(sounds: []SoundEffect, pos_x: i32, pos_y: i32) -> (pos_y_after: i32) {
    pos_x: i32 = pos_x
    pos_y: i32 = pos_y

    font_size: i32 = 20
    vertical_offset: i32 : 30
    color: rl.Color = rl.BLACK

    playing: string
    text: cstring

    text_heading: cstring : "Sounds:"
    rl.DrawText(text_heading, pos_x, pos_y, font_size, color)

    pos_x += 20

    for sound in sounds {
        pos_y += vertical_offset

        playing = rl.IsSoundPlaying(sound.p_sound^) ? "playing" : "stopped"
        text = strings.clone_to_cstring(fmt.tprintf("%s - %s", sound.name, playing))
        rl.DrawText(text, pos_x, pos_y, font_size, color)
    }

    pos_y_after = pos_y + vertical_offset
    return
}
