$(document).ready(function () {
    $("#syllabusesTable").each(function () {
        if ( $.fn.dataTable.isDataTable( '#syllabusesTable' ) ) {
            table = $('#syllabusesTable').DataTable();
        }
        else {
            table = $('#syllabusesTable').DataTable( {
            });
        }
    });
})