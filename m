Return-Path: <SRS0=y0rr=E2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9094AC63777
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Nov 2020 19:00:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8B6820760
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Nov 2020 19:00:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="x6eAlTSk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="PUrXRude"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D8B6820760
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PoCJdIN8Fa7SC0GazHvUTYx3PgcM4UFTsdE1gUPp7xw=; b=x6eAlTSkUY2xA6cWT9GTJYVIO
	ndRG9nDPe/cbXjRqLcOQhJnkEa49LoHeY5zYZ6Z73qMpwEg19MjBeop0tCwmwLcRIlS9gAks3qYBD
	rdsjWKDzDvRBKoIpVO5I+qRV0KRQPIeJ7Kr0CmhTNucyWH1qaC+m21wu4sGzuekUwvql47fWDyFOj
	ht+wPilKl7FHkUL5puuzXbxrsTcSoscSb7eJ9Uo7Bua8co/e7UlOfeZ5hr9kSay7XYOaPVUOfyEo2
	nwDFjPhIFW/tc4CBbRMHsz4wL4l0zANK9B8w0EQDrpkxG3TrDm+uzwkFFY4kBv+EM2xDBsrj3SmLX
	S2uqERuhg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kgBeM-0008Md-SI; Fri, 20 Nov 2020 19:00:50 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kgBeF-0008Jc-NN
 for linux-amlogic@lists.infradead.org; Fri, 20 Nov 2020 19:00:45 +0000
Received: by mail-pl1-x643.google.com with SMTP id l11so5339484plt.1
 for <linux-amlogic@lists.infradead.org>; Fri, 20 Nov 2020 11:00:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=YFGbjMAixunjadRt/WNDu4Gi9oV8lPHMKlwpA1Dc+2Q=;
 b=PUrXRudevdfwpKTWyzcLGsmlLQ+wz4pg7i7qVoqSQahOJkZ1MCGJyGGp9lj8P7wqdQ
 1wZrDY7RKvl3i+FHco9AHnzpNRsv+WDmlo3LPJ9s4j/+tpdtTn8QAb7CO4+5lWRxPUoT
 SoBm7dYGx+lU8xiR3w6JHrhXtTDSHYonolxATY74JusyBcsFffiWb+1/eQSh1dOjG/QV
 vEgnnncEp9ekv7MSpTZmbXA8J0UZwBBJJ44KEVfrod/WDpwBaFz5iQNJd1N3YKVJ1z2s
 vp50zuzFn5tZ7/fxd6oHeGUafCLzdYdN1AjohJFDkM1rg9aleEo++CwhosC5jKkytdJJ
 A0yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=YFGbjMAixunjadRt/WNDu4Gi9oV8lPHMKlwpA1Dc+2Q=;
 b=lgIml2fWen7aPVTlYNBEzZxwW6vcF2FT78bLatBfVxDYrza2Gln6yLLP7faFDcS68U
 T8eoYsnfxGMOmX2+CSwG0C3QyIkCcje8BkpQIH84ZBcaD+NKIMKLFpah7a3/hTsJ2vtf
 n1yg6nZrNeuA9lyju5pSGuzvFS5WOcWxHWEm4rpgN8zFPje9Zk2LcKaXZaDAh6CIx2L/
 +6JDhKPV/HhEgOR3jO74JBLuNvgxnpr48LRpolbQg+F4aIGPJY95XtHLItx6KmoECLko
 J/N9YKVK5Zk3Nn+Vec7j7nZBaiY4Au1xjlvVnu6cKCHt9RdgVu5tNL6RX0eh9SC6KYQ1
 5w3g==
X-Gm-Message-State: AOAM530enZgboEol2IC4S4CKEa1PUEiCG+n1mcQcGdJU57fyaDGPa+es
 hzoiF+wu6Ms+OsS+0ZjPwP6cyA==
X-Google-Smtp-Source: ABdhPJz6mX7mESKaTaoDQ0nba24kvRr492R62CY1RT35HX5Q2sHsihUhSg5mzAR/PiNRC/EMsYA2vQ==
X-Received: by 2002:a17:902:7b83:b029:d8:ff06:3184 with SMTP id
 w3-20020a1709027b83b02900d8ff063184mr14439746pll.37.1605898840189; 
 Fri, 20 Nov 2020 11:00:40 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id x28sm3845049pgk.21.2020.11.20.11.00.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2020 11:00:39 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 0/2] arm64: dts: meson-axg-s400: add support for Power
 Controller & MIPI-DSI PHY
In-Reply-To: <20201120152131.3918814-1-narmstrong@baylibre.com>
References: <20201120152131.3918814-1-narmstrong@baylibre.com>
Date: Fri, 20 Nov 2020 11:00:39 -0800
Message-ID: <7hzh3bsvjc.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201120_140043_926525_2E33E2FE 
X-CRM114-Status: GOOD (  12.13  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> This adds the Power Controller and MIPI DSI PHY nodes to AXG, since the corresponding
> driver and dt-bindings had been applied for next release.
>
> Dependencies:
> - Patch 1: [1] applied for 5.11 in meson-clk tree & [2] merged for 5.10
> - Patch 2: [3] & [4] both applied for 5.11 in phy tree

Thanks for describing the dependencies in detail.

Looks like only [1] is needed a build time.  Could you give me a
immutable tag from the clk tree (or clk-meson) I could use in my dt64
branch to ensure my dt64 branch is buildable.

Thanks,

Kevin


> [1] https://lore.kernel.org/r/20200915124553.8056-1-narmstrong@baylibre.com
> [2] https://lore.kernel.org/r/20200917064702.1459-1-narmstrong@baylibre.com
> [3] https://lore.kernel.org/r/20201116101315.71720-1-narmstrong@baylibre.com
> [4] https://lore.kernel.org/r/20201116101647.73448-1-narmstrong@baylibre.com
>
> Neil Armstrong (2):
>   arm64: dts: meson-axg: add PWRC node
>   arm64: dts: meson-axg: add MIPI DSI PHY nodes
>
>  arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 61 ++++++++++++++++++++++
>  1 file changed, 61 insertions(+)
>
> -- 
> 2.25.1

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
