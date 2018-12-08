Return-Path: <SRS0=QVii=OR=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	T_DKIMWL_WL_HIGH autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63CB1C07E85
	for <linux-amlogic@archiver.kernel.org>; Sat,  8 Dec 2018 00:20:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3102220857
	for <linux-amlogic@archiver.kernel.org>; Sat,  8 Dec 2018 00:20:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hE3+i1Iv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="1F5pPuYe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3102220857
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+PBD0gE7/Qd4OkATZTJnXX2du3zCIUCM+y7Hiq9P5to=; b=hE3+i1IvHtLBwK
	3ybXrlnfQnNUHB+2LGYcY+REgzYPHSS9+zNhZfiibGZDlQytuGNQXUCXAyW3odIA+IjpPVpGTNDXv
	WXR7K43yDy1vIX4qVbMxDrhqLxCgGSLfn8lkc3BPqtB3B1IOXsn5aTpI99/qSa/cuXj4vLQATXSZN
	07MFtmx6Gh9Dnh0nJA78eV17sf2ckDBmfLxBnBd6CvnAfdreIT6Jghc+/ceLdLDKBgXVhk1eQRkY2
	B6QijLbi7Xyehcx7Lo3QncPpc6j+3ou9yp9UbksnNUC8ms008vMkv8YfVEqf72bK3ISY1FoqQyoqd
	DSKneaw7acC5ytW1bTZA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gVQM5-0002SB-UT; Sat, 08 Dec 2018 00:20:25 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gVQLv-0001YD-12
 for linux-amlogic@lists.infradead.org; Sat, 08 Dec 2018 00:20:17 +0000
Received: by mail-pg1-x543.google.com with SMTP id n2so2403734pgm.3
 for <linux-amlogic@lists.infradead.org>; Fri, 07 Dec 2018 16:20:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=SsgzZB8Td4wE18SBCoqLu+DU0RtNakSEnvE92UOGK1Y=;
 b=1F5pPuYe/exeQ3rKR0koLTlvCmGwzBRT1GuQmpLVQH4jddBvzSjKW6zokwLsc2WwA/
 RKobYBd5rwoISH2t2RMJWdFJ/awmgX8/eFZlB+0Vadm++g/KvZtZ0pZ4RnLBePA38LuJ
 0jcqnTvT3CLFKVRB4YY6yb60PJtg9EViqrR68yX9JV38sO2tZnYez17uP7gRBnr+u2Tf
 dKluCHkoK1EXlAwJrs0NEX6vGTxrc30/A70mdHy9CCl5kP20u+xfSe2Ljv1dR/SmPxKK
 vvuBa+8AyAU7j4ZP9fKGCkOPKK7NvBE+zSExyW+hgYHzKtWP/Ld6rbhcRImuQLaGcp3J
 ljQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=SsgzZB8Td4wE18SBCoqLu+DU0RtNakSEnvE92UOGK1Y=;
 b=fXmehkG+b1PQ3cixqAeE8ZUMpyM3zZoXPmuapfx/8BMQDfnyz8DqwV4S64meB8aN12
 cCldbKbnW6DdDR22Om4Aa4D6sVJHIHynGCH/9H8Yud7pW3xuwpuDC1j2ZKijR6u6t006
 1A9i3X76OMppFTDmrJqejVf4x/ZpwdW7XxGlDlTyCYrXMn/rSHZw1Lu4l1fH6NT0UIWX
 xYhOdwparLpTI5f4NvrBf/TpholVVUZM5oCqYIomx+D0+wud4k2B2Uc/gd8qXwg7ezyk
 Ia+LGN8n38YakGeQ4hsAa9gK2OLiQXoBF5Coz2blOjraG5dSGK+HWee/Zv9rYnNuYahh
 gT2A==
X-Gm-Message-State: AA+aEWaDLRnKbKnWROT2+l8RGhnArHdq6ZOIegAPnFy/iG+hg2Xl0SJC
 sI545hEdV7iyiWWYahQ+HdpjXA==
X-Google-Smtp-Source: AFSGD/V+2uiF0J90CidJzrpNuOH8DO3AbXBgA9Ng2lhd04SvWXRjVfnrVYKjpbXFW4CUHv1fBGtxbw==
X-Received: by 2002:a63:561b:: with SMTP id k27mr3711928pgb.271.1544228403879; 
 Fri, 07 Dec 2018 16:20:03 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.googlemail.com with ESMTPSA id c23sm5385274pfi.83.2018.12.07.16.20.02
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 07 Dec 2018 16:20:03 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Carlo Caione <ccaione@baylibre.com>, robh+dt@kernel.org,
 mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 martin.blumenstingl@googlemail.com, ingrassia@epigenesys.com
Subject: Re: [PATCH v2 1/2] arm64: dts: meson: Fix IRQ trigger type for macirq
In-Reply-To: <20181207105231.25593-2-ccaione@baylibre.com>
References: <20181207105231.25593-1-ccaione@baylibre.com>
 <20181207105231.25593-2-ccaione@baylibre.com>
Date: Fri, 07 Dec 2018 16:20:02 -0800
Message-ID: <7hftv8yiml.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181207_162015_212577_F20C967A 
X-CRM114-Status: GOOD (  11.88  )
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
Cc: Carlo Caione <ccaione@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Carlo Caione <ccaione@baylibre.com> writes:

> A long running stress test on a custom board shipping an AXG SoCs and a
> Realtek RTL8211F PHY revealed that after a few hours the connection
> speed would drop drastically, from ~1000Mbps to ~3Mbps. At the same time
> the 'macirq' (eth0) IRQ would stop being triggered at all and as
> consequence the GMAC IRQs never ACKed.
>
> After a painful investigation the problem seemed to be due to a wrong
> defined IRQ type for the GMAC IRQ that should be LEVEL_HIGH instead of
> EDGE_RISING.
>
> The change in the macirq IRQ type also solved another long standing
> issue affecting this SoC/PHY where EEE was causing the network
> connection to die after stressing it with iperf3 (even though much
> sooner). It's now possible to remove the 'eee-broken-1000t' quirk as
> well.
>
> Fixes: feb3cbea0946 ("ARM64: dts: meson-gxbb-odroidc2: fix GbE tx link breakage")
> Fixes: 6d28d577510f ("ARM64: dts: meson-axg: fix ethernet stability issue")
> Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
> Tested-by: Jerome Brunet <jbrunet@baylibre.com>
> Acked-by: Neil Armstrong <narmstrong@baylibre.com>
> Signed-off-by: Carlo Caione <ccaione@baylibre.com>

Queuing this one for v4.21 (dt64 branch)

I'm going to wait for the dust to settle on 'PATCH v2 2/2' for the
32-bit SoCs (and will rely on Martin's recommendation for the final
decision there.)

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
