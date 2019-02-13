Return-Path: <SRS0=/lP5=QU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8E36C282CE
	for <linux-amlogic@archiver.kernel.org>; Wed, 13 Feb 2019 11:41:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 958072084E
	for <linux-amlogic@archiver.kernel.org>; Wed, 13 Feb 2019 11:41:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tKSVwD5j";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="dYoLjN9T"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 958072084E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IxyQ1AkzezftXK26x/3cBjfpGuSwOssc/pSFpUy0TRU=; b=tKSVwD5jSLyTF4
	Kwe3FhPfHNUoGjWnH0P4mcUsKlo9SPSIB/VUJwhKkwIJtQDtTF0UC56CctHFMJif8y2/GHj968O9p
	u/qm/r4XEnrYH8C88bs/sK3djJsCDIRn117RgRynXjVouRnXhSGuXlg6dgB82ospVz2RUNTSqx3df
	M2SqZBamizQBuNytIv5FMjrMiwua/iVpEZGuByBdy9yfULfbLK7GNSLcmq+cxSEU8DWSfgqIJa4SX
	IiYd5Ng02Fjp9HV+OWwCIzRj4JnSwtYsj53k5Z2aur0AEkfstLvBXMBrA3eJiSEN4paFo0PLR+dbq
	rufQ/0KoLE2BEBRjyRJA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtsuZ-00029C-34; Wed, 13 Feb 2019 11:41:07 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtsuU-00027P-U7
 for linux-amlogic@lists.infradead.org; Wed, 13 Feb 2019 11:41:05 +0000
Received: by mail-wm1-x343.google.com with SMTP id a62so2089764wmh.4
 for <linux-amlogic@lists.infradead.org>; Wed, 13 Feb 2019 03:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=37gNnip2pUO7WpshWw5fCnmuyn0lJdQR0BJGyefQAvc=;
 b=dYoLjN9TrUKPATAOQ2Er/MGKi76DiyZzIxu6I1xrWyopW/fXA6dW6F36PyuTCDGWDC
 q7V0kkGzY13yLOSEHpleaAeH0LVR96z10queTPnCzTnMcGeceiiX0ujvp8WgHewdBAfq
 H5wKGQk8IwmswEueq7gEwfrFW9iIzB0P/cN3QS02sZJ/nMILrGE6qrpXrKdaM4GNl+xA
 Vbu3lO2O3YIJnS/E/JZ/+YbDC27KmrF4SmCcg3eCh300Z4yEwzYt5NEytM9hfZ1jG9vS
 6dc3MQvPuy/QFZ6CfvotvARpETcVBH/3eOra/UF8Q3gnptSeK7WC19rCz5rbGNH7iv3I
 KYOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=37gNnip2pUO7WpshWw5fCnmuyn0lJdQR0BJGyefQAvc=;
 b=gCofdCjppeT2BxSFJXUTe5gzJFHYyeDm/6wUml8sTiZ/5OWwPDSM5+dZnC2J9JDImA
 YyWVqM3MpFWrHPGPU5azLsysXFDtGbUCiA48i8U9S+KsFSgYnshlJDDq7Wo932t7ZgkJ
 fmCx4veYWhlgWk3nvydQhX64c5OPUW/cptHwJW8Af8RoyHfK8rI8mRNe9G2Ji2hQPoM+
 gpOMiaeBZEzPLSPGSAaMXNKIwyPcOKjNjzb5E6hHYkudbcWVvrEJCCbSPFCuxbUdAAWL
 y7zNz2SdIIvsytyd3cRsqMidLwbtXC1yXAFEuZ7Tc4eqNXidl7SiDZM5Wvf2+S68wMQT
 EKsw==
X-Gm-Message-State: AHQUAuZTwVmCWguc/Ni1MtqdrCXWTdjYxlfRw2y3+RSci70T4atEwUW/
 cLjfi4/AUCtYzA9jvY68GGMt1uCMHJEmuGU0+5wTVA==
X-Google-Smtp-Source: AHgI3Ia3tlOX9B0Wc9itABeYo3VSlGbnUbRzEf1NckYvIhP1mEo5Xcjffa+PtDTuCksXTOIn8kFhY4+DSSlplDk5w2A=
X-Received: by 2002:a1c:a5c8:: with SMTP id o191mr11419wme.137.1550058060914; 
 Wed, 13 Feb 2019 03:41:00 -0800 (PST)
MIME-Version: 1.0
References: <20190213095835.17448-1-jbrunet@baylibre.com>
In-Reply-To: <20190213095835.17448-1-jbrunet@baylibre.com>
From: Maxime Jourdan <mjourdan@baylibre.com>
Date: Wed, 13 Feb 2019 12:40:50 +0100
Message-ID: <CAMO6nay=xXnxks==Zj_uPAE6o9_V=DsLkJOkkLRR1duPxg324Q@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: clock: axg-audio: unexpose controller inputs
To: Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190213_034102_983299_9F43BF20 
X-CRM114-Status: GOOD (  12.61  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, Feb 13, 2019 at 10:59 AM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
> Remove the bindings ID of the clock input of the controller. These
> clocks are purely internal to the controller, exposing them was a
> mistake. Actually, these should not even be in the provider and have
> IDs to begin with.
>
> Unexpose these IDs before:
>  * someone starts using them (even if there no valid reason to do so)
>  * the actual clocks are removed. The fact that they exist is just the
>    result of an ugly hack. This will be resolved in CCF when we can
>    reference DT directly in parent table.
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/clk/meson/axg-audio.h              | 20 ++++++++++++++++++++
>  include/dt-bindings/clock/axg-audio-clkc.h | 20 --------------------
>  2 files changed, 20 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/clk/meson/axg-audio.h b/drivers/clk/meson/axg-audio.h
> index 7191b39c9d65..644f0b0fddf2 100644
> --- a/drivers/clk/meson/axg-audio.h
> +++ b/drivers/clk/meson/axg-audio.h
> @@ -60,6 +60,26 @@
>  #define AUD_CLKID_MST5                 6
>  #define AUD_CLKID_MST6                 7
>  #define AUD_CLKID_MST7                 8
> +#define AUD_CLKID_SLV_SCLK0            9
> +#define AUD_CLKID_SLV_SCLK1            10
> +#define AUD_CLKID_SLV_SCLK2            11
> +#define AUD_CLKID_SLV_SCLK3            12
> +#define AUD_CLKID_SLV_SCLK4            13
> +#define AUD_CLKID_SLV_SCLK5            14
> +#define AUD_CLKID_SLV_SCLK6            15
> +#define AUD_CLKID_SLV_SCLK7            16
> +#define AUD_CLKID_SLV_SCLK8            17
> +#define AUD_CLKID_SLV_SCLK9            18
> +#define AUD_CLKID_SLV_LRCLK0           19
> +#define AUD_CLKID_SLV_LRCLK1           20
> +#define AUD_CLKID_SLV_LRCLK2           21
> +#define AUD_CLKID_SLV_LRCLK3           22
> +#define AUD_CLKID_SLV_LRCLK4           23
> +#define AUD_CLKID_SLV_LRCLK5           24
> +#define AUD_CLKID_SLV_LRCLK6           25
> +#define AUD_CLKID_SLV_LRCLK7           26
> +#define AUD_CLKID_SLV_LRCLK8           27
> +#define AUD_CLKID_SLV_LRCLK9           28
>  #define AUD_CLKID_MST_A_MCLK_SEL       59
>  #define AUD_CLKID_MST_B_MCLK_SEL       60
>  #define AUD_CLKID_MST_C_MCLK_SEL       61
> diff --git a/include/dt-bindings/clock/axg-audio-clkc.h b/include/dt-bindings/clock/axg-audio-clkc.h
> index fd9c362099d9..eafb0de8466b 100644
> --- a/include/dt-bindings/clock/axg-audio-clkc.h
> +++ b/include/dt-bindings/clock/axg-audio-clkc.h
> @@ -7,26 +7,6 @@
>  #ifndef __AXG_AUDIO_CLKC_BINDINGS_H
>  #define __AXG_AUDIO_CLKC_BINDINGS_H
>
> -#define AUD_CLKID_SLV_SCLK0            9
> -#define AUD_CLKID_SLV_SCLK1            10
> -#define AUD_CLKID_SLV_SCLK2            11
> -#define AUD_CLKID_SLV_SCLK3            12
> -#define AUD_CLKID_SLV_SCLK4            13
> -#define AUD_CLKID_SLV_SCLK5            14
> -#define AUD_CLKID_SLV_SCLK6            15
> -#define AUD_CLKID_SLV_SCLK7            16
> -#define AUD_CLKID_SLV_SCLK8            17
> -#define AUD_CLKID_SLV_SCLK9            18
> -#define AUD_CLKID_SLV_LRCLK0           19
> -#define AUD_CLKID_SLV_LRCLK1           20
> -#define AUD_CLKID_SLV_LRCLK2           21
> -#define AUD_CLKID_SLV_LRCLK3           22
> -#define AUD_CLKID_SLV_LRCLK4           23
> -#define AUD_CLKID_SLV_LRCLK5           24
> -#define AUD_CLKID_SLV_LRCLK6           25
> -#define AUD_CLKID_SLV_LRCLK7           26
> -#define AUD_CLKID_SLV_LRCLK8           27
> -#define AUD_CLKID_SLV_LRCLK9           28
>  #define AUD_CLKID_DDR_ARB              29
>  #define AUD_CLKID_PDM                  30
>  #define AUD_CLKID_TDMIN_A              31
> --
> 2.20.1
>

Acked-by: Maxime Jourdan <mjourdan@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
