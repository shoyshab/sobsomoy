<?php echo $header;?>
<div class="breadcrumbs">
    <div class="container">
      <div class="row">
        <div class="col-xs-12">
          <ul>
            <?php $b_i=0; $b_cnt=count($breadcrumbs); foreach ($breadcrumbs as $breadcrumb) { ?>
            <li><?php if($b_i!=0) {?><span>/</span><?php } ?>
              <?php if($b_i==($b_cnt-1)){ ?>
              <strong><?php echo $breadcrumb['text']; ?></strong><?php } 
              else { ?>
              <a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
              <?php }?>
            </li>
            <?php $b_i++ ;} ?>

          </ul>
        </div>
      </div>
    </div>
</div>
<section class="main-container col2-left-layout bounceInUp animated">
<div class="main container">
  <div class="row">
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9 col-sm-push-3'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>">
      <?php echo $content_top; ?>
      <article class="col-main">
        <?php if ($products) { ?>
          <div class="catalog-product-info"> 
           <h2 class="page-heading"> <span class="page-heading-title"><?php echo $heading_title; ?></span> </h2>
            <div class="display-product-option">
                  <div class="toolbar"> 
                    <div id="sort-by">
                      <label class="left"><?php echo $text_sort; ?></label>
                      <select id="input-sort" class="form-control" onchange="location = this.value;">
                        <?php foreach ($sorts as $sorts) { ?>
                        <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
                        <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
                        <?php } else { ?>
                        <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
                        <?php } ?>
                        <?php } ?>
                      </select>
                    </div>
                    <div class="pager">
                      <div id="limiter">
                        <label><?php echo $text_limit; ?></label>
                        <select id="input-limit" class="form-control" onchange="location = this.value;">
                        <?php foreach ($limits as $limits) { ?>
                        <?php if ($limits['value'] == $limit) { ?>
                        <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
                        <?php } else { ?>
                        <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
                        <?php } ?>
                        <?php } ?>
                      </select>
                      </div>
                    </div>
                    <div class="sorter">
                      <div class="view-mode">
                        <a href="<?php echo $compare; ?>" id="compare-total"><?php echo $text_compare; ?></a>
                        <button type="button" id="grid-view" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_grid; ?>"><i class="fa fa-th"></i></button>
                        <button type="button" id="list-view" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_list; ?>"><i class="fa fa-th-list"></i></button>   
                      </div>
                    </div>
                  </div><!-- toolbar -->
            </div>
          </div>
          <?php  if ($categories) { ?>
              <div class="category-list">
              <h3><?php echo $text_refine; ?></h3>
              <?php //if (count($categories) <= 5) { ?>
              <div class="row">
              <div class="col-sm-12 category-list">
              <ul>
              <?php foreach ($categories as $category) { ?>
              <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
              <?php } ?>
              </ul>
              </div>
              </div>
              <?php /*} else { ?>
              <div class="row">
              <?php foreach (array_chunk($categories, ceil(count($categories) / 4)) as $categories) { ?>
              <div class="col-sm-3">
              <ul>
              <?php foreach ($categories as $category) { ?>
              <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
              <?php } ?>
              </ul>
              </div>
              <?php } ?>
              </div>
              <?php } */ ?> 
          </div>
          <?php }  ?>
          <div class="category-products">
          <div class="pro_row products-list">
            <?php foreach ($products as $product) { ?>
              <div class="product-layout product-list col-xs-12">
              <div class="product-thumb col-item"> 
              <div class="item-inner">
                    <div class="item-img">
                        <div class="item-img-info">
                          <a class="product-image" href="<?php echo $product['href']; ?>" title="<?php echo $product['name']; ?>">
                          <?php if ($product['thumb']) { ?>
                          <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>"/>
                          <?php } ?>
                          </a>
                          <?php if($thmsoftcrocus_sale_label==1) { 
                          if ($product['price'] && $product['special']) { ?>
                          <div class="sale-label sale-top-right"><?php echo $thmsoftcrocus_sale_labeltitle; ?></div>
                          <?php } }?>
                          <div class="box-hover">
                            <ul class="add-to-links">
                            <?php if($thmsoftcrocus_quickview_button== 1) { ?>
                            <li>
                            <a href="index.php?route=product/quickview&amp;product_id=<?php echo $product['product_id']; ?>;" class="link-quickview" data-name="<?php echo $product['name']; ?>"><?php echo $text_quickview; ?></a>
                            </li>
                            <?php  } ?> 
                            <li>
                            <a onclick="wishlist.add('<?php echo $product['product_id']; ?>');" class="link-wishlist"><?php echo $text_wishlist; ?></a> 
                            </li>
                            <li>
                            <a class="link-compare"  onclick="compare.add('<?php echo $product['product_id']; ?>');"><?php echo $button_compare; ?></a>
                            </li>

                            </ul>
                          </div>

                        </div>
                    </div>
                    <div class="item-info">
                        <div class="info-inner">
                            <div class="item-title"> 
                            <a title="<?php echo $product['name']; ?>" href="<?php echo $product['href']; ?>">
                            <?php echo $pro_name = (strlen($product['name'])>25) ? substr($product['name'], 0,25).'...' : $product['name']; ?>
                            </a>
                            </div>
                            <?php //if ($product['rating']) { ?>
                            <div class="rating">
                            <div class="ratings">
                            <div class="rating-box">
                            <?php for ($i = 1; $i <= 5; $i++) { ?>
                            <?php if ($product['rating'] < $i) { ?>
                            <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
                            <?php } else { ?>
                            <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
                            <?php } ?>
                            <?php } ?>
                            </div>
                            </div>
                            </div><!-- rating -->
                            <?php // }?>
                            <div class="desc std"><p><?php echo $product['description']; ?></p></div>
                            <div class="item-content">

                            <?php if ($product['price']) { ?>
                            <div class="item-price">
                            <div class="price-box"> 
                            <?php if (!$product['special']) { ?>
                            <p class="regular-price"><span class="price"><?php echo $product['price']; ?></span></p> 
                            <?php } else { ?> 
                            <p class="old-price"><span class="price"><?php echo $product['price']; ?></span></p>
                            <p class="special-price"><span class="price"><?php echo $product['special']; ?></span></p>                           
                            <?php } ?>
                            </div>
                            </div>
                            <?php } ?>
                            <div class="action">
                            <button type="button" title="" data-original-title="<?php echo $button_cart; ?>" class="button btn-cart link-cart" onclick="cart.add('<?php echo $product['product_id']; ?>');"><span><?php echo $button_cart; ?></span></button>
                            </div>
                            </div>

                        </div>
                    </div>  <!-- End Item info --> 
              </div>  <!-- End  Item inner--> 
              </div>
              </div><!-- item product-layout product-list col-xs-12 -->
            <?php } ?>
          </div>
          </div>
          <div class="row">
            <div class="bottom_pagination">
              <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
              <div class="col-sm-6 text-right"><?php echo $results; ?></div>
            </div>
          </div>
      <?php } ?>
      </article>
      <?php if (!$categories && !$products) { ?>
      <p><?php echo $text_empty; ?></p>
      <div class="buttons">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
      <?php } ?>
     
     </div>
     <?php echo $column_left; ?>
     <?php echo $column_right; ?>
   </div>
</div>
<?php echo $content_bottom; ?>
</section>
<?php echo $footer; ?>
