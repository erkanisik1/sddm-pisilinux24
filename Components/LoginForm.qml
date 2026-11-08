// Config created by Keyitdev https://github.com/Keyitdev/sddm-astronaut-theme
// Copyright (C) 2022-2025 Keyitdev
// Based on https://github.com/MarianArlt/sddm-sugar-dark
// Distributed under the GPLv3+ License https://www.gnu.org/licenses/gpl-3.0.html

import QtQuick 2.15
import SddmComponents 2.0 as SDDM

Item {
    id: formContainer
    SDDM.TextConstants { id: textConstants }

    property alias inputField: input

    // Dikey boşlukların tamamı ekran yüksekliğine oranlı hesaplanır.
    // Böylece düzen her çözünürlükte aynı kalır ve elemanlar üst üste binmez.
    readonly property real unit: root.height / 100

    // Sanal klavye acilirken odagi bir metin alanina geri verir.
    // Aksi halde tus vuruslari hicbir yere iletilmez.
    function focusKeyboardInput() {
        input.focusKeyboardTarget()
    }

    Clock {
        id: clock

        width: parent.width
        anchors.top: parent.top
        anchors.topMargin: formContainer.unit * 4
        anchors.horizontalCenter: parent.horizontalCenter
    }

    // Kullanıcı adı, şifre, oturum seçici ve giriş butonu tek bir blok
    // halinde dikeyde ortalanır. Sabit yükseklik verilmediği için
    // çözünürlük değişince taşma olmaz.
    Input {
        id: input

        width: parent.width
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: formContainer.unit * 3
    }

    // Sanal klavye butonu, sistem butonlarının hemen üzerinde ve
    // onlarla aynı sol hizada kalır.
    VirtualKeyboardButton {
        id: virtualKeyboardButton

        height: root.font.pointSize * 2.2
        anchors.left: parent.left
        anchors.leftMargin: formContainer.unit
        anchors.bottom: systemButtons.top
        anchors.bottomMargin: formContainer.unit * 1.5
    }

    // Shutdown / Reboot / Suspend / Hibernate formun sol alt köşesine
    // (FormPosition "left" iken ekranın sol altına) sabitlenir.
    SystemButtons {
        id: systemButtons

        width: parent.width
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        anchors.bottomMargin: formContainer.unit * 2
        anchors.leftMargin: formContainer.unit

        exposedSession: input.exposeSession
    }
}
