Return-Path: <SRS0=czMH=V4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41E2EC32751
	for <linux-amlogic@archiver.kernel.org>; Wed, 31 Jul 2019 12:15:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECDEF206A2
	for <linux-amlogic@archiver.kernel.org>; Wed, 31 Jul 2019 12:15:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="b3Sd1DLI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="hEtFsx3E"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ECDEF206A2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=OIxpJ7Sf3U3rYC6Wn7NECihU8YJJzH5wS5dmWMgo7+0=; b=b3Sd1DLIAibjuzRZpcOwxm+mop
	+533LVMZi6cwhl+2kOiv7OZEtxYiO8412G3M1SjK4oAHYwMehgLfv19/dlk4fXK7ZM0rzn0vvNPMH
	TgfleBRQO1QL4Z6NYd13TjCjsLtCA3IphkVrlyuPdw6BZFDV1iQSotxPqxlkNdRQ7udw8EVlJJHA/
	KOyQL/AdEoZjC5HMxY9t46vZD1vHSRUNsdnqkNtz4GmbQk4T0vqsPS5ZdeZjtD82Da6F1WmFxBpwV
	Fn+8lyPc8kxYhMX7c2zcmNW8GDWn7bTrRakugfrsME4KheRHbs5bHb20rQ6PuNi1Gr74WpYkkRUw2
	BHYe7OyA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hsnVQ-0006FA-6l; Wed, 31 Jul 2019 12:14:56 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hsnUl-0005OT-SA
 for linux-amlogic@lists.infradead.org; Wed, 31 Jul 2019 12:14:19 +0000
Received: by mail-wr1-x444.google.com with SMTP id n4so69502027wrs.3
 for <linux-amlogic@lists.infradead.org>; Wed, 31 Jul 2019 05:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ZCxLPCe1ACQErDUW8aWQ5KGtk3yR1/KdxyjnNrl959M=;
 b=hEtFsx3E+vxVxKVnkVJrIPQhq8u5k6R7R82zb8hMdxf9abXPdtLUh28KELgdxJxC7H
 fRk2y7UTqODUNIsjHz/e6c/DCcMZFDmYmRqcQer0vInc6NtYSx+JKe507QqSSmy+27sA
 si1yo3vz6FWgANa91bC16sQzkIS5vyEUgDzCdvaqR4tzTBvn61aSjX6IhW0cw61qZQPE
 NbnbApP+KE2tqktTZaEEwZ6VIEEC7DjdrKqhLyYtc/cUEbL48PcGFI70udjecD5SUYgU
 1DavhttVuzkByIzpTjIXy8Ot5Ginl8C4aNnpTVOXHvtAjoj3meueKbzIOTXOZxjIfDvF
 9LwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ZCxLPCe1ACQErDUW8aWQ5KGtk3yR1/KdxyjnNrl959M=;
 b=ng4YCHTfNu0AXxcrIPL1ZdkTN9ad/8mn5V7Jbn55UTneAuYsyNkt9MvT0SlVwdC6es
 2gbgUddIzjEHhNyp681yNCdhxAR+oHSxiYlZvS20+Dr5EQ7C0ZugaQr6WtSE8XHHkcTL
 wM58ZaKhNNSiQZIvwI4ifCOEyRXhfk1Y4r7d/4GuOxXZZAHk2T4i8VvNhxgKVl6P+Gu+
 qhFoNI+Id1j3VOMfRo2sqPNPIQA+2+pWOyNSi7xJn36Aa21K4keKueCY73erRILttbAA
 87+DgVjO5gGrzsT2QB5GJA10JRxJBC6BGbsBOqSWbUxUNDeL+cHhOGCl8dKIdFaIRACy
 MrPg==
X-Gm-Message-State: APjAAAWdXgToQmI82k/0cXV0w+WbAZeBVFglCgQcMZEx2FHiOEZYPnbQ
 bR6rL7GZ/i32V6e3WLGA7DLp3w==
X-Google-Smtp-Source: APXvYqyR0a3A3NknrNBLDCX+TNBWHtgAMABkJnJgH0JnXRb3PYf4C6vmioWW1jWll9xmx8tLdvDNwg==
X-Received: by 2002:adf:e50c:: with SMTP id j12mr51394689wrm.117.1564575254371; 
 Wed, 31 Jul 2019 05:14:14 -0700 (PDT)
Received: from glaroque-ThinkPad-T480.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id a64sm3613713wmf.1.2019.07.31.05.14.13
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 31 Jul 2019 05:14:13 -0700 (PDT)
From: Guillaume La Roque <glaroque@baylibre.com>
To: daniel.lezcano@linaro.org,
	khilman@baylibre.com
Subject: [PATCH 1/6] dt-bindings: thermal: Add DT bindings documentation for
 Amlogic Thermal
Date: Wed, 31 Jul 2019 14:14:04 +0200
Message-Id: <20190731121409.17285-2-glaroque@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190731121409.17285-1-glaroque@baylibre.com>
References: <20190731121409.17285-1-glaroque@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190731_051415_915121_EE8A2758 
X-CRM114-Status: GOOD (  10.02  )
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
 .../bindings/thermal/amlogic,thermal.yaml     | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml

diff --git a/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml b/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
new file mode 100644
index 000000000000..1e2fe84da13d
--- /dev/null
+++ b/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/thermal/amlogic,thermal.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic Thermal Driver
+
+maintainers:
+  - Guillaume La Roque <glaroque@baylibre.com>
+
+description: Amlogic Thermal driver
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - amlogic,g12-cpu-thermal
+              - amlogic,g12-ddr-thermal
+          - enum:
+              - amlogic,g12-thermal
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
+    allOf:
+     - $ref: /schemas/types.yaml#/definitions/uint32
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
+                reg = <0x0 0xff634800 0x0 0x50>;
+                interrupts = <0x0 0x24 0x0>;
+                clocks = <&clk 164>;
+                status = "okay";
+                #thermal-sensor-cells = <1>;
+                amlogic,ao-secure = <&sec_AO>;
+        };
+...
\ No newline at end of file
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
