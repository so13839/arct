<?php
$file = '/home/data/members.csv';
$success = "";
if (! empty($_POST["register"])) {
    $file = fopen('/home/data/members.csv', "a+"); ;
    $value = $_POST;
    fputcsv($file, $value);
    fclose($file);
    $success = "Successfully Registered.";
    //include('/shiny/');
    header("Location:http://167.99.157.152:3838/arct/");
    exit;
}
?>
<html>
<head>
<title>Register</title>
<style>
.login-box {
    border: 1px solid;
    border-color: #e5e6e9 #dfe0e4 #d0d1d5;
    border-radius: 3px;
    padding: 20px 30px 20px 30px;
    width: 300px;
    margin: 50px auto;
}

.form-element input {
    width: 100%;
    box-sizing: border-box;
    margin-bottom: 10px;
    border-radius: 3px;
    transition: none;
}

.btn {
    padding: 10px 30px 10px 30px;
    cursor: pointer;
    color: #282B2D;
    border: 1px solid;
    border-color: #0cb1f5;
    text-decoration: none;
    margin-right: 4px;
    text-align: center;
    border-radius: 3px;
    text-transform: uppercase;
    font-size: 12px;
}

.theme-color {
    background-color: #0cb1f5;
    color: #f5f7fa;
}

input {
    border: 1px solid #ccc;
    border-radius: 3px;
    padding: 7px;
    width: 250px;
    background-color: #fff;
    color: #191919;
}

body {
    font-family: Arial;
    font-size: .9em;
    color: #312828;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
}

.error {
    color: #D8000C;
}

.text-center {
    text-align: center;
}

.form-label {
    margin-bottom: 3px;
}

.form-row {
    margin-bottom: 5px;
}

.success {
    color: #22af20;
}
</style>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
    integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
    crossorigin="anonymous"></script>
</head>
<body>
    <div class="login-register-container">
        <div class="login-box">
            <form name="frmRegister" class="form-login"
                action="index.php" method="POST"
                onsubmit="return validation();">
                <h1 class="text-center clear-float">Register</h1>
                <div class="success text-center"><?php echo $success?></div>
                <div id="error_info" class="error text-center"></div>
                <div class="form-row">
                    <div class="form-label">First Name</div>
                    <div class="form-element">
                        <input type="text" name="first-name"
                            id="first-name">
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-label">Middle Name</div>
                    <div class="form-element">
                        <input type="text" name="middle-name"
                            id="middle-name">
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-label">Last Name</div>
                    <div class="form-element">
                        <input type="text" name="last-name"
                            id="last-name">
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-label">Company / Oraganization</div>
                    <div class="form-element">
                        <input type="text" name="company" id="company">
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-label">Date Of Birth</div>
                    <div class="form-element">
                        <input type="date" name="birthday" id="birthday">
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-label">Telephone Number</div>
                    <div class="form-element">
                        <input type="text" name="phone" id="phone">
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-label">Email</div>
                    <div class="form-element">
                        <input type="text" name="signup-email"
                            id="signup-email">
                    </div>
                </div>
                <div class="form-row float-clear">
                    <div class="form-element text-center">
                        <input type="submit" name="register"
                            value="signup" class="btn theme-color">
                    </div>
                </div>
            </form>

        </div>
    </div>
</body>
<script>
function validation() {
    var valid=true;
    var Email = document.getElementById('signup-email').value;
    var First = document.getElementById('first-name').value;//$('#first-name').val();
    var middle = document.getElementById('middle-name').value;
    var Last = document.getElementById('last-name').value;
    var Phone = document.getElementById('phone').value;
    var birthday = document.getElementById('birthday').value;
    var company = document.getElementById('company').value;
    $("#error_info").html("");
    var emailRegex = /^[a-zA-Z0-9.!#$%&*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/;
    if(Email.trim() == "" || First.trim() == "" || middle.trim() == "" || Last.trim() == "" || Phone.trim() == "" || birthday.trim() == "" || company.trim() == "") {
        $("#error_info").html("Invalid name.").show();
        valid=false;
    }
    if(!emailRegex.test(Email)) {
        $("#error_info").html("Invalid email address.").show();
        valid=false;
    }
    if((company == "") || Email == "" || birthday == "" || Phone == "" || First == "" || middle == "" || Last == ""){
        $("#error_info").html("All fields are required.").show();
        valid=false;
        }
    return valid;
    }
</script>
</html>