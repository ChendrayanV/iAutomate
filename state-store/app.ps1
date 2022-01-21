Start-PodeServer {
    Add-PodeEndpoint -Address * -Port 3000 -Protocol Http

    Set-PodeViewEngine -Type PSHTML -Extension PS1 -ScriptBlock {
        param($path, $data)
        return (. $path $data)
    }

    Add-PodeRoute -Method Get -Path '/' -ScriptBlock {
        Write-PodeViewResponse -Path 'index.ps1'
    }

    Add-PodeRoute -Method Post -Path '/sendtotable' -ScriptBlock {
        if ($WebEvent.Data.total_amount -gt 0) {
            $OrderID = [string]::Concat('OD-', (Get-Random -Maximum 100), '-', $([datetime]::UtcNow.Millisecond))
            $key = $($OrderID)
            $data = [PSCustomObject]@{
                full_name    = $($WebEvent.Data.full_name )
                total_amount = $($WebEvent.Data.total_amount )
                card_number  = $($WebEvent.Data.card_number)
            }
            $state = @(
                [ordered]@{
                    key   = $key
                    value = $($data)
                }
            )
            $Body = ConvertTo-Json -InputObject $State -Compress
            Write-PodeHost -Object $Body
            Invoke-RestMethod -Uri "http://localhost:3500/v1.0/state/sendtotable" -Method Post -Body $Body -ContentType 'application/json'
            Write-PodeViewResponse -Path 'success.ps1'
        }
        else {
            Write-PodeJsonResponse -Value $("Order value is 0") -Depth 9
        }
        
    } 

} -DisableTermination