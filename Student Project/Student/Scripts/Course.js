$(document).ready(function () {
    loadData();
});

function loadData() {
    $.ajax({
        url: "/Course/List",
        type: "GET",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            var html = '';
            $.each(result, function (key, item) {
                html += '<tr>';
                html += '<td>' + item.ID + '</td>';
                html += '<td>' + item.CourseCode + '</td>';
                html += '<td>' + item.CourceName + '</td>';
                html += '<td>' + item.CreditHour + '</td>';
                html += '<td>' + item.ContactHour + '</td>';
                html += '<td><a href="#" onclick="return getbyID(' + item.ID + ')">Edit</a> | <a href="#" onclick="Delele(' + item.ID + ')">Delete</a></td>';
                html += '</tr>';
            });
            $('.tbody').html(html);
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function Add() {
    var res = validate();
    if (res == false) {
        return false;
    }
    var empObj = {
        ID: $('#ID').val(),
        CourseCode: $('#CourseCode').val(),
        CourceName: $('#CourceName').val(),
        CreditHour: $('#CreditHour').val(),
        ContactHour: $('#ContactHour').val()
    };
    $.ajax({
        url: "/Course/Add",
        data: JSON.stringify(empObj),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            loadData();
            $('#myModal').modal('hide');
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function getbyID(Id) {

    $('#CourseCode').css('border-color', 'lightgrey');
    $('#CourceName').css('border-color', 'lightgrey');
    $('#CreditHour').css('border-color', 'lightgrey');
    $('#ContactHour').css('border-color', 'lightgrey');

    $.ajax({
        url: "/Course/getbyID/" + Id,
        typr: "GET",
        contentType: "application/json;charset=UTF-8",
        dataType: "json",
        success: function (result) {

            $('#ID').val(result.ID);
            $('#CourseCode').val(result.CourseCode);
            $('#CourceName').val(result.CourceName);
            $('#CreditHour').val(result.CreditHour);
            $('#ContactHour').val(result.ContactHour);          
            $('#myModal').modal('show');
            $('#btnUpdate').show();
            $('#btnAdd').hide();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
    return false;
}

function Update() {
    var res = validate();
    if (res == false) {
        return false;
    }
    var empObj = {

        ID: $('#ID').val(),
        CourseCode: $('#CourseCode').val(),
        CourceName: $('#CourceName').val(),
        CreditHour: $('#CreditHour').val(),
        ContactHour: $('#ContactHour').val(),      
    };
    $.ajax({
        url: "/Course/Update",
        data: JSON.stringify(empObj),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            loadData();
            $('#myModal').modal('hide');
            $('#ID').val("");
            $('#CourseCode').val("");
            $('#CourceName').val("");
            $('#CreditHour').val("");
            $('#ContactHour').val("");           
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function Delele(ID) {
    var ans = confirm("Are you sure you want to delete this Record?");
    if (ans) {
        $.ajax({
            url: "/Course/Delete/" + ID,
            type: "POST",
            contentType: "application/json;charset=UTF-8",
            dataType: "json",
            success: function (result) {
                loadData();
            },
            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });
    }
}

function clearTextBox() {
    $('#ID').val("");
    $('#CourseCode').val("");
    $('#CourceName').val("");
    $('#CreditHour').val("");
    $('#ContactHour').val("");

    $('#btnUpdate').hide();
    $('#btnAdd').show();

    $('#CourseCode').css('border-color', 'lightgrey');
    $('#CourceName').css('border-color', 'lightgrey');
    $('#CreditHour').css('border-color', 'lightgrey');
    $('#ContactHour').css('border-color', 'lightgrey');   
}

function validate() {
    var isValid = true;
    if ($('#CourseCode').val().trim() == "") {
        $('#CourseCode').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#CourseCode').css('border-color', 'lightgrey');
    }
    if ($('#CourceName').val().trim() == "") {
        $('#CourceName').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#CourceName').css('border-color', 'lightgrey');
    }
    if ($('#CreditHour').val().trim() == "") {
        $('#CreditHour').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#CreditHour').css('border-color', 'lightgrey');
    }
    if ($('#ContactHour').val().trim() == "") {
        $('#ContactHour').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#ContactHour').css('border-color', 'lightgrey');
    }
    return isValid;
}