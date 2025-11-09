<?php include 'header.php'; ?>
<div class="container-fluid">
            <?php if( $success ): ?>
          <div class="alert alert-success "><?php echo $successText; ?></div>
        <?php endif; ?>
           <?php if( $error ): ?>
          <div class="alert alert-danger "><?php echo $errorText; ?></div>
        <?php endif; ?>
   <ul class="nav nav-tabs p-b">
     <li class="<?php if( $status == "all"): echo "active"; endif; ?>"><a href="<?=site_url("admin/orders")?>">Tüm Siparişler</a></li>
     <li class="<?php if( $status == "cronpending"): echo "active"; endif; ?>"><a href="<?=site_url("admin/orders/1/cronpending")?>">Bekleniyor <span class="badge" style="background-color: #808080"><?php if($cronpendingcount): echo $cronpendingcount; endif; ?></span></a></li>
     <li class="<?php if( $status == "pending"): echo "active"; endif; ?>"><a href="<?=site_url("admin/orders/1/pending")?>">Sipariş Alındı</a></li>
               <li class="<?php if( $status == "processing"): echo "active"; endif; ?>"><a href="<?=site_url("admin/orders/1/processing")?>">Gönderim Sırasında</a></li>
     <li class="<?php if( $status == "inprogress"): echo "active"; endif; ?>"><a href="<?=site_url("admin/orders/1/inprogress")?>">Yükleniyor</a></li>
     <li class="<?php if( $status == "completed"): echo "active"; endif; ?>"><a href="<?=site_url("admin/orders/1/completed")?>">Tamamlandı</a></li>
     <li class="<?php if( $status == "partial"): echo "active"; endif; ?>"><a href="<?=site_url("admin/orders/1/partial")?>">Kısmen Tamamlandı, Eksik İade Edildi.</a></li>
     <li class="<?php if( $status == "canceled"): echo "active"; endif; ?>"><a href="<?=site_url("admin/orders/1/canceled")?>">İptal edildi</a></li>

     <li class="<?php if( $status == "fail"): echo "active"; endif; ?>"><a href="<?=site_url("admin/orders/1/fail")?>">Başarısız <span class="badge" style="background-color: #8b3a3a"><?php if($failCount): echo $failCount; endif; ?></span></a></li>
      <li class="pull-right custom-search">
         <form class="form-inline" action="<?=site_url("admin/orders")?>" method="get">
            <div class="input-group">
               <input type="text" name="search" class="form-control" value="<?=$search_word?>" placeholder="Siparişleri ara...">
               <span class="input-group-btn search-select-wrap">
                  <select class="form-control search-select" name="search_type">
                     <option value="order_id" <?php if( $search_where == "order_id" ): echo 'selected'; endif; ?> >ID</option>
                     <option value="order_url" <?php if( $search_where == "order_url" ): echo 'selected'; endif; ?> >Bağlantı</option>
                     <option value="username" <?php if( $search_where == "username" ): echo 'selected'; endif; ?> >Kullanıcı Adı</option>
                  </select>
                  <button type="submit" class="btn btn-default"><span class="fa fa-search" aria-hidden="true"></span></button>
               </span>
            </div>
         </form>
      </li>
   </ul>
		<div class="table-responsive">
        <table class="table order-table table-grey">
      <thead>
         <tr>
            <th class="checkAll-th">
               <div class="checkAll-holder">
                  <input type="checkbox" id="checkAll">
                  <input type="hidden" id="checkAllText" value="order">
               </div>
               <div class="action-block">
                  <ul class="action-list">
                     <li><span class="countOrders"></span> sipariş seçili</li>
                     <li>
                        <div class="dropdown">
                           <button type="button" class="btn btn-default btn-xs dropdown-toggle btn-xs-caret" data-toggle="dropdown"> toplu işlemler <span class="caret"></span></button>
                           <ul class="dropdown-menu">
                              <li>
                                 <?php if( $status  ==  "inprogress"  || $status  ==  "processing"  ): ?>
                                 <a class="bulkorder" data-type="pending">Sipariş Alındı</a>
                                 <?php endif; ?>
                                 <?php if( $status  ==  "pending"  || $status  ==  "processing"  ): ?>
                                 <a class="bulkorder" data-type="inprogress">Yükleniyor</a>
                                 <?php endif; ?>
                                 <?php if( $status  ==  "pending" || $status  ==  "inprogress"  || $status  ==  "processing" ||  $status  ==  "fail" ): ?>
                                 <a class="bulkorder" data-type="completed">Tamamlandı</a>
                                 <?php endif; ?>
                                 <?php if( $status  ==  "all" ||status  ==  "pending" || $status  ==  "inprogress"  || $status  ==  "completed"  || $status  ==  "processing" || $status  ==  "partial" || $status  ==  "fail" ): ?>
                                 <a class="bulkorder" data-type="canceled">İptal ve İade Et</a>
                                 <?php endif; ?>
                                 <?php if( $status  ==  "fail" ): ?>
                                 <a class="bulkorder" data-type="resend"> Yeniden Gönder</a>
                                <?php endif; ?>
                              </li>
                           </ul>
                        </div>
                     </li>
                  </ul>
               </div>
            </th>
            <th>ID</th>
            <th>Kullanıcı adı</th>
            <th>Ücret</th>
            <th>Bağlantı</th>
            <th>Başlangıç</th>
            <th>Miktar</th>
            <th class="dropdown-th">
              <div class="dropdown">
                <button class="btn btn-th btn-default dropdown-toggle" data-active="<?=$_GET["service_id"]?>" type="button" id="serviceList" data-href="admin/orders/counter" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  Servis
                  <span class="caret"></span>
                </button>
                <ul class="dropdown-menu" aria-labelledby="dropdownMenu1" id="serviceListContent" style="max-height: 275px; overflow:hidden; overflow-y: scroll">
                </ul>
              </div>
            </th>
            <th>Sipariş Durumu</th>
            <th>Kalan</th>
            <th>Sipariş Tarihi</th>
            <th width="10%" class="dropdown-th">
              <div class="dropdown">
                <button class="btn btn-th btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  Mod
                  <span class="caret"></span>
                </button>
                <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                    <li class="<?php if( !$_GET["mode"] ): echo "active"; endif; ?>"><a href="<?=site_url("admin/orders/1/".$status)?>">Tümü</a></li>
                    <li class="<?php if( $_GET["mode"] == "manuel" ): echo "active"; endif; ?>"><a href="<?=site_url("admin/orders/1/".$status)?>?mode=manuel">Manuel</a></li>
                    <li class="<?php if( $_GET["mode"] == "auto" ): echo "active"; endif; ?>"><a href="<?=site_url("admin/orders/1/".$status)?>?mode=auto">Otomatik</a></li>
                </ul>
              </div>
            </th>
            <th></th>
         </tr>
      </thead>
      <form id="changebulkForm" action="<?php echo site_url("admin/orders/multi-action") ?>" method="post">
        <tbody>
          <?php foreach( $orders as $order ): ?>
              <tr>
                 <td><input type="checkbox" <?php if( $status == "canceled" ): echo "disabled"; else: echo 'class="selectOrder"'; endif; ?> name="order[<?php echo $order["order_id"] ?>]" value="1" style="border:1px solid #fff"></td>
                 <td class="p-l">
                  <?php echo $order["order_id"] ?>
                  <?php if( $order["api_orderid"] != 0 ): echo '<div class="service-block__provider-value">'.$order["api_orderid"].'</div>'; endif; ?>
                </td>
                 <td><?php echo $order["username"]; if( $order["order_where"] == "api" ): echo ' <span class="label label-api">API</span>'; endif; ?> </td>
                 <td class="service-block__minorder">
                   <div>
                     <?php echo $order["order_charge"]; ?>
                   </div>
                   <?php if( $order["service_api"] != 0 ): echo '<div class="service-block__provider-value">'.$order["order_profit"].'</div>'; endif; ?>

                 </td>
				<td>
					<div style="max-width: 450px; overflow: hidden; word-wrap: break-word; white-space: normal;">
 				   <?php echo $order["order_url"]; ?>
					</div>
  				  <?php
   				 if (!empty($order["order_extras"]) && $order["order_extras"] != "[]") {
        echo '<a href="#" class="btn btn-default btn-xs" data-toggle="modal" data-target="#modalDiv" data-action="order_comment" data-id="' . $order["order_id"] . '">Yorumlar</a>';
   				 }
  				  ?>
				</td>

                 <td><?php echo $order["order_start"]; ?></td>
                 <td><?php echo $order["order_quantity"]; ?></td>
                 <td><?php if( $order["service_id"]): ?> <span class="label-id"><?php echo $order["service_id"]; ?></span><?php endif; echo $order["service_name"]; ?></td>
                 <td><?php echo  orderStatu($order["order_status"],$order["order_error"],$order["order_detail"]); ?></td>
                 <td><?php if( $order["order_status"] == "completed" && substr($order["order_remains"], 0,1) == "-" ): echo "+".substr($order["order_remains"], 1);  else: echo $order["order_remains"]; endif; ?></td>
                 <td><?php echo $order["order_create"]; ?></td>
                 <td><?php if( $order["api_service"] == 0 ): echo "Manuel"; else: echo "Otomatik"; endif; ?></td>
                 <td class="service-block__action">
                   <div class="dropdown pull-right">
                     <button type="button" class="btn btn-default btn-xs dropdown-toggle btn-xs-caret" data-toggle="dropdown">İşlemler <span class="caret"></span></button>
                     <ul class="dropdown-menu">
                       <?php if( $order["order_error"] != "-" && $order["service_api"] != 0 ): ?>
                         <li><a href="#"  data-toggle="modal" data-target="#modalDiv" data-action="order_errors" data-id="<?php echo $order["order_id"] ?>">Hata Detayı</a></li>
                         <li><a href="<?=site_url("admin/orders/order_resend/".$order["order_id"])?>">Yeniden Gönder</a></li>
                       <?php endif; ?>
                       <?php if( $order["order_error"] == "-" && $order["service_api"] != 0 ): ?>
                         <li><a href="#"  data-toggle="modal" data-target="#modalDiv" data-action="order_details" data-id="<?php echo $order["order_id"] ?>">Sipariş Detayı</a></li>
                       <?php endif; ?>
                       <?php if( $order["service_api"] == 0 || $order["order_error"] != "-"  ): ?>
                         <li><a href="#"  data-toggle="modal" data-target="#modalDiv" data-action="order_orderurl" data-id="<?php echo $order["order_id"] ?>">Sipariş Bağlantısını Düzenle</a></li>
                       <?php endif; ?>
                       <?php if( $order["service_api"] == 0): ?>
                         <li><a href="#"  data-toggle="modal" data-target="#modalDiv" data-action="order_startcount" data-id="<?php echo $order["order_id"] ?>">Başlangıç Miktarını Düzenle</a></li>
                       <?php endif; ?>
                       <?php if( $order["order_status"] != "partial"): ?>
                         <li><a href="#"  data-toggle="modal" data-target="#modalDiv" data-action="order_partial" data-id="<?php echo $order["order_id"] ?>">Kalan Miktarı Düzenle</a></li>
                       <?php endif; ?>
                       <li class="dropdown dropdown-submenu">
                          <a  class="dropdown_menu">Sipariş Durumunu Değiştir</a>
                          <ul class="dropdown-menu submenu_drop">
                            <?php if( $order["order_status"]  ==  "pending" || $order["order_status"]  ==  "inprogress" || $order["order_status"]  ==  "completed"  || $order["order_status"]  ==  "processing" || $order["order_status"]  ==  "partial" || $order["order_status"]  ==  "fail" ): ?>
                              <li><a href="#" data-toggle="modal" data-target="#confirmChange" data-href="<?=site_url("admin/orders/order_cancel/".$order["order_id"])?>">İptal ve İade Et</a></li>
                            <?php endif; ?>
                            <?php if( $order["order_status"]  ==  "pending" || $order["order_status"]  ==  "inprogress"  || $order["order_status"]  ==  "processing" || $order["order_status"]  ==  "fail" ): ?>
                              <li><a href="#" data-toggle="modal" data-target="#confirmChange" data-href="<?=site_url("admin/orders/order_complete/".$order["order_id"])?>">Tamamlandı</a></li>
                            <?php endif; ?>
                            <?php if( $order["order_status"]  ==  "pending"  || $order["order_status"]  ==  "processing"  ): ?>
                              <li><a href="#" data-toggle="modal" data-target="#confirmChange" data-href="<?=site_url("admin/orders/order_inprogress/".$order["order_id"])?>">Yükleniyor</a></li>
                            <?php endif; ?>
                          </ul>
                        </li>
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
                 <li class="prev"><a href="<?php echo site_url("admin/orders/1/".$status.$search_link) ?>">&laquo;</a></li>
                 <li class="prev"><a href="<?php echo site_url("admin/orders/".$paginationArr["previous"]."/".$status.$search_link) ?>">&lsaquo;</a></li>
                 <?php
                     endif;
                     for ($page=1; $page<=$pageCount; $page++):
                       if( $page >= ($paginationArr['current']-9) and $page <= ($paginationArr['current']+9) ):
                 ?>
                 <li class="<?php if( $page == $paginationArr["current"] ): echo "active"; endif; ?> "><a href="<?php echo site_url("admin/orders/".$page."/".$status.$search_link) ?>"><?=$page?></a></li>
                 <?php endif; endfor;
                       if( $paginationArr["current"] != $paginationArr["count"] ):
                 ?>
                 <li class="next"><a href="<?php echo site_url("admin/orders/".$paginationArr["next"]."/".$status.$search_link) ?>" data-page="1">&rsaquo;</a></li>
                 <li class="next"><a href="<?php echo site_url("admin/orders/".$paginationArr["count"]."/".$status.$search_link) ?>" data-page="1">&raquo;</a></li>
                 <?php endif; ?>
              </ul>
           </nav>
        </div>
        <div class="col-sm-4 pagination-counters">
          <?php echo $count; ?> from orders <?php echo $where+1 ?>'from the <?php if( $where+$to > $count ): echo $count; else: echo $where+$to; endif; ?>up to
         </div>
     </div>
   <?php endif; ?>
</div>
<div class="modal modal-center fade" id="confirmChange" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" data-backdrop="static">
   <div class="modal-dialog modal-dialog-center" role="document">
      <div class="modal-content">
         <div class="modal-body text-center">
            <h4>İşlemi onaylıyor musunuz?</h4>
            <div align="center">
               <a class="btn btn-primary" href="" id="confirmYes">Evet</a>
               <button type="button" class="btn btn-default" data-dismiss="modal">Hayır</button>
            </div>
         </div>
      </div>
   </div>
</div>

<?php include 'footer.php'; ?>
