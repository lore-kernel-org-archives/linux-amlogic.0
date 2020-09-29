Return-Path: <SRS0=+WvW=DG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A695C4346E
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Sep 2020 09:32:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E54020848
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Sep 2020 09:32:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="es5XdMZG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="myLb+Hr6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E54020848
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jK/gxXalV3ci2HE5w7qxQy31ehVwpVIn8Ru48tBADs4=; b=es5XdMZGs207i89jRSU9xm1Ky
	fyhGuuhTqC/WTqX9eD4IbRDoVu9Pp8xLZeoQzh65du1GIVT46ZtISUMA8jZZTM1NK7TiqAMkvjhJf
	2jP9Tb4ZY921CneBkxzEWFuRMLE4hNBySXqn5V4C98SQ+IWT+oTCC1GmyJAEIZ2t4mv/gPEeVf9Uo
	6VLR8dpEG+Ae6aiytFbighDwp9jjVaLdPakOFRyk62yGbmtT2OjcSQl9h09aSRWH06uJ5Y2OMuDuZ
	87R/UXNhZNqNNgERGbsqI1XbOrbjfj6AdcWzwyBDHSCOrZb92+3i2pFOtlCABYkVkk4PaKppTXMqg
	1N3n2/VYQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNC0A-0007bp-Pi; Tue, 29 Sep 2020 09:32:50 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNBzY-0007Nj-Hs
 for linux-amlogic@lists.infradead.org; Tue, 29 Sep 2020 09:32:15 +0000
Received: by mail-wr1-x432.google.com with SMTP id k10so4563842wru.6
 for <linux-amlogic@lists.infradead.org>; Tue, 29 Sep 2020 02:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X+jktKSyt59M1RlyoUXQDUiIneqQcY7EbqJCiazlG1Y=;
 b=myLb+Hr6JRovq+G7HcalEjWrE9xtAR8ykHBBv4s3xwlJeTdJdrmjx5VFHI1pfytwo0
 mUhQu3iL2Ournn0t/Lt6tDQ3/R9CILOjnCnviUv35KudZ+7Z0Cyqa6UqD51Ty3Y5saOH
 DPgDtkvBjlZFIF0UWJbr2hnHzKdCQ3B6ZnhmoQ22CZQxn7r+xVYRMH+e15Ix7p/1x4sQ
 ZBViLZCSHqniJskizbyN1oVpwM0zko+0kfPvaMnTFXoJekFnX5H/LifKQR0CxpegdAbz
 Exzywj3HVGjLH7WUraTq7YMKLUmk8jmUNTCzDRkWrTGwX8OyTIGx56u7uitDsmr4TIDV
 HwuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X+jktKSyt59M1RlyoUXQDUiIneqQcY7EbqJCiazlG1Y=;
 b=XlCUmqU8TiK/VaUFWFkctoeu/9MfhDYtTy3ZyFLiN4NnyaO9vAnnggQeBz+KoCdtoq
 frXeJ0bN8qGm1dTa53Zg5ggm7S2K+qI1+tOJvC0XDG+yV2fB1fs4zLw7McB22hxMvspX
 x9zJMCMJDPL9UiUKM1TwyrcTPJ+1/xPc/3RR1FX64nX6RPr/IChWK7IT3WVTZ1KzSkqE
 byH3PhGEycJD/I6RnMRR7GR7bceQriT3ZhT/OJ3A8FmdWFEapj0GqxFcfqlBMtximw7z
 bUZ2hwQ/XxJkLMvyJeEeKseOtlrc9TVx+axJV0KGISocMoesOfFPmjRyBhgX3hAOhYyr
 P1YQ==
X-Gm-Message-State: AOAM531+UGBlXmduQKdYT7R/7/++iuD32O2kS4pSvhc/aSPD8cHyycSj
 8GFz1UKS9QTOReSdkyZh+0GpXw==
X-Google-Smtp-Source: ABdhPJzXi4MqKZk/mmRCSffYTu1+LpmIZUNXQbMDjC5qAe67PTCaW4S2MNtIm7Lxjh1GKuVCkefxSA==
X-Received: by 2002:adf:81c6:: with SMTP id 64mr3103257wra.176.1601371930925; 
 Tue, 29 Sep 2020 02:32:10 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:d50c:1ee4:fec5:ad12])
 by smtp.gmail.com with ESMTPSA id a10sm4596107wmj.38.2020.09.29.02.32.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 02:32:10 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: kishon@ti.com,
	devicetree@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: phy: add Amlogic AXG MIPI D-PHY bindings
Date: Tue, 29 Sep 2020 11:32:02 +0200
Message-Id: <20200929093203.337954-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200929093203.337954-1-narmstrong@baylibre.com>
References: <20200929093203.337954-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_053212_662354_B6AB066A 
X-CRM114-Status: GOOD (  14.21  )
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

The Amlogic AXg SoCs embeds a MIPI D-PHY to communicate with DSI
panels, this adds the bindings.

This D-PHY depends on a separate analog PHY.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/phy/amlogic,axg-mipi-dphy.yaml   | 70 +++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/amlogic,axg-mipi-dphy.yaml

diff --git a/Documentation/devicetree/bindings/phy/amlogic,axg-mipi-dphy.yaml b/Documentation/devicetree/bindings/phy/amlogic,axg-mipi-dphy.yaml
new file mode 100644
index 000000000000..be485f500887
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/amlogic,axg-mipi-dphy.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2020 BayLibre, SAS
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/phy/amlogic,axg-mipi-dphy.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Amlogic AXG MIPI D-PHY
+
+maintainers:
+  - Neil Armstrong <narmstrong@baylibre.com>
+
+properties:
+  compatible:
+    enum:
+      - amlogic,axg-mipi-dphy
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: pclk
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    items:
+      - const: phy
+
+  "#phy-cells":
+    const: 0
+
+  phys:
+    maxItems: 1
+
+  phy-names:
+    items:
+      - const: analog
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - phys
+  - phy-names
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    phy@ff640000 {
+            compatible = "amlogic,axg-mipi-dphy";
+            reg = <0xff640000 0x100>;
+            clocks = <&clk_mipi_dsi_phy>;
+            clock-names = "pclk";
+            resets = <&reset_phy>;
+            reset-names = "phy";
+            phys = <&mipi_pcie_analog_dphy>;
+            phy-names = "analog";
+            #phy-cells = <0>;
+    };
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
