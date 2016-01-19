<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en"><head>
    <meta charset="utf-8">
    <title>Bootstrap Admin</title>
    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" type="text/css" href="../pay/template/lib/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="../pay/template/lib/font-awesome/css/font-awesome.css">

    <script src="../pay/template/lib/jquery-1.11.1.js" type="text/javascript"></script>

    

    <link rel="stylesheet" type="text/css" href="../pay/template/stylesheets/theme.css">
    <link rel="stylesheet" type="text/css" href="../pay/template/stylesheets/premium.css">

</head>
<body class=" theme-blue">

    <!-- Demo page code -->

    <script type="text/javascript">
        $(function() {
            var match = document.cookie.match(new RegExp('color=([^;]+)'));
            if(match) var color = match[1];
            if(color) {
                $('body').removeClass(function (index, css) {
                    return (css.match (/\btheme-\S+/g) || []).join(' ')
                })
                $('body').addClass('theme-' + color);
            }

            $('[data-popover="true"]').popover({html: true});
            
        });
    </script>
    <style type="text/css">
        #line-chart {
            height:300px;
            width:800px;
            margin: 0px auto;
            margin-top: 1em;
        }
        .navbar-default .navbar-brand, .navbar-default .navbar-brand:hover { 
            color: #fff;
        }
    </style>

    <script type="text/javascript">
        $(function() {
            var uls = $('.sidebar-nav > ul > *').clone();
            uls.addClass('visible-xs');
            $('#main-menu').append(uls.clone());
        });
    </script>

    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <!-- Le fav and touch icons -->
    <link rel="shortcut icon" href="../assets/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../assets/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../assets/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="../assets/ico/apple-touch-icon-57-precomposed.png">
  

  <!--[if lt IE 7 ]> <body class="ie ie6"> <![endif]-->
  <!--[if IE 7 ]> <body class="ie ie7 "> <![endif]-->
  <!--[if IE 8 ]> <body class="ie ie8 "> <![endif]-->
  <!--[if IE 9 ]> <body class="ie ie9 "> <![endif]-->
  <!--[if (gt IE 9)|!(IE)]><!--> 
   
  <!--<![endif]-->

    <div class="navbar navbar-default" role="navigation">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse">
				<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="" href="index.do"><span class="navbar-brand"><span class="fa fa-paper-plane"></span>&nbsp;&nbsp;量子互助</span></a>
		</div>

		<div class="navbar-collapse collapse" style="height: 1px;">
			<ul id="main-menu" class="nav navbar-nav navbar-right">
				<li class="dropdown hidden-xs"><a href="#" class="dropdown-toggle" data-toggle="dropdown"> <span
						class="glyphicon glyphicon-user padding-right-small" style="position: relative; top: 3px;"></span>${name} <i
						class="fa fa-caret-down"></i>
				</a>
					<ul class="dropdown-menu">
						<li><a href="./">我的账户</a></li>
						<li class="divider"></li>
						<li class="dropdown-header">资料修改</li>
						<li><a href="./">个人资料修改</a></li>
						<li><a href="./">密码修改</a></li>
						<li><a tabindex="-1" href="./">密保修改</a></li>
						<li class="divider"></li>
						<li><a tabindex="-1" href="sign-in.do">退出</a></li>
					</ul></li>
			</ul>
		</div>
	</div>
	<div class="sidebar-nav">
		<ul>
			<li><a href="#" data-target=".dashboard-menu" class="nav-header" data-toggle="collapse"><i
					class="fa fa-fw fa-dashboard"></i>我的市场<i class="fa fa-collapse"></i></a></li>
			<li><ul class="dashboard-menu nav nav-list collapse in">
					<li><a href="#"><span class="fa fa-caret-right"></span>会员注册</a></li>
					<li><a href="#"><span class="fa fa-caret-right"></span>直推会员统计</a></li>
					<li><a href="#"><span class="fa fa-caret-right"></span>激活会员</a></li>
				</ul></li>
			<li><a href="#" data-target=".accounts-menu" class="nav-header collapsed" data-toggle="collapse"><i
					class="fa fa-fw fa-briefcase"></i>交易管理 <span class="label label-info">+1</span></a></li>
			<li><ul class="accounts-menu nav nav-list collapse">
					<li><a href="#"><span class="fa fa-caret-right"></span>匹配详情</a></li>
					<li><a href="#"><span class="fa fa-caret-right"></span>账户转账</a></li>
				</ul></li>
			<li><a href="#" data-target=".accounts-menu-2" class="nav-header collapsed" data-toggle="collapse"><i
					class="fa fa-fw fa-briefcase"></i>资金管理 <span class="label label-info">+2</span></a></li>
			<li><ul class="accounts-menu-2 nav nav-list collapse">
					<li><a href="#"><span class="fa fa-caret-right"></span>资金明细</a></li>
					<li><a href="#"><span class="fa fa-caret-right"></span>奖金明细</a></li>
				</ul></li>

			<li><a href="#" data-target=".legal-menu" class="nav-header collapsed" data-toggle="collapse"><i
					class="fa fa-fw fa-legal"></i>会员资料<i class="fa fa-collapse"></i></a></li>
			<li><ul class="legal-menu nav nav-list collapse">
					<li><a href="#"><span class="fa fa-caret-right"></span>交易资料</a></li>
					<li><a href="#"><span class="fa fa-caret-right"></span>密码修改</a></li>
					<li><a href="#"><span class="fa fa-caret-right"></span>密保修改</a></li>
				</ul></li>
			<li><a href="../pay/guestbook.do" class="nav-header"><i class="fa fa-fw fa-question-circle"></i>留言反馈</a></li>
			<li><a href="../pay/faq.do" class="nav-header"><i class="fa fa-fw fa-comment"></i>常见问题</a></li>
			<li><a href="../pay/news.do" class="nav-header"><i class="fa fa-fw fa-heart"></i>新闻公告</a></li>
		</ul>
	</div>

	<div class="content">
        <div class="header">
            
            <h1 class="page-title">常见问题</h1>
                    <ul class="breadcrumb">
            <li><a href="index.do">主页</a></li>
            <li class="active">常见问题</li>
        </ul>

        </div>
        <div class="main-content">
            
    <div class="alert alert-error">
        <button type="button" class="close" data-dismiss="alert">×</button>
         	下面是新用户常见问题，依次做出解答
    </div>

<div class="faq-content">
    <h2>使用常见问题</h2>
    <ol>
        <li><a href="#q1">What if I have a question?</a></li>
        <li><a href="#q2">Where can I get support?</a></li>
        <li><a href="#q3">How long does it take to fix a problem?</a></li>
        <li><a href="#q4">Who can help me out?</a></li>
        <li><a href="#q5">Where are you located?</a></li>
    </ol>

    <h2>交易常见问题</h2>
    <ol>
        <li><a href="#q11">How much does it cost?</a></li>
        <li><a href="#q12">Am I billed monthly or yearly?</a></li>
        <li><a href="#q13">What level of service do you have?</a></li>
        <li><a href="#q14">How do you secure your data?</a></li>
        <li><a href="#q15">Who can I contact for advertising?</a></li>
        <li><a href="#q16">Can I install custom fonts?</a></li>
        <li><a href="#q17">When does my service end?</a></li>
        <li><a href="#q18">Where can I find a custom design?</a></li>
    </ol>

    <hr>

    <h2>使用常见问题</h2>
    <a href="#" style="float: right; line-height: 1.25em; display: inline-block; padding: .75em 0em;"><i class="fa fa-arrow-circle-up"></i> Top</a>
    <h3 id="q1">What if I have a question?</h3>
    <p>Tigernut avocado catsear beet greens silver beet coriander jícama cress. Desert raisin tomatillo turnip greens water chestnut parsnip dandelion cress gourd bell pepper garbanzo yarrow rutabaga fava bean spinach pea. Zucchini seakale bell pepper shallot silver beet tomatillo.</p>
    <a href="#" style="float: right; line-height: 1.25em; display: inline-block; padding: .75em 0em;"><i class="fa fa-arrow-circle-up"></i> Top</a>
    <h3 id="q2">Where can I get support?</h3>
    <p>Desert raisin sorrel grape courgette pumpkin epazote maize nori pea garlic garlic desert raisin corn lotus root. Bunya nuts bitterleaf melon wakame celtuce beetroot water chestnut corn maize leek azuki bean turnip ricebean bamboo shoot quandong taro courgette tomato. Tomato celtuce chickweed rutabaga beet greens sweet pepper aubergine carrot kakadu plum yarrow garbanzo tigernut sierra leone bologi okra pea caulie grape.</p>
    <a href="#" style="float: right; line-height: 1.25em; display: inline-block; padding: .75em 0em;"><i class="fa fa-arrow-circle-up"></i> Top</a>
    <h3 id="q3">How long does it take to fix a problem?</h3>
    <p>Courgette cabbage beetroot lentil garlic eggplant azuki bean potato onion cauliflower celery. Ricebean taro komatsuna fennel desert raisin sweet pepper cress bamboo shoot nori soko green bean catsear garlic black-eyed pea. Komatsuna water chestnut horseradish wakame scallion chard prairie turnip fennel quandong gram.</p>
    <a href="#" style="float: right; line-height: 1.25em; display: inline-block; padding: .75em 0em;"><i class="fa fa-arrow-circle-up"></i> Top</a>
    <h3 id="q4">Who can help me out?</h3>
    <p>Maize epazote fava bean cabbage winter purslane turnip greens summer purslane scallion wattle seed green bean ricebean sierra leone bologi jícama bamboo shoot. Turnip greens amaranth gourd winter purslane pea grape prairie turnip taro sea lettuce chicory. Plantain kakadu plum melon sea lettuce soko garlic chicory.</p>
    <a href="#" style="float: right; line-height: 1.25em; display: inline-block; padding: .75em 0em;"><i class="fa fa-arrow-circle-up"></i> Top</a>
    <h3 id="q5">Where are you located?</h3>
    <p>Sweet pepper quandong cucumber caulie eggplant water spinach. Azuki bean lentil aubergine sweet pepper komatsuna brussels sprout soybean tomato spring onion. Zucchini squash potato fennel bunya nuts broccoli rabe swiss chard. Brussels sprout gourd onion komatsuna fava bean mung bean earthnut pea seakale chard asparagus tomato scallion catsear.</p>
    
    <hr>

    <h2>交易常见问题</h2>
    <a href="#" style="float: right; line-height: 1.25em; display: inline-block; padding: .75em 0em;"><i class="fa fa-arrow-circle-up"></i> Top</a>
    <h3 id="q11">How much does it cost?</h3>
    <p>Tigernut avocado catsear beet greens silver beet coriander jícama cress. Desert raisin tomatillo turnip greens water chestnut parsnip dandelion cress gourd bell pepper garbanzo yarrow rutabaga fava bean spinach pea. Zucchini seakale bell pepper shallot silver beet tomatillo.</p>
    <a href="#" style="float: right; line-height: 1.25em; display: inline-block; padding: .75em 0em;"><i class="fa fa-arrow-circle-up"></i> Top</a>
    <h3 id="q12">Am I billed monthly or yearly?</h3>
    <p>Desert raisin sorrel grape courgette pumpkin epazote maize nori pea garlic garlic desert raisin corn lotus root. Bunya nuts bitterleaf melon wakame celtuce beetroot water chestnut corn maize leek azuki bean turnip ricebean bamboo shoot quandong taro courgette tomato. Tomato celtuce chickweed rutabaga beet greens sweet pepper aubergine carrot kakadu plum yarrow garbanzo tigernut sierra leone bologi okra pea caulie grape.</p>
    <a href="#" style="float: right; line-height: 1.25em; display: inline-block; padding: .75em 0em;"><i class="fa fa-arrow-circle-up"></i> Top</a>
    <h3 id="q13">What level of service do you have?</h3>
    <p>Courgette cabbage beetroot lentil garlic eggplant azuki bean potato onion cauliflower celery. Ricebean taro komatsuna fennel desert raisin sweet pepper cress bamboo shoot nori soko green bean catsear garlic black-eyed pea. Komatsuna water chestnut horseradish wakame scallion chard prairie turnip fennel quandong gram.</p>
    <a href="#" style="float: right; line-height: 1.25em; display: inline-block; padding: .75em 0em;"><i class="fa fa-arrow-circle-up"></i> Top</a>
    <h3 id="q14">How do you secure your data?</h3>
    <p>Maize epazote fava bean cabbage winter purslane turnip greens summer purslane scallion wattle seed green bean ricebean sierra leone bologi jícama bamboo shoot. Turnip greens amaranth gourd winter purslane pea grape prairie turnip taro sea lettuce chicory. Plantain kakadu plum melon sea lettuce soko garlic chicory.</p>
    <a href="#" style="float: right; line-height: 1.25em; display: inline-block; padding: .75em 0em;"><i class="fa fa-arrow-circle-up"></i> Top</a>
    <h3 id="q15">Who can I contact for advertising?</h3>
    <p>Sweet pepper quandong cucumber caulie eggplant water spinach. Azuki bean lentil aubergine sweet pepper komatsuna brussels sprout soybean tomato spring onion. Zucchini squash potato fennel bunya nuts broccoli rabe swiss chard. Brussels sprout gourd onion komatsuna fava bean mung bean earthnut pea seakale chard asparagus tomato scallion catsear.</p>
    <a href="#" style="float: right; line-height: 1.25em; display: inline-block; padding: .75em 0em;"><i class="fa fa-arrow-circle-up"></i> Top</a>
    <h3 id="q16">Can I install custom fonts?</h3>
    <p>Salsify ricebean yarrow broccoli tomato mustard rock melon carrot garlic chicory spring onion prairie turnip azuki bean peanut gumbo welsh onion squash burdock. Fava bean black-eyed pea water chestnut celery soybean cress nori. Desert raisin horseradish carrot black-eyed pea spinach soybean silver beet.</p>
    <a href="#" style="float: right; line-height: 1.25em; display: inline-block; padding: .75em 0em;"><i class="fa fa-arrow-circle-up"></i> Top</a>
    <h3 id="q17">When does my service end?</h3>
    <p>Onion cabbage quandong seakale welsh onion mung bean pea sprouts scallion tatsoi bush tomato napa cabbage ricebean coriander parsnip beet greens chicory. Pea chard wattle seed black-eyed pea parsnip asparagus burdock chickweed jícama tomatillo radicchio plantain carrot tatsoi nori sorrel yarrow. Peanut avocado parsley celtuce salad jícama. Garbanzo winter purslane salsify bunya nuts kale onion. Squash kombu artichoke soko swiss chard water spinach.</p>
    <a href="#" style="float: right; line-height: 1.25em; display: inline-block; padding: .75em 0em;"><i class="fa fa-arrow-circle-up"></i> Top</a>
    <h3 id="q18">Where can I find a custom design?</h3>
    <p>Parsnip napa cabbage wakame sorrel lentil silver beet tatsoi bitterleaf pea sprouts zucchini bush tomato gumbo. Fennel desert raisin grape amaranth soko earthnut pea corn plantain celtuce taro komatsuna bunya nuts. Desert raisin tigernut komatsuna tomato bok choy gram plantain black-eyed pea potato chard parsnip beet greens lentil.</p>
</div>


            <footer>
                <hr>

                <!-- Purchase a site license to remove this link from the footer: http://www.portnine.com/bootstrap-themes -->
                <p class="pull-right">A <a href="#" target="_blank">Free Bootstrap Theme</a> by <a href="#" target="_blank">Portnine</a></p>
                <p>© 2014 <a href="http://www.portnine.com" target="_blank">Portnine</a></p>
            </footer>
        </div>
    </div>


    <script src="../pay/template/lib/bootstrap/js/bootstrap.js"></script>
    <script type="text/javascript">
        $("[rel=tooltip]").tooltip();
        $(function() {
            $('.demo-cancel-click').click(function(){return false;});
        });
    </script>
    
  
</body></html>
