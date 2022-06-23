import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

import "custom" as Custom

Page {
    property StackView view
    id: page

    title: "Выбор категории"

    GridLayout {
        id: grid
        anchors.fill: parent
        //Не работает на Android
        anchors.bottomMargin: 40
        columns: 2

        Custom.WSPictureButton {
            releasedImageSource: "../icons/paper/icon-main.png"
            pressedImageSource: "../icons/paper/icon-main.png"
            otherImageOnClick: false
            onClicked: function() {
                view.push("paper/PaperMain.qml", {"view": view})
            }
        }

        Custom.WSPictureButton {
            releasedImageSource: "../icons/plastic/icon-main.png"
            pressedImageSource: "../icons/plastic/icon-main.png"
            otherImageOnClick: false
            onClicked: function() {
                view.push("plastic/PlasticMain.qml", {"view": view})
            }
        }
        Custom.WSPictureButton {
            releasedImageSource: "../icons/glass/icon-main.png"
            pressedImageSource: "../icons/glass/icon-main.png"
            otherImageOnClick: false
            onClicked: function() {
                view.push("glass/GlassMain.qml", {"view": view})
            }
        }
        Custom.WSPictureButton {
            releasedImageSource: "../icons/metal/icon-main.png"
            pressedImageSource: "../icons/metal/icon-main.png"
            otherImageOnClick: false
            onClicked: function() {
                view.push("metal/MetalMain.qml", {"view": view})
            }
        }
        Custom.WSPictureButton {
            releasedImageSource: "../icons/e-waste/icon-main.png"
            pressedImageSource: "../icons/e-waste/icon-main.png"
            otherImageOnClick: false
            onClicked: function() {
                view.push("e-waste/EWasteMain.qml", {"view": view})
            }
        }
        Custom.WSPictureButton {
            releasedImageSource: "../icons/clothes/icon-main.png"
            pressedImageSource: "../icons/clothes/icon-main.png"
            otherImageOnClick: false
            onClicked: function() {
                view.push("clothes/ClothesMain.qml", {"view": view})
            }
        }
        Custom.WSPictureButton {
            releasedImageSource: "../icons/textile/icon-main.png"
            pressedImageSource: "../icons/textile/icon-main.png"
            otherImageOnClick: false
            onClicked: function() {
                view.push("textile/TextileMain.qml", {"view": view})
            }
        }
        Custom.WSPictureButton {
            releasedImageSource: "../icons/danger/icon-main.png"
            pressedImageSource: "../icons/danger/icon-main.png"
            otherImageOnClick: false
            onClicked: function() {
                view.push("danger/DangerMain.qml", {"view": view})
            }
        }
    }
}
