Return-Path: <SRS0=aM1E=EK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F442C4742C
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Nov 2020 13:56:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B29E921734
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Nov 2020 13:56:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eICSQmKf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="zbIBvdO1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B29E921734
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zjTPgASo6WSVWbuDGwVerz2ATbnCm9e1kpBEedwybTg=; b=eICSQmKfPjWjurlVSFE73DoEc
	iJ4xruvfRnsDIfN7NhSUN7C7gA/zd/KmMZZKe256cawYEioOxmEUKt0l6tt1nQH+RGYhlKeMHU/Ul
	+wa9LL63kh42BzUpmGBJk/rW09pFZrH1HmFnbIatZWpDQ5AYFntyFygYDith0CBhZJX3205BGQTzF
	hrXnbKO1kIGVaD5681CmbBeDd8h1DBGLI+ZbDRmnTczL2buGKuNZ4KehaWUylAwZyUXzhRPZsU0xk
	8Lnsd/uWIDhtNbHqloHTvUcliBahu8VUViC4OnqfbPYU728yfwn/7mWiawMIqRPWidz3cZ8NIdUR0
	en3DLvYfg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kaJHL-0007c1-Vc; Wed, 04 Nov 2020 13:56:48 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaJHB-0007Xd-HP
 for linux-amlogic@lists.infradead.org; Wed, 04 Nov 2020 13:56:38 +0000
Received: by mail-wr1-x443.google.com with SMTP id p1so2984240wrf.12
 for <linux-amlogic@lists.infradead.org>; Wed, 04 Nov 2020 05:56:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ceCydoW0taXspmLSuwqkIqJ7k7CBWNdOO4aazBAUNz0=;
 b=zbIBvdO1WovtIL9ewxpVE3Ru5lfMAtveCSNRIFq7KBZUv9esUor3y3OsunCpHvG0xr
 h+hHcAqamQxJ1WIvNHK5zWweTSUuwjpAyEsjd2fAjlh/nnVEq4bnJjIf7dg+6Z5FqHsI
 9djF/qYLR+76BXoKMimG3wD22vaz6lPwQsRAQnOqX9D14cHlKprCbN0kPQzOKCzinevF
 FpABk83dXoaFf7G7IwSEuigN2jFnsxVxmiXWE70XrYYcTvNwwnsdL+cPZ4GI+B9lYdMr
 LzmNM+vIOdkvgEnths2co49mD3PSAghTNwEBM/y+EpX2IgNgNBh7Vd34gkqNvkNt+fx5
 Zj/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ceCydoW0taXspmLSuwqkIqJ7k7CBWNdOO4aazBAUNz0=;
 b=nQdEY7lrvH3j3WoPFe3YvaLQiYA+MHxnsyHWI/RdTkL/lmkgxl43BUe9WuVBT8gXWs
 5oxjwoZOC+Mw8g57F6/6Cd4MEWkE1tnV17+VcLYQNPrQBNFa4WEMNfxcYCHYr3W5+JRK
 DWbCth9D32i00tBNVezM8vOuMX8sw9xW+X3X8+y1rQRTwBTeL57UGNE6IePayKCNrCLz
 jIwAPBhErQI/a83xSgI0U8kQdqyjjsGCb3eWisi+V7iFNXdpGZAMiNQZDe/g6H3YMvvY
 2ywGSMmJxvgstkYygJK7eJX3iy4ufvZ2XtAxf3C1yLhb8f0HrQW7IfT2Kh/9GPqUxHBt
 NbJA==
X-Gm-Message-State: AOAM5336avBe/79qgtvZLNJzRrt/rS/y7u3scTJohudyG9iskkq17YPQ
 dQ+IBFyW3xR3eFPEifW4ygGxrA==
X-Google-Smtp-Source: ABdhPJy97b+b+kxYNpot01NUM/PbFFZ3Cx3QmCKDYUoJrWaMzeH3t75MBfmhKESXwrKut/mjYcruNQ==
X-Received: by 2002:adf:f584:: with SMTP id f4mr30905424wro.383.1604498196476; 
 Wed, 04 Nov 2020 05:56:36 -0800 (PST)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:61b2:b9fb:eeb7:b9f7])
 by smtp.gmail.com with ESMTPSA id n9sm2285234wmd.4.2020.11.04.05.56.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 05:56:35 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: kishon@ti.com,
	repk@triplefau.lt,
	devicetree@vger.kernel.org
Subject: [PATCH v3 1/3] dt-bindings: phy: amlogic,
 meson-axg-mipi-pcie-analog: remove reg attribute
Date: Wed,  4 Nov 2020 14:56:29 +0100
Message-Id: <20201104135631.1550125-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201104135631.1550125-1-narmstrong@baylibre.com>
References: <20201104135631.1550125-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201104_085637_625007_11217B01 
X-CRM114-Status: GOOD (  13.38  )
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
Cc: Rob Herring <robh@kernel.org>, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The PHY registers happens to be at the beginning of a large zone containing
interleaved system registers (mainly clocks, power management, PHY control..),
found in all Amlogic SoC so far.

The goal is to model it the same way as the other "features" of this zone,
like Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt
and Documentation/devicetree/bindings/power/amlogic,meson-ee-pwrc.yaml
and have a coherent bindings scheme over the Amlogic SoCs.

This update the description, removed the reg attribute then updates the example
accordingly.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../phy/amlogic,meson-axg-mipi-pcie-analog.yaml | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/amlogic,meson-axg-mipi-pcie-analog.yaml b/Documentation/devicetree/bindings/phy/amlogic,meson-axg-mipi-pcie-analog.yaml
index 18c1ec5e19ad..702763a84dac 100644
--- a/Documentation/devicetree/bindings/phy/amlogic,meson-axg-mipi-pcie-analog.yaml
+++ b/Documentation/devicetree/bindings/phy/amlogic,meson-axg-mipi-pcie-analog.yaml
@@ -9,27 +9,32 @@ title: Amlogic AXG shared MIPI/PCIE analog PHY
 maintainers:
   - Remi Pommarel <repk@triplefau.lt>
 
+description: |+
+  The Everything-Else Power Domains node should be the child of a syscon
+  node with the required property:
+
+  - compatible: Should be the following:
+                "amlogic,meson-gx-hhi-sysctrl", "simple-mfd", "syscon"
+
+  Refer to the the bindings described in
+  Documentation/devicetree/bindings/mfd/syscon.yaml
+
 properties:
   compatible:
     const: amlogic,axg-mipi-pcie-analog-phy
 
-  reg:
-    maxItems: 1
-
   "#phy-cells":
     const: 1
 
 required:
   - compatible
-  - reg
   - "#phy-cells"
 
 additionalProperties: false
 
 examples:
   - |
-    mpphy: phy@0 {
+    mpphy: phy {
           compatible = "amlogic,axg-mipi-pcie-analog-phy";
-          reg = <0x0 0xc>;
           #phy-cells = <1>;
     };
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
