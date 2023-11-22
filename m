Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 835D2C61D9D
	for <linux-amlogic@archiver.kernel.org>; Wed, 22 Nov 2023 18:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KNh7Sw9wJX+chEMWbGtsRxhUDv1epWggGIIHlgxYjI0=; b=ODwcsbxXnYSl2H
	ZkFqqwmekG+zg43OIEhiwDcRSrw80GT2A/VIPw/HFs9222hHxV+JrfKaAryRDmCujT/f9Wt8n/uPT
	7EWEI6Y4UgWdDidG8H/8Op3OLJ3u/sUxwubMgrjqn4rGv49roa4lOV3YMMOibYkESE+s6xGErZK39
	xbDduxeWqaHRCNIYYHDQKWvux50EnJbpGk2MlUxWUdOCpIXxhfluVsWAjXIEV5AHWpRc7UYVwi6SJ
	shy1YJmY1iioz/agVZv17eJP5yd9pd4wTzacot1Aj7Kg5qvTYT5FCa13Gq10sOc1VSAJStNHPbS9i
	bO+FACoatnbPgiunNbuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5rtk-002oUv-0X;
	Wed, 22 Nov 2023 18:24:28 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5rth-002oTC-1i
	for linux-amlogic@lists.infradead.org;
	Wed, 22 Nov 2023 18:24:27 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1cc29f39e7aso452515ad.0
        for <linux-amlogic@lists.infradead.org>; Wed, 22 Nov 2023 10:24:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700677464; x=1701282264; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MjfB/97B7loi+XRCLgCE3Hiw3P88msCGByWuf340tpY=;
        b=mjQz+/+ZOnrr3ik1qPASEIg0H7oQ/1qjOLDspT2+4UmD/HqB6kCS92G6qDGudNnutF
         PMs7RPwyTnmBXqA/9JCTLUpl7k+tBgQ9R2qn5DEtXkR22cdULJBPpFj3rF7P5fPsxtyT
         oC65UtjsdxOOIbfu+8pFR6EONqOyQIUblskmUfcUefUUWhCkXzOY7Aw92ISKKMyXXenZ
         xXLBHmq7OEZ/ZYouAV40vVMb0EySB91nMB5au7upyqrncez7pI6O1aSsjH2P3BtZGGac
         e4T15NzZ+lnpuK1IkuYMCJh336LKnlP7+CFaIaCJ4loiyCXxN7Bft8ZT+82xylHPP4gs
         sl0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700677464; x=1701282264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MjfB/97B7loi+XRCLgCE3Hiw3P88msCGByWuf340tpY=;
        b=jXOR031k4xXkGUSB5+FuUCTgpCQn2owjoRIM0GruQszXp6aZZLWB9QYWVLEZSPL6ay
         MoKTpfTgqILaBNEGJm9/mGAHfwDNKAZGr65nagQ6UB1TKahNHss+ujLpB3T9bhaOGZ3J
         n9uI2e+nNRQeFE4d/MAXsqCsB/XxyR59tYsL6zUwLkNvtIKmeNzjL0sI78k8+f9Es7bw
         E6KalHYjWb7/ZHKrp0TXHn8qWQPbPi3edbSz8Q+eeoXFTcW5Zm9auJh5JImpkIFxMbD6
         rNH/fxAWHNcamQt0grwuXWEDBGkxa45hxyU15wvAywpEFNV0/IueqQtXPK7SlvcZ6PDc
         Gzfg==
X-Gm-Message-State: AOJu0YxgPVzIrj17Avm2pmqhB3sxaJ/oRV0OgXqSiZx//O649BwzdugJ
	uEO8g2xnbdaylqtIPhJ47/c=
X-Google-Smtp-Source: AGHT+IFWPL9SNXvN7oL7uCtmjwzzoqIpcfpqt68R31BoH4G9gvRk0tppsfmf6uoVZf4Z3TPbbG2pDQ==
X-Received: by 2002:a17:902:e741:b0:1cf:59df:241 with SMTP id p1-20020a170902e74100b001cf59df0241mr3486737plf.52.1700677463793;
        Wed, 22 Nov 2023 10:24:23 -0800 (PST)
Received: from localhost.localdomain ([49.205.245.83])
        by smtp.gmail.com with ESMTPSA id x17-20020a170902ea9100b001cf6783fd41sm4897980plb.17.2023.11.22.10.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 10:24:23 -0800 (PST)
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
Subject: [PATCH v4 1/2] dt-bindings: usb: Add the binding example for the Genesys Logic GL3523 hub
Date: Wed, 22 Nov 2023 23:53:46 +0530
Message-ID: <20231122182351.63214-2-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231122182351.63214-1-linux.amoon@gmail.com>
References: <20231122182351.63214-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_102425_571756_00134991 
X-CRM114-Status: GOOD (  14.69  )
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

Onboard USB hub supports USB 3.x and USB 2.0 peer controllers.
which has a common reset pin and power supply.
peer-hub phandle each peer controller with proper gpio reset
and help each peer power on during initialization
and power off during suspend.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v4: Fix the description of peer-hub and update the commit message.
Schematics of the Odroid N2+
https://dn.odroid.com/S922X/ODROID-N2/Schematic/odroid-n2_rev0.6_20210121.pdf
V3: fix the dt_binding_check error, added new example for Genesys GL3523
v2: added Genesys GL3523 binding
v1: none
---
 .../bindings/usb/genesys,gl850g.yaml          | 67 +++++++++++++++++--
 1 file changed, 63 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml b/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
index ee08b9c3721f..bc3b3f4c8473 100644
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
@@ -27,12 +24,48 @@ properties:
 
   vdd-supply:
     description:
-      the regulator that provides 3.3V core power to the hub.
+      phandle to the regulator that provides power to the hub.
+
+  peer-hub:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      onboard USB hub supports USB 3.x and USB 2.0 peer controllers.
+      which has a common reset pin and power supply.
+      peer-hub phandle each peer controller with proper gpio reset
+      and help each peer power on during initialization
+      and power off during suspend.
 
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
@@ -49,3 +82,29 @@ examples:
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
