# Variables
$profileName = (Get-NetConnectionProfile).Name
$user = $env:USERNAME
$date = Get-Date -Format HH:MM

#Get temperature with API for Winterthur
$forecast_winterthur = Invoke-RestMethod "https://api.open-meteo.com/v1/forecast?latitude=47.51&longitude=8.72&hourly=temperature_2m&current_weather=true"
$temperature_winterthur = $forecast_winterthur.current_weather.temperature

#Get temperature with API for Schaffhausen
$forecast_sh = Invoke-RestMethod "https://api.open-meteo.com/v1/forecast?latitude=47.70&longitude=8.63&hourly=temperature_2m&current_weather=true"
$temperature_sh = $forecast_sh.current_weather.temperature

# Get specific greeting according to actual time
if ($date -gt "08:00") {
    $greeting_message = "Good morning"
}
elseif ($date -gt "12:00") {
    $greeting_message = "Good afternoon"

}
elseif ($date -gt "18:00") {
    $greeting_message = "Good evening"
}
elseif ($date -gt "00:00") {
    $greeting_message = "Good night"
}
    
# check profilename and network
if ($profileName -eq "BBW-Student" -and $user -eq "Camer") {
    notify-send -i important "Your friend" "${greeting_message} ${user} it's ${date} and it's ${temperature_winterthur} degrees"
    # Start-Process https://cameronweijmer.com
}

elseif ($profileName -eq "BBW-Student2" -and $user -eq "Camer") {
    notify-send -i important "Your friend" "${greeting_message} ${user} it's ${date} and it's ${temperature_sh} degrees"
}

else {    
    notify-send -i error "Error" "Network not found!"
}


