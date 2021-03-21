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

    title: "Стекло"

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
                           "howPrepare": "Бутылки стекло описание.",
                           "jsScript": "updatePoints(\"glass-bottles\")" })
            }
        }

        Custom.WSTextButton {
            Layout.topMargin: 10
            Layout.leftMargin: leftMargin
            text: "Банки"
            onClicked: function() {
                view.push("../prepare_page/prepare_page.qml",
                          {"view": view,
                           "mapView": mapView,
                           "pageTitle": text,
                           "howPrepare": "Банки стекло описание.",
                           "jsScript": "updatePoints(\"glass-jars\")" })
            }
        }

        Custom.WSTextButton {
            Layout.topMargin: 10
            Layout.leftMargin: leftMargin
            text: "Флаконы"
            onClicked: function() {
                view.push("../prepare_page/prepare_page.qml",
                          {"view": view,
                           "mapView": mapView,
                           "pageTitle": text,
                           "howPrepare": "Флаконы стекло описание.",
                           "jsScript": "updatePoints(\"glass-vials\")" })
            }
        }

        Custom.WSTextButton {
            Layout.topMargin: 10
            Layout.leftMargin: leftMargin
            text: "Стеклянная посуда"
            onClicked: function() {
                view.push("../prepare_page/prepare_page.qml",
                          {"view": view,
                           "mapView": mapView,
                           "pageTitle": text,
                           "howPrepare": "Стеклянная посуда стекло описание.",
                           "jsScript": "updatePoints(\"glass-glassware\")" })
            }
        }

        Custom.WSTextButton {
            Layout.topMargin: 10
            Layout.leftMargin: leftMargin
            text: "Оконное стекло"
            onClicked: function() {
                view.push("../prepare_page/prepare_page.qml",
                          {"view": view,
                           "mapView": mapView,
                           "pageTitle": text,
                           "howPrepare": "Оконное стекло стекло описание.",
                           "jsScript": "updatePoints(\"glass-window-glass\")" })
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
            text: "Керамика"
            font.pixelSize: 14
        }

        Label {
            Layout.topMargin: 10
            Layout.leftMargin: leftMargin
            text: "Хрусталь"
            font.pixelSize: 14
        }

        Label {
            Layout.topMargin: 10
            Layout.leftMargin: leftMargin
            text: "Противоударная посуда"
            font.pixelSize: 14
        }

        Label {
            Layout.topMargin: 10
            Layout.leftMargin: leftMargin
            text: "Лампочки"
            font.pixelSize: 14
        }
    }
}
