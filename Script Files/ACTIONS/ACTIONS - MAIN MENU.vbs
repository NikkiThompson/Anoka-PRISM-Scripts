'GATHERING STATS----------------------------------------------------------------------------------------------------
name_of_script = "ACTIONS - Main menu.vbs"
start_time = timer

'LOADING ROUTINE FUNCTIONS FROM GITHUB REPOSITORY---------------------------------------------------------------------------
url = "https://raw.githubusercontent.com/Anoka-Script-Team/Anoka-PRISM-Scripts/master/Shared%20Functions%20Library/PRISM%20Functions%20Library.vbs"
SET req = CreateObject("Msxml2.XMLHttp.6.0")				'Creates an object to get a URL
req.open "GET", url, FALSE									'Attempts to open the URL
req.send													'Sends request
IF req.Status = 200 THEN									'200 means great success
	Set fso = CreateObject("Scripting.FileSystemObject")	'Creates an FSO
	Execute req.responseText								'Executes the script code
ELSE														'Error message, tells user to try to reach github.com, otherwise instructs to contact Veronica with details (and stops script).
	MsgBox 	"Something has gone wrong. The code stored on GitHub was not able to be reached." & vbCr &_ 
			vbCr & _
			"Before contacting Veronica Cary, please check to make sure you can load the main page at www.GitHub.com." & vbCr &_
			vbCr & _
			"If you can reach GitHub.com, but this script still does not work, ask an alpha user to contact Veronica Cary and provide the following information:" & vbCr &_
			vbTab & "- The name of the script you are running." & vbCr &_
			vbTab & "- Whether or not the script is ""erroring out"" for any other users." & vbCr &_
			vbTab & "- The name and email for an employee from your IT department," & vbCr & _
			vbTab & vbTab & "responsible for network issues." & vbCr &_
			vbTab & "- The URL indicated below (a screenshot should suffice)." & vbCr &_
			vbCr & _
			"Veronica will work with your IT department to try and solve this issue, if needed." & vbCr &_ 
			vbCr &_
			"URL: " & url
			StopScript
END IF

'DIALOGS---------------------------------------------------------------------------
BeginDialog ACTIONS_main_menu_dialog, 0, 0, 306, 65, "ACTIONS main menu dialog"
  ButtonGroup ButtonPressed
    CancelButton 250, 45, 50, 15
    PushButton 5, 5, 30, 10, "Intake", ACTIONS_intake_button
    PushButton 5, 30, 60, 10, "PALC calculator", ACTIONS_PALC_calculator_button
  Text 40, 5, 260, 15, "-- Creates various documents related to Child Support intake, as well as DORD documents, and enters a note on CAAD."
  Text 70, 30, 230, 10, "-- Calculates voluntary and involuntary amounts from the PALC screen."
EndDialog

'THE SCRIPT-----------------------------------------------------------------------------------------------

'Shows the dialog
Dialog ACTIONS_main_menu_dialog
If buttonpressed = cancel then stopscript
IF ButtonPressed = ACTIONS_intake_button then call run_from_GitHub(script_repository & "ACTIONS/ACTIONS - INTAKE.vbs")
IF ButtonPressed = ACTIONS_PALC_calculator_button then call run_from_GitHub(script_repository & "ACTIONS/ACTIONS - PALC CALCULATOR.vbs")

