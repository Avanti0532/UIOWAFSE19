$(document).ready(function () {
    $("#registrationsTable").each(function () {
        if ( $.fn.dataTable.isDataTable( '#registrationsTable' ) ) {
            table = $('#registrationsTable').DataTable();
        }
        else {
            table = $('#registrationsTable').DataTable( {
            });
        }
    });
})