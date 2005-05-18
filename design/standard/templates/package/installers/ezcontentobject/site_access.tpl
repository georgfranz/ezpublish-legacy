{* DO NOT EDIT THIS FILE! Use an override template instead. *}
<div id="package" class="create">
    <div id="sid-{$current_step.id|wash}" class="pc-{$installer.id|wash}">

    <form method="post" action={'package/install'|ezurl}>

    {include uri="design:package/install/error.tpl"}

    {include uri="design:package/install_header.tpl"}

    <p>{'You must now choose which siteaccess the package contents should be installed to.
The chosen siteaccess determines where design files and settings are written to.
If unsure choose the siteaccess which reflects the user part of your site, i.e. not admin.'|i18n('design/standard/package')|break}</p>

    <label>{'Select siteaccess'|i18n('design/standard/package')}</label>

    {section var=site_access loop=$site_access_map}
      <div>{'Map %siteaccess_name to'|i18n( 'design/standard/package',, hash( '%siteaccess_name', concat( '<i>', $site_access.key, '</i>' ) ) )}: <select name="SiteAccessMap_{$site_access.key|wash}">
        {section var=available_access loop=$available_site_access_array}
          <option {section show=eq( $site_access.key, $available_access.item )}selected="selected"{/section}>{$available_access.item|wash}</option>
        {/section}
        </select>
      </div>
      {delimiter}
        <div class="break"></div>
      {/delimiter}
    {/section}

    {include uri="design:package/navigator.tpl"}

    </form>

    </div>
</div>