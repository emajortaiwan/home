$(document).ready(function(){
$.ajax({
    type: 'GET',
    url: './course_info/courseList.json',
    dataType: "json",
    success: function(jsond){
        console.log(jsond);
        $("#example2 > table").dataTable({
            data: jsond,
            columns: [
            {data: 'project'},
            {data: 'content'}
            ],
            responsive: true

        })

    }
})
});
