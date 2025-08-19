@echo off
echo ===============================================
echo    EXECUTANDO ALVORADA MELHOR
echo ===============================================
echo.

REM Criar arquivo de log
if not exist logs mkdir logs

echo [INFO] Iniciando Backend (FastAPI)...
cd backend
start "Backend API" cmd /k "python -m uvicorn server:app --host 0.0.0.0 --port 8001 --reload"
cd ..

REM Aguardar 3 segundos para o backend iniciar
timeout /t 3 /nobreak >nul

echo [INFO] Iniciando Frontend (React)...
cd frontend  
start "Frontend React" cmd /k "npm start"
cd ..

echo.
echo ===============================================
echo    SISTEMA INICIADO!
echo ===============================================
echo.
echo O sistema esta sendo executado em:
echo.
echo  Frontend: http://localhost:3000
echo  Backend:  http://localhost:8001
echo  API Docs: http://localhost:8001/docs
echo.
echo Para parar o sistema, feche as janelas do terminal.
echo.
echo Aguardando 5 segundos para abrir o navegador...
timeout /t 5 /nobreak >nul

REM Abrir o navegador automaticamente
start http://localhost:3000

echo.
echo Sistema em execucao! Pressione qualquer tecla para sair.
pause >nul