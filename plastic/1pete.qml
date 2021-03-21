import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12

import "../custom" as Custom
import "../"

Page {
    property StackView view
    property Map mapView

    property int leftMargin: 40

    height: view.height
    width: view.width

    title: "1 PET/ПЭТ"

    ColumnLayout {

        Custom.WSTextHeader {
            Layout.topMargin: 30
            Layout.leftMargin: leftMargin
            labelText: "Что можно переработать?"
        }

        Custom.WSTextButton {
            Layout.topMargin: 10
            Layout.leftMargin: leftMargin
            text: "Бутылки"
            onClicked: function() {
                view.push("../prepare_page/prepare_page.qml",
                          {"view": view,
                           "mapView": mapView,
                           "pageTitle": text,
                           "howPrepare": "Бутылки ПЭТ описание как подготовить.",
                           "jsScript": "updatePoints(\"pet-bottles\")" })
            }
        }

        Custom.WSTextHeader {
            Layout.topMargin: 30
            Layout.leftMargin: leftMargin
            labelText: "Что нельзя переработать?"
        }

        Label {
            Layout.topMargin: 10
            Layout.leftMargin: leftMargin
            text: "Все остальное"
            font.pixelSize: 14
        }
    }
}
