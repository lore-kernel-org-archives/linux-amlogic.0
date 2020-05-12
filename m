Return-Path: <SRS0=k9nf=62=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06D0FC54E8E
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 May 2020 13:26:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCC14206F5
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 May 2020 13:26:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nhcU7oo9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="H7zv+pIK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CCC14206F5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Blc+n/4ww+GuF/2OfZq9CQ8ql7LGbRbcbUONJg26Uko=; b=nhcU7oo90kMa4O
	Feph4EgfabBz8oFiXDjLxcZLEAeaUv1hzDqsJRIeFwuapdnzSgSk6ZivXKZnOc0YMXERLDGw8JSsP
	DTgHvs5FlyZlsQivyeE/HrLfKX1JZPEJXxv4R7rPK6IlYXFlTowou5iwGJYxEpsM8YZcDAw35iXTE
	vVpSGhDZzlu/izzaajV1FX1Ido+e2J53/O/fJ1scm/r8PukEHqCoOfik3BMoLS+KUJFf0GjPiwDW4
	gjg/XCBsodZxOFyxsobmZjTN7Qr02xkHqZ/JfIfNk4szJLpaFTMCuGNKRKClAORLCbvSTN46FhlbJ
	9JcP80mzqqlKC7/YmFtw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYUvg-0001ma-Ea; Tue, 12 May 2020 13:26:40 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYUvM-0001U3-DQ
 for linux-amlogic@lists.infradead.org; Tue, 12 May 2020 13:26:23 +0000
Received: by mail-wr1-x444.google.com with SMTP id v12so15338471wrp.12
 for <linux-amlogic@lists.infradead.org>; Tue, 12 May 2020 06:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Lm/JhSU6WIUD9liaClHiq2/rbC+K/Ls1HtNWMD1Nn2A=;
 b=H7zv+pIKMn1DFXWX7wYhzX5b9gbDPxAk9SE9ltGb5WnBojjIrTWGwZ7FVO7YXf1AoR
 COZHSxtOlkVLwcmTh97ohzAq4n9C7J6uHa4n4D27rkj+w/kfYeWrBD3lktPkCBd7OyNK
 O8P/pCK5xonSvWm29SHHyKomqkG8A+B7SHPE0Hdxxub08pQdFMBOAnAQGaUN+jnC5W1I
 DAw62gdKYZhW3y6Pzrg+noXMZ4eeW1RZlY/S2D9py4Eofn7OiX980AilKycW3g3jxVMX
 STxvCkdIKo7Txkpgq0z0bR0Ka58vlC02RDjsUwtAdg3aW0j9ktnqbckm4J6OXV57CjW8
 0RSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Lm/JhSU6WIUD9liaClHiq2/rbC+K/Ls1HtNWMD1Nn2A=;
 b=B0aoCQOJnc5zzhr8MTVTjBd7t9YJhQq6SpSWSv5JAGrIQ+vrRfdNtzDWmOvh5ih0pN
 3sc+3303luiYkEFYejr+4C+a/18rMs7fcslMprp8DpgRBQiocyeqiBwYWmkekraMGlWV
 k5kgrtbNJDLwHSMyY1rfBM7lGSTR4uySQ/0VW1acBd8uouoVfN55Iis9MTkfgXrU/Mtc
 j7/6DzE8qrr9NpRzAcGx2xQB/LosmRt5jVKmsjY0/4mje0XiFhQjBmdgewhhEgceDasT
 vkVA/ewvjKQ6AeacZj2ssQRCFEwVL9L3QQzFu6PEu5b997kB9mzTku4sdm16009sPFy1
 YEWQ==
X-Gm-Message-State: AGi0PuaWKg6Bx2IEtkiKMKGG2juf5KPJwlwfLLfSn8vr73fqbChj+H5P
 JsaN9JGDeHwn/IhIRIngMk6ihg==
X-Google-Smtp-Source: APiQypIMA843k3ZGcFq05wJywOzCbRuZBo362vVj3No/BJt89ev1hi92yc4IMHltKbZdcHKKO8Tw5g==
X-Received: by 2002:a5d:4d0f:: with SMTP id z15mr24948754wrt.411.1589289979092; 
 Tue, 12 May 2020 06:26:19 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:4460:3fd3:382:4a71])
 by smtp.gmail.com with ESMTPSA id
 g15sm14441844wro.71.2020.05.12.06.26.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 06:26:18 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: lee.jones@linaro.org, rui.zhang@intel.com, daniel.lezcano@linaro.org,
 amit.kucheria@verdurent.com, srinivas.kandagatla@linaro.org,
 devicetree@vger.kernel.org
Subject: [PATCH v2 1/6] dt-bindings: mfd: add Khadas Microcontroller bindings
Date: Tue, 12 May 2020 15:26:08 +0200
Message-Id: <20200512132613.31507-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200512132613.31507-1-narmstrong@baylibre.com>
References: <20200512132613.31507-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200512_062620_451841_5CAF3C35 
X-CRM114-Status: GOOD (  10.32  )
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
Cc: Rob Herring <robh@kernel.org>, linux-pm@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This Microcontroller is present on the Khadas VIM1, VIM2, VIM3 and Edge
boards.

It has multiple boot control features like password check, power-on
options, power-off control and system FAN control on recent boards.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/mfd/khadas,mcu.yaml   | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/khadas,mcu.yaml

diff --git a/Documentation/devicetree/bindings/mfd/khadas,mcu.yaml b/Documentation/devicetree/bindings/mfd/khadas,mcu.yaml
new file mode 100644
index 000000000000..a3b976f101e8
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/khadas,mcu.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/khadas,mcu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Khadas on-board Microcontroller Device Tree Bindings
+
+maintainers:
+  - Neil Armstrong <narmstrong@baylibre.com>
+
+description: |
+  Khadas embeds a microcontroller on their VIM and Edge boards adding some
+  system feature as PWM Fan control (for VIM2 rev14 or VIM3), User memory
+  storage, IR/Key resume control, system power LED control and more.
+
+properties:
+  compatible:
+    enum:
+      - khadas,mcu # MCU revision is discoverable
+
+  "#cooling-cells": # Only needed for boards having FAN control feature
+    const: 2
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      khadas_mcu: system-controller@18 {
+        compatible = "khadas,mcu";
+        reg = <0x18>;
+        #cooling-cells = <2>;
+      };
+    };
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
