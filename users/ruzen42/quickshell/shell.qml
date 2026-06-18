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
            bottom: 5 
            left: 5
            right: 5
        }
        
        implicitHeight: 28
        color: "transparent" 

        Rectangle {
            id: leftIsland
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            
            width: clockText.implicitWidth + 30 
            height: parent.height
            
            color: "#232A2E"
            radius: 7
            border.color: "#A7C080"
            border.width: 2

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
            
            color: "#232A2E"
            radius: 7
            border.color: "#A7C080"
            border.width: 2

            Row {
                id: rightContent
                anchors.centerIn: parent
                spacing: 20

                Text {
                    id: wifiText
                    color: "#a6e3a1"
                    font.pointSize: 9
                    text: "  Wifi..."
                }

                Text {
                    id: btText
                    color: "#89b4fa"
                    font.pointSize: 9
                    text: " Bluetooth..."
                }

                Text {
                    id: ramText
                    color: "#e67e80"
                    font.pointSize: 9
                    text: " RAM: --%"
                }
            }
        }
    }

    Process {
        id: wifiProc
        command: ["nmcli", "-t", "-f", "ACTIVE,SSID", "dev", "wifi"]
        running: false

        stdout: StdioCollector {
            onStreamFinished: {
                let lines = text.split("\n");
                let connected = false;
                
                for (let line of lines) {
                    if (line.startsWith("yes:")) {
                        let ssid = line.split(":")[1];
                        wifiText.text = "  " + ssid;
                        connected = true;
                        break;
                    }
                }
                if (!connected) wifiText.text = "󰖪  Disconnected";
            }
        }
    }

    Process {
        id: btProc
        command: ["bluetoothctl", "devices", "Connected"]
        running: false

        stdout: StdioCollector {
            onStreamFinished: {
                let cleanText = text.replace(/^\s+|\s+$/g, '');
                
                if (cleanText === "") {
                    btText.text = " No Devices";
                } else {
                    let firstDeviceLine = cleanText.split("\n")[0];
                    let parts = firstDeviceLine.split(" ");
                    if (parts.length >= 3) {
                        parts.shift();
                        parts.shift();
                        btText.text = " " + parts.join(" ");
                    } else {
                        btText.text = " Connected";
                    }
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
                    ramText.text = " " + percentage + "%";
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
            wifiProc.running = false;
            wifiProc.running = true;

            btProc.running = false;
            btProc.running = true;

            ramProc.running = false;
            ramProc.running = true;
        }
    }
}
