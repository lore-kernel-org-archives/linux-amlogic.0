Return-Path: <SRS0=/5FS=RH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61502C4360F
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Mar 2019 10:58:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 327FE206B8
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Mar 2019 10:58:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="o5hvx/IY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="gi58neNL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 327FE206B8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nmYFhtrQuhe9dtHeKbEAC4byAthe0EHXW6gUZwa3pa4=; b=o5hvx/IY22+G5d
	ixaUegOGjv6YBhRHq5J1fehMWSTMzEKL5DYI+mpNW0ugCOKBFcnRjIg9V9o9Piy17j8Of8kfD5Kfj
	KYsNrAoPKF2MAZwA9rISQ7VNzIs5j2aMb/2mXAvLgLNP/NRXeTsN9QET/DJjlMUh3wQNbWhCd8v7V
	DjOgavNCQa9g1ywOINK1Yyn5nSp9fL92RdnWoxoV5lr2g/ELoPIOrxiZ7vdRl2L3mKHf0IKPdLUgR
	TIjG+vCtJjIQPhTY+O6sjBGVtHn3KQqWfyimQ6d33t9xCKM+yU/wsNWbIL2XIyxDyXZlabertSqNe
	JPlo5ecmUVvv2FoB9OxA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h0lIP-0006EF-53; Mon, 04 Mar 2019 10:58:09 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h0lIM-0006DW-CG
 for linux-amlogic@lists.infradead.org; Mon, 04 Mar 2019 10:58:08 +0000
Received: by mail-wr1-x444.google.com with SMTP id r5so5007966wrg.9
 for <linux-amlogic@lists.infradead.org>; Mon, 04 Mar 2019 02:58:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+NgtwWtuC29F27eufSWdAd18iEdNfLM9/qUuy/ZRY+Q=;
 b=gi58neNLjfxzF9XN+uzR4rq2lPrTk2SI5aE8CnL2oHd2yYAKhYxyAN/+fDNAwoNBt4
 6Rm5JX1eGhyrMa16km98QA3koKGeB86cVPVsVYrifXheCck9lOkIdwOKIq0eY4T6qfpQ
 NNBmgozURb86hM9myyU17vwAzsXAtPNM8/VrB9aTSuPhOZYo3PtdGWAfTyPBsrwhxobv
 7fbXGNnLj0weAuOM+ojln3QPWB0Y1K/fg7yUTow9+Vki1eoq0z2iNjThep5xVdYSkWYg
 no9l3W/52e9oSnUAgVldCYwpYZqa699mGZasVLezlj95iOLnXKeTKAoKyHDqTf4SDi1z
 60oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+NgtwWtuC29F27eufSWdAd18iEdNfLM9/qUuy/ZRY+Q=;
 b=lor6+XcNhXklZIpUQLTf/jBxbT/I8RClQa85HE1G1Gg/Vl/G/EVL13XoI8+QdHcDE7
 3TJsSeyu3mTiNIzpzVflXaxI1bm0AUh4dI8FP051zf3F9xxscnqw7gZ0dDm9qoxvckEF
 JXUR5zyYtdWuiI8KC3tsdlCFMZfePZPeZ+avYMQNPSmeJxLJpV7jupJAuVttRoRyesDC
 PPMCwOe5CiYBC6tA4rUhC6uSDjuVOVTXJCHa//+yNo2QP9lRQyeqtAGu9ZUoQI1yUHYg
 gv+TEXqRsydtyH3E1QVqAcLa10099z5u8luVyEdcMOSxS+LsSTM85vk8ihJovjRQpJjR
 87eQ==
X-Gm-Message-State: APjAAAU4+5sKo/ItsIRycCLAhT6yiyXMTDcvDlvzsWtv7j0wYYF4xL3A
 iCQ48ySrZazuN3KhNXovR7rQ7g==
X-Google-Smtp-Source: APXvYqyIcdlK+lbLVNxV+ui8IL2XFxXNxLlfDqWCiJA4vYjfpaXkaVv13IkojX1pngcBKDpC63P1xw==
X-Received: by 2002:adf:9e47:: with SMTP id v7mr12658314wre.190.1551697084774; 
 Mon, 04 Mar 2019 02:58:04 -0800 (PST)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id w4sm8038165wrk.85.2019.03.04.02.58.04
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 04 Mar 2019 02:58:04 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: daniel@ffwll.ch
Subject: [PATCH v3] dt-bindings: gpu: add bindings for the ARM Mali Bifrost GPU
Date: Mon,  4 Mar 2019 11:58:02 +0100
Message-Id: <20190304105802.6010-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190304_025806_418073_9374A239 
X-CRM114-Status: GOOD (  12.67  )
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the bindings for the Bifrost family of ARM Mali GPUs.

The Bifrost GPU architecture is similar to the Midgard family,
but with a different Shader Core & Execution Engine structures.

Bindings are based on the Midgard family bindings, but the inner
architectural changes makes it a separate family needing separate
bindings.

The Bifrost GPUs are present in a number of recent SoCs, like the
Amlogic G12A Family, and many other vendors.
The Amlogic vendor specific compatible is added to handle the
specific IP integration differences and dependencies.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../bindings/gpu/arm,mali-bifrost.txt         | 90 +++++++++++++++++++
 1 file changed, 90 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpu/arm,mali-bifrost.txt

Changes since v2:
- moved to a single compatible since HW is fully discoverable

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.txt b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.txt
new file mode 100644
index 000000000000..e068fccf4ce9
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.txt
@@ -0,0 +1,90 @@
+ARM Mali Bifrost GPU
+====================
+
+Required properties:
+
+- compatible :
+  * Must contain one the following:
+    + "arm,mali-bifrost"
+  * which must be preceded by one of the following vendor specifics:
+    + "amlogic,meson-g12a-mali"
+
+- reg : Physical base address of the device and length of the register area.
+
+- interrupts : Contains the three IRQ lines required by Mali Bifrost devices.
+
+- interrupt-names : Contains the names of IRQ resources in the order they were
+  provided in the interrupts property. Must contain: "job", "mmu", "gpu".
+
+Optional properties:
+
+- clocks : Phandle to clock for the Mali Bifrost device.
+
+- mali-supply : Phandle to regulator for the Mali device. Refer to
+  Documentation/devicetree/bindings/regulator/regulator.txt for details.
+
+- operating-points-v2 : Refer to Documentation/devicetree/bindings/opp/opp.txt
+  for details.
+
+- resets : Phandle of the GPU reset line.
+
+Vendor-specific bindings
+------------------------
+
+The Mali GPU is integrated very differently from one SoC to
+another. In order to accomodate those differences, you have the option
+to specify one more vendor-specific compatible, among:
+
+- "amlogic,meson-g12a-mali"
+  Required properties:
+  - resets : Should contain phandles of :
+    + GPU reset line
+    + GPU APB glue reset line
+
+Example for a Mali-G31:
+
+gpu@ffa30000 {
+	compatible = "amlogic,meson-g12a-mali", "arm,mali-bifrost";
+	reg = <0xffe40000 0x10000>;
+	interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH>;
+	interrupt-names = "job", "mmu", "gpu";
+	clocks = <&clk CLKID_MALI>;
+	mali-supply = <&vdd_gpu>;
+	operating-points-v2 = <&gpu_opp_table>;
+	resets = <&reset RESET_DVALIN_CAPB3>, <&reset RESET_DVALIN>;
+};
+
+gpu_opp_table: opp_table0 {
+	compatible = "operating-points-v2";
+
+	opp@533000000 {
+		opp-hz = /bits/ 64 <533000000>;
+		opp-microvolt = <1250000>;
+	};
+	opp@450000000 {
+		opp-hz = /bits/ 64 <450000000>;
+		opp-microvolt = <1150000>;
+	};
+	opp@400000000 {
+		opp-hz = /bits/ 64 <400000000>;
+		opp-microvolt = <1125000>;
+	};
+	opp@350000000 {
+		opp-hz = /bits/ 64 <350000000>;
+		opp-microvolt = <1075000>;
+	};
+	opp@266000000 {
+		opp-hz = /bits/ 64 <266000000>;
+		opp-microvolt = <1025000>;
+	};
+	opp@160000000 {
+		opp-hz = /bits/ 64 <160000000>;
+		opp-microvolt = <925000>;
+	};
+	opp@100000000 {
+		opp-hz = /bits/ 64 <100000000>;
+		opp-microvolt = <912500>;
+	};
+};
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
