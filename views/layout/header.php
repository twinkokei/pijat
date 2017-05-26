<?php
if(!$_SESSION['login']){
    header("location: ../login.php");
}
?>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Zee Holistic</title>
        <link rel="icon" href="../img/new/favicon.ico" type="image/x-icon" />
        <link rel="shortcut icon" href="../img/new/favicon.ico" type="image/x-icon" />

        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <!-- bootstrap 3.0.2 -->
        <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- font Awesome -->
        <link href="../css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <!-- Ionicons -->
        <link href="../css/ionicons.min.css" rel="stylesheet" type="text/css" />
        <!-- DATA TABLES -->
        <link href="../css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
        <!-- Theme style -->
        <link href="../css/AdminLTE.css" rel="stylesheet" type="text/css" />
        <!-- Preview -->
        <link href="../css/preview.css" type="text/css" rel="stylesheet" >
         <!-- iCheck for checkboxes and radio inputs
        <link href="../css/iCheck/all.css" rel="stylesheet" type="text/css" />-->
         <!-- daterange picker -->
        <link href="../css/daterangepicker/daterangepicker-bs3.css" rel="stylesheet" type="text/css" />
        <!-- Bootstrap time Picker -->
        <link href="../css/timepicker/bootstrap-timepicker.min.css" rel="stylesheet"/>
        <!-- datepicker -->
       <link href="../css/datepicker/datepicker.css" rel="stylesheet">
       <!-- lookup -->
       <link rel="stylesheet" type="text/css" href="../css/lookup/bootstrap-select.css">
       <!-- Button -->
	     <link rel="stylesheet" type="text/css" href="../css/button/component.css" />
       <!-- tooptip meja -->
       <link rel="stylesheet" type="text/css" href="../css/tooltip/tooltip-classic.css" />
       <!-- menu food -->
       <link href="../css/menu/menu.css" rel="stylesheet">
       <!-- popmodal -->
       <link type="text/css" rel="stylesheet" href="../css/popmodal/popModal.css">
       <!-- export -->
       <link href="../css/export/buttons.dataTables.min.css" rel="stylesheet">
       <!-- responsive -->
	     <link href="../css/responsive/layout.css" rel="stylesheet">
       <?php
       $q_img = mysql_query("select office_img as result from office");
       $r_img = mysql_fetch_array($q_img);
       $img   = $r_img['result'];
       $path  = "../img/office/";
       ?>
        <script src="../js/chart/Chart.js" type="text/javascript"></script>
        <script src="../js/jquery.js"></script>
        <script type="text/javascript">

        $(function(){
        $('a#logout').click(function(){
            if(confirm('Are you sure to logout')) {
                return true;
                }
                return false;
            });
        });

        </script>
    </head>
    <body class="skin-blue">
        <!-- header logo: style can be found in header.less -->
        <header class="header">
            <a href="../index.php" class="logo" style="background:url('<?= $path.$img?>'); background-repeat: no-repeat; background-position: center;  background-color: rgba(97, 41, 95, 0.32);border-color: #361563;"></a>
            <!-- Header Navbar: style can be found in header.less -->

            <nav class="navbar navbar-static-top" role="navigation">
                <!-- Sidebar toggle button-->
                <a href="#" class="navbar-btn sidebar-toggle" data-toggle="offcanvas" role="button">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </a>

                <div class="navbar-right">
                    <ul class="nav navbar-nav">

                    <!-- Notifications: style can be found in dropdown.less -->
                    <? if($_SESSION['user_type_id'] == 1 || $_SESSION['user_type_id'] == 2){?>
                        <li class="dropdown notifications-menu">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="fa fa-bell"></i>
                                <span class="label label-warning"><?= count_transaction_delete(); ?></span>
                            </a>
                            <ul class="dropdown-menu">
                                <li class="header"><a href="../controllers/transaction_detail.php?page=list">Transaksi Terhapus : <?= count_transaction_delete(); ?></a></li>
                                <li>
                                    <!-- inner menu: contains the actual data -->
                                    <ul class="menu">

                                        <table id="" class="table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <th>Code</th>
                                                <th>User Delete</th>
                                                <th>Total Transaksi</th>

                                            </tr>
                                        </thead>
                                        <?php
                                        $query_transaction_delete = select_transaction_delete();
                                           while($row_transaction_delete = mysql_fetch_array($query_transaction_delete)){
                                            ?>
                                            <tr>

                                               <td><a href="../controllers/transaction_detail.php?page=form&id=<?=$row_transaction_delete['transaction_id']?>"><?= $row_transaction_delete['transaction_code'] ?></a></td>
                                                <td><?= $row_transaction_delete['user_name']?></td>
                                                <td><?= $row_transaction_delete['transaction_grand_total']?></td>

                                                </tr>
                                            <?php

                                            }
                                            ?>

                                    </table>

                                    </ul>
                                </li>

                            </ul>
                        </li>

                        <? }?>

                        <li class="dropdown notifications-menu">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="fa fa-warning"></i>
                                <!-- <span class="label label-warning"><?= count_stock_limit(); ?></span> -->
                            </a>
                            <ul class="dropdown-menu">
                                <li class="header">Stok limit : <?= count_stock_limit(); ?></li>
                                <li>
                                    <!-- inner menu: contains the actual data -->
                                    <ul class="menu">

                                        <table id="" class="table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                            	<th>Item</th>
                                            	<th>Stok</th>
                                                <th>Cabang</th>

                                            </tr>
                                        </thead>
                                        <?php
                                        $query_stock_limit = select_stock_limit();
                                           while($row_stock_limit = mysql_fetch_array($query_stock_limit)){
                                            ?>
                                            <tr>
                                            <?php

//                                                echo $row_stock_limit['item_name'];
//                                                echo $row_stock_limit['item_stock_qty'];
//                                                echo $row_stock_limit['unit_name'];
                                            ?>
                                               <td><?= $row_stock_limit['item_name']; ?></td>
                                                <td><?= $row_stock_limit['item_stock_qty']."(".$row_stock_limit['unit_name'].")"?></td>
                                                <td><?= $row_stock_limit['branch_name']?></td>

                                                </tr>
                                            <?php

                                            }
                                            ?>

                                    </table>

                                    </ul>
                                </li>

                            </ul>
                        </li>


                        <!-- User Account: style can be found in dropdown.less -->
                        <li class="dropdown user user-menu">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="glyphicon glyphicon-user"></i>
                                <span>
                                    <?php
                                        $user_data = get_user_data();
                                        echo $user_data[0];
                                    ?>
                                     <i class="caret"></i></span>
                            </a>
                            <ul class="dropdown-menu">
                                <!-- User image -->
                                <li class="user-header bg-new-red">
                                <?php

                            if($user_data[2]==""){
                                $img = "../img/user/business_user.png";
                            }else{
                                $img = "../img/user/".$user_data[2];
                            }
                            ?>
                                    <img src="<?= $img ?>" class="img-circle" alt="User Image" />
                                    <p>
                                        <?php

                                        echo $user_data[0];
                                        ?>
                                        <small><?php

                                        echo $user_data[1];
                                        ?></small>
                                    </p>
                                </li>

                                <!-- Menu Footer-->
                                <li class="user-footer">
                                    <div class="pull-left">
                                        <a href="edit_admin.php?page=form" class="btn btn-default btn-flat"  style="height:40px !important; padding-top:10px !important">Profile</a>
                                    </div>
                                    <div class="pull-right">
                                        <a href="logout.php" class="btn btn-default btn-flat" style="height:40px !important; padding-top:10px !important" id="logout">Sign out</a>
                                    </div>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>

            </nav>
        </header>
        <div class="wrapper row-offcanvas row-offcanvas-left">
            <!-- Left side column. contains the logo and sidebar -->
            <?php
                include("../views/layout/left_side.php");
            ?>

            <!-- Right side column. Contains the navbar and content of the page -->
            <aside class="right-side <?php /*if($_SESSION['menu_active'] == 3){ ?>strech<?php }*/ ?>">
                <!-- Content Header (Page header) -->

				<script type="text/javascript">

					$(document).ready(function() {

						var container = $('div.alert.alert-danger-1');

						// validate the form when it is submitted
						var validator = $("#createForm").validate({
							errorContainer: container,
							errorLabelContainer: $("ol", container),
							wrapper: 'li'
						});

					});
        		</script>

<style>

	div.alert.alert-danger-1 {
		display: none
	}
	.alert.alert-danger-1 label.error {
		display: inline;
	}


	form.cmxform label.error {
		display: block;
		margin-left: 1em;
		width: auto;
	}

	</style>
 <div class="alert alert-danger-1">
                   	 <ol>

                    </ol>
            	</div>
