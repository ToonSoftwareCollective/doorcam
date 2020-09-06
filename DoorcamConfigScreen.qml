import QtQuick 2.1
import qb.components 1.0

Screen {
	id: doorcamConfigScreen
	screenTitle: "Doorcam app Setup"

	onShown: {
		doorcamImageURL1.inputText = app.doorcamImageURL1;
		domoticzURL1.inputText = app.domoticzURL1;
		domoticzIDX.inputText= app.domoticzIDX;
		domoticzVAR.inputText= app.domoticzVAR;
		enableForceModeToggle.isSwitchedOn = app.enableForceMode;
		addCustomTopRightButton("Save");
	}

	onCustomButtonClicked: {
		app.saveSettings();
		hide();
	}


	function savedoorcamImageURL1(text) {
		if (text) {
			app.doorcamImageURL1 = text;
		}
	}

	function savedomoticzURL1(text) {
		if (text) {
			app.domoticzURL1 = text;
		}
	}

	function savedomoticzIDX(text) {
		if (text) {
			app.domoticzIDX = text;
		}
	}

	function savedomoticzVAR(text) {
		if (text) {
			app.domoticzVAR = text;
		}
	}

	Text {
		id: myLabel
		text: "Example of valid URL: http://192.168.10.8/live/1/jpeg.jpg :"
		font.pixelSize:  isNxt ? 20 : 16
		font.family: qfont.regular.name
		anchors {
			left: parent.left
			top: parent.top
			leftMargin: 20
			topMargin: 20
		}
	}

	EditTextLabel4421 {
		id: doorcamImageURL1
		width: parent.width - 40
		height: 35
		leftTextAvailableWidth: 300
		leftText: "URL doorcam image"

		anchors {
			left: parent.left
			top: myLabel.bottom
			leftMargin: 20
			topMargin: 10
		}

		onClicked: {
			qkeyboard.open("URL", doorcamImageURL1.inputText, savedoorcamImageURL1)
		}
	}


	Text {
		id: myLabel2
		text: "Example of valid URL: http://192.168.10.185:8080 :"
		font.pixelSize:  isNxt ? 20 : 16
		font.family: qfont.regular.name
		anchors {
			left: parent.left
			top: doorcamImageURL1.bottom
			leftMargin: 20
			topMargin: 20
		}
	}


	EditTextLabel4421 {
		id: domoticzURL1
		width: parent.width - 40
		height: 35
		leftTextAvailableWidth: 300
		leftText: "URL to Domoticz"

		anchors {
			left: parent.left
			top: myLabel2.bottom
			leftMargin: 20
			topMargin: 10
		}

		onClicked: {
			qkeyboard.open("URL", domoticzURL1.inputText, savedomoticzURL1)
		}
	}

	Text {
		id: myLabel3
		text: "IDX of the doorbell variable in Domoticz created by script. Example : 27"
		font.pixelSize:  isNxt ? 20 : 16
		font.family: qfont.regular.name
		anchors {
			left: parent.left
			top: domoticzURL1.bottom
			leftMargin: 20
			topMargin: 20
		}
	}

	EditTextLabel4421 {
		id: domoticzIDX
		width: parent.width - 40
		height: 35
		leftTextAvailableWidth: 300
		leftText: "IDX of trigger parameter"
		anchors {
			left: parent.left
			top: myLabel3.bottom
			leftMargin: 20
			topMargin: 10
		}

		onClicked: {
			qkeyboard.open("IDX", domoticzIDX.inputText, savedomoticzIDX)
		}
	}

	Text {
		id: myLabel4
		text: "Name of Domoticz variable. Example of valid name:  ShowDoorCamToon "
		font.pixelSize:  isNxt ? 20 : 16
		font.family: qfont.regular.name
		anchors {
			left: parent.left
			top: domoticzIDX.bottom
			leftMargin: 20
			topMargin: 20
		}
	}

	EditTextLabel4421 {
		id: domoticzVAR
		width: parent.width - 40
		height: 35
		leftTextAvailableWidth: 300
		leftText: "Name of trigger parameter"
		anchors {
			left: parent.left
			top: myLabel4.bottom
			leftMargin: 20
			topMargin: 10
		}

		onClicked: {
			qkeyboard.open("Var", domoticzVAR.inputText, savedomoticzVAR)
		}
	}

	Text {
		id: forceMode
		width:  160
		text: "force 16:9"
		font.pixelSize:  isNxt ? 20 : 16
		font.family: qfont.regular.name

		anchors {
			left: parent.left
			top: domoticzVAR.bottom
			leftMargin: 20
			topMargin: 10
		}
	}

	OnOffToggle {
		id: enableForceModeToggle
		height:  30
		anchors.left: forceMode.right
		anchors.leftMargin: isNxt ? 65 : 30
		anchors.top: forceMode.top
		leftIsSwitchedOn: false
		onSelectedChangedByUser: {
			if (isSwitchedOn) {
				app.enableForceMode = true;
			} else {
				app.enableForceMode = false;
			}
		}
	}

}
