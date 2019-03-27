Return-Path: <SRS0=DOpU=R6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC241C43381
	for <linux-amlogic@archiver.kernel.org>; Wed, 27 Mar 2019 10:52:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7DB662087C
	for <linux-amlogic@archiver.kernel.org>; Wed, 27 Mar 2019 10:52:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nZweUEc6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="cgDzqEBl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7DB662087C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=awe29vbZ3Wlr90dVu7ZKVeUmZ5TrSTr4OvGI1pZO9oo=; b=nZweUEc63SaouH
	dgozIKmWrftD0LwOza6LGpmQFDgVIc7dU5cMm+nX+gkvwEDFnHFaW6jXpcIjocefmHjNpaVhqrFaZ
	m7d7YxWB8DtJYQPhOVQeiD+nJ/KrVRigERppkDLW22YAy0r68N2ek5znV4Juw2R9tAYsy6uKR5ehW
	3YbXRk9PrTvS4zJM+VULmE8B6SXfR6uMliCEEOqSvAySvxFGZlFC3PtGwgWktSH68NNZbfBZHNF8y
	phJUwDedNMyH2K8OUKA6miYC9n5RnCGn3+uLN3iCx8JCPtDmEUvex8hwMTNGj22GirmhlwOXskQ2z
	VmLx08/UcKFmved7IIuQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h969w-0003fY-M9; Wed, 27 Mar 2019 10:51:52 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h969t-0003eZ-QJ
 for linux-amlogic@lists.infradead.org; Wed, 27 Mar 2019 10:51:51 +0000
Received: by mail-wr1-x442.google.com with SMTP id s15so17942840wra.12
 for <linux-amlogic@lists.infradead.org>; Wed, 27 Mar 2019 03:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=whkKhI+tBkxQ3DBj/1BujfBmXUt+Yvq0OEuaSpUdaxU=;
 b=cgDzqEBlkFT09bW3V4y+a0i+SLRqvC7ch6Lofmji0KkEcPv1p5eOBK6cOfu/hQ2k2n
 +0WoU/Q8Kn1A3vnA11vMaBhed9zkgkEm5HRh/TajARE9KARPaVldIFtyxVaha0VlFaMm
 TDWR1f0w3TxtCvXvKQ5Cm4Hrza365zLwp+EuVYIXTzOz5YeH8yYLoBLd3p7x4DInbHw3
 sgProb3it7GVP7iT1aEUrqNr7vf/lVQP6KYzPFaeV2+NU+H4gEpLcQqXlq1Vch7RNvQE
 PLy0hdnUyKEazJnd9xP0O5q0HCjxtxobqEqXbR28wY/WVYOBDK3xAJXBCFmEuIqOTQjf
 c74A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=whkKhI+tBkxQ3DBj/1BujfBmXUt+Yvq0OEuaSpUdaxU=;
 b=XmYdPW618/01U+hZqOtvFq27cFNrFa+nnFrbEluCYvPIfgGkLMViA63F3T9FJCPyTt
 Dn+jvyO0rhOxXAybdL+WEhribX5bMvsAsOA4PqktK5K1cQu/V4r67ovLeHPLY32AzTz4
 kH9HHJ/uJfVvFWSJ9PTSCSm6QiY4eWqcml3EILf7xB5ePWMJBdekrNA1ZTtghcyCdkdD
 D66nF/KeJhafzOYCl2y/AYxA7wX4gwz5KwTL4CPPAV1Bm9pNHwLXmWiSOW/VDxVPprku
 H3LrMGxXrIXk5pokdkKex4RmiWf/Q1hUhMJb9kjQlAyKgS79S7OwncoNanGFR7QKccg+
 Awng==
X-Gm-Message-State: APjAAAVEPFheh7zAlVKRGG/niUxZyvKuHl1ORwBZds8P5NFjt2AdBSqI
 80sLAflJ1c5bxpLLaczkgrNCxA==
X-Google-Smtp-Source: APXvYqxGefO8AtgH30eo/0x87l2ofD2BKnceDI9gln8NsdNB7wdd/mruh3hD/f1eKcJNPAp9twAFGg==
X-Received: by 2002:adf:d84d:: with SMTP id k13mr25301283wrl.154.1553683906216; 
 Wed, 27 Mar 2019 03:51:46 -0700 (PDT)
Received: from boomer.baylibre.com ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.gmail.com with ESMTPSA id
 n189sm33090938wmb.28.2019.03.27.03.51.44
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 27 Mar 2019 03:51:45 -0700 (PDT)
Message-ID: <345dd7e287ed07f4a84847ff024fce237c1380a1.camel@baylibre.com>
Subject: Re: [PATCH RFC 3/6] clk: meson: g12a: mark fclk_div3 as critical
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, khilman@baylibre.com
Date: Wed, 27 Mar 2019 11:51:42 +0100
In-Reply-To: <20190327103308.25058-4-narmstrong@baylibre.com>
References: <20190327103308.25058-1-narmstrong@baylibre.com>
 <20190327103308.25058-4-narmstrong@baylibre.com>
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190327_035149_854997_9A38F7A3 
X-CRM114-Status: GOOD (  20.89  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, 2019-03-27 at 11:33 +0100, Neil Armstrong wrote:
> On Amlogic Meson G12b platform, the fclk_div3 seems to be necessary for
> the system to operate correctly.
> 
> Disabling it cause the entire system to freeze, including peripherals.
> 
> This patch patch marks this clock as critical, fixing boot on G12b platforms.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  drivers/clk/meson/g12a.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
> index 03b4c78f558f..d62ebcd2162d 100644
> --- a/drivers/clk/meson/g12a.c
> +++ b/drivers/clk/meson/g12a.c
> @@ -1062,6 +1062,16 @@ static struct clk_fixed_factor g12a_fclk_div3_div = {
>  		.ops = &clk_fixed_factor_ops,
>  		.parent_names = (const char *[]){ "fixed_pll" },
>  		.num_parents = 1,
> +		/*
> +		 * This clock is used by the resident firmware and is required
> +		 * by the platform to operate correctly.
> +		 * Until the following condition are met, we need this clock to
> +		 * be marked as critical:
> +		 * a) Mark the clock used by a firmware resource, if possible
> +		 * b) CCF has a clock hand-off mechanism to make the sure the
> +		 *    clock stays on until the proper driver comes along
> +		 */
> +		.flags = CLK_IS_CRITICAL,

The gate should be critical then, not the fixed_divider clock.
the fdiv3 gate is a child of this clock, so fdiv3 should still be able to gate
with this


>  	},
>  };
> 
>  

Could you CC me of the whole series next time, I prefer getting the all
context.


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
