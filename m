Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A529C433F5
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Jan 2022 10:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=RvAgckvIkHng0jV0VSiG1/sBFsNvuwpIie/UbXKrjFY=; b=tY93Q6VdZJzlh9CPog7b1Q80lR
	NoJMesd7kk2UYoOUw8rA37bU4MQX6u/6RiQdsOzTrgfzd4iwqF3FsPvBQnNQlN+Rg6DHDRk/0GNIO
	B+0DWz4/8oxXcGS1q1C1iDJ/0wPciXKuNGn3KoIoB9XhLpJICUQ8joyk+eY+BkoQMqSZupK4+p774
	vu+mmmVzrv+yq4BtIDnAVeMla3zIfbMbQVpXmGWudHciazFFYtsWFTkcb1qYmIs2BcCChO/z9K1iH
	1T5XsMl41xrdJRabLhjD7DhjWMuxs7NYLkvQac/ODQ8dhPll7SUwqmnz4v4b3XrmMaJapiuRVtZ/A
	WyuFoAuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8K2p-008kyf-B6; Fri, 14 Jan 2022 10:42:55 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8K2Z-008ktc-CQ
 for linux-amlogic@lists.infradead.org; Fri, 14 Jan 2022 10:42:41 +0000
Received: by mail-wr1-x430.google.com with SMTP id t20so7405652wrb.4
 for <linux-amlogic@lists.infradead.org>; Fri, 14 Jan 2022 02:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gp5m+hjNnex+C5KrxF94exi88etk0hJOGkatfv4Q0bU=;
 b=R8XlGGCi3zgVrOlJxHWY3jfI+Y42tPrDUAayaOZzeN0BjiwTcKnYiWpfHf/RyPD+PA
 DMluxaRqAZF/FLUbiqhfVqmoKUCH5+PlpaZS2elAXXNYEukkKvu9KmUXOWa4tp+NrUob
 wHFBIU4SBFF/5eQWwhBelF1Px8RDqviwQoGHYiVrGUQdC5AEvxJY+7Z4Q6A9YShwuoPQ
 Rc5H9FrFvWGZ01qDSN2KjmCjPO/xOU11F8jwpuuR5GEGPN565KuEroKY9FrRWxoJLLt1
 I8dR6W+MCZGY4N34VAvXlU/8s8P0eBDOv4bZBCvqXkpOP1/p0hwkm5x9JCNdbungfjoC
 5Kow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=gp5m+hjNnex+C5KrxF94exi88etk0hJOGkatfv4Q0bU=;
 b=K3kM5nJHsp07zsyWHuhl369EroOsUu4QV0mOHRnlOqX7YqeS8aSxuI1vbc8J2ZRXWS
 pf6youwWgwSQ3rwuYhl7ufoYmAq/TvcAu6f5In9X/Xh88lwCqUHb6t9KMkVyR/WhBsqe
 e0eiUsNg7qDhgvtRfryYWptBQXxo+8WMokAiJ9v0gA6U4SApTDz0ovZ7rcZxkkY/nZrn
 DUelX4vzapd5LcyxRmis1Qf7JY7AvCPc1kGZnF/lNTakkRIXMOTJ3CX9zHJL378XmLMU
 wRsL5RmjWZX3IQTITmd52OcKzyOFkS5b5hLemMsjWkSSFb2Q11Bh+Ng3AsvfnC7A0rHV
 GsVA==
X-Gm-Message-State: AOAM530G68CRHukA7z0sAUtbsEtAkShnLgVMRZ7Z1sgBwM14Smit3a3x
 /eEHe2d+WXVp4KavPRCrT7a2fA==
X-Google-Smtp-Source: ABdhPJyoGyFoYIArOrqbuQZfSBwAef4ylBDlWBIOjcz0yLUP3z+XxfSUcEq33rLVvTxljW/UNcrFVA==
X-Received: by 2002:a05:6000:2ce:: with SMTP id
 o14mr7927987wry.70.1642156957760; 
 Fri, 14 Jan 2022 02:42:37 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:a3fc:c40b:5afc:88ee?
 ([2001:861:44c0:66c0:a3fc:c40b:5afc:88ee])
 by smtp.gmail.com with ESMTPSA id m15sm5370531wmq.6.2022.01.14.02.42.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jan 2022 02:42:37 -0800 (PST)
Subject: Re: dw_hdmi is showing wrong colour after commit
 7cd70656d1285b79("drm/bridge: display-connector: implement bus fmts
 callbacks")
To: Biju Das <biju.das.jz@bp.renesas.com>, Fabio Estevam <festevam@gmail.com>
Cc: "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "robert.foss@linaro.org" <robert.foss@linaro.org>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 "martin.blumenstingl@googlemail.com" <martin.blumenstingl@googlemail.com>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
References: <OS0PR01MB59221ED76B74231F5836D5FB86539@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAOMZO5DJiCb5bJN5_nxnYa-FsK-u7QtFghWNzs_-udE42XPDeA@mail.gmail.com>
 <502f3ec4-fea4-8e14-c7a9-39418fc05d6d@baylibre.com>
 <OS0PR01MB592224EC8F50F41B7FF1DEE286549@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <19dd6013-8a31-b2ed-29d5-93fc44193ce4@baylibre.com>
Date: Fri, 14 Jan 2022 11:42:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <OS0PR01MB592224EC8F50F41B7FF1DEE286549@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220114_024239_454891_9BB99AA9 
X-CRM114-Status: GOOD (  23.35  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 14/01/2022 09:29, Biju Das wrote:
> Hi Neil,
>  
> + renesas-soc
> 
>> Subject: Re: dw_hdmi is showing wrong colour after commit
>> 7cd70656d1285b79("drm/bridge: display-connector: implement bus fmts
>> callbacks")
>>
>> Hi,
>>
>> On 13/01/2022 21:01, Fabio Estevam wrote:
>>> Hi Biju,
>>>
>>> On Thu, Jan 13, 2022 at 2:45 PM Biju Das <biju.das.jz@bp.renesas.com>
>> wrote:
>>>>
>>>> Hi All,
>>>>
>>>> RZ/G2{H, M, N} SoC has dw_hdmi IP and it was working ok(colour) till
>>>> the commit
>>>> 7cd70656d1285b79("drm/bridge: display-connector: implement bus fmts
>> callbacks").
>>>>
>>>> After this patch, the screen becomes greenish(may be it is setting it
>> into YUV format??).
>>>>
>>>> By checking the code, previously it used to call get_input_fmt callback
>> and set colour as RGB24.
>>>>
>>>> After this commit, it calls get_output_fmt_callbck and returns 3
>>>> outputformats(YUV16, YUV24 and RGB24) And get_input_fmt callback, I see
>> the outputformat as YUV16 instead of RGB24.
>>>>
>>>> Not sure, I am the only one seeing this issue with dw_HDMI driver.
>>
>> This patch was introduced to maintain the bridge color format negotiation
>> after using DRM_BRIDGE_ATTACH_NO_CONNECTOR, but it seems it behaves
>> incorrectly if the first bridge doesn't implement the negotiation
>> callbacks.
>>
>> Let me check the code to see how to fix that.
> 
> Thanks for the information, I am happy to test the patch/fix.
> 
> Cheers,
> Biju
> 
>>
>>>
>>> I have tested linux-next 20220112 on a imx6q-sabresd board, which shows:
>>>
>>> dwhdmi-imx 120000.hdmi: Detected HDMI TX controller v1.30a with HDCP
>>> (DWC HDMI 3D TX PHY)
>>>
>>> The colors are shown correctly here.
>>>
>>
>> The imx doesn't use DRM_BRIDGE_ATTACH_NO_CONNECTOR so the negotiation
>> fails and use the RGB fallback input & output format.
>>
>> Anyway thanks for testing
>>
>> Neil

Can you test :

==><===============================
diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index c96847fc0ebc..7019acd37716 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -955,7 +955,14 @@ drm_atomic_bridge_chain_select_bus_fmts(struct drm_bridge *bridge,
        last_bridge_state = drm_atomic_get_new_bridge_state(crtc_state->state,
                                                            last_bridge);

-       if (last_bridge->funcs->atomic_get_output_bus_fmts) {
+       /*
+        * Only negociate with real values if both end of the bridge chain
+        * support negociation callbacks, otherwise you can end in a situation
+        * where the selected output format doesn't match with the first bridge
+        * output format.
+        */
+       if (bridge->funcs->atomic_get_input_bus_fmts &&
+           last_bridge->funcs->atomic_get_output_bus_fmts) {
                const struct drm_bridge_funcs *funcs = last_bridge->funcs;

                /*
@@ -980,7 +987,12 @@ drm_atomic_bridge_chain_select_bus_fmts(struct drm_bridge *bridge,
                if (!out_bus_fmts)
                        return -ENOMEM;

-               if (conn->display_info.num_bus_formats &&
+               /*
+                * If first bridge doesn't support negociation, use MEDIA_BUS_FMT_FIXED
+                * as a safe value for the whole bridge chain
+                */
+               if (bridge->funcs->atomic_get_input_bus_fmts &&
+                   conn->display_info.num_bus_formats &&
                    conn->display_info.bus_formats)
                        out_bus_fmts[0] = conn->display_info.bus_formats[0];
                else
==><===============================

This should exclude your situation where the first bridge doesn't support negociation.

Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
