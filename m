Return-Path: <SRS0=Cs6g=PV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F63DC43387
	for <linux-amlogic@archiver.kernel.org>; Sun, 13 Jan 2019 18:18:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 157F6206B7
	for <linux-amlogic@archiver.kernel.org>; Sun, 13 Jan 2019 18:18:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CyM76aHB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lu8DqyCU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 157F6206B7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9Fsjtr4S72/E5RM+Fz6dN9VyS57Q0gieLrc978K4JFg=; b=CyM76aHBPrh3WV
	MvFvq1nZR4gx/4ajVm0CgsyqRiNRztmMTJJHJQik7GEOmK7nrmS0kbDf8u1Iznf/gPTq0Q1vGErch
	endSlG/ctiFnklb/+O2b/Hf8mtfUoJxoA49EYZvrBErfaAPMDzg3r811RDu8dFb1e0TsQkyUWe2WU
	tN06wob5tr36MzAm6wfuZ1kCD/R+5lQTxdAg6VVYlxF/6hDwvo1e6xOIulhteMIVF7HfZbOlm4Ppf
	2H3lPesgOqR46V+JpwDyMTGE11Br8pCNMM1Z8DINh3W9a2KoWMsCNfxiisH5hSWeAE269R9JV2DVB
	FcJSFD+9k6HF3+HZEK7g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gikLF-0008Li-Qf; Sun, 13 Jan 2019 18:18:37 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gikL5-0008Dn-79; Sun, 13 Jan 2019 18:18:29 +0000
Received: by mail-pf1-x443.google.com with SMTP id h3so9291085pfg.1;
 Sun, 13 Jan 2019 10:18:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TB8imBtf4PAjNqPCC8uvdtsm3BgS79eWnXlUKq9cCOM=;
 b=Lu8DqyCUTBNJTP2Zg+KMuvhg78dhNHDuYUrCNqHkIk5Y0lyXE+PP3blssrwJBUrBS2
 f+qFZr7GVdTH66Mn+1KZmvdfS+wngEGvKFAWmQebB2N9dItWOtFoJ5UH0NWZnH+EYFed
 vx3U/luIECC8l37riW1c2jL5q/X3iU2nEsMJp5vAVW236vyOraRK4E5UXbELGVtWZ5O/
 FApS1PevImQJ0LStkptdWirEFrIRu161kcUkfTlcRBQ/jiTqD0UBIbnfMZ3ZA4UuV4NV
 TrPSr6TjvN2tV8duA3jI4z4/ZOn2uYVtHq6fg/rVihCEVQykI8ZHPz/zm2/Gy1bCxHOY
 WpPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TB8imBtf4PAjNqPCC8uvdtsm3BgS79eWnXlUKq9cCOM=;
 b=Nd1YwNoJWDWpMnRUzK9uFLCoOqFS4eKtmy3nb3vh7Lhqo0d2ORKMtJ5YeNm73RYhgZ
 kPr8ghZ75dMxDil2WZTZLtEYdpLFbnsStzABvHUluPn4H51oWymdvAAIoF94uN0eFFDm
 dkOQhppPp4j1RmxWGPruFWPva2dWrdg7pH1SXEJVd+x3qkWBrjbYJIc9SzBrTTk6ycHz
 E890eJnK/Ct9fbDlEnp8wnDnj8dc/T51BC+MputSPvvG2THizYKRUNxM5JZmkqN8LJaG
 jcOWS3WRwA7RBzBWnYDVm8lWhcND5EQ27uN2akdPqximGgrgyVhq4TpvK8Z7Q5KfVu/t
 O0tA==
X-Gm-Message-State: AJcUukd1QgasVyNa01dn7h5O0bHhGdlnn3ZSV0MJyCsezgO5R4t/uYF9
 mABTEb5eOHQst80c7y6r5iI=
X-Google-Smtp-Source: ALg8bN4a2ZUCLZRINvNgsuR6mrYyrMJJLN5xkgJSj4vVCIJxdpGVcRBD33NTjum/uqUXRiR/2dFIVQ==
X-Received: by 2002:a63:fc05:: with SMTP id j5mr20595026pgi.434.1547403504814; 
 Sun, 13 Jan 2019 10:18:24 -0800 (PST)
Received: from localhost.localdomain ([103.51.74.105])
 by smtp.gmail.com with ESMTPSA id i193sm157504416pgc.22.2019.01.13.10.18.21
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 13 Jan 2019 10:18:24 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] ARM: dts: meson8b: odroidc1: Enable usb phy node
Date: Sun, 13 Jan 2019 18:18:07 +0000
Message-Id: <20190113181808.5768-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190113_101827_286714_339F7F79 
X-CRM114-Status: UNSURE (   9.97  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Emiliano Ingrassia <ingrassia@epigenesys.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add missing vbus-supply link to phy controller for usb_phy0
and usb_phy1 nodes, this changes fixed the power issue
on usb ports usb, changes help fix usb reset warning.

[  821.991470] usb 1-1.2: reset high-speed USB device number 3 using dwc2
[  825.243385] usb 1-1.2: reset high-speed USB device number 3 using dwc2
[  828.151310] usb 1-1.2: reset high-speed USB device number 3 using dwc2
[  830.991241] usb 1-1.2: reset high-speed USB device number 3 using dwc2

Fixes: 2eb79a4d15ff (ARM: dts: meson: enabling the USB Host controller on Odroid-C1/C1+ board)
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
Rebased on Kevin's amlogic/v5.0/fixes branch

[alarm@archl-c1t ~]$ lsusb -t
/:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=dwc2/1p, 480M
    |__ Port 1: Dev 2, If 0, Class=Hub, Driver=hub/4p, 480M
        |__ Port 1: Dev 4, If 0, Class=Mass Storage, Driver=usb-storage, 480M
        |__ Port 3: Dev 3, If 0, Class=Video, Driver=uvcvideo, 480M
        |__ Port 3: Dev 3, If 1, Class=Video, Driver=uvcvideo, 480M
        |__ Port 3: Dev 3, If 2, Class=Audio, Driver=snd-usb-audio, 480M
        |__ Port 3: Dev 3, If 3, Class=Audio, Driver=snd-usb-audio, 480M
[alarm@archl-c1t ~]$
[alarm@archl-c1t ~]$ lsusb -v|egrep "^Bus|MaxPower"
Couldn't open device, some information will be missing
Bus 001 Device 003: ID 1b71:0056 Fushicai
    MaxPower              500mA
Couldn't open device, some information will be missing
Bus 001 Device 004: ID 152d:0578 JMicron Technology Corp. / JMicron USA Technology Corp. JMS567 SATA 6Gb/s bridge
    MaxPower               30mA
Couldn't open device, some information will be missing
Couldn't open device, some information will be missing
Bus 001 Device 002: ID 05e3:0610 Genesys Logic, Inc. 4-port hub
    MaxPower              100mA
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
    MaxPower                0mA
---
 arch/arm/boot/dts/meson8b-odroidc1.dts | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm/boot/dts/meson8b-odroidc1.dts b/arch/arm/boot/dts/meson8b-odroidc1.dts
index 0f0a46ddf3ff..a49a8509b288 100644
--- a/arch/arm/boot/dts/meson8b-odroidc1.dts
+++ b/arch/arm/boot/dts/meson8b-odroidc1.dts
@@ -83,6 +83,19 @@
 		regulator-max-microvolt = <5000000>;
 	};
 
+	usb_vbus: regulator-usb-vbus {
+		compatible = "regulator-fixed";
+
+		regulator-name = "USB_VBUS";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+
+		vin-supply = <&p5v0>;
+
+		gpio = <&gpio_ao GPIOAO_5 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
 	tflash_vdd: regulator-tflash_vdd {
 		/*
 		 * signal name from schematics: TFLASH_VDD_EN
@@ -293,8 +306,18 @@
 	pinctrl-names = "default";
 };
 
+&usb0_phy {
+	status = "okay";
+	vbus-supply = <&usb_vbus>;
+};
+
 &usb1_phy {
 	status = "okay";
+	vbus-supply = <&usb_vbus>;
+};
+
+&usb0 {
+	status = "okay";
 };
 
 &usb1 {
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
