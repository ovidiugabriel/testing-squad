Gui, Font, S9 CDefault, Consolas
Gui, Add, ListBox, x22 y19 w100 h80 vModuleChoice gSelectModule, %ModulesList%
Gui, Add, Button, x132 y19 w100 h30 gAddNew, Add new
Gui, Add, Button, x242 y19 w100 h30 , Approve
Gui, Add, Button, x352 y19 w100 h30 , Clone
Gui, Add, Button, x462 y19 w100 h30 , Edit
Gui, Add, Button, x572 y19 w100 h30 , Delete Test
Gui, Add, Button, x22 y99 w100 h30 gDeleteModule, Delete Module
Gui, Add, ListView, x132 y60 w540 h230 , Test Case ID|Code|Title
Gui, Add, Button, x132 y299 w100 h30 gEditSpecs, Edit Specs
Gui, Show, x216 y177 h387 w706, Test Cases
Return

TestCasesGuiClose:
ExitApp
