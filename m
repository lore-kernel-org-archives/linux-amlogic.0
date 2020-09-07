Return-Path: <SRS0=IdmP=CQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D757C433E2
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Sep 2020 07:34:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ACB7D207C3
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Sep 2020 07:34:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="r/Hay6EN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="CqUz0UAu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ACB7D207C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jpXxWCEOxJC6P0o35R3djgcdWyeEt3BvCQc0gNchIUU=; b=r/Hay6ENMP//MdwGo7NgUB9g4z
	rqsKq1B6OU0AKmKAG/kyduVWH/yx8f8SQIgVh7P+DCy9eM+UE7865QvpsbaLrbeyt5kaK+z1eG+oU
	sXpN0eNExwFv17HQ/yOpPsu9QPivHcrxASMgZNL9KtyCeZmQfLZXvwospUtGlJzeXV3J02KP0vhp6
	wudARl/fSNORQsY0F9V/KXXoNbCUXJ7UE6ikXkz5mS5CvcIpLZJvkKE69DGb262/fCU4dwSZEEO43
	CbYlm/Tzjes1WvQy8i+Y2y1PIT8vsME6+IDP4fbXpjbyOW225w1JGR/rDfWn58EdDsqPI7PbyYhcX
	eaDHcLKw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFBfK-000110-NJ; Mon, 07 Sep 2020 07:34:14 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFBfF-0000x2-1z
 for linux-amlogic@lists.infradead.org; Mon, 07 Sep 2020 07:34:10 +0000
Received: by mail-wm1-x342.google.com with SMTP id a9so13170430wmm.2
 for <linux-amlogic@lists.infradead.org>; Mon, 07 Sep 2020 00:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vj8HWAVrpRy1isn5QaCtQMf3ecM7tJijiOroIqActls=;
 b=CqUz0UAulnbLvDtdUuMuICb27QDT1ayBqFVQ1Ox81QjldlBZor+TMFwG//o8suMq2n
 DeEaw5b2NzdC7u/6Ov8ttU74GGIsmbQxWiY2DRpUuqhqG06UDrQXzMPm7P/pEdlihdTa
 3bC3JcDbhlLxaSugwyG0roFO4Y3srOE76AJhmaVUlasEqIfxsV5czWVf8nVwcBO6mcze
 B3cGRKIHIj8jE51IQigYWg1nfJX7U9APLy6TDcTH1uHQR2YG5cutuixwBH/KItRD4NMQ
 6c+uQpGibnl2Pyi+3CHIkk3b6MTHa87t1Yha1bLvCweDhmjYpQ/XLMaNQPaSiEfdahBm
 qv7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vj8HWAVrpRy1isn5QaCtQMf3ecM7tJijiOroIqActls=;
 b=VOmZR5NINcM16nOs/BUdZFpYbGBIVcivbfNBx1ScyVx2rBYqwvGr8xy47Ea59HiXMc
 IAMRRb5veGwlDQKP5Si3gSx0+jcQDT+iCZPT1JD5CEhJEMoChhirTonLhBZqwObI16AG
 tF5t2M/1rR6moGP4yh6UT88OZmbstZUGrwKtVtlCaLF6HhTA874vKzzj+tAWq7pZN9At
 vazijUReCVcVqCJB0h6yRDxodKpmFSTNaA8XffP7GHJl2x4VMDCQWZol/rY+XTYo9q3Z
 t5xn1bh1Yxr8/tufeR/SngV6VfrBxoUD6XlN/VOO2iEG3b6qaWsp6QuelnMXnwjoX+3n
 P1pw==
X-Gm-Message-State: AOAM532LVCE6uhxre7eDwIMN6cUQYdRnWhA7AofVAbUiCAaME3xhwCw9
 o2gMN9g8cB3mDYeKZP110hN0ew==
X-Google-Smtp-Source: ABdhPJxP+CeEp26KlgvP1XIailxIhFzY+zlCYZbvdzjmkb3Q5Bd+qcAFR0fyT5HL9Fx9W/57dqcD4w==
X-Received: by 2002:a1c:bbd7:: with SMTP id
 l206mr20503113wmf.185.1599464047762; 
 Mon, 07 Sep 2020 00:34:07 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5405:9623:e2f1:b2ac])
 by smtp.gmail.com with ESMTPSA id u66sm527689wme.1.2020.09.07.00.34.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2020 00:34:07 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: kishon@ti.com,
	repk@triplefau.lt
Subject: [PATCH 0/3] phy: amlogic: add MIPI DSI function to analog MIPI+PCIe
 PHY
Date: Mon,  7 Sep 2020 09:33:59 +0200
Message-Id: <20200907073402.26674-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200907_033409_134196_8F7152EF 
X-CRM114-Status: UNSURE (   9.07  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The AXG Analog MIPI-DSI PHY also provides functions to the PCIe PHY,
thus we need to have inclusive support for both interfaces at runtime.

This fixes the regmap get from parent node, removes cell param
to select a mode and implement runtime configuration & power on/off
for both functions since they are not exclusive.

Neil Armstrong (3):
  dt-bindings: phy: amlogic,meson-axg-mipi-pcie-analog: remove reg
    attribute
  dt-bindings: phy: amlogic,meson-axg-mipi-pcie-analog: remove phy cell
    parameter
  phy: amlogic: phy-meson-axg-mipi-pcie-analog: add support for MIPI DSI
    analog

 .../amlogic,meson-axg-mipi-pcie-analog.yaml   |   8 +-
 drivers/phy/amlogic/Kconfig                   |   1 +
 .../amlogic/phy-meson-axg-mipi-pcie-analog.c  | 204 ++++++++++++------
 3 files changed, 138 insertions(+), 75 deletions(-)

-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
