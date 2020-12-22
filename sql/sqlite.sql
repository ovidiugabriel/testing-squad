CREATE TABLE tescases_suites (
    testcase_id  INTEGER REFERENCES testcases (Test_Case_ID),
    testsuite_id INTEGER REFERENCES tescases_suites (testcase_id)
);

CREATE TABLE testcase_priority_enum (
    priority_id   INTEGER       PRIMARY KEY,
    priority_name VARCHAR (255)
);

CREATE TABLE testcase_suite_enum (
    suite_id   INTEGER       PRIMARY KEY,
    suite_name VARCHAR (255)
);

CREATE TABLE testcase_type_enum (
    type_id   INTEGER       PRIMARY KEY,
    type_name VARCHAR (255)
);

CREATE TABLE testcases (
    Test_Case_ID      INTEGER       PRIMARY KEY,
    Module            INTEGER       REFERENCES testcases_modules (module_id)
                                    NOT NULL,
    Code              VARCHAR (255),
    Title             VARCHAR (255),
    Description       VARCHAR (255),
    Type              INTEGER       REFERENCES testcase_type_enum (type_id)
                                    NOT NULL,
    Test_Data         TEXT,
    Priority          INTEGER       REFERENCES testcase_priority_enum (priority_id)
                                    DEFAULT (3)
                                    NOT NULL,
    Estimate_Time     VARCHAR (255),
    Reference         VARCHAR (255),
    Link_Requirements VARCHAR (255),
    Precondition      TEXT,
    Mode_Auto         BOOLEAN       DEFAULT (0)
                                    NOT NULL,
    Tags              VARCHAR (255),
    Steps             TEXT,
    Expected_Result   TEXT,
    Created_Date      DATETIME,
    Updated_Date      DATETIME,
    Created_by        INTEGER       REFERENCES testcases_users (user_id)
                                    NOT NULL,
    Updated_by        INTEGER       REFERENCES testcases_users (user_id)
                                    NOT NULL
);

CREATE TABLE testcases_modules (
    module_id   INTEGER       PRIMARY KEY,
    module_name VARCHAR (255)
);

CREATE TABLE testcases_users (
    user_id   INTEGER       PRIMARY KEY,
    user_name VARCHAR (255)
);

CREATE TABLE testcase_specs (
    spec_id     INTEGER       PRIMARY KEY AUTOINCREMENT,
    testcase_id INTEGER       REFERENCES testcases (Test_Case_ID),
    stepno      INTEGER,
    selector    VARCHAR (255),
    [action]    VARCHAR (255),
    params      VARCHAR (255),
    should      VARCHAR (255)
);
