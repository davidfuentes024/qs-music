pragma Singleton

import QtQuick
import Quickshell

// Nerd Font (Material Design) glyphs, by code point so the source stays readable
Singleton {
    function glyph(codePoint) { return String.fromCodePoint(codePoint); }

    readonly property string music: glyph(0xF075A)
    readonly property string previous: glyph(0xF04AE)
    readonly property string play: glyph(0xF040A)
    readonly property string pause: glyph(0xF03E4)
    readonly property string next: glyph(0xF04AD)
    readonly property string shuffle: glyph(0xF049D)
    readonly property string shuffleOff: glyph(0xF049E)
    readonly property string repeatAll: glyph(0xF0456)
    readonly property string repeatOne: glyph(0xF0458)
    readonly property string repeatOff: glyph(0xF0457)
    readonly property string heart: glyph(0xF02D1)
    readonly property string heartOutline: glyph(0xF02D5)
    readonly property string volumeMedium: glyph(0xF0580)
}
