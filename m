Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFD53C433F5
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Feb 2022 14:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WeDNUCKaItdqZWhtgIbFxnftuUWd1+mUC+9yzN4Aqug=; b=BWzUQvoBZ31DpN
	QrHEA41F0WWNJzF+bnikgR2HcQZ5XUYDFiL/O2dFhLsj1q787f1kaZ3iWRgH3oAWDFIiQ18dDjTa5
	o8hYvtWVsN8ptX0nwhKvvfzSs76LdZ40reCQywNjv3I2W0AkXoCazuBH6qAovQMgeyjYgWV4YMHA3
	XtoUg0X4bE0K3QKi2GwnBfu0UA0DPmSF+67CDbv7rJX06zxOJaGJ9fE9BL0x4i2wHVajfOB53J/Af
	5wq5RLZtEtxYveXd5g0K/ZPDkXeothhzJK+XTjzKFw6PakQFBhISURDMbvnHIDLy4Dt1fuWXbI43A
	uKNejenFBMGHiVko0zyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOh4D-00CurE-56; Mon, 28 Feb 2022 14:32:01 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOgrH-00Cpjc-94
 for linux-amlogic@lists.infradead.org; Mon, 28 Feb 2022 14:18:41 +0000
Received: by mail-wr1-x42b.google.com with SMTP id d17so15664207wrc.9
 for <linux-amlogic@lists.infradead.org>; Mon, 28 Feb 2022 06:18:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=0pWKGzc1QGnlWJ7r+DVlrppysa/FNwAKcHpfFi7QI+0=;
 b=mWFC0RgVVVEnPrrnSOZ6rSduLtgN2AAjdqME+r3OuWaLryf4ZvjGIRhEuCuB3K2pbJ
 UcE+xdZ6Asyj0UWqym7ZF+fEyTZYMJN/O0bnou1jLqmqRlE5CdYQXijZtps/wyBdtpMS
 EhstuHJKDem74wrLsw3BF5ShaD3gdWZ7qqyhdsHhM50ZbBptpUttgBXODqWIfHhbpmIX
 7/BZpaFhFYNnl2PoY+Tw4/tf9kRhDnScAAbSR0Izb5S8X/Pr73EkX+MWZnRKjeIwyueq
 SBg1FHCjMoBv9TqjhMfdTV6vdRLkVbfsMBgvOzIWAaRUKHlejNVEIXknZQzBu1ULs+Rs
 Hy1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=0pWKGzc1QGnlWJ7r+DVlrppysa/FNwAKcHpfFi7QI+0=;
 b=n69AvlXyPNoHqsrGN/iV+o0DY0JLtA6+wtEmwzfDpL7VOxua/ucA9syIzNMBNUai2k
 7E04RzHg0vEMSpT7Yhqx49rUQ+tOgEwNmdmxC9iCAKPhf9HqciPFw/XWOyEpVMOZs/mx
 hP2g8hs4CZP6UP1ImlxSx7vnGARY04HkSd0GCj9Wx7n3V1zUMWaqq15Ie6hzDhEa0Jqj
 aGD4zV/jvWqCM0kvucazNXy6XJ16+DjmHJiHahB5UPKvApqtDXkbV9patshZTtBSyatG
 dvtPBFTqWpHVlu/tiLQxuI8SVYA8mydAR3KZpQNCOfekXz/4lg2RrxR/Z9XkSF4Giv19
 QTBA==
X-Gm-Message-State: AOAM533n6+TdCH7ItXgOA1wVv+dpwx7AEbxMgcSNULc195pr4IKttSxR
 CZsi5Qp2PlKL90IcUPIy8C73gA==
X-Google-Smtp-Source: ABdhPJz6CAiN5uoDI/GIMmfKhOZ9vlU5f8pyRnmCUdki+ZEhESDrFSf05c4PuXfRbM8VvRQcajoH5A==
X-Received: by 2002:a05:6000:1e17:b0:1ef:d2b0:5624 with SMTP id
 bj23-20020a0560001e1700b001efd2b05624mr3920084wrb.598.1646057917250; 
 Mon, 28 Feb 2022 06:18:37 -0800 (PST)
Received: from ?IPV6:2001:861:44c0:66c0:6431:1dc7:b58f:6282?
 ([2001:861:44c0:66c0:6431:1dc7:b58f:6282])
 by smtp.gmail.com with ESMTPSA id
 m11-20020adff38b000000b001ef879a5930sm7224744wro.61.2022.02.28.06.18.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 06:18:36 -0800 (PST)
Message-ID: <4fb2c485-a489-574e-9445-dbeede79d343@baylibre.com>
Date: Mon, 28 Feb 2022 15:18:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH V5 0/2] Power: meson-s4: add s4 power domain driver
Content-Language: en-US
To: Shunzhou Jiang <shunzhou.jiang@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, jianxin.pan@amlogic.com
References: <20220228033542.3594861-1-shunzhou.jiang@amlogic.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220228033542.3594861-1-shunzhou.jiang@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_061839_381108_19C0FEE1 
X-CRM114-Status: GOOD (  10.94  )
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

On 28/02/2022 04:35, Shunzhou Jiang wrote:
> This patchset adds Power controller driver support for Meson-S4 SoC
> Likes Meson-A1, the power domains register only can access in secure world

You sent another "v5" version of this same patchset at https://lore.kernel.org/r/20220228032803.3305649-1-shunzhou.jiang@amlogic.com

Which one is the right "v5" ?

Please also add the changelog (changes between your patchset version) in this cover letter,
otherwise we can't track the changes VS the review comments of the different patchset versions.

Thanks,
Neil

> 
> Shunzhou Jiang (2):
>    dt-bindings: power: add Amlogic s4 power domains bindings
>    soc: s4: Add support for power domains controller
> 
>   .../power/amlogic,meson-sec-pwrc.yaml         |  3 ++-
>   drivers/soc/amlogic/meson-secure-pwrc.c       | 22 +++++++++++++++++++
>   include/dt-bindings/power/meson-s4-power.h    | 19 ++++++++++++++++
>   3 files changed, 43 insertions(+), 1 deletion(-)
>   create mode 100644 include/dt-bindings/power/meson-s4-power.h
> 
> 
> base-commit: 3448a018ded03ccd4093d6675f4a39eb2d1a18ef


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
