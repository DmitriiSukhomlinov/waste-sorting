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

    title: "40 FE/Жесть"

    ColumnLayout {

        Custom.WSTextHeader {
            Layout.topMargin: 30
            Layout.leftMargin: leftMargin
            labelText: "Что можно переработать?"
        }

        Custom.WSTextButton {
            Layout.topMargin: 10
            Layout.leftMargin: leftMargin
            text: "Консервные банки"
            onClicked: function() {
                view.push("../prepare_page/prepare_page.qml",
                          {"view": view,
                           "mapView": mapView,
                           "pageTitle": text,
                           "howPrepare": "Консервные банки описание как подготовить.",
                           "jsScript": "updatePoints(\"fe-cans\")" })
            }
        }

        Custom.WSTextButton {
            Layout.topMargin: 10
            Layout.leftMargin: leftMargin
            text: "Крышки от стеклянных банок"
            onClicked: function() {
                view.push("../prepare_page/prepare_page.qml",
                          {"view": view,
                           "mapView": mapView,
                           "pageTitle": text,
                           "howPrepare": "Крышки от стеклянных банок описание как подготовить.",
                           "jsScript": "updatePoints(\"fe-glass-jar-lids\")" })
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
                           "jsScript": "updatePoints(\"fe-pressurized-cylinders\")" })
            }
        }

        Custom.WSTextButton {
            Layout.topMargin: 10
            Layout.leftMargin: leftMargin
            text: "Металлолом"
            onClicked: function() {
                view.push("../prepare_page/prepare_page.qml",
                          {"view": view,
                           "mapView": mapView,
                           "pageTitle": text,
                           "howPrepare": "Металлолом описание как подготовить.",
                           "jsScript": "updatePoints(\"fe-scrap-metal\")" })
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
            text: "Предметы из комбинированного материала (металл + дерево и др.)"
            font.pixelSize: 14
        }
    }
}
