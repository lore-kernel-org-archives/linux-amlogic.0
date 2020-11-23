Return-Path: <SRS0=nSpp=E5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4A2CC2D0E4
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Nov 2020 16:38:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDBB820717
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Nov 2020 16:38:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wZ2pfTFc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="SxLSwWWi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CDBB820717
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=A5scXzfHiMDODY/Onb1rd3W8GhcUThIhRsx2Mi55pp8=; b=wZ2pfTFcKXeOzVRr8HH2ov2mek
	4c4qSAttmZRNHUNxr81jQdTu0pOlFEh+O7Z0+j4C1Hfsy1Cfis3IzPTkiWN5XP6odqNymUhN0hYDF
	CfeFzYQutvici4AnHK7c3VKVJs0tgDLxE5+y7joXuU1QxHfR4oVJs1ZjhthMUCnXUDplWOOBPycn5
	uj/9LPXkDgocR93L9aJqXXb9aMSboRJA6cDbKL4OCkBdnvI062Q3Eu0QQJdZyPIIQpmGwWkZeFB2j
	pCzwrQ4UObBvQfyV95nfg5P4YA1pJKJTzBYh05xA9dddgjF6nGM5SaBQs6//QOZ2Pz7OFmXuCmW8b
	nMGM/vRw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khEr6-0008Vy-1q; Mon, 23 Nov 2020 16:38:20 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khEr3-0008UM-1Z
 for linux-amlogic@lists.infradead.org; Mon, 23 Nov 2020 16:38:18 +0000
Received: by mail-wr1-x441.google.com with SMTP id z7so3408112wrn.3
 for <linux-amlogic@lists.infradead.org>; Mon, 23 Nov 2020 08:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nWoVY3ymzk4cWTn4v1bXh+Sdx2khkGvdmAYTQ5FaBbQ=;
 b=SxLSwWWikSEHrkcswd89DLnmpGU0XvkZ4As0oJ6nDX4yXVtzmohXimFSlhYvIZx6eT
 DdkRfxY0QSpesU+aedtenhi7zp7OZlNYlrxVYvEEnonOqfwBtgUwHvdWvDZu5yJ6lJYU
 5OcKgqup/6Ci+DmbTdcO8VnzLF5zRy9Onrn48R7O0/jNBpQzpEidn2KTdwvnxOlIuo4R
 aLG89aQtiKToEimH91cAjypIMKgHZnREw7OESaJJUkjVKWgt07nVybKpRu2tZ9RPAqbv
 QgczmFlfg/AFkryP0aQJk5FgggPsQveYH6uzZkTkt6Kq0+1P1oYMd99nImv7gBdZUlFx
 8PsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nWoVY3ymzk4cWTn4v1bXh+Sdx2khkGvdmAYTQ5FaBbQ=;
 b=YpdnoUIulicJzJeoBEbgnmr4WTF+4L+lYhdFR1Y1B7OSUng4de3aQBnAgbABJKSUFa
 ApfF8kZ5ps6HFOEOPLmKta/ssiJBLtijR9Eg/giBQ/GTmATBz1UaV+0yGKUdOIxvtHMU
 yBRUShPFJzDhnfx84r1kUDFy/NsiOIsNe+veErZzHvWz9U+5wYTWCTsDKCXSLRrjxKVl
 Oz41wityuM2+6NSPNPZ2ycJijMLiDMP7GmJFlDXDMNPn8ZO8m8/lFhr1HkT8u46helyl
 WABm7kjRIN2wlWJyBIvpg0E2MNHQ09DiU69VNSp+idQOHDTxLRT2PKYCOVQP01uLXtSR
 LN0A==
X-Gm-Message-State: AOAM531kmv7LH5dmnutw1MuXJe545L0JQFRg/PjcLU7mYNzIu1v+IfCw
 Ckv/dlwadTZty6tm1BdZDpUHMQ==
X-Google-Smtp-Source: ABdhPJwPUVxyobNEfXOdvktyz0fszKkrJa0DxbBhWMphOi5LtCs4uDIpZ6d6t6TRxess5meOoBwYOw==
X-Received: by 2002:adf:c147:: with SMTP id w7mr611048wre.60.1606149495821;
 Mon, 23 Nov 2020 08:38:15 -0800 (PST)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:9541:d2fd:3a68:67ae])
 by smtp.gmail.com with ESMTPSA id l3sm19566386wmf.0.2020.11.23.08.38.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 08:38:15 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: jbrunet@baylibre.com
Subject: [PATCH 0/2] clk: meson: g12a: add MIPI DSI Host Pixel Clock
Date: Mon, 23 Nov 2020 17:38:09 +0100
Message-Id: <20201123163811.353444-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201123_113817_170731_440B32F3 
X-CRM114-Status: UNSURE (   9.25  )
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

Neil Armstrong (2):
  dt-bindings: clk: g12a-clkc: add DSI Pixel clock bindings
  clk: meson: g12a: add MIPI DSI Host Pixel Clock

 drivers/clk/meson/g12a.c              | 72 +++++++++++++++++++++++++++
 drivers/clk/meson/g12a.h              |  3 +-
 include/dt-bindings/clock/g12a-clkc.h |  2 +
 3 files changed, 76 insertions(+), 1 deletion(-)

-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
