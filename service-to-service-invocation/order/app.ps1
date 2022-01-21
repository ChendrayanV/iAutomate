Start-PodeServer {
    Add-PodeEndpoint -Address * -Port 6001 -Protocol Http

    Add-PodeRoute -Method Get -Path '/order:id' -ScriptBlock {
        $orderId = $($WebEvent.Parameters.Id)
        switch ($orderId) {
            1 {
                $body = [PSCustomObject]@{
                    Name = 'Pen'
                    Id   = 1
                }
            }
            2 {
                $body = [PSCustomObject]@{
                    Name = 'Pencil'
                    Id   = 1
                }
            }
            default {
                $body = [PSCustomObject]@{
                    Message = 'No Order Found...'
                }
            }
        }
        Write-PodeJsonResponse -Value $($body)
    }
}