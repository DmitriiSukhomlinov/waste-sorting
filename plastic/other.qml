import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12

import "../custom" as Custom
import "../"

Page {
    id: page
    property StackView view
    property Map mapView

    property int leftMargin: 40

    height: view.height
    width: view.width

    title: "Пластик: без маркировки"

    ColumnLayout {
        spacing: 0

        Custom.WSTextHeader {
            Layout.topMargin: 10
            Layout.leftMargin: leftMargin
            labelText: "Принимается"
        }

        Custom.WSCategoryTextButton {
            Layout.topMargin: 20
            width: page.width
            header: "Крышки"
            text: "<ul>
                   <li>Пластиковые крышки, ручки, горлышки</li>
                   <li>Крышки от бутылей на кулер</li>
                   <li>Мерные ложечки от детских каш</li>
                   <li>Пластиковые пробки от шампанского</li>
                   <li>Жёлтые вкладыши от киндер-сюрпризов</li>
                   </ul>"
            onClicked: function() {
                view.push("../prepare_page/how_2_prep.qml",
                          {"view": view,
                           "mapView": mapView,
                           "pageTitle": header,
                           "raccoonPrepareText": "Вымыть от жира и грязи, убрать бумажные наклейки, снять металлические части.\nС крышек от кулера снять наклейку и вкладыш, сложить отдельно.\nОтдельно сложить горлышки от тетрапаков (со следами клея).\nСортировать крышки по цветам не нужно.",
                           "raccoonPrepareTextHeight": "130" })
            }
        }

        Custom.WSCategoryTextButton {
            width: page.width
            header: "Пластиковые пакеты"
            text: "<ul>
                   <li>2 HDPE мягкий (пакеты от лаваша)</li>
                   <li>4 LDPE мягкий (пакеты от молока, средств гигиены, туалетной бумаги)</li>
                   <li>Стандартные пакеты-маечки</li>
                   </ul>"
            onClicked: function() {
                view.push("../prepare_page/how_2_prep.qml",
                          {"view": view,
                           "mapView": mapView,
                           "pageTitle": header,
                           "ecoPrepareText": "Вымыть, высушить, снять или срезать бумажные наклейки. Сложить в один из пакетов.",
                           "ecoPrepareTextHeight": "80",
                           "placePrepareText": "Вымыть, высушить, снять или срезать бумажные наклейки. Сложить в один из пакетов.",
                           "placePrepareTextHeight": "80",
                           "squirrelPrepareText": "Вымыть, высушить, снять или срезать бумажные наклейки. Сложить в один из пакетов. Отдельно сложить пакеты с припаянными и прорубленными ручками.",
                           "squirrelPrepareTextHeight": "120" })
            }
        }

        Custom.WSTextHeader {
            Layout.topMargin: 20
            Layout.leftMargin: leftMargin
            labelText: "Не принимается"
        }

        Label {
            Layout.leftMargin: leftMargin
            text: "<ul>
                   <li>Крышки от кофейных стаканов</li>
                   <li>Крышки от губной помады</li>
                   <li>Крышки с металлическими элементами</li>
                   <li>Биоразлагаемые пакеты</li>
                   <li>Пакеты от одежды</li>
                   <li>Мягкая упаковка без маркировки</li>
                   </ul>"
            font.pixelSize: 14
        }
    }
}
