Return-Path: <SRS0=EYbA=WB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F000BC433FF
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Aug 2019 12:06:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C35BF206A2
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Aug 2019 12:06:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PwuK/snk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="XcS/BR3j"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C35BF206A2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=grPoqozwyQnD/7Prr0mqKWdDXScGZn7kYIe0NGkP3iM=; b=PwuK/snk93RnQP
	w76IIzaCSRx0XO0NUE+GS+x7DDt6oKDMWuXdCQOV12TwxknRdieOJor+R+k7VJUYba0JCPmnWXN9N
	rCAmhNJgskhQ+vxz+Nv8qm9b8mWNu9AwIIQ7ixchfQ/LNHG27xPLCtNuEio5tkuTltnkdfxoE5alh
	i8GCvH+Fh7/5zsOPNElju6BLUCcuM/eLpsW/p6GpdU1kuC0xBLTfHJ9IbeuQP4XRjWkLsDYI5FPXI
	pw14TPGIqKhkjA0i/rdgHmh+oDchMfZuU/BMVmEHD/miLRhR9rUdUWTYlZjc/zHuiYbKm9HRZBLJV
	Sf60tRvMmHJKUKKWW65A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hubkt-0007SU-5j; Mon, 05 Aug 2019 12:06:23 +0000
Received: from mail-wr1-f46.google.com ([209.85.221.46])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hubiA-0003HS-KY
 for linux-amlogic@lists.infradead.org; Mon, 05 Aug 2019 12:03:37 +0000
Received: by mail-wr1-f46.google.com with SMTP id g17so84144400wrr.5
 for <linux-amlogic@lists.infradead.org>; Mon, 05 Aug 2019 05:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=It0S2pqtroKRwqpCJzVHjSEtdzt+mhpXXxLdI5TJ2aI=;
 b=XcS/BR3jo8xM1NaMWdsnUB4S6gVD0pY/78we1meVjquEdBMWTcHxGseyDIptk1owW4
 sAch2yfbaGyV3k2zzpH9b3hN3WBcHMWkA+9chY46jAJx6YqIqZicqWrrd83D6NHliOzh
 3/siYxppNrcV+/XAQ5C3kvBHalzZud7vkYgz1YUywWv1NVjKP4XQFnaCApw0xU7D8RQr
 GyOn68CKDRiFUtKeXDw33SbxSH7yTUr9lBD8Bpkm16lWH4wskVZIiaOhDTaFUkmOrgzx
 X7Kv0hps1OtDlAsW3G1h1Ob/hvy6L9BzYOo5S1uitLU99O+q4mAfyyVAeD8xEFZS6V1+
 IuTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=It0S2pqtroKRwqpCJzVHjSEtdzt+mhpXXxLdI5TJ2aI=;
 b=FqmIKIpR5gB3pnCpre7rhafXnlMgPdeR81Qrxr4K+fhGryI3NmioWqO8X2OWFNBX/+
 QUAgF5faCtj1M0+osi2Si7Op96+7dlGPXe6Gdz5nmsHn+SFvjUIGiTH+2QV+XLco/o7s
 OptnKnZJ/M3PAx/Ic/2RSh7pVp5xy1flxVzyuYU8zhirRIdxWZD6jcTo/9ccgsT6AWqT
 gQoaIW3HGhb2ngaT9A8lt5wE3YmGdLSL8PHt173gcE8FZ9RkQ9+knNJntkRjqxe1R63V
 MA2RJOgcEk6DtI5X1TngAAUEMQBEuJyRK1VS0CZr7eY5MorncRnBK4/66XhK6r/vExdD
 HVuQ==
X-Gm-Message-State: APjAAAVJ3N4ws+gCKHOhww4pHmaqRMmRI9fbT2uOfircg/jJH6PaXXTa
 o6zXqZb8RyUish9RRoWuadPoDKnebqrlPw==
X-Google-Smtp-Source: APXvYqydGaCtbOymxM94Qk7KUysBb9OK1H/sS9OgWK1Hm6mbeH5Ar1ePJu8NBJIxGYsKGqLDdvCMig==
X-Received: by 2002:adf:f84a:: with SMTP id
 d10mr153995452wrq.319.1565006611988; 
 Mon, 05 Aug 2019 05:03:31 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id x6sm88683668wrt.63.2019.08.05.05.03.31
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 05 Aug 2019 05:03:31 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: robh+dt@kernel.org
Subject: [RFCv2 9/9] dt-bindings: watchdog: meson-gxbb-wdt: convert to yaml
Date: Mon,  5 Aug 2019 14:03:20 +0200
Message-Id: <20190805120320.32282-10-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190805120320.32282-1-narmstrong@baylibre.com>
References: <20190805120320.32282-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190805_050334_892518_C65657F7 
X-CRM114-Status: GOOD (  11.51  )
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
 linux-watchdog@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Now that we have the DT validation in place, let's convert the device tree
bindings for the Amlogic GXBB Watchdog timer over to a YAML schemas.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../watchdog/amlogic,meson-gxbb-wdt.yaml      | 37 +++++++++++++++++++
 .../bindings/watchdog/meson-gxbb-wdt.txt      | 16 --------
 2 files changed, 37 insertions(+), 16 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/watchdog/amlogic,meson-gxbb-wdt.yaml
 delete mode 100644 Documentation/devicetree/bindings/watchdog/meson-gxbb-wdt.txt

diff --git a/Documentation/devicetree/bindings/watchdog/amlogic,meson-gxbb-wdt.yaml b/Documentation/devicetree/bindings/watchdog/amlogic,meson-gxbb-wdt.yaml
new file mode 100644
index 000000000000..d7352f709b37
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/amlogic,meson-gxbb-wdt.yaml
@@ -0,0 +1,37 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2019 BayLibre, SAS
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/watchdog/amlogic,meson-gxbb-wdt.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Meson GXBB SoCs Watchdog timer
+
+maintainers:
+  - Neil Armstrong <narmstrong@baylibre.com>
+
+properties:
+  compatible:
+    enum:
+      - amlogic,meson-gxbb-wdt
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+    description:
+      A phandle to the clock of this PHY
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+examples:
+  - |
+    watchdog@98d0 {
+          compatible = "amlogic,meson-gxbb-wdt";
+          reg = <0x98d0 0x10>;
+          clocks = <&xtal>;
+    };
diff --git a/Documentation/devicetree/bindings/watchdog/meson-gxbb-wdt.txt b/Documentation/devicetree/bindings/watchdog/meson-gxbb-wdt.txt
deleted file mode 100644
index c7fe36fa739c..000000000000
--- a/Documentation/devicetree/bindings/watchdog/meson-gxbb-wdt.txt
+++ /dev/null
@@ -1,16 +0,0 @@
-Meson GXBB SoCs Watchdog timer
-
-Required properties:
-
-- compatible : should be "amlogic,meson-gxbb-wdt"
-- reg : Specifies base physical address and size of the registers.
-- clocks : Should be a phandle to the Watchdog clock source, for GXBB the xtal
-	   is the default clock source.
-
-Example:
-
-wdt: watchdog@98d0 {
-	compatible = "amlogic,meson-gxbb-wdt";
-	reg = <0 0x98d0 0x0 0x10>;
-	clocks = <&xtal>;
-};
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
