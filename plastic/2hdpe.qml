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

    title: "2 HDPE/ПЭНД"

    ColumnLayout {

        Custom.WSTextHeader {
            Layout.topMargin: 30
            Layout.leftMargin: leftMargin
            labelText: "Что можно переработать?"
        }

        Custom.WSTextButton {
            Layout.topMargin: 10
            Layout.leftMargin: leftMargin
            text: "Бутылки от бытовой химии"
            onClicked: function() {
                view.push("../prepare_page/prepare_page.qml",
                          {"view": view,
                           "mapView": mapView,
                           "pageTitle": text,
                           "howPrepare": "Ну там помыть, почистить, вот это вот все. Можно еще что-нибудь сделать.",
                           "jsScript": "updatePoints(\"household-chemicals-bottles\")" })
            }
        }

        Custom.WSTextButton {
            Layout.topMargin: 10
            Layout.leftMargin: leftMargin
            text: "Бутылки от косметических средств"
            onClicked: function() {
                view.push("../prepare_page/prepare_page.qml",
                          {"view": view,
                           "mapView": mapView,
                           "pageTitle": text,
                           "howPrepare": "Чистоту навести.",
                           "jsScript": "updatePoints(\"cosmetic-bottles\")" })
            }
        }

        Custom.WSTextButton {
            Layout.topMargin: 10
            Layout.leftMargin: leftMargin
            text: "Баночки от лекарств"
            onClicked: function() {
                view.push("../prepare_page/prepare_page.qml",
                          {"view": view,
                           "mapView": mapView,
                           "pageTitle": text,
                           "howPrepare": "Почистить-помыть, все такое.",
                           "jsScript": "updatePoints(\"jars-of-medicines\")" })
            }
        }

        Custom.WSTextButton {
            Layout.topMargin: 10
            Layout.leftMargin: leftMargin
            text: "Канистры"
            onClicked: function() {
                view.push("../prepare_page/prepare_page.qml",
                          {"view": view,
                           "mapView": mapView,
                           "pageTitle": text,
                           "howPrepare": "Я уже не знаю, что сюда написать.",
                           "jsScript": "updatePoints(\"сanisters\")" })
            }
        }

        Custom.WSTextButton {
            Layout.topMargin: 10
            Layout.leftMargin: leftMargin
            text: "Пакеты"
            onClicked: function() {
                view.push("../prepare_page/prepare_page.qml",
                          {"view": view,
                           "mapView": mapView,
                           "pageTitle": text,
                           "howPrepare": "Последнее описание, на которое меня хватило.",
                           "jsScript": "updatePoints(\"packages\")" })
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
            text: "Тубы от крема, пасты и т.д."
            font.pixelSize: 14
        }
    }
}
