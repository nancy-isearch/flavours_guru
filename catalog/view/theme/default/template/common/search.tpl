<div id="search" class="input-group">
  <input type="text" name="search" value="<?php echo str_replace('-', ' ', $search); ?>" itemprop="query-input" id="seacrchHeader" placeholder="<?php echo $text_search; ?>" class="form-control input-lg" /> 
  <span class="input-group-btn">
    <button type="button" class="btn btn-default btn-lg" id="searchButton"><i class="fa fa-search"></i></button>
  </span>
  <div class="serchId" id="serchId"> <ul id="Hajaxtargetresult" class="Hajaxtargetresult" style="display: none"></ul> </div>
</div>

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
