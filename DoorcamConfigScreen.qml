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
		domhaToggle.isSwitchedOn = app.domMode;

		haURL1.inputText = app.haURL1;
		haEntity_id.inputText= app.haEntity_id;
		haToken.inputText= app.haToken;

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

	function savehaURL1(text) {
		if (text) {
			app.haURL1 = text;
		}
	}

	function savehaEntity_id(text) {
		if (text) {
			app.haEntity_id = text;
		}
	}

	function savehaToken(text) {
		if (text) {
			app.haToken = text;
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
			topMargin: 15
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
			topMargin: isNxt ? 10 : 8
		}

		onClicked: {
			qkeyboard.open("URL", doorcamImageURL1.inputText, savedoorcamImageURL1)
		}
	}


	Text {
		id: domhaMode
		width:  160
		text: "HA - Domoticz"
		font.pixelSize:  isNxt ? 20 : 16
		font.family: qfont.regular.name

		anchors {
			left: parent.left
			top: doorcamImageURL1.bottom
			leftMargin: 20
			topMargin: 15
		}
	}

	OnOffToggle {
		id: domhaToggle
		height:  30
		anchors.left: forceMode.right
		anchors.leftMargin: isNxt ? 65 : 30
		anchors.top: domhaMode.top
		leftIsSwitchedOn: false
		onSelectedChangedByUser: {
			if (isSwitchedOn) {
				app.domMode = true;
			} else {
				app.domMode = false;
			}
		}
	}


	Text {
		id: myLabel2
		text: "Example of valid URL: http://192.168.10.185:8080 :"
		font.pixelSize:  isNxt ? 20 : 16
		font.family: qfont.regular.name
		anchors {
			left: parent.left
			top: domhaToggle.bottom
			leftMargin: 20
			topMargin: isNxt ? 20 : 15
		}
		visible: app.domMode
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
			topMargin: isNxt ? 10 : 8
		}

		onClicked: {
			qkeyboard.open("URL", domoticzURL1.inputText, savedomoticzURL1)
		}
		visible: app.domMode
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
			topMargin: isNxt ? 20 : 15
		}
		visible: app.domMode
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
			topMargin: isNxt ? 10 : 8
		}

		onClicked: {
			qkeyboard.open("IDX", domoticzIDX.inputText, savedomoticzIDX)
		}
		visible: app.domMode
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
			topMargin: isNxt ? 20 : 15
		}
		visible: app.domMode
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
			topMargin: isNxt ? 10 : 8
		}

		onClicked: {
			qkeyboard.open("Var", domoticzVAR.inputText, savedomoticzVAR)
		}
		visible: app.domMode
	}

	Text {
		id: myLabel5
		text: "Example of valid URL: http://192.168.10.185:8123 :"
		font.pixelSize:  isNxt ? 20 : 16
		font.family: qfont.regular.name
		anchors {
			left: parent.left
			top: domhaToggle.bottom
			leftMargin: 20
			topMargin: isNxt ? 20 : 15
		}
		visible: !app.domMode
	}


	EditTextLabel4421 {
		id: haURL1
		width: parent.width - 40
		height: 35
		leftTextAvailableWidth: 100
		leftText: "HA URL"
		anchors {
			left: parent.left
			top: myLabel5.bottom
			leftMargin: 20
			topMargin: isNxt ? 10 : 8
		}
		onClicked: {
			qkeyboard.open("URL", haURL1.inputText, savehaURL1)
		}
		visible: !app.domMode
	}

	Text {
		id: myLabel6
		text: "Helper Entity_id in Home Assistant. Example : input_number.showdoorcamtoon :"
		font.pixelSize:  isNxt ? 20 : 16
		font.family: qfont.regular.name
		anchors {
			left: parent.left
			top: haURL1.bottom
			leftMargin: 20
			topMargin: isNxt ? 20 : 15
		}
		visible: !app.domMode
	}

	EditTextLabel4421 {
		id: haEntity_id
		width: parent.width - 40
		height: 35
		leftTextAvailableWidth: 100
		leftText: "Entity_id"
		anchors {
			left: parent.left
			top: myLabel6.bottom
			leftMargin: 20
			topMargin: isNxt ? 10 : 8
		}

		onClicked: {
			qkeyboard.open("Entity_id", haEntity_id.inputText, savehaEntity_id)
		}
		visible: !app.domMode
	}

	Text {
		id: myLabel7
		text: "Home Assistant long-lived access token :"
		font.pixelSize:  isNxt ? 20 : 16
		font.family: qfont.regular.name
		anchors {
			left: parent.left
			top: haEntity_id.bottom
			leftMargin: 20
			topMargin: isNxt ? 20 : 15
		}
		visible: !app.domMode
	}

	EditTextLabel4421 {
		id: haToken
		width: parent.width - 40
		height: 35
		leftTextAvailableWidth: 100
		leftText: "Token"
		anchors {
			left: parent.left
			top: myLabel7.bottom
			leftMargin: 20
			topMargin: isNxt ? 10 : 8
		}

		onClicked: {
			qkeyboard.open("Token", haToken.inputText, savehaToken)
		}
		visible: !app.domMode
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
			topMargin: isNxt ? 10 : 8
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
