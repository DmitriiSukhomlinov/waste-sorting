import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12

Item {
    property string releasedImageSource: ""
    property string pressedImageSource: ""

    id: button
    width: 150
    height: 150
    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
    property alias text: innerText.text
    signal clicked

    Image {
        id: backgroundImage
        anchors.fill: parent
        source: releasedImageSource
    }

    Text {
        id: innerText
        anchors.centerIn: parent
        color: "white"
        font.bold: true
    }

    //Mouse area to react on click events
    MouseArea {
        anchors.fill: button
        onClicked: { button.clicked();}
        onPressed: {
            backgroundImage.source = pressedImageSource }
        onReleased: {
            backgroundImage.source = releasedImageSource
        }
    }
}
