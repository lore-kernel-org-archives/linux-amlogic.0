Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD512EB64D9
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Jul 2023 15:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TNSAC/9/NCnJ5zDmWSXtahjzQocQDrqqxrf03YPuQQs=; b=3hQ2JjlHEETSzgd1Po+oaCrR5t
	LN7oQUUinlZkH9poT9X3m62uvCoN+e266VKPxQQXWjXhkcpmYvzB2f/u1HEu4JljutWifQMls2eRN
	ov104pFLGiyL0eiDzmaR+oXoTbaPjG8D0+eehxgKaHug62KiTeY7JxCSLwjEShvA89yX5hpl/Tymg
	i6DZee6E2TUHM/BPH9tDS6WHFr7k6mb/c1YJSDI2O8/HDEn633G/8PN/db5fkBSHTisuiMtpRZMqX
	fu9zLzogm9XDsNEOPnFhl7wAfdX9DhRqCAYEZgF75A3e1hm9PlKnow5sspnVZsKAOg5jejQ5t9CDA
	89mB6DFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHn83-004zei-2C;
	Fri, 07 Jul 2023 15:12:15 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHn80-004zcS-23
	for linux-amlogic@lists.infradead.org;
	Fri, 07 Jul 2023 15:12:14 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-31441bc0092so1956901f8f.1
        for <linux-amlogic@lists.infradead.org>; Fri, 07 Jul 2023 08:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688742727; x=1691334727;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BQgaHEs5ElhGcSE1hakyOOb4DKur9FjrT69zZjDMTtE=;
        b=eDeOV8v3euRnkTXm7Asdaoa32ka9wnAU9XwdcTU4TRBdxYTiTD+A/TNPy9S+nxQTX2
         1QWoAV30NWEIkrLdAl/8PZLCDU7a7CayxV1zwiObT0G4qZ17TCiDReytvR0JaovP1XVX
         1BDFkj8mFrH2aqP9lU0PmLcvaY0Ogyo2IgMDG7s/BJUk5mdX1unx7hfxC0oB8Su4wnYl
         tXwj+tHIecZ6FdhlCMCxQK7Krr1soCCk2KwSdaEgsqfRHbO2jb+G8K9VJ9RL2AL5nZwE
         WwpVwALG+unL9yOu4rn8Ms7SsAoUp0roQP+SZjuLBq87hCrSdayp1Gsw1n1MdChyvBJX
         tU/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688742727; x=1691334727;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BQgaHEs5ElhGcSE1hakyOOb4DKur9FjrT69zZjDMTtE=;
        b=eQhSAUBWDIsyPhO+sfnKwV2xbE+TDI9LEeCHd+uX/PkUjfpEZ0JWTpqzBdxhwLGmV4
         Wb8RcQTfmbxoS5zzKtLfZgzNb1bnwJQA4q6cEpNd6TMgjJlEHmHlreoP02BJOGzNr6Wi
         spu9uaOFiKWR+ywDkwpLyeq1hce1a1V9xvzojoSKRkz4Y1hml3oFVAaAbamtsZ8Zi/Jo
         toXhUzEot7shpHgyqPMocrldujrYJ3TDw7bLniYnEg/sC7X++kpRS08UYL8UaI1wucL7
         K0DopApGxAkc3AycmbNJ2bx9vdswtBVZjW/r2dIdR/HVs+G3jlZmWMxwpBbOPStEqTrE
         HBkg==
X-Gm-Message-State: ABy/qLYo5G0yS0JdPRCGVW1TvOaONSRXaAWmyJuj4fbx/OCF3wNJ5ixy
	ecfbSFYU8htCI+e0h24FhuU7mw==
X-Google-Smtp-Source: APBJJlGQBnO4ZSjUTrTkR6jMlfdn1bT1yYIOs2bA+ajpmf1kEC0cZt+Rdb1eRGZokGdXhmUk4EM/FA==
X-Received: by 2002:adf:f642:0:b0:314:35c2:c4aa with SMTP id x2-20020adff642000000b0031435c2c4aamr3918202wrp.8.1688742727301;
        Fri, 07 Jul 2023 08:12:07 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:ddd7:8c33:e081:d016? ([2a01:e0a:982:cbb0:ddd7:8c33:e081:d016])
        by smtp.gmail.com with ESMTPSA id l11-20020a5d668b000000b003063db8f45bsm4678383wru.23.2023.07.07.08.12.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Jul 2023 08:12:06 -0700 (PDT)
Message-ID: <1496b9c1-289a-c354-f0ae-e14fd4c9bcfa@linaro.org>
Date: Fri, 7 Jul 2023 17:12:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 03/18] soc: amlogic: Move power-domain drivers to the
 genpd dir
Content-Language: en-US
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org
References: <20230707140434.723349-1-ulf.hansson@linaro.org>
 <20230707140434.723349-4-ulf.hansson@linaro.org>
 <0c8938a9-7a26-bf97-51ee-0c271901ec21@linaro.org>
 <CAPDyKFrOye96GyHS0tiTQ02Ve5S6Crtk8=bMsRS9Ljj=h5-nWQ@mail.gmail.com>
Organization: Linaro Developer Services
In-Reply-To: <CAPDyKFrOye96GyHS0tiTQ02Ve5S6Crtk8=bMsRS9Ljj=h5-nWQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230707_081212_670135_EBD71E52 
X-CRM114-Status: GOOD (  18.02  )
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 07/07/2023 16:54, Ulf Hansson wrote:
> On Fri, 7 Jul 2023 at 16:42, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>>
>> Hi,
>>
>> On 07/07/2023 16:04, Ulf Hansson wrote:
>>> Cc: Neil Armstrong <neil.armstrong@linaro.org>
>>> Cc: Kevin Hilman <khilman@baylibre.com>
>>> Cc: Jerome Brunet <jbrunet@baylibre.com>
>>> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>>> Cc: <linux-amlogic@lists.infradead.org>
>>> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
>>> ---
>>>    MAINTAINERS                                        | 1 +
>>>    drivers/genpd/Makefile                             | 1 +
>>>    drivers/genpd/amlogic/Makefile                     | 4 ++++
>>>    drivers/{soc => genpd}/amlogic/meson-ee-pwrc.c     | 0
>>>    drivers/{soc => genpd}/amlogic/meson-gx-pwrc-vpu.c | 0
>>>    drivers/{soc => genpd}/amlogic/meson-secure-pwrc.c | 0
>>>    drivers/soc/Makefile                               | 1 -
>>>    drivers/soc/amlogic/Makefile                       | 3 ---
>>>    8 files changed, 6 insertions(+), 4 deletions(-)
>>>    create mode 100644 drivers/genpd/amlogic/Makefile
>>>    rename drivers/{soc => genpd}/amlogic/meson-ee-pwrc.c (100%)
>>>    rename drivers/{soc => genpd}/amlogic/meson-gx-pwrc-vpu.c (100%)
>>>    rename drivers/{soc => genpd}/amlogic/meson-secure-pwrc.c (100%)
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index 588769fab516..9b8c9ae2375d 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -1843,6 +1843,7 @@ F:      Documentation/devicetree/bindings/phy/amlogic*
>>>    F:  arch/arm/boot/dts/amlogic/
>>>    F:  arch/arm/mach-meson/
>>>    F:  arch/arm64/boot/dts/amlogic/
>>> +F:   drivers/genpd/amlogic/
>>>    F:  drivers/mmc/host/meson*
>>>    F:  drivers/phy/amlogic/
>>>    F:  drivers/pinctrl/meson/
>>> diff --git a/drivers/genpd/Makefile b/drivers/genpd/Makefile
>>> index a2d5b2095915..cdba3b9f0c75 100644
>>> --- a/drivers/genpd/Makefile
>>> +++ b/drivers/genpd/Makefile
>>> @@ -1,2 +1,3 @@
>>>    # SPDX-License-Identifier: GPL-2.0-only
>>>    obj-y                                       += actions/
>>> +obj-y                                        += amlogic/
>>> diff --git a/drivers/genpd/amlogic/Makefile b/drivers/genpd/amlogic/Makefile
>>> new file mode 100644
>>> index 000000000000..3d58abd574f9
>>> --- /dev/null
>>> +++ b/drivers/genpd/amlogic/Makefile
>>> @@ -0,0 +1,4 @@
>>> +# SPDX-License-Identifier: GPL-2.0-only
>>> +obj-$(CONFIG_MESON_GX_PM_DOMAINS) += meson-gx-pwrc-vpu.o
>>> +obj-$(CONFIG_MESON_EE_PM_DOMAINS) += meson-ee-pwrc.o
>>> +obj-$(CONFIG_MESON_SECURE_PM_DOMAINS) += meson-secure-pwrc.o
>>> diff --git a/drivers/soc/amlogic/meson-ee-pwrc.c b/drivers/genpd/amlogic/meson-ee-pwrc.c
>>> similarity index 100%
>>> rename from drivers/soc/amlogic/meson-ee-pwrc.c
>>> rename to drivers/genpd/amlogic/meson-ee-pwrc.c
>>> diff --git a/drivers/soc/amlogic/meson-gx-pwrc-vpu.c b/drivers/genpd/amlogic/meson-gx-pwrc-vpu.c
>>> similarity index 100%
>>> rename from drivers/soc/amlogic/meson-gx-pwrc-vpu.c
>>> rename to drivers/genpd/amlogic/meson-gx-pwrc-vpu.c
>>> diff --git a/drivers/soc/amlogic/meson-secure-pwrc.c b/drivers/genpd/amlogic/meson-secure-pwrc.c
>>> similarity index 100%
>>> rename from drivers/soc/amlogic/meson-secure-pwrc.c
>>> rename to drivers/genpd/amlogic/meson-secure-pwrc.c
>>> diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile
>>> index 3b0f9fb3b5c8..dc93e1762ca7 100644
>>> --- a/drivers/soc/Makefile
>>> +++ b/drivers/soc/Makefile
>>> @@ -23,7 +23,6 @@ obj-y                               += mediatek/
>>>    obj-y                               += microchip/
>>>    obj-y                               += nuvoton/
>>>    obj-y                               += pxa/
>>> -obj-y                                += amlogic/
>>>    obj-y                               += qcom/
>>>    obj-y                               += renesas/
>>>    obj-y                               += rockchip/
>>> diff --git a/drivers/soc/amlogic/Makefile b/drivers/soc/amlogic/Makefile
>>> index 7b8c5d323f5c..c25f835e6a26 100644
>>> --- a/drivers/soc/amlogic/Makefile
>>> +++ b/drivers/soc/amlogic/Makefile
>>> @@ -2,7 +2,4 @@
>>>    obj-$(CONFIG_MESON_CANVAS) += meson-canvas.o
>>>    obj-$(CONFIG_MESON_CLK_MEASURE) += meson-clk-measure.o
>>>    obj-$(CONFIG_MESON_GX_SOCINFO) += meson-gx-socinfo.o
>>> -obj-$(CONFIG_MESON_GX_PM_DOMAINS) += meson-gx-pwrc-vpu.o
>>>    obj-$(CONFIG_MESON_MX_SOCINFO) += meson-mx-socinfo.o
>>> -obj-$(CONFIG_MESON_EE_PM_DOMAINS) += meson-ee-pwrc.o
>>> -obj-$(CONFIG_MESON_SECURE_PM_DOMAINS) += meson-secure-pwrc.o
>>
>> I've a few changes for v6.6, how shall we handle that ?
> 
> I think we should continue to use the soc tree until v6.6-rc1 (or if
> Arnd have some other ideas), there are some more thoughts around this
> in the cover letter.
> 
> Beyond v6.6-rc1 I plan to help with maintenance in practice  and run
> my own separate git tree.

If it helps I can send you a PR with only the pwrc changes you can merge
before applying this serie.

Neil

> 
>>
>> Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
>>
>> Thanks !
>> Neil
> 
> Thanks!
> 
> Kind regards
> Uffe


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
