Return-Path: <SRS0=dEj7=FA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 312B9C56202
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Nov 2020 14:16:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33F3D2053B
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Nov 2020 14:16:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SjT6Le+q";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="TYk/4RpV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 33F3D2053B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TOvdBbViA6dL38HJfiAxuROOnSHsB9GBFyZfdG7fUnA=; b=SjT6Le+q4XaZz8ljebtqC3p2bz
	3fxCDGE6deahlMhzbZjXjzwCSCArUDHAmGuIcKeGjCttNQR3FwcXUja5rXc4wIPaJWyPGrCpgIy4P
	fAM/oUYhyQoNjb3fYKmRd/v24GdI190AEhvzoZsl1qvOchp0eSUi+m5RD115T/e9vBn5rLsDgzYHv
	c+6tHyB/uGd02Vi2OsWYOPZOCCHHjW/CVsJE30RREprQLb0qHn7ITbWMHm+SqWfSVbqCnEtfPssHS
	ZstNX8fY+9NEiZjc2DzSqtBKvXikgx44bo9FdQubeBMNDSWA25DrZxIte5K5+xDGysF4oe1C5NFVt
	f9t+/Lhw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiI48-0000l0-5t; Thu, 26 Nov 2020 14:16:08 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiI45-0000jY-RN
 for linux-amlogic@lists.infradead.org; Thu, 26 Nov 2020 14:16:06 +0000
Received: by mail-wr1-x443.google.com with SMTP id m6so2294237wrg.7
 for <linux-amlogic@lists.infradead.org>; Thu, 26 Nov 2020 06:16:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JVJYFI/qIjUZ3Hi9AztV74PIORKWvfJtU5CTcwVwdKc=;
 b=TYk/4RpVJoVTqhuw7oP/HPv29AnhUOauwXQfwW9KAmBlmXL/z+Sv0AHWeiHg6PmpWn
 hXwRS8OuLjZOSk5KI7zB+D/iQP3MXAIDV9kfz2mAKilN17pecwT4RLhTS7KSTfF0lbUQ
 7UfOMUgJUiGxINLSR+4/903rpd2NTBe9oIMLwX2Gq0iF9kFkg0Rhomoz1/cb02DihvF/
 TyiM5aBLe8qS8PToF2N2b+7PKkLCgaM2k6EcppFSDdDCdNjSXK6E3EQZgCyovrRHq2Xp
 vgpAx6mUm0SzeUM//Fi79HMteNCYgc0d2upaqeyzv/KTRAzJVgPibCsz/7uCF16PUy65
 PyyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JVJYFI/qIjUZ3Hi9AztV74PIORKWvfJtU5CTcwVwdKc=;
 b=QElwjrJ1GLrAhCqmTV6Mw3CZWLvy4o1LbGcDzTxnhsihg6pi0GDFzC4KM4pDGaPgDo
 1/tdSE6pPN0SyCrPIP2zJ6001S3zItv2eE3LLspBRvsjzLzNw2bP0Z+1j/06gC1IxaIj
 0RMxRNGxtTs1gmplEI0EcGL8zdem64oxdYLiO6o12H5cQ1YmuXnEUfjJsW7yKwFzmliA
 hJ/eTMVuIhwk9djBzvGGgjSQgrAncDanVjCxFjRTPB6gyGu/gD1qlr0/cog983LbC8RE
 mBxXGbN9gce+fvFylnJYdDRFkkUpAqSYFGF8qvIsgC4LPjYFIs9nUZYCBHGLT4fKridX
 SM0g==
X-Gm-Message-State: AOAM5320rxEA2ICAAJQF1edv7HVWn59uTrKI8tQDCWvKy43mfEgFXcUL
 /0p6lnKOhJSTCXiREHOu9KIkcg==
X-Google-Smtp-Source: ABdhPJyRT6DX4EfACs62HmCZ6SUs/HD49LkOIYjL7/qZ73YQ1Dl2aX3Sej/xfNYP/78CKkUhszgHxw==
X-Received: by 2002:adf:f44c:: with SMTP id f12mr4207625wrp.155.1606400164752; 
 Thu, 26 Nov 2020 06:16:04 -0800 (PST)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:193b:ad82:52ad:936c])
 by smtp.gmail.com with ESMTPSA id q16sm9286079wrn.13.2020.11.26.06.16.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2020 06:16:03 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: jbrunet@baylibre.com
Subject: [PATCH v2 0/2] clk: meson: g12a: add MIPI DSI Host Pixel Clock
Date: Thu, 26 Nov 2020 15:15:58 +0100
Message-Id: <20201126141600.2084586-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201126_091605_931224_AAFC42B2 
X-CRM114-Status: GOOD (  10.28  )
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
Cc: linux-amlogic@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This serie adss the MIPI DSI Host Pixel Clock used to feed the DSI pixel
clock to the DSI Host controller.

Unlike the AXG SoC, the DSI Pixel Clock has a supplementary mux, divider and gate
stage before feeding the pixel clock to the MIPI DSI Host controller.

Changes since v1 at [1]:
- switch g12a_mipi_dsi_pxclk_sel flags to CLK_SET_RATE_NO_REPARENT
- fix aligment of g12a_mipi_dsi_pxclk_div & g12a_mipi_dsi_pxclk parent_hws

[1] https://lore.kernel.org/r/20201123163811.353444-1-narmstrong@baylibre.com

Neil Armstrong (2):
  dt-bindings: clk: g12a-clkc: add DSI Pixel clock bindings
  clk: meson: g12a: add MIPI DSI Host Pixel Clock

 drivers/clk/meson/g12a.c              | 74 +++++++++++++++++++++++++++
 drivers/clk/meson/g12a.h              |  3 +-
 include/dt-bindings/clock/g12a-clkc.h |  2 +
 3 files changed, 78 insertions(+), 1 deletion(-)

-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
