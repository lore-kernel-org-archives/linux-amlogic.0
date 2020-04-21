Return-Path: <SRS0=oV4S=6F=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EA70C2BA19
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Apr 2020 08:01:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D338720B1F
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Apr 2020 08:01:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="o3QczknJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="dqccmwCP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D338720B1F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XqPzczAU2Q08MkZskX+2AzrvfezPLSbr+Vd/PX1lI0Y=; b=o3QczknJ1PBdWt
	gvaU+kxzoSGg89BgpsIBteEZ+cdUT0VKmJHX/zd1g5N2Zxtkn2wAm/VuW9bGXPRTx/ARkN+1VY+1N
	5wWequFO5sKHUn+4BMoDo76cnmPGT2rphuVAWox+4UZsrqiFi/KBiqcdnbtS6giFGw3bEm0boH57+
	d1ehW49KGWugHBrwblLAIrvGROYjwRGBQxCIahrEn2dkPL+8ar8PlBVgd7fgNWzeCrcMmG45ZmklA
	bskTJ2l5ibWaRPAYd+KLhqXbca9BJNY9Ti9JniTjekXVAukB/7/iCj9esKT6mn/auC4/Kn9OtAJhI
	iT7zTJUD98IM1CVZu3kg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQnqa-0001UV-4d; Tue, 21 Apr 2020 08:01:36 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQnq9-00016s-Mu
 for linux-amlogic@lists.infradead.org; Tue, 21 Apr 2020 08:01:12 +0000
Received: by mail-wr1-x443.google.com with SMTP id j1so9906811wrt.1
 for <linux-amlogic@lists.infradead.org>; Tue, 21 Apr 2020 01:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XS8MLiD43HRCDGUhNCWbHcgAStwvWxC9A943TxLQEZ4=;
 b=dqccmwCPUeowj8HiqvQkLRNkuOeABsVeVjPM+aYtVdGHzR30TfxrgLOVQ1lBF8Zq5N
 Zm+BFJSq6bB/WLfyqH+0q2K+A77wqVXCuymPMdDSom8ufRIU4pMd2Q1Z2gbJ1UABDiw0
 AkjZVTl6POa+4J9BLZfMUJv8vTD7PSXZWHOUajpqlCgen4CVqPn8DLypKKU9BxfndNQU
 rESK9iZ84iwp8PY66iTHa+ykgf/1vnPYltV7QVv9WMOFB0+4D1h3+0peupb8kt0aTfCC
 H161G2/+KQz9ZPWWSEpcGWJPSR+c9UGTuzHDxePJ9eeDmHmlnMg9w0fxtv5jl88gdona
 XXWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XS8MLiD43HRCDGUhNCWbHcgAStwvWxC9A943TxLQEZ4=;
 b=cEHFcvV13JGnPU3jm2cWqaheGXf5QECceOfKY7OE5WZjhgxnA22g62e5c854HTMlen
 VD/NaUSuAEq7y6vFIt8GZGbY9sM/ScrK9nax6ZVO84lf6FI4PaEnrm6iHmC7LvjIZj5N
 dg0biZY+VHFqkPTtZUscIZjZLaiQpXao+Mh1PS0t/r5o/9Iprk2iN6s99QmTsNpE3tZv
 ROsLsRisG6RN+bYIaoDMohD8SXXdh63BT9/Z5WH+Y7I7w1Y+8nftYs8Ub+/EO7J2L3mk
 6V3WGGHhwm8PtJ1OnboZefUdRKoF5wfrGcdor2JZZGybDzfxryRDEX5pLK0OYhDB3YWn
 ClwA==
X-Gm-Message-State: AGi0PubqPiqjYE1RGpiMx5MBsH3XEKhRVUcMhhXDj8FLV//wKFwIYfAg
 fcruDebTFYeunSDEzSoF5N9pTw==
X-Google-Smtp-Source: APiQypL3ext83ZV7Ejx37wb5fdthOPJTVdWdGp7RREmAluHAuw2POo2GOmh2ApeG2micdKbP7iIQgQ==
X-Received: by 2002:adf:dc06:: with SMTP id t6mr21931763wri.385.1587456067996; 
 Tue, 21 Apr 2020 01:01:07 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:39cc:a07:8b48:cc56])
 by smtp.gmail.com with ESMTPSA id
 x132sm2561552wmg.33.2020.04.21.01.01.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 01:01:07 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: lee.jones@linaro.org, jdelvare@suse.com, linux@roeck-us.net,
 srinivas.kandagatla@linaro.org, devicetree@vger.kernel.org
Subject: [RFC 1/8] dt-bindings: mfd: add Khadas Microcontroller bindings
Date: Tue, 21 Apr 2020 10:00:55 +0200
Message-Id: <20200421080102.22796-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200421080102.22796-1-narmstrong@baylibre.com>
References: <20200421080102.22796-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200421_010109_766156_C0B9A1AA 
X-CRM114-Status: GOOD (  10.21  )
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
Cc: linux-hwmon@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, nick@khadas.com,
 linux-amlogic@lists.infradead.org, art@khadas.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This Microcontroller is present on the Khadas VIM1, VIM2, VIM3 and Edge
boards.

It has multiple boot control features like password check, power-on
options, power-off control and system FAN control on recent boards.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
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
