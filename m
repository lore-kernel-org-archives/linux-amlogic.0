Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64693C4167B
	for <linux-amlogic@archiver.kernel.org>; Thu, 30 Nov 2023 05:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0g23OeqvGTZLUs4QmW6vJR2A0Wo5Vz2ehGAFqEQanX0=; b=FZKRSWpgaRoHRb
	2D++9PmDFP1QB1pjHyUGiZMrdIYVRqtxc/tmMQwK12wvxPfaPWrAgBHcoorB4lq8uc+gS3yjEMtmb
	WaZs/Z8XY70sc0hKjQmyv8oW5y1DNpZCdGxNa9/nlMt/DDnb268X2Q40YGOiIx3852+MmapW53Q41
	pqvJlaZOvxAK7DMthFmDqe/kS8LMmdLWZeS3bhimOWXPyQ3T0JRflpl8Zbm+z0udpg8nX86I6ZU6c
	jVdxRf2FfIxAkk6YgfFS4NhgDp+4LdPToPV88IWxd2jK3eeMAUNeXFq6SpTadPIss8Z45C6YgLuMJ
	k52qa1d5beTef4DKQBrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8Zed-009yGm-2J;
	Thu, 30 Nov 2023 05:32:03 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8Zea-009yG8-13
	for linux-amlogic@lists.infradead.org;
	Thu, 30 Nov 2023 05:32:02 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1cfbda041f3so5531775ad.2
        for <linux-amlogic@lists.infradead.org>; Wed, 29 Nov 2023 21:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701322317; x=1701927117; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vtLcNogZL4zUE1VKwwbOaAKoW0e8MSfA/IN4DJLgKRM=;
        b=I6Tpwex0Y3u1eZ1Q00B7dKLoGlCIXpVlw+HzzYzRE/2TQLwNsz5Cr+1K5PS6xK2WaX
         vCFGu997QxR8QEI8XaZT1J5Ythz8Psmcx/JKLCsrEg9jwcRuIk5UWUP0Xk91uFVWr3HI
         5706fucmjdgmZLFP+5gBkPz9PYVsNlWa0ze8Xw97BsWrmuWzjiwJ+Ln20fcd86aUWf5X
         e8nadIxrwWHsZpP/0CqPdO3OtXIiDO1TrsGpgWxBsyCDmATH70BHlO1G4KJFxNH6QrjB
         qEIBi6XN5t5p0TTirmCKXxx92CjjOJiSTw2higrgSZplwvgxmwzCFhP2Coch5IjVzme8
         WY2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701322317; x=1701927117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vtLcNogZL4zUE1VKwwbOaAKoW0e8MSfA/IN4DJLgKRM=;
        b=RG9/L+WuGq3S5NGrEuCSofASpM8jITdzzsvqhFCtrpmtsWtgV8iilv6iDUItu0O1Z3
         JVuw1UcNkNv9MScdOw7qeh84UvAhT6wze4zWENyre157oJcZ73E8oLqYG/gSyGWaNf8u
         EChi1cgfwhw/JOOA5zzO6qZU+VPhOWjYYYb+7NIZ0fV10tfTNqCDwMp7/bn9QlyWf5ux
         /hO9L3T0sGtan0fl1zIfaVnoihHRX2MBYNGXcXMLBaL4UB0hlj/hsSyAW6veGMDYmOiM
         yXFWdoNUohgZRqHJwnC7VfiPslQPMF/2Ny7N8fre031S/HhdRxVABUUWNa/3axrbGqtj
         QXkQ==
X-Gm-Message-State: AOJu0YxI7r/6a13DtrNsum92tjkUhj+91lun84B1u1N/XxnyXV3BuEyd
	xfHR0cktYVMqDVEIOZx9RvQ=
X-Google-Smtp-Source: AGHT+IGvSDeAfCHQWlmojU1BSM6aAFhh7G+Sujt9p/79qfJ5k9x/f9CssKKroYjciNFXQI2GwHUYFA==
X-Received: by 2002:a17:902:dac1:b0:1cf:edd5:f783 with SMTP id q1-20020a170902dac100b001cfedd5f783mr10924289plx.15.1701322317321;
        Wed, 29 Nov 2023 21:31:57 -0800 (PST)
Received: from localhost.localdomain ([49.205.245.83])
        by smtp.gmail.com with ESMTPSA id t5-20020a170902a5c500b001cfad1a60cesm336330plq.137.2023.11.29.21.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 21:31:56 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Icenowy Zheng <uwu@icenowy.me>
Cc: Anand Moon <linux.amoon@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-amlogic@lists.infradead.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/2] dt-bindings: usb: Add the binding example for the Genesys Logic GL3523 hub
Date: Thu, 30 Nov 2023 11:01:26 +0530
Message-ID: <20231130053130.21966-2-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231130053130.21966-1-linux.amoon@gmail.com>
References: <20231130053130.21966-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_213200_385872_D9785570 
X-CRM114-Status: GOOD (  15.63  )
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

Add the binding example for the USB3.1 Genesys Logic GL3523
integrates with USB 3.1 Gen 1 Super Speed and USB 2.0 High-Speed
hub.

For onboard hub controllers that support USB 3.x and USB 2.0 hubs
with shared resets and power supplies, this property is used to identify
the hubs with which these are shared.

[Conor Dooley: upgrade peer-hub description]
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v5: upgrade peer-hub description : Conor Dooley
[0] https://www.genesyslogic.com.tw/en/product_view.php?show=67 [Block Diagram]
v4: Fix the description of peer-hub and update the commit message.
Schematics of the Odroid N2+
https://dn.odroid.com/S922X/ODROID-N2/Schematic/odroid-n2_rev0.6_20210121.pdf
V3: fix the dt_binding_check error, added new example for Genesys GL3523
v2: added Genesys GL3523 binding
v1: none
---
 .../bindings/usb/genesys,gl850g.yaml          | 65 +++++++++++++++++--
 1 file changed, 61 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml b/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
index ee08b9c3721f..499192ea4074 100644
--- a/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
+++ b/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
@@ -9,9 +9,6 @@ title: Genesys Logic USB hub controller
 maintainers:
   - Icenowy Zheng <uwu@icenowy.me>
 
-allOf:
-  - $ref: usb-device.yaml#
-
 properties:
   compatible:
     enum:
@@ -27,12 +24,46 @@ properties:
 
   vdd-supply:
     description:
-      the regulator that provides 3.3V core power to the hub.
+      phandle to the regulator that provides power to the hub.
+
+  peer-hub:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      For onboard hub controllers that support USB 3.x and USB 2.0 hubs
+      with shared resets and power supplies, this property is used to identify
+      the hubs with which these are shared.
 
 required:
   - compatible
   - reg
 
+allOf:
+  - $ref: usb-device.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - usb5e3,608
+    then:
+      properties:
+        peer-hub: false
+        vdd-supply: false
+        reset-gpios: true
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - usb5e3,610
+              - usb5e3,620
+    then:
+      properties:
+        peer-hub: true
+        vdd-supply: true
+        reset-gpios: true
+
 additionalProperties: false
 
 examples:
@@ -49,3 +80,29 @@ examples:
             reset-gpios = <&pio 7 2 GPIO_ACTIVE_LOW>;
         };
     };
+
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    usb {
+        dr_mode = "host";
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        /* 2.0 hub on port 1 */
+        hub_2_0: hub@1 {
+            compatible = "usb5e3,610";
+            reg = <1>;
+            peer-hub = <&hub_3_0>;
+            reset-gpios = <&gpio 20 GPIO_ACTIVE_LOW>;
+            vdd-supply = <&vcc_5v>;
+        };
+
+        /* 3.1 hub on port 4 */
+        hub_3_0: hub@2 {
+            compatible = "usb5e3,620";
+            reg = <2>;
+            peer-hub = <&hub_2_0>;
+            reset-gpios = <&gpio 20 GPIO_ACTIVE_LOW>;
+            vdd-supply = <&vcc_5v>;
+        };
+    };
-- 
2.42.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
