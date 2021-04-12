import QtQuick 2.12
import QtQuick.Controls 2.5

Item {
    property alias text: label.text
    id: item

    Column {
        anchors.top: parent.top

        Text {
            id: header
            x: 10
            font.pixelSize: 16
            color: "#73E2C9"
            text: "Подготовка"
        }

        Text {
            id: label
            x: 10
            font.pixelSize: 14
            wrapMode: Text.WordWrap
            width: item.parent.width - 100
        }
    }

}
