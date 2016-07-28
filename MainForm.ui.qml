import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.1

Item {
    width: 440
    height: 480

    Image {
        id: background
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: qwestion.top

        source: "pattern.jpg"

        Text {
            id: text1
            x: 316
            y: 174
            color: "#e60fac0f"
            text: qsTr("Text")
            font.italic: true
            font.bold: true
            anchors.verticalCenterOffset: -39
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            textFormat: Text.RichText
            font.pixelSize: 25
        }
    }
    function getAnswer(){
        return "Все будет хорошо";
    }
    Button{
        id: qwestion
        height: 40
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        text: qsTr("Предсказать")
        onClicked:{
                text1.text=qsTr(getAnswer())

               }
   }

}
