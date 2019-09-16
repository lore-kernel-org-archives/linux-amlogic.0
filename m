Return-Path: <SRS0=wpca=XL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65561C4CECE
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Sep 2019 12:53:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37F862171F
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Sep 2019 12:53:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CqXjuV0V";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Q5FawH7T"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 37F862171F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EcnmD14HY2KSsveMQ0Es8Nq8TfZNJxvBw68rMz1Qfpw=; b=CqXjuV0VMnCy7E
	ksRj8J6XVee+SeINFCiVQvwkRGv5yidKWV2TagntPC4eD8pd06mlXCsPZHa0Q1VNc6pwuw2BxpE22
	mqGvLFdE6zm7nLNkh4+R8KRw0TF6S6EpkgdWvxcdeaZBfLMFb7ntCl1eCn2JkfF3gd3IZsJ3qecKL
	tV7IY6gKFoS/ERmoVucgGjF/QTGIQhlNJmIh2CLwEOu4DVP01KafG2wvX5aWel9b3UcpVkVwqe+7M
	pqGoiZUafbLUNES8xcJO+7z2k8GTouYjISMLnIbU2NnIHMU0B1xfpS6LwcSLGpMrInuAgV5/HwtHg
	euzeO2nsbYqsLbtxo1Qg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1i9qV7-0004XJ-U5; Mon, 16 Sep 2019 12:53:05 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1i9qSe-0002qc-Fj
 for linux-amlogic@lists.infradead.org; Mon, 16 Sep 2019 12:50:35 +0000
Received: by mail-wr1-x443.google.com with SMTP id i18so8058784wru.11
 for <linux-amlogic@lists.infradead.org>; Mon, 16 Sep 2019 05:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0ns66tHOzGfsnxVB+ZKZBcG/oWmkd/W2Vsc0YmaMU/U=;
 b=Q5FawH7TmHcmrJMh2wE4030BW9z4wCiBaYDKiZhIPjYFlog4b2prFnps+OkHchwF7B
 BWaCDWNrTbJbIX814Z2D5h+TTDekIF+hP8siamR1zpqAsqaDndamaHt0IGu+EMO6/dYu
 kBr37SZfWSxMuk+5Ejt54g735tjeiHuL7VfMSlZ7T1CWYUKhX2yqW2d+mGDA/7tFbW6Y
 jnQRPe+AsdsSdkd5du+0Y0gaxXti/Ck5pwYY6PpS3duyfFoBcg40g0xAVqvY9U8wnuVu
 BEGFw1H8sRxGF+XTyY970TQ0P3g0H/hpDVGNynPHd1JgNQE0/YFv7oR87w9IHARbttZo
 xfKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0ns66tHOzGfsnxVB+ZKZBcG/oWmkd/W2Vsc0YmaMU/U=;
 b=dtJ7IFCYza7XIre6mQtzDJ02dUofpRTskyFm66UfrfmoUtLS7yLQQ7UX7lcLsUYPRe
 5BGAtMTi3x30nku+X6oSwGwjSAspwKqqbzyMDKSgES+6LHyaBpEd7f9fnwdFvN5JuIZ1
 gjCCMiK6AiaNtmMBFgjWRlYW5PVSo4T7rmw4CzmOZLPxF0sz3Roe8MA/+ZvgsfEsRvLJ
 LgU40wtAxfHo+hIGriml0TqqzVrYtyyAsyvYxKdTWPXEtHFazjWkwpRkEOmyxdrf8m+B
 mQ26xu4bBvitkNUwd+RQJvEzXqiJBYrBHsIs+7tRI3kKCOVE+xhRohDsPnpWiP3aW+K8
 KgRg==
X-Gm-Message-State: APjAAAUZfwuafn82ZevxpmG2OeGipFsxNO8WflQZNt7Iovo5ezL5lm1E
 FR/iRsefnIOOSvbkprlxo3EvSQ==
X-Google-Smtp-Source: APXvYqzsfq/BuIwBYdAXlk/1o8lD0CLh/RoZ6Boua1yJWfbbATvUH6je8biFkwHt0aM1SZeaCwPcHQ==
X-Received: by 2002:a5d:4f8c:: with SMTP id d12mr10731444wru.150.1568638231062; 
 Mon, 16 Sep 2019 05:50:31 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id o12sm15109960wrm.23.2019.09.16.05.50.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Sep 2019 05:50:30 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com, lorenzo.pieralisi@arm.com, kishon@ti.com,
 bhelgaas@google.com, andrew.murray@arm.com
Subject: [PATCH v2 6/6] arm64: dts: khadas-vim3: add commented support for PCIe
Date: Mon, 16 Sep 2019 14:50:22 +0200
Message-Id: <20190916125022.10754-7-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190916125022.10754-1-narmstrong@baylibre.com>
References: <20190916125022.10754-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190916_055032_834743_EA152DAF 
X-CRM114-Status: GOOD (  12.51  )
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
Cc: gouwa@khadas.com, Neil Armstrong <narmstrong@baylibre.com>,
 linux-pci@vger.kernel.org, nick@khadas.com, linux-kernel@vger.kernel.org,
 yue.wang@Amlogic.com, repk@triplefau.lt, maz@kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The VIM3 on-board  MCU can mux the PCIe/USB3.0 shared differential
lines using a FUSB340TMX USB 3.1 SuperSpeed Data Switch between
an USB3.0 Type A connector and a M.2 Key M slot.
The PHY driving these differential lines is shared between
the USB3.0 controller and the PCIe Controller, thus only
a single controller can use it.

The needed DT configuration when the MCU is configured to mux
the PCIe/USB3.0 differential lines to the M.2 Key M slot is
added commented and may be uncommented to disable USB3.0 from the
USB Complex and enable the PCIe controller.

The End User is not expected to uncomment the following except for
testing purposes, but instead rely on the firmware/bootloader to
update these nodes accordingly if PCIe mode is selected by the MCU.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../amlogic/meson-g12b-a311d-khadas-vim3.dts  | 25 +++++++++++++++++++
 .../amlogic/meson-g12b-s922x-khadas-vim3.dts  | 25 +++++++++++++++++++
 .../boot/dts/amlogic/meson-khadas-vim3.dtsi   |  4 +++
 .../dts/amlogic/meson-sm1-khadas-vim3l.dts    | 25 +++++++++++++++++++
 4 files changed, 79 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3.dts
index 3a6a1e0c1e32..124a80901084 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3.dts
@@ -14,3 +14,28 @@
 / {
 	compatible = "khadas,vim3", "amlogic,a311d", "amlogic,g12b";
 };
+
+/*
+ * The VIM3 on-board  MCU can mux the PCIe/USB3.0 shared differential
+ * lines using a FUSB340TMX USB 3.1 SuperSpeed Data Switch between
+ * an USB3.0 Type A connector and a M.2 Key M slot.
+ * The PHY driving these differential lines is shared between
+ * the USB3.0 controller and the PCIe Controller, thus only
+ * a single controller can use it.
+ * If the MCU is configured to mux the PCIe/USB3.0 differential lines
+ * to the M.2 Key M slot, uncomment the following block to disable
+ * USB3.0 from the USB Complex and enable the PCIe controller.
+ * The End User is not expected to uncomment the following except for
+ * testing purposes, but instead rely on the firmware/bootloader to
+ * update these nodes accordingly if PCIe mode is selected by the MCU.
+ */
+/*
+&pcie {
+	status = "okay";
+};
+
+&usb {
+	phys = <&usb2_phy0>, <&usb2_phy1>;
+	phy-names = "usb2-phy0", "usb2-phy1";
+};
+ */
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-s922x-khadas-vim3.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-s922x-khadas-vim3.dts
index b73deb282120..bba98f982ad6 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-s922x-khadas-vim3.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-s922x-khadas-vim3.dts
@@ -14,3 +14,28 @@
 / {
 	compatible = "khadas,vim3", "amlogic,s922x", "amlogic,g12b";
 };
+
+/*
+ * The VIM3 on-board  MCU can mux the PCIe/USB3.0 shared differential
+ * lines using a FUSB340TMX USB 3.1 SuperSpeed Data Switch between
+ * an USB3.0 Type A connector and a M.2 Key M slot.
+ * The PHY driving these differential lines is shared between
+ * the USB3.0 controller and the PCIe Controller, thus only
+ * a single controller can use it.
+ * If the MCU is configured to mux the PCIe/USB3.0 differential lines
+ * to the M.2 Key M slot, uncomment the following block to disable
+ * USB3.0 from the USB Complex and enable the PCIe controller.
+ * The End User is not expected to uncomment the following except for
+ * testing purposes, but instead rely on the firmware/bootloader to
+ * update these nodes accordingly if PCIe mode is selected by the MCU.
+ */
+/*
+&pcie {
+	status = "okay";
+};
+
+&usb {
+	phys = <&usb2_phy0>, <&usb2_phy1>;
+	phy-names = "usb2-phy0", "usb2-phy1";
+};
+ */
diff --git a/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
index 4fe7d33ebe8a..90815fa25ec6 100644
--- a/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
@@ -246,6 +246,10 @@
 	linux,rc-map-name = "rc-khadas";
 };
 
+&pcie {
+	reset-gpios = <&gpio GPIOA_8 GPIO_ACTIVE_LOW>;
+};
+
 &pwm_ef {
         status = "okay";
         pinctrl-0 = <&pwm_e_pins>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts
index 5233bd7cacfb..dbbf29a0dbf6 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts
@@ -68,3 +68,28 @@
 	clock-names = "clkin1";
 	status = "okay";
 };
+
+/*
+ * The VIM3 on-board  MCU can mux the PCIe/USB3.0 shared differential
+ * lines using a FUSB340TMX USB 3.1 SuperSpeed Data Switch between
+ * an USB3.0 Type A connector and a M.2 Key M slot.
+ * The PHY driving these differential lines is shared between
+ * the USB3.0 controller and the PCIe Controller, thus only
+ * a single controller can use it.
+ * If the MCU is configured to mux the PCIe/USB3.0 differential lines
+ * to the M.2 Key M slot, uncomment the following block to disable
+ * USB3.0 from the USB Complex and enable the PCIe controller.
+ * The End User is not expected to uncomment the following except for
+ * testing purposes, but instead rely on the firmware/bootloader to
+ * update these nodes accordingly if PCIe mode is selected by the MCU.
+ */
+/*
+&pcie {
+	status = "okay";
+};
+
+&usb {
+	phys = <&usb2_phy0>, <&usb2_phy1>;
+	phy-names = "usb2-phy0", "usb2-phy1";
+};
+ */
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
