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
        spacing: 20

        Rectangle {
            id: one
            height: 50
            width: 50
            color: focus ? "red" : "pink"

            MouseArea {
                anchors.fill: parent
                onClicked: parent.focus = true;
            }
        }

        Rectangle {
            id: two
            height: 50
            width: 50
            color: focus ? "red" : "pink"

            MouseArea {
                anchors.fill: parent
                onClicked: parent.focus = true;
            }
        }

        Rectangle {
            id: three
            height: 50
            width: 50
            color: focus ? "red" : "pink"

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    parent.focus = true;
                }
            }
        }

        Rectangle {
            id: four
            height: 200
            width: 50
            color: isFocused ? "red" : "pink"

            property bool isFocused: false

            Column {
                anchors.fill: parent

                Rectangle {
                    width: parent.width
                    height: 50
                    border.color: "black"
                    border.width: 2
                    TextInput {
                        id: editOne
                        anchors.fill: parent
                        onFocusChanged: four.activeFChanged();
                    }
                }

                Rectangle {
                    width: parent.width
                    height: 50
                    border.color: "black"
                    border.width: 2
                    TextInput {
                        id: editTwo
                        anchors.fill: parent
                        onFocusChanged: four.activeFChanged();
                    }
                }

                Rectangle {
                    width: parent.width
                    height: 50
                    border.color: "black"
                    border.width: 2
                    TextInput {
                        id: editThree
                        anchors.fill: parent
                        onFocusChanged: four.activeFChanged();
                    }
                }
            }

            function activeFChanged() {
                if(editOne.focus || editTwo.focus || editThree.focus)
                    isFocused = true;
                else
                    isFocused = false;
            }
        }
    }
}
