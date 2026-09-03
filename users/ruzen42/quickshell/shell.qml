import QtQuick
import Quickshell
import Quickshell.Io
import Quickshell.Wayland 

ShellRoot {
    PanelWindow {
        id: panel
        
        anchors {
            bottom: true
            left: true
            right: true
        }
        margins {
            bottom: 2 
            left: 2
            right: 2
        }
        
        implicitHeight: 28
        color: "transparent" 

        Rectangle {
            id: leftIsland
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            
            width: clockText.implicitWidth + 30 
            height: parent.height
            
            color: "#4B710117"
            //opacity: 0.8
            radius: 2
            border.color: "#F75C7B"
            border.width: 1

            Text {
                id: clockText
                anchors.centerIn: parent
                color: "#D3C6AA"
                font.pointSize: 9
                text: "00:00:00"

                Timer {
                    interval: 1000
                    running: true
                    repeat: true
                    triggeredOnStart: true
                    onTriggered: clockText.text = Qt.formatDateTime(new Date(), "hh:mm:ss")
                }
            }
        }

        Rectangle {
            id: rightIsland
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
            
            width: rightContent.implicitWidth + 30
            height: parent.height
            
            color: "#4B710117"
            radius: 2
            border.color: "#F75C7B"
            border.width: 1

            Row {
                id: rightContent
                anchors.centerIn: parent
                spacing: 20

                Text {
                    id: ramText
                    color: "#D3C6AA"
                    font.pointSize: 9
                    text: "RAM: --%"
                }
            }
        }
    }

    Process {
        id: ramProc
        command: ["cat", "/proc/meminfo"]
        running: false

        stdout: StdioCollector {
            onStreamFinished: {
                let lines = text.split("\n");
                let memTotal = 0;
                let memAvailable = 0;

                for (let line of lines) {
                    if (line.startsWith("MemTotal:")) {
                        memTotal = parseInt(line.replace(/\D/g, ''));
                    } else if (line.startsWith("MemAvailable:")) {
                        memAvailable = parseInt(line.replace(/\D/g, ''));
                    }
                }

                if (memTotal > 0) {
                    let memUsed = memTotal - memAvailable;
                    let percentage = Math.round((memUsed / memTotal) * 100);
                    ramText.text = "RAM " + percentage + "%";
                }
            }
        }
    }

    Timer {
        interval: 4000
        running: true
        repeat: true
        triggeredOnStart: true
        onTriggered: {
            ramProc.running = false;
            ramProc.running = true;
        }
    }
}
