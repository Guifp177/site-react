@echo off
echo ===============================================
echo    INSTALACAO ALVORADA MELHOR - WINDOWS
echo ===============================================
echo.

REM Verificar se Python esta instalado
python --version >nul 2>&1
if errorlevel 1 (
    echo [ERRO] Python nao encontrado! 
    echo Por favor, instale Python 3.8+ de https://python.org
    pause
    exit /b 1
)

REM Verificar se Node.js esta instalado  
node --version >nul 2>&1
if errorlevel 1 (
    echo [ERRO] Node.js nao encontrado!
    echo Por favor, instale Node.js 16+ de https://nodejs.org
    pause
    exit /b 1
)

echo [OK] Python e Node.js encontrados!
echo.

REM Instalar dependencias do Backend
echo ===============================================
echo    INSTALANDO BACKEND (Python)
echo ===============================================
cd backend
python -m pip install --upgrade pip
python -m pip install -r requirements.txt
if errorlevel 1 (
    echo [ERRO] Falha na instalacao do backend!
    pause
    exit /b 1
)
echo [OK] Backend instalado com sucesso!
cd ..
echo.

REM Instalar dependencias do Frontend
echo ===============================================
echo    INSTALANDO FRONTEND (React)
echo ===============================================
cd frontend
call npm install
if errorlevel 1 (
    echo [ERRO] Falha na instalacao do frontend!
    pause
    exit /b 1
)
echo [OK] Frontend instalado com sucesso!
cd ..
echo.

echo ===============================================
echo    INSTALACAO CONCLUIDA COM SUCESSO!
echo ===============================================
echo.
echo Para executar o sistema, use: executar.bat
echo.
echo Acesse em:
echo - Frontend: http://localhost:3000
echo - Backend API: http://localhost:8001
echo - Docs API: http://localhost:8001/docs
echo.
pause