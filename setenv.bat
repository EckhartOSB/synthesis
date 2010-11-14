@echo off
set SYNTHESIS=%~dp0
set SRC=%SYNTHESIS%sources
set TESTS=%SYNTHESIS%tests
set DOC=%SYNTHESIS%documentation
set VCSNODE=%SYNTHESIS%vcs
set PROTO=%SYNTHESIS%prototypes\
set MIXINS=%SYNTHESIS%mixins
set TEST_EXE=%TESTS%\exe
set SYNIMPDIR=%PROTO%
set SYNEXPDIR=%PROTO%
set SOURCE_PATH=%SRC%,%MIXINS%,%TESTS%
set SLASH=\
set RMCMD=del /q
set CPCMD=copy /y
set DBG=-d
set NOVCS=
set NETLIBPATH=%DBLDIR%\bin\bin40
