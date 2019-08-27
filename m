Return-Path: <SRS0=C9TS=WX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6954FC3A5A3
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Aug 2019 10:03:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EF51206BB
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Aug 2019 10:03:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jZgds9Z2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="OQfE/BrI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3EF51206BB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7o2txS32K6u4MOyQSo6BOJvhuA05pavOVbosgQvLXy0=; b=jZgds9Z2GyiCc0
	6dB/EgXk9ElEegrqC2GBoHGqhKd41y6sEJe7KyPKcGwNTomAkeYQulfCFjJ3f7Uht5B+j1WnNR736
	7i/HbcnxFEWouhuxKvl5MFLB0o25j9rl5OgDcnvcloeNOwH4IuYvhKbQEAKPujZIfy5UMEEeklDgU
	5cdnvPMIKJBD4FUdkzBKY9x6z4SpFiqaD/+0r8z6LQwRuNq6oBzcP2LPi9F8Q9SRtUSzGIsHc2wPu
	G5YUAt3gobLK9XEPUl3PfP9F+RjV7WBvX1QsTZir3DGEEnO4gEmDLq0yVV/35NQAsQuVTBk0EbiLd
	GEmJ02cETMOs9kWwICUg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i2YKC-0004tl-GF; Tue, 27 Aug 2019 10:03:40 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i2YJl-0004UH-LG
 for linux-amlogic@lists.infradead.org; Tue, 27 Aug 2019 10:03:15 +0000
Received: by mail-wr1-x442.google.com with SMTP id y8so18136330wrn.10
 for <linux-amlogic@lists.infradead.org>; Tue, 27 Aug 2019 03:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nFvBQ+ASUXIFlVmkozv/yv2UYrSxjvTzp86D19iRVSk=;
 b=OQfE/BrI+i52OcYL2jZ5opgZ0p8C159XYYM9sMXYdxUyYIUr4nHp7lAp2Uq+YzYw9R
 b1vNxfP8QjKQa0gI0xuAPADk1vdLA4HHznp91WI/dU353VlSQ/CFNaoINzl7neegNX17
 V6503t8RaAyLtaN2Xhm9izG7Jo6eRliH6scgAp4FmvrA0RApgWDDy9a/aMC4QYXGDwL1
 nFK3MoD2M+sgJU8Baq+FZnuHPoDT6xDLpJawv6HXxby0g2Yj/EAGsOu2L4MU3Lx3Mcrk
 fbF0Arms9OxgmGNeYI6RSJuJ9alDV5PX/v0mOeqw6R6e0DoLTUFEd4s05vzysrR00ZEH
 JYnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nFvBQ+ASUXIFlVmkozv/yv2UYrSxjvTzp86D19iRVSk=;
 b=CaSRPlTiEwBDajm7LgQmqrSxaEB1RjRrpMwR3VDZN+nSYfM/1mSwujs4V2wHs2ByEj
 /7C1yhbi/T/3InpwmkRAWmeHxCUi96i4GR9AT4rhuCmzq7PMu9eQV0eEZvFxzqvmZzEM
 SYDnvMwJmoOPkErnPtRYdr+GYqu66xWMwEotu7ayf842tQsQLURhv0W9nOayhuNPUmAV
 nQlbIc+lhRKdsgOPfOEXP2AGKcw2LtRtXX2XoLSS0xTzAm2fohgyiAzemXc9OoqXorlI
 G1WNbQ8pFPpZDdV9UFlmH/G8WR91GCl2R69XIjeT1NamMeOVUusWsdM8znOrD9dtAH9K
 51Xg==
X-Gm-Message-State: APjAAAURrRP64WKuxhK4OFO4CVNy9nYCPSkSAOu1FofE3yddh4S34l2R
 FB2MiBNLt8id3lesCBJxv6667m86mY37AQ==
X-Google-Smtp-Source: APXvYqyXg1CwX3b4xu5v1NJTgayfPDThhDxBvEtvylLfIoV3nJiJJMzI9qbPJJaPyUyDDamtHKAzAA==
X-Received: by 2002:adf:9484:: with SMTP id 4mr27109881wrr.14.1566900192197;
 Tue, 27 Aug 2019 03:03:12 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id o25sm1816289wmc.36.2019.08.27.03.03.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2019 03:03:11 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 2/3] arm64: dts: meson-sm1: specify suspend OPP
Date: Tue, 27 Aug 2019 12:03:06 +0200
Message-Id: <20190827100307.21661-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190827100307.21661-1-narmstrong@baylibre.com>
References: <20190827100307.21661-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190827_030313_960705_24E759AA 
X-CRM114-Status: UNSURE (   9.54  )
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

Tag the 1,2GHz OPP as suspend OPP to be set before going in suspend mode.

It has been reported that using various OPPs can lead to error or
resume with a different OPP from the ROM, thus use this safe OPP as
it is the default OPP used by the BL2 boot firmware.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-sm1.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
index e4830cbf7ed5..32e2de2614b1 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
@@ -82,6 +82,7 @@
 		opp-1200000000 {
 			opp-hz = /bits/ 64 <1200000000>;
 			opp-microvolt = <780000>;
+			opp-suspend;
 		};
 
 		opp-1404000000 {
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
