<%@tag body-content="empty" pageEncoding="UTF-8" %>

<style>
     #star_grade span{
        text-decoration: none;
        color: gray;
        cursor:pointer;
        font-size: 20px;
        font-weight: bold;
    }
    #star_grade span.on{
        color: orange;
    }
</style>

<p id="star_grade" style="margin:0;padding:0;">
      <span>★</span>
      <span>★</span>
      <span>★</span>
      <span>★</span>
      <span>★</span>
</p>

<script>
		var star_rating = 0;
		
        $('#star_grade span').click(function(){
            $(this).parent().children("span").removeClass("on");  /* 별점의 on 클래스 전부 제거 */ 
            $(this).addClass("on").prevAll("span").addClass("on"); /* 클릭한 별과, 그 앞 까지 별점에 on 클래스 추가 */
            star_rating = $(this).addClass("on").prevAll("span").length + 1;
            return false;
        });
</script>