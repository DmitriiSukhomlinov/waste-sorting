import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12

import "../custom" as Custom
import ".."

Page {
    property StackView view

    height: view.height
    width: view.width

    title: "Метал: выбор маркировки"

    GridLayout {
        id: grid
        anchors.fill: parent
        columns: 2

        Custom.WSPictureButton {
            releasedImageSource: "../icons/metal/40fe/icon.png"
            pressedImageSource: "../icons/metal/40fe/icon.png"
            pictureSize: parent.width * 0.4
            textBold: true
            otherImageOnClick: false

            onClicked: function() {
                view.push("40fe.qml", {"view": view})
            }
        }
        Custom.WSPictureButton {
            releasedImageSource: "../icons/metal/41alu/icon.png"
            pressedImageSource: "../icons/metal/41alu/icon.png"
            pictureSize: parent.width * 0.4
            textBold: true
            otherImageOnClick: false

            onClicked: function() {
                view.push("41alu.qml", {"view": view})
            }
        }
    }
}
