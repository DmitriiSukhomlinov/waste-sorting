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

    title: "41 ALU/Алюминий"

    ColumnLayout {

        Custom.WSTextHeader {
            Layout.topMargin: 30
            Layout.leftMargin: leftMargin
            labelText: "Что можно переработать?"
        }

        Custom.WSTextButton {
            Layout.topMargin: 10
            Layout.leftMargin: leftMargin
            text: "Алюминиевые банки"
            onClicked: function() {
                view.push("../prepare_page/prepare_page.qml",
                          {"view": view,
                           "mapView": mapView,
                           "pageTitle": text,
                           "howPrepare": "Алюминиевые банки описание как подготовить.",
                           "jsScript": "updatePoints(\"alu-aluminum-cans\")" })
            }
        }

        Custom.WSTextButton {
            Layout.topMargin: 10
            Layout.leftMargin: leftMargin
            text: "Фольга"
            onClicked: function() {
                view.push("../prepare_page/prepare_page.qml",
                          {"view": view,
                           "mapView": mapView,
                           "pageTitle": text,
                           "howPrepare": "Фольга описание как подготовить.",
                           "jsScript": "updatePoints(\"alu-foil\")" })
            }
        }

        Custom.WSTextButton {
            Layout.topMargin: 10
            Layout.leftMargin: leftMargin
            text: "Баллоны под давлением"
            onClicked: function() {
                view.push("../prepare_page/prepare_page.qml",
                          {"view": view,
                           "mapView": mapView,
                           "pageTitle": text,
                           "howPrepare": "Баллоны под давлением описание как подготовить.",
                           "jsScript": "updatePoints(\"alu-pressurized-cylinders\")" })
            }
        }

        Custom.WSTextButton {
            Layout.topMargin: 10
            Layout.leftMargin: leftMargin
            text: "Одноразовые формы для выпечки"
            onClicked: function() {
                view.push("../prepare_page/prepare_page.qml",
                          {"view": view,
                           "mapView": mapView,
                           "pageTitle": text,
                           "howPrepare": "Одноразовые формы для выпечки описание как подготовить.",
                           "jsScript": "updatePoints(\"alu-disposable-bakeware\")" })
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
            text: "Посуда для готовки с покрытием (антипригарное и др.)"
            font.pixelSize: 14
        }

        Label {
            Layout.topMargin: 10
            Layout.leftMargin: leftMargin
            text: "Кофейные капсулы"
            font.pixelSize: 14
        }
    }
}
