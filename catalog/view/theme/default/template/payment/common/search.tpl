<div id="search" class="input-group">
  <input type="text" name="search" value="<?php echo $search; ?>" id="seacrchHeader" placeholder="<?php echo $text_search; ?>" class="form-control input-lg" /> 
  <span class="input-group-btn">
    <button type="button" class="btn btn-default btn-lg" id="searchButton"><i class="fa fa-search"></i></button>
  </span>
  <div class="serchId" id="serchId"> <ul id="Hajaxtargetresult" class="Hajaxtargetresult" style="display: none"></ul> </div>
</div>

<script>
 $('dcoumnent').ready(function(){ 
 	$('#seacrchHeader').keyup(function(){
 		var search = this.value.trim(); 	
 		 if(search){  
        $("#Hajaxtargetresult").show();
 			$.ajax({
 				type : 'POST',
 				url :  '<?php echo $actionSearch; ?>/searchProduct',
 				data :  'searchProduct='+search, 
 				beforeSend : function(){$("#Hajaxtargetresult").html('<img loading="lazy" decoding="async"src="image/loader.gif" class="" id="" />');},
 				success : function (rslt){ console.log(rslt);
					var obj = jQuery.parseJSON(rslt);  
		              var suggestions = '';
		              $.each(obj, function(key,value) { 
		                suggestions += '<li class="Hselectli" data-cust-name="'+value.name+'" data-cust-href="'+value.href+'" >'+value.name+'</li>';
		              }); 
		              $("#Hajaxtargetresult").html(suggestions);
 				}
 			}); 
 		}else{
 			$("#Hajaxtargetresult").empty().hide();
 		}
 	});

 });
  $(document).on("click", '.Hselectli', function(event) 
      {
        /*var name = $(this).attr("data-cust-name");
        $("#seacrchHeader").val(name);
         $('#searchButton').trigger('click'); 
        $("#Hajaxtargetresult").empty().hide();*/
        location.href=$(this).attr('data-cust-href');
      }); //  selectli click ends
</script>


<style>
#serchId{ 
    z-index: 100;
  width: 285px;
    position: fixed;
    top: 75px;
    right: 28%;
    background: #fff;    max-height: 200px;
    overflow-y: scroll;}
    .Hselectli{cursor:pointer;}
</style> 
<!--<div class="searchtag">Popular: Top 100, Mother's Day Gifts, Wedding Gifts, Personalised Gifts.</div> -->
