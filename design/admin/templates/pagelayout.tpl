<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="no" lang="no">

<head>
{include uri="design:page_head.tpl"}

{cache-block keys=array('navigation_tabs',$navigation_part.identifier,$current_user.contentobject_id)}
{* Cache header for each navigation part *}

    <link rel="stylesheet" type="text/css" href={"stylesheets/core.css"|ezdesign} />
    <link rel="stylesheet" type="text/css" href={"stylesheets/site.css"|ezdesign} />
    <link rel="stylesheet" type="text/css" href={"stylesheets/debug.css"|ezdesign} />

{literal}

<!--[if lt IE 6.0]>
<style>
div#maincontent div.design { width: 100%; } /* This is needed to avoid width bug in IE 5.5 */
</style>
<![endif]-->

{/literal}
</head>

<body>

<div id="allcontent">

<div id="header">
<div id="header-design">

<div id="logo">
<img src={"images/ezpublish-logo-200x40.gif"|ezdesign} width="200" height="40" alt="" border="0" />
</div>

<div id="userstatus">
{section show=eq($current_user.contentobject_id,$anonymous_user_id)}
<p><a href={"/user/login/"|ezurl}>{'Login'|i18n('design/standard/layout')}</a></p>
{section-else}
<p><a href={"/user/logout/"|ezurl}>{'Logout'|i18n('design/standard/layout')} ({$current_user.contentobject.name|wash})</a></p>
{/section}
</div>

<div id="search">
<form action={"/content/search/"|ezurl} method="get">
    <input id="searchtext" type="text" size="20" name="SearchText" id="Search" value="" />
    <input id="searchbutton" name="SearchButton" type="submit" value="{'Search'|i18n('design/standard/layout')}" />
    <p><label><input type="radio" checked="checked" />All content</label> <label><input type="radio" />Current location</label> <a href="/">Advanced</a></p>
</form>
</div>

<div class="break"></div>

</div>
</div>

<hr class="hide" />

<div id="topmenu">
<div id="topmenu-design">

<h3 class="hide">Top menu</h3>

<ul>
    <li><div>
    {* Content menu *}
    {section show=eq($navigation_part.identifier,'ezcontentnavigationpart')}
    {include uri="design:page_menuheadselected.tpl" menu_text='Content'|i18n('design/admin/layout') menu_url=concat("/content/view/full/",ezini('NodeSettings','RootNode','content.ini'))}
    {section-else}
    {include uri="design:page_menuheadgray.tpl" menu_text='Content'|i18n('design/admin/layout') menu_url=concat("/content/view/full/",ezini('NodeSettings','RootNode','content.ini'))}
    {/section}
    </div></li>
    <li><div>
    {* Media menu *}
    {section show=eq($navigation_part.identifier,'ezmedianavigationpart')}
    {include uri="design:page_menuheadselected.tpl" menu_text='Media'|i18n('design/admin/layout') menu_url=concat("/content/view/full/",ezini('NodeSettings','MediaRootNode','content.ini'))}
    {section-else}
    {include uri="design:page_menuheadgray.tpl" menu_text='Media'|i18n('design/admin/layout') menu_url=concat("/content/view/full/",ezini('NodeSettings','MediaRootNode','content.ini'))}
    {/section}
    </div></li>
    <li><div>
    {* Shop menu *}
    {section show=eq($navigation_part.identifier,'ezshopnavigationpart')}
    {include uri="design:page_menuheadselected.tpl" menu_text='Shop'|i18n('design/admin/layout') menu_url="/shop/orderlist/"}
    {section-else}
    {include uri="design:page_menuheadgray.tpl" menu_text='Shop'|i18n('design/admin/layout') menu_url="/shop/orderlist/"}
    {/section}
    </div></li>
    <li><div>
    {* Users menu *}
    {section show=eq($navigation_part.identifier,'ezusernavigationpart')}
    {include uri="design:page_menuheadselected.tpl" menu_text='Users'|i18n('design/admin/layout') menu_url="/content/view/full/5/"}
    {section-else}
    {include uri="design:page_menuheadgray.tpl" menu_text='Users'|i18n('design/admin/layout') menu_url="/content/view/full/5/"}
    {/section}
    </div></li>
    <li><div>
    {* Set up menu *}
    {section show=eq($navigation_part.identifier,'ezsetupnavigationpart')}
    {include uri="design:page_menuheadselected.tpl" menu_text='Set up'|i18n('design/admin/layout') menu_url="/setup/menu/"}
    {section-else}
    {include uri="design:page_menuheadgray.tpl" menu_text='Set up'|i18n('design/admin/layout') menu_url="/setup/menu/"}
    {/section}
    </div></li>
    <li><div>
    {* Personal *}
    {section show=eq($navigation_part.identifier,'ezmynavigationpart')}
    {include uri="design:page_menuheadselected.tpl" menu_text='Personal'|i18n('design/admin/layout') menu_url="/content/draft/"}
    {section-else}
    {include uri="design:page_menuheadgray.tpl" menu_text='Personal'|i18n('design/admin/layout') menu_url="/content/draft/"}
    {/section}
    </div></li>
</ul>

</div>
</div>

{/cache-block}

<hr class="hide" />


<div id="path">
<div id="path-design">

{include uri="design:page_toppath.tpl"}

</div>
</div>


<hr class="hide" />

<div id="columns">

<div id="leftmenu">
<div id="leftmenu-design">

{section show=eq($navigation_part.identifier,'ezcontentnavigationpart')}
{include uri="design:parts/content/menu.tpl"}
{/section}

{section show=eq($navigation_part.identifier,'ezmedianavigationpart')}
{include uri="design:parts/media/menu.tpl"}
{/section}

{section show=eq($navigation_part.identifier,'ezshopnavigationpart')}
{include uri="design:parts/shop/menu.tpl"}
{/section}

{section show=eq($navigation_part.identifier,'ezusernavigationpart')}
{include uri="design:parts/user/menu.tpl"}
{/section}

{section show=eq($navigation_part.identifier,'ezsetupnavigationpart')}
{include uri="design:parts/setup/menu.tpl"}
{/section}


{section show=eq($navigation_part.identifier,'ezmynavigationpart')}
{include uri="design:parts/my/menu.tpl"}
{/section}

</div>
</div>

<hr class="hide" />

<div id="rightmenu">
<div id="rightmenu-design">

<h3>Right</h3>

	        {section show=fetch('content', 'can_instantiate_classes')}
	        <form method="post" action={"content/action"|ezurl}>
                        <select name="ClassID" class="classcreate">
	                    {section name=Classes loop=fetch('content', 'can_instantiate_class_list')}
                            <option value="{$Classes:item.id}">{$Classes:item.name|wash}</option>
                            {/section}
                         </select>
                            <input class="classbutton" type="submit" name="NewButton" value="{'New'|i18n('design/standard/node/view')}" />
                </form>
                {/section}

</div>
</div>

<hr class="hide" />

<div id="maincontent"><div id="fix">
<div id="maincontent-design">

{* Main area START *}

{include uri="design:page_mainarea.tpl"}

{* Main area END *}

</div>
<div class="break"></div>
</div></div>

<div class="break"></div>
</div>

<hr class="hide" />

<div id="footer">
<div id="footer-design">

{include uri="design:page_copyright.tpl"}

</div>
</div>

<div class="break"></div>
</div>

<!--DEBUG_REPORT-->

</body>
</html>
