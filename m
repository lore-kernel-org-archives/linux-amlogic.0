Return-Path: <SRS0=sVtX=EW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8711DC5519F
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Nov 2020 10:17:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDD4520888
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Nov 2020 10:17:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HvDzkTrW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="SG2Ndhe6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EDD4520888
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zjTPgASo6WSVWbuDGwVerz2ATbnCm9e1kpBEedwybTg=; b=HvDzkTrWFj+7uFXpo7Y+BvcDL
	XssD7rH7eDrm50k2KqSGwsPAHc/A4I/Zx9Iot46OM2APZBgssCCA2MVc2EA4EPjpWX62bx0wFygCI
	BWMT6Vuya3hRuzhA+JmW4j3wRzxfiT++QhTH1vCl11TKdCvPXqHwT5OgMxCJoy6ArKYd67szZZm34
	0+Kf5s4Q77Qq7Z0KjlBed/kqh5srHyBeTfG8Yx2CdfBWCA100ao+Bf3547IDkncBU8xuN81BlRCFO
	nNb5TcDCNrkCt7skpAFFk/QpLCYjsPbt0ozMp3PJLW+VsCCXzsUXFtYORxuG0xwgGMuM7T2a4Oc79
	aOf5iVg5g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kebZF-0000iL-Gx; Mon, 16 Nov 2020 10:17:01 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kebZ7-0000ea-89
 for linux-amlogic@lists.infradead.org; Mon, 16 Nov 2020 10:16:54 +0000
Received: by mail-wr1-x443.google.com with SMTP id d12so18007062wrr.13
 for <linux-amlogic@lists.infradead.org>; Mon, 16 Nov 2020 02:16:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ceCydoW0taXspmLSuwqkIqJ7k7CBWNdOO4aazBAUNz0=;
 b=SG2Ndhe6APWjlDn6wFEvBZ3ehJOUWLlIgfiAYzAPABdH4U5rx/TjUyvoLtMsvnGE5T
 qMjURWhDpgFHkUkTBxhkQE9JtPrwJ+btN6BDoOVcNzqeaPGq3Am1WfKnVjT8ZUQZofZ3
 /C2l8KmcE+5vQ3kL4ls01KicfLYWdQD1v8brhkdP50/OEjppXABLw95IHG5oDr2AcNDW
 JAhh0dCaGfmVGNOcoKS1AW+q5DlGgv3XIIy2wHQ/j2AJjA6YuNjU4PN2U7vItiShRmsX
 kBoSI4+bSJZ1Sy/2zBXWdcXqe0kRgMaBQK4khGLgB18ZzXVVzp8xOiwGw0d8cQCogixs
 AXsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ceCydoW0taXspmLSuwqkIqJ7k7CBWNdOO4aazBAUNz0=;
 b=hMaVL88+YXB0a3borV2YqrhtCAmb0RQVDYK5XRVm4x6w9XTxyP9K/Udi83aXrEb6YN
 kEfL1aipupuF9jDn6A36e2ITML6iNXKONy4wzJ60vwnhSE5yQYtU2o0FQ7c1IvCCi4FM
 YQFyI3nQpYTOMdoqtBiyXzR0dY0ImH2Y+EjVlSzVqRHCyhRXLI0UdhVgpsQJq+exuWje
 DLRGY6d4Y9mSD2IE3jq7VrQ1AGJfmTJ3rn9IVBVqgkobTTlxGlirsDsG8H0HkRv9WmdZ
 bY+bX3sRWqm+L09wN4oR76ISceS82iRq3GmLPH7VJl4+z75eico5yJkeEB49DbuNGUPv
 dyjg==
X-Gm-Message-State: AOAM532l/G5fjKVa7k4vEKLLRtZzPrnloP23aboHEE19ijfRtTOTgKfi
 sR5JSkkr3mQt4jwWDAtNhJLdl5Zb2mumGlCD
X-Google-Smtp-Source: ABdhPJy7bRH4MB0eF2todERkHKwsqav6ZT/Sr2okUSKCVRiGHZhZZuaJo0eIDZb+4P8SU1UrHOLHhQ==
X-Received: by 2002:adf:8382:: with SMTP id 2mr18405195wre.227.1605521812097; 
 Mon, 16 Nov 2020 02:16:52 -0800 (PST)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:edb9:72a:9e35:6eb])
 by smtp.gmail.com with ESMTPSA id
 c17sm22265131wro.19.2020.11.16.02.16.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 02:16:51 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: kishon@ti.com, repk@triplefau.lt, devicetree@vger.kernel.org,
 vkoul@kernel.org
Subject: [RESEND PATCH v3 1/3] dt-bindings: phy: amlogic,
 meson-axg-mipi-pcie-analog: remove reg attribute
Date: Mon, 16 Nov 2020 11:16:45 +0100
Message-Id: <20201116101647.73448-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201116101647.73448-1-narmstrong@baylibre.com>
References: <20201116101647.73448-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_051653_313232_A72C0F0F 
X-CRM114-Status: GOOD (  12.88  )
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
