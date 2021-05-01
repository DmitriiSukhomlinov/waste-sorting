import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12

import "../custom" as Custom
import ".."

Page {
    property StackView view
    property Map mapView

    property int picSize: 100
    property int spacingValue: (view.width - picSize * 2) / 3

    height: view.height
    width: view.width

    title: "Метал: выбор маркировки"

    Row {
        spacing: spacingValue
        anchors.fill: parent
        anchors.topMargin: 50
        anchors.leftMargin: spacingValue

        Custom.WSPictureButton {
            releasedImageSource: "../icons/metal/40fe/icon.png"
            pressedImageSource: "../icons/metal/40fe/icon.png"
            pictureSize: picSize
            textBold: true
            otherImageOnClick: false

            onClicked: function() {
                view.push("40fe.qml", {"view": view, "mapView": mapView})
            }
        }
        Custom.WSPictureButton {
            releasedImageSource: "../icons/metal/41alu/icon.png"
            pressedImageSource: "../icons/metal/41alu/icon.png"
            pictureSize: picSize
            textBold: true
            otherImageOnClick: false

            onClicked: function() {
                view.push("41alu.qml", {"view": view, "mapView": mapView})
            }
        }
    }
}
