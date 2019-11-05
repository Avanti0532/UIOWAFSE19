$(document).ready(function () {
    $("#coursesTable").each(function () {
        if ( $.fn.dataTable.isDataTable( '#coursesTable' ) ) {
            table = $('#coursesTable').DataTable();
        }
        else {
            table = $('#coursesTable').DataTable( {
            });
        }
    });
})