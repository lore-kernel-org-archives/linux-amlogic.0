Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DD81C433F5
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Jan 2022 13:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=336FkU+8kvg7cxN+YXnCmcPZMl0Ur1tHtz5uHpMDbZ8=; b=o8Dswk6jBv/y1/jpw7E9W0kFB1
	BpcrbeMPT9z/kwOEeuPU78BHs4o1+1I2WWYDtTp0kuJXLrl+Z3XA839yCQoVzz7c+sIq92WkNOFvS
	CcKdhgZUevQ17BToGEhXvZ54z3vx/k+WmE1dhvF4SmJWfZXkutqv9s7y944oiGzGIGUO6uBKQZbZw
	fGbnUHUey9tqhvfvP4xjhHipfnSVRKtsDaRs+BORB+aJKUKrMgHnHyFiS6aREGGqDPYNJIc+EU2sp
	aVtZnR1GXXDqfG0tuZhx2f5JemmtRf8zVxGfFbmccog2gKr7Colha7xnpzFNBzv2fSr59uRBGSlub
	GbtXaxPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8N4Q-009HFJ-Rd; Fri, 14 Jan 2022 13:56:46 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8N4E-009HCj-0g
 for linux-amlogic@lists.infradead.org; Fri, 14 Jan 2022 13:56:35 +0000
Received: by mail-wr1-x431.google.com with SMTP id r28so15799194wrc.3
 for <linux-amlogic@lists.infradead.org>; Fri, 14 Jan 2022 05:56:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5udCTvqUXGS4tOVFmzGXWH5rXTQA7PPfJYqSXxKYcYQ=;
 b=7ITvWIaLhJe37XuKQXuf98Fd+kG5nDnoL/HRhUEaZA1r5ccsjpvpMYj0cLxzoZb1Bd
 OD/fYp1DajOnFUydYEhpcfgUtJI7ZKeFtVtk7rLWDnnU8S0jiMjjNYkpEjohDf5wrSMX
 WvQ6TRS8NTo1ZZhrLKP47Fj5AyVNEePU5uTHXzacuAyQwb/vCUeXlnhaIVsJF3RVxT/T
 MrB1n9kIIOIyuoNi6Qks22fUZSLCCZ7wwG124j9P/e6hvSeUA26iB1wT1BCcr8q/OdVr
 +XvmQD/ZPcbjljPbP7+XJwUvuRiR3T//xxkQijKkvlPknt92OuHK8OP5lgQ3y9mqmEhx
 qziA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=5udCTvqUXGS4tOVFmzGXWH5rXTQA7PPfJYqSXxKYcYQ=;
 b=jePHMPjvb53bkp2Nl54Rdbo4I+TcZgxT/lD+zsS1LWp4DK7GCvGmlW/Dpqj6sqAzfL
 ZTiq36NWykNZX7Btjy8xU0UpzTXWl2fQSvJ/+kpYRNoSbyA6YoTS2X88eJ6OZU2+NkYP
 9EbN0ZOvmVSwUV8Y4KHipKY+SoUGOcRA+blQhgHmeseUUf6C0cuzb3RKWmVkvFWddNHQ
 WmHqozvIyhzv88Jf3qRDjNdw+bD4jxDpxpWhSi82OhVUzqWUIZF4jfiY025t+n77uW67
 JjxEWziizDihAasSv2Ui813uDREwlzQE0EoZUQ6Ssruz3wcsM5AltWhuikDwsItoMLNX
 sO2g==
X-Gm-Message-State: AOAM533fNMWug2KVvcMkq6RWR46NQtL6U+pxNXbOy9WRDvAAFVJhm5lo
 s7LT3xCHgvLOsFdsNEe18EB7Hw==
X-Google-Smtp-Source: ABdhPJxauR9mnkqcFHnV53qVgtix4YH8ysgrrp0WL0fPncVC+BidoxMFeeuID+BvFpFPf3X7Me9JZg==
X-Received: by 2002:adf:f789:: with SMTP id q9mr8749145wrp.200.1642168590564; 
 Fri, 14 Jan 2022 05:56:30 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:a3fc:c40b:5afc:88ee?
 ([2001:861:44c0:66c0:a3fc:c40b:5afc:88ee])
 by smtp.gmail.com with ESMTPSA id g6sm5512201wri.80.2022.01.14.05.56.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jan 2022 05:56:30 -0800 (PST)
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
 <19dd6013-8a31-b2ed-29d5-93fc44193ce4@baylibre.com>
 <OS0PR01MB5922F442759BE6F228EE0B4486549@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <538b8da4-1201-5f45-2abf-ecd22c867358@baylibre.com>
Date: Fri, 14 Jan 2022 14:56:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <OS0PR01MB5922F442759BE6F228EE0B4486549@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220114_055634_077112_C96EF473 
X-CRM114-Status: GOOD (  27.66  )
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

Hi,

On 14/01/2022 12:08, Biju Das wrote:
> Hi Neil,
> 
>> Subject: Re: dw_hdmi is showing wrong colour after commit
>> 7cd70656d1285b79("drm/bridge: display-connector: implement bus fmts
>> callbacks")
>>
>> On 14/01/2022 09:29, Biju Das wrote:
>>> Hi Neil,
>>>
>>> + renesas-soc
>>>
>>>> Subject: Re: dw_hdmi is showing wrong colour after commit
>>>> 7cd70656d1285b79("drm/bridge: display-connector: implement bus fmts
>>>> callbacks")
>>>>
>>>> Hi,
>>>>
>>>> On 13/01/2022 21:01, Fabio Estevam wrote:
>>>>> Hi Biju,
>>>>>
>>>>> On Thu, Jan 13, 2022 at 2:45 PM Biju Das
>>>>> <biju.das.jz@bp.renesas.com>
>>>> wrote:
>>>>>>
>>>>>> Hi All,
>>>>>>
>>>>>> RZ/G2{H, M, N} SoC has dw_hdmi IP and it was working ok(colour)
>>>>>> till the commit
>>>>>> 7cd70656d1285b79("drm/bridge: display-connector: implement bus fmts
>>>> callbacks").
>>>>>>
>>>>>> After this patch, the screen becomes greenish(may be it is setting
>>>>>> it
>>>> into YUV format??).
>>>>>>
>>>>>> By checking the code, previously it used to call get_input_fmt
>>>>>> callback
>>>> and set colour as RGB24.
>>>>>>
>>>>>> After this commit, it calls get_output_fmt_callbck and returns 3
>>>>>> outputformats(YUV16, YUV24 and RGB24) And get_input_fmt callback, I
>>>>>> see
>>>> the outputformat as YUV16 instead of RGB24.
>>>>>>
>>>>>> Not sure, I am the only one seeing this issue with dw_HDMI driver.
>>>>
>>>> This patch was introduced to maintain the bridge color format
>>>> negotiation after using DRM_BRIDGE_ATTACH_NO_CONNECTOR, but it seems
>>>> it behaves incorrectly if the first bridge doesn't implement the
>>>> negotiation callbacks.
>>>>
>>>> Let me check the code to see how to fix that.
>>>
>>> Thanks for the information, I am happy to test the patch/fix.
>>>
>>> Cheers,
>>> Biju
>>>
>>>>
>>>>>
>>>>> I have tested linux-next 20220112 on a imx6q-sabresd board, which
>> shows:
>>>>>
>>>>> dwhdmi-imx 120000.hdmi: Detected HDMI TX controller v1.30a with HDCP
>>>>> (DWC HDMI 3D TX PHY)
>>>>>
>>>>> The colors are shown correctly here.
>>>>>
>>>>
>>>> The imx doesn't use DRM_BRIDGE_ATTACH_NO_CONNECTOR so the negotiation
>>>> fails and use the RGB fallback input & output format.
>>>>
>>>> Anyway thanks for testing
>>>>
>>>> Neil
>>
>> Can you test :
>>
>> ==><===============================
>> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
>> index c96847fc0ebc..7019acd37716 100644
>> --- a/drivers/gpu/drm/drm_bridge.c
>> +++ b/drivers/gpu/drm/drm_bridge.c
>> @@ -955,7 +955,14 @@ drm_atomic_bridge_chain_select_bus_fmts(struct
>> drm_bridge *bridge,
>>         last_bridge_state = drm_atomic_get_new_bridge_state(crtc_state-
>>> state,
>>                                                             last_bridge);
>>
>> -       if (last_bridge->funcs->atomic_get_output_bus_fmts) {
>> +       /*
>> +        * Only negociate with real values if both end of the bridge chain
>> +        * support negociation callbacks, otherwise you can end in a
>> situation
>> +        * where the selected output format doesn't match with the first
>> bridge
>> +        * output format.
>> +        */
>> +       if (bridge->funcs->atomic_get_input_bus_fmts &&
>> +           last_bridge->funcs->atomic_get_output_bus_fmts) {
>>                 const struct drm_bridge_funcs *funcs = last_bridge->funcs;
>>
>>                 /*
>> @@ -980,7 +987,12 @@ drm_atomic_bridge_chain_select_bus_fmts(struct
>> drm_bridge *bridge,
>>                 if (!out_bus_fmts)
>>                         return -ENOMEM;
>>
>> -               if (conn->display_info.num_bus_formats &&
>> +               /*
>> +                * If first bridge doesn't support negociation, use
>> MEDIA_BUS_FMT_FIXED
>> +                * as a safe value for the whole bridge chain
>> +                */
>> +               if (bridge->funcs->atomic_get_input_bus_fmts &&
>> +                   conn->display_info.num_bus_formats &&
>>                     conn->display_info.bus_formats)
>>                         out_bus_fmts[0] = conn-
>>> display_info.bus_formats[0];
>>                 else
>> ==><===============================
>>
>> This should exclude your situation where the first bridge doesn't support
>> negociation.
> 
> I have tested this fix with Linux next-20220114. Still I see colour issue.
> 
> It is still negotiating and it is calling get_output_fmt_callbck
> 
> [    3.460155] ########dw_hdmi_bridge_atomic_get_output_bus_fmts MEDIA_BUS_FMT_UYVY8_1X16=0#########
> [    3.460180] ########dw_hdmi_bridge_atomic_get_output_bus_fmts MEDIA_BUS_FMT_YUV8_1X24=1#########
> [    3.460202] ########dw_hdmi_bridge_atomic_get_output_bus_fmts MEDIA_BUS_FMT_RGB888_1X24=2#########
> 
> And In get_input_fmt callback, I See the outputformat as YUV16 instead of RGB24.
> 
> [    3.460319] ########dw_hdmi_bridge_atomic_get_input_bus_fmts MEDIA_BUS_FMT_UYVY8_1X16#########
> [    3.473644] ########hdmi_video_sample MEDIA_BUS_FMT_UYVY8_1X16#########

OK, looking at rcar-du, the dw-hdmi bridge is directly connected to the encoder.

Let me figure that out, no sure I can find a clean solution except putting back RGB24 before YUV.

Anyway please test that:

==><===============================
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 54d8fdad395f..68f79094f648 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2589,45 +2589,44 @@ static u32 *dw_hdmi_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
 	}

 	/*
-	 * Order bus formats from 16bit to 8bit and from YUV422 to RGB
+	 * Order bus formats from 16bit to 8bit and from RGB to YUV422
 	 * if supported. In any case the default RGB888 format is added
 	 */

 	if (max_bpc >= 16 && info->bpc == 16) {
+		output_fmts[i++] = MEDIA_BUS_FMT_RGB161616_1X48;
+
 		if (info->color_formats & DRM_COLOR_FORMAT_YCRCB444)
 			output_fmts[i++] = MEDIA_BUS_FMT_YUV16_1X48;
-
-		output_fmts[i++] = MEDIA_BUS_FMT_RGB161616_1X48;
 	}

 	if (max_bpc >= 12 && info->bpc >= 12) {
-		if (info->color_formats & DRM_COLOR_FORMAT_YCRCB422)
-			output_fmts[i++] = MEDIA_BUS_FMT_UYVY12_1X24;
+		output_fmts[i++] = MEDIA_BUS_FMT_RGB121212_1X36;

 		if (info->color_formats & DRM_COLOR_FORMAT_YCRCB444)
 			output_fmts[i++] = MEDIA_BUS_FMT_YUV12_1X36;

-		output_fmts[i++] = MEDIA_BUS_FMT_RGB121212_1X36;
+		if (info->color_formats & DRM_COLOR_FORMAT_YCRCB422)
+			output_fmts[i++] = MEDIA_BUS_FMT_UYVY12_1X24;
 	}

 	if (max_bpc >= 10 && info->bpc >= 10) {
-		if (info->color_formats & DRM_COLOR_FORMAT_YCRCB422)
-			output_fmts[i++] = MEDIA_BUS_FMT_UYVY10_1X20;
+		output_fmts[i++] = MEDIA_BUS_FMT_RGB101010_1X30;

 		if (info->color_formats & DRM_COLOR_FORMAT_YCRCB444)
 			output_fmts[i++] = MEDIA_BUS_FMT_YUV10_1X30;

-		output_fmts[i++] = MEDIA_BUS_FMT_RGB101010_1X30;
+		if (info->color_formats & DRM_COLOR_FORMAT_YCRCB422)
+			output_fmts[i++] = MEDIA_BUS_FMT_UYVY10_1X20;
 	}

-	if (info->color_formats & DRM_COLOR_FORMAT_YCRCB422)
-		output_fmts[i++] = MEDIA_BUS_FMT_UYVY8_1X16;
+	output_fmts[i++] = MEDIA_BUS_FMT_RGB888_1X24;

 	if (info->color_formats & DRM_COLOR_FORMAT_YCRCB444)
 		output_fmts[i++] = MEDIA_BUS_FMT_YUV8_1X24;

-	/* Default 8bit RGB fallback */
-	output_fmts[i++] = MEDIA_BUS_FMT_RGB888_1X24;
+	if (info->color_formats & DRM_COLOR_FORMAT_YCRCB422)
+		output_fmts[i++] = MEDIA_BUS_FMT_UYVY8_1X16;

 	*num_output_fmts = i;

==><===============================

Neil

> 
> Regards,
> Biju
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
