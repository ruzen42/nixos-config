import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import org.quickshell.Shell
import org.quickshell.Wayland

ShellRoot {
    VariantsWindow {
        id: topBar
        
        anchors.edges: AnchorEdge.Top
        anchors.slopes: AnchorSlope.Horizontal
        height: 28 

        Rectangle {
            anchors.fill: parent
            color: "#1e2326" 
            
            Rectangle {
                anchors.bottom: parent.bottom
                width: parent.width
                height: 1
                color: "#272e33"
            }

            RowLayout {
                anchors.fill: parent
                anchors.leftMargin: 12
                anchors.rightMargin: 12
                spacing: 18

                Text {
                    text: "everforest"
                    color: "#a7c080" 
                    font.family: "IBM Plex Mono"
                    font.pixelSize: 12
                    font.bold: true
                    Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                }

                Item {
                    Layout.fillWidth: true
                }

                Row {
                    spacing: 6
                    Layout.alignment: Qt.AlignVCenter
                    
                    Text {
                        id: btIcon
                        text: "" 
                        color: "#7fbbb3" 
                        font.family: "JetBrainsMono Nerd Font" 
                        font.pixelSize: 13
                    }

                    Text {
                        id: btText
                        text: ".."
                        color: "#d3c6aa" 
                        font.family: "IBM Plex Mono"
                        font.pixelSize: 12
                    }

                    Timer {
                        interval: 4000
                        running: true
                        repeat: true
                        triggeredOnStart: true
                        onTriggered: btProcess.start()
                    }

                    Process {
                        id: btProcess
                        command: ["sh", "-c", "bluetoothctl show | grep -q 'Powered: yes' && echo 'On' || echo 'Off'"]
                        onStdoutChanged: {
                            let output = stdout.trim();
                            if (output === "On") {
                                btText.text = "on"
                                btIcon.color = "#7fbbb3" 
                            } else {
                                btText.text = "off"
                                btIcon.color = "#859289" 
                            }
                        }
                    }
                }

                Text {
                    id: clock
                    color: "#d3c6aa" // fg
                    font.family: "IBM Plex Mono"
                    font.pixelSize: 12
                    Layout.alignment: Qt.AlignRight | Qt.AlignVCenter

                    Timer {
                        interval: 1000
                        running: true
                        repeat: true
                        triggeredOnStart: true
                        onTriggered: {
                            var date = new Date();
                            clock.text = date.toLocaleDateString(Qt.locale("en_US"), "ddd H:mm").toLowerCase();
                        }
                    }
                }
            }
        }
    }
}
