Return-Path: <SRS0=NajJ=V5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AC25C19759
	for <linux-amlogic@archiver.kernel.org>; Thu,  1 Aug 2019 13:57:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7155C214DA
	for <linux-amlogic@archiver.kernel.org>; Thu,  1 Aug 2019 13:57:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="L3Vlw6pW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="U15Iw1p8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7155C214DA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P6z+yPm4ZjcSYSt1L+368miNB2S1MqkPUlCyWwCQ9wc=; b=L3Vlw6pW+d+nHc
	h/U57B/6WGsDmdDql+Q6jyvxVutotdwpYs9ID+5EKPYvADFkcg7vmAVuBgZeK/0C2clDd3J8UcG3v
	ryaPcAQYHFYW3+Q4DR7lwBWXlIQVDNIV6GNnawnL5BBlkLLF0RuHuwwg68GpW8RAeFgwRfCAA9z/7
	poS44jXQPL7WdWxUZAMNkXKOUoERQ8nZ9EJk1NAROeq1Msjj0hfEU9BxZsKXv8Zxf7H684Cdh6c96
	EC9QJHf844MAQ9vMDvct12E2gqS1Je+YJiHu5Rcl6N2bfHL+rBKhLljYeiPj3kVS8epByq0vJG3Z5
	xSE5PjI/Jy5GxrmG/qlg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1htBaK-0001qG-44; Thu, 01 Aug 2019 13:57:36 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1htBZb-0000zf-26
 for linux-amlogic@lists.infradead.org; Thu, 01 Aug 2019 13:56:56 +0000
Received: by mail-wm1-x342.google.com with SMTP id u25so52942467wmc.4
 for <linux-amlogic@lists.infradead.org>; Thu, 01 Aug 2019 06:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Z7STkVMB2yHisZ/usmwoT4spFS0I17AFPosoUf8jAdk=;
 b=U15Iw1p89hmo5WXozzc/nhfNJVjS1XzA0Mm3OOLSK62P3Y6V+jLEe5O3vHlbOjlryd
 JA7hs0OJrR6dGqvcMZeR8QPmiN1xElgTeYs5IjbKb2h7CpMqyF+QRGpi7pvb8h7qHQPt
 dGqoTNVAAWkSwIO0ERnDXdZo+5rhObEfiRwVsckLWQOiO4ZrmVvJaElD8u/ojM+OZGd6
 FsDpsE5MORMbqCB8IFVl/RnGxCTFu3s28aK/a4T8Jr8YgEGv5GeO5UJZH1TzSWofsVgr
 BkUotmgGMoVqC9pbiZUXBe4o1HIVfLHbtWQa45s2CTMj14OHy+GbDE4bwO7gsDK9pD7q
 gtrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z7STkVMB2yHisZ/usmwoT4spFS0I17AFPosoUf8jAdk=;
 b=fXeLA4vtLutI4cBBqLPhkSygCIrXwO4V2v3I4HCe9+QVNUz6SPGBi5YzpqCTkHLz2Z
 ekPL0H1cpkj0qNdMES2fWw6pJ12NS+uaUi9KYkWPBiLfoebCI6th6LauKpzPFiL/xrWz
 tyzxrsciqHp83pvB5hnLRV9MOQAz3e6SKMJAiOQTjraSZU87Q+I5rGk+YrRQemeHG1OP
 gaWsyXqAqVEcPlJmqH2wRDAbzit2bRdCc5pXwsxY2b7IuZYav9XiazKEivR1vY6oCpnZ
 5cbdTQlolwqGa63Rx4Pb3j0vEffiKLyd6gcK+i9Zlkz1wFWeGOT5ZVuqKf66sJtK7tKh
 MLdQ==
X-Gm-Message-State: APjAAAWe04JP/Rf+5RBYbt7Uxo5vEkpYOGSLXBWjjKhpxwPbwWyJGs8q
 BXDk1Mi//ijILFc2MIocNOUQOg==
X-Google-Smtp-Source: APXvYqw44gd7s3l3amDGcR8npMDPP6OHyZ0Okn4ToukORt9MValWm04W6roItzITY9/GWLZtLsug6g==
X-Received: by 2002:a1c:7ec7:: with SMTP id
 z190mr114407950wmc.17.1564667809578; 
 Thu, 01 Aug 2019 06:56:49 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id u6sm69659952wml.9.2019.08.01.06.56.48
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 06:56:49 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: robh+dt@kernel.org
Subject: [RFC 2/9] dt-bindings: rng: amlogic,meson-rng: convert to yaml
Date: Thu,  1 Aug 2019 15:56:37 +0200
Message-Id: <20190801135644.12843-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190801135644.12843-1-narmstrong@baylibre.com>
References: <20190801135644.12843-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190801_065651_104680_FD147CB8 
X-CRM114-Status: GOOD (  10.55  )
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
 linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../bindings/rng/amlogic,meson-rng.txt        | 21 -----------
 .../bindings/rng/amlogic,meson-rng.yaml       | 37 +++++++++++++++++++
 2 files changed, 37 insertions(+), 21 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/rng/amlogic,meson-rng.txt
 create mode 100644 Documentation/devicetree/bindings/rng/amlogic,meson-rng.yaml

diff --git a/Documentation/devicetree/bindings/rng/amlogic,meson-rng.txt b/Documentation/devicetree/bindings/rng/amlogic,meson-rng.txt
deleted file mode 100644
index 4d403645ac9b..000000000000
--- a/Documentation/devicetree/bindings/rng/amlogic,meson-rng.txt
+++ /dev/null
@@ -1,21 +0,0 @@
-Amlogic Meson Random number generator
-=====================================
-
-Required properties:
-
-- compatible : should be "amlogic,meson-rng"
-- reg : Specifies base physical address and size of the registers.
-
-Optional properties:
-
-- clocks : phandle to the following named clocks
-- clock-names: Name of core clock, must be "core"
-
-Example:
-
-rng {
-	compatible = "amlogic,meson-rng";
-	reg = <0x0 0xc8834000 0x0 0x4>;
-	clocks = <&clkc CLKID_RNG0>;
-	clock-names = "core";
-};
diff --git a/Documentation/devicetree/bindings/rng/amlogic,meson-rng.yaml b/Documentation/devicetree/bindings/rng/amlogic,meson-rng.yaml
new file mode 100644
index 000000000000..a9ff3cb35c5e
--- /dev/null
+++ b/Documentation/devicetree/bindings/rng/amlogic,meson-rng.yaml
@@ -0,0 +1,37 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2019 BayLibre, SAS
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/rng/amlogic,meson-rng.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Amlogic Meson Random number generator
+
+maintainers:
+  - Neil Armstrong <narmstrong@baylibre.com>
+
+properties:
+  compatible:
+    enum:
+      - amlogic,meson-rng
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: core
+
+required:
+  - compatible
+  - reg
+
+examples:
+  - |
+    rng@c8834000 {
+          compatible = "amlogic,meson-rng";
+          reg = <0xc8834000 0x4>;
+    };
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
