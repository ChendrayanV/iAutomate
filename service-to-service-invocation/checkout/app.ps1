Start-PodeServer {
    Add-PodeEndpoint -Address * -Port 6002 -Protocol Http

    Add-PodeRoute -Path '/checkout:id' -ScriptBlock {
        $response = $(
            Invoke-RestMethod -Uri "http://localhost:3601/v1.0/invoke/order/method/order/$($WebEvent.Parameters.Id)"
        )
        Write-PodeJsonResponse -Value $($response)
    }
}