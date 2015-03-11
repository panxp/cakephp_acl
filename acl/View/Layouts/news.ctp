<!DOCTYPE html>
<html>
<head>
	<?php echo $this->Html->charset(); ?>
	<title>
		
	</title>
	
</head>
<body>
	<div id="container">
		<div id="header">
			<h1>头部</h1>
		</div>
		<div id="content">
 <div class="main">
                <?php echo $this->fetch('content'); ?>
            </div>
			
		</div>
		<div id="footer">
			
		</div>
	</div>
	
</body>
</html>
