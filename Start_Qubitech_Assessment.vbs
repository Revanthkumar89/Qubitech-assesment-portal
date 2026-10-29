Option Explicit

Dim shell, fso, appFolder, secret
Set shell = CreateObject("WScript.Shell")
Set fso = CreateObject("Scripting.FileSystemObject")

appFolder = fso.GetParentFolderName(WScript.ScriptFullName)

If Not fso.FileExists(appFolder & "\app.py") Then
    MsgBox "Could not find app.py in:" & vbCrLf & appFolder & vbCrLf & _
           "Move this VBS file into the same folder as app.py.", vbCritical, "Qubitech Assessment"
    WScript.Quit 1
End If

' Keep the same secret between launches. Replace this with a long random value before use.
secret = "QubiFlask_9vR4mK7xP2wN8zT5cL1hY6bD"

' Set the working directory so py app.py runs from the correct folder.
shell.CurrentDirectory = appFolder

' Start Flask in its own visible Command Prompt window.
shell.Run "cmd.exe /k set FLASK_SECRET_KEY=" & secret & " && py app.py", 1, False

' Wait briefly for Flask to start, then launch the temporary Cloudflare tunnel.
WScript.Sleep 3000
shell.Run "cmd.exe /k cloudflared tunnel --url http://127.0.0.1:5000", 1, False

' Open the local access-code page for a quick local test.
WScript.Sleep 1500
shell.Run "http://127.0.0.1:5000/access", 1, False

MsgBox "Startup commands launched." & vbCrLf & vbCrLf & _
       "1. Keep both Command Prompt windows open." & vbCrLf & _
       "2. Copy the NEW https://...trycloudflare.com URL from the Cloudflare window." & vbCrLf & _
       "3. Test the access-code page and a test submission." & vbCrLf & _
       "4. Press Ctrl+C in the Cloudflare window after interviews, then stop Flask." & vbCrLf & vbCrLf & _
       "Current assessment access code: QUBI2026" & vbCrLf & _
       "Replace the placeholder secret in this VBS before use.", _
       vbInformation, "Qubitech Assessment"
