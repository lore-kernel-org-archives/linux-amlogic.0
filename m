Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 048D4C433F5
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Mar 2022 08:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mKnbMxuPOtRLiJ5eJLzcw/o/ez6SXdqN87pWBKMkYpo=; b=lKAvJyP9vY8/y3lFjPWO2CImeA
	sVOD9ViCX6g9cALuREaBOrSuCQX9LW96InQixSCBKAbvtGQoHkwWsoZyVs02+q/qtjOxurSxiBhJa
	a4ifNsxutMuuF2IVdYlOuZ2u1xrwO1leinruZOFHPvzqB+agAh1+/yFabiZ+4H59HaZI1UVjKbA0/
	4LAvsnO9A5dPvWL3YkCfZa6h8Mah6ibur36A5ZwoQAtPv2wGsraxCjTZ5OoYhCF4tGEJWa68++iAQ
	aWEJ0BsfGgmH0U7rmRtJPaZ85j8Xm9OhaGM3tBUctiQ4I/LkCjC/KyPYA+JXted/DmlQJA601tlHL
	NOJ2CEmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nR8k3-00GSiI-0C; Mon, 07 Mar 2022 08:29:19 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nR8jz-00GShv-N8
 for linux-amlogic@lists.infradead.org; Mon, 07 Mar 2022 08:29:18 +0000
Received: by mail-wm1-x331.google.com with SMTP id
 bi14-20020a05600c3d8e00b00386f2897400so5080115wmb.5
 for <linux-amlogic@lists.infradead.org>; Mon, 07 Mar 2022 00:29:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=xKGl1vP3ZJsV1+rZFlj3VN3Nxt6brjBVG5L+1S8cCUg=;
 b=1XqgNoCOw72uZKQgsZ4ySFRWLqsCXKNVuzNjyzWNh0RNeBu3IKh4LaKdfNWg8FSaC0
 lCTZoOrLfOCK6E1MQkbXA2Bfmk0KUbUQLadL1X1Qp1iOi7+yb2Tk7nMUVblNe+IX3mf/
 iE8bCRq1V8NJWLEbqkSzuftYSL0I1PBsJ4Sg+0IrHJMAyMg3TR+bxFYl/j80nPwMhvNv
 YqolqbadwSjn82M39wsIXFU2cKInCCxlwTsGqSlDoPNScSEHfsIYRwqgXTGGa47cPkv6
 +vCbbwqk3Ugfqr3JPRZQiEjYolL37gjpAI92kPQwtK7RYy4yxvGLT2E5h11A2Tfmo/ei
 9bzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=xKGl1vP3ZJsV1+rZFlj3VN3Nxt6brjBVG5L+1S8cCUg=;
 b=0uN7B2crdbFpLOu3VefoAGvRUYl/894yRjG1gdjBomloGUPBHjyTgCMu16jkPM49iN
 hrQeC6defOhFqd7tWG18pO9HgSslP4h2aWDKx8Q6+Fwkl16KYHjT9DUy8QuNb/6ra+I9
 wwU6yrzDpDvocwoWBb0ha+M/BfuBC8zMKY4PIUS+cij/ughVJYEcM7CZYWTYxT9eQgbY
 EtQTe1HkmrkV50mCCwBxYyKol2VYUADUDdB3pQv6BnMzQnXHlDjVfWYII4EbXnD91CFs
 YXSDReq/8ofTFyekY5Ep2lp+5nxJcXM2JUyQFQWlLconhLamyewxRv+5w0gFN2S15Pbk
 rM5A==
X-Gm-Message-State: AOAM533E2e6BmuUXmZoj2/dBSAjb6M1xXMufImyBO6iK9HoHHU9lFkm+
 od366eGyyuwiTrB7hnuoxKAjFA==
X-Google-Smtp-Source: ABdhPJzQYFzN/l7emYl2jY2woh5h8sv20zBvTDk930fKMptRgS8P81OH15VIlnZctxY+RX0G5cYSSA==
X-Received: by 2002:a05:600c:4f8f:b0:383:d0b:3706 with SMTP id
 n15-20020a05600c4f8f00b003830d0b3706mr8258541wmq.117.1646641753255; 
 Mon, 07 Mar 2022 00:29:13 -0800 (PST)
Received: from ?IPV6:2001:861:44c0:66c0:1451:71b4:fefe:6096?
 ([2001:861:44c0:66c0:1451:71b4:fefe:6096])
 by smtp.gmail.com with ESMTPSA id
 q16-20020a056000137000b001f046a21afcsm10964684wrz.15.2022.03.07.00.29.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 00:29:12 -0800 (PST)
Message-ID: <35db71b9-6574-b517-9687-33a826647821@baylibre.com>
Date: Mon, 7 Mar 2022 09:29:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: VIM3 - A311D - I2C AO Clock Questions
Content-Language: en-US
To: tanure@linux.com, linux-amlogic@lists.infradead.org
References: <CAJX_Q+2zibb_ABAjT=k=hbW_Xa9knOy5hcN5Ma2B6Z+h-3=FsQ@mail.gmail.com>
 <CAJX_Q+0Gvf88EW6s6-pLoA_mwhwKCf==qyxmNnFt=S24TPN0xw@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <CAJX_Q+0Gvf88EW6s6-pLoA_mwhwKCf==qyxmNnFt=S24TPN0xw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_002915_838414_F81FB111 
X-CRM114-Status: GOOD (  22.29  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

On 06/03/2022 11:23, Lucas Tanure wrote:
> Hi,
> 
> I am trying to integrate an I2C device into VIM3 using the I2C_AO bus.
> My device uses a 100000Hz clock, but after changing
> meson-g12b-a311d-khadas-vim3.dts to add my I2C node the driver could
> not properly read its registers.
> 
> It reads 0x9100, but the correct data should be 0xcb58.
> The first thing I saw on the bus was that the frequency I requested by
> the device tree was being set after the probe of my driver already
> failed.
> For that, I sent "i2c: meson: Fix wrong speed use from probe" which
> fixes that issue.
> 
> But I still get the wrong data, so my next guess is that the clock
> duty cycle is 30%, and I think should be 50%.
> Here is an image of the signals of the bus:
> https://pasteboard.co/TEoxQucsXUUD.png
> 
> I have tested other frequencies and all of them uses a 30% duty cycle,
> where SCL is up 30% and low for 70% of the period.

Indeed it seems by default the duty cycle is for Fast Mode, but standard mode should
be around 50%. Did you try 400khz ?

Amlogic did some changes on their off-tree linux fork, please look around:
https://github.com/khadas/linux/blob/khadas-vims-5.4.y-fc/drivers/i2c/busses/i2c-meson.c#L143

I'm unsure when REG_SLAVE_ADDR BIT(28) appeared, but if you try to port this upstream,
we'll be happy to review it for inclusion.

Neil

> 
> Is possible to configure the clock to be 100000Hz, but with a 50% duty
> cycle for this I2C bus on A3111D?
> 
> Thanks
> Lucas Tanure
> 
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
