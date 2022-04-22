$(document).ready(function () {
    loadData();
    loadStudent();
});

function loadStudent() {

    $.getJSON("/CourseAssign/StudentList", function (data) {
        $.each(data, function () {
            $("#StudentID").append($("<option></option>").val(this['Value']).html(this['Text']));
        });
    })
}

function loadData() {
    $.ajax({
        url: "/CourseAssign/List",
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
                html += '<td><input type="checkbox"/></td>';
                html += '</tr>';
            });
            $('.tbody').html(html);
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

// -------------- Save Master Data----------// 
$(document).on('click', '#btnSave', function () {

    var SemisterCode = $('#SemisterCode').val();
    var StudentID = $('#StudentID').val();

    if (StudentID == "0") {

        alert('Please select student')
    }
    else if (SemisterCode == "0") {

        alert('Please select semester')
    }
    else {

        var empObjs = {
            StudentID: $('#StudentID').val(),
            SemisterCode: $('#SemisterCode').val()
        };
        $.ajax({
            url: "/CourseAssign/Add",
            data: JSON.stringify(empObjs),
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            success: function (result) {

                var CourseList = []; // list object  
                $('#table-information > tbody  > tr').each(function () { //loop in table list  

                    $("#table-information input[type=checkbox]:checked").each(function () {
                        var row = $(this).closest("tr")[0];     
                        var Courses = {}; // create new Movie object and set its properties  
                        Courses.ID = row.cells[0].innerHTML;
                        CourseList.push(Courses); // add Movie object to list object 
                    });
                    return false;
                });

                $.ajax({

                    url: "/CourseAssign/InsertData",
                    type: "POST",
                    data: JSON.stringify(CourseList),
                    contentType: "application/json",
                    dataType: "json",
                    success: function (response) {
                        if (response === true) {
                            alert("Course assigned have been saved successfully.");
                            $('#tbody').empty();
                        } else {
                            alert("Course assigned error.");
                        }
                    }
                });
            },
            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });
    }
});

