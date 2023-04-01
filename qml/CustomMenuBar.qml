import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Dialogs

Rectangle {
    FileDialog{
        id:fileDialog
    }
    Settings{
        id:settings
//        visible: false
    }
    width:parent.width;height:menuBar.height
    color: "#000000"

    MenuBar {
        id: menuBar
        CustomMenu{
            title:qsTr("Test")
            Action{text:"Test1";onTriggered: fileDialog.open()}
            Action{text:"Test2"}
            Action{text:"Test3"}
        }
        Menu {
            title: qsTr("File")
            Action { text: qsTr("&Open");onTriggered: fileDialog.open();}
            Action { text: qsTr("&Settings"); onTriggered: settings.show(); }
            Action { text: qsTr("&Exit"); onTriggered: closePlayer()}
            delegate: MenuItem {
                id: menuItem
                implicitWidth: 200; implicitHeight: 40
                indicator: Item {
                    implicitWidth: 40; implicitHeight: 40
                    Rectangle {
                        width: 26;height: 26
                        anchors.centerIn: parent
                        visible: menuItem.checkable
                        border.color: "#21be2b"
                        radius: 3
                        Rectangle {
                            width: 14;height: 14
                            anchors.centerIn: parent
                            visible: menuItem.checked
                            color: "#21be2b"
                            radius: 2
                        }
                    }
                }
                contentItem: Text {
                    leftPadding: menuItem.indicator.width
                    rightPadding: menuItem.arrow.width
                    text: menuItem.text
                    font: menuItem.font
                    opacity: enabled ? 1.0 : 0.3
                    color: menuItem.highlighted ? "#ffffff" : "#21be2b"
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                    elide: Text.ElideRight
                }
                background: Rectangle {
                    implicitWidth: 200;implicitHeight: 40
                    opacity: enabled ? 1 : 0.3
                    color: menuItem.highlighted ? "#21be2b" : "transparent"
                }
            }
        }
        Menu { title: qsTr("Edit") }
        Menu { title: qsTr("View") }
        Menu { title: qsTr("Help") }
        delegate: MenuBarItem {
            id: menuBarItem
            contentItem: Text {
                text: menuBarItem.text
                font: menuBarItem.font
                opacity: enabled ? 1.0 : 0.3
                color: menuBarItem.highlighted ? "#ffffff" : "#21be2b"
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }
            background: Rectangle {
                implicitWidth: 40
                implicitHeight: 20
                opacity: enabled ? 1 : 0.3
                color: menuBarItem.highlighted ? "#21be2b" : "parent"
            }
        }
    }

}

