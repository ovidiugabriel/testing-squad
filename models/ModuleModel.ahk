
;; ------------------------------------------------------------------------------
;;
;;  Title:       ModuleModel.ahk
;;  Purpose:     Model for testcases_modules table
;;
;;  Created on:  07.08.2020 at 22:03:10
;;  Email:       ovidiugabriel {at} gmail {punct} com
;;  Copyright:   (C) 2020 SoftICE Development OU. All Rights Reserved.
;;
;; ------------------------------------------------------------------------------

class ModuleModel {
    module_id := 0

    __New(module_id) {
        this.module_id := module_id
    }

    deleteIfEmpty(db) {
        sql := Format(" DELETE FROM testcases_modules WHERE module_id = {1:d} ", this.module_id)
        sql .= " AND module_id NOT IN (SELECT Module FROM testcases GROUP BY Module) "

        db.Exec(sql)
    }
}
