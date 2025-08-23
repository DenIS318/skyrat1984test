@echo off

set REPO_URL=https://github.com/skyrat1984test/rust-skyrat-1984.git
set TARGET_DIR="%~dp0\..\RUST_REMOTE"

REM Check if folder exists (order is important)
if exist %TARGET_DIR% (
    cd %TARGET_DIR%
    echo Pulling and checking if need to update remote...
    git pull
)
if not exist %TARGET_DIR% (
    mkdir %TARGET_DIR%
    cd %TARGET_DIR%
    echo Cloning remote...
    git clone %REPO_URL% .
)

WHERE "cargo" >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    ECHO "cargo" command was not found. Install cargo for windows and rerun: https://win.rustup.rs/
    exit 101
)
WHERE "rustup" >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    ECHO "rustup" command was not found. Install rust for windows and rerun: https://win.rustup.rs/
    exit 102
)

xcopy "%~dp0\..\RUST\*.*" "%TARGET_DIR%\src\RUST_1984\" /E /I /Y /q

rustup target add i686-pc-windows-msvc
cargo build --release --target i686-pc-windows-msvc

xcopy "%TARGET_DIR%\target\i686-pc-windows-msvc\release\rust_g.dll" "%~dp0\.." /Y /q
IF %ERRORLEVEL% NEQ 0 (
    ECHO Failed to copy rust_g.dll
    exit 103
)

exit /b 0
