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

    title: "Пластик: выбор маркировки"

    GridLayout {
        id: grid
        anchors.fill: parent
        columns: 3

        Custom.WSPictureButton {
            releasedImageSource: "../icons/plastic/1pete/icon.png"
            pressedImageSource: "../icons/plastic/1pete/icon.png"
            buttonText: "PETE"
            pictureSize: picSize
            textBold: true
            otherImageOnClick: false

            onClicked: function() {
                view.push("1pete.qml", {"view": view, "mapView": mapView})
            }
        }
        Custom.WSPictureButton {
            releasedImageSource: "../icons/plastic/2hdpe/icon.png"
            pressedImageSource: "../icons/plastic/2hdpe/icon.png"
            buttonText: "HDPE"
            pictureSize: picSize
            textBold: true
            otherImageOnClick: false

            onClicked: function() {
                view.push("2hdpe.qml", {"view": view, "mapView": mapView})
            }
        }
        Custom.WSPictureButton {
            releasedImageSource: "../icons/plastic/3pvc/icon.png"
            pressedImageSource: "../icons/plastic/3pvc/icon.png"
            buttonText: "PVC"
            pictureSize: picSize
            textBold: true
            otherImageOnClick: false

            onClicked: function() {
                view.push("3pvc.qml", {"view": view, "mapView": mapView})
            }
        }
        Custom.WSPictureButton {
            releasedImageSource: "../icons/plastic/4ldpe/icon.png"
            pressedImageSource: "../icons/plastic/4ldpe/icon.png"
            buttonText: "LDPE"
            pictureSize: picSize
            textBold: true
            otherImageOnClick: false

            onClicked: function() {
                view.push("4ldpe.qml", {"view": view, "mapView": mapView})
            }
        }
        Custom.WSPictureButton {
            releasedImageSource: "../icons/plastic/5pp/icon.png"
            pressedImageSource: "../icons/plastic/5pp/icon.png"
            buttonText: "PP"
            pictureSize: picSize
            textBold: true
            otherImageOnClick: false

            onClicked: function() {
                view.push("5pp.qml", {"view": view, "mapView": mapView})
            }
        }
        Custom.WSPictureButton {
            releasedImageSource: "../icons/plastic/6ps/icon.png"
            pressedImageSource: "../icons/plastic/6ps/icon.png"
            buttonText: "PS"
            pictureSize: picSize
            textBold: true
            otherImageOnClick: false

            onClicked: function() {
                view.push("6ps.qml", {"view": view, "mapView": mapView})
            }
        }

        Custom.WSPictureButton {
            releasedImageSource: "../icons/plastic/7other/icon.png"
            pressedImageSource: "../icons/plastic/7other/icon.png"
            buttonText: "OTHER"
            pictureSize: picSize
            textBold: true
            otherImageOnClick: false

            onClicked: function() {
                view.push("7.qml", {"view": view, "mapView": mapView})
            }
        }

        Custom.WSPictureButton {
            releasedImageSource: "../icons/plastic/8extra/icon.png"
            pressedImageSource: "../icons/plastic/8extra/icon.png"
            buttonText: "EXTRA"
            pictureSize: picSize
            textBold: true
            otherImageOnClick: false

            onClicked: function() {
                view.push("other.qml", {"view": view, "mapView": mapView})
            }
        }
    }
}
