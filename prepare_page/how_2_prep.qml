import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12

import "../custom" as Custom
import "../"

Page {
    property StackView view
    property Map mapView

    property int leftMargin: 40
    property string pageTitle: ""
    property string howPrepare: ""
    property string jsScript: ""

    property alias prepareText: prepare.text
    property int prepareTextHeight: 0
    property alias ecoPrepareText: ecoPrepare.text
    property int ecoPrepareTextHeight: 0
    property alias placePrepareText: placePrepare.text
    property int placePrepareTextHeight: 0
    property alias squirrelPrepareText: squirrelPrepare.text
    property int squirrelPrepareTextHeight: 0

    height: view.height
    width: view.width

    title: pageTitle


    ColumnLayout {
        width: parent.width

        Custom.WSTextHeader {
            Layout.topMargin: 30
            Layout.leftMargin: leftMargin
            labelText: "Как сдать?"
        }

        Custom.WSTextButton {
            Layout.topMargin: 10
            Layout.leftMargin: leftMargin
            header: "Найти контейнер"
            text: "Вторсырье лучше отнести в ближайший подходящий контейнер. Это снизит нагрузку на волонтеров организаций."
            onClicked: function() {
                view.push(mapView)
                mapView.web.runJavaScript(jsScript)
            }
        }

        Custom.WSPrepareAndDescription {
            id: prepare
            Layout.topMargin: 10
            Layout.leftMargin: leftMargin
            Layout.preferredHeight: prepareTextHeight
        }

        ToolSeparator {
            orientation: Qt.Horizontal
            Layout.preferredWidth: view.width
        }

        Custom.WSTextButton {
            Layout.topMargin: 10
            Layout.leftMargin: leftMargin
            header: "Заказать экотакси"
            text: "Вторсырье могут забрать у вашего дома в один из дней выезда, устанавливаемых организвацией. Стоимость услуги зависит от региона. Узнать стоимость и оставить заявку можно в группе организации.."
            onClicked: function() {
                //TODO
            }
        }

        Custom.WSPrepareAndDescription {
            id: ecoPrepare
            Layout.topMargin: 10
            Layout.leftMargin: leftMargin
            Layout.preferredHeight: ecoPrepareTextHeight
        }

        ToolSeparator {
            orientation: Qt.Horizontal
            Layout.preferredWidth: view.width
        }

        Custom.WSTextButton {
            Layout.topMargin: 10
            Layout.leftMargin: leftMargin
            header: "Отнести в пункт приема"
            text: "Экоцентр ProZero (Восход 1)\n График работы: сб, вс с 12:00 до 20:00"
            onClicked: function() {
                //TODO
            }
        }

        Custom.WSPrepareAndDescription {
            id: placePrepare
            Layout.topMargin: 10
            Layout.leftMargin: leftMargin
            Layout.preferredHeight: placePrepareTextHeight
        }


        ToolSeparator {
            orientation: Qt.Horizontal
            Layout.preferredWidth: view.width
        }

        Custom.WSTextButton {
            Layout.topMargin: 10
            Layout.leftMargin: leftMargin
            header: "Сдать на акции \"Зеленая белка\""
            text: "Предварительно разобранное вторсырье можно сдать на одной из точек сбора в день проведения акции. Расписание и расположение точек указано в группе акции."
            onClicked: function() {
                //TODO
            }
        }

        Custom.WSPrepareAndDescription {
            id: squirrelPrepare
            Layout.topMargin: 10
            Layout.leftMargin: leftMargin
            Layout.preferredHeight: squirrelPrepareTextHeight
        }
    }

}
