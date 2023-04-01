import QtQuick
import QtQuick.Controls
import themes 1.0

Window {
    width:400;height: 300
    //    visible: true
    title:qsTr("Settings")

    color:ThemeManager.theme.background
    ComboBox {
        id: comboBox
        x: 93; y: 37
        width: 143; height: 21
        //model:["Banana","Apple","Coco"]
        textRole:"text"
        model:ListModel{
            id:model
            ListElement{text:"Banana";color:"Yellow"}
            ListElement{text:"Apple";color:"Red"}
            ListElement{text:"Coconut";color:"Blue"}
        }

    }

    Label {
        id: label
        x: 47
        y: 37
        text: qsTr("班级")
    }
}
