param($data)

html -Attributes @{'lang' = 'en' } -Content {
    head -Content {
        meta -charset 'utf-8'
        meta -name 'viewport' -content_tag 'width=device-width, initial-scale=1'
        Link -href 'https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/css/bootstrap.min.css' -rel 'stylesheet' -CrossOrigin 'anonymous' -Integrity 'sha384-r4NyP46KrjDleawBgD5tp8Y7UzmLA05oM1iAEQ17CSuDqnUK2+k9luXQOfXJCJ4I'
        Link -href 'https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css' -rel 'stylesheet' -CrossOrigin 'anonymous' -Integrity 'sha512-PgQMlq+nqFLV4ylk1gwUOgm6CtIIXkKwaIHp/PAIWHzig/lKZSEGKEysh0TCVbHJXCLN7WetD8TFecIky75ZfQ=='
        link -href '.\css\style.css' -rel 'stylesheet' -type 'text/css'
    }

    body -class 'bg-light' -Content {
        Div -Class 'container-fluid' -Content {
            Div -Class 'row' -Content {
                Div -Class 'col-md-10 col-11 mx-auto' -Content {
                    Div -Class 'row mt-5 gx-3' -Content {
                        # left side div
                        Div -Class 'col-md-12 col-lg-8 col-11 mx-auto main_cart mb-lg-0 mb-5 shadow' -Content {
                            Div -class 'card p-4' -Content {
                                h2 -Class 'py-4 font-weight-bold' -Content 'Kongu - Food Hut'
                                Div -Class 'row' -Content {
                                    # cart images div
                                    Div -Class 'col-md-5 col-11 mx-auto bg-light d-flex justify-content-center align-items-center shadow product_img' -Content {
                                        img -class 'img-fluid' -src 'https://images.unsplash.com/photo-1589301760014-d929f3979dbc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80' -alt 'cart img'
                                    }
                                    # cart product details
                                    Div -Class 'col-md-7 col-11 mx-auto px-4 mt-2' -Content {
                                        Div -Class 'row' -Content {
                                            # Product Name
                                            Div -class 'col-6 card-title' -Content {
                                                h4 -Class 'mb-4' -Content 'Idli '
                                                p -Class 'mb-2' -Content 'Ingredients: Black lentils (de-husked), rice'
                                                p -Class 'mb-3' -Content {
                                                    a -href 'https://en.wikipedia.org/wiki/Idli' -Content 'Know more...'
                                                }
                                            }

                                            # Quantity Increment
                                            Div -Class 'col-6' -Content {
                                                ul -Class 'pagination justify-content-end set_quantity' -Content {
                                                    li -Class 'page-item' -Content {
                                                        button -Class 'page-link' -Attributes @{onclick = "decreaseNumber('textbox','itemval')" } -Content {
                                                            i -Class 'fas fa-minus'
                                                        }
                                                    }
                                                    li -Class 'page-item' -Content {
                                                        input -type 'hidden' -name 'text-01' -value 0 -id 'textbox' 
                                                    }
                                                    li -Class 'page-item' -Content {
                                                        button -Class 'page-link' -Attributes @{onclick = "increaseNumber('textbox','itemval')" } -Content {
                                                            i -Class 'fas fa-plus'
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                        
                                        # remove 
                                        Div -Class 'row' -Content {
                                            Div -Class 'col-8 d-flex justify-content-between remove_wish' -Content {
                                                h3 -Content 'Amount'
                                            }
                                            Div -Class 'col-4 d-flex justify-content-end price_money' -Content {
                                                [string]::Concat($(h3 -Content '$' , $(span -Content '0.00' -id 'itemval')))
                                            }
                                        }
                                    }
                                } 
                            }
                            hr 
                            Div -Class 'card p-4' -Content {
                                Div -Class 'mt-3 shadow p-3 bg-white' -Content {
                                    Div -Class 'pt-4' -Content {
                                        h5 -Class 'mb-4' -Content 'Expected delivery date'
                                        p -Content $(Get-Date).AddHours(30)
                                    }
                                }
                            }
                            br
                        }
                        # Righ Side Div
                        
                        Div -class 'col-md-12 col-lg-4 col-11 mx-auto mt-lg-0 mt-md-5' -Content {
                            Div -Class 'right_side p-3 shadow bg-white' -Content {
                                h2 -Class 'product_name mb-5' -Content 'The total amount'
                                div -class 'price_indiv d-flex justify-content-between' -Content {
                                    p -content 'Product Amount'
                                    p -Content {
                                        [string]::Concat('$' , $(span -id 'product_total_amt' -content '0.00'))
                                    }
                                }
                                div -class 'price_indiv d-flex justify-content-between' -Content {
                                    p -content 'Shipping Amount'
                                    p -Content {
                                        [string]::Concat('$' , $(span -id 'shipping_charge' -content '2.00'))
                                    }
                                }
                                hr
                                Div -Class 'total-amt d-flex justify-content-between font-weight-bold' -Content {
                                    p -Content 'The total amount of (including VAT)' 
                                    p -content {
                                        [string]::Concat('$', $(span -Id 'total_cart_amt' -Content '0.00'))
                                    } 
                                }
                                form -action '/sendtotable' -method 'post' -enctype 'multipart/form-data' -Content {
                                    input -name 'total_amount' -id 'total_amount' -type hidden
                                    div -Class 'form-group' -Content {
                                        label -Attributes @{'for' = 'full_name' } -Content 'Full Name'
                                        input -type 'text' -Class 'form-control' -id 'full_name' -name 'full_name' 
                                    }
                                    br
                                    div -Class 'form-group' -Content {
                                        label -Attributes @{'for' = 'card_number' } -Content 'Card Number'
                                        input -type 'text' -Class 'form-control' -id 'card_number' -name 'card_number' -value $((New-Guid).Guid) 
                                    }
                                    hr
                                    button -Class 'btn btn-primary text-uppercase' -Content 'Order'
                                }
                            }
                        }
                    }
                }
            }
        }
        
        '<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
       <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/js/bootstrap.min.js" integrity="sha384-oesi62hOLfzrys4LxRF63OJCXdXDipiYWBnvTl9Y9/TRlw5xlKIEHpNyvvDShgf/" crossorigin="anonymous"></script>'
        script -type 'text/javascript' -content {
            @"
            var product_total_amt = document.getElementById('product_total_amt');
var shipping_charge = document.getElementById('shipping_charge');
var total_cart_amt = document.getElementById('total_cart_amt');
var discountCode = document.getElementById('discount_code1');
// var total_amount = document.getElementById('total_amount');

const decreaseNumber = (incdec, itemprice) => {
    var itemval = document.getElementById(incdec);
    var itemprice = document.getElementById(itemprice);
    console.log(itemprice.innerHTML);
    // console.log(itemval.value);
    if (itemval.value <= 0) {
        itemval.value = 0;
        alert('Negative quantity not allowed');
    } else {
        itemval.value = parseInt(itemval.value) - 1;
        itemval.style.background = '#fff';
        itemval.style.color = '#000';
        itemprice.innerHTML = parseInt(itemprice.innerHTML) - 5;
        product_total_amt.innerHTML = parseInt(product_total_amt.innerHTML) - 5;
        total_cart_amt.innerHTML = parseInt(product_total_amt.innerHTML) + parseInt(shipping_charge.innerHTML);
        document.getElementById("total_amount").value = parseInt(product_total_amt.innerHTML) + parseInt(shipping_charge.innerHTML);;
    }
}
const increaseNumber = (incdec, itemprice) => {
    var itemval = document.getElementById(incdec);
    var itemprice = document.getElementById(itemprice);
    // console.log(itemval.value);
    if (itemval.value >= 5) {
        itemval.value = 5;
        alert('max 5 allowed');
        itemval.style.background = 'red';
        itemval.style.color = '#fff';
    } else {
        itemval.value = parseInt(itemval.value) + 1;
        itemprice.innerHTML = parseInt(itemprice.innerHTML) + 5;
        product_total_amt.innerHTML = parseInt(product_total_amt.innerHTML) + 5;
        total_cart_amt.innerHTML = parseInt(product_total_amt.innerHTML) + parseInt(shipping_charge.innerHTML);
        document.getElementById("total_amount").value = parseInt(product_total_amt.innerHTML) + parseInt(shipping_charge.innerHTML);;

    }
}
const discount_code = () => {
    let totalamtcurr = parseInt(total_cart_amt.innerHTML);
    let error_trw = document.getElementById('error_trw');
    if (discountCode.value === 'thapa') {
        let newtotalamt = totalamtcurr - 5;
        total_cart_amt.innerHTML = newtotalamt;
        error_trw.innerHTML = "Hurray! code is valid";
    } else {
        error_trw.innerHTML = "Try Again! Valid code is thapa";
    }
}

"@
        }
    }
}