cls
del .\GeneratedTests\*.xsl /Q
del .\TestData\*_BAD.xml /Q
del .\TestResults\*.* /Q

call GenBadData
call GenTests
REM outliar test:
copy .\TestData\1hrLP_32DaysM_D000_BAD_Template.xml .\TestData\1hrLP_32DaysM_D000_BAD.xml
call RunTests
call CompileResults

start /b call .\TestResults\Results_GOOD.html
start /b call .\TestResults\Results_BAD_Summary.html