<div class="block">
    <label>{"Default value"|i18n("design/standard/class/datatype")}</label><div class="labelbreak"></div>
    <p>{$class_attribute.data_int3}</p>
</div>

{switch name=input_state match=$class_attribute.data_int4}
  {case match=1}

<div class="block">
<div class="element">
<label>{"Min integer value"|i18n("design/standard/class/datatype")}</label><div class="labelbreak"></div>
<p>{$class_attribute.data_int1}</p>
</div>
<div class="break"></div>
</div>

  {/case}
  {case match=2}

<div class="block">
<div class="element">
<label>{"Max integer value"|i18n("design/standard/class/datatype")}</label><div class="labelbreak"></div>
<p>{$class_attribute.data_int2}</p>
</div>
<div class="break"></div>
</div>

  {/case}
  {case match=3}

<div class="block">
<div class="element">
<label>{"Min integer value"|i18n("design/standard/class/datatype")}</label><div class="labelbreak"></div>
<p>{$class_attribute.data_int1}</p>
</div>
<div class="element">
<label>{"Max integer value"|i18n("design/standard/class/datatype")}</label><div class="labelbreak"></div>
<p>{$class_attribute.data_int2}</p>
</div>
<div class="break"></div>
</div>

  {/case}
  {case}

  {/case}
{/switch}
