import Quickshell
import QtQuick
import Quickshell.Wayland

PanelWindow {
  anchors.top: true
  anchors.left: true
  anchors.right: true
  implicitHeight: 30
  color: "#010101"

  Text {
    anchors.centerIn: parent
    text: "Hello"
    color: "#0db9d7"
    font.pixelSize: 18
  }
}
