Return-Path: <SRS0=+PkE=XA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 991F6C3A5AA
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Sep 2019 13:00:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DDE7321D6C
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Sep 2019 13:00:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oOzY5qEu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="h/8tLCzM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DDE7321D6C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lInDHXJ5NWT37ZPu7a60qffaCXt8PWz2MRv+5YFr/7M=; b=oOzY5qEuQIuXph
	QPdrZcnuJjW/zcra1S5UosRClr54hzkrat6pE1YqjG/v8DQKypvJV/WmhrumD0Z5TLBolSIk4zC17
	gLHIgGa/p2o63NHu7w5w0xEgxdB+crlq7ZNY4xqYKEnCo7691J+3jMby2AjxBIqFzI0dibpK0aj3s
	yXVPulcFGF3eAft+SSCmOp9F87VK7jqjeXA4+ujQajeJ9NFq4y3ElYJZjHwKrTd6VBuBWzLToEwuD
	ipH8ztKq4EwjpVr2PQebVnFJIAdD0b8e0H1+ehHodrHUCBltMS80oHYxZ1PCfaVnUFJHu9RRWEKzf
	MeGf4YcWQVL4x7zkUulA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i5rMw-0006Va-2m; Thu, 05 Sep 2019 13:00:10 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i5rMr-0005p6-Of
 for linux-amlogic@lists.infradead.org; Thu, 05 Sep 2019 13:00:07 +0000
Received: by mail-wm1-x341.google.com with SMTP id c10so2709195wmc.0
 for <linux-amlogic@lists.infradead.org>; Thu, 05 Sep 2019 06:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9o518Q9M+VA62cCsQMBXOXpf3ntmSugaTgtOZlotIoo=;
 b=h/8tLCzMrNIiSCKb1hq3bANqq0O7NXfwEbtD1KjJQJdIo9X0zm4Sg6VlbVIyFJa22D
 fzT9tMGKti05cgQ7H5y55cnhLBYmX1S6TUg3vFz7rEoF8Gqmyfy/9JM5lYKBYHNkeTHb
 uMznWW0jHU57LOQa9ej99KKjg/geC2wnY8xK4m/1czGaQlWrzt5H4bDJzFfpXz/sXqF3
 o7MKD0cGl24WBul/wImWbW2Vrb0tnQeJTwwZziBEeyzu2C1ttCJRsS0fH+F3bUFgMUFd
 NSrIRGELQk+/+zzLzSuQGkzCmQrV2T2Sdx08DtmDLkGGgBeU3X9BoAo5X12pB+hwIEBw
 4ZYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9o518Q9M+VA62cCsQMBXOXpf3ntmSugaTgtOZlotIoo=;
 b=dxTIGa7aJxDO+gVR83nEG8h12cfzhI/4tG0msL/YAEPfE7ahkidhen2FCadA8EW6vR
 ZEhx6pPKrGz/4gaWEYlnWbTHXHsuFBtB08cuqDBXUBdKDtr8BuDbPuWgFd6fXU1IreNx
 uLX8fznRAFtMadbveme7EO/glvSGrSa5Os919o0iVAxHspv6gy6D2Gvu3vzIkRPCb4BL
 iFgy7m00n1NI68IiLo1U56LJcB1wmdgtiOiEbeclg83iQaXCjBCcsxPa/ky5x7u5Ss7v
 Zu15/mGpOE97s1cAKiF/w+5pvU5Ci8jaLlN6yjdQgIwDVohWsyBniwxekH2xiKn6GwLl
 /zKQ==
X-Gm-Message-State: APjAAAXh8aS00zuyHfLJB7tiFvEconnKYePfMcJfFeGRRIKAnphc4OKi
 4YdwC3V9vuFZSqwiAz062A9DoQ==
X-Google-Smtp-Source: APXvYqwTs4hlT/F1FYODJLFlYoxd4c+WS6plu/pzJAf6EYVvYB882hNz9pcfxd/K5ReyoWJJ4fwRQw==
X-Received: by 2002:a1c:c911:: with SMTP id f17mr2880993wmb.73.1567688404367; 
 Thu, 05 Sep 2019 06:00:04 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id z189sm3727903wmc.25.2019.09.05.06.00.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2019 06:00:03 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 1/5] arm64: dts: meson: axg: fix audio fifo reg size
Date: Thu,  5 Sep 2019 14:59:52 +0200
Message-Id: <20190905125956.4384-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190905125956.4384-1-jbrunet@baylibre.com>
References: <20190905125956.4384-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190905_060005_806917_B7C5C97B 
X-CRM114-Status: UNSURE (   7.57  )
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
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The register region size initially is too small to access all
the fifo registers.

Fixes: f2b8f6a93357 ("arm64: dts: meson-axg: add audio fifos")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index 82919b106010..bb4a2acb9970 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -1162,7 +1162,7 @@
 
 			toddr_a: audio-controller@100 {
 				compatible = "amlogic,axg-toddr";
-				reg = <0x0 0x100 0x0 0x1c>;
+				reg = <0x0 0x100 0x0 0x2c>;
 				#sound-dai-cells = <0>;
 				sound-name-prefix = "TODDR_A";
 				interrupts = <GIC_SPI 84 IRQ_TYPE_EDGE_RISING>;
@@ -1173,7 +1173,7 @@
 
 			toddr_b: audio-controller@140 {
 				compatible = "amlogic,axg-toddr";
-				reg = <0x0 0x140 0x0 0x1c>;
+				reg = <0x0 0x140 0x0 0x2c>;
 				#sound-dai-cells = <0>;
 				sound-name-prefix = "TODDR_B";
 				interrupts = <GIC_SPI 85 IRQ_TYPE_EDGE_RISING>;
@@ -1184,7 +1184,7 @@
 
 			toddr_c: audio-controller@180 {
 				compatible = "amlogic,axg-toddr";
-				reg = <0x0 0x180 0x0 0x1c>;
+				reg = <0x0 0x180 0x0 0x2c>;
 				#sound-dai-cells = <0>;
 				sound-name-prefix = "TODDR_C";
 				interrupts = <GIC_SPI 86 IRQ_TYPE_EDGE_RISING>;
@@ -1195,7 +1195,7 @@
 
 			frddr_a: audio-controller@1c0 {
 				compatible = "amlogic,axg-frddr";
-				reg = <0x0 0x1c0 0x0 0x1c>;
+				reg = <0x0 0x1c0 0x0 0x2c>;
 				#sound-dai-cells = <0>;
 				sound-name-prefix = "FRDDR_A";
 				interrupts = <GIC_SPI 88 IRQ_TYPE_EDGE_RISING>;
@@ -1206,7 +1206,7 @@
 
 			frddr_b: audio-controller@200 {
 				compatible = "amlogic,axg-frddr";
-				reg = <0x0 0x200 0x0 0x1c>;
+				reg = <0x0 0x200 0x0 0x2c>;
 				#sound-dai-cells = <0>;
 				sound-name-prefix = "FRDDR_B";
 				interrupts = <GIC_SPI 89 IRQ_TYPE_EDGE_RISING>;
@@ -1217,7 +1217,7 @@
 
 			frddr_c: audio-controller@240 {
 				compatible = "amlogic,axg-frddr";
-				reg = <0x0 0x240 0x0 0x1c>;
+				reg = <0x0 0x240 0x0 0x2c>;
 				#sound-dai-cells = <0>;
 				sound-name-prefix = "FRDDR_C";
 				interrupts = <GIC_SPI 90 IRQ_TYPE_EDGE_RISING>;
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
