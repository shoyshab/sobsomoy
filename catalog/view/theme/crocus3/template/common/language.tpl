<?php if (count($languages) > 1) { ?>
<div class="dropdown block-language-wrapper">
<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="language">
 
   
    <?php foreach ($languages as $language) { ?>
    <?php if ($language['code'] == $code) { ?>   
     <a href="#" title="<?php echo $language['name']; ?>" class="block-language dropdown-toggle" data-target="#" data-toggle="dropdown" role="button"> <img alt="<?php echo $language['name']; ?>" src="catalog/language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png"> <?php echo $language['name']; ?> <span class="caret"></span> </a>
    <?php } ?>
    <?php } ?>
    
    <ul class="dropdown-menu" role="menu">
      <?php foreach ($languages as $language) { ?>
      <li role="presentation">
      <a href="<?php echo $language['code']; ?>"><img src="catalog/language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" alt="<?php echo $language['name']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>
      </li>
      <?php } ?>
    </ul>
  
  <input type="hidden" name="code" value="" />
  <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
</form>
</div>
<?php } ?>