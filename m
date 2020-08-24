Return-Path: <SRS0=4XcC=CC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50E55C433DF
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Aug 2020 21:17:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B7A220656
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Aug 2020 21:17:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YfRpYXC9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="T+B1E+Rz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B7A220656
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7HgNkvxmY8Okz29dhUxxeXHGDK21qHoHVIjXw3bxq/4=; b=YfRpYXC9OisCTKcV9018e4c1q
	O0vq+MpsRR3DAD4mRUncGFRh6CjJPYbclbR6BsjyeA+zZMjVrhd6fhx4YgN3QFiXaE6Aqlbpm8Rtk
	4BHXRDHE9GyLzdEOjMkZ4QiQPKZoyZH1DBPRYcmg6tnHqI2p1+F02kQb3UQqeMNq7GFfGyGxzQcCY
	sP9RazSeWTC1pK1IV16wMzkPpSQqVtsYLKJJ9DSxKOaDbrPLZ+NVnPyA0iVJUTCmsmDGQEYlUSg/A
	mRmuW4RgLcF6ALxRCeDKp0iE0RLTmq/bRm9kGAYK/DQWqyU2L2qAf3/TzHGrYiFk9kuBw83VvU2NL
	whKltp9wg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAJpn-0004aj-JZ; Mon, 24 Aug 2020 21:16:55 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAJpi-0004Yj-V8
 for linux-amlogic@lists.infradead.org; Mon, 24 Aug 2020 21:16:51 +0000
Received: by mail-pf1-x441.google.com with SMTP id d188so5611859pfd.2
 for <linux-amlogic@lists.infradead.org>; Mon, 24 Aug 2020 14:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1Eh+uteV+YXh6NW/wHYILgWtTw3Qzt2lgpjXRMh+Xeo=;
 b=T+B1E+RzFIKGI57nelsravKdx4Mtf63eoq9LsPevTghYZdAGqDYmp3jskAGbm0ZaVJ
 EQt8htALeD4NUAmQzvo3L9jPRDgw50pv+BcjwJBiAWIiWC4587o0t7YuB/o3B7SIUp96
 9DVJBOzmOiMb3QNU0noVQwCLfVzggFh0rdpLH/vQqbcBzfWEGaFmFgJ9BuGg+TVYH1WE
 H0mn+8GVMs7zUdlooQFkFPyY6aqkFxRkmxVVuP5Tt+dOBoRkft75lgk6QiLjaVF/zKh+
 duluH7bVV8CbSXU4GvigxzgtueuJKebwaYo08poXD8RNf2PlgTBmsPMGOfCMm66+ALfT
 JSoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1Eh+uteV+YXh6NW/wHYILgWtTw3Qzt2lgpjXRMh+Xeo=;
 b=cB/O48r2eaIWz07f4uIkHSGeIPMHzGA4WWyQs/pYTVG/itY2t/pQWJjMcsaMS7QMIU
 A75obVLKlxa0wXhEAtUQhQuI5/k/m5AQUa6X30BGfLjs6JO0kN+ytSqpUkRbXsKU42Ld
 aEcLFb8hqlQ0dSKcFN8ccNXa8e7Gx5Wm4S1rSLiC0r2Ilf1EJt6o+s121oDkOsId7zCk
 Lr/xPtxdQ2XffF2agbBrXBquJ8tBAJbJlF/kxNxIUEKeNe8ifOexKKCCz0gyMUSDe4GW
 tmV5gneLm98hkvqjBmcSukQS9YPAD7Uf3cOe6prmpJP04bjEtQVcqMH+FBTLyA270FCS
 0F7w==
X-Gm-Message-State: AOAM531sMsaAYSREaT/LnwuFlXQ7x32D+U7JB7g1wENAF9CMMYYlyCEr
 i697duHxqrEvT4ptxrVjxiBeT2mYteL0gqyp
X-Google-Smtp-Source: ABdhPJyPIu59TnqA/Q176FZebD9qoE8LwiQZH4RaV5fgeJVYf4RHk+iFZ3XGpFhrzUlEcvxYuZ7fHw==
X-Received: by 2002:aa7:84d1:: with SMTP id x17mr5270460pfn.87.1598303808314; 
 Mon, 24 Aug 2020 14:16:48 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id m12sm401728pjd.35.2020.08.24.14.16.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 14:16:47 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: linux-amlogic@lists.infradead.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH] ARM: dts: meson: move the L2 cache-controller inside the
 SoC node
Date: Mon, 24 Aug 2020 14:16:46 -0700
Message-Id: <159830380185.24712.168426396989939347.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200815182223.408965-1-martin.blumenstingl@googlemail.com>
References: <20200815182223.408965-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200824_171651_043123_7F03C4C1 
X-CRM114-Status: UNSURE (   9.31  )
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
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sat, 15 Aug 2020 20:22:23 +0200, Martin Blumenstingl wrote:
> All IO mapped SoC peripherals should be within the "soc" node. Move the
> L2 cache-controller there as well since it's the only one not following
> this pattern.

Applied, thanks!

[1/1] ARM: dts: meson: move the L2 cache-controller inside the SoC node
      commit: 8bcbcdb7293cc24eb7b24b67ef2b29b3a45a49e0

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
