Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59208C433F5
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Jan 2022 14:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=qrlfOqTJD7KcX0EdiRk6aqwkx4bt33QnzK2oDybnfOI=; b=CnwgLpAe1nUv6uD1RVHD0kJOGD
	oupHi50cs12S44rfNpkNkRTIeNEvxLzRaO4aRX6PnPRKLuYcAI54pAEOtCk3DO5bmmb5nIN8QgeV4
	hhk/VIx35a+GHLLhl6GxdTjezdojdxtC8C6mLRW6kikbgPFQKFXTBwUONs+eLh6TgQQ5GD3iGZogr
	+ZHM0mgi2tth+ufzyIvp5uAtRIVcIXMqNRWADYCZJmkhliraipgKp8ybRl4E0w3fKR6WlYNQohhEE
	M3lMIeYaxyprpvKwR2PNmGLsBFYiIvEgfc8/TNc75uMeR8rnFLgYCxceMBqHe1h8u8gGY0ue40AqE
	yAxdFxnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9Sfn-00F89r-UH; Mon, 17 Jan 2022 14:07:51 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9Sfk-00F88m-J1
 for linux-amlogic@lists.infradead.org; Mon, 17 Jan 2022 14:07:50 +0000
Received: by mail-wm1-x336.google.com with SMTP id v123so20642270wme.2
 for <linux-amlogic@lists.infradead.org>; Mon, 17 Jan 2022 06:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=roHVGOW9LS4xw5VwWVB4J43flzmTf4uk7sQSSfGZIHg=;
 b=C2l5IHhQhIYVIfT2xnMr7nGiyaB0QWTSdpXoXYd1C9CO8xQlwVmHDbkPAip11iz5lw
 7OCBG4JSwrtkaNZUXqC0GdvGcZoAyF7UvDnSdFZ3uzOSDspRO3U4hfsLzjmmLTYKYwxE
 x+EjBaqXA6PkF82TiHhbncTYjDIHJpW7Gngquonn/mPUN43j6tUFi5W11HFZR/6ZV8ZD
 u7urgTMwTyQtVsM6bhMueGxPZTaFccABkiz73lPcYH5kZba2/tvoET8s08Mz/9RXRWjF
 qcoY3xqgqFG8q+gJgm1Divs5dLB574QsuicdLeemU8fejDAQYr0Osnghg3Mfu6sFcriV
 1I/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=roHVGOW9LS4xw5VwWVB4J43flzmTf4uk7sQSSfGZIHg=;
 b=qhywud3J1RrGIMtycjO8xQ6RSV3C4kBaeepQgKTjo4BlFb1LVXweFA21QeTmD8wkwn
 gU5uZeYU/havKbwR79cKGlmJKydwHEdiMrgTlqSrd2d2Z57dz5W6WKWvlpYdd8m9GU3B
 kH1WLPtd1BIhOOPm8DdnxhA2FBtiPMV1EoTLdZVm7WAayMjDsI6BS/msCo2q7u6OWhmT
 d7/92MJPN4gKlQONfWufADJSofpRQMmJ2BuzOpvlzTB/ViKEyuriEff/+pBLxHrRJWY2
 ApLSj/ibqSILbRrhu3vZZGDCj1CZAMIPm6gOdmiasmTo9EqhVo52CKW2GDDW3wScyWG3
 WkWw==
X-Gm-Message-State: AOAM533HaywI//3ZvFCc0V6KakjgAI3lTgDYGxM7AfOyAPNUG3Jq03e8
 g9aPmayzvz17CotWsAYWQ6zRQw==
X-Google-Smtp-Source: ABdhPJyyNEqXAM/wCh4fH2lhaS6KFq89p3ZJ0qvxvaA1mkzRq2/irbC2SFkDubnPdY1WTfWmZ2HELw==
X-Received: by 2002:a05:6000:1885:: with SMTP id
 a5mr10222325wri.591.1642428467182; 
 Mon, 17 Jan 2022 06:07:47 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:c004:9fe1:fbda:2d0c?
 ([2001:861:44c0:66c0:c004:9fe1:fbda:2d0c])
 by smtp.gmail.com with ESMTPSA id d22sm13660475wrb.83.2022.01.17.06.07.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jan 2022 06:07:46 -0800 (PST)
Subject: Re: dw_hdmi is showing wrong colour after commit
 7cd70656d1285b79("drm/bridge: display-connector: implement bus fmts
 callbacks")
To: Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Biju Das <biju.das.jz@bp.renesas.com>, Fabio Estevam <festevam@gmail.com>
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
 <OS0PR01MB592224EC8F50F41B7FF1DEE286549@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <19dd6013-8a31-b2ed-29d5-93fc44193ce4@baylibre.com>
 <OS0PR01MB5922F442759BE6F228EE0B4486549@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <538b8da4-1201-5f45-2abf-ecd22c867358@baylibre.com>
 <OS0PR01MB5922BC31FBCF85F99F17737B86549@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <ebaff694-a2d7-7eb8-5850-980e9d4e1e68@baylibre.com>
 <80fdc5a0-ddb8-5a0f-eb8c-ef7988ced638@baylibre.com>
 <164241711700.10801.9011781958267060147@Monstersaurus>
 <4f214ea2-5f9f-1217-6e65-f92e434ed826@baylibre.com>
 <164242831905.10801.10615379536917395435@Monstersaurus>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <92f37b42-23db-4aab-5262-911d07b6301f@baylibre.com>
Date: Mon, 17 Jan 2022 15:07:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <164242831905.10801.10615379536917395435@Monstersaurus>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_060748_673511_4A04741A 
X-CRM114-Status: GOOD (  22.31  )
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

On 17/01/2022 15:05, Kieran Bingham wrote:
> Quoting Neil Armstrong (2022-01-17 13:53:47)
>> On 17/01/2022 11:58, Kieran Bingham wrote:
>>> Hi Neil,
> 
> <big snips to clear up contexts>
> 
>>> This fixes the issue for me here on an H3 Salvator-XS.
>>>
>>> Could you add...
>>>
>>> Bisected-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>>> Tested-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>>>
>>> alongside Biju's Reported-by: tag when posting as a fix please?
>>
>>
>> Which patch did you test ?
> 
> Ah, yes that's not clear is it - sorry! I replied in the wrong place on
> the thread when I went back to the mail ... see below...
> 
>>>> I'm not happy with this version since it's merely a hack which makes it work.
>>>>
>>>> Can you test the following change instead, it's correctly handles your situation in a generic manner.
>>>>
>>>> ========================><=============================
>>>> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>>>> index 54d8fdad395f..9f2e1cac0ae2 100644
>>>> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>>>> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>>>> @@ -2551,8 +2551,9 @@ static u32 *dw_hdmi_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
>>>>         if (!output_fmts)
>>>>                 return NULL;
>>>>
>>>> -       /* If dw-hdmi is the only bridge, avoid negociating with ourselves */
>>>> -       if (list_is_singular(&bridge->encoder->bridge_chain)) {
>>>> +       /* If dw-hdmi is the first or only bridge, avoid negociating with ourselves */
>>>> +       if (list_is_singular(&bridge->encoder->bridge_chain) ||
>>>> +           list_is_first(&bridge->chain_node, &bridge->encoder->bridge_chain)) {
>>>>                 *num_output_fmts = 1;
>>>>                 output_fmts[0] = MEDIA_BUS_FMT_FIXED;
>>>>
>>>> @@ -2673,6 +2674,10 @@ static u32 *dw_hdmi_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
>>>>         if (!input_fmts)
>>>>                 return NULL;
>>>>
>>>> +       /* If dw-hdmi is the first bridge fall-back to safe output format */
>>>> +       if (list_is_first(&bridge->chain_node, &bridge->encoder->bridge_chain))
>>>> +               output_fmt = MEDIA_BUS_FMT_FIXED;
>>>> +
>>>>         switch (output_fmt) {
>>>>         /* If MEDIA_BUS_FMT_FIXED is tested, return default bus format */
>>>>         case MEDIA_BUS_FMT_FIXED:
>>>> ========================><=============================
> 
> Sorry, I replied in the wrong part of the thread.
> 
> Here's the direct diff on my local tree:
> 
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index 54d8fdad395f..cac9a87949f1 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -2551,8 +2551,10 @@ static u32 *dw_hdmi_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
>         if (!output_fmts)
>                 return NULL;
>  
> -       /* If dw-hdmi is the only bridge, avoid negociating with ourselves */
> -       if (list_is_singular(&bridge->encoder->bridge_chain)) {
> +       /* If dw-hdmi is the first or only bridge, avoid negociating with ourselves */
> +       if (list_is_singular(&bridge->encoder->bridge_chain) ||
> +           list_is_first(&bridge->chain_node, &bridge->encoder->bridge_chain)) {
> +
>                 *num_output_fmts = 1;
>                 output_fmts[0] = MEDIA_BUS_FMT_FIXED;
>  
> @@ -2673,6 +2675,10 @@ static u32 *dw_hdmi_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
>         if (!input_fmts)
>                 return NULL;
>  
> +       /* If dw-hdmi is the first bridge fall-back to safe output format */
> +       if (list_is_first(&bridge->chain_node, &bridge->encoder->bridge_chain))
> +               output_fmt = MEDIA_BUS_FMT_FIXED;
> +
>         switch (output_fmt) {
>         /* If MEDIA_BUS_FMT_FIXED is tested, return default bus format */
>         case MEDIA_BUS_FMT_FIXED:
> 
> Which I believe matches the above.

Ok thanks of clarifying !

let me post it asap.

Neil

> 
> --
> Kieran
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
