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

    title: "4 LDPE/ПВД"

    ColumnLayout {
        spacing: 0

        /*Image {
            Layout.leftMargin: leftMargin
            Layout.alignment: Qt.AlignHCenter
            Layout.topMargin: 10
            source: "../icons/plastic/4ldpe/page-icon.png"
        }*/

        Custom.WSTextHeader {
            Layout.topMargin: 10
            Layout.leftMargin: leftMargin
            labelText: "Принимается"
        }

        Custom.WSCategoryTextButton {
            Layout.topMargin: 20
            width: page.width
            header: "Твердый пластик"
            text: "<ul>
                   <li>Флаконы от бытовой химии</li>
                   <li>Канистры</li>
                   </ul>"
            onClicked: function() {
                view.push("../prepare_page/how_2_prep.qml",
                          {"view": view,
                           "mapView": mapView,
                           "pageTitle": header,
                           "mapPrepareText": "Опустошить, этикетку не снимать, кидать без пакетов.\nКрышки можно снять и сдать на переработку отдельно.",
                           "mapPrepareTextHeight": "80",
                           "ecoPrepareText": "Вымыть, высушить, крышки снять и сложить отдельно, этикетки оставить, сложить в отдельный пакет (за дополнительную плату можно весь пластик сдать в одном пакете).",
                           "ecoPrepareTextHeight": "100",
                           "placePrepareText": "Вымыть, высушить, крышки снять и сложить отдельно, сжать, этикетки оставить.",
                           "placePrepareTextHeight": "60",
                           "squirrelPrepareText": "Вымыть, высушить, крышки снять и сложить отдельно, сжать, этикетки оставить.",
                           "squirrelPrepareTextHeight": "80",
                           "jsScript": "updatePoints(\"hdpe_ldpe_pp_ps_fe-cans_alu-aluminum-cans\")" })
            }
        }

        Custom.WSCategoryTextButton {
            width: page.width
            header: "Мягкий пластик"
            text: "<ul>
                   <li>Упаковки от бытовой техники</li>
                   <li>Упаковки от предметов гигиены</li>
                   <li>Упаковки от туалетной бумаги</li>
                   <li>Пакеты молочных продуктов</li>
                   </ul>"
            onClicked: function() {
                view.push("../prepare_page/how_2_prep.qml",
                          {"view": view,
                           "mapView": mapView,
                           "pageTitle": header,
                           "ecoPrepareText": "Снять или вырезать бумажные наклейки, отмыть от грязи и жира, высушить. Сложить все пакеты в один (за дополнительную плату можно весь пластик сдать в одном пакете).",
                           "ecoPrepareTextHeight": "100",
                           "placePrepareText": "Снять или вырезать бумажные наклейки, отмыть от грязи и жира, высушить. Сложить все пакеты в один.",
                           "placePrepareTextHeight": "80",
                           "squirrelPrepareText": "Снять или вырезать бумажные наклейки, отмыть от грязи и жира, высушить. Сложить все пакеты в один.",
                           "squirrelPrepareTextHeight": "100",
                           "jsScript": "updatePoints(\"hdpe_ldpe_pp_ps_fe-cans_alu-aluminum-cans\")" })
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
                   <li>Отходы с маркировкой C/LDPE</li>
                   <li>Упаковки от влажных салфеток</li>
                   <li>Тубы от кремов, пасты и т.д.</li>
                   </ul>"
            font.pixelSize: 14
            wrapMode: Text.WordWrap
            Layout.preferredWidth: page.width - leftMargin
        }
    }
}
