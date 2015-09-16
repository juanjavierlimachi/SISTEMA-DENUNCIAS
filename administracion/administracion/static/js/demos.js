function submitform(){
    document.forms['submit'].submit();
}

$(function (){
    $('.date').datepicker({
        dateFormat: "yy-mm-dd",
        firstDay: 0,
        changeFirstDay: false,
        changeYear: true
    });
});

function gmaps_ads(){
    var adUnitDiv = document.createElement('div');
    var adUnitOptions = {
        format: google.maps.adsense.AdFormat.BANNER,
        position: google.maps.ControlPosition.BOTTOM,
        publisherId: '2955572330991421',
        map: map,
        visible: true
    };
    var adUnit = new google.maps.adsense.AdUnit(adUnitDiv, adUnitOptions);
}

(function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/es_LA/all.js#xfbml=1&appId=151876488175851";
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));

!function(d,s,id){
    var js,fjs=d.getElementsByTagName(s)[0];
    if(!d.getElementById(id)){
        js=d.createElement(s);
        js.id=id;
        js.src="//platform.twitter.com/widgets.js";
        fjs.parentNode.insertBefore(js,fjs);
    }
}(document,"script","twitter-wjs");

window.___gcfg = {lang: 'es-419'};

(function() {
    var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
    po.src = 'https://apis.google.com/js/plusone.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
})();