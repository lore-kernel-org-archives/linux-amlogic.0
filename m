Return-Path: <SRS0=EYbA=WB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54E03C433FF
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Aug 2019 12:05:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2753C206A2
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Aug 2019 12:05:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="g+v0fEuT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="EhN2WpYa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2753C206A2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2osan5KR+ceHsRqFhn+XkNWxxyKHnOj4bXknR35Nytg=; b=g+v0fEuTKyIoiq
	1WzykZAsslD4YFGPCLRXuv/LDYlJFy8xo/O0SzR+PiVz0VZvqLmv9wtJ/lfluhK3ZKIK9q+wOCj9z
	PIMMJ40EEsBQOREGPjtY8gXZh4rvwYzBIMkxdXjkfS3prFeLnpMinH2X4TTmkNN0piWoRyK7dKuV1
	weMokjTLmjr+xjwLTg+o49dEQ0v13s0WOXFiGFkhqu/zT+6B/ftvJf13JahSGkGzE1tL3Bglyq1DH
	EmtmDhfJxYXOqS1TenYFdbl1PSX5hdJAGpG+/QGTCUASr8d8CQdJJCxlMC/jZLRJymjh2PlrruUTc
	XpaOKO2Ln1sTgAwPlPPg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hubjV-00050I-9H; Mon, 05 Aug 2019 12:04:57 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hubi8-0003A4-Iz
 for linux-amlogic@lists.infradead.org; Mon, 05 Aug 2019 12:03:35 +0000
Received: by mail-wr1-x436.google.com with SMTP id f9so5230596wre.12
 for <linux-amlogic@lists.infradead.org>; Mon, 05 Aug 2019 05:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Wq+NOUXuHn9W915kfej1QDLl0G8Catrb+/a+UkGjnNI=;
 b=EhN2WpYa+7ri803ml/bEjkzN1nY8BeU/AY+MMoupJpUIq2u1p69+yVQ7br/t7mH40P
 lp9VfG2N8pWv83c6lN9S33D5h3Mg/GgGrJTxktOOpRJc4Qs00Zm87PR/db7y2yW3eAM6
 uqOo8k7bHGd3mbezV1Dwr1KXDr0iOfekOTUrcq5m6jm0CTIKePQkNlLJNUaHWfovrAew
 +b6HUE0pNdRqO0/lmBNUKx++21+RPI0IeTwUD1yG1RRAViSfofe/w7WYXAKG/1Z/+xUG
 K4otNssxD3TWTfLz/MTLFN14SC5nJN6LkuPwF16Sd6vwDrXPfpogEAxW9ueLCgKxJYzS
 XhEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Wq+NOUXuHn9W915kfej1QDLl0G8Catrb+/a+UkGjnNI=;
 b=X7QjSZG6gdBVzxkXiN0Jp3mhgd92aVeTpSXgYJXM8R5oL7pfe95l7R/SXS7yXTBmAr
 ltgr3MrD8m2lXOq9YvC0t2Hz9YS2iTNszTnIoOceD5WYIDnfQ41LHj4LmIttB6bnYvaU
 jZjynhBu+jWBTy1zUAJYNPchE89uG6oZmv1b9XiU02MdouiQIALuXot97foJoD3J5//4
 qMDODkcVHiHK1i+okxVf8t2mf5U6Kq8bzozhe2CYCUyZskCCwPLydFtBcK2HkBqoR4Fk
 fhQmNwzYpf8a6ojxtwEkqW6KVP/QkYjixyxgQ9Vk1Hi0yHqUqRpahJEQFl1E2sFC7gE8
 7pkg==
X-Gm-Message-State: APjAAAUia3UbQKB4vqd2bprer79Vbftg+dQDbEVTJbO5VlwK09OJz4UI
 I+OzDYcoGCLzUl2qH9Vvl1j7xg==
X-Google-Smtp-Source: APXvYqyz2oDf3zNhCGl1fmtqi/15XruskE/NYuyc7ppJN3wS25RsZliVSJ0Q+N3wlY6fZsbAF7WPyA==
X-Received: by 2002:a5d:4949:: with SMTP id r9mr24455367wrs.289.1565006607077; 
 Mon, 05 Aug 2019 05:03:27 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id x6sm88683668wrt.63.2019.08.05.05.03.26
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 05 Aug 2019 05:03:26 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: robh+dt@kernel.org
Subject: [RFCv2 2/9] dt-bindings: rng: amlogic,meson-rng: convert to yaml
Date: Mon,  5 Aug 2019 14:03:13 +0200
Message-Id: <20190805120320.32282-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190805120320.32282-1-narmstrong@baylibre.com>
References: <20190805120320.32282-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190805_050332_761417_5BC5A0A1 
X-CRM114-Status: GOOD (  11.05  )
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

Now that we have the DT validation in place, let's convert the device tree
bindings for the Amlogic Random Number generator over to a YAML schemas.

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
