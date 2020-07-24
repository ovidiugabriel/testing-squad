
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

#SingleInstance force

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

getAllModules(ByRef recordSet) {
    global db
    db.Query("SELECT module_id, module_name FROM testcases_modules", recordSet)
}

getModulesList() {
    getAllModules(recordSet)
    ModulesList := ""
    while (recordSet.Next(row) > 0) {
        ModulesList .= row[2] . "|"
    }
    return ModulesList
}

getModulesListReverse() {
    getAllModules(recordSet)
    object := {}
    while (recordSet.Next(row) > 0) {
        ObjRawSet(object, row[2], row[1])
    }
    return object
}

;; load the GUI
ModulesList := getModulesList()
Gui NewTestCase:Default
#include forms/NewTestCase.ahk

NewModule:
    Gui NewModule:Default
    #include forms/NewModule.ahk
    return

SaveNewModule:
    ;; 'Submit' is making the variables available
    Gui, Submit, nohide

    db_insert(db, "testcases_modules", {module_name: ModuleNameValue})

    GuiControl, NewTestCase:, ModuleChoice, %ModuleNameValue%

    Gui Destroy
    return

NewModuleGuiClose:
    Gui NewModule:Destroy
    return

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

    eModulesReverse := getModulesListReverse()

    testCase := new TestCaseModel()

    testCase.Module          := eModulesReverse[ModuleChoice]
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

