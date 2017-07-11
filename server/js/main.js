/***********************************
    Simple JS file 
************************************/
function day(i){
    var today = new Date();
    today.setDate(today.getDate()+i);
    var dd = today.getDate();
    var mm = today.getMonth()+1; //January is 0!

    var yyyy = today.getFullYear();
    if(dd<10){
        dd='0'+dd;
    } 
    if(mm<10){
        mm='0'+mm;
    } 
    var today = dd+'/'+mm+'/'+yyyy;
    return today
}


function populate(ele,out){
    $(ele).val(out);
    $(ele).html(out);
}
var Invoke = function(ele,url){    
    $.get(url, function(data, status){
        data = JSON.parse(data)
        console.log(data)
        if(data.status == 'success'){
            out = data.out
            if($.isArray(out)){
                
            } else if($.isPlainObject(out)){
                
            } else{                    
                populate($(ele).find('.out'),out)
            }
        }
    });
};

$( document ).ready(function() {
    console.log( "ready!" );
    for ( var i = 0; i <$('.smt').length;i++){
        var ele = $('.smt')[i];
        url = $(ele).attr('endpoint')
        Invoke(ele,url);
    }
});