import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2

ApplicationWindow {
    title: qsTr("Предсказать судьбу")
    width: 440
    height: 480
    visible: true

    menuBar: MenuBar {

        Menu {
            title: qsTr("&Файл")
            MenuItem {
                text: qsTr("&Настройки")
                onTriggered: messageDialog.show(qsTr("В бесплатной версии нет настроек"));
            }
            MenuItem {
                text: qsTr("Обичный")
                onTriggered: mainContent.types=0;
            }
            MenuItem {
                text: qsTr("Эро")
                onTriggered: mainContent.types=1;
            }
            MenuItem {
                text: qsTr("Выход")
                onTriggered: Qt.quit();

            }
        }
    }
    MainContent{
       id:mainContent;
       anchors.fill:  parent
    }

    MessageDialog {
        id: messageDialog
        title: qsTr("Сообщение")

        function show(caption) {
            messageDialog.text = caption;
            messageDialog.open();
        }
    }


}
