function templateAddEvent(eventObj, event, eventHandler) {
    if (eventObj.addEventListener) {
        eventObj.addEventListener(event, eventHandler, false);
    }
    else if (eventObj.attachEvent) {
        eventObj.attachEvent('on' + event, eventHandler);       // Damn you, IE!
    }
}

templateAddEvent(window, 'load', function() {
   var hdr = document.getElementById('header');
   if (hdr) {
     hdr.innerHTML = '									 \
<span class="header-section"> <a href="index.html">Synthesis Reference</a></span>	 \
<span class="header-section">Search</span>						 \
<form action="http://www.google.com/cse" id="cse-search-box" target="_blank">		 \
  <div>											 \
    <input type="hidden" name="cx" value="partner-pub-9602515187140322:kluf88ymdt1" />   \
    <input type="hidden" name="ie" value="ISO-8859-1" />				 \
    <input type="text" name="q" size="31" />						 \
    <input type="submit" name="sa" value="Search" />					 \
  </div>										 \
</form>											 \
<script type="text/javascript" src="http://www.google.com/cse/brand?form=cse-search-box&amp;lang=en"></script>';
   }
});
