Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C8EDC433F5
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Jan 2022 10:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:Cc:To:From:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=AeG9+tkeWX43MoXhNAzK79v/Jv7hvqfMlgl5oVt2YR4=; b=UmgW2LfLxpwD3LYUslk1CePEfm
	Y3SX8IkuigcHt0ezDLh3v03T4dv3dfNlPOHUV1NimCCBQMUTBQte8XerOIO+G99Lt1BScWG6haJnd
	eby3esp4oEIhhsLzaNFyfNE5MrZtCwbImz4PxsSc9FDf5U3VqJ1Uy2xIY5BSSB95aY+jz0NX60+xL
	nBivGg7iF0vxhftVFs5XclFweepa+gSC3GpdHEOHIt2UC0El8HUxmTePsAcBKNojsZGb9qWxB8EMV
	6fZZuA3sgqUoiDy0s7Zk8cVcCpQxJLXyn3/CsVav1oPitWiTKrBIK1qSCznOlzc8Yv/hQkEdJfY59
	bO9mJdfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9OwM-00ERGT-Gz; Mon, 17 Jan 2022 10:08:42 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9OwI-00ERF6-6d
 for linux-amlogic@lists.infradead.org; Mon, 17 Jan 2022 10:08:40 +0000
Received: by mail-wm1-x333.google.com with SMTP id c2so13592027wml.1
 for <linux-amlogic@lists.infradead.org>; Mon, 17 Jan 2022 02:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:from:to:cc:references:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IYRaNLgJ4yJzlec8LXTkLzqBlWzt7l+Bmtx38lvJCNM=;
 b=eUbvF4VPlUlQEX3bl8gK08o8+fm2AeIL8rKeLwEm4Mgbbrcm7vUbI/1hbqHCudyrm5
 dO7z6vFmeIpDI9bRVpmDfiK9h0pj7F/sZGpBjqjXtavBGd1RUJT12JzE3+noYuDFf5kO
 r0lorSytq3SLnxGkdYxVYiBD4JtT1A+SE6R18FcdCdKHS/rd2B5FGBsq6whtm0wrJcvn
 dC3UnEWaqI3qVCmJKlZYaTuk3ML9Rz1dmG2eEKZtCGEqnSz9p4QGlcPaa/diMfyXuhJS
 E8lowMVxN0ddv/2z+8hw8C5rCPA5nrf3qs1RxHvHt2duFF709NO7/8ez97w2h91nLzMC
 CEmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:cc:references:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=IYRaNLgJ4yJzlec8LXTkLzqBlWzt7l+Bmtx38lvJCNM=;
 b=6crobLAw/BQmIn58trN9RcVzcsB4soMitUoQx0ewWWrqwV9LRvSABbL/YdsKQpP5wN
 JfZFeKBtPZ7gt4dDvqR8TM+cngjVAuAhAM+Bq9rKm604GHp4LLZAJC5QxEQcNDmemC7R
 3DnYYjdH+UvYF5NW+Bp8FsmhWxmd6pX/ORBIi9twwrFym1VWGx+Pr3xwl9+LjuoaU9f9
 cOWSoZpPSmqNe4rG2yyu80LvOdd7s3IfVeCeFRIy9XEDfaoyuuouAiTqYK/0ockhsOx0
 iDurAtR7L/BygQjnihPDROmMP6TpoYH+WcaY2W3l7y5ASiE41+bRBg0Px6XuQ6qNSe6i
 ATHQ==
X-Gm-Message-State: AOAM531FB/DxplhNrkyUciDgk/IjF/SiKKGy5DFbsJRRWd91b4XVq7CJ
 ZMq/wv9AjY/DPCuID8jWIm1tog==
X-Google-Smtp-Source: ABdhPJz1u8ndzlgvNJ66KvrvcfG89kCkesz3HbRN5exIsEafGsgWfgVlqeUt1GFx82E+4zthDzUTVw==
X-Received: by 2002:a05:600c:4fd4:: with SMTP id
 o20mr4478226wmq.155.1642414116397; 
 Mon, 17 Jan 2022 02:08:36 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:c004:9fe1:fbda:2d0c?
 ([2001:861:44c0:66c0:c004:9fe1:fbda:2d0c])
 by smtp.gmail.com with ESMTPSA id f17sm3458570wmq.28.2022.01.17.02.08.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jan 2022 02:08:35 -0800 (PST)
Subject: Re: dw_hdmi is showing wrong colour after commit
 7cd70656d1285b79("drm/bridge: display-connector: implement bus fmts
 callbacks")
From: Neil Armstrong <narmstrong@baylibre.com>
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
 <19dd6013-8a31-b2ed-29d5-93fc44193ce4@baylibre.com>
 <OS0PR01MB5922F442759BE6F228EE0B4486549@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <538b8da4-1201-5f45-2abf-ecd22c867358@baylibre.com>
 <OS0PR01MB5922BC31FBCF85F99F17737B86549@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <ebaff694-a2d7-7eb8-5850-980e9d4e1e68@baylibre.com>
Organization: Baylibre
Message-ID: <80fdc5a0-ddb8-5a0f-eb8c-ef7988ced638@baylibre.com>
Date: Mon, 17 Jan 2022 11:08:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <ebaff694-a2d7-7eb8-5850-980e9d4e1e68@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_020838_292571_C3F93337 
X-CRM114-Status: GOOD (  30.81  )
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

Hi again,

On 14/01/2022 15:40, Neil Armstrong wrote:
> Hi,
> 
> On 14/01/2022 15:23, Biju Das wrote:
>>
>>
>>> -----Original Message-----
>>> From: Neil Armstrong <narmstrong@baylibre.com>
>>> Sent: 14 January 2022 13:56
>>> To: Biju Das <biju.das.jz@bp.renesas.com>; Fabio Estevam
>>> <festevam@gmail.com>
>>> Cc: daniel@ffwll.ch; Laurent.pinchart@ideasonboard.com;
>>> robert.foss@linaro.org; jonas@kwiboo.se; jernej.skrabec@gmail.com;
>>> martin.blumenstingl@googlemail.com; linux-amlogic@lists.infradead.org;
>>> linux-arm-kernel@lists.infradead.org; dri-devel@lists.freedesktop.org;
>>> linux-kernel@vger.kernel.org; linux-renesas-soc@vger.kernel.org
>>> Subject: Re: dw_hdmi is showing wrong colour after commit
>>> 7cd70656d1285b79("drm/bridge: display-connector: implement bus fmts
>>> callbacks")
>>>
>>> Hi,
>>>
>>> On 14/01/2022 12:08, Biju Das wrote:
>>>> Hi Neil,
>>>>
>>>>> Subject: Re: dw_hdmi is showing wrong colour after commit
>>>>> 7cd70656d1285b79("drm/bridge: display-connector: implement bus fmts
>>>>> callbacks")
>>>>>
>>>>> On 14/01/2022 09:29, Biju Das wrote:
>>>>>> Hi Neil,
>>>>>>
>>>>>> + renesas-soc
>>>>>>
>>>>>>> Subject: Re: dw_hdmi is showing wrong colour after commit
>>>>>>> 7cd70656d1285b79("drm/bridge: display-connector: implement bus fmts
>>>>>>> callbacks")
>>>>>>>
>>>>>>> Hi,
>>>>>>>
>>>>>>> On 13/01/2022 21:01, Fabio Estevam wrote:
>>>>>>>> Hi Biju,
>>>>>>>>
>>>>>>>> On Thu, Jan 13, 2022 at 2:45 PM Biju Das
>>>>>>>> <biju.das.jz@bp.renesas.com>
>>>>>>> wrote:
>>>>>>>>>
>>>>>>>>> Hi All,
>>>>>>>>>
>>>>>>>>> RZ/G2{H, M, N} SoC has dw_hdmi IP and it was working ok(colour)
>>>>>>>>> till the commit
>>>>>>>>> 7cd70656d1285b79("drm/bridge: display-connector: implement bus
>>>>>>>>> fmts
>>>>>>> callbacks").
>>>>>>>>>
>>>>>>>>> After this patch, the screen becomes greenish(may be it is
>>>>>>>>> setting it
>>>>>>> into YUV format??).
>>>>>>>>>
>>>>>>>>> By checking the code, previously it used to call get_input_fmt
>>>>>>>>> callback
>>>>>>> and set colour as RGB24.
>>>>>>>>>
>>>>>>>>> After this commit, it calls get_output_fmt_callbck and returns 3
>>>>>>>>> outputformats(YUV16, YUV24 and RGB24) And get_input_fmt callback,
>>>>>>>>> I see
>>>>>>> the outputformat as YUV16 instead of RGB24.
>>>>>>>>>
>>>>>>>>> Not sure, I am the only one seeing this issue with dw_HDMI driver.
>>>>>>>
>>>>>>> This patch was introduced to maintain the bridge color format
>>>>>>> negotiation after using DRM_BRIDGE_ATTACH_NO_CONNECTOR, but it
>>>>>>> seems it behaves incorrectly if the first bridge doesn't implement
>>>>>>> the negotiation callbacks.
>>>>>>>
>>>>>>> Let me check the code to see how to fix that.
>>>>>>
>>>>>> Thanks for the information, I am happy to test the patch/fix.
>>>>>>
>>>>>> Cheers,
>>>>>> Biju
>>>>>>
>>>>>>>
>>>>>>>>
>>>>>>>> I have tested linux-next 20220112 on a imx6q-sabresd board, which
>>>>> shows:
>>>>>>>>
>>>>>>>> dwhdmi-imx 120000.hdmi: Detected HDMI TX controller v1.30a with
>>>>>>>> HDCP (DWC HDMI 3D TX PHY)
>>>>>>>>
>>>>>>>> The colors are shown correctly here.
>>>>>>>>
>>>>>>>
>>>>>>> The imx doesn't use DRM_BRIDGE_ATTACH_NO_CONNECTOR so the
>>>>>>> negotiation fails and use the RGB fallback input & output format.
>>>>>>>
>>>>>>> Anyway thanks for testing
>>>>>>>
>>>>>>> Neil
>>>>>
>>>>> Can you test :
>>>>>
>>>>> ==><===============================
>>>>> diff --git a/drivers/gpu/drm/drm_bridge.c
>>>>> b/drivers/gpu/drm/drm_bridge.c index c96847fc0ebc..7019acd37716
>>>>> 100644
>>>>> --- a/drivers/gpu/drm/drm_bridge.c
>>>>> +++ b/drivers/gpu/drm/drm_bridge.c
>>>>> @@ -955,7 +955,14 @@ drm_atomic_bridge_chain_select_bus_fmts(struct
>>>>> drm_bridge *bridge,
>>>>>         last_bridge_state =
>>>>> drm_atomic_get_new_bridge_state(crtc_state-
>>>>>> state,
>>>>>
>>>>> last_bridge);
>>>>>
>>>>> -       if (last_bridge->funcs->atomic_get_output_bus_fmts) {
>>>>> +       /*
>>>>> +        * Only negociate with real values if both end of the bridge
>>> chain
>>>>> +        * support negociation callbacks, otherwise you can end in a
>>>>> situation
>>>>> +        * where the selected output format doesn't match with the
>>>>> + first
>>>>> bridge
>>>>> +        * output format.
>>>>> +        */
>>>>> +       if (bridge->funcs->atomic_get_input_bus_fmts &&
>>>>> +           last_bridge->funcs->atomic_get_output_bus_fmts) {
>>>>>                 const struct drm_bridge_funcs *funcs =
>>>>> last_bridge->funcs;
>>>>>
>>>>>                 /*
>>>>> @@ -980,7 +987,12 @@ drm_atomic_bridge_chain_select_bus_fmts(struct
>>>>> drm_bridge *bridge,
>>>>>                 if (!out_bus_fmts)
>>>>>                         return -ENOMEM;
>>>>>
>>>>> -               if (conn->display_info.num_bus_formats &&
>>>>> +               /*
>>>>> +                * If first bridge doesn't support negociation, use
>>>>> MEDIA_BUS_FMT_FIXED
>>>>> +                * as a safe value for the whole bridge chain
>>>>> +                */
>>>>> +               if (bridge->funcs->atomic_get_input_bus_fmts &&
>>>>> +                   conn->display_info.num_bus_formats &&
>>>>>                     conn->display_info.bus_formats)
>>>>>                         out_bus_fmts[0] = conn-
>>>>>> display_info.bus_formats[0];
>>>>>                 else
>>>>> ==><===============================
>>>>>
>>>>> This should exclude your situation where the first bridge doesn't
>>>>> support negociation.
>>>>
>>>> I have tested this fix with Linux next-20220114. Still I see colour
>>> issue.
>>>>
>>>> It is still negotiating and it is calling get_output_fmt_callbck
>>>>
>>>> [    3.460155] ########dw_hdmi_bridge_atomic_get_output_bus_fmts
>>> MEDIA_BUS_FMT_UYVY8_1X16=0#########
>>>> [    3.460180] ########dw_hdmi_bridge_atomic_get_output_bus_fmts
>>> MEDIA_BUS_FMT_YUV8_1X24=1#########
>>>> [    3.460202] ########dw_hdmi_bridge_atomic_get_output_bus_fmts
>>> MEDIA_BUS_FMT_RGB888_1X24=2#########
>>>>
>>>> And In get_input_fmt callback, I See the outputformat as YUV16 instead
>>> of RGB24.
>>>>
>>>> [    3.460319] ########dw_hdmi_bridge_atomic_get_input_bus_fmts
>>> MEDIA_BUS_FMT_UYVY8_1X16#########
>>>> [    3.473644] ########hdmi_video_sample
>>> MEDIA_BUS_FMT_UYVY8_1X16#########
>>>
>>> OK, looking at rcar-du, the dw-hdmi bridge is directly connected to the
>>> encoder.
>>
>> Yep.
>>
>>>
>>> Let me figure that out, no sure I can find a clean solution except putting
>>> back RGB24 before YUV.
>>>
>>> Anyway please test that:
>>
>> It works now after reordering.
>>
>> [    3.493302] ########dw_hdmi_bridge_atomic_get_output_bus_fmts MEDIA_BUS_FMT_RGB888_1X24=0#########
>> [    3.493326] ########dw_hdmi_bridge_atomic_get_output_bus_fmts MEDIA_BUS_FMT_YUV8_1X24=1#########
>> [    3.493348] ########dw_hdmi_bridge_atomic_get_output_bus_fmts MEDIA_BUS_FMT_UYVY8_1X16=2#########
>>
>> [    3.493463] ########dw_hdmi_bridge_atomic_get_input_bus_fmts MEDIA_BUS_FMT_RGB888_1X24#########
>> [    3.506797] ########hdmi_video_sample MEDIA_BUS_FMT_RGB888_1X24#########
>>
>> Is it acceptable solution to the users of dw_hdmi driver? May be it is worth to post a patch.
>> at least it is fixing the colour issue??
> 
> Yes, it gets back to default behavior before negociation, nevertheless we need to think
> how to handle your use-case correctly at some point.
> 
> I'll post this as a patch ASAP so it gets applied before landing in linus master.
> 
> Neil
> 
>>
>> Regards,
>> Biju
>>
>>>
[...]

I'm not happy with this version since it's merely a hack which makes it work.

Can you test the following change instead, it's correctly handles your situation in a generic manner.

========================><=============================
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 54d8fdad395f..9f2e1cac0ae2 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2551,8 +2551,9 @@ static u32 *dw_hdmi_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
        if (!output_fmts)
                return NULL;

-       /* If dw-hdmi is the only bridge, avoid negociating with ourselves */
-       if (list_is_singular(&bridge->encoder->bridge_chain)) {
+       /* If dw-hdmi is the first or only bridge, avoid negociating with ourselves */
+       if (list_is_singular(&bridge->encoder->bridge_chain) ||
+           list_is_first(&bridge->chain_node, &bridge->encoder->bridge_chain)) {
                *num_output_fmts = 1;
                output_fmts[0] = MEDIA_BUS_FMT_FIXED;

@@ -2673,6 +2674,10 @@ static u32 *dw_hdmi_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
        if (!input_fmts)
                return NULL;

+       /* If dw-hdmi is the first bridge fall-back to safe output format */
+       if (list_is_first(&bridge->chain_node, &bridge->encoder->bridge_chain))
+               output_fmt = MEDIA_BUS_FMT_FIXED;
+
        switch (output_fmt) {
        /* If MEDIA_BUS_FMT_FIXED is tested, return default bus format */
        case MEDIA_BUS_FMT_FIXED:
========================><=============================

Thanks,
Neil


>>>
>>> Neil
>>>
>>>>
>>>> Regards,
>>>> Biju
>>>>
>>
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
