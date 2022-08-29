Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E14BECAAD2
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Aug 2022 14:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I4WTiqeMdYRiq2eBoGSAY8c27xdhWpNARpWcv4rmhqQ=; b=Uj7NlQyDxDsSVQ
	Krgz5bMrPKyi41SiOGkybSD/is2j5uWjMAIv2wrArc9r960XyKFZz83WPpOAJ5GqHYWHvoU0UuAzR
	95YhEGK25FmK32izGygpr5Hu4tlnBSFilMFr1FDS9TZk3z0JOFeEsgHjSfKK9+pdtq8QhCBK7CizT
	ntje4SxmH+mE/XbHolcKMCdAwc5lZkiD3RZwsz+opjwKFDsroJOlzNGFLUAUHNfXLbUqrcJ5XA0Df
	ihXYmlc/9nUsTfaqjlvxkrpkJ2YyX14q1bkaKoOrIZCRw7onkgyU/7Gau52Frlh3JSr+VCUsJS6b9
	yqQiVnAmreta8vTBW1tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSfJF-00Au4A-99; Mon, 29 Aug 2022 14:00:13 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSepx-00AjEN-Pf
	for linux-amlogic@lists.infradead.org; Mon, 29 Aug 2022 13:29:59 +0000
Received: by mail-wr1-x42b.google.com with SMTP id bu22so9871247wrb.3
        for <linux-amlogic@lists.infradead.org>; Mon, 29 Aug 2022 06:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date;
        bh=0rzM7C+X4i/7+BgYPEAODopBKOgCUDXP2Yabdqjl+eg=;
        b=j+G31/aZ6ifEmtGsEbtR20sGXfhwMKDtYQLAWAdKkrUdgeF2sCNTMxYtoDuTRRSF79
         Q+j3CHhHyWyy3CSrxSAO0ElnySwHymijyMimdnVvNojKGUT6twlktQYFueAQ1Es3Yafq
         RB1QC4pcbYxz+QXEIln2qeTOoyXhuMUTG+TbWHlnJWBEELTzg5ZrrYReMUXCc4bBydtb
         4L2nhcwVlMc39A5QiRdEwF2I3wYP283KZutvasz+hfOf02tUyDIC/2+ndt1Yof3JztU2
         e356qtHbIYSgfgn9ExG1rEp9cVgtC698jO6g0SKAwrARZD0crR28Fwg3hjrQCWfizV7l
         KLCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=0rzM7C+X4i/7+BgYPEAODopBKOgCUDXP2Yabdqjl+eg=;
        b=Adur0aVpSWx3upEjtHYD9R1GBF9AgjtSXMYE7cbXaYEBNNzACrIsKTXSnoa7THECPP
         huIcyoqjDekr0x1R2zctN33hBcrYX2s0m31DTYtVmT60SJTGQOoDCbm45u74yzRz9tqJ
         xSNwJ5NVO+fqBSf/Sdl7aU7m1BqylGPZYL4KuGyRorylVP4zQ/zfpHWnb0ODTee81Ioh
         yMFu3m4QZyPGq6epFlbaoYwdGXregOIm1Mpu6Al5l1xw136tMZ9gezcp903VINgEyUca
         Ejxd8HcJuZeEwmUGFD+jKdOWlG33j1sUv8YHBsZV8ismr5JQv4tU4wn31+D9kWByPXq7
         V0mQ==
X-Gm-Message-State: ACgBeo1N0FTf/mgZ5Ls4YDyvC3eR+2u+J4CzV3CgD1j+G00P7XUAgkYz
	z55sNAE0v3HJIaNG28xhxbUrXg==
X-Google-Smtp-Source: AA6agR5lGVIfTvRtLKqvSwvLM/w54qDXbW6ptavzy0/El/cYWWyFKOkiRmSLjKpDkoaAWwl6Scaigg==
X-Received: by 2002:adf:dece:0:b0:226:dc0a:8b1a with SMTP id i14-20020adfdece000000b00226dc0a8b1amr2261100wrn.401.1661779793279;
        Mon, 29 Aug 2022 06:29:53 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:6124:6b74:2847:d37b? ([2a01:e0a:982:cbb0:6124:6b74:2847:d37b])
        by smtp.gmail.com with ESMTPSA id h16-20020adff4d0000000b00226dbf4f607sm2815907wrp.10.2022.08.29.06.29.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Aug 2022 06:29:52 -0700 (PDT)
Message-ID: <67f29dfe-a579-125e-cb84-f6b554932b42@baylibre.com>
Date: Mon, 29 Aug 2022 15:29:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 0/2] mmc: meson-gx: add SDIO interrupt support
Content-Language: en-US
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
References: <72459a46-fd20-60d8-a7e7-076d8f321816@gmail.com>
 <CAPDyKFokmJr7e8=gvsYbBbdxceG6kCa57vbYy1tUT_b+B=8P8Q@mail.gmail.com>
 <e970e07d-9bb8-707d-1dc6-09fae2abbfff@baylibre.com>
 <CAPDyKFqRm=RVn__3HJDk_0bBemudh_y7YEYPZe3W7iJCfP50fg@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <CAPDyKFqRm=RVn__3HJDk_0bBemudh_y7YEYPZe3W7iJCfP50fg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_062957_889425_3A1FE0C5 
X-CRM114-Status: GOOD (  16.08  )
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

On 29/08/2022 14:07, Ulf Hansson wrote:
> On Mon, 29 Aug 2022 at 09:42, Neil Armstrong <narmstrong@baylibre.com> wrote:
>>
>> Hi Uffe, Heiner,
>>
>> On 26/08/2022 11:16, Ulf Hansson wrote:
>>> On Thu, 25 Aug 2022 at 21:52, Heiner Kallweit <hkallweit1@gmail.com> wrote:
>>>>
>>>> Add SDIO interrupt support. Successfully tested on a S905X4-based
>>>> system (V3 register layout) with a BRCM4334 SDIO wifi module
>>>> (brcmfmac driver).
>>>>
>>>> v2:
>>>> - use new SDIO interrupt API
>>>> v3:
>>>> - don't duplicate checking mmc->sdio_irq_pending
>>>>
>>>> Heiner Kallweit (2):
>>>>     mmc: meson: adjust and re-use constant IRQ_EN_MASK
>>>>     mmc: meson-gx: add SDIO interrupt support
>>>>
>>>>    drivers/mmc/host/meson-gx-mmc.c | 84 +++++++++++++++++++++++++--------
>>>>    1 file changed, 65 insertions(+), 19 deletions(-)
>>>>
>>>
>>> Applied for next, thanks!
>>
>> Thanks for applying, but I was off (like many of reviewers) and I would have like
>> this patchset to be tested on earlier SoCs aswell, or only enabled on S4 for now.
> 
> To actually make use of the new code, an update to the corresponding
> DTS files are needed to set the cap-sdio-irq property.

I know but it changed the IRQ handling, let's hope we don't see any regressions.

> 
> If that isn't sufficient, I prefer if we make a patch on top of the
> $subject series.

OK, let's wait and see

> 
> Kind regards
> Uffe

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
