$(document).ready(function () {
    $("#assignmentsTable").each(function () {
        if ( $.fn.dataTable.isDataTable( '#assignmentsTable' ) ) {
            table = $('#assignmentsTable').DataTable();
        }
        else {
            table = $('#assignmentsTable').DataTable( {
            });
        }
    });
})