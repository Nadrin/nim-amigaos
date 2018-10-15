#
#     AmigaOS 3 API bindings for Nim
#    (c) Copyright 2018 Michał Siejak
#

const
  SYS_Dummy* = (TAG_USER + 32)
  SYS_Input* = (SYS_Dummy + 1)
  SYS_Output* = (SYS_Dummy + 2)
  SYS_Asynch* = (SYS_Dummy + 3)
  SYS_UserShell* = (SYS_Dummy + 4)
  SYS_CustomShell* = (SYS_Dummy + 5)

const
  NP_Dummy* = (TAG_USER + 1000)
  NP_Seglist* = (NP_Dummy + 1)
  NP_FreeSeglist* = (NP_Dummy + 2)
  NP_Entry* = (NP_Dummy + 3)
  NP_Input* = (NP_Dummy + 4)
  NP_Output* = (NP_Dummy + 5)
  NP_CloseInput* = (NP_Dummy + 6)
  NP_CloseOutput* = (NP_Dummy + 7)
  NP_Error* = (NP_Dummy + 8)
  NP_CurrentDir* = (NP_Dummy + 10)
  NP_StackSize* = (NP_Dummy + 11)
  NP_Name* = (NP_Dummy + 12)
  NP_Priority* = (NP_Dummy + 13)
  NP_ConsoleTask* = (NP_Dummy + 14)
  NP_WindowPtr* = (NP_Dummy + 15)
  NP_HomeDir* = (NP_Dummy + 16)
  NP_CopyVars* = (NP_Dummy + 17)
  NP_Cli* = (NP_Dummy + 18)
  NP_Path* = (NP_Dummy + 19)
  NP_CommandName* = (NP_Dummy + 20)
  NP_Arguments* = (NP_Dummy + 21)
  NP_NotifyOnDeath* = (NP_Dummy + 22)
  NP_Synchronous* = (NP_Dummy + 23)
  NP_ExitCode* = (NP_Dummy + 24)
  NP_ExitData* = (NP_Dummy + 25)

const
  ADO_Dummy* = (TAG_USER + 2000)
  ADO_FH_Mode* = (ADO_Dummy + 1)
  ADO_DirLen* = (ADO_Dummy + 2)
  ADO_CommNameLen* = (ADO_Dummy + 3)
  ADO_CommFileLen* = (ADO_Dummy + 4)
  ADO_PromptLen* = (ADO_Dummy + 5)
