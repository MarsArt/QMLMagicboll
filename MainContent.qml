import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.1
import QtQuick.Window 2.0
import QtSensors 5.3

import "logic.js" as Logic

Item {

    id: mainLayout
    width: 440
    height: 480
    property int types: 0
    Accelerometer {
        id: accel
        dataRate: 100
        active: true
        onReadingChanged: {
            if (accel.reading.z < 0) {
                image1.source = Logic.getGenerator(mainLayout.types).getAnswer()
            }
        }
    }

    Image {
        id: backgroundBottom
        anchors.top: parent.top
        anchors.left: parent.left
        height: (mainLayout.width < mainLayout.height) ? parent.width : parent.height
        width: (mainLayout.width < mainLayout.height) ? parent.width : parent.height
        z: -1
        source: "BackgroundBottom.jpeg"

        Image {
            id: image1
            z: 4
            anchors.fill: parent
            source: "1.png"
            transform: Rotation {
                id: rot
                origin.x: image1.width / 2
                origin.y: 0
                axis {
                    x: Logic.getRandomInt(0, 1)
                    y: Logic.getRandomInt(0, 1)
                    z: Logic.getRandomInt(0, 1)
                }
                angle: 0
            }

            ParallelAnimation {
                id: animation
                property int duar: Logic.getRandomInt(1000, 3500)
                property int drot: 30
                property int typAnim: Logic.getRandomInt(0, 40)
                NumberAnimation {
                    target: rot
                    property: "angle"
                    from: animation.drot
                    to: 0
                    duration: animation.duar
                    running: false
                    easing.type: animation.typAnim
                }
                NumberAnimation {
                    target: image1
                    property: "opacity"
                    easing.amplitude: 1
                    from: 0.1
                    to: 1
                    duration: animation.duar
                    running: false
                    easing.type: animation.typAnim
                }
                NumberAnimation {
                    target: image1
                    property: "scale"
                    easing.amplitude: 1
                    from: 0.3
                    to: 1
                    duration: animation.duar
                    running: false
                    easing.type: animation.typAnim
                }
            }

            onSourceChanged: {
                Logic.animationPrepear(animation, rot)
                animation.start()
            }
        }
        Image {
            id: backgroundTop
            x: 0
            source: "BackgroundTop.png"
            anchors.fill: parent
            z: 5
        }

        MouseArea {
            anchors.fill: parent
            z:6
            onClicked: {
                image1.source = Logic.getGenerator(mainLayout.types).getAnswer()
            }
        }

        MouseArea {
            id: mouseArea1
            width: parent.width/4
            height: parent.height/4

            z: 8
            anchors.verticalCenterOffset: -30
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            onClicked: {
              image1.scale=(image1.scale==2)? 1 : 2;
              image1.z=(image1.z==6)? 4: 6;
            }

        }


    }
    Button {
        id: qwestion
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.top: (mainLayout.width < mainLayout.height) ? backgroundBottom.bottom : parent.top
        anchors.left: (mainLayout.width < mainLayout.height) ? parent.left : backgroundBottom.right
        Text {
            anchors.centerIn: parent
            text: (mainLayout.width < mainLayout.height) ? qsTr("Предсказать") : qsTr(
                                                               "П\nр\nе\nд\nс\nк\nа\nз\nа\nт\nь")
            font.bold: true
            font.pointSize: 10
            // rotation: (mainLayout.width < mainLayout.height)? 0 : 270
        }
        onClicked: {
            image1.source = Logic.getGenerator(mainLayout.types).getAnswer()
        }
    }
}
