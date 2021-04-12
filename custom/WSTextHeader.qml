import QtQuick 2.12
import QtQuick.Controls 2.5

Label {
    property string labelText: ""

    text: labelText
    font.pixelSize: 24
    font.bold: true
    font.underline: true
    color: "green"
}
