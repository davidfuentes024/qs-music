//@ pragma UseQApplication
import QtQuick
import Quickshell

// Minimal shell: a top bar with the music button, plus the lyrics overlay.
// Try it standalone: qs -p /path/to/qs-music
// (when qs-music sits inside another shell config, this file is ignored)
ShellRoot {
    // Optional: restyle every qs-music component
    Binding { target: MusicStyle; property: "accent"; value: "#c8a96e" }

    PanelWindow {
        anchors {
            top: true
            left: true
            right: true
        }
        implicitHeight: 28
        color: MusicStyle.bg

        MusicButton {
            anchors.centerIn: parent
        }
    }

    LyricsOverlay {}
}
