<div id="cart">
  <div data-hover="dropdown" class="basket dropdown-toggle"> <a href="<?php echo $cart ?>"> <span class="cart_count"><?php echo $text_count; ?></span> <span class="price hidden-xs"><?php echo $cart_heading; ?> / <?php echo $text_total; ?></span> </a> </div>  
  <input id="cart-txt-heading" type="hidden" name="cart-txt-heading" value="<?php echo $cart_heading; ?> ">
  <ul class="dropdown-menu pull-right top-cart-content arrow_box">
    <?php if ($products || $vouchers) { ?>
    <li>
      <div class="shopping-cart-list">
      <table class="table">
        <?php foreach ($products as $product) { ?>
        <tr>
          <td class="text-center"><?php if ($product['thumb']) { ?>
            <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-thumbnail" /></a>
            <?php } ?></td>
          <td class="text-left"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
            <?php if ($product['option']) { ?>
            <?php foreach ($product['option'] as $option) { ?>
            <br />
            - <small><?php echo $option['name']; ?> <?php echo $option['value']; ?></small>
            <?php } ?>
            <?php } ?>
            <?php if ($product['recurring']) { ?>
            <br />
            - <small><?php echo $text_recurring; ?> <?php echo $product['recurring']; ?></small>
            <?php } ?></td>
          <td class="text-right">x <?php echo $product['quantity']; ?></td>
          <td class="text-right"><?php echo $product['total']; ?></td>
          <td class="text-center"><button type="button" onclick="cart.remove('<?php echo $product['cart_id']; ?>');" title="<?php echo $button_remove; ?>" class="btn btn-danger btn-xs"><i class="fa fa-times"></i></button></td>
        </tr>
        <?php } ?>
        <?php foreach ($vouchers as $voucher) { ?>
        <tr>
          <td class="text-center"></td>
          <td class="text-left"><?php echo $voucher['description']; ?></td>
          <td class="text-right">x&nbsp;1</td>
          <td class="text-right"><?php echo $voucher['amount']; ?></td>
          <td class="text-center text-danger"><button type="button" onclick="voucher.remove('<?php echo $voucher['key']; ?>');" title="<?php echo $button_remove; ?>" class="btn btn-danger btn-xs"><i class="fa fa-times"></i></button></td>
        </tr>
        <?php } ?>
      </table>
    </div>
    </li>
    <li>
      <div>
        <table class="table table-bordered">
          <?php foreach ($totals as $total) { ?>
          <tr>
            <td class="text-right"><strong><?php echo $total['title']; ?></strong></td>
            <td class="text-right"><?php echo $total['text']; ?></td>
          </tr>
          <?php } ?>
        </table>
         <div class="checkout actions">
          <a href="<?php echo $checkout; ?>" class="btn-checkout"><?php echo $text_checkout; ?></a>
          <a href="<?php echo $cart; ?>" class="view-cart"><?php echo $text_cart; ?></a>          
        </div>
      </div>
    </li>
    <?php } else { ?>
    <li>
      <p class="text-center noitem"><?php echo $text_empty; ?></p>
    </li>
    <?php } ?>
  </ul>
</div>
