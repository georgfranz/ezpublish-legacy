{* DO NOT EDIT THIS FILE! Use an override template instead. *}
{let content=$class_attribute.content}

{* Selection method. *}
<div class="block">
    <label>{'Selection method'|i18n( 'design/standard/class/datatype' )}:</label>
    <p>{$content.selection_type|choose( 'Browse'|i18n( 'design/standard/class/datatype' ), 'Drop-down list'|i18n( 'design/standard/class/datatype' ), 'Drop-down tree'|i18n( 'design/standard/class/datatype' ) )}</p>
</div>

{* Selection item/node. *}
<div class="block">
<label>{'Default selection item'|i18n( 'design/standard/class/datatype' )}:</label>
{section show=$content.default_selection_node}
    {let selection_node=fetch( content, node, hash( node_id, $content.default_selection_node ) )}
    <table class="list" cellspacing="0">
    <tr>
        <th>{'Name'|i18n( 'design/standard/class/datatype' )}</th>
        <th>{'Type'|i18n( 'design/standard/class/datatype' )}</th>
        <th>{'Section'|i18n( 'design/standard/class/datatype' )}</th>
    </tr>
    <tr>
        <td>{$selection_node.class_identifier|class_icon( small, $selection_node.class_name )}&nbsp;<a href={$selection_node.url_alias|ezurl}>{$selection_node.name|wash}</a></td>
        <td>{$selection_node.class_name|wash}</td>
        <td>{fetch( section, object, hash( section_id, $selection_node.object.section_id ) ).name|wash}</td>
    </tr>
    </table>
    {/let}
{section-else}
    <p>{'No item has been selected.'|i18n( 'design/standard/class/datatype' )}</p>
{/section}
</div>

{* Fuzzy match. *}
<div class="block">
    <label>{'Allow fuzzy match'|i18n( 'design/standard/class/datatype' )}:</label>
    {section show=$content.fuzzy_match}
        <p>{'Yes'|i18n( 'design/standard/class/datatype' )}</p>
    {section-else}
        <p>{'No'|i18n( 'design/standard/class/datatype' )}</p>
    {/section}
</div>

{/let}
