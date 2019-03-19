Return-Path: <SRS0=/WbR=RW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B44AC4360F
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Mar 2019 09:39:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF84F20854
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Mar 2019 09:39:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Vyr6Al/a";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="MIGKVcui"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF84F20854
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TzLEpP/DWIewsVxM6VjfBlm0eeka9DpMNOVpOjtrXMg=; b=Vyr6Al/aLwRiaG
	Zv7TN6ji2ODMEVeZL0X8YGzAfe1CYgVZLp8RFKQcyxy8svLabuWEEc4ab+Vd7Kc4LbclH8x8a4tgF
	Y844ysv5yJnzjNOWAQup9GtRLdfnTCjde40yquPrkYGSddTEaxjn4m/6CuxOcpO5rOB3poELD6XpV
	lFcOE6GObo2enwAeAaMn8UBJZFVPXh8F80GlI+xaUCMI0uU2l0T4XHq4JkTaga1N5GgPPXGJEq2vO
	/laeRK945QSBK2TeJfPzsKyBuG4P1jxWf5ZFmPXx9t2j2k+aj7OUud5Hi8DupwNTP6x9i10T5owRV
	3dt/B9a0n2F2hu8Ni7qg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6BDn-0001WL-SL; Tue, 19 Mar 2019 09:39:47 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6BDl-0001Vi-M5
 for linux-amlogic@lists.infradead.org; Tue, 19 Mar 2019 09:39:46 +0000
Received: by mail-wm1-x341.google.com with SMTP id e74so15822139wmg.3
 for <linux-amlogic@lists.infradead.org>; Tue, 19 Mar 2019 02:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=j4LluMz8zBVBlBijmLUX6TcBWQHn83DSqbxHhxWrKV8=;
 b=MIGKVcuik3tM5vzjuN4/C2+SPU/FXaaOp74zzb60EgZ4QeJgaw8MFw/tk93p1VfH1P
 XOwjY7bq1gr1b3UmQkbJQ5kaWtAgJC0MYWZDTHH7SDgTzLkvXkZBirX/6USFtL250XY/
 EWnyvnPDsUEKqqzjeQ9MlIm5cio1OzNDXLlqRc1xuAmMHB2A0881JpZDYmEDojL8J2YZ
 RNGh5qOtMbAzTqLiZ16TJxNax7L9OavEHLLO8KFYg6jNvSB2idgSkJi+M+YwTexL9ASG
 7lSvq+pHVf/wAWrdtRZ1vmR6hGzFTk59UxjwapJUXPDpgKbXhxQ28v17jeu/dXNdrDqR
 2SYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=j4LluMz8zBVBlBijmLUX6TcBWQHn83DSqbxHhxWrKV8=;
 b=G7OAe01MqT04KFWv6XyHI1u9IFK+Xrbb8ROB4eJIUlYZMij3h/ALgMhLMILsJZE0U8
 1SoPnF8KGgg6GIniI4gEligqso1t90p9LBu0V+W+L/ix4G+fcsA6Htceik7BljX9Y1vC
 s+c2F/hPm3h8VwkYfZQyICjIoZ0QPuCUrP5sElO+itumkUXXUbUdH/N6udnIKkrxyMOa
 r/YTrfOJD5SMr0YvDiW+fo8caq9yk/uJN8NlIrSWbaFF/J3rHBVqhgfsBEqPxxzmrd+I
 pMXdQjrJ+j1eLbsu4e30QXjJD6UUwHKWxgiuNbxUBJcdXiLOB+wHpxdf+J4/Frh/cc3t
 2REg==
X-Gm-Message-State: APjAAAWMLO8kvM/aHuoEvCTR4l5i2ALJZQA0HAtKc1mx2ZglJSkPNjXG
 GcLURfr8ylLDZqgFYs8A51ct4g==
X-Google-Smtp-Source: APXvYqwpTR8XfsZzMwNp41YJa6kGiyx/NyZGDsveoP2x0c498jnspqeKsy9vFoBMmX4ucJQobuYjOQ==
X-Received: by 2002:a7b:c3d7:: with SMTP id t23mr2599671wmj.62.1552988383839; 
 Tue, 19 Mar 2019 02:39:43 -0700 (PDT)
Received: from boomer.baylibre.com ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.gmail.com with ESMTPSA id
 w12sm10432604wrt.97.2019.03.19.02.39.42
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 19 Mar 2019 02:39:43 -0700 (PDT)
Message-ID: <e9e5644385fb0ac45faceec5ba005dc20ab65989.camel@baylibre.com>
Subject: Re: [PATCH v2 0/2] clk: meson: g12a: Add CPU Clock support
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Date: Tue, 19 Mar 2019 10:39:41 +0100
In-Reply-To: <20190304131129.7762-1-narmstrong@baylibre.com>
References: <20190304131129.7762-1-narmstrong@baylibre.com>
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190319_023945_718064_89C43353 
X-CRM114-Status: GOOD (  15.64  )
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
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, 2019-03-04 at 14:11 +0100, Neil Armstrong wrote:
> This patchset adds support for the clock tree feeding the 4xCortex A53
> cpu cluster.
> 
> This patchet does not handle clock changing, this will be added in a
> secondary patchset.
> 
> The CPU clock can either use the SYS_PLL for > 1GHz frequencies or
> use a couple of div+mux from 1GHz/667MHz/24MHz source with 2 non-glitch
> muxes.
> 
> The CPU clock must be switched to a safe clock while changing the clocks
> before the non-glitch muxes. Proper support will be added later.
> 
> In this patchset, clocks are set read-only.
> 
> Changes since v1:
> - moved to clk_regmap_gate_ro_ops for R/O gates
> - added comments with datasheet field names
> - moved pribate bindings changes to driver patch
> - removed invalid PCIE IDs
> 
> Neil Armstrong (2):
>   clk: meson-g12a: add cpu clock bindings
>   clk: meson: g12a: add cpu clocks
> 
>  drivers/clk/meson/g12a.c              | 350 ++++++++++++++++++++++++++
>  drivers/clk/meson/g12a.h              |  22 +-
>  include/dt-bindings/clock/g12a-clkc.h |   1 +
>  3 files changed, 372 insertions(+), 1 deletion(-)
> 

With the small naming comment on patch 2

Acked-by: Jerome Brunet <jbrunet@baylibre.com>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
