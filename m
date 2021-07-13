Return-Path: <SRS0=A3X0=MF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6278C07E96
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Jul 2021 05:53:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9196661008
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Jul 2021 05:53:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9196661008
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DhYD7NxGHNgKOY8gyar49n8/nkdp9Q4G8ewYWlrzcuY=; b=jrqsH5LWhASkp/
	d5rfQQnpfB9hWQoBlBZ4/t0ZNTfIV+HtkqrCEOXZ6HYmEv9grUIwPv7vvNtzQ/gbQQhmTqCVq/KLJ
	D3mUPXflMMNvmS7OyvfsbrasnWdtQHqxAA/P2ZOaY5olNjzViPcbPR/YNPZ7oZ+2xJfMfWL/2mVUQ
	QWmvxvhCizNaM/3b+wO/xyOULDZ/R24HCETIIkpgTuUFU+OkDxrmQ3WJZWX6CUuLrqkmNzgG+63sm
	YywmnSCu2ocrWRahnUl9vpUXRRknuoev3haCuGkX68Ujg8haa7lWyI64Rce1FEceIoUPskdViiSKv
	qwrb9zOo5x8TAGT6jPKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3BM6-009BZG-BW; Tue, 13 Jul 2021 05:53:18 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3BLs-009BV3-4H; Tue, 13 Jul 2021 05:53:05 +0000
Received: by mail-pj1-x1033.google.com with SMTP id p9so11471906pjl.3;
 Mon, 12 Jul 2021 22:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Lmng85Px0u83llASk+gk5rLgTOQ6j6LNMSKSt4jMIeI=;
 b=HM9+khwIbE9awn14IA/b6gDroV2+LORNN7AdsQSFBtmzJ22vchCVTor7Jw2ieUqR9Z
 HXFmq/Rq5fMRiGYFCf4pRBfU6GnzpboUCVozgRPqug0OJBYenXciDngP48dxjYL05+RF
 ZAXdtqxbz+Ur2j0VmB5sU1MXhOWgL7cyF9fg6VB8EQIuA5Cz7thVWLDs4nKYzLANITrI
 jcR7MrbGlMEy+jGCCMCcWgTKF9Q5euNBpoupzwd8Vcf82NyIg6L1ICWaM02+QX4FrkyF
 ij5SUNIQU5gYrFNOjGWveoYWsp8lBtUH0iUwBGs4Ek0Xkm8ChFM5y4+jQF3s6PhEhCYZ
 RDkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Lmng85Px0u83llASk+gk5rLgTOQ6j6LNMSKSt4jMIeI=;
 b=o17N1Jl1SQs8n+tS6AeEy3Htsb1qcaWaWfkzEjxG4oX6ZZh+Q9kBVJWMfk0tNoXie8
 +/YCdT/LSF0cU+/xuyFaGyGI0rd8A86259Nrzd5i/Wcc9m9HxjOSWhqoE4uAO6sD8aQt
 Asz+9/7ahsHw3cWLnv+8mcQRkCJLYzm6PC3V9EiSuUHru9eisb7d0JG4aTBJPsqc26qJ
 NMARyY1dOh5En3W2RdxfnsAC8+/Q/hwqWyVOXfzzfTEnpEJ5p307SL8PQs18XjBfTAku
 Ojhm7/171Gl6ScdKgZnpkaXvpgYz2CQGojhTo0SavR9CQm9TDV8YlgfS9vfkvkw3kpKz
 hcuA==
X-Gm-Message-State: AOAM531gcW4SeexMFsn7dm6ZRG35VXxqzwEkYa4l9iS02jirAUb8bkw3
 Gb49BlfESNdLHZkt1S/NsD2mxDUu6aI=
X-Google-Smtp-Source: ABdhPJwTq9nwszpBMHHsyvcPH3Z+S8RDoz5Pl7U1c/xalzChkAACyz7SaZKkAeJe60mg+uGUG5V/uQ==
X-Received: by 2002:a17:90a:cd01:: with SMTP id
 d1mr17784189pju.106.1626155583078; 
 Mon, 12 Jul 2021 22:53:03 -0700 (PDT)
Received: from archl-c2lm.. ([103.51.72.31])
 by smtp.gmail.com with ESMTPSA id x19sm17755198pfa.104.2021.07.12.22.52.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 22:53:02 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Anand Moon <linux.amoon@gmail.com>,
 Matt Corallo <oc2udbzfd@mattcorallo.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Emiliano Ingrassia <ingrassia@epigenesys.com>, devicetree@vger.kernel.org
Subject: [PATCHv1 1/3] ARM: dts: meson8b: odroidc1: Add usb phy power node
Date: Tue, 13 Jul 2021 05:52:13 +0000
Message-Id: <20210713055227.1142-2-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210713055227.1142-1-linux.amoon@gmail.com>
References: <20210713055227.1142-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210712_225304_212968_E9FA3F60 
X-CRM114-Status: GOOD (  11.46  )
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

Add missing usb phy power node for phy mode fix below warning.

[    1.253149] phy phy-c1108820.phy.0: Looking up phy-supply from device tree
[    1.253166] phy phy-c1108820.phy.0: Looking up phy-supply property
		in node /soc/cbus@c1100000/phy@8820 failed

Fixes: 2eb79a4d15ff (ARM: dts: meson: enabling the USB Host
		controller on Odroid-C1/C1+ board)

Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
previous version
[0] https://patchwork.kernel.org/project/linux-amlogic/patch/20190113181808.5768-1-linux.amoon@gmail.com

changes fix the vbus-suppy to phy-supply, drop enable usb0

# sudo cat /sys/kernel/debug/regulator/regulator_summary
    USB_PWR                       2    1      0 unknown  5000mV     0mA  5000mV  5000mV
       phy-c1108820.phy.0-phy     2                                 0mA     0mV     0mV
---
 arch/arm/boot/dts/meson8b-odroidc1.dts | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/meson8b-odroidc1.dts b/arch/arm/boot/dts/meson8b-odroidc1.dts
index c440ef94e082..ced1ec1c4878 100644
--- a/arch/arm/boot/dts/meson8b-odroidc1.dts
+++ b/arch/arm/boot/dts/meson8b-odroidc1.dts
@@ -32,6 +32,25 @@ emmc_pwrseq: emmc-pwrseq {
 		reset-gpios = <&gpio BOOT_9 GPIO_ACTIVE_LOW>;
 	};
 
+	usb_pwr_en: regulator-usb-pwr-en {
+		compatible = "regulator-fixed";
+
+		regulator-name = "USB_PWR";
+
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		/*
+		 * signal name from schematics: USB_POWER
+		 */
+		vin-supply = <&p5v0>;
+
+		/*
+		 * signal name from schematics: PWREN
+		 */
+		gpio = <&gpio_ao GPIOAO_5 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
 	leds {
 		compatible = "gpio-leds";
 		blue {
@@ -378,6 +397,7 @@ &uart_AO {
 
 &usb1_phy {
 	status = "okay";
+	phy-supply = <&usb_pwr_en>;
 };
 
 &usb1 {
-- 
2.32.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
