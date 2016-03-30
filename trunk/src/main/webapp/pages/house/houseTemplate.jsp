<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/includes.jsp"%>
          <div class="list">
            <div class="pic-panel">
            {#if $T.house.putAway==1}
                <a target="_blank" href="{$T.house.houseServerUrl}/ershoufang/sh{$T.house.houseSellId}.html">
                    <img data-original="{$T.house.mainPhotoUrl}" src="${config.statichost}/static/img/default_block.png" class="lj-lazy" onerror="${config.statichost}/static/img/default_block.png">

                    <%--<img class="layout" src="{$T.house.allowedPhoto}" alt="">--%>
                </a>
                   {#elseif $T.house.putAway==2}
                 <a target="_blank" href="{$T.house.houseServerUrl}/chengjao/sh{$T.house.houseSellId}.html">
                     <img data-original="{$T.house.mainPhotoUrl}" src="${config.statichost}/static/img/default_block.png" class="lj-lazy" onerror="${config.statichost}/static/img/default_block.png">
                     <%--<img class="layout" src="{$T.house.allowedPhoto}" alt="">--%>
                </a>
                {#else}
                  <a href="javascript:;">
                  <img data-original="{$T.house.mainPhotoUrl}" src="${config.statichost}/static/img/default_block.png" class="lj-lazy" onerror="${config.statichost}/static/img/default_block.png">
                  <%--<img class="layout" src="{$T.house.allowedPhoto}" alt="">--%>
                </a>
                   {#/if}
                    <c:if test="${param.type==0}">
                    <p>  {$P.DateDiff($T.house.createTime)}&nbsp;来自链家官方数据</p>
                    </c:if>
            </div>
            <div class="info-panel">
                <h2>
                 {#if $T.house.putAway==1}
                <a target="_blank" href="{$T.house.houseServerUrl}/ershoufang/sh{$T.house.houseSellId}.html">
                     {$T.house.title}
                </a>
                   {#elseif $T.house.putAway==2}
                     <a target="_blank" href="{$T.house.houseServerUrl}/chengjao/sh{$T.house.houseSellId}.html">
                     {$T.house.title}
               		 </a>
              	  {#else}
                  <a  href="javascript:;">
                     {$T.house.title}
                </a>
                   {#/if}
                </h2>
             
                
                <div class="col-1">
                    <div class="where">
                        <a href="{$T.house.houseServerUrl}/xiaoqu/{$T.house.propertyNo}.html" target="_blank">
                            <span class="region">{$T.house.propertyName}&nbsp;&nbsp;</span>
                        </a>
                        <span class="zone">
                            <span>{$T.house.room}室{$T.house.hall}厅</span>
                        </span>
                        <span class="meters">{$T.house.acreage}平</span>
                        <span>{#if $T.house.face}
                       朝{$T.house.face}
                         {#/if}  </span>
                    </div>
                    <div class="other">
                        <div class="con">
                            <a href="{$T.house.houseServerUrl}/ershoufang/{$T.house.districtSpelling}/" target="_blank">{$T.house.districtName}</a>
                             <a href="{$T.house.houseServerUrl}/ershoufang/{$T.house.plateSpelling}" target="_blank">{$T.house.plateName}</a>
                            <span>|</span>
                           {$T.house.floorTypeName+'/'+$T.house.totalFloor+'层'}
                            
                            {#if $T.house.buildingYear}
                            <span>|</span>
                            {$T.house.buildingYear}年建
                            {#/if}
                        </div>
                    </div>
                    <div class="chanquan">
                        <div class="left agency">
                            <div class="view-label left">
                           
                                <!-- 	{#if $T.house.schoolRemark}
		    						<span class="fang05"></span>
		    						<span class="fang05-ex"><span>学区房</span></span>
		    						{#/if} -->
                                {#if $T.house.metroRemark}
                                     <span class="fang-subway"></span>
                                <span class="fang-subway-ex">
                                    <span>地铁房</span>
                                </span>
                                     {#/if}
                                     {#if $T.house.fangBenRemark}
		    										<span class="taxfree"></span>
		    										<span class="taxfree-ex"><span>{$T.house.fangBenRemark }</span></span>
		    						{#/if}
                            <!--       {#if $T.house.isSole}
                               <span class="unique"></span>
		    				  <span class="unique-ex"><span>独家</span></span>
                                {#/if} -->
                                    {#if $T.house.isKeyHouse}
                                <span class="haskey"></span>
		    						<span class="haskey-ex"><span>有钥匙</span></span>
                                {#/if}
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-3">
                    <%--成交--%>
                    {#if $T.house.putAway==2}
                    <div class="price">
                        <span class="num">{$T.house.soldPrice}</span>万
                    </div>
                        <%--失效--%>
                    {#elseif $T.house.display==0}
                    <div class="price_shixiao">
                        <span class="num">{$T.house.showPrice}</span>万
                    </div>

                    {#elseif $T.house.putAway==0}
                    <%--下架--%>
                    <div class="price_xiajia">
                        <span class="num">{$T.house.showPrice}</span>万
                    </div>
                     {#else}
                    <%--正常--%>
                    <div  class="price">
                        <span class="num">{$T.house.showPrice}</span>万
                    </div>
                    {#/if}
                    <div class="price-pre">{$T.house.unitPrice.toFixed(0)} 元/平</div>
                </div>
            </div>
            <%--成交--%>
            {#if $T.house.putAway==2}
            <div class="pic-cj"></div>
            <%--失效--%>
            {#elseif $T.house.display==0}
            <div class="tag tag_yishixiao"></div>
            {#elseif $T.house.putAway==0}
            <div class="tag tag_yixiajia"></div>
            {#/if}

        </div>