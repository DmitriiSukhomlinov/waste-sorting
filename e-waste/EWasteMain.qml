import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12

import "../custom" as Custom
import "../"

Page {
    id: page
    property StackView view

    property int leftMargin: 40

    height: view.height
    width: view.width

    title: "Техника"

    ColumnLayout {
        spacing: 0

        Custom.WSTextHeader {
            Layout.topMargin: 10
            Layout.leftMargin: leftMargin
            labelText: "Принимается"
        }

        Custom.WSCategoryTextButton {
            Layout.topMargin: 10
            width: page.width
            header: "Техника"
            text: "<ul>
                   <li>Компьютерная и бытовая техника</li>
                   <li>Любая с платами и/или проводами</li>
                   </ul>"
            onClicked: function() {
                view.push("../prepare_page/how_2_prep.qml",
                          {"view": view,
                           "pageTitle": header,
                           "ecoPrepareText": "Сложить отдельно.",
                           "ecoPrepareTextHeight": "70",
                           "placePrepareText": "Сложить отдельно.",
                           "placePrepareTextHeight": "70",
                           "squirrelPrepareText": "Сложить отдельно.",
                           "squirrelPrepareTextHeight": "70", })
            }
        }

        Custom.WSTextHeader {
            Layout.topMargin: 20
            Layout.leftMargin: leftMargin
            labelText: "Не принимается"
        }

        Custom.WSNoClickTextButton {
            Layout.leftMargin: leftMargin
            Layout.preferredWidth: page.width - leftMargin
            labelText: "<ul>
                       <li>Старые кинескопные мониторы и телевизоры</li>
                       <li>Картриджи от принтера</li>
                       <li>Пустые корпуса от техники</li>
                       </ul>"
        }
    }
}
