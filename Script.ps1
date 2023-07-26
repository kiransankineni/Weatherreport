##Fetching the weather report by using rest method####
$response=(Invoke-RestMethod -Uri "https://samples.openweathermap.org/data/2.5/forecast/hourly?q=London,us&appid=b6907d289e10d714a6e88b30761fae22" -Method Get).list
$op=@("Enter 1 to know the weather value","Enter  2 to know the wind-speed value","Enter 3 to know the pressure value")
$op

###prompting the user to enter the number to get the weather,wind-speed,pressure values ###
$input=Read-Host "Enter the number:-"

if($input -eq "1")
{
#prompting the user for the date ###
$dt=Read-Host "Enter the date to pull the data"

##Fetching the weather data based on input date ###
$result=$response | where{$_.dt_txt -clike "$dt*"}

##Fetching the weather value###
$weather=$result.weather
Write-Host $dt -ForegroundColor Yellow
Write-Host "weather value" -ForegroundColor Yellow
$weather

}
elseif($input -eq "2")
{
#prompting the user for the date ###
$dt=Read-Host "Enter the date to pull the data"
##Fetching the weather data based on input date ###
$result=$response | where{$_.dt_txt -clike "$dt*"}

##Fetching the wind speed value ##
$wind_speed=$result.wind
Write-Host $dt -ForegroundColor Yellow
Write-Host "wind_speed value" -ForegroundColor Yellow
$wind_speed
}
elseif($input -eq "3")
{
#prompting the user for the date ###
$dt=Read-Host "Enter the date to pull the data"

##Fetching the weather data based on input date ###
$result=$response | where{$_.dt_txt -clike "$dt*"}

##Fetching the pressure value ##
$pressure=$result.main
$pressure_1=$pressure.pressure
Write-Host $dt -ForegroundColor Yellow
Write-Host "Pressure value" -ForegroundColor Yellow
$pressure_1
}
else
{
}