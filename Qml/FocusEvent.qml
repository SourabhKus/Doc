import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3

ApplicationWindow {
    visible: true
    width: 350
    height: 105
    title: qsTr("Focus Out Event")

    Row {
        anchors.centerIn: parent
        spacing: 10

        Rectangle {
            id: rect1
            height: 100
            width:  100
            border.width: 0
            border.color: Qt.rgba(0, 0, 255, 255)
            color: Qt.rgba(255, 0, 0, 255)

            onFocusChanged: {
                if(rect1.focus)
                    rect1.border.width = 2
                else
                    rect1.border.width = 0
            }

            MouseArea {
                anchors.fill: parent
                onClicked: parent.forceActiveFocus();
            }
        }

        Rectangle {
            id: rect2
            height: 100
            width:  100
            border.width: 0
            border.color: Qt.rgba(0, 0, 255, 255)
            color: Qt.rgba(0, 255, 0, 255)

            onFocusChanged: {
                if(rect2.focus)
                    rect2.border.width = 2
                else
                    rect2.border.width = 0
            }

            MouseArea {
                anchors.fill: parent
                onClicked: parent.forceActiveFocus();
            }
        }

        Rectangle {
            id: rect3
            height: 100
            width:  100
            border.width: 0
            border.color: Qt.rgba(0, 0, 255, 255)
            color: Qt.rgba(255, 255, 0, 255)

            onFocusChanged: {
                if(rect3.focus)
                    rect3.border.width = 2
                else
                    rect3.border.width = 0
            }

            MouseArea {
                anchors.fill: parent
                onClicked: parent.forceActiveFocus();
            }
        }
    }
}
