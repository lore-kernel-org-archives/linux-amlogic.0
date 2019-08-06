Return-Path: <SRS0=TmCu=WC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F2F9C31E40
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Aug 2019 13:05:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA2D9216B7
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Aug 2019 13:05:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aDbonrh/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="dMgLNtg6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA2D9216B7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=f4VXpO/Ju1Kld5eoYVLc6tUoJl7CWqM9AQBzH0RkW1Y=; b=aDbonrh/zbLo6PVnxYxrV+3pEo
	rwy42bPQ5TAYsuMgcjrZGcHRgTFLGp6znVNz4zSlB0Ge3dG8OOGkbilJHPWqDh+9WKsoCs1IzbYtO
	wbB9mCRqENLqIcAK/3wTOXA8113vtHk2N+yLLvCc8xIZQC9NGgK+D7B/BUL9Ia/l64YubN1RrwGbD
	6Qt3jIdeL31zwjkHbtYAkh3SKUb8GZFNSVX6mLOBFazhZ5TeL7VOyTiXy2oC/4EL+3/iDnDl+d0r3
	n48t/bCvdRrM2UofuI26b5bLnzVwlexvUArcBViBWdtXLA6UkrWdo8ky19mqp0P7PvG9CbYUj/vQl
	WMSN4LXg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1huz9h-0000fD-5i; Tue, 06 Aug 2019 13:05:33 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1huz9N-0000J9-5c
 for linux-amlogic@lists.infradead.org; Tue, 06 Aug 2019 13:05:15 +0000
Received: by mail-wm1-x343.google.com with SMTP id g67so72285005wme.1
 for <linux-amlogic@lists.infradead.org>; Tue, 06 Aug 2019 06:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=MU/41RFECDspWBa3sc+F8Zp39+RFWaJYY0sZSPREqvA=;
 b=dMgLNtg6IB/G4JAEZ3gnOVQg+IAWnmWkO+EUx8o+nfCf2wRwi/CyWA9dWmAEgKwgDf
 +zeDEHMZRJ1mlwUPCPKsiT3dNwwWqJa5d1YMs9mOxV8yRESy3FvWmwBTK7OnJuw5Qrz+
 tuo3Q86hyJMOSljkAjcn1r8DLep2abJXdysO5L6ymzWRhjDyXrjSzcajBI2rLVbS0psM
 Stmh5yfUBJE8/nXQMswyjU4uYeKk4TbUOWdFsRjI/WUb/ux6v/yHw0tgE4/jgW6cDtQU
 OGPrDhBsGbirU37wPrcDhnKn2x4n4EqNf8zgEirUsi6U53KF5Hh8qGO/mGOtOdrfqqMU
 xrQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=MU/41RFECDspWBa3sc+F8Zp39+RFWaJYY0sZSPREqvA=;
 b=eISf1vqNbVjtPE6j/2hfW/Rvymg5y7Q2gGfJo1EAtonfwniXI47Evmji/3wAQ9eCPO
 pnlEic+Wx0YOJdmxlB6+jrk25JMo3g7GcTnGZHMaGYHTFRNYGdN/7aL8X1abg5D/zdP3
 1URjcMeInh/AoEeSnshRK4jF0NiKot50c0nyJiEkXhRMjtISkDrSpoLjj7XWy+xPRtBW
 waSqkLynDKcwOLPVz/QxbgHEgXXgr9CKtIyZ6b83deM0aMiGpYdpBg65+6kKfBfa1SNl
 FqS8UZBRtx784Aph6rKM1je0Mo7d8sukXLnIq5ZJl41Q1eCcQp11NKpkTPv/idX6PH0c
 fHhQ==
X-Gm-Message-State: APjAAAXm/iDB6jO4pEsdGjT2EsUNzpEA2tVcgR4XmZqL4YN13ppCv/X5
 qiX8/I1R4zlTyBVMXWdG2kqCMQ==
X-Google-Smtp-Source: APXvYqxMHvYaJ55mSpFSMmQD9n9qF8WkY+OoQWCPbiPLbkpx1d0Xyg+zVQoK8Ysivq0YgXQDiUeARw==
X-Received: by 2002:a05:600c:2503:: with SMTP id
 d3mr5010397wma.41.1565096711633; 
 Tue, 06 Aug 2019 06:05:11 -0700 (PDT)
Received: from glaroque-ThinkPad-T480.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id j33sm201888738wre.42.2019.08.06.06.05.10
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 06 Aug 2019 06:05:10 -0700 (PDT)
From: Guillaume La Roque <glaroque@baylibre.com>
To: daniel.lezcano@linaro.org,
	khilman@baylibre.com
Subject: [PATCH v3 1/6] dt-bindings: thermal: Add DT bindings documentation
 for Amlogic Thermal
Date: Tue,  6 Aug 2019 15:05:01 +0200
Message-Id: <20190806130506.8753-2-glaroque@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190806130506.8753-1-glaroque@baylibre.com>
References: <20190806130506.8753-1-glaroque@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190806_060513_267593_2A913924 
X-CRM114-Status: UNSURE (   9.79  )
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
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Adding the devicetree binding documentation for the Amlogic temperature
sensor found in the Amlogic Meson G12 SoCs.
the G12A  and G12B SoCs are supported.

Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
---
 .../bindings/thermal/amlogic,thermal.yaml     | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml

diff --git a/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml b/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
new file mode 100644
index 000000000000..d25e59113398
--- /dev/null
+++ b/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/thermal/amlogic,thermal.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic Thermal
+
+maintainers:
+  - Guillaume La Roque <glaroque@baylibre.com>
+
+description: Binding for Amlogic Thermal Driver
+
+properties:
+  compatible:
+      items:
+        - enum:
+            - amlogic,g12-cpu-thermal
+            - amlogic,g12-ddr-thermal
+        - const: amlogic,g12-thermal
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  amlogic,ao-secure:
+    description: phandle to the ao-secure syscon
+    $ref: '/schemas/types.yaml#/definitions/phandle'
+
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - amlogic,ao-secure
+
+examples:
+  - |
+        cpu_temp: temperature-sensor@ff634800 {
+                compatible = "amlogic,g12-cpu-thermal",
+                             "amlogic,g12-thermal";
+                reg = <0xff634800 0x50>;
+                interrupts = <0x0 0x24 0x0>;
+                clocks = <&clk 164>;
+                #thermal-sensor-cells = <0>;
+                amlogic,ao-secure = <&sec_AO>;
+        };
+...
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
