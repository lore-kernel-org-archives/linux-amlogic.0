Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60DFBC05027
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Feb 2023 13:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TrBBxEvL0qvKmlfrYGi4ni2fDijlMqalXPqQ6SK/9eU=; b=TKJigh4Jsxilh+
	tB3O5HCRKQ2/KFQqHpohU0LgcTysA9VHa/hgqjABi1y4wz4dh63ZKiA/Qef+Ay8vC62AU9iquHjt8
	hyfUWZ97s8eb1q3PRkQo1dEozrjNZd3BTKEXFadus04kQUpO6iL4qcBRe08TcwhfXXhR+RLc/98lI
	8BZ9+4YhFPtWiW/Y8ztd+Mu3S6aUwwTmoDLq6B/hCPz1VusYz7qi+0JtvPU1kwfVVpwmLNSmgMg+u
	q7ppVZwLt35QOY1w97xakj3CWL+tSuBWe/fMo9TY2ScZu6Pu/lXolZKGQJDZW+ZHjg6Wn1kl+rR1f
	o3FH9TBXbuu+LP9OdNzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ7Dd-001nZH-Ps; Thu, 09 Feb 2023 13:44:09 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ7BG-001mJk-Qx
	for linux-amlogic@lists.infradead.org; Thu, 09 Feb 2023 13:41:46 +0000
Received: by mail-wm1-x330.google.com with SMTP id bg26so1493485wmb.0
        for <linux-amlogic@lists.infradead.org>; Thu, 09 Feb 2023 05:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CU99A3qAz7AXXrQplpT1MuuDMQU9ldkAjGA2AqUf0T0=;
        b=ImlKFUeQ2taGX0SvIp26PSGxKa3dwwl1tmuZ5M06ujHzWh3hl3rd60sY83lv+qCenI
         0qSza1Y/OBLJB+j9fCJpRl32j0bK+sa8GFPagG81MyG0fN7r5iK+CVleCcV/URfEAB0f
         AVa9JouaiSTi2Viojvw8h2p3FFt9reL9nJzooThQQbCy5F9Awhulg9YjFhRrCKOAIc7y
         WqVkmKaX9fAxus7LCSrQlMrSF0mzvcuZ8TPCMbhx4G6LEjg8VmfnyCbGQChwu2/Td8uQ
         CXAgnnxdZ6xPgXTbLqTnea8RHfK0GHRaB/iw/beQkRv2WbIFDVj/qXFiSehgBSb+GDJQ
         h61g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CU99A3qAz7AXXrQplpT1MuuDMQU9ldkAjGA2AqUf0T0=;
        b=E9mrTrb1yKspjleY8pPFd1Qp2J9N9bVbfku/HwZVEfjfUNxnpRdhwIVMHeQ/HKDp7s
         iId3a9dUmnZ+NM439GbhI71EyYylw7XVgL3DXEiyqrygPxx0b95pV6ecNbtKlIdosGNN
         xoiMl3LwsJcT/gAfPDJgPQBcDTvHhO8x+vK8xLKTxa8dxAiurJgYo+HHgTxVDIpmBpXH
         jaiijhaOWHAZsM1xmGXObgDe5aXajx9sQJRdU3ma5WJOS0uoN97/ic1nuxvjQToSJacL
         eVkNw0+guWIOoxBGXWYpX+iv43ugEBGujRRSc9+qD/St35eZziRvbklqyS91m+FG/yfK
         lnIA==
X-Gm-Message-State: AO0yUKVuJ4dmg6sUBQpyj+PlqdZQmlliCbmrAwqR95i+N9Uyf5oXzXdj
	LReYBOc0ob30LH+2/lJ0oyfMRQ==
X-Google-Smtp-Source: AK7set9KbStsFCWSuek/BkTuzJIPXd3DaYisd2ak/58gga5zQlIerOgkiYECAD2ikHl+dqpxsBFq8g==
X-Received: by 2002:a05:600c:2e94:b0:3df:e46f:c226 with SMTP id p20-20020a05600c2e9400b003dfe46fc226mr9731856wmn.16.1675950100407;
        Thu, 09 Feb 2023 05:41:40 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id k12-20020a7bc40c000000b003dfe549da4fsm4946991wmi.18.2023.02.09.05.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 05:41:39 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 09 Feb 2023 14:41:37 +0100
Subject: [PATCH 1/6] dt-bindings: rtc: convert rtc-meson-vrtc.txt to
 dt-schema
MIME-Version: 1.0
Message-Id: <20230209-b4-amlogic-bindings-convert-take2-v1-1-c4fe9049def9@linaro.org>
References: <20230209-b4-amlogic-bindings-convert-take2-v1-0-c4fe9049def9@linaro.org>
In-Reply-To: <20230209-b4-amlogic-bindings-convert-take2-v1-0-c4fe9049def9@linaro.org>
To: Alessandro Zummo <a.zummo@towertech.it>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_054142_992206_C49EE838 
X-CRM114-Status: GOOD (  15.13  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Convert the Amlogic Virtual RTC bindings to dt-schema.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../bindings/rtc/amlogic,meson-vrtc.yaml           | 42 ++++++++++++++++++++++
 .../devicetree/bindings/rtc/rtc-meson-vrtc.txt     | 22 ------------
 2 files changed, 42 insertions(+), 22 deletions(-)

diff --git a/Documentation/devicetree/bindings/rtc/amlogic,meson-vrtc.yaml b/Documentation/devicetree/bindings/rtc/amlogic,meson-vrtc.yaml
new file mode 100644
index 000000000000..1d5694c08965
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/amlogic,meson-vrtc.yaml
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/amlogic,meson-vrtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic Virtual RTC (VRTC)
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+
+description:
+  The interface is 1 register where an alarm time (in seconds) is to be written.
+
+  The alarm register is a simple scratch register shared between the
+  application processors (AP) and the secure co-processor (SCP).
+  When the AP suspends, the SCP will use the value of this register to
+  program an always-on timer before going sleep. When the timer expires,
+  the SCP will wake up and will then wake the AP.
+
+allOf:
+  - $ref: rtc.yaml#
+
+properties:
+  compatible:
+    const: amlogic,meson-vrtc
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    vrtc: rtc@a8 {
+        compatible = "amlogic,meson-vrtc";
+        reg = <0x000a8 0x4>;
+    };
diff --git a/Documentation/devicetree/bindings/rtc/rtc-meson-vrtc.txt b/Documentation/devicetree/bindings/rtc/rtc-meson-vrtc.txt
deleted file mode 100644
index c014f54a9853..000000000000
--- a/Documentation/devicetree/bindings/rtc/rtc-meson-vrtc.txt
+++ /dev/null
@@ -1,22 +0,0 @@
-* Amlogic Virtual RTC (VRTC)
-
-This is a Linux interface to an RTC managed by firmware, hence it's
-virtual from a Linux perspective.  The interface is 1 register where
-an alarm time (in seconds) is to be written.
-
-Required properties:
-- compatible: should be "amlogic,meson-vrtc"
-- reg: physical address for the alarm register
-
-The alarm register is a simple scratch register shared between the
-application processors (AP) and the secure co-processor (SCP.)  When
-the AP suspends, the SCP will use the value of this register to
-program an always-on timer before going sleep. When the timer expires,
-the SCP will wake up and will then wake the AP.
-
-Example:
-
-	vrtc: rtc@0a8 {
-		compatible = "amlogic,meson-vrtc";
-		reg = <0x0 0x000a8 0x0 0x4>;
-	};

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
