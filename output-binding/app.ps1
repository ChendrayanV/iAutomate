Start-PodeServer {
    Add-PodeEndpoint -Address * -Port 3000 -Protocol Http 
    Add-PodeRoute -Method Post -Path '/bloboutput' -ScriptBlock {
        $Bytes = [System.Text.Encoding]::Unicode.GetBytes($($WebEvent.Request.Body))
        $EncodedText = [Convert]::ToBase64String($Bytes)
        $body = [PSCustomObject]@{
            operation = 'create'
            data      = $($EncodedText)
            metadata  = [PSCustomObject]@{
                blobName = 'name.txt'
            }
        } | ConvertTo-Json -Compress
        Invoke-RestMethod -Uri 'http://localhost:3500/v1.0/bindings/bloboutput' `
            -Method Post `
            -Body $body `
            -ContentType 'application/json'
    }
} -DisableTermination

