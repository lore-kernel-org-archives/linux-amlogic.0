Return-Path: <SRS0=5tHY=YK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D45FCFA372B
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Oct 2019 05:07:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AAF312067B
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Oct 2019 05:07:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SpDojFPf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="SzsvBZ9C"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AAF312067B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ekRluYwbOPYlWFq9L7TzK1rM/6yWd5kznE7cuuoIU4s=; b=SpDojFPflSJG0K3YYzeNw9HAZG
	9rOg2F8Nluh0bWMJicv89h+AUKPj5i/QAjQ8i0kCQtfGCH9L3YpYBRsTKQ9GFVIteEGC34gAnWZ97
	2jHqICBvHfbSX9atHE96yBfoBUTmQRt2hkEdz/nR+4C2Ro9hOLy5RFwt65rlfc6V2+xHtRCL8y1gY
	UmMPseMRCkBdjWpLCCiHhflpAAr/F0R4mqPlOq7NieyBA24JWtDmpmKYofVuiRiciVYdmCTjWxGeQ
	CT+Fm1nwX22Ml6rAehdOO0f3jKdryyAca3oJf7cI4ajEHb6DvEZjy51ler5Oth1JHhOpGUWd50nuX
	xUi1tLbQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iKy0J-0002xj-Cc; Thu, 17 Oct 2019 05:07:15 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iKxzp-0002Xk-Jl
 for linux-amlogic@lists.infradead.org; Thu, 17 Oct 2019 05:06:49 +0000
Received: by mail-wm1-x344.google.com with SMTP id m18so1011041wmc.1
 for <linux-amlogic@lists.infradead.org>; Wed, 16 Oct 2019 22:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=BRTzBJT9wxY9zvUPoqtSUKkjTVA4C3pipCSGcwAFYZI=;
 b=SzsvBZ9CUknwuf0SrY/UVQaaoWaC3X+K9qksX1wDIslB/aeKcIhwdN4u0TcOP8qBnI
 k3C8L2EmMO4mhrQtKYSTlXbAxPQyfRwB7kjRsjosJPvTTReyFyBxZQ4wHgXisxSTrny+
 6yLX8u9tSLEUgw/JjgNHrf1ohD1231Xlx0YkPv3H9GCdOkDF67wZsn9Qye+XNh6dZHJb
 s0awQeI8vXn04ruUyUegspbhOZrtQ9uE6GZV5eABpAcSjLjQ24oM6VQkyAXuBwE3205b
 SdgMYJEGFmyqYczWhhjo7I+enFpBnjxCB7UeUwWpxFIznXil0p0TOqbrHKSduFaqcXTX
 AYiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=BRTzBJT9wxY9zvUPoqtSUKkjTVA4C3pipCSGcwAFYZI=;
 b=bXbf9QJoMbBpliiwPpRXGuSCkTOncAyt4g+p5yncThayoLLp/pDi4ClIG2qyKIVAQn
 Z1kZbK1DYVXKq6xoKYEml0vt9tVJDE4jwGR2GMLVTEbG1t0j4hgZdx4I0pNXsOxFVuJr
 2K2vMZxFFsVziVJRbqZc0BCDPmuuSvtBLVRiMKCTVSCcy2gWdoIxjArqQAWX7jJOVyw/
 a9EzSL2pdtqyka/VnJ5xMJuLvJ2klOMlVYIJEq3afI0jkI1dr7tyvI/3yDmAIs3juVcb
 B76ZlZgJt7apoPNvR7/EpwJe1d9dY1JW4Y6TRaDbcS410NMz5rSJJbeeH3iNz/aPH58/
 S3sA==
X-Gm-Message-State: APjAAAXVy2arhabANg7wW+mNi7O3sIpPtafD3vZyHOOSlS46/j0jZGla
 c7RlojzDy94p/9ZAQt7cu/pr1w==
X-Google-Smtp-Source: APXvYqx3W0fpmROG2eEQxff4VIENymtQ5SsisOWb5YimJDjwRgmDQr0BvAZ7nF2dqssq4ZCHhe3oBw==
X-Received: by 2002:a1c:a651:: with SMTP id p78mr1061869wme.53.1571288803395; 
 Wed, 16 Oct 2019 22:06:43 -0700 (PDT)
Received: from localhost.localdomain ([51.15.160.169])
 by smtp.googlemail.com with ESMTPSA id b5sm1010762wmj.18.2019.10.16.22.06.42
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 16 Oct 2019 22:06:42 -0700 (PDT)
From: Corentin Labbe <clabbe@baylibre.com>
To: davem@davemloft.net, herbert@gondor.apana.org.au, khilman@baylibre.com,
 mark.rutland@arm.com, robh+dt@kernel.org
Subject: [PATCH v3 1/4] dt-bindings: crypto: Add DT bindings documentation for
 amlogic-crypto
Date: Thu, 17 Oct 2019 05:06:23 +0000
Message-Id: <1571288786-34601-2-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1571288786-34601-1-git-send-email-clabbe@baylibre.com>
References: <1571288786-34601-1-git-send-email-clabbe@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191016_220645_646990_D0AC34FF 
X-CRM114-Status: GOOD (  10.97  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Corentin Labbe <clabbe@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patch adds documentation for Device-Tree bindings for the
Amlogic GXL cryptographic offloader driver.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 .../bindings/crypto/amlogic,gxl-crypto.yaml   | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml

diff --git a/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml b/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml
new file mode 100644
index 000000000000..5becc60a0e28
--- /dev/null
+++ b/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/crypto/amlogic,gxl-crypto.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic GXL Cryptographic Offloader
+
+maintainers:
+  - Corentin Labbe <clabbe@baylibre.com>
+
+properties:
+  compatible:
+    items:
+    - const: amlogic,gxl-crypto
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: "Interrupt for flow 0"
+      - description: "Interrupt for flow 1"
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: blkmv
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/gxbb-clkc.h>
+
+    crypto: crypto-engine@c883e000 {
+        compatible = "amlogic,gxl-crypto";
+        reg = <0x0 0xc883e000 0x0 0x36>;
+        interrupts = <GIC_SPI 188 IRQ_TYPE_EDGE_RISING>, <GIC_SPI 189 IRQ_TYPE_EDGE_RISING>;
+        clocks = <&clkc CLKID_BLKMV>;
+        clock-names = "blkmv";
+    };
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
