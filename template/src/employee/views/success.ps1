html -Content {
    head -Content {
        Title -Content "Dear Azure | Home"
        Link -href "https://cdn.metroui.org.ua/v4.3.2/css/metro-all.min.css" -rel "stylesheet"
        script -src "https://cdn.metroui.org.ua/v4/js/metro.min.js"
    }

    body -Content {
        Div -Class 'container' -Content {
            (1..3).foreach({br})
            Div -Class 'card image-header' -Content {
                Div -Class 'card-header fg-white' -Content {
                    p -Content 'Success'
                } -Style 'background-image: url(https://images.unsplash.com/photo-1551892589-865f69869476?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80)'
                Div -Class 'card-content p-2' -Content {
                    blockquote -class 'right-side fg-green' -Content {
                        p -content 'A timely favour, however trivial </br>
                        its material value is, is invaluable.'
                        small -content {
                            'Thirukural...'
                        }
                    }
                }
                Div -Class 'card-footer' -Content {
                    if ($($WebEvent.Data.mobile_required)) {
                        # p -Class 'fg-green' -Content "You get a mobile $($WebEvent.Data.mobile_required)"
                        table -Class 'table' -Content {
                            thead -Content {
                                tr -Content {
                                    th -Content 'First Name'
                                    th -Content 'Last Name'
                                    th -Content 'Full Name'
                                    th -Content 'Mobile Required'
                                }
                                tbody -Content {
                                    tr -Content {
                                        td -Content $($WebEvent.Data.first_name)
                                        td -Content $($WebEvent.Data.last_name)
                                        td -Content $([string]::concat($WebEvent.Data.last_name, ', ', $WebEvent.Data.first_name))
                                        td -Content "Yes"
                                    }
                                }
                            }
                        }
                    }
                    else {
                        table -Class 'table' -Content {
                            thead -Content {
                                tr -Content {
                                    th -Content 'First Name'
                                    th -Content 'Last Name'
                                    th -Content 'Full Name'
                                    th -Content 'Mobile Required'
                                }
                                tbody -Content {
                                    tr -Content {
                                        td -Content $($WebEvent.Data.first_name)
                                        td -Content $($WebEvent.Data.last_name)
                                        td -Content $([string]::concat($WebEvent.Data.last_name, ', ', $WebEvent.Data.first_name))
                                        td -Content "No"
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}