$(document).ready(function () {
    loadData();
});

function loadData() {
    $.ajax({
        url: "/Student/List",
        type: "GET",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            var html = '';
            $.each(result, function (key, item) {
                html += '<tr>';
                html += '<td>' + item.ID + '</td>';
                html += '<td>' + item.Name + '</td>';
                html += '<td>' + item.DOB + '</td>';
                html += '<td>' + item.ContactNo + '</td>';
                html += '<td>' + item.MailingAddress + '</td>';
                html += '<td>' + item.FatherName + '</td>';
                html += '<td>' + item.FatherOccupation + '</td>';
                html += '<td>' + item.FatherContactNo + '</td>';
                html += '<td>' + item.MotherName + '</td>';
                html += '<td>' + item.MotherOccupation + '</td>';
                html += '<td>' + item.MotherContactNo + '</td>';
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
        Name: $('#Name').val(),
        DOB: $('#DOB').val(),
        ContactNo: $('#ContactNo').val(),
        MailingAddress: $('#MailingAddress').val(),
        FatherName: $('#FatherName').val(),
        FatherOccupation: $('#FatherOccupation').val(),
        FatherContactNo: $('#FatherContactNo').val(),
        MotherName: $('#MotherName').val(),
        MotherOccupation: $('#MotherOccupation').val(),
        MotherContactNo: $('#MotherContactNo').val()
    };
    $.ajax({
        url: "/Student/Add",
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

    $('#Name').css('border-color', 'lightgrey');
    $('#DOB').css('border-color', 'lightgrey');
    $('#ContactNo').css('border-color', 'lightgrey');
    $('#MailingAddress').css('border-color', 'lightgrey');
    $('#FatherName').css('border-color', 'lightgrey');
    $('#FatherOccupation').css('border-color', 'lightgrey');
    $('#FatherContactNo').css('border-color', 'lightgrey');
    $('#MotherName').css('border-color', 'lightgrey');
    $('#MotherOccupation').css('border-color', 'lightgrey');
    $('#MotherContactNo').css('border-color', 'lightgrey');

    $.ajax({
        url: "/Student/getbyID/" + Id,
        typr: "GET",
        contentType: "application/json;charset=UTF-8",
        dataType: "json",
        success: function (result) {
          
            $('#ID').val(result.ID);
            $('#Name').val(result.Name);
            $('#DOB').val(result.DOB);
            $('#ContactNo').val(result.ContactNo);
            $('#MailingAddress').val(result.MailingAddress);
            $('#FatherName').val(result.FatherName);
            $('#FatherOccupation').val(result.FatherOccupation);
            $('#FatherContactNo').val(result.FatherContactNo);
            $('#MotherName').val(result.MotherName);
            $('#MotherOccupation').val(result.MotherOccupation);
            $('#MotherContactNo').val(result.MotherContactNo);
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
        Name: $('#Name').val(),
        DOB: $('#DOB').val(),
        ContactNo: $('#ContactNo').val(),
        MailingAddress: $('#MailingAddress').val(),
        FatherName: $('#FatherName').val(),
        FatherOccupation: $('#FatherOccupation').val(),
        FatherContactNo: $('#FatherContactNo').val(),
        MotherName: $('#MotherName').val(),
        MotherOccupation: $('#MotherOccupation').val(),
        MotherContactNo: $('#MotherContactNo').val(),

    };
    $.ajax({
        url: "/Student/Update",
        data: JSON.stringify(empObj),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            loadData();
            $('#myModal').modal('hide');
            $('#ID').val("");
            $('#Name').val("");
            $('#DOB').val("");
            $('#ContactNo').val("");
            $('#MailingAddress').val("");
            $('#FatherName').val("");
            $('#FatherOccupation').val("");
            $('#FatherContactNo').val("");
            $('#MotherName').val("");
            $('#MotherOccupation').val("");
            $('#MotherContactNo').val("");
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
            url: "/Student/Delete/" + ID,
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
    $('#Name').val("");
    $('#DOB').val("");
    $('#ContactNo').val("");
    $('#MailingAddress').val("");
    $('#FatherName').val("");
    $('#FatherOccupation').val("");
    $('#FatherContactNo').val("");
    $('#MotherName').val("");
    $('#MotherOccupation').val("");
    $('#MotherContactNo').val("");

    $('#btnUpdate').hide();
    $('#btnAdd').show();
    $('#Name').css('border-color', 'lightgrey');
    $('#DOB').css('border-color', 'lightgrey');
    $('#ContactNo').css('border-color', 'lightgrey');
    $('#MailingAddress').css('border-color', 'lightgrey');
    $('#FatherName').css('border-color', 'lightgrey');
    $('#FatherOccupation').css('border-color', 'lightgrey');
    $('#FatherContactNo').css('border-color', 'lightgrey');
    $('#MotherName').css('border-color', 'lightgrey');
    $('#MotherOccupation').css('border-color', 'lightgrey');
    $('#MotherContactNo').css('border-color', 'lightgrey');
}

function validate() {
    var isValid = true;
    if ($('#Name').val().trim() == "") {
        $('#Name').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#Name').css('border-color', 'lightgrey');
    }
    if ($('#DOB').val().trim() == "") {
        $('#DOB').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#DOB').css('border-color', 'lightgrey');
    }
    if ($('#ContactNo').val().trim() == "") {
        $('#ContactNo').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#ContactNo').css('border-color', 'lightgrey');
    }
    if ($('#MailingAddress').val().trim() == "") {
        $('#MailingAddress').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#MailingAddress').css('border-color', 'lightgrey');
    }

    if ($('#FatherName').val().trim() == "") {
        $('#FatherName').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#FatherName').css('border-color', 'lightgrey');
    }

    if ($('#FatherOccupation').val().trim() == "") {
        $('#FatherOccupation').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#FatherOccupation').css('border-color', 'lightgrey');
    }

    if ($('#FatherContactNo').val().trim() == "") {
        $('#FatherContactNo').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#FatherContactNo').css('border-color', 'lightgrey');
    }

    if ($('#MotherName').val().trim() == "") {
        $('#MotherName').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#MotherName').css('border-color', 'lightgrey');
    }

    if ($('#MotherOccupation').val().trim() == "") {
        $('#MotherOccupation').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#MotherOccupation').css('border-color', 'lightgrey');
    }

    if ($('#MotherContactNo').val().trim() == "") {
        $('#MotherContactNo').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#MotherContactNo').css('border-color', 'lightgrey');
    }

    return isValid;
}