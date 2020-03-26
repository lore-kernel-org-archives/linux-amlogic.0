Return-Path: <SRS0=29RQ=5L=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE55FC2D0E5
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Mar 2020 13:46:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E26C2076A
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Mar 2020 13:46:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MKO8g+ap";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="mFk1SjUO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E26C2076A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3cKAGD+IcKKjY2lx+j07UQDhxZvMAZcvxWWGWGDfUaQ=; b=MKO8g+apo84N/n
	0Wj2HaVlNsh1ghmkcGGNgB2B4jjBVkpyDNxMdPQ72p8aMjsyvqB88VJrS/Q3opMy6KvIPyVYDN7ca
	q23kY/KesERYl3m02dXgyQFPSyvZ8mmb9Fv+KwKj3QuUqYe0QxH0idBg+oFJ7eRUNJh3JS7cSZPsc
	pgcYhEuSzLYD/+wMVoqkR0OalELkMNyvXZ4k2/R0MkelSEz1vB9jUXnIRjOtXuf2GM6UlRObKfleq
	xuatQgDOvXsW2lB/dZvZkDVM3rogjEB+X7VZEY9Lr0WnvyioUve9w00CMK/tcKH5DssY8ZDHQSCOE
	uvNgTaoFXmDnpppRBQtw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHSpY-0006D5-5Q; Thu, 26 Mar 2020 13:45:56 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHSoq-0005Zp-WD
 for linux-amlogic@lists.infradead.org; Thu, 26 Mar 2020 13:45:14 +0000
Received: by mail-wr1-x441.google.com with SMTP id w10so7890207wrm.4
 for <linux-amlogic@lists.infradead.org>; Thu, 26 Mar 2020 06:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aUt5da61uLANGwJFYYiA7zZjRTcSYMRB6icGf3vbU0k=;
 b=mFk1SjUOpWFCWV3w8NUixREHmK4vDmUPsSbxrhNEvoMQoUozHNBVhh/84MOqcYKSh4
 7nnQSLIvwIGGnrge7xHSEy+jXUSNnfwpa6LhrX9eAMWzJjJiiFyCERkVmpWT/0X+IHJp
 hBP+BoSqsf+Q37GSlozIUGbJ+fEah8GfsiwgnpMN6JJ+K+5njBrV+P684va9X1vP3Jac
 OFWwYXyUQr/zClqzm2tBNy7zpw31A8oiD6cQiuvCPFaasRz4jET2QoPmVugn6+FCyGJp
 eVvBiQ7KakQsVkpFf5EDlE8/uLsoU/Jas0eIgTClWTl70sS13Y3YmZxoa1yS4wXFNUaw
 I3bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aUt5da61uLANGwJFYYiA7zZjRTcSYMRB6icGf3vbU0k=;
 b=HpOKWqJhMvNTlOEHDIcQxYhGUO2PMxWPv1nnnrVX+a89qBPS5cldutBgyxqHg7dphA
 ao1d34v6U4RScqDmYhT3HNNjFVHAlQIti/hRWhcqsMqRMGX4r4iHxcltTzMvKbp5J264
 HOIulTF9Du/JNdcdhpq0P4Mh35UA4fnmhWX2aB9gMNbylnEIuWLROgAfqNZMqu1gxxY7
 KCx9pZvlycNowM/nKA+hRWqCeEz3EvGveTT0g2hrrfkJx4J0Y/GdxmQRg3cw2ggZln0f
 OfjR2qD8AQFMuV4Pnpd8JEveILrqFDupBWuZhTa2jDsKie55zvxWt4dxPJyHK0ixx43f
 IjcQ==
X-Gm-Message-State: ANhLgQ0L543pb6tVSCbW3aBrDQlRk0eVDH/7ovBMZC8HzaIkimX7vdti
 Vo4ejRs7ASGz3T7zlMxoFAyZiw==
X-Google-Smtp-Source: ADFU+vt66+XPqsyLeO+POW2yrcqbRJYseC7D+4t4IRvUw/9oFw1qz5OYThNV1WSSuwK+mezl4JqO8Q==
X-Received: by 2002:a5d:4d07:: with SMTP id z7mr9105092wrt.89.1585230311563;
 Thu, 26 Mar 2020 06:45:11 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5c5f:613e:f775:b6a2])
 by smtp.gmail.com with ESMTPSA id h29sm4079617wrc.64.2020.03.26.06.45.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Mar 2020 06:45:11 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: kishon@ti.com, balbi@kernel.org, khilman@baylibre.com,
 martin.blumenstingl@googlemail.com, devicetree@vger.kernel.org
Subject: [PATCH v2 01/14] dt-bindings: usb: amlogic,
 meson-g12a-usb-ctrl: add the Amlogic GXL and GXM Families USB Glue
 Bindings
Date: Thu, 26 Mar 2020 14:44:53 +0100
Message-Id: <20200326134507.4808-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200326134507.4808-1-narmstrong@baylibre.com>
References: <20200326134507.4808-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200326_064513_052918_89C59BCC 
X-CRM114-Status: UNSURE (   8.92  )
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
Cc: linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The Amlogic GXL and GXM is slightly different from the Amlogic G12A Glue.

The GXL SoCs only embeds 2 USB2 PHYs and no USB3 PHYs, and the GXM SoCs
embeds 3 USB2 PHYs.

Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../usb/amlogic,meson-g12a-usb-ctrl.yaml      | 73 ++++++++++++++++++-
 1 file changed, 69 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml b/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml
index b0e5e0fe9386..b0af50a7c124 100644
--- a/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml
+++ b/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml
@@ -25,9 +25,13 @@ description: |
   The Amlogic A1 embeds a DWC3 USB IP Core configured for USB2 in
   host-only mode.
 
+  The Amlogic GXL & GXM SoCs doesn't embed an USB3 PHY.
+
 properties:
   compatible:
     enum:
+      - amlogic,meson-gxl-usb-ctrl
+      - amlogic,meson-gxm-usb-ctrl
       - amlogic,meson-g12a-usb-ctrl
       - amlogic,meson-a1-usb-ctrl
 
@@ -41,6 +45,11 @@ properties:
 
   clocks:
     minItems: 1
+    maxItems: 3
+
+  clock-names:
+    minItems: 1
+    maxItems: 3
 
   resets:
     minItems: 1
@@ -52,10 +61,8 @@ properties:
     maxItems: 1
 
   phy-names:
-    items:
-      - const: usb2-phy0 # USB2 PHY0 if USBHOST_A port is used
-      - const: usb2-phy1 # USB2 PHY1 if USBOTG_B port is used
-      - const: usb3-phy0 # USB3 PHY if USB3_0 is used
+    minItems: 1
+    maxItems: 3
 
   phys:
     minItems: 1
@@ -89,6 +96,61 @@ required:
   - dr_mode
 
 allOf:
+  - if:
+      properties:
+        compatible:
+          enum:
+            - amlogic,meson-g12a-usb-ctrl
+
+    then:
+      properties:
+        phy-names:
+          items:
+            - const: usb2-phy0 # USB2 PHY0 if USBHOST_A port is used
+            - const: usb2-phy1 # USB2 PHY1 if USBOTG_B port is used
+            - const: usb3-phy0 # USB3 PHY if USB3_0 is used
+  - if:
+      properties:
+        compatible:
+          enum:
+            - amlogic,meson-gxl-usb-ctrl
+
+    then:
+      properties:
+        clocks:
+          minItems: 2
+        clock-names:
+          items:
+            - const: usb_ctrl
+            - const: ddr
+        phy-names:
+          items:
+            - const: usb2-phy0 # USB2 PHY0 if USBHOST_A port is used
+            - const: usb2-phy1 # USB2 PHY1 if USBOTG_B port is used
+      required:
+        - clock-names
+  - if:
+      properties:
+        compatible:
+          enum:
+            - amlogic,meson-gxm-usb-ctrl
+
+    then:
+      properties:
+        clocks:
+          minItems: 2
+        clock-names:
+          items:
+            - const: usb_ctrl
+            - const: ddr
+        phy-names:
+          items:
+            - const: usb2-phy0 # USB2 PHY0 if USBHOST_A port is used
+            - const: usb2-phy1 # USB2 PHY1 if USBOTG_B port is used
+            - const: usb2-phy2 # USB2 PHY2 if USBOTG_C port is used
+
+      required:
+        - clock-names
   - if:
       properties:
         compatible:
@@ -97,6 +159,9 @@ allOf:
 
     then:
       properties:
+        phy-names:
+          items:
+            - const: usb2-phy1 # USB2 PHY1 if USBOTG_B port is used
         clocks:
           minItems: 3
         clock-names:
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
