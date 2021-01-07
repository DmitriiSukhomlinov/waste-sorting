import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

import "custom" as Custom

Page {
    property StackView view
    id: page
    width: 600
    height: 400

    title: "Выбор категории"

    GridLayout {
        id: grid
        anchors.fill: parent
        columns: 2

        Custom.WSPictureButton {
            releasedImageSource: "../icons/paper-released.png"
            pressedImageSource: "../icons/paper-pressed.png"
            buttonText: "Бумага"
            onClicked: function() {
                //view.push("HomeForm.qml", {"view": view})
            }
        }
        Custom.WSPictureButton {
            releasedImageSource: "../icons/plastic-released.png"
            pressedImageSource: "../icons/plastic-pressed.png"
            buttonText: "Пластик"
        }
        Custom.WSPictureButton {
            releasedImageSource: "../icons/glass-released.png"
            pressedImageSource: "../icons/glass-pressed.png"
            buttonText: "Стекло"
        }
        Custom.WSPictureButton {
            releasedImageSource: "../icons/metal-released.png"
            pressedImageSource: "../icons/metal-pressed.png"
            buttonText: "Метал"
        }
        Custom.WSPictureButton {
            releasedImageSource: "../icons/e-waste-released.png"
            pressedImageSource: "../icons/e-waste-pressed.png"
            buttonText: "Электроника"
        }
        Custom.WSPictureButton {
            releasedImageSource: "../icons/bulbs-released.png"
            pressedImageSource: "../icons/bulbs-pressed.png"
            buttonText: "Лампочки"
        }

    }
}
