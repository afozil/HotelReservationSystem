if exist "%WORKSPACE%\TestResults.trx" (
del "%WORKSPACE%\TestResults.trx" 
)
echo %WORKSPACE%

"C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\Common7\IDE\MSTest.exe" /resultsfile:"%WORKSPACE%\TestResults.trx" /testcontainer:"C:\Projects\HotelReservationSystemUnitTest\bin\Debug\HotelReservationSystemUnitTest.dll" /nologo