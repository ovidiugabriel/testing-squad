Gui, Add, Text, x12 y9 w100 h20 , Module
Gui, Add, DropDownList, x112 y9 w130 vModuleChoice, %ModulesList%
Gui, Add, Button, x252 y9 w100 h20 gNewModule, New Module
Gui, Add, Text, x12 y39 w100 h20 , Test Case Code
Gui, Add, Edit, x112 y39 w130 h20 vTestCaseCodeValue,
Gui, Add, Text, x12 y69 w100 h20 , Test Case Title
Gui, Add, Edit, x12 y89 w340 h20 vTestCaseTitleValue,
Gui, Add, Text, x12 y119 w340 h20 , Description
Gui, Add, Edit, x12 y139 w340 h100 vDescriptionValue,
Gui, Add, Text, x12 y249 w100 h20 , Test Type
Gui, Add, DropDownList, x112 y249 w130 vTestTypeChoice, |Acceptance|Accessibility|Automation|Compatibility|Functional|Other|Performance|Regression|Smoke & Sanity|Usability
Gui, Add, Text, x12 y279 w100 h20 , Priority
Gui, Add, DropDownList, x112 y279 w130 vPriorityChoice, |Critical|High|Medium|Low
Gui, Add, Text, x12 y309 w90 h20 , Estimate
Gui, Add, Edit, x112 y309 w130 h20 vEstimateValue,
Gui, Add, Text, x12 y339 w90 h20 , Test Data
Gui, Add, Edit, x12 y359 w340 h50 vTestDataValue,
Gui, Add, Text, x12 y419 w100 h20 , Reference
Gui, Add, Edit, x12 y439 w340 h40 vReferenceValue,
Gui, Add, Text, x372 y9 w230 h20 , Precondition
Gui, Add, Edit, x372 y29 w340 h100 vPreconditionValue,
Gui, Add, Text, x372 y139 w40 h20 , Tags
Gui, Add, Edit, x412 y139 w300 h20 vTagsValue,
Gui, Add, Text, x372 y169 w230 h20 , Steps
Gui, Add, Edit, x372 y189 w340 h100 vStepsValue,
Gui, Add, Text, x372 y299 w220 h20 , Expected
Gui, Add, Edit, x372 y319 w340 h110 vExpectedValue,
Gui, Add, Button, x612 y439 w100 h30 gSaveTestCase, Save Test Case

Gui, Show, x187 y107 h512 w749, New Test Case
Return
