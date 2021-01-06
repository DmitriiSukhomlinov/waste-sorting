import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

import "custom" as Custom

Page {
    id: page
    width: 600
    height: 400

    title: qsTr("Choose cathegory")

    GridLayout {
        id: grid

        //fillHeight: true
        //fillWidth: true
        //width: parent.width
        //height: parent.height
        anchors.fill: parent
        columns: 2

        Custom.WSChooseCathegoryButton {
            releasedImageSource: "../icons/Paper.png"
            pressedImageSource: ""
        }
        Custom.WSChooseCathegoryButton {
            releasedImageSource: "../icons/Plastic.png"
            pressedImageSource: ""
        }
        Custom.WSChooseCathegoryButton {
            releasedImageSource: "../icons/Glass.png"
            pressedImageSource: ""
        }
        Custom.WSChooseCathegoryButton {
            releasedImageSource: "../icons/Metal.png"
            pressedImageSource: ""
        }
        Custom.WSChooseCathegoryButton {
            releasedImageSource: "../icons/E-waste.png"
            pressedImageSource: ""
        }
        Custom.WSChooseCathegoryButton {
            releasedImageSource: "../icons/Bulbs.png"
            pressedImageSource: ""
        }

    }
}
