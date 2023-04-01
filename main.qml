import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts
import RollCall.File 1.0
import themes 1.0
import "./qml"
//import "./Resources"
//import "./Resources/Themes"
//import "qrc:/themes/Themes/"

Window {
    width:640;height:400
    visible: true
    title: qsTr("随机点名器")
    CustomMenuBar{

    }
    Rectangle{
        width: 200;height:200
        x:10;y:50
        border.width: 30
        border.color: ThemeManager.theme.foreground
        color:ThemeManager.theme.background
    }

    Button{
        width:100
        height:30
        x:300;y:50
        text: qsTr("Switch")
        onClicked: {
            if(ThemeManager.theme == OneDark)
            {
                ThemeManager.theme = Light;
            }
            else if(ThemeManager.theme == Light)
            {
                ThemeManager.theme = OneDark;
            }

        }
    }

    File{
        id:file
        source: appDir+"/Students.txt"
    }
//    Rectangle {
//        id: rectangle
//        anchors.topMargin: 50
//        width: parent.width;height: parent.height/2
//        color: "#ffffff"
////        anchors.verticalCenterOffset: -83;anchors.horizontalCenterOffset: 0
//        border.width:2;
//        border.color:"red";
//        TextEdit {
//            id: text1
//            color: "#000000"
//            anchors.centerIn: parent
//            font.pixelSize: 60
//            onTextChanged: file.text=text
//        }
//    }

    Button {
        id: button
        width: 120;height: 50
        anchors.centerIn: parent
        text: qsTr("Start")
        anchors.verticalCenterOffset: 132;anchors.horizontalCenterOffset: -100
        onClicked: {
//            text1.text = file.text;
//            file.startRandom();
        }
    }

    Button {
        id: button1
        width: 120;height: 50
        anchors.centerIn: parent
        text: qsTr("Write")
        anchors.verticalCenterOffset: 132;anchors.horizontalCenterOffset: 100
        onClicked: {
            file.text = text1.text;
        }

    }

}
