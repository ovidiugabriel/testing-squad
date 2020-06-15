Documentation for AHK-just-me/Class_SQLiteDB sources v1.1

https://github.com/AHK-just-me/Class_SQLiteDB/blob/master/Sources_v1.1/Class_SQLiteDB.ahk

### Table

 Object returned from method `GetTable()`.

#### `GetRow(RowIndex, ByRef Row)  -> bool`

Get row for `RowIndex`.

On success `Row` contains a valid array.

`_CurrentRow` is set to `RowIndex`, so a subsequent call of `NextRow()` will return the  following row.

#### `Next(ByRef Row) -> bool`

Get next row depending on `_CurrentRow`.

On success `Row` contains a valid array.

EOF=-1 is returned for end of rows.

#### `Reset() -> void`

Reset `_CurrentRow` to zero.

---

### _RecordSet

Object returned from method `Query()`.

#### `Next(ByRef Row) -> bool | EOF`

Get next row of query result.

On success `Row` contains the row array.

On failure `ErrorMsg` / `ErrorCode` contains additional information.

EOF=-1 is returned for end of records.

Based on the following DLL calls: `sqlite3_step`, `sqlite3_data_count`, `sqlite3_column_type`, `sqlite3_column_blob`, `sqlite3_column_bytes`, `RtlMoveMemory`, `sqlite3_column_text`.

#### `Reset() -> bool`

Reset the result pointer.

On failure `ErrorMsg` / `ErrorCode` contains additional information.

After a call of this method you can access the query result via `Next()` again.

Based on `sqlite3_reset`.

#### `Free() -> bool`

Free query result.

On failure `ErrorMsg` / `ErrorCode` contains additional information.

After the call of this method further access on the query result is impossible.

Based on `sqlite3_finalize`.

---

### _Statement

Object returned from method `Prepare()`.

#### `Bind(Index, Type, Param3 := "", Param4 := 0, Param5 := 0) -> bool`

Bind values to SQL parameters.

On failure `ErrorMsg` / `ErrorCode` contains additional information.

Based on `sqlite3_bind_blob`, `sqlite3_bind_double`, `sqlite3_bind_int`, `sqlite3_bind_text`.

#### `Step() -> bool`

Evaluate the prepared statement.

On failure `ErrorMsg` / `ErrorCode` contains additional information.

You must call `ST.Reset()` before you can call `ST.Step()` again.

Based on `sqlite3_step`.

#### `Reset(ClearBindings := True)   -> bool`

Reset the prepared statement.

On failure,  `ErrorMsg` / `ErrorCode` contains additional information.

After a call of this method you can access the query result via `Next()` again.

Based on `sqlite3_reset`, `sqlite3_clear_bindings`.

#### `Free() -> bool`

Free the prepared statement object.

On failure `ErrorMsg` / `ErrorCode` contains additional information.

After the call of this method further access on the statement object is impossible.

Based on `sqlite3_finalize`.

---

####  `OpenDB(DBPath, Access := "W", Create := True) -> bool`

Open a database.

On failure `ErrorMsg` / `ErrorCode` contains additional information.

If `DBPath` is empty in write mode, a database called ":memory:" is created in memory and deleted on call of `CloseDB`.

Based on `sqlite3_open_v2`.

#### `CloseDB() -> bool`

Close database.

On failure `ErrorMsg` / `ErrorCode` contains additional information.

Based on `sqlite3_finalize` and `sqlite3_close`.

#### `AttachDB(DBPath, DBAlias) -> bool`

Add another database file to the current database connection.

http://www.sqlite.org/lang_attach.html

On failure, `ErrorMsg` / `ErrorCode` contain additional information.

#### `DetachDB(DBAlias) -> bool`

Detaches an additional database connection previously attached using `AttachDB()`.

http://www.sqlite.org/lang_detach.html

On failure,  `ErrorMsg` / `ErrorCode` contains additional information.

#### `Exec(string SQL[, callable Callback := ""]) -> bool`

Execute SQL statement.

Optional callback:

```
callback( SQLiteDBObject, int nColumns, 
    ptrToArrayOfPtrsToColsText,
    ptrToArrayOfPtrsToColsNames
)
```

On success, the number of changed rows is given in property `Changes`.

On failure, `ErrorMsg` / `ErrorCode` contain additional information.

Based on `sqlite3_exec` and `sqlite3_free`.

#### `GetTable(string SQL, ByRef _Table TB, MaxResult := 0) -> bool`

Get complete result for SELECT query.

`TB` = Variable to store the result object (instance of `_Table`).

On success, `TB` contains the result object.

On failure, `ErrorMsg` / `ErrorCode` contain additional information.

Based on `sqlite3_get_table`, `sqlite3_free`, `sqlite3_free_table`.

#### `Prepare(SQL, ByRef _Statement ST) -> bool`

Prepare database table for further actions.

`ST` = Variable to store the statement object (instance of `_Statement`)

On success, `ST` contains the statement object.

On failure, `ErrorMsg` / `ErrorCode` contain additional information.

 You have to pass one ? for each column you want to assign a value later.

Based on `sqlite3_prepare_v2`, `sqlite3_bind_parameter_count`.

#### `Query(SQL, ByRef _RecordSet RS) ->bool `

Get `_RecordSet` object for prepared SELECT query.

`RS` = Variable to store the result object (instance of `_RecordSet`)

On success, `RS` contains the result object.

On failure, `ErrorMsg` / `ErrorCode` contains additional information.

Based on `sqlite3_prepare_v2`, `sqlite3_column_count`, `sqlite3_column_name`, `sqlite3_step`, `sqlite3_reset`.

#### `CreateScalarFunc(string Name, int Args, ptr Func, Enc := 0x0801, ptr Param := 0) -> bool`

Creates a scalar application defined function.

www.sqlite.org/c3ref/create_function.html

On failure, `ErrorMsg` / `ErrorCode` contain additional information.

Based on `sqlite3_create_function`.

#### `LastInsertRowID(ByRef int RowID) -> bool`

Get the `ROWID` of the last inserted row.

On success, `RowID` contains the `ROWID`.

On failure, `ErrorMsg` / `ErrorCode` contain additional information

Based on `sqlite3_last_insert_rowid`.

#### `TotalChanges(ByRef int Rows) -> bool`

Get the number of changed rows since connecting to the database.

On success, `Rows` contains the number of rows.

On failure, `ErrorMsg` / `ErrorCode` contains additional information.

Based on `sqlite3_total_changes`.

#### ` SetTimeout(int TimeoutMs := 1000) -> bool`

Set the timeout to wait before SQLITE_BUSY or SQLITE_IOERR_BLOCKED is returned,  when a table is locked.

On failure, `ErrorMsg` / `ErrorCode` contains additional information.

Based on `sqlite3_busy_timeout`.

#### `EscapeStr(ByRef Str, Quote := True) -> bool`

Escapes special characters in a string to be used as field content.

On failure, `ErrorMsg` / `ErrorCode` contains additional information.

Based on `sqlite3_mprintf`.

#### `StoreBLOB(SQL, BlobArray) -> bool`

Use BLOBs as parameters of an INSERT/UPDATE/REPLACE statement.

On failure, `ErrorMsg` / `ErrorCode` contains additional information.

For each BLOB in the row you have to specify a `?` parameter within the statement. The
parameters are numbered automatically from left to right starting with 1. 

For each parameter you have to pass an object within `BlobArray` containing the address and the size of the BLOB.

Based on `sqlite3_prepare_v2` , `sqlite3_bind_blob`, `sqlite3_step`, `sqlite3_finalize`.

#### `SQLiteDB_RegExp(Context, ArgC, Values)`

Exemplary custom callback function regexp().

Calls `sqlite3_result_int()` passing 1 (True) for a match, otherwise pass 0 (False).

Based on `sqlite3_value_text`,  `sqlite3_result_int`.

