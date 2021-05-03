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

    title: "40 FE/Жесть"

    ColumnLayout {
        spacing: 0

        Custom.WSTextHeader {
            Layout.topMargin: 10
            Layout.leftMargin: leftMargin
            labelText: "Принимается"
        }

        Custom.WSCategoryTextButton{
            Layout.topMargin: 20
            width: page.width
            header: "Железные предметы"
            text: "<ul>
                   <li>Консервные банки</li>
                   <li>Крышки от стеклянных банок</li>
                   <li>Баллоны под давлением</li>
                   <li>Металлолом</li>
                   </ul>"
            onClicked: function() {
                view.push("../prepare_page/how_2_prep.qml",
                          {"view": view,
                           "mapView": mapView,
                           "pageTitle": header,
                           "mapPrepareText": "Опустошить, сжать, кидать без пакетов. Предметы мельче консервной банки сдавать другим способом.",
                           "mapPrepareTextHeight": "100",
                           "ecoPrepareText": "Опустошить, сложить в отдельный пакет.",
                           "ecoPrepareTextHeight": "50",
                           "placePrepareText": "Вымыть, высушить, сжать или компактно сложить.",
                           "placePrepareTextHeight": "50",
                           "squirrelPrepareText": "Вымыть, высушить, сжать или компактно сложить.",
                           "squirrelPrepareTextHeight": "70",
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
                   <li>Посуда для готовки с покрытием<br>(антипригарное и др.)</li>
                   <li>Предметы из комбинированного<br>материала (металл + дерево и др.)</li>
                   <li>Стаканчики</li>
                   <li>Мягкие упаковки</li>
                   <li>Другое</li>
                   </ul>"
            font.pixelSize: 14
        }
    }
}
