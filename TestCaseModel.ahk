
;; ------------------------------------------------------------------------------
;;
;;  Title:       TestCaseModel.ahk
;;  Purpose:     Model for testcases table
;;
;;  Created on:  24.07.2020 at 15:51:57
;;  Email:       ovidiugabriel {at} gmail {punct} com
;;  Copyright:   (C) 2020 SoftICE Development OU. All Rights Reserved.
;;
;; ------------------------------------------------------------------------------

#include db_functions.ahk

class TestCaseModel {
    Module          := 0
    Code            := ""
    Title           := ""
    Description     := ""
    Type            := 0
    Priority        := 0
    Estimate_Time   := 0
    Reference       := ""
    Precondition    := ""
    Tags            := ""
    Steps           := ""
    Expected_Result := ""
    Created_Date    := ""
    Updated_Date    := ""
    Created_by      := 1
    Updated_by      := 1

    ;;
    ;; Inserts testcase into database
    ;;
    insert(db) {
        FormatTime, TimeString
        this.Created_Date := TimeString
        this.Updated_Date := TimeString

        db_insert(db, "testcases", {Module: this.Module
                , Code:            this.Code
                , Title:           this.Title
                , Description:     this.Description
                , Type:            this.Type
                , Priority:        this.Priority
                , Estimate_Time:   this.Estimate_Time
                , Reference:       this.Reference
                , Precondition:    this.Precondition
                , Tags:            this.Tags
                , Steps:           this.Steps
                , Expected_Result: this.Expected_Result
                , Created_Date:    this.Created_Date
                , Updated_Date:    this.Updated_Date
                , Created_by:      this.Created_by
                , Updated_by:      this.Updated_by })
    }
}
