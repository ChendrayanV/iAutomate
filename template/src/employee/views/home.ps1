param($data)

function ShowStatCard {
    param (
        $Color,

        $Icon,

        $Text,

        $Stat
    )

    Div -Class 'cell-lg-3 cell-sm-6 mt-2' -Content {
        Div -Class "icon-box border bd-$($Color)" -Content {
            Div -Class "icon bg-$($Color) fg-white" -Content {
                span -class $($Icon) -content {}
            }
            Div -Class 'content p-4' -Content {
                Div -Class 'text-upper' -Content $($Text)  
                h3 -Class 'text-upper text-bold text-lead' -Content $($Stat) 
            }
        }
    }
}

function ShowInfoBox {
    param (
        $Color,

        $Stat,

        $Text,

        $Icon
    )
    Div -Class 'cell-lg-3 cell-md-6 mt-2' -Content {
        Div -class "more-info-box bg-$($Color) fg-white" -Content {
            Div -Class 'content' -Content {
                h2 -Class 'text-bold mb-0' -Content $($Stat)
                Div -Content $($Text)
            }
            Div -Class 'icon' -Content {
                span -class "$($Icon) fg-white" -content {}
            }
            a -href '#' -class 'more' -content 'More Info..'
        }
    }
}
function ShowFormInput {
    param (
        $Label,

        $Informer,

        $Placeholder,

        $Icon,

        $FieldName
    )
    
    input -type 'text' -Attributes @{
        'data-role'         = "materialinput"
        'data-icon'         = "<span class='$($Icon)'>"
        'data-cls-line'     = 'bg-darkCyan'
        'data-cls-label'    = 'fg-darkCyan'
        'data-cls-informer' = 'fg-darkCyan'
        'data-cls-icon'     = 'fg-darkCyan'
        'data-label'        = $($Label)
        'data-informer'     = $($Informer)
        'placeholder'       = $($Placeholder)
    } -name $($FieldName)
}

return html -Content {
    head -Content {
        Title -Content "Dear Azure | Home"
        Link -href "https://cdn.metroui.org.ua/v4.3.2/css/metro-all.min.css" -rel "stylesheet"
        script -src "https://cdn.metroui.org.ua/v4/js/metro.min.js"
    }
    body -Class 'm4-cloak h-vh-100' -Content {
        
        Div -Class 'pos-absolute bg-darkCyan fg-white app-bar' -Attributes @{'data-role-appbar' = 'true'; 'data-role' = 'appbar' } -Content {
            Div -Class 'app-bar-container ml-auto' -Content {
                a -href '#' -Class 'app-bar-item' -Content {
                    span -class 'mif-mail'
                    span -class 'badge bg-orange fg-white mt-2 mr-1' -content '24'
                }
                a -href '#' -Class 'app-bar-item' -Content {
                    span -class 'mif-bell'
                    span -class 'badge bg-orange fg-white mt-2 mr-1' -content '10'
                }
                
                a -href '#' -Class 'app-bar-item' -Content {
                    span -class 'ml-2 app-bar-name' -content 'Chendrayan Venkatesan'
                }
            }
        }
        (1..3).foreach({ $_ })
        Div -Class 'row border-bottom bd-lightGray m-3' -Content {
            Div -Class 'cell-md-4 d-flex flex-align-center' -Content {
                Div -Class 'ccc' -Content {
                    h6 -Class 'text-center text-left-md' -Content {
                        'Azure Container Apps <small>(Preview)</small>'
                    }
                }
            }
        }
        Div -Class 'row m-3' -Content {
            ShowStatCard -Color 'darkCyan' -Icon 'mif-eur' -Text 'Annual Pay' -Stat 'EUR 81,000'
            ShowStatCard -Color 'darkCyan' -Icon 'mif-mobile' -Text 'Mobile' -Stat 'EUR 24,310'
            ShowStatCard -Color 'darkCyan' -Icon 'mif-medkit' -Text 'Health Insurance' -Stat 'EUR 35,112'
            ShowStatCard -Color 'darkCyan' -Icon 'mif-rocket' -Text 'Cost to Company' -Stat 'EUR 140,422'

        }
        Div -Class 'row m-3' -Content {
            ShowInfoBox -Color 'darkCyan' -Stat 'Security' -Text 'is everybody concern...' -Icon 'mif-fingerprint'
            ShowInfoBox -Color 'darkCyan' -Stat 'EV Station' -Text 'go green...' -Icon 'mif-ev-station'
            ShowInfoBox -Color 'darkCyan' -Stat 'Shopping' -Text 'shop with us...' -Icon 'mif-shopping-basket'
            ShowInfoBox -Color 'darkCyan' -Stat 'Library' -Text 'Free' -Icon 'mif-books'
        }
        Div -Class 'row m-6' -Content {
            
            Div -Class 'head-bar pos-absolute bg-darkCyan fg-white' -Content {
                button -Class 'expand-button light ml-2' -Content {
                    Span -Content {}
                }
                Span -Class 'app-title' -Content "Employee Information"  
            }
        }
        br
        Div -Class 'row m-8' -Content {
            Div -Class 'input-material' -Content {
                form -action "/newemployee" -method "post" -enctype 'multipart/form-data' -content {
                    div -class 'form-group' -content {
                        $Icons = 'mif-keyboard-tab'
                        ShowFormInput -icon $Icons -Label 'Employee Id' -Informer 'Employee Id' -Placeholder 'employee_id' -FieldName 'employee_id'
                        ShowFormInput -icon $Icons -Label 'First Name' -Informer 'First Name' -Placeholder 'First Name' -FieldName 'first_name'
                        ShowFormInput -icon $Icons -Label 'Last Name' -Informer 'Last Name' -Placeholder 'Last Name' -FieldName 'last_name'
                        ShowFormInput -icon $Icons -Label 'Email' -Informer 'Email' -Placeholder 'Email' -FieldName 'email'
                        ShowFormInput -icon $Icons -Label 'Phone' -Informer 'Phone' -Placeholder 'phone_number' -FieldName 'phone_number'
                        input -type 'checkbox' -Attributes @{"data-role" = "switch"; "checked data-material" = "true"; 'data-caption' = "Mobile Required" ; 'data-caption-position' = "left"; } -name 'mobile_required'
                    }
                    div -class 'form-group' -content {
                        button -class 'button bg-darkCyan outline rounded fg-white' -content 'Submit'
                    }
                }
            }
        }
    }
    script -src 'https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js'
}
