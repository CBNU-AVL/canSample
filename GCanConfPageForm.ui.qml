import QtQuick 2.11
import QtQuick.Controls 2.4

Page {
    id: page
    width: 1280
    height: 720

    readonly property int steer_MIN_ANGLE: -500
    readonly property int steer_MAX_ANGLE: 500
    readonly property int steer_MIN_SPEED: 100
    readonly property int steer_MAX_SPEED: 250
    readonly property int accel_MIN: -5
    readonly property int accel_MAX: 5

    property alias steerControl: switchSteerControl.checked
    property alias accelControl: switchAccelControl.checked
    property alias steerIgnOvr: checkIgnStrOvr.checked
    property alias steerAngle: dialSteerAngle.value
    property alias steerSpeed: sliderSteerSpeed.value
    property alias accel: sliderAccel.value


    header: Label {
        text: qsTr("Vehicle Control Panel")
        font.pixelSize: Qt.application.font.pixelSize * 2
        padding: 10
    }

    Switch {
        id: switchActive
        x: 20
        y: 6
        text: qsTr("Active")
    }

    Row {
        id: row
        x: 20
        y: 46
        width: 550
        height: 30
        spacing: 20

        Switch {
            id: switchSteerControl
            enabled: switchActive.checked
            text: qsTr("Steer Control")
            anchors.verticalCenter: parent.verticalCenter
        }

        Switch {
            id: switchAccelControl
            enabled: switchActive.checked
            text: qsTr("Accel Control")
            anchors.verticalCenter: parent.verticalCenter
        }

        CheckBox {
            id: checkIgnStrOvr
            text: qsTr("Ignore Steer Override")
            anchors.verticalCenter: parent.verticalCenter
        }
    }

    Row {
        id: row1
        x: 22
        y: 99
        width: 605
        height: 280

        Column {
            id: columnSteerAngle
            width: 200
            height: 280
            spacing: 10

            Text {
                text: qsTr("Steer Angle[deg]")
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 12
            }

            SpinBox {
                id: spinBoxSteerAngle
                editable: true
                stepSize: 1
                from: steer_MIN_ANGLE
                to: steer_MAX_ANGLE
                value: dialSteerAngle.value
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Dial {
                id: dialSteerAngle
                width: 200
                height: 200
                stepSize: 1
                wheelEnabled: true
                from: steer_MIN_ANGLE
                to: steer_MAX_ANGLE
                value: steerAngle
                anchors.horizontalCenter: parent.horizontalCenter
                Text {
                    id: text4
                    anchors.bottom: parent.bottom
                    anchors.left: parent.left
                    text: steer_MIN_ANGLE
                    font.pixelSize: 12
                }

                Text {
                    id: text5
                    anchors.bottom: parent.bottom
                    anchors.right: parent.right
                    text: steer_MAX_ANGLE
                    font.pixelSize: 12
                }
            }
        }

        Column {
            id: columnSteerSpeed
            width: 200
            height: 280
            Text {
                id: text3
                text: qsTr("Steer Angle Speed[deg/s]")
                font.pixelSize: 12
                anchors.horizontalCenter: parent.horizontalCenter
            }

            SpinBox {
                id: spinBoxSteerSpeed
                editable: true
                stepSize: 1
                from: steer_MIN_SPEED
                to: steer_MAX_SPEED
                value: sliderSteerSpeed.value
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Slider {
                id: sliderSteerSpeed
                anchors.horizontalCenter: parent.horizontalCenter
                from: steer_MIN_SPEED
                to: steer_MAX_SPEED
                stepSize: 1
                value: steerSpeed
                orientation: Qt.Vertical
                Text {
                    anchors.bottom: parent.bottom
                    anchors.left: parent.right
                    text: steer_MIN_SPEED
                    font.pixelSize: 12
                }

                Text {
                    anchors.top: parent.top
                    anchors.left: parent.right
                    text: steer_MAX_SPEED
                    font.pixelSize: 12
                }
            }

            spacing: 10
        }

        Column {
            id: columnAccel
            width: 200
            height: 280
            spacing: 10

            Text {
                text: qsTr("Acceleration[m/s^2]")
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 12
            }

            SpinBox {
                id: spinBoxAccel
                from: accel_MIN * 1000
                value: sliderAccel.value * 1000
                to: accel_MAX * 1000
                stepSize: 100
                anchors.horizontalCenter: parent.horizontalCenter
                editable: true
            }

            Slider {
                id: sliderAccel
                anchors.horizontalCenter: parent.horizontalCenter
                from: accel_MIN
                to: accel_MAX
                stepSize: 0.1
                orientation: Qt.Vertical
                value: accel
                Text {
                    anchors.bottom: parent.bottom
                    anchors.left: parent.right
                    text: accel_MIN
                    font.pixelSize: 12
                }

                Text {
                    anchors.top: parent.top
                    anchors.left: parent.right
                    text: accel_MAX
                    font.pixelSize: 12
                }
            }
        }
    }

    TextArea {
        id: textAreaConsoleOutput
        x: 22
        y: 404
        width: 1236
        height: 209
        text: "T.B.D."
        verticalAlignment: Text.AlignTop
        wrapMode: Text.WrapAtWordBoundaryOrAnywhere
    }

    Text {
        id: text6
        x: 22
        y: 385
        text: qsTr("Console Output")
        font.pixelSize: 12
    }

    Item {
        id: itemChart
        x: 633
        y: 6
        width: 625
        height: 392
    }
}
