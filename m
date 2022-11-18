Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5DA3C4332F
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Nov 2022 15:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ccpT7053BWQ+JklF4fwuDwcnTf/QBSk0yTcL4ZP0G74=; b=zt6jPQWVCOeH8O
	9CSTOJSh8gQYPB6UYEVw+MRkfbnW4gOyvM/8c3nj1WaFBrnTQXaCjM8J6mmy1h0fXj6dkv/4m/CLZ
	MFBZFN1SEei4Y1sjPmdEIEP2dFqnom8Tq8+j6DIL79eaQ3CzavYC2qJnxr+J9WTxGmIk5H/WxEhR1
	avRxVWrkAzMtLSCf/xtqsL55Ehb6KI26F5SIrmiBEO/l6J1Xb9wnz5IiYwM68nIF3YXQq23xE0z5Y
	Ez5wcQH+QtaESBPBGDUP5JxdhGwcskb50yQSw2I0U/ig4nJz3Gf0aJ/X8EhuAnMuJEThRxwedIgQ6
	UxIcsMhprr3db7I2P5XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow3Zl-0052LX-8S; Fri, 18 Nov 2022 15:46:45 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow2R2-004TeD-Iy
	for linux-amlogic@lists.infradead.org; Fri, 18 Nov 2022 14:33:44 +0000
Received: by mail-wm1-x32f.google.com with SMTP id t1so3741268wmi.4
        for <linux-amlogic@lists.infradead.org>; Fri, 18 Nov 2022 06:33:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I8lUWDOeXjkH9UHmo38dtGs19w/rqs9Sy4VJSCBQlaI=;
        b=oDWz/pVsf+cFAzOAOBv41AAAHEW5ljeCUEwzki0jVdZ1JNRLYDVZqUUxfbHny9q643
         fO4ZpGeaHPCMjmBzrPADNC+gBiHTXx7m6eypZMNLgI27Ozc/hPzmnJKtuj7jyGu1effk
         3H0eauS3fMm/TYNuSxfmDQ/DLUGxByrvAB1couqbfCMQOA39ujMBvf5e3W7Yxtz6qzj9
         E1Qf3Ff9AT8I7Mr1E7zseEaF7WH75RqoMCMFUMCw2Tx5tKaSpOMneq3yhCrb/0OpRw/2
         A1lhamyhxw/X19HDLcgQgqS27L4V3Cf+8/wuOdhrHgn6+txxa2lcydl91VSTbLk5Ip1r
         3+OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I8lUWDOeXjkH9UHmo38dtGs19w/rqs9Sy4VJSCBQlaI=;
        b=sqEod+QWrxbfuqKKMGflN31FDS05KVk3llGGSmJykiXEiRftFX2O1scnq2PCaoZDk+
         x5lfU6/MKVBThV8Md37mx6QzRVq2SckpYThbAzDNrCqWJhMspWikHnq1v/8R+xU6HAM3
         YPgX2Vo981L59sta1tBY3MVH5vy+zILuQU0S3812JPJuoe+9s9G5XEnUpq3MbnT83FRD
         x5EryvNyTeca/uc6nzMFDdMXPSfYwyu1yeUA8DTS1637TpC1vOlQP+vGXeBgTuiI/mDF
         BPVMWp31Eb3AIIY5qAfl6th6/0lbl29zlKglLfvZ227pTuKJV9hf8TTPaetvHemZyFrY
         Verg==
X-Gm-Message-State: ANoB5plSPXRKsJjNkY0Gwml6H6rpxzMOhB57MRBptD8Bc6IUw4r416xW
	jBOpbBbx/V7y8xU9RWryoifgCw==
X-Google-Smtp-Source: AA0mqf58oHI/7To3+CZoBl7djIZXtAy//xIgmpt08lgvBcuLlZjN5W390xyBDOKkHM9CY2J0U3XElg==
X-Received: by 2002:a7b:cd85:0:b0:3cf:931c:3cfa with SMTP id y5-20020a7bcd85000000b003cf931c3cfamr5085059wmj.203.1668782016660;
        Fri, 18 Nov 2022 06:33:36 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id j21-20020a05600c1c1500b003cfb7c02542sm5436726wms.11.2022.11.18.06.33.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 06:33:36 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 18 Nov 2022 15:33:30 +0100
Subject: [PATCH 04/12] dt-bindings: watchdog: convert meson-wdt.txt to dt-schema
MIME-Version: 1.0
Message-Id: <20221117-b4-amlogic-bindings-convert-v1-4-3f025599b968@linaro.org>
References: <20221117-b4-amlogic-bindings-convert-v1-0-3f025599b968@linaro.org>
In-Reply-To: <20221117-b4-amlogic-bindings-convert-v1-0-3f025599b968@linaro.org>
To: Jakub Kicinski <kuba@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Rob Herring <robh+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Alessandro Zummo <a.zummo@towertech.it>, Eric Dumazet <edumazet@google.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Kevin Hilman <khilman@baylibre.com>, Ulf Hansson <ulf.hansson@linaro.org>, Heiner Kallweit <hkallweit1@gmail.com>,
 Vinod Koul <vkoul@kernel.org>, Russell King <linux@armlinux.org.uk>, Thomas Gleixner <tglx@linutronix.de>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>, Paolo Abeni <pabeni@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Cc: linux-media@vger.kernel.org, netdev@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-mmc@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>, devicetree@vger.kernel.org
X-Mailer: b4 0.10.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_063340_681525_BA7700A0 
X-CRM114-Status: GOOD (  13.49  )
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

Convert the Amlogic Meson6 SoCs Watchdog timer bindings to dt-schema.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../bindings/watchdog/amlogic,meson6-wdt.yaml      | 39 ++++++++++++++++++++++
 .../devicetree/bindings/watchdog/meson-wdt.txt     | 21 ------------
 2 files changed, 39 insertions(+), 21 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/amlogic,meson6-wdt.yaml b/Documentation/devicetree/bindings/watchdog/amlogic,meson6-wdt.yaml
new file mode 100644
index 000000000000..4e33a5a9c23c
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/amlogic,meson6-wdt.yaml
@@ -0,0 +1,39 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/amlogic,meson6-wdt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic Meson6 SoCs Watchdog timer
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+  - Martin Blumenstingl <martin.blumenstingl@googlemail.com>
+
+allOf:
+  - $ref: watchdog.yaml#
+
+properties:
+  compatible:
+    enum:
+      - amlogic,meson6-wdt
+      - amlogic,meson8-wdt
+      - amlogic,meson8b-wdt
+      - amlogic,meson8m2-wdt
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
+    wdt: watchdog@c1109900 {
+        compatible = "amlogic,meson6-wdt";
+        reg = <0xc1109900 0x8>;
+        timeout-sec = <10>;
+    };
diff --git a/Documentation/devicetree/bindings/watchdog/meson-wdt.txt b/Documentation/devicetree/bindings/watchdog/meson-wdt.txt
deleted file mode 100644
index 7588cc3971bf..000000000000
--- a/Documentation/devicetree/bindings/watchdog/meson-wdt.txt
+++ /dev/null
@@ -1,21 +0,0 @@
-Meson SoCs Watchdog timer
-
-Required properties:
-
-- compatible : depending on the SoC this should be one of:
-	"amlogic,meson6-wdt" on Meson6 SoCs
-	"amlogic,meson8-wdt" and "amlogic,meson6-wdt" on Meson8 SoCs
-	"amlogic,meson8b-wdt" on Meson8b SoCs
-	"amlogic,meson8m2-wdt" and "amlogic,meson8b-wdt" on Meson8m2 SoCs
-- reg : Specifies base physical address and size of the registers.
-
-Optional properties:
-- timeout-sec: contains the watchdog timeout in seconds.
-
-Example:
-
-wdt: watchdog@c1109900 {
-	compatible = "amlogic,meson6-wdt";
-	reg = <0xc1109900 0x8>;
-	timeout-sec = <10>;
-};

-- 
b4 0.10.1

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
