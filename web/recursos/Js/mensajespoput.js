function showSuccessToast(mensaje) {
    $().toastmessage('showSuccessToast', mensaje);
}
function showStickySuccessToast() {
    $().toastmessage('showToast', {
        text     : 'Success Dialog which is sticky',
        sticky   : true,
        position : 'middle-center',
        type     : 'success',
        closeText: '',
        close    : function () {
            console.log("toast is closed ...");
        }
    });

}
function showNoticeToast(mensaje) {
    $().toastmessage('showNoticeToast', mensaje);
}
function showStickyNoticeToast() {
    $().toastmessage('showToast', {
        text     : 'Notice Dialog which is sticky',
        sticky   : true,
        position : 'middle-center',
        type     : 'notice',
        closeText: '',
        close    : function () {
            console.log("toast is closed ...");
        }
    });
}
function showWarningToast(mensaje) {
    $().toastmessage('showWarningToast', mensaje);
}
function showStickyWarningToast() {
    $().toastmessage('showToast', {
        text     : 'Warning Dialog which is sticky',
        sticky   : true,
        position : 'middle-center',
        type     : 'warning',
        closeText: '',
        close    : function () {
            console.log("toast is closed ...");
        }
    });
}
function showErrorToast(mensaje) {
    $().toastmessage('showErrorToast', mensaje);
}
function showStickyErrorToast() {
    $().toastmessage('showToast', {
        text     : 'Error Dialog which is sticky',
        sticky   : true,
        position : 'top-center',
        type     : 'error',
        closeText: '',
        close    : function () {
            console.log("toast is closed ...");
        }
    });
}



