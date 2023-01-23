Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97327C25B50
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Jan 2023 21:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0MpFkvTucnaa0dhrDfggQALHffkxjAn68piHaHaVDbo=; b=Yb7XYsspO9iNSH
	TspHaLyX0xN+uQ5pOJLTwnFVkGV6wxjx2JEXjCEH2PJR3IljJKhH+BrURFgOvMz3MXR2HTdIu3Eru
	B8142LJ9fTFhYcGflj2ZJq+o6g5947CFvT6Zz/OBzqVYcbzTQ9x5cizfrOOeTcqlJe7EcD8MKh2S0
	iS0sITgNNMiB5d3RcSqChMBBzILrUXm2eeCebnd8/tNKlyzrID64sFdx7AoYBSKTzGz1Zp/JLod5a
	vFY2Xdq59gg5tcbRYEuQm90iJf08anCI1p4iZc20s50puDxZRu3x7SwdX+sTlNRTga/aZl4BMXZ/w
	bJqOw3/FpqYmitRnct+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pK4QU-001WhH-5h; Mon, 23 Jan 2023 21:32:26 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pK4PJ-001WEU-3Z; Mon, 23 Jan 2023 21:31:14 +0000
Received: by mail-ej1-x62e.google.com with SMTP id vw16so34050929ejc.12;
        Mon, 23 Jan 2023 13:31:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ppdW84a0SQYG4k4BGWbGIbCGp/ezutsaizpkowzYII4=;
        b=SxosNVpoA4n4v1mM4hjrl7EWQjEVdhjVSKwY4wB6A7zbLhV4olFTRC2ag5fEwbTUb2
         1weTDmGfKALKHf1iyrFUR5/zapDu9JtJrau6mxyOCE6f3E7rsAJ09rT6oo8BTIJt5u8z
         RtU3OfKNz5kwlmElIkUq1EQECuu1ya74bJsC9wfWmCqXSjs/ENlnsItsdMXfxdJJwBHl
         wZRQDxAA9Q8rSeyD6laFEuKDcu+g/Ujrj39bbs3aePGVy4N8lDvqe0Kaa+7Bq498hNzN
         R6bgoL10S2I3ubBtsNYcOYjnUMiIir5Alhdx7oBV/YzXzr5xNfeulY7O3uN4GuBzqz4O
         P80Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ppdW84a0SQYG4k4BGWbGIbCGp/ezutsaizpkowzYII4=;
        b=G9wBm+yvteuFrWwTtQJy3zLQ+iQqVZlFs4LLArVDkHsIR1AJfg8tewFBi5fLLdZiEr
         72FNpH4Qd71xFHuHAAoDIsxrRum/zF1sbwp5nYCRjtnTedidHX2mw79T1LPaOGwDKRLW
         3/7dyhBMf9VOyDbVQh1MVIpWDXCv8LWQetDzo7WFdHDx9v5KPt/G2j9FkEuMKjrOUpEL
         7sOMzs58N3MurKTX4GfWWdrzg2yOOXEAWQxNpiF4qY8sLQUvoqXAcY5EolEq788vhNJ7
         20wEecxIpcQzBzYHQquJQWyNxZU/z71BIDS0oiKhExHAA4ZWcRhOxav9oRuVInWzcWn9
         W9JQ==
X-Gm-Message-State: AFqh2ko6zIRCUPcB3/SChQ++UOguaKX3tfO5/bKIzE9nqWhm/kppXuB0
	277ml7EKFeVXxPG7z6VA5i4=
X-Google-Smtp-Source: AMrXdXsMnmrNmfbXjdlkXwkZoLz0pQ+2wP521XDFsAYfrWEjIMh5t4BBWLO/BsF5i1V9UbMiwSnExQ==
X-Received: by 2002:a17:907:2395:b0:871:629:227c with SMTP id vf21-20020a170907239500b008710629227cmr22744678ejb.66.1674509470778;
        Mon, 23 Jan 2023 13:31:10 -0800 (PST)
Received: from ?IPV6:2a01:c23:bc5b:9400:dc4c:6fb7:47b2:beb7? (dynamic-2a01-0c23-bc5b-9400-dc4c-6fb7-47b2-beb7.c23.pool.telefonica.de. [2a01:c23:bc5b:9400:dc4c:6fb7:47b2:beb7])
        by smtp.googlemail.com with ESMTPSA id 8-20020a170906328800b00871cb1b8f63sm11109155ejw.26.2023.01.23.13.31.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 13:31:10 -0800 (PST)
Message-ID: <440a7cad-d48f-8975-4dfd-265b235bf629@gmail.com>
Date: Mon, 23 Jan 2023 22:28:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: [PATCH 5/8] dt-bindings: rtc: Add Amlogic Meson vrtc controller
 binding
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 linux-pwm@vger.kernel.org, linux-rtc@vger.kernel.org,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
References: <cb62dfc0-cb3d-beba-6d0b-8db18583dda0@gmail.com>
In-Reply-To: <cb62dfc0-cb3d-beba-6d0b-8db18583dda0@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_133113_183538_E97CFC4D 
X-CRM114-Status: GOOD (  16.31  )
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

Add Amlogic Meson vrtc controller binding.
Tested with make targets dt_binding_check and dtbs_check.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 .../bindings/rtc/amlogic,meson-vrtc.yaml      | 50 +++++++++++++++++++
 .../bindings/rtc/rtc-meson-vrtc.txt           | 22 --------
 2 files changed, 50 insertions(+), 22 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/rtc/amlogic,meson-vrtc.yaml
 delete mode 100644 Documentation/devicetree/bindings/rtc/rtc-meson-vrtc.txt

diff --git a/Documentation/devicetree/bindings/rtc/amlogic,meson-vrtc.yaml b/Documentation/devicetree/bindings/rtc/amlogic,meson-vrtc.yaml
new file mode 100644
index 000000000..26a70b3ce
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/amlogic,meson-vrtc.yaml
@@ -0,0 +1,50 @@
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
+description: |
+  This is a Linux interface to an RTC managed by firmware, hence it's
+  virtual from a Linux perspective.  The interface is 1 register where
+  an alarm time (in seconds) is to be written.
+  The alarm register is a simple scratch register shared between the
+  application processors (AP) and the secure co-processor (SCP.)  When
+  the AP suspends, the SCP will use the value of this register to
+  program an always-on timer before going sleep. When the timer expires,
+  the SCP will wake up and will then wake the AP.
+
+allOf:
+  - $ref: rtc.yaml#
+
+properties:
+  compatible:
+    enum:
+      - amlogic,meson-vrtc
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
+    bus@ff800000 {
+      reg = <0x0 0xff800000 0x0 0x100000>;
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      rtc@a8 {
+        compatible = "amlogic,meson-vrtc";
+        reg = <0x0 0x000a8 0x0 0x4>;
+      };
+    };
diff --git a/Documentation/devicetree/bindings/rtc/rtc-meson-vrtc.txt b/Documentation/devicetree/bindings/rtc/rtc-meson-vrtc.txt
deleted file mode 100644
index c014f54a9..000000000
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
2.39.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
