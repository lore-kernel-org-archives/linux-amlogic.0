Return-Path: <SRS0=lUps=HM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EAACC433E9
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Feb 2021 08:08:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8CA2F601FF
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Feb 2021 08:08:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8CA2F601FF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=C+01xDCp5KF61eZwgMz5juA2ETuJaULUVBavQdhnhNU=; b=UaSkPJcR80XLop/9BqaOJgQp1
	465ykGaIZaQkzpoc8L7lDs8YirRFXZ/zZ/y/zck7yG6Ai29rC41itJtNtwEBsKCjt5SIvCT27VmNs
	91DuO+JeRfebeNacIPibDAaOFEUVE7dBo8mUVCgqd+vtkAhJzPpiVMG12xIuUxvXfAQLsfyflilXh
	2dLNYECMUbtXvJQNOK+n1nZu48hS6+KN8hu31n2x7aAmqW1xOPitUx0beeEW8cOc2ih32woKQoEiB
	vTMKidoZsYf+GBA3Rh4Hna/ZvoMtOy4kgl3qLXjDBJs/fzdLtrDlivpoBQCxOuZ4oTQuMKiQAR4C8
	sEPGpOEEw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9kXS-0001Fm-Mi; Wed, 10 Feb 2021 08:07:54 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9kXK-0001CC-MA
 for linux-amlogic@lists.infradead.org; Wed, 10 Feb 2021 08:07:49 +0000
Received: by mail-wr1-x42d.google.com with SMTP id h12so1402737wrw.6
 for <linux-amlogic@lists.infradead.org>; Wed, 10 Feb 2021 00:07:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ADCBKNEvDCsXJjSVMo0gh3Ha9p8ktO5jYuFtRysBMF0=;
 b=YQjWY+hxJxeD56cqq89+O+y3MDwbuTakyQLYHodtIrzbPq8PcNsRLO5z6jEf4udjmu
 9ipNyIapLAnvb6vdPjQRv7+BS25p3zD57IpUiX8gYoEp5j7iIfoASJnaTevZ+VY/cq1U
 ZZ24OOieq/HVm2ngAm56Gwx9bRCOakIGJ+raObziF0qDxw8VNQKr7JdSmpCY3YXy/1aQ
 BGtVGf4fxV8sqHgyv3Yx1IYvR3REvuwY0OcN1tSmZmXJo43fJnUfNAR1+72iEAC0328K
 lRNmzIyQfGkI9im1sO2OwzfnfVhvlcXNjqPSNOIhriQ82XHP6cm9OWv6RIl/TiHG8nMP
 yhBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ADCBKNEvDCsXJjSVMo0gh3Ha9p8ktO5jYuFtRysBMF0=;
 b=PGHznGqondgej5erh+Ng+lEL8wG4qf5yVKOfBufhi0SZH362b0OLVlynEtWmGYTbqm
 esQ2JXIwXpghmMFGZLxIfZCKSP6lVOgAZK9ZO5FAC8/V98FmeP0Wrjf5/r/wyrmNU6A+
 DmOX/P1/wu7T2BKIv0Ap/kB4VvHIKoDjxrG3ZQjjhiS5uHGn2D0r/1DQDOaPoOTjiX/x
 nANJ2TSRfSQBHV5S6Qf/YjZP31Xw2WRPalkdXYMqOSkB0M/Mk00UHK8lZPliQH5mPNP3
 j80R76v53LwfHtbmn6wFiV/NFQgk3Cy6YLBNbFWjb+VZD/fBf4KMHnBo7bKeAl8cvT8B
 dqzA==
X-Gm-Message-State: AOAM531+JYOvWNqitkfU7TJg0KdVAd22JIp08rDom2TaXxua4fN8GuQY
 8BMzfbXD2Rx2N7BUJ7EXJDLSIg==
X-Google-Smtp-Source: ABdhPJxN7qsejNz3LbGpff6S3f17fETxX5jUqtrZgVWo2AQppiLn4e8WrPCGMJlCsA22dd/fAqA/IQ==
X-Received: by 2002:a5d:47af:: with SMTP id 15mr2171896wrb.205.1612944463308; 
 Wed, 10 Feb 2021 00:07:43 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:90c:e290:d403:f5fa:8912:cba5])
 by smtp.gmail.com with ESMTPSA id
 c18sm12856597wmk.0.2021.02.10.00.07.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 00:07:42 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: vkoul@kernel.org,
	kishon@ti.com,
	devicetree@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: phy: add Amlogic G12A Analog MIPI D-PHY
 bindings
Date: Wed, 10 Feb 2021 09:07:35 +0100
Message-Id: <20210210080736.771803-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210210080736.771803-1-narmstrong@baylibre.com>
References: <20210210080736.771803-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210210_030746_760364_7ED5940F 
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The Amlogic G12A SoCs embeds an Analog MIPI D-PHY to communicate with DSI
panels, this adds the bindings.

This Analog D-PHY works with a separate Digital MIPI D-PHY.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../phy/amlogic,g12a-mipi-dphy-analog.yaml    | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/amlogic,g12a-mipi-dphy-analog.yaml

diff --git a/Documentation/devicetree/bindings/phy/amlogic,g12a-mipi-dphy-analog.yaml b/Documentation/devicetree/bindings/phy/amlogic,g12a-mipi-dphy-analog.yaml
new file mode 100644
index 000000000000..14bb8d78a860
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/amlogic,g12a-mipi-dphy-analog.yaml
@@ -0,0 +1,35 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/phy/amlogic,g12a-mipi-dphy-analog.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Amlogic G12A MIPI analog PHY
+
+maintainers:
+  - Neil Armstrong <narmstrong@baylibre.com>
+
+properties:
+  compatible:
+    const: amlogic,g12a-mipi-dphy-analog
+
+  "#phy-cells":
+    const: 0
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    phy@0 {
+          compatible = "amlogic,g12a-mipi-dphy-analog";
+          #phy-cells = <0>;
+          reg = <0>;
+    };
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
