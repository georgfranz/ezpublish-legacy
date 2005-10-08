{* DO NOT EDIT THIS FILE! Use an override template instead. *}
<form method="post" action={"collaboration/action/"|ezurl}>

{let message_limit=2
     message_offset=0
     content_version=fetch("content","version",hash("object_id",$collab_item.content.content_object_id,"version_id",$collab_item.content.content_object_version))
     current_participant=fetch("collaboration","participant",hash("item_id",$collab_item.id))
     participant_list=fetch("collaboration","participant_map",hash("item_id",$collab_item.id))
     message_list=fetch("collaboration","message_list",hash("item_id",$collab_item.id,"limit",$message_limit,"offset",$message_offset))}

{section show=$content_version|null()|not()}
  {set-block variable=contentobject_link}
    {content_version_view_gui view=text_linked content_version=$content_version}
  {/set-block}
{/section}

<div class="context-block">

{* DESIGN: Header START *}<div class="box-header"><div class="box-tc"><div class="box-ml"><div class="box-mr"><div class="box-tl"><div class="box-tr">

<h1 class="context-title">{"Approval"|i18n('design/admin/collaboration/handler/view/full/ezapprove')}</h1>

{* DESIGN: Mainline *}<div class="header-mainline"></div>

{* DESIGN: Header END *}</div></div></div></div></div></div>

{* DESIGN: Content START *}<div class="box-ml"><div class="box-mr"><div class="box-content">

<div class="context-attributes">

{switch match=$collab_item.data_int3}
{case match=0}

{section show=$collab_item.is_creator}
    <p>{"The content object %1 awaits approval before it can be published."|i18n('design/admin/collaboration/handler/view/full/ezapprove',,array($contentobject_link))}</p>
    <p>{"If you wish you may send a message to the person approving it?"|i18n('design/admin/collaboration/handler/view/full/ezapprove')}</p>
{section-else}
    <p>{"The content object %1 needs your approval before it can be published."|i18n('design/admin/collaboration/handler/view/full/ezapprove',,array($contentobject_link))}</p>
    <p>{"Do you approve of the content object being published?"|i18n('design/admin/collaboration/handler/view/full/ezapprove')}</p>
{/section}

{/case}
{case match=1}
  {section show=and( is_set( $contentobject_link ),$contentobject_link )}
        <p>{"The content object %1 was approved and will be published once the publishing workflow continues."|i18n('design/admin/collaboration/handler/view/full/ezapprove',,array($contentobject_link))}</p>
  {section-else}
        <p>{"The content object %1 [deleted] was approved and will be published once the publishing workflow continues."|i18n('design/admin/collaboration/handler/view/full/ezapprove',,array($collab_item.content.content_object_id))}</p>
  {/section}
{/case}
{case in=array(2,3)}
  {section show=$collab_item.is_creator}
    {section show=and( is_set( $contentobject_link ),$contentobject_link )}
        <p>{"The content object %1 was not accepted but is available as a draft again."|i18n('design/admin/collaboration/handler/view/full/ezapprove',,array($contentobject_link))}</p>
    {section-else}
        <p>{"The content object %1 [deleted] was not accepted but is available as a draft again."|i18n('design/admin/collaboration/handler/view/full/ezapprove',,array($collab_item.content.content_object_id))}</p>
    {/section}
    {section show=$content_version|null()|not()}
      <p>{"You may reedit the draft and publish it, in which case an approval is required again."|i18n('design/admin/collaboration/handler/view/full/ezapprove')}</p>
      <p><a href={concat("content/edit/",$content_version.contentobject_id)|ezurl}>{"Edit the object"|i18n('design/admin/collaboration/handler/view/full/ezapprove')}</a></p>
    {/section}
  {section-else}
    {section show=and( is_set( $contentobject_link ),$contentobject_link )}
        <p>{"The content object %1 was not accepted but will be available as a draft for the author."|i18n('design/admin/collaboration/handler/view/full/ezapprove',,array($contentobject_link))}</p>
    {section-else}
        <p>{"The content object %1 [deleted] was not accepted but will be available as a draft for the author."|i18n('design/admin/collaboration/handler/view/full/ezapprove',,array($collab_item.content.content_object_id))}</p>
    {/section}
    <p>{"The author can reedit the draft and publish it again, in which a new approval item is made."|i18n('design/admin/collaboration/handler/view/full/ezapprove')}</p>
  {/section}
{/case}
{case/}
{/switch}

{section show=eq($collab_item.data_int3,0)}
    <label>{"Comment"|i18n('design/admin/collaboration/handler/view/full/ezapprove')}:</label>
    <textarea class="box" name="Collaboration_ApproveComment" cols="40" rows="5"></textarea>
{/section}
</div>


{* DESIGN: Content END *}</div></div></div>

<div class="controlbar">

{* DESIGN: Control bar START *}<div class="box-bc"><div class="box-ml"><div class="box-mr"><div class="box-tc"><div class="box-bl"><div class="box-br">

<input type="hidden" name="CollaborationActionCustom" value="custom" />
<input type="hidden" name="CollaborationTypeIdentifier" value="ezapprove" />

<input type="hidden" name="CollaborationItemID" value="{$collab_item.id}" />

<div class="block">
{section show=eq($collab_item.data_int3,0)}

    <input class="button" type="submit" name="CollaborationAction_Comment" value="{'Add Comment'|i18n('design/admin/collaboration/handler/view/full/ezapprove')}" />

    {section show=$collab_item.is_creator|not}
    <input class="button" type="submit" name="CollaborationAction_Accept" value="{'Approve'|i18n('design/admin/collaboration/handler/view/full/ezapprove')}" />
    <input class="button" type="submit" name="CollaborationAction_Deny" value="{'Deny'|i18n('design/admin/collaboration/handler/view/full/ezapprove')}" />
    {section-else}
    <input class="button-disabled" type="submit" name="CollaborationAction_Accept" value="{'Approve'|i18n('design/admin/collaboration/handler/view/full/ezapprove')}" disabled="disabled" />
    <input class="button-disabled" type="submit" name="CollaborationAction_Deny" value="{'Deny'|i18n('design/admin/collaboration/handler/view/full/ezapprove')}" disabled="disabled" />
    {/section}

{section-else}

    <input class="button-disabled" type="submit" name="CollaborationAction_Comment" value="{'Add Comment'|i18n('design/admin/collaboration/handler/view/full/ezapprove')}" disabled="disabled" />

    <input class="button-disabled" type="submit" name="CollaborationAction_Accept" value="{'Approve'|i18n('design/admin/collaboration/handler/view/full/ezapprove')}" disabled="disabled" />
    <input class="button-disabled" type="submit" name="CollaborationAction_Deny" value="{'Deny'|i18n('design/admin/collaboration/handler/view/full/ezapprove')}" disabled="disabled" />
{/section}
</div>

{* DESIGN: Control bar END *}</div></div></div></div></div></div>
</div>

</div>

{section show=$content_version|null()|not()}
<div class="context-block">

{* DESIGN: Header START *}<div class="box-header"><div class="box-tc"><div class="box-ml"><div class="box-mr"><div class="box-tl"><div class="box-tr">

<h2 class="context-title">{"Preview"|i18n('design/admin/collaboration/handler/view/full/ezapprove')}</h2>

{* DESIGN: Mainline *}<div class="header-subline"></div>

{* DESIGN: Header END *}</div></div></div></div></div></div>

{* DESIGN: Content START *}<div class="box-bc"><div class="box-ml"><div class="box-mr"><div class="box-bl"><div class="box-br"><div class="box-content">

<div class="mainobject-window">
  {content_version_view_gui view=plain content_version=$content_version}
</div>

{* DESIGN: Content END *}</div></div></div></div></div></div>

</div>
{/section}

<div class="context-block">

{* DESIGN: Header START *}<div class="box-header"><div class="box-tc"><div class="box-ml"><div class="box-mr"><div class="box-tl"><div class="box-tr">

<h2 class="context-title">{"Participants"|i18n('design/admin/collaboration/handler/view/full/ezapprove')}</h2>

{* DESIGN: Mainline *}<div class="header-subline"></div>

{* DESIGN: Header END *}</div></div></div></div></div></div>

{* DESIGN: Content START *}<div class="box-bc"><div class="box-ml"><div class="box-mr"><div class="box-bl"><div class="box-br"><div class="box-content">

<div class="block">
   {section name=Role loop=$participant_list sequence=array(bglight,bgdark)}
   <label>{$:item.name|wash}:</label>
   {section name=Participant loop=$:item.items sequence=array(bglight,bgdark)}
   <p>{collaboration_participation_view view=text_linked collaboration_participant=$:item}</p>
   {/section}
   {delimiter}{/delimiter}
   {/section}
</div>

{* DESIGN: Content END *}</div></div></div></div></div></div>

</div>

{section show=$message_list}

<div class="context-block">

{* DESIGN: Header START *}<div class="box-header"><div class="box-tc"><div class="box-ml"><div class="box-mr"><div class="box-tl"><div class="box-tr">

<h2 id="messages" class="context-title">{"Messages"|i18n('design/admin/collaboration/handler/view/full/ezapprove')}</h2>

{* DESIGN: Mainline *}<div class="header-subline"></div>

{* DESIGN: Header END *}</div></div></div></div></div></div>

{* DESIGN: Content START *}<div class="box-bc"><div class="box-ml"><div class="box-mr"><div class="box-bl"><div class="box-br"><div class="box-content">

  <table class="special" cellspacing="0">
  {section name=Message loop=$message_list sequence=array(bglight,bgdark)}

      {collaboration_simple_message_view view=element sequence=$:sequence is_read=$current_participant.last_read|gt($:item.modified) item_link=$:item collaboration_message=$:item.simple_message}

  {/section}
  </table>

{* DESIGN: Content END *}</div></div></div></div></div></div>

</div>

{/section}

{/let}

</form>
