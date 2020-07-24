
;; ------------------------------------------------------------------------------
;;
;;  Title:       db_functions.ahk
;;  Purpose:     Generic Database functions library
;;
;;  Created on:  24.07.2020 at 15:49:38
;;  Email:       ovidiugabriel {at} gmail {punct} com
;;  Copyright:   (C) 2020 SoftICE Development OU. All Rights Reserved.
;;
;; ------------------------------------------------------------------------------

;;
;; @param mixed var
;; @return string "Int" | "Double" | "Text"
;;
getBindType(var) {
    ; AHK native type detection does not work correctly
    if (RegExMatch(var, "^[0-9\.]+$")) {
        if (Floor(var) == var) {
            return "Int"
        }
        return "Double"
    }
    return "Text"
}

;;
;; @param SQLiteDB db
;; @param string table
;; @param object row
;; @return bool
;;
db_insert(db, table, row) {
    query := "INSERT INTO " . table . "("

    values := ""

    i := 1
    for key in row {
        query .= key
        values .= "?"

        if (i < row.Count()) {
            query .= ", "
            values .= ", "
        }
        i := i + 1
    }

    query .= ") VALUES ("
    query .= values
    query .= ")"

    debug(query)

    res := db.Prepare(query, stmt)
    if (res) {
        i := 1
        for _, value in row {
            stmt.Bind(i, getBindType(value), value)
            i := i + 1
        }

        res := stmt.Step()
        debug("res=" . res)

        return true
    } else {
        debug("prepare failed " . db.ErrorMsg)
    }
    return false
}
