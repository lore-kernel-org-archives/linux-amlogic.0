Return-Path: <SRS0=Nbbq=RK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FA8FC43381
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 Mar 2019 15:14:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EBEE20840
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 Mar 2019 15:14:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sWAJSwo9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="WrfwCJ8B"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3EBEE20840
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wwzo6ijMqqRhAmPAm+AqK3FYFxjnIuezkyE8Du3cPmY=; b=sWAJSwo9TdCU/P
	Qtbzq2DknSzZfERPSx/pCMMl2/nVhe2162xWyGZ+UleESzEHviQ7G6FSpZHtpB60658kp+Aee1eLn
	whrINB9MD6wLcMQvZwqMXuiQZw3iIammoKfnPqWrx+hBCx8ENqAOkn1B/oaDak4NLXIFyawzYLRAG
	7UvVNDr+hw37NGylzYkiqkAz7e7uWGReFHMwr0nziXe4jACtdxs2fMDRGZCkoRAUi7sDwBd+/Q+CE
	+6IEQzNFpcjnCXKPKqA1ZO8KC3KR+YKwLwxZ2L7ZAGUNCWA8aVAVj46DYro5vZmLuhDaKhTu9Hzff
	idAJJzq3SvQojwrYVQHA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h1uid-0003gf-Lf; Thu, 07 Mar 2019 15:13:59 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h1uiQ-0003Pq-77
 for linux-amlogic@lists.infradead.org; Thu, 07 Mar 2019 15:13:49 +0000
Received: by mail-wr1-x442.google.com with SMTP id o17so17870033wrw.3
 for <linux-amlogic@lists.infradead.org>; Thu, 07 Mar 2019 07:13:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o5XEdwpDX11r9A87w3stM5IV0M/gayIT+SRuFG7e6Us=;
 b=WrfwCJ8BCOUDT7aZTmwMIPbmA8q1v4b54YOtZaezz78B504KuEY9DykUQddhdB5SQa
 /vWT2RT+GeLV/Hw2ugUzZw7aTWISgL2FbGcAVfsH1yVP6vztT3n60SQyX+LVfCJyTT/J
 jVRLfh8hu/MbFSAiLThJB0uE6a9Db+cPcbQR8v/k6Pl/5h1AyrUen/9y9NkLzNqdtLDO
 prjoBGxsL1v1QKRA5U+aVA0l/sAqklL89xYk06NKk16oL4CuQ8x6e8eowvp2VrAKp9Lo
 h2qnOaQO0op1p4tDE1Cyq/l5w77JW2eOsMxGJ2fXZYKsNncETHFMXDDbYqHQViqOBju2
 g+eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o5XEdwpDX11r9A87w3stM5IV0M/gayIT+SRuFG7e6Us=;
 b=BfSAgZeg1+tpsTRsAxTAdtly5DPcsfhzXvBrdSDiAvsgsO6QlOrtSvThA2iVXvGEZC
 +RJjnQTUIPj5k1gznUb5N9/4AcDwAJf95U5ytrI/rcsBxfzWJHhQoN3zfdZqtkuG1zTT
 64L1X4RRvB/hl4c5Dwbt4jDBCQdSDA6ibBY8nvfHnlNBZC8pVL3BEU4FLRBrZgv2naxD
 eUV51GnRjstSyRxUGXznJjFliqHdqdaHQLBfcIOAIs2QCRl98lFeYxsJ/15DCu1sst88
 TqLRk/2ryVGd3S+cBu5roloWT2JGyaQ/WPOdpFssI9UHQXh97IllHY4Xy29PKsUZoWwG
 0akg==
X-Gm-Message-State: APjAAAVRQ6f4vZV6Gd7Cx6jxk0dM+K6s2QHymskvj8Al3nGCl2cARvrn
 lTpX7LwPq8RlVJoMahbtVFO7MA==
X-Google-Smtp-Source: APXvYqy277dgVFlzsKDF/aVIaUHzXa37oZcGXrXImL0Oo6jVAMWbpKSACNU2iWMFTQLk9hQuiYWuYA==
X-Received: by 2002:adf:e3c9:: with SMTP id k9mr7018064wrm.291.1551971624762; 
 Thu, 07 Mar 2019 07:13:44 -0800 (PST)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id r15sm5756563wrt.37.2019.03.07.07.13.44
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 07 Mar 2019 07:13:44 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 1/9] arm64: dts: meson: g12a: Add AO Clock + Reset Controller
 support
Date: Thu,  7 Mar 2019 16:13:33 +0100
Message-Id: <20190307151342.7381-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190307151342.7381-1-narmstrong@baylibre.com>
References: <20190307151342.7381-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190307_071346_253020_C42C5BDB 
X-CRM114-Status: UNSURE (   9.45  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add nodes and properties for the AO Clocks and Resets.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
index 191d31db9853..0eb5220da82c 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -122,6 +122,23 @@
 			#size-cells = <2>;
 			ranges = <0x0 0x0 0x0 0xff800000 0x0 0x100000>;
 
+			rti: sys-ctrl@0 {
+				compatible = "amlogic,meson-gx-ao-sysctrl",
+					     "simple-mfd", "syscon";
+				reg = <0x0 0x0 0x0 0x1000>;
+				#address-cells = <2>;
+				#size-cells = <2>;
+				ranges = <0x0 0x0 0x0 0x0 0x0 0x1000>;
+
+				clkc_AO: clock-controller {
+					compatible = "amlogic,meson-g12a-aoclkc";
+					#clock-cells = <1>;
+					#reset-cells = <1>;
+					clocks = <&xtal>, <&clkc CLKID_CLK81>;
+					clock-names = "xtal", "mpeg-clk";
+				};
+			};
+
 			uart_AO: serial@3000 {
 				compatible = "amlogic,meson-gx-uart",
 					     "amlogic,meson-ao-uart";
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
