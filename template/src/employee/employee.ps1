Start-PodeServer {
    Add-PodeEndpoint -Address * -Port 80 -Protocol Http

    Set-PodeViewEngine -Type PSHTML -Extension PS1 -ScriptBlock {
        param($path, $data)
        return (. $path $data)
    }

    #region - Get Order
    Add-PodeRoute -Method Get -Path '/employee/:id' -ScriptBlock {
        $key = $WebEvent.Parameters.id
        $employeecollection = Invoke-RestMethod -Uri "http://localhost:3500/v1.0/state/statestore/$($key)" -Method Get
        Write-PodeJsonResponse -Value $($employeecollection)
    }
    #endregion

    #region - Post Order - UI Form 
    Add-PodeRoute -Method Post -Path '/newemployee' -ScriptBlock {
        $key = $($WebEvent.Data.employee_id)
        $data = [PSCustomObject]@{
            employee_id     = $($WebEvent.Data.employee_id)
            first_name      = $($WebEvent.Data.first_name )
            last_name       = $($WebEvent.Data.last_name )
            email           = $($WebEvent.Data.email )
            phone_number    = $($WebEvent.Data.phone_number)
            mobile_required = $($WebEvent.Data.mobile_required)
        }
        $state = @(
            [ordered]@{
                key   = $key
                value = $($data)
            }
        )
        $Body = ConvertTo-Json -InputObject $State -Compress
        Write-PodeHost -Object $Body
        Invoke-RestMethod -Uri "http://localhost:3500/v1.0/state/statestore" -Method Post -Body $Body -ContentType 'application/json'
        Write-PodeViewResponse -Path 'success.ps1'
    }
    #endregion

    #region
    Add-PodeRoute -Method Get -Path '/' -ScriptBlock {
        Write-PodeViewResponse -Path './home.ps1'
    }
    #endregion
} -DisableTermination   