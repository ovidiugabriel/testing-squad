
;; ------------------------------------------------------------------------------
;;
;;  Title:       data.ahk
;;  Purpose:     Database related functions
;;
;;  Created on:  22.12.2020 at 20:00:52
;;  Email:       ovidiugabriel {at} gmail {punct} com
;;  Copyright:   (C) 2020 SoftICE Development OU. All Rights Reserved.
;;
;; ------------------------------------------------------------------------------

getAllModules(ByRef recordSet) {
    global db
    db.Query("SELECT module_id, module_name FROM testcases_modules", recordSet)
}

getModuleTestcases(module_id, ByRef recordSet) {
    global db
    sql := Format("SELECT Test_Case_ID, Code, Title FROM testcases WHERE Module = '{1:d}'", module_id)
    debug(sql)
    db.Query(sql, recordSet)
}

getTestcaseSpecs(testCaseId, ByRef recordSet) {
    global db
    sql := Format("SELECT spec_id, selector, action, params, should FROM testcase_specs WHERE testcase_id = '{1:d}'", testCaseId)
    debug(sql)
    db.Query(sql, recordSet)
}
