pragma Singleton

import QtQuick
import Quickshell

// Colors and font used by every qs-music component. The defaults are a neutral
// dark palette; override any property from your shell, e.g. with a Binding:
//
//     Binding { target: MusicStyle; property: "accent"; value: "#c8a96e" }
Singleton {
    property color bg: "#1c1c1e"
    // Panels: song panel and lyrics box
    property color bgAlt: "#232325"
    // Tracks, hover and selection backgrounds
    property color surface: "#2c2c2f"
    // Borders
    property color overlay: "#3a3a3e"
    property color fg: "#dcdfe4"
    property color fgDim: "#7f848e"
    property color accent: "#61afef"
    property color red: "#e05561"

    // A Nerd Font is needed for the icons (MusicIcons)
    property string font: "JetBrainsMono Nerd Font"
    property int fontSize: 13

    // Opacity of the lyrics box background (0 = transparent, 1 = solid)
    property real lyricsBackgroundOpacity: 0.55
}
