
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

;; Manual: docs/SQLite-AHK.md
#include Class_SQLiteDB.ahk
#include models/data.ahk
#include models/TestCaseModel.ahk
#include models/ModuleModel.ahk

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

onModuleSelected(module_id) {
    getModuleTestcases(module_id, recordSet)

    LV_Delete()
    while (recordSet.Next(row) > 0) {
        LV_Add("", row[1], row[2], row[3])
    }
    autoReizeColumns(3)
}

showSpecEditor() {
    Gui SpecEditor:Default
    #include forms/SpecEditor.ahk
}

openSpecsEditor(testCaseId) {
    showSpecEditor()

    ;; populate the list view of specs
    getTestcaseSpecs(testCaseId, recordSet)

    LV_Delete()
    while (recordSet.Next(row) > 0) {
        LV_Add("", row[1], row[2], row[3], row[4], row[5])
    }
    autoReizeColumns(5)
}

autoReizeColumns(nColumns) {
    loop, %nColumns% {
        LV_ModifyCol(A_Index, "AutoHdr")
    }
}

;; load the GUI

ModulesList := getModulesList()
Gui TestCases:Default
#include forms/TestCases.ahk

return

AddNew:
    ModulesList := getModulesList()
    Gui NewTestCase:Default
    #include forms/NewTestCase.ahk
    return

SelectModule:
    ;; 'Submit' is making the variables available
    Gui, Submit, nohide

    eModulesReverse := getModulesListReverse()
    debug("module selected: "  . ModuleChoice . " -> " . eModulesReverse[ModuleChoice])
    onModuleSelected(eModulesReverse[ModuleChoice])
    return

NewModule:
    Gui NewModule:Default
    #include forms/NewModule.ahk
    return

SaveNewModule:
    ;; 'Submit' is making the variables available
    Gui, Submit, nohide

    db_insert(db, "testcases_modules", {module_name: ModuleNameValue})

    GuiControl, NewTestCase:, ModuleChoice, % ModuleNameValue
    GuiControl, TestCases:, ModuleChoice, % ModuleNameValue

    Gui Destroy
    return

DeleteModule:
    eModulesReverse := getModulesListReverse()
    module := new ModuleModel(eModulesReverse[ModuleChoice])

    if (module.isEmpty(db)) {
        module.deleteIfEmpty(db)

        ModulesList := getModulesList()
        ; To replace (overwrite) the list, include a pipe as the first character
        GuiControl, TestCases:, ModuleChoice, |%ModulesList%
    } else {
        MsgBox , , Warning, This module cannot be deleted because it contains testcases
    }
    return

NewModuleGuiClose:
    Gui NewModule:Destroy
    return

NewTestCaseGuiClose:
    Gui NewTestCase:Destroy
    return

SpecEditorGuiClose:
    Gui SpecEditor:Destroy
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
    testCase.Estimate_Time   := EstimateValue
    testCase.Test_Data       := TestDataValue
    testCase.Reference       := ReferenceValue
    testCase.Precondition    := PreconditionValue
    testCase.Tags            := TagsValue
    testCase.Steps           := StepsValue
    testCase.Expected_Result := ExpectedValue

    testCase.insert(db)
    Gui NewTestCase:Destroy
    return

EditSpecs:
    If !(SelectedRow := LV_GetNext()) {
       MsgBox, 0, Important, Select a testcase first!
       Return
    }
    LV_GetText(RowText, SelectedRow)
    testCaseId := Floor(RowText)
    openSpecsEditor(testCaseId)

    return

GuiClose:
    db.CloseDB()
    ExitApp

