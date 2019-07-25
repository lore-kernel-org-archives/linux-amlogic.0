Return-Path: <SRS0=Jj0Y=VW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4B7FC7618B
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Jul 2019 14:38:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 997B1218EA
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Jul 2019 14:38:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LIfZBURu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="V1ADhv36"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 997B1218EA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sg6KbX0lGF5m5KDD7CoWPGO+Lhkey5CUBuuQ/eM/Vfo=; b=LIfZBURuRpTXM4
	Buyno2CBG0aIcSDRRR5jkXnzV5jV7GgKt80xFNI5RktS2xA6aG+rHeM47FrdGWtguWXWfEpPdFAEU
	sj4q2qJ1O5o9XxfIgts8codG7nXG2FlDL4guoW9r63QNC+yi+sPd9gONn+PXYe8rQ7QDNTKlIRFvQ
	cg+QJbxhQHQ6qodm7dXI2PYM1kyvpFV+SaGPGE3w8QFK5mMJ54w8aETeBj80IKR3X74BiK41dfhzv
	zsejRLz79bJujOjLpcfvNiMI/tlBhjyovtPHYRrhsxqLrK1o7kjwuoY6jpSRLtGKwmdL6MaOsnWdY
	/6611M4EMTvgLkq50YPg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hqetI-0001X3-3L; Thu, 25 Jul 2019 14:38:44 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hqet1-0001LF-KU
 for linux-amlogic@lists.infradead.org; Thu, 25 Jul 2019 14:38:29 +0000
Received: by mail-wm1-x344.google.com with SMTP id s3so45225156wms.2
 for <linux-amlogic@lists.infradead.org>; Thu, 25 Jul 2019 07:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=xKhjaESpwvk6sR4/SITRYpcTnlFG6jIulb5Z7EfG/G8=;
 b=V1ADhv36o2+cFrscOoSHKnRjQaO9dDNPwd3Ahh6Kl9afPgC4H7hsakbzpEII9ZBu3/
 LtKUTgwGP2hJW4bT58gqaxPReeLUWvqMGCpXPUyrP2WYF1zGLO+3neKuDwwo+Y3FHCkE
 Wvtcz3x2U+4xnulIqZltKgwoIt38DxPDPPyDf0XK3AqxmKDqo2E7Y49/iUffPrC/TJsv
 NYdXwTKkWfoIiM8q8r1eJXEbaHZSwVM7s1gB2mHAPGnEbGDnwE8T9PNUTUikrXHii2T9
 wA0jAXz+9MA1wlhWFtP21oNGb7/Ahj3vr3lwVYFCVAXVtbenOm+Zdo596KtqjgZ91d61
 lprg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=xKhjaESpwvk6sR4/SITRYpcTnlFG6jIulb5Z7EfG/G8=;
 b=ix3d8SB3SVAGyFj+rZ7XJsSg3o885NNAgnR06tqj6BieeJ3IcWnTypn7OtsO9wtsJq
 a1dLwSxLnVIUSmLD+CDZLakezSTf36fUBaNKR/XsTGmbmv7qvpn2fotglWYun3eJGXeT
 zpzn/dx4bFUlrPvIFX7gYBGBzTFOOr574B58zkFGfm6TfVPeU3iPVV+RvswKxkurobQZ
 9XSDVolgV+5+/vxibWymVj5511tU2n/WF+X5o0J9t0f5kVTDxJtJwJXaECiOfx0bdqpW
 Tn+50yuHTEWhjvr06wHZ4Mz8A+EXObSXbMhCVDHR0s02SzT4sQy/n1FytEFeKX/Jpz0J
 lfRQ==
X-Gm-Message-State: APjAAAWO/6STEhTCrYQW+ZpQp2m6cUBc8AMc7wRpipE0mIVs1uv8bJqN
 cB8Ow3aVrQlUFn4wEaMiUsnn4w==
X-Google-Smtp-Source: APXvYqxUa4coqzdXQVeu4+Cob/EMTrXyHltG48aeyxm8e5yNgpQ4cUf2+pfTE9+Acv3S/pIJ6kzOxA==
X-Received: by 2002:a1c:9e4d:: with SMTP id h74mr84250838wme.9.1564065506038; 
 Thu, 25 Jul 2019 07:38:26 -0700 (PDT)
Received: from localhost (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id z1sm51923870wrv.90.2019.07.25.07.38.25
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 25 Jul 2019 07:38:25 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Alexandre Mergnat <amergnat@baylibre.com>
Subject: Re: [PATCH] clk: meson: axg-audio: migrate to the new parent
 description method
In-Reply-To: <20190722094954.14040-1-amergnat@baylibre.com>
References: <20190722094954.14040-1-amergnat@baylibre.com>
Date: Thu, 25 Jul 2019 16:38:24 +0200
Message-ID: <1jd0hyxjq7.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190725_073827_698936_8276971E 
X-CRM114-Status: UNSURE (   6.47  )
X-CRM114-Notice: Please train this message.
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
Cc: narmstrong@baylibre.com, sboyd@kernel.org, khilman@baylibre.com,
 Alexandre Mergnat <amergnat@baylibre.com>, linux-kernel@vger.kernel.org,
 baylibre-upstreaming@groups.io, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon 22 Jul 2019 at 11:49, Alexandre Mergnat <amergnat@baylibre.com> wrote:

> diff --git a/drivers/clk/meson/axg-audio.c b/drivers/clk/meson/axg-audio.c
> index 8028ff6f6610..4253a466eae8 100644
> --- a/drivers/clk/meson/axg-audio.c
> +++ b/drivers/clk/meson/axg-audio.c
> @@ -15,7 +15,6 @@
>  #include <linux/slab.h>
>  
>  #include "axg-audio.h"
> -#include "clk-input.h"
>  #include "clk-regmap.h"
>  #include "clk-phase.h"
>  #include "sclk-div.h"
> @@ -24,7 +23,7 @@
>  #define AUD_SLV_SCLK_COUNT	10
>  #define AUD_SLV_LRCLK_COUNT	10
>  
> -#define AUD_GATE(_name, _reg, _bit, _pname, _iflags)			\
> +#define AUD_GATE(_name, _reg, _bit, _phws, _iflags)			\
>  struct clk_regmap aud_##_name = {					\
>  	.data = &(struct clk_regmap_gate_data){				\
>  		.offset = (_reg),					\
> @@ -33,13 +32,13 @@ struct clk_regmap aud_##_name = {					\
>  	.hw.init = &(struct clk_init_data) {				\
>  		.name = "aud_"#_name,					\
>  		.ops = &clk_regmap_gate_ops,				\
> -		.parent_names = (const char *[]){ _pname },		\
> +		.parent_hws = (const struct clk_hw *[]) { &_phws.hw }, \

Those '\' are aligned with tabs. please check, you have aligned a few
with spaces instead

>  		.num_parents = 1,					\

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
