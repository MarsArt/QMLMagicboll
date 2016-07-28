import QtQuick 2.0
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.3

Button {

    width: 100
    height: 62

    Text {
        anchors.centerIn: parent
        id: name
        text: qsTr("text")
        rotation: 90
    }

}

