
;; ------------------------------------------------------------------------------
;;
;;  Title:       main.ahk
;;  Purpose:     Main code for testing-squad project
;;
;;  Created on:  24.07.2020 at 15:56:53
;;  Email:       ovidiugabriel {at} gmail {punct} com
;;  Copyright:   (C) 2020 SoftICE Development OU. All Rights Reserved.
;;
;; ------------------------------------------------------------------------------

;; Manual: https://github.com/ovidiugabriel/testing-squad/blob/master/docs/SQLite-AHK.md
#include Class_SQLiteDB.ahk
#include TestCaseModel.ahk

debug(string) {
    OutputDebug, %string%
}

;; Load database configuration parameters
#include config.ahk

db := new SQLiteDB()

if (db.OpenDB(db_path, "W", false)) {
    debug("OpenDB success")
} else {
    debug("Failed to open database " . db.ErrorMsg)
}

;; load the GUI
#include forms/NewTestCase.ahk

SaveTestCase:
    ;; 'Submit' is making the variables available
    Gui, Submit, nohide

    eTestTypeReverse := {"Acceptance": 1
        , "Accessibility":  2
        , "Automation":     3
        , "Compatibility":  4
        , "Functional":     5
        , "Other":          6
        , "Performance":    7
        , "Regression":     8
        , "Smoke & Sanity": 9
        , "Usability":      10}

    ePriorityReverse := {"Critical": 1
        , "High":   2
        , "Medium": 3
        , "Low":    4}

    testCase := new TestCaseModel()

    testCase.Module          := 1
    testCase.Code            := TestCaseCodeValue
    testCase.Title           := TestCaseTitleValue
    testCase.Description     := DescriptionValue
    testCase.Type            := eTestTypeReverse[TestTypeChoice]
    testCase.Priority        := ePriorityReverse[PriorityChoice]
    testCase.Estimate_Time   := Estimatevalue
    testCase.Precondition    := PreconditionValue
    testCase.Steps           := StepsValue
    testCase.Expected_Result := ExpectedValue

    testCase.insert(db)

    return

GuiClose:
    db.CloseDB()
    ExitApp

