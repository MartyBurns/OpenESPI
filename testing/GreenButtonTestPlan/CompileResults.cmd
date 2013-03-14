ECHO OFF
cls

del .\TestResults\Results_BAD_Summary.xml
copy Results_BAD_SummaryTemplate.xml .\TestResults\Results_BAD_Summary.xml

FOR %%A IN (.\TestResults\*_BAD.xml) DO (
    REM ECHO Pattern matched
    REM ECHO Name in 8.3 notation : %%~snA
    ECHO --- Processing : %%~fA
	
	msxsl .\TestResults\Results_BAD_Summary.xml MergeResults.xsl FileName=%%~fA > .\TestResults\Results_BAD_TEMP.xml
	del .\TestResults\Results_BAD_Summary.xml
	move .\TestResults\Results_BAD_TEMP.xml .\TestResults\Results_BAD_Summary.xml
)

del .\TestResults\Results_GOOD.xml
copy Results_Good_SummaryTemplate.xml .\TestResults\Results_GOOD.xml

FOR %%A IN (.\TestResults\*_GOOD.xml) DO (
    REM ECHO Pattern matched
    REM ECHO Name in 8.3 notation : %%~snA
    ECHO --- Processing : %%~fA
	
	msxsl .\TestResults\Results_GOOD.xml MergeResults.xsl FileName=%%~fA > .\TestResults\Results_GOOD_TEMP.xml
	del .\TestResults\Results_GOOD.xml
	move .\TestResults\Results_GOOD_TEMP.xml .\TestResults\Results_GOOD.xml
)

msxsl .\TestResults\Results_BAD_Summary.xml PresentResults.xsl > .\TestResults\Results_BAD_Summary.html
msxsl .\TestResults\Results_GOOD.xml PresentResults.xsl > .\TestResults\Results_GOOD.html