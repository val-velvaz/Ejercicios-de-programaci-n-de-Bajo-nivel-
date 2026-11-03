# Instala NASM y DOSBox-X con winget. Ejecutar en PowerShell.
winget install --id NASM.NASM -e --accept-source-agreements --accept-package-agreements
winget install --id joncampbell123.DOSBox-X -e --accept-source-agreements --accept-package-agreements
Write-Host "Listo. Cierra y vuelve a abrir VS Code para que reconozca nasm en el PATH."
