::REQUIRED PYTHON >= 3.7 with http module
::WITH PYTHON ALIAS AS py
::CHANGE IF YOU WANT
@ECHO OFF
IF [%1]==[] ( 
  SET rdir=%cd% 
) ELSE ( 
  IF EXIST "%1" ( 
    SET rdir=%1 
  ) ELSE ( 
    ECHO ROOT DIR NOT EXIST
    ECHO EXIT -1
    EXIT /B
  )
)
ECHO Serving for %rdir%
ECHO IP Bind:
ipconfig | findstr /r "Address.*[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*"
py -m http.server --directory %rdir% 8080 
@ECHO ON