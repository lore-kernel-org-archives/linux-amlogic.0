Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA574C25B50
	for <linux-amlogic@archiver.kernel.org>; Sat, 21 Jan 2023 17:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=69NRQg6blurimXlC2l5uF7zrZzDIpV0m1NKpeEl/U5I=; b=U1r8ObDL7h3pKQ
	UvEsP3Hg/mgCO/gFVnVbfk94xv0JXtqelf7/4QSKod514wAVgqpF86Gcl2t3+BKj5HTgTqF6hT/nA
	SiF/+0qJIyqhQYEqMdbeguTyK1vIDqDAQ6ACNFnyYmPH60+W73sQn96c/6KAHtNItaxgXIr5eUoyu
	gI8NaCD9aK6JFbtymO/KeCy4bsdzDoeI0GQxnhF5828P9u6R6LXwRN9WBTzwvyczN9JujxcV+pcLY
	x+HTjnu4gxuQyZ74vGb8D+i2BrBkexGwjWS37cBaro0KVFFVn62V95wDcVVVHZ949GoqKRW8duw3y
	bM0fczt/gzM8g7p4yTPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJI74-00EDyg-UW; Sat, 21 Jan 2023 17:57:10 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJI72-00EDxZ-Ji; Sat, 21 Jan 2023 17:57:09 +0000
Received: by mail-pl1-x636.google.com with SMTP id z20so5987178plc.2;
        Sat, 21 Jan 2023 09:57:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NCzHXrbRvsqfgdDEn1XzlqbZnHOfL3rY2EE1BLX+c/4=;
        b=b6jR9mtPvxcQEgR8UCV6DSGF/rrpXKm+GuXYeJg2HRnf29dsOYV/PqSZ+Us754CymL
         ncst+0JJTnZSxsjQtsp7WB5bdKkWBSANRN3ndNF59Y4HY5GLHdh3oJCd4vdNIr+darHO
         QY+42q2vpWPhuodog7an1v0fnXorCWTZIK1g7M/A4eGEw9SMf82BYjnoApvqTHO78Iec
         nyAFeeC/PovmVgEaiISMwFjXKPS4Y0tq8aglEpBJCUvWcQp5aHYMhWppgNZOcPXTXG7A
         bXeXdvryMuk8B9TVulgCFwMREwP89NBYJ/+NLaMhuqonL8/8WlLVLuitid1EDUhVSslX
         ZKng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NCzHXrbRvsqfgdDEn1XzlqbZnHOfL3rY2EE1BLX+c/4=;
        b=fWORCCDeiTmrMH2cXVvhgYdTAOiy0vzAfX1MGBwpar+be+XkW23I4HwJe4P2pFpIjI
         l7YzrzRy6i3hftcc522Ed9+uuv5ITUNHR0hv7/WAUMexDb2XPz6XsgxzVOyh5p5RmgeY
         1QxFLq0g3u4li8HzAU8BtAN3WgjCTuAVV9UXzAXqjEDiJjiwbgvrTtR5I5W/o5mft8/L
         pnD+Ng+rArTTbkMw/LY4Nq3ClD071SUtEWwAVQHcEN8isP9WhS7AIHzvCtrckMepi+AQ
         O3PoRejoZFBrM7W9JruC8TLt08iN5lFkKND3mm9PJklTEH0faMpXtrgM9mogCw56Wv5A
         ClCA==
X-Gm-Message-State: AFqh2krh/Or3RNb0rStHuuHWWkAeV/71/dkhZm4Ov5dAzXVSq6U3qG41
	h7xIXKnbS3Kz+mUm2VDORn4=
X-Google-Smtp-Source: AMrXdXsNPj1hcK0B4AslGTcdR5QLntv/D2BXxjsaGDR1forilW70eC0xvgukY8NwZRqWGPEkm6dNWw==
X-Received: by 2002:a17:903:230f:b0:195:f06f:84fc with SMTP id d15-20020a170903230f00b00195f06f84fcmr6012669plh.40.1674323827571;
        Sat, 21 Jan 2023 09:57:07 -0800 (PST)
Received: from localhost.localdomain ([45.112.3.15])
        by smtp.gmail.com with ESMTPSA id r3-20020a632b03000000b00478e14e6e76sm24857374pgr.32.2023.01.21.09.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jan 2023 09:57:07 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org,
	Matthias Kaehlcke <mka@chromium.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Johan Hovold <johan@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/9] ARM: dts: amlogic: Used onboard usb hub reset on odroid c1
Date: Sat, 21 Jan 2023 17:56:30 +0000
Message-Id: <20230121175639.12818-3-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230121175639.12818-1-linux.amoon@gmail.com>
References: <20230121175639.12818-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230121_095708_705941_D76873C1 
X-CRM114-Status: GOOD (  15.76  )
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

On Odroid c1 previously use gpio-hog to reset the usb hub,
switch to used on board usb hub reset to enable the usb hub
and enable power to usb hub.

Add usb hub regulator as per the schematic.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v3 - Add Rev by Neil.
     update the subject with odroid C1
     dropped dr_mode
v2 - drop the vendor name from compatible string.
   - move the hub node to USB controller node.
   - drop the usb_otg_pwr since it only liked to OTG port
     and link p5v0 to the vdd-supply.
---
 arch/arm/boot/dts/meson8b-odroidc1.dts | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/arch/arm/boot/dts/meson8b-odroidc1.dts b/arch/arm/boot/dts/meson8b-odroidc1.dts
index 04356bc639fa..04c4bdca0b85 100644
--- a/arch/arm/boot/dts/meson8b-odroidc1.dts
+++ b/arch/arm/boot/dts/meson8b-odroidc1.dts
@@ -281,19 +281,6 @@ &gpio_ao {
 			  "J7 Header Pin 6", "J7 Header Pin 5",
 			  "J7 Header Pin 7", "HDMI_CEC",
 			  "SYS_LED", "", "";
-
-	/*
-	 * WARNING: The USB Hub on the Odroid-C1/C1+ needs a reset signal
-	 * to be turned high in order to be detected by the USB Controller.
-	 * This signal should be handled by a USB specific power sequence
-	 * in order to reset the Hub when USB bus is powered down.
-	 */
-	usb-hub {
-		gpio-hog;
-		gpios = <GPIOAO_4 GPIO_ACTIVE_HIGH>;
-		output-high;
-		line-name = "usb-hub-reset";
-	};
 };
 
 &ir_receiver {
@@ -381,5 +368,15 @@ &usb1_phy {
 };
 
 &usb1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
 	status = "okay";
+
+	hub@1 {
+		/* Genesys Logic GL852G usb hub */
+		compatible = "usb5e3,610";
+		reg = <1>;
+		vdd-supply = <&p5v0>;
+		reset-gpio = <&gpio_ao GPIOAO_4 GPIO_ACTIVE_LOW>;
+	};
 };
-- 
2.38.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
