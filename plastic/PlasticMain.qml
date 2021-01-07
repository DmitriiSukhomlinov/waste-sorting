import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12

import "../custom" as Custom

Page {
    property StackView view
    property int picSize: 100

    height: view.height
    width: view.width

    title: "Пластик: выбор маркировки"

    GridLayout {
        id: grid
        anchors.fill: parent
        columns: 3

        Custom.WSPictureButton {
            releasedImageSource: "../icons/plastic-1.png"
            pressedImageSource: "../icons/plastic-1.png"
            buttonText: "PETE"
            pictureSize: picSize
            textBold: true
            otherImageOnClick: false
        }
        Custom.WSPictureButton {
            releasedImageSource: "../icons/plastic-2.png"
            pressedImageSource: "../icons/plastic-2.png"
            buttonText: "HDPE"
            pictureSize: picSize
            textBold: true
            otherImageOnClick: false

            onClicked: function() {
                view.push("2hdpe.qml", {"view": view})
            }
        }
        Custom.WSPictureButton {
            releasedImageSource: "../icons/plastic-3.png"
            pressedImageSource: "../icons/plastic-3.png"
            buttonText: "PVC"
            pictureSize: picSize
            textBold: true
            otherImageOnClick: false
        }
        Custom.WSPictureButton {
            releasedImageSource: "../icons/plastic-4.png"
            pressedImageSource: "../icons/plastic-4.png"
            buttonText: "LDPE"
            pictureSize: picSize
            textBold: true
            otherImageOnClick: false
        }
        Custom.WSPictureButton {
            releasedImageSource: "../icons/plastic-5.png"
            pressedImageSource: "../icons/plastic-5.png"
            buttonText: "PP"
            pictureSize: picSize
            textBold: true
            otherImageOnClick: false
        }
        Custom.WSPictureButton {
            releasedImageSource: "../icons/plastic-6.png"
            pressedImageSource: "../icons/plastic-6.png"
            buttonText: "PS"
            pictureSize: picSize
            textBold: true
            otherImageOnClick: false
        }
        Custom.WSPictureButton {
            releasedImageSource: "../icons/plastic-7.png"
            pressedImageSource: "../icons/plastic-7.png"
            buttonText: "OTHER"
            pictureSize: picSize
            textBold: true
            otherImageOnClick: false
        }
    }
}
