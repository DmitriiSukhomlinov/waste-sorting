import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12

import "../custom" as Custom
import ".."

Page {
    property StackView view
    property Map mapView

    property int picSize: 100

    height: view.height
    width: view.width

    title: "Метал: выбор маркировки"

    GridLayout {
        id: grid
        anchors.fill: parent
        columns: 3

        Custom.WSPictureButton {
            releasedImageSource: "../icons/metal-40.png"
            pressedImageSource: "../icons/metal-40.png"
            buttonText: ""
            pictureSize: picSize
            textBold: true
            otherImageOnClick: false

            onClicked: function() {
                view.push("40fe.qml", {"view": view, "mapView": mapView})
            }
        }
        Custom.WSPictureButton {
            releasedImageSource: "../icons/metal-41.png"
            pressedImageSource: "../icons/metal-41.png"
            buttonText: ""
            pictureSize: picSize
            textBold: true
            otherImageOnClick: false

            onClicked: function() {
                view.push("41alu.qml", {"view": view, "mapView": mapView})
            }
        }
    }
}
