Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A255C433EF
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 May 2022 13:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=om0jj4+0BtQoBBBf52OiS+tLA7oWsW15v+F1CpphNDs=; b=BYEXbtXlswzxsT
	Q81zJg9qoCpCWIyN7za4DZJmB8Xg2QkzdwPrDbAAnHTgjCcJDy90eTxSDjPwh2BA2mRLcZSaGgH8h
	6ia6JGo57HlOYBz2zpsKM8SFS4/F9R0owEl/HnHVTeIV5sbcp5X/0oDHm8RdZAU047eWiOsbokd3w
	GSp2Z0/XhBXffXZArpqRKP0GG0Oi0YDfev1SwftjBh5YuNKCGr7Kf2qDQP4qCfP5Lcw26Q/e2kIPQ
	CsUypEKycx428gEv4htPoZ+eqVMLulcVZttLktV/HHPGOgpsMs53IpT8F+IuxzrE6W2hNssu//TWg
	gvu1fMK1ATV+Ws8CvcYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlW6O-001GE2-9d; Mon, 02 May 2022 13:28:36 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlW6L-001GCY-K2
 for linux-amlogic@lists.infradead.org; Mon, 02 May 2022 13:28:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651498112;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2zV+k9kqlgz67AfOxcNykb0h39cTNVnn0WXnNEGgjk4=;
 b=M/bOdoL2S3N0JICWRmvfdoNBvP4iNrDAP1wSgx/MeZZQL2CSowHRGcH3mF5Gt1s8xHPhCN
 SX7OFMMemNWaKzv/qjEmY3I630B0PmkjWeVJZ+08PF/1KgZ0hh5grd8LMv9v5B3qjzJc7d
 UaFePn/FknHIegcRpdvjKAe8qaTrvR4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-635-lmCFOcObPbirM5gh6g_xwQ-1; Mon, 02 May 2022 09:28:31 -0400
X-MC-Unique: lmCFOcObPbirM5gh6g_xwQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 v191-20020a1cacc8000000b0038ce818d2efso5042415wme.1
 for <linux-amlogic@lists.infradead.org>; Mon, 02 May 2022 06:28:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2zV+k9kqlgz67AfOxcNykb0h39cTNVnn0WXnNEGgjk4=;
 b=iNsd5m+Fp36oPiFh/FE9HhX2YHa4460yLvXOCfTEYHN+DThxOEu0SicvbVnK+deWN+
 +yt3Pw4MKKdNkEPFifooeWERG5qBAU59qeyXJsR46EL/abAk7tXnF4tOXf1Snx79Fnp0
 WWRz1E1/f2+C3Uq/gDQHAw3MS8DjSSgIpDcghqW8qfShhzHFGhn3XaQiBtM8Kb7Yy9Ei
 jMQVwmTdbLDvkzZvWekn7qwryUssPJpbAjVteVYInnDBNBrQYGTVyLc0rkKMyNY3P+yt
 Je1Ul2BdqjB0GyUe+3fxNL4kY5zpdbQdA3csZHqTJWHevfpP9rzf1SUWpeUlM01iMBxm
 FamQ==
X-Gm-Message-State: AOAM533ifLSx69SHG7Dk8GAycy6pqeGdJ8Nsbu8TZm/Gz5o0goLxNu2W
 CkhhicPqK2bEpeK7qMwP4HjRJ18Iy3363WuJXXjke8BLbPZYmfm45aT6F+keSKNQfQ/yi4pciGY
 5TvohBZi/H+OEy5r8I3lwmpwLJKolCUc=
X-Received: by 2002:a05:600c:1c20:b0:394:25cb:1404 with SMTP id
 j32-20020a05600c1c2000b0039425cb1404mr12244377wms.52.1651498109809; 
 Mon, 02 May 2022 06:28:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzu2jM2LG+DX+dIVzq45o/V1TxQWIpFsCwnWfT+RmC19xyv+UYhuI/wi7PI/5TDnuN7eFlQ9w==
X-Received: by 2002:a05:600c:1c20:b0:394:25cb:1404 with SMTP id
 j32-20020a05600c1c2000b0039425cb1404mr12244330wms.52.1651498109516; 
 Mon, 02 May 2022 06:28:29 -0700 (PDT)
Received: from [192.168.1.129] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 l3-20020adfa383000000b0020c5253d8bcsm6985850wrb.8.2022.05.02.06.28.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 May 2022 06:28:29 -0700 (PDT)
Message-ID: <c0703a8c-3263-6dde-07e4-9f03680c6726@redhat.com>
Date: Mon, 2 May 2022 15:28:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 2/3] drm/fb-helper: Rename preferred_bpp
 drm_fbdev_generic_setup() parameter
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Emma Anholt <emma@anholt.net>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 David Airlie <airlied@linux.ie>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Paul Cercueil <paul@crapouillou.net>, Gerd Hoffmann <kraxel@redhat.com>,
 Shawn Guo <shawnguo@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Jerome Brunet <jbrunet@baylibre.com>, Marek Vasut <marex@denx.de>,
 Hao Fang <fanghao11@huawei.com>, linux-aspeed@lists.ozlabs.org,
 Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Alexey Brodkin <abrodkin@synopsys.com>,
 Michal Simek <michal.simek@xilinx.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Xinliang Liu <xinliang.liu@linaro.org>, Chen-Yu Tsai <wens@csie.org>,
 Joel Stanley <joel@jms.id.au>, Dave Airlie <airlied@redhat.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 virtualization@lists.linux-foundation.org, NXP Linux Team
 <linux-imx@nxp.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Chen Feng <puck.chen@hisilicon.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Alison Wang <alison.wang@nxp.com>, linux-mips@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, Hans de Goede <hdegoede@redhat.com>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Alain Volmat <alain.volmat@foss.st.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-amlogic@lists.infradead.org,
 Mario Limonciello <mario.limonciello@amd.com>, Evan Quan
 <evan.quan@amd.com>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Yong Wu <yong.wu@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-sunxi@lists.linux.dev,
 amd-gfx@lists.freedesktop.org, Tomi Valkeinen <tomba@kernel.org>,
 Hyun Kwon <hyun.kwon@xilinx.com>, Boris Brezillon <bbrezillon@kernel.org>,
 Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yannick Fertre <yannick.fertre@foss.st.com>, "Pan, Xinhui"
 <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 linux-renesas-soc@vger.kernel.org, Solomon Chiu <solomon.chiu@amd.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alex Deucher <alexander.deucher@amd.com>, Tian Tao <tiantao6@hisilicon.com>,
 spice-devel@lists.freedesktop.org, Jyri Sarha <jyri.sarha@iki.fi>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20220502084830.285639-1-javierm@redhat.com>
 <20220502084830.285639-3-javierm@redhat.com>
 <Ym/BtOM3OlPoE+nr@pendragon.ideasonboard.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <Ym/BtOM3OlPoE+nr@pendragon.ideasonboard.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220502_062833_861995_A750B2AB 
X-CRM114-Status: GOOD (  19.60  )
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

Hello Laurent,

On 5/2/22 13:34, Laurent Pinchart wrote:
> Hi Javier,
> 
> Thank you for the patch.
> 

Thanks a lot for your feedback.

[snip]

>> +++ b/drivers/gpu/drm/drm_fb_helper.c
>> @@ -2501,8 +2501,16 @@ static const struct drm_client_funcs drm_fbdev_client_funcs = {
>>  /**
>>   * drm_fbdev_generic_setup() - Setup generic fbdev emulation
>>   * @dev: DRM device
>> - * @preferred_bpp: Preferred bits per pixel for the device.
>> - *                 @dev->mode_config.preferred_depth is used if this is zero.
>> + * @options: options for the registered framebuffer.
>> + *
>> + * The @options parameter is a multi-field parameter that can contain
>> + * different options for the emulated framebuffer device registered.
>> + *
>> + * The options must be set using DRM_FB_SET_OPTION() and obtained using
>> + * DRM_FB_GET_OPTION(). The options field are the following:
>> + *
>> + * * DRM_FB_BPP: bits per pixel for the device. If the field is not set,
>> + *               @dev->mode_config.preferred_depth is used instead.
> 
> Do I assume correctly that a driver that would need to set multiple
> options would do something like
> 
> 	drm_fbdev_generic_setup(dev, DRM_FB_SET_OPTION(DRM_FB_BPP, 32) |
> 				DRM_FB_SET_OPTION(DRM_FB_FW, 1));
>

That's correct, yes.
 
> ? If so, I would rename DRM_FB_SET_OPTION() to DRM_FB_OPTION() as it's
> computing the value of the option bitfield, it doesn't actually set it.
> Apart from that,
>

Right. I'll rename it.
 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 

Thanks!

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
