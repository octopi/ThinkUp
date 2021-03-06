{include file=$tpl_path|cat:'_header.tpl'}

{if  !$expand}
<div class="pull-right detail-btn"><button class="btn btn-info btn-mini" data-toggle="collapse" data-target="#chart-{$i->id}"><i class="icon-signal icon-white"></i></button></div>
{/if}

<span class="label label-{if $i->emphasis eq '1'}info{elseif $i->emphasis eq '2'}success{elseif $i->emphasis eq '3'}error{else}info{/if}"><i class="icon-white icon-user"></i> <a href="?u={$i->instance->network_username}&n={$i->instance->network}&d={$i->date|date_format:'%Y-%m-%d'}&s={$i->slug}">{$i->prefix}</a></span> 

<i class="icon-{$i->instance->network}{if $i->instance->network eq 'google+'} icon-google-plus{/if} icon-muted"></i>
{$i->text|link_usernames_to_twitter}

{if !$expand}
<div class="collapse in" id="chart-{$i->id}">
{/if}

    <div id="interaction_graph_{$i->id}">&nbsp;</div>
    <script type="text/javascript">
        {literal}
        (function(d3) {
          {/literal}
          var dataset = {$i->related_data|@json_encode};
          new InteractionGraph("interaction_graph_{$i->id}",540,dataset);
          {literal}
        })(d3);
        {/literal}
    </script>

{if  !$expand}
</div>
{/if}

{include file=$tpl_path|cat:'_footer.tpl'}