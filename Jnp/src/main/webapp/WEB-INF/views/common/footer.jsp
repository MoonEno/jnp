<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>

<script type="text/javascript">
/* 	$(window).bind("load", function() { 
	    
	    var footerHeight = 0,
	        footerTop = 0,
	        $footer = $("#footer");
	        
	    positionFooter();
	    
	    function positionFooter() {
	    
	             footerHeight = $footer.height();
	             footerTop = ($(window).scrollTop()+$(window).height()-footerHeight)+"px";
	    
	            if ( ($(document.body).height()+footerHeight) < $(window).height()) {
	                $footer.css({
	                     position: "absolute"
	                }).animate({
	                     top: footerTop
	                })
	            } else {
	                $footer.css({
	                     position: "static"
	                })
	            }
	    }
	
	    $(window)
	            .scroll(positionFooter)
	            .resize(positionFooter)
	            
	}); */
</script>

    <div id="wrap">
        <footer id="footer">
	        <ul>
	            <li class="mt5"><address>서울특별시 성동구 성수2가 37-1</address></li>
	            <li class="block"></li>
	            <li class="odd">대표이사 사장 : 문석호</li>
	            <li>사업자등록번호 : 104-81-37225</li>
	            <li class="block"></li>
	        </ul>
	        <div class="copyright">&copy; (주)Jnp Co. LTD. ALL RIGHTS RESERVED.</div>
	    </footer>
	</div>
