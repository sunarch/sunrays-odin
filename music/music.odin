// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at https://mozilla.org/MPL/2.0/.

package music

import "core:fmt"
import "core:strings"
import rl "vendor:raylib"

MusicEffect :: struct {
    name: string,
    p_music: ^rl.Music,
}

init :: proc(format: cstring, music_data: []u8) -> rl.Music {
    return rl.LoadMusicStreamFromMemory(format, raw_data(music_data), i32(len(music_data)))
}

deinit :: proc(music: rl.Music) {
    rl.UnloadMusicStream(music)
}

play :: proc(music: rl.Music) {
    rl.PlayMusicStream(music)
}

pause_or_resume :: proc(music: rl.Music, status: bool) {
    switch status {
        case true: rl.PauseMusicStream(music)
        case false: rl.ResumeMusicStream(music)
    }
}

debug :: proc(music_effects: []MusicEffect, pos_x: i32, pos_y: i32) -> (pos_y_after: i32) {
    pos_x: i32 = pos_x
    pos_y: i32 = pos_y

    font_size: i32 = 20
    vertical_offset: i32 : 30
    color: rl.Color = rl.BLACK

    played: f32
    length: f32
    playing: string
    text: cstring

    text_heading: cstring : "Music:"
    rl.DrawText(text_heading, pos_x, pos_y, font_size, color)

    pos_x += 20
    pos_x_second_part: i32 = pos_x + 75

    for music in music_effects {
        pos_y += vertical_offset

        played = rl.GetMusicTimePlayed(music.p_music^)
        text = strings.clone_to_cstring(fmt.tprintf("%5.1fs", played))
        rl.DrawText(text, pos_x, pos_y, font_size, color)

        length = rl.GetMusicTimeLength(music.p_music^)
        playing = rl.IsMusicStreamPlaying(music.p_music^) ? "playing" : "stopped"
        text = strings.clone_to_cstring(fmt.tprintf("/ %.1fs (%s) - %s", length, playing, music.name))
        rl.DrawText(text, pos_x_second_part, pos_y, font_size, color)
    }

    pos_y_after = pos_y + vertical_offset
    return
}
