Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CD92C00140
	for <linux-amlogic@archiver.kernel.org>; Wed, 24 Aug 2022 16:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3oWtn34ZD4IBLYpD1eHjSfvwxlmXs6V5kwYtB8Amigg=; b=QOCCrDuUJrzXQF
	+RIO41ywOrl6jstH6MVtGdOulgAb/0qcrXMGlv/eaT9KBNmXhZZqIbyq1mkfWiACJ26NVQrduHMlz
	HkWsQzMroAJ+eRaoRq2NZm/DWG7pvYm+NXXnnz9oIeAM2wEs585NEXI8Xtn9yQ7VLPwmFzmUjUnup
	C8iywYSIOylzHJJOgvSteLuaKKb0uHikJBjb95vTGcmJe1bnnFRJ1Gqse8nNiZ4GwZk+K/kNQ/R9Y
	q0eLs5NkOYhE4O2/hemUatlOnfc2ENQClp6ichSNu8Wc28snbHlpoxi8MM1EOjqMswQx6NjC9RJJq
	+nw8E84NDE/eMYEuD0KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQtj3-00EbHP-QG; Wed, 24 Aug 2022 16:59:33 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQtir-00EbC0-D2; Wed, 24 Aug 2022 16:59:22 +0000
Received: by mail-lf1-x136.google.com with SMTP id q7so21152773lfu.5;
        Wed, 24 Aug 2022 09:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc;
        bh=G82ihWj63KmrZTbNAM/UHivXSnuDSm1fupsjpoYLhDQ=;
        b=ftQ5CKHIBQWfNPo5g81XGiva+GwFlrcerSnJrQBQCJJeoaidvCPKD6uXoTh/koiu2i
         IJMMx3aVbOysnPqfl8kMWBhLA0YYhCEdMwB6db5hAcjW6KG31Q6CvL3nSbLrkrMBOu6m
         KQNymPiBiKVm3hs6kVoF0nCKXmyRBEQT1+7X1MSCGyIRK4fM1mZVzooY6bu3fIP+o+Pq
         uVO0e6XYDC8GXCtTIfEZkjhEtcvE7BJTJg/aCByHvv3hMnCoaKFm85qay6Fp9JCzyLMu
         qiEJ6OUFKRQeVmhhCoOVhb4GNPttwjvS0pIocjNxF74S8pp45y4eQ40da0WCDzUJosWj
         VJUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:x-gm-message-state:from:to:cc;
        bh=G82ihWj63KmrZTbNAM/UHivXSnuDSm1fupsjpoYLhDQ=;
        b=wk3Drd9REv6GBhADMhWiJIgBov4F12pirmmGA6g/RBcwbqkd09DFB1kTSiq/wslusZ
         GfcKKBxvqLHDnhd0dV9svq2ItCSO30b7kNAdEpiW4Bv0+OJ1ofcbv5IFH/4xVpZ39rYe
         yClI2UNWeiCOGaRzBPMyp0AF3STJNctehp0Z4WKUyuiDTMTqBdy5D2blHmScvrxHIcFY
         mwNE7YlksE/rUvLzkC5+YM/mEwgft64+k5CCo/Giti5VmcxGycJOkStsKFU7TAZvuY7M
         3DUALuMvF5mgMrVsAIckgZt7Z+w6ovFjqBDU4elSXSJ0faUM6xfNpQOzmndXyWZRt4gQ
         fbDg==
X-Gm-Message-State: ACgBeo3IL67lffVhB2cGmWR5T0E60SbENwm6MbiTNtqDbRrcy3g/6wC/
	2Guth0L4gzXCIJB/r92uDY8=
X-Google-Smtp-Source: AA6agR7fnL/ZvcDcHwypYRSYkpoEHzQlH2Kbb9U7WlU6MfPD9bSoUMZqe83drqSNUCrLLqJYv5uOuQ==
X-Received: by 2002:a05:6512:3e09:b0:492:f8e5:5eb5 with SMTP id i9-20020a0565123e0900b00492f8e55eb5mr2552048lfv.498.1661360358306;
        Wed, 24 Aug 2022 09:59:18 -0700 (PDT)
Received: from [10.10.53.53] (81-18-220-16.static.chello.pl. [81.18.220.16])
        by smtp.googlemail.com with ESMTPSA id k4-20020a05651210c400b0048d1101d0d6sm3941lfg.121.2022.08.24.09.59.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Aug 2022 09:59:17 -0700 (PDT)
From: Mateusz Kwiatkowski <kfyatek@gmail.com>
X-Google-Original-From: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Message-ID: <b5b458bd-ec4b-0144-5ae2-378fda723ecf@gmail.com>
Date: Wed, 24 Aug 2022 18:59:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 24/35] drm/vc4: vec: Add support for more analog TV
 standards
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Chen-Yu Tsai <wens@csie.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jerome Brunet <jbrunet@baylibre.com>, Samuel Holland <samuel@sholland.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>,
 Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Kevin Hilman <khilman@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Dom Cobley <dom@raspberrypi.com>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <20220728-rpi-analog-tv-properties-v1-24-3d53ae722097@cerno.tech>
 <0e7bebe2-3f45-0a1b-a4b6-bb783f8de7b6@gmail.com>
 <20220815083702.ipcmdwzkh2fxvdp7@houat>
In-Reply-To: <20220815083702.ipcmdwzkh2fxvdp7@houat>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220824_095921_481791_3CF52B2A 
X-CRM114-Status: GOOD (  25.58  )
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

Hi Maxime,

W dniu 15.08.2022 o 10:37, Maxime Ripard pisze:
> Hi,
>
> On Fri, Jul 29, 2022 at 07:55:30PM +0200, Mateusz Kwiatkowski wrote:
>> Hi Maxime,
>>
>> I think that declaring PAL-B and SECAM-B as the only supported 576i
>> norms is a bit random.
>
> Starting with this patch, PAL-N should be supported as well, right?

Oh, sure. I forgot about it. My brain was too focused on the "standard PAL"
modes, which excludes PAL-N.

>
>> Norms B, D, G, H, I, K, K1 and L (for both PAL and SECAM) are
>> essentially identical if we're talking about baseband signals, AFAIK
>> they only differ when those are modulated as RF signals. I'm not sure
>> if there's a point to differentiating those (that's more about patch
>> 05/35) unless we need to deal with some device that actually features
>> an RF modulator.
>
> What I was aiming for is to have all the cases we have in all the
> drivers covered so that we can make that property generic. i915
> declares and uses all those variants:
>
> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/i915/display/intel_sdvo.c#L68
>
> Especially since it's i915 and it's pretty much the standard as far as
> the uAPI goes, I'd rather avoid any regression there.

OK, if there are already drivers that differentiate those, then it doesn't make
sense to introduce regressions. And yes, there is plenty of software already out
there that differentiate between those modes in the context of composite video.
It still doesn't make much sense from the engineering point of view, though.

>
>> But if we do want to have all those norms separate, then I'd say that
>> VC4 should declare support for all of those, and all should map to the
>> same VEC settings. Some users from e.g. the UK might think that they
>> won't get proper picture if PAL-I is not on the list of supported
>> norms. Same goes for e.g. SECAM-D/K in the former Soviet territories,
>> and so on.
>
> I'd be open to it, but we can always extend vc4 to support those modes
> later on. The work you did to make that easier should make it trivial.

Doing that in the future is OK as well. I just wanted to point out that
PAL-B/D/G/H/I/K/K1/L (and same for SECAM) is the same exact thing as far as
baseband composite video is concerned, so declaring only one of those as
supported is potentially misleading for anybody who is not aware of that fact.

>
> Maxime

Best regards,
Mateusz Kwiatkowski

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
