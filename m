Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DA8FC004D4
	for <linux-amlogic@archiver.kernel.org>; Sat, 21 Jan 2023 17:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DvyZJ4myU4BPur1kn2LImqUGxNZODQ8OhFpuiDy6MV4=; b=GvnkaorNBu61Dy
	/M9StRLV3/AFmUUwhLrdbr8zTE14iqHJs5OrfovwT4G5MGInJTWVSNbu2OuJSMKQI2ugAuUrX5nVG
	j0RcVtEqKioBuk1cG/uqq7T0tJYG0jj6YodHDmLu9UCQ5oVWNFgljIOXrEeCAHJZQy1zcRB254Ec1
	/zfSfNQWafN0ZSL2sTKQxtg9VgpOowvFvs3irFqJNllYluYmbLciZOKzNlPew2QIK5VxS7uK+7rV4
	zorvQPl1MSJWuAA+VYXd596l+Lt15QxcwoT+Jm5qc2+i0oV2ZSL1OjwF5+0dNPFL3o2hTyNg/eg1G
	0Cp6SU9ge6lkmn2nA9CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJI7E-00EE2r-S6; Sat, 21 Jan 2023 17:57:20 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJI79-00EE0P-Ft; Sat, 21 Jan 2023 17:57:16 +0000
Received: by mail-pj1-x102c.google.com with SMTP id y3-20020a17090a390300b00229add7bb36so7754862pjb.4;
        Sat, 21 Jan 2023 09:57:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YeFLuKFYHtqMsL9Q04zNeAzUIoUCJnJf6k6CUesWfq4=;
        b=pDY7lwMY986ChQ8HScW2+zLReDVZwRRACA7C62xlDbgz4uTsE/iTgjsoNINU9aQDcI
         bS1flQbH1VDhkxrhfrCkA4QgN/rETQ7idnalXvyfXFcFm6jZNTLiNbCa1OGTOrqWfb4t
         1UhZEUaU70wCJ3ae9bYW8+E9bk4L63i+nJV/lvg8Rj4+B7ZYmCnpE5uSWsPSIo3XwD5r
         qeZOprVfCVnuN7ElJKcEr6jwDpCX/RoCc8rFMakOy9TeGAUX7sgS/cAHt3QoNDOkG8r0
         Q5TRtfIDSly/1V7UzlpzogAeEA/ifBAOAEss0G1fP17o1EverbouZIIQwDwmoH0vAkWR
         go+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YeFLuKFYHtqMsL9Q04zNeAzUIoUCJnJf6k6CUesWfq4=;
        b=PnjBMXAScD6qf7GrhL8xbk1Edf0UEY+GYCSbbpek65hoJmYTwcW0WcCxtrJ3rG8cjf
         KFL40TU/ztw4lHrXQaBTzqcahE1/acS52l2f8mSTzVTGMgiR1Je6gIEYfizvOM9n7ZQ0
         qnSHZKYgORTFgaXFajZ75sTDvu9cNCP8akPZOck5iSa6jyWc4WYvt4sU0L25RhkSokdE
         aAxueqT/PnNweJ3r+3yHlwiy/IXtUwB4svjTWeZ9yEQdMD1Mx0S7CD922Ve+ZawjWyDp
         vXiCNX9fSn1m/8/hxKsFRenBfgsAqpxOsm+Eo2jdA5E9oyDoGalEjtperQP0DTd6KddE
         8dfA==
X-Gm-Message-State: AFqh2kpQcd26W4GTdIEHqGHFQw+bNdRV0MRqJQZm68p4Gb6gUfqFcXYd
	sTfLvJ8pkOv1/G7Oi8KB94VFOM0UxS4=
X-Google-Smtp-Source: AMrXdXvhKACefD0Rs3Ee7VDiXlFCw3qo0/2fF51ymAE0AMqX52lzeqxWKVPWjOdDMIjMbBD+t1Ra5g==
X-Received: by 2002:a05:6a21:6d8c:b0:b1:e8da:d5bc with SMTP id wl12-20020a056a216d8c00b000b1e8dad5bcmr25436775pzb.56.1674323834267;
        Sat, 21 Jan 2023 09:57:14 -0800 (PST)
Received: from localhost.localdomain ([45.112.3.15])
        by smtp.gmail.com with ESMTPSA id r3-20020a632b03000000b00478e14e6e76sm24857374pgr.32.2023.01.21.09.57.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jan 2023 09:57:13 -0800 (PST)
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
Subject: [PATCH v3 3/9] arm64: dts: amlogic: Used onboard usb hub reset on odroid c2
Date: Sat, 21 Jan 2023 17:56:31 +0000
Message-Id: <20230121175639.12818-4-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230121175639.12818-1-linux.amoon@gmail.com>
References: <20230121175639.12818-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230121_095715_591342_6A9A1BED 
X-CRM114-Status: GOOD (  15.83  )
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

On Odroid c2 previously use gpio-hog to reset the usb hub,
switch to used on-board usb hub reset to enable the usb hub
and enable power to hub.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v3 - Add rev by Neil.
     droped dr_mode
v2 - drop the vendor name from compatible string.
   - move the hub node to USB controller node.
   - drop the usb_otg_pwr since it only liked to OTG port
         and link p5v0 to the vdd-supply.
---
 .../boot/dts/amlogic/meson-gxbb-odroidc2.dts  | 25 ++++++++-----------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
index 201596247fd9..70b10934a811 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
@@ -250,21 +250,6 @@ eth_phy0: ethernet-phy@0 {
 	};
 };
 
-&gpio_ao {
-	/*
-	 * WARNING: The USB Hub on the Odroid-C2 needs a reset signal
-	 * to be turned high in order to be detected by the USB Controller
-	 * This signal should be handled by a USB specific power sequence
-	 * in order to reset the Hub when USB bus is powered down.
-	 */
-	hog-0 {
-		gpio-hog;
-		gpios = <GPIOAO_4 GPIO_ACTIVE_HIGH>;
-		output-high;
-		line-name = "usb-hub-reset";
-	};
-};
-
 &hdmi_tx {
 	status = "okay";
 	pinctrl-0 = <&hdmi_hpd_pins>, <&hdmi_i2c_pins>;
@@ -414,5 +399,15 @@ &usb0 {
 };
 
 &usb1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
 	status = "okay";
+
+	hub@1 {
+		/* Genesys Logic GL852G USB 2.0 hub */
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
