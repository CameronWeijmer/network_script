# Variabeln
$profileName = (Get-NetConnectionProfile).Name
$user = $env:USERNAME
$date = Get-Date -Format HH:MM

#Temperatur für Winterthur mit API
$forecast_winterthur = Invoke-RestMethod "https://api.open-meteo.com/v1/forecast?latitude=47.51&longitude=8.72&hourly=temperature_2m&current_weather=true"
$temperature_winterthur = $forecast_winterthur.current_weather.temperature

#Temperatur für Schaffhausen mit API
$forecast_sh = Invoke-RestMethod "https://api.open-meteo.com/v1/forecast?latitude=47.70&longitude=8.63&hourly=temperature_2m&current_weather=true"
$temperature_sh = $forecast_sh.current_weather.temperature

#Nachricht spezifisch der Uhrzeit generiren
if ($date -ge "08:00" -and $date -lt "12:00") {
    $greeting_message = "Good morning"
}
elseif ($date -ge "12:00" -and $date -lt "18:00") {
    $greeting_message = "Good afternoon"
}
elseif ($date -ge "18:00" -or $date -lt "08:00") {
    $greeting_message = "Good evening"
}
else {
    $greeting_message = "Good night"
}
    
#Netwerk und user prüfen
if ($profileName -eq "BBW-Student" -and $user -eq "Camer") {
    notify-send -i important "Friendly Reminder" "${greeting_message} ${user} it's ${date} and it's ${temperature_winterthur} degrees"
    #Programme starten
    Start-Process "C:\Users\Camer\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Microsoft Teams"
    Start-Process "C:\Users\Camer\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Visual Studio Code\Visual Studio Code"
    Start-Process "C:\ProgramData\Microsoft\Windows\Start Menu\Docker Desktop"
}

elseif ($profileName -eq "Cam's Net" -and $user -eq "Camer") {
    notify-send -i important "Friendly Reminder" "${greeting_message} ${user} it's ${date} and it's ${temperature_sh} degrees"
    # Programme starten
    Start-Process "C:\Users\Camer\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Discord Inc\Discord"
    Start-Process "C:\Users\Camer\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Visual Studio Code\Visual Studio Code"
}

else {    
    notify-send -i error "Friendly Reminder" "Network not found!"
}


