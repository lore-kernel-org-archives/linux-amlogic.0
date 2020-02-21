Return-Path: <SRS0=5fWL=4J=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99B01C35640
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Feb 2020 08:28:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E37D24670
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Feb 2020 08:28:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TAqPpFx+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Ph1daRZg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E37D24670
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ycYvrugHbL6t0cHqHfZovkDlmzl45Cxh40Sw4tJC1JE=; b=TAqPpFx+E4FmkW
	Ym3wOkEUfZ7fTL1tQUoBRYqMGgT4aZaMUIM1OsoqocMIQahvw9pbsAckkwxl+ksi7fnOMn/7OY2Rl
	yI4MgiwqDcMY+kWmE3GOjm4q1iZiOGaFZOcrrUxfQyhtUfR1fW6ecIuQDkPNHd6jiPfw+cSV1G6d9
	HTtPK9BdGc2U77qPcTeB0A7BtdHtR8dYeauz8jCNS+hTZRGE2vKYwNwo1xCPU4DT42g/94HJBFjQz
	36Kf6gbG09gkU+1pRKUEnrtKLdzu4lSuqQx20++WHSEwbTiovVnWW/t/qyTh5E5XirMnb1wGBPtcL
	mzMpI3OynIQgHcm0Ja3w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j53fa-0006IF-Hu; Fri, 21 Feb 2020 08:28:22 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j53fR-00069C-BH
 for linux-amlogic@lists.infradead.org; Fri, 21 Feb 2020 08:28:14 +0000
Received: by mail-wm1-x343.google.com with SMTP id q9so718450wmj.5
 for <linux-amlogic@lists.infradead.org>; Fri, 21 Feb 2020 00:28:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fCJ3KmigEs8DpBpdDcdTMD9jPsQq/gPkh1GOkuMWIrk=;
 b=Ph1daRZgQrXTOABYhqK6etF+hn4Krad4bRIU/5HaO4vhUNxhFornWMCiOjZQ0N4c67
 j4cagpxl8XlE1TRNwmzURH9TrAW+rOsoXRXxUgTnPsFNOEhktk8REO6+Room1yYQI+yh
 H1iA0XYP9Po7bLwxW5m1QLPEihZEpxvzXcginRu4o4GYKqVbtEvXVeTGoszx8LzxoScc
 77mwF9lyrQkNO3bLsKDFOhqg0YUK1oAKveDFUXfsDbtGXFp6O5Nibx22VDTbTBgZkIsr
 kUvMsDi3zULvXWUOL/6LCnBv0gfpQs5Lpz96N+O0vNe4HgluWdMcRSnVnIeZc1HufT3A
 G4dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=fCJ3KmigEs8DpBpdDcdTMD9jPsQq/gPkh1GOkuMWIrk=;
 b=kjgxW+O+xCI0cZglkpasp12gEIn6jSqcgT2Vs98HYaYTl6SvzyQCCHPUQQDKXbiTBT
 raL077lx8HyJ3MXW0sFpa5MiV5zVYVMteqRZlNqbeLdxf4vkSmKRlqiVb0tgL3X5DvID
 pqoxD/LBg/XuYd6OalVVnY4JF9iIazFXkwM1CIQHHRwWwyS9HGvkKRTafF64QcJRsRMp
 P0WZLz6fzvmXbw3o3PSXEIIdv3foXjUnZrnp3q2vksOklp03emlJDEUQf13xEIPG7CI7
 QPLrpT/H96kbBP2NyR+grnDIrWkMierX2ibBTbgQxApxqAOHHOH71AIT5+XKROqfy4og
 uXaQ==
X-Gm-Message-State: APjAAAWzPN5g4ldRIkuFzusSWjxUn2odwdD0KeSgRPyNkhXJ5+q9cUFM
 R4xkROpWV+KxjzGwSQxbIuxQqA==
X-Google-Smtp-Source: APXvYqwzjlP0HTv4FL0F1MqSuF9uKA6+BP8tD+yxfzTz5t4OJUiTFFRHyLp2o35NMyA52dyHPuzrbA==
X-Received: by 2002:a1c:7919:: with SMTP id l25mr2186757wme.135.1582273691154; 
 Fri, 21 Feb 2020 00:28:11 -0800 (PST)
Received: from ?IPv6:2a01:e35:2ec0:82b0:4ca8:b25b:98e4:858?
 ([2a01:e35:2ec0:82b0:4ca8:b25b:98e4:858])
 by smtp.gmail.com with ESMTPSA id m9sm3008198wrx.55.2020.02.21.00.28.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Feb 2020 00:28:10 -0800 (PST)
Subject: Re: [PATCH] clk: meson: meson8b: set audio output clock hierarchy
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, jbrunet@baylibre.com
References: <20200220204433.67113-1-martin.blumenstingl@googlemail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <74a8613c-ba30-5f42-9edd-b5af1d7f330c@baylibre.com>
Date: Fri, 21 Feb 2020 09:28:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200220204433.67113-1-martin.blumenstingl@googlemail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200221_002813_396816_8C2068CE 
X-CRM114-Status: GOOD (  14.38  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: sboyd@kernel.org, mturquette@baylibre.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 20/02/2020 21:44, Martin Blumenstingl wrote:
> The aiu devices peripheral clocks needs the aiu and aiu_glue clocks to
> operate. Reflect this hierarchy in the clock tree.
> 
> Fixes: e31a1900c1ff73 ("meson: clk: Add support for clock gates")
> Suggested-by: Jerome Brunet <jbrunet@baylibre.com>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
> This takes Jerome's patch for GXBB and ports it to the Meson8* SoCs.
> Hence the Suggested-by.
> 
> 
>  drivers/clk/meson/meson8b.c | 21 +++++++++++++--------
>  1 file changed, 13 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
> index 9fd31f23b2a9..34a70c4b4899 100644
> --- a/drivers/clk/meson/meson8b.c
> +++ b/drivers/clk/meson/meson8b.c
> @@ -2605,14 +2605,6 @@ static MESON_GATE(meson8b_spi, HHI_GCLK_MPEG0, 30);
>  static MESON_GATE(meson8b_i2s_spdif, HHI_GCLK_MPEG1, 2);
>  static MESON_GATE(meson8b_eth, HHI_GCLK_MPEG1, 3);
>  static MESON_GATE(meson8b_demux, HHI_GCLK_MPEG1, 4);
> -static MESON_GATE(meson8b_aiu_glue, HHI_GCLK_MPEG1, 6);
> -static MESON_GATE(meson8b_iec958, HHI_GCLK_MPEG1, 7);
> -static MESON_GATE(meson8b_i2s_out, HHI_GCLK_MPEG1, 8);
> -static MESON_GATE(meson8b_amclk, HHI_GCLK_MPEG1, 9);
> -static MESON_GATE(meson8b_aififo2, HHI_GCLK_MPEG1, 10);
> -static MESON_GATE(meson8b_mixer, HHI_GCLK_MPEG1, 11);
> -static MESON_GATE(meson8b_mixer_iface, HHI_GCLK_MPEG1, 12);
> -static MESON_GATE(meson8b_adc, HHI_GCLK_MPEG1, 13);
>  static MESON_GATE(meson8b_blkmv, HHI_GCLK_MPEG1, 14);
>  static MESON_GATE(meson8b_aiu, HHI_GCLK_MPEG1, 15);
>  static MESON_GATE(meson8b_uart1, HHI_GCLK_MPEG1, 16);
> @@ -2659,6 +2651,19 @@ static MESON_GATE(meson8b_vclk2_vencl, HHI_GCLK_OTHER, 25);
>  static MESON_GATE(meson8b_vclk2_other, HHI_GCLK_OTHER, 26);
>  static MESON_GATE(meson8b_edp, HHI_GCLK_OTHER, 31);
>  
> +/* AIU gates */
> +#define MESON_AIU_GLUE_GATE(_name, _reg, _bit) \
> +	MESON_PCLK(_name, _reg, _bit, &meson8b_aiu_glue.hw)
> +
> +static MESON_PCLK(meson8b_aiu_glue, HHI_GCLK_MPEG1, 6, &meson8b_aiu.hw);
> +static MESON_AIU_GLUE_GATE(meson8b_iec958, HHI_GCLK_MPEG1, 7);
> +static MESON_AIU_GLUE_GATE(meson8b_i2s_out, HHI_GCLK_MPEG1, 8);
> +static MESON_AIU_GLUE_GATE(meson8b_amclk, HHI_GCLK_MPEG1, 9);
> +static MESON_AIU_GLUE_GATE(meson8b_aififo2, HHI_GCLK_MPEG1, 10);
> +static MESON_AIU_GLUE_GATE(meson8b_mixer, HHI_GCLK_MPEG1, 11);
> +static MESON_AIU_GLUE_GATE(meson8b_mixer_iface, HHI_GCLK_MPEG1, 12);
> +static MESON_AIU_GLUE_GATE(meson8b_adc, HHI_GCLK_MPEG1, 13);
> +
>  /* Always On (AO) domain gates */
>  
>  static MESON_GATE(meson8b_ao_media_cpu, HHI_GCLK_AO, 0);
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
