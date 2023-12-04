Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A88CDC4167B
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Dec 2023 14:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sef28JIW8RosNP2KX5lq0by1/uX8hLgbR5g2LlQ64N0=; b=h0vx0Q36D/NYd9
	/dXd5NaQ0UUJvXGdUHcwVxfeAvw7JXCSMleldj1v6Zs2KwpmKtCePprZN+tKId2XRqc9JZkKM+0yz
	5Rfj84CrwpLuW0ABJZJx559CUdAIB9NAazxt5385vaBi94sVSOwZgRtLvL7OZyQXgP+clROjL8Npf
	absx/QPDxvAWOTK/HBB7lB+xcKcC8grWsjVUvdE4l9V1c4yfYqb3lbtv+TtOySwm1Z9vwmldE/I5m
	ZNrHQ+mZoxG0hmpnjggIyptLTImQz8mYaylROwFYjIFd2wkCKzjhbIaF0TqTV8tApsova2OmKjTm5
	x1KcrMbp1yJ8J0v/37jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAABr-004pWF-1I;
	Mon, 04 Dec 2023 14:44:55 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAABn-004pTs-1p
	for linux-amlogic@lists.infradead.org;
	Mon, 04 Dec 2023 14:44:53 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1d0b0334ffcso6248955ad.1
        for <linux-amlogic@lists.infradead.org>; Mon, 04 Dec 2023 06:44:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701701088; x=1702305888; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7eRLjlThPLhM7zIw6XvrWrrbob10TfqT1M4cq4iJfTE=;
        b=LIqEU9XIkP95/96jrTaDdnWnu5QrSDVcVJSGf5MkGXjMwcNPtGWPhbVAt1Mztd80P7
         Mj3qg6zt+SfRwv7EcVZCztk9MVIRavhsFJR523xj9tP08HmoMJT5T5fbN0QeDec3W1Vg
         u+c2fFLsmrW2muS3CcaP8WMN1QlvgMvw3UDKPQVfBxTUUkXF9XyDMtfW7gYGwZNsu2iR
         ghD1Jaicp3vL1k4IHNL21wUSAcXukN/BfrDTPyVbymoN8S2EwRom6n2yLmizKinmwSPU
         ebi08PqV8QPlH9ob0nHxyGJASq6KZEpM+xK6p9WWJjXCd/OeZ6Bmd6x7TR0zEiVgtSwm
         PZ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701701088; x=1702305888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7eRLjlThPLhM7zIw6XvrWrrbob10TfqT1M4cq4iJfTE=;
        b=LSMmXSehwH0EmTF7u07ab1/JfG9JULGJhamLiwXE1Ym6ZxyVIW3gYkBPo9oeED4Sqq
         ix1iRRnIbhs9xtCyALoHmF2Q2T/5bb1KwXr60a/ER0CDxV7EWX4FQwzIuX6z9Tcub3kO
         3ZLqn9Gw2Au9q6gCMrlS9OVjZdwaMq6hRK3wWPtipTEdh7tAbE1ZKQu3QHV5qj5Pw3IL
         n6+vx7cuLUFfqcaOPl98vuLisoUu04O16C3xAnMlaGSA9bubQJMYzxG8BfU80itc0IAP
         nXu51+YZeITQZ/6tbB8/YNMDN7pt4v90MHhH+Dbl7EQbwy79MAIkf+2V3xaRI1iZEeAa
         q+HA==
X-Gm-Message-State: AOJu0YwKi0QvxnVpcnLG6H5GhqvwHhG5YQX0eh6QfsYk4r5ckatK0FBD
	Xx2SwZBrZXubhgILHIqL4mkY4vBnroFazg==
X-Google-Smtp-Source: AGHT+IGTgdMm1IrP9P0QKhOOvICj9TIyyaKAwxubN0u1nWy9phktn3LnrrLnNFT21DIFr3oeklgtcg==
X-Received: by 2002:a17:903:647:b0:1d0:8e61:102a with SMTP id kh7-20020a170903064700b001d08e61102amr2321909plb.90.1701701088620;
        Mon, 04 Dec 2023 06:44:48 -0800 (PST)
Received: from localhost.localdomain ([49.205.242.26])
        by smtp.gmail.com with ESMTPSA id l6-20020a170902d34600b001cfb99d8b82sm6446815plk.136.2023.12.04.06.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 06:44:48 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Icenowy Zheng <uwu@icenowy.me>
Cc: Anand Moon <linux.amoon@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-amlogic@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 1/2] dt-bindings: usb: Add the binding example for the Genesys Logic GL3523 hub
Date: Mon,  4 Dec 2023 20:14:25 +0530
Message-ID: <20231204144429.45197-2-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231204144429.45197-1-linux.amoon@gmail.com>
References: <20231204144429.45197-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_064451_600912_30DB4A68 
X-CRM114-Status: GOOD (  16.15  )
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

GL3523 has built-in 5V to 3.3V and 5V to 1.2V regulators, which serves
power to the USB HUB, it uses 5V power regulator.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
V6: fix the description of the regulators
Updated the commit message for regulator updates.
add reviewed by Conor Dooley
[1] https://lore.kernel.org/all/20231130053130.21966-2-linux.amoon@gmail.com/
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
index ee08b9c3721f..c6f63a69396d 100644
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
+      The regulator that provides 3.3V or 5.0V core power to the hub.
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
