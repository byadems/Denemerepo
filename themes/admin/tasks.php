<!DOCTYPE html>
<html>
<head>
    <title>Görevler</title>
</head>
</html>
<?php include 'header.php'; ?>
<div class="container-fluid">
        <?php if( $success ): ?>
          <div class="alert alert-success "><?php echo $successText; ?></div>
        <?php endif; ?>
           <?php if( $error ): ?>
          <div class="alert alert-danger "><?php echo $errorText; ?></div>
        <?php endif; ?>
    
  <ul class="nav nav-tabs p-b">      
      <li class="pull-right custom-search">
         <form class="form-inline" action="<?=site_url("admin/tasks")?>" method="get">
            <div class="input-group">
               <input type="text" name="search" class="form-control" value="<?=$search_word?>" placeholder="Görev ara...">
               <span class="input-group-btn search-select-wrap">
                  <select class="form-control search-select" name="search_type">
                     <option value="order_id" <?php if( $search_where == "order_id" ): echo 'selected'; endif; ?> >Sipariş ID</option>
                  </select>
                  <button type="submit" class="btn btn-default"><span class="fa fa-search" aria-hidden="true"></span></button>
               </span>
            </div>
         </form>
      </li>
   </ul>
<div class="table-responsive">
   <table class="table">
      <thead>
         <tr>
         <th>Görev ID</th>
          <th>Sipariş ID</th>
          <th>Kullanıcı</th>
          <th>Servis</th>
          <th>Link</th>
          <th>Başlangıç</th>
          <th>Miktar</th>
          <th>Talep</th>
          <th>Görev Durumu</th>
          <th>Görev Tarihi</th>
          <th class="dropdown-th"></th>
         </tr>
      </thead>
      <form id="changebulkForm" action="<?php echo site_url("admin/tasks/multi-action") ?>" method="post">
        <tbody>
          <?php foreach( $orders as $order ): ?>
              <tr>
                 <td class="p-l"><?=$order["task_id"]?>
                 <div class="service-block__provider-value"><?php if($order["refill_orderid"]){ echo $order["refill_orderid"]; } ?></div></td>
                 <td><?php echo $order["order_id"] ?>
                 <div class="service-block__provider-value"><?php if($order["api_orderid"]){ echo $order["api_orderid"]; } ?></div></td>
                 <td><?php echo $order["username"]; ?></td>
				 <td><?php if( $order["service_id"]): ?> <span class="label-id"><?php echo $order["service_id"]; ?></span><?php endif; echo $order["service_name"]; ?></td>
                 <td><?php echo $order["order_url"]; ?></td>
                 <td><?php echo $order["order_start"]; ?></td>
                 <td><?php echo $order["order_quantity"]; ?></td>
                 <td><?php if($order["task_type"] == 1): echo "İptal"; elseif($order["task_type"] == 2): echo "Telafi";endif; ?></td>
                 <td><?php if($order["task_status"] == "pending"): echo "Onay Bekleniyor"; elseif($order["task_status"] == "success"): echo "Onaylandı"; elseif($order["task_status"] == "canceled"): echo "Reddedildi"; endif; ?></td>
                 <td><?php echo $order["task_date"] ?></td>

                 <td class="service-block__action">
                     <div class="dropdown pull-right">
                     <button type="button" class="btn btn-default btn-xs dropdown-toggle btn-xs-caret" data-toggle="dropdown" <?php if( $order["task_status"] !== "pending" ):  echo "disabled"; endif; ?>>İşlemler <span class="caret"></span></button>
                       <ul class="dropdown-menu">
                           <li><a href="<?=site_url("admin/tasks/no/".$order["task_id"])?>">Reddet</a></li>
                           <?php if($order["task_type"] == 2 ){ ?>
                           <li><a href="<?=site_url("admin/tasks/success/".$order["task_id"])?>">Onayla</a></li>
                           <?php }elseif($order["task_type"] == 1){ ?>
                           <li><a href="#" data-toggle="modal" data-target="#confirmChange" data-href="<?=site_url("admin/tasks/canceled/".$order["order_id"])?>">İptal ve iade et</a></li>
                           <?php } ?>
                       </ul>
                     </div>               
                 </td>
              </tr>
            <?php endforeach; ?>
        </tbody>
        <input type="hidden" name="bulkStatus" id="bulkStatus" value="0">
      </form>
   </table>
</div>
   <?php if( $paginationArr["count"] > 1 ): ?>
     <div class="row">
        <div class="col-sm-8">
           <nav>
              <ul class="pagination">
                <?php if( $paginationArr["current"] != 1 ): ?>
                 <li class="prev"><a href="<?php echo site_url("admin/tasks/1/".$status.$search_link) ?>">&laquo;</a></li>
                 <li class="prev"><a href="<?php echo site_url("admin/tasks/".$paginationArr["previous"]."/".$status.$search_link) ?>">&lsaquo;</a></li>
                 <?php
                     endif;
                     for ($page=1; $page<=$pageCount; $page++):
                       if( $page >= ($paginationArr['current']-9) and $page <= ($paginationArr['current']+9) ):
                 ?>
                 <li class="<?php if( $page == $paginationArr["current"] ): echo "active"; endif; ?> "><a href="<?php echo site_url("admin/tasks/".$page."/".$status.$search_link) ?>"><?=$page?></a></li>
                 <?php endif; endfor;
                       if( $paginationArr["current"] != $paginationArr["count"] ):
                 ?>
                 <li class="next"><a href="<?php echo site_url("admin/tasks/".$paginationArr["next"]."/".$status.$search_link) ?>" data-page="1">&rsaquo;</a></li>
                 <li class="next"><a href="<?php echo site_url("admin/tasks/".$paginationArr["count"]."/".$status.$search_link) ?>" data-page="1">&raquo;</a></li>
                 <?php endif; ?>
              </ul>
           </nav>
        </div>
     </div>
   <?php endif; ?>
</div>
<div class="modal modal-center fade" id="confirmChange" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" data-backdrop="static">
   <div class="modal-dialog modal-dialog-center" role="document">
      <div class="modal-content">
         <div class="modal-body text-center">
            <h4>İptal Onayı</h4>
            <h5>Siparişi iptal ederseniz sipariş iptal olacak ve sipariş ücreti müşterinize iade edilecektir.</h5>
            <div align="center">
               <a class="btn btn-primary" href="" id="confirmYes">Onayla</a>
               <button type="button" class="btn btn-default" data-dismiss="modal">Hayır</button>
            </div>
         </div>
      </div>
   </div>
</div>

<?php include 'footer.php'; ?>
