import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.1
import QtQuick.Window 2.0
import QtSensors 5.3

import "logic.js" as Logic

Image {
    id: image1
    z: 4
    anchors.fill: parent
    source: "1.png"
    transform: Rotation{
        id:rot
        origin.x: image1.width/2;
        origin.y: 0;
        axis { x: Logic.getRandomInt(0,1); y: Logic.getRandomInt(0,1); z: Logic.getRandomInt(0,1); }
        angle: 0
    }
    ParallelAnimation{
        id:animation
        property int duar: Logic.getRandomInt(1000,3500);
        property int drot: 30
        property int typAnim: Logic.getRandomInt(0,40);
        NumberAnimation
        {
            target: rot
            property: "angle"
            from:animation.drot;
            to: 0;
            duration: animation.duar
            running: false
            easing.type: animation.typAnim
        }
        NumberAnimation
        {
            target: image1
            property: "opacity"
            easing.amplitude: 1
            from: 0.1
            to: 1;
            duration: animation.duar
            running: false
            easing.type: animation.typAnim
        }
        NumberAnimation
        {
            target: image1
            property: "scale"
            easing.amplitude: 1
            from: 0.3;
            to: 1;
            duration: animation.duar
            running: false
            easing.type: animation.typAnim
        }
    }
    onSourceChanged: {
        Logic.animationPrepear(animation, rot);
        animation.start()
    }
    
}
