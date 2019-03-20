Return-Path: <SRS0=2I4g=RX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EED6C43381
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 Mar 2019 08:51:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D5ED2175B
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 Mar 2019 08:51:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bY6SPA5v";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="J16Qc3Fr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="WA0k8sfd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D5ED2175B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S9zW+k9Si2whjROoHfxhx4cAvfSOBBf9AdvNYZHcRss=; b=bY6SPA5vDYGGU/
	vkqWSP2xAv3RZHYCY0c2EwuFmUBR/10I3ZTeznHFoMQFbiWFT2byJ8cmO201CV0KtTcTrCKJg9E0U
	yviuFp9gU29rdjiqTkW+pEpGvnBWPQnZNP7baX5tVUuHDOapyAjBU6JffaR86+d6BJVnBddgSa30w
	LHkWTeBCM8y7VtBOjU+KDFdgtw9HReZlikH9ZZhXF2t4635qDC/XykM2QU06yaMnoBXkRRE7m7h0B
	tc6R+fyKSpLyFKDeJ4AYe1vT/dlmJQiA+ep1i6FnyT5Bqh2n/HWLhlEAw4HT1D4PKE0KrayZ1G10n
	hK2EHxJl2rfZp3q0aG7g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6WwS-0005aS-Qw; Wed, 20 Mar 2019 08:51:20 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6WwR-0005PU-0I
 for linux-amlogic@bombadil.infradead.org; Wed, 20 Mar 2019 08:51:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OGXGcvskv4iCf+DQMwdniJ9CF3Cv0SYqxOdkT3KVa+w=; b=J16Qc3FrTsKCenQb5Ssdjj/k4u
 /T7UznYXMFl6C1v+snfXt0b95m7KDVSRF5mAx9K/0Bz7vAVFLGvNo3/y6uxE6AELXEYIkYG80ndGC
 UbWUgpqZHIVWEEF/US5px9DFQqh9PeR+IvEnd0WwWOFO4WVdQfz0rOuciGkN95v9CXesOSxLLmtLG
 AD5jaFvhjsl97YOUaicOmtvVoQykglJ1rJ1EKyGl3/A6UUMqctCtpj9E+gGsb37f4eHB6fTkAVLHL
 W+o9b2NnetLjCg8RkdLm4sxpwjvfIjNshX3gohcUMz+AoueFdRswEOoO270hn5pdIyQgN8LWcyPzx
 iZTv2p6w==;
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6Wvs-0001dt-44
 for linux-amlogic@lists.infradead.org; Wed, 20 Mar 2019 08:50:45 +0000
Received: by mail-wm1-x341.google.com with SMTP id z11so11139141wmi.0
 for <linux-amlogic@lists.infradead.org>; Wed, 20 Mar 2019 01:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=OGXGcvskv4iCf+DQMwdniJ9CF3Cv0SYqxOdkT3KVa+w=;
 b=WA0k8sfdCPCCgdaECQhrTL4VIxD5StlA7xxHwHEzX7kM/F6Z1UF0sUCfASwdX1Ge0J
 cWsA03a/x6qvODKIBwD44V/xm7lzHInUUU4GMpEuWObgquhln3NCE+2FTPgdoe/SO6XC
 MbCkYUh/iJBkrsbp/B+RVfk3lsm7k1skYRjD2iiPq1GBtXnvnlSCVqXA3DLl+OSeqKmS
 1fuEmFjbzOxL7Toou2zqJxbXsTUwQQ+lVj/gDF102U9bo03n07WzPbEx6LmRq8Eq/P6H
 RScVTypeUr22Huema2t/Bsvi4eCdG231JJMzhUdsaEjmMBPuChK+mYdGg0H70Xc1NDXw
 DH2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=OGXGcvskv4iCf+DQMwdniJ9CF3Cv0SYqxOdkT3KVa+w=;
 b=C6C4MrVC0elt/TpNOkcYnvy+vxNOzH60OWJ++0UZV2Ezk2A58/NLfRR2gllVuqZIu3
 4/75EqvLIjiKLJ3s7XPfv50/gqCzpEnFdWaA3C7RXMR2TIWZHvFx8mgRIKYDwc9pCQn+
 xZYSw0sWy0yOzs02SnbiwoDj9HLlXCIUnxUXHI4HBrQTcp2qCYOhEVnfhxzsq0+dPChE
 2ktGYoxqmONn07zMqasXAb8rouA2KYRlfCIfGPOOtLRT148S0Emh7hqaIvx3j690pvQe
 6GnZKhIAkyMLbqERmKpFVQUJC+/QvoCEIg21baafL6JvsC9vjzKR+F061iDq1IsKqokT
 cTAw==
X-Gm-Message-State: APjAAAXZdcSd0C0Flq4hpyS8Age7MR7Iz0fLUFYUBKlg4Hqg19fPb6Om
 QYi0UKSPsR7XKFWH9KEhqPmHJw==
X-Google-Smtp-Source: APXvYqx/j0beIVS2vwDu50rOrnf8gkb7XYqITZeZIfk0qeRZvwzUQiB8KpoyngBXodMOq3m6MLHsXA==
X-Received: by 2002:a1c:cb82:: with SMTP id b124mr6907166wmg.11.1553071773429; 
 Wed, 20 Mar 2019 01:49:33 -0700 (PDT)
Received: from [192.168.1.62] (176-150-251-154.abo.bbox.fr. [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id
 a9sm1672536wrt.29.2019.03.20.01.49.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 20 Mar 2019 01:49:32 -0700 (PDT)
Subject: Re: [PATCH] dt-bindings: clock: axg-audio: unexpose controller inputs
To: Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>
References: <20190213095835.17448-1-jbrunet@baylibre.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <703bf558-a0f7-e64b-bf0b-bb619c16d4c3@baylibre.com>
Date: Wed, 20 Mar 2019 09:49:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190213095835.17448-1-jbrunet@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190320_045044_249744_0EF26282 
X-CRM114-Status: GOOD (  15.73  )
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
Cc: Maxime Jourdan <mjourdan@baylibre.com>, devicetree@vger.kernel.org,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 13/02/2019 10:58, Jerome Brunet wrote:
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
>  #define AUD_CLKID_MST5			6
>  #define AUD_CLKID_MST6			7
>  #define AUD_CLKID_MST7			8
> +#define AUD_CLKID_SLV_SCLK0		9
> +#define AUD_CLKID_SLV_SCLK1		10
> +#define AUD_CLKID_SLV_SCLK2		11
> +#define AUD_CLKID_SLV_SCLK3		12
> +#define AUD_CLKID_SLV_SCLK4		13
> +#define AUD_CLKID_SLV_SCLK5		14
> +#define AUD_CLKID_SLV_SCLK6		15
> +#define AUD_CLKID_SLV_SCLK7		16
> +#define AUD_CLKID_SLV_SCLK8		17
> +#define AUD_CLKID_SLV_SCLK9		18
> +#define AUD_CLKID_SLV_LRCLK0		19
> +#define AUD_CLKID_SLV_LRCLK1		20
> +#define AUD_CLKID_SLV_LRCLK2		21
> +#define AUD_CLKID_SLV_LRCLK3		22
> +#define AUD_CLKID_SLV_LRCLK4		23
> +#define AUD_CLKID_SLV_LRCLK5		24
> +#define AUD_CLKID_SLV_LRCLK6		25
> +#define AUD_CLKID_SLV_LRCLK7		26
> +#define AUD_CLKID_SLV_LRCLK8		27
> +#define AUD_CLKID_SLV_LRCLK9		28
>  #define AUD_CLKID_MST_A_MCLK_SEL	59
>  #define AUD_CLKID_MST_B_MCLK_SEL	60
>  #define AUD_CLKID_MST_C_MCLK_SEL	61
> diff --git a/include/dt-bindings/clock/axg-audio-clkc.h b/include/dt-bindings/clock/axg-audio-clkc.h
> index fd9c362099d9..eafb0de8466b 100644
> --- a/include/dt-bindings/clock/axg-audio-clkc.h
> +++ b/include/dt-bindings/clock/axg-audio-clkc.h
> @@ -7,26 +7,6 @@
>  #ifndef __AXG_AUDIO_CLKC_BINDINGS_H
>  #define __AXG_AUDIO_CLKC_BINDINGS_H
>  
> -#define AUD_CLKID_SLV_SCLK0		9
> -#define AUD_CLKID_SLV_SCLK1		10
> -#define AUD_CLKID_SLV_SCLK2		11
> -#define AUD_CLKID_SLV_SCLK3		12
> -#define AUD_CLKID_SLV_SCLK4		13
> -#define AUD_CLKID_SLV_SCLK5		14
> -#define AUD_CLKID_SLV_SCLK6		15
> -#define AUD_CLKID_SLV_SCLK7		16
> -#define AUD_CLKID_SLV_SCLK8		17
> -#define AUD_CLKID_SLV_SCLK9		18
> -#define AUD_CLKID_SLV_LRCLK0		19
> -#define AUD_CLKID_SLV_LRCLK1		20
> -#define AUD_CLKID_SLV_LRCLK2		21
> -#define AUD_CLKID_SLV_LRCLK3		22
> -#define AUD_CLKID_SLV_LRCLK4		23
> -#define AUD_CLKID_SLV_LRCLK5		24
> -#define AUD_CLKID_SLV_LRCLK6		25
> -#define AUD_CLKID_SLV_LRCLK7		26
> -#define AUD_CLKID_SLV_LRCLK8		27
> -#define AUD_CLKID_SLV_LRCLK9		28
>  #define AUD_CLKID_DDR_ARB		29
>  #define AUD_CLKID_PDM			30
>  #define AUD_CLKID_TDMIN_A		31
> 


Applied to next/drivers

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
