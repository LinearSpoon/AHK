#Include LidWatcher.ahk
r := Start_LidWatcher()  ;Start waiting for the lid to be opened or closed

OnExit, cleanup
return

cleanup:
  Stop_LidWatcher(r)  ;Stop watching the lid state changes
  ExitApp
return


; This function will be called whenever the lid changes states.
; As a simple demonstration, it will simply output the new state
; and current time to a log file called lid.log
LidStateChange(newstate)
{
  FormatTime, TimeString,, h:mm:ss tt
  FileAppend, The lid was %newstate% at %TimeString%`n, lid.log
}