Return-Path: <SRS0=xEjq=T3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 914AAC04AB3
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 13:24:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66A2D2075E
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 13:24:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XFYe4BtI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Sj/HPZdj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 66A2D2075E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ewnzarhcjcHwNuWB8j5Rq9Gy8J54TncEQt9KjXxrILA=; b=XFYe4BtIvdkTqj
	X3TvhGnJ7lya+G0OdvoUhnd/fpJ+DSK06Nzn94pKYLi+gxKlryhQMJ/nlPsRYrkPj6vP/MrZQpy8J
	HIR4AICUxw137JAm8bVAe1jwoyFR0z7iaGXwlKY25saQYNS6cEWFLbG8eCmFtaQA8EHDniSPrOPr0
	ylLps/V9P7TW9sPpc4NgfxxxITdcFF2oMXcJkScM0WcvM5DSm37SpJ2eSHc2F2wPYhNFnUp31LevX
	xg4FBW/IiH8uyWLPHfk+HORalxHTZKonW2N0HkQlbMeKcRtI+aQYD5RGtusUFfJI2CMf2eA35ZZqz
	NBii3bQ34e8J8bpcC01A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hVFbc-0004LR-4R; Mon, 27 May 2019 13:24:00 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVFZr-0002Fk-Vo
 for linux-amlogic@lists.infradead.org; Mon, 27 May 2019 13:22:21 +0000
Received: by mail-wr1-x444.google.com with SMTP id r7so16909011wrr.13
 for <linux-amlogic@lists.infradead.org>; Mon, 27 May 2019 06:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Xq9gvQaTQshE54UN9urwGrJ/PW8MDhPcWZeqXmPnPkI=;
 b=Sj/HPZdj48Z931rhJgvmsSPg9x9RDBV6Vit7NVMr2+2LmFrs6YkavcRnQIACyyEKBC
 JB0eMOnlCkYUukcQew4/e5m9adRogWJzukVijek3voT9e65KbjkKgWGfz+8Ik/PYiH+S
 7gEPfLx8YV7Z/5btip0Pt42tqUfMg9mlMcwEJGd0dm7jX+Ty4EuFLj3C6w+bn7xQ64df
 hp5fOf44UKaxglgAZT+ff0QGs5Pb+5dqow2cPeOcf8NM/PKBzk5R+gjRsH68gIZt/c40
 FmoT3ky2FPe7kyltE3xMM/M7hovEjwNe9oFjSZ6Lfa22Xqha4QFpok8rJ0LbIv9n9RWf
 BLig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Xq9gvQaTQshE54UN9urwGrJ/PW8MDhPcWZeqXmPnPkI=;
 b=D5I/lNzpTTthtWPkahP7aczA86Bv0g6DmjTgi6iHr4vWa2dl9HI7GKE2ARrrH/Fotk
 W5VjWTcwQUyss9o223NbS+EU4AS5L3A9f55lZq3ho0lImjTZ0NyX4e7ckWmrlKRBaWdo
 48MOjn4+XQ+koas7FmO5MST5iTWYGUR5Efa2sMxEJpp8XSoz9xLAh28QLKdHqcDlOpKT
 F4Lb5Zx/TWq/OW9CeY11l7Q++Au0FBOTfztUtJGtWmwh7lYoARiiGo6QeP0I3kDL2mMI
 fB9oWMzdk3Q+9wlQ6dVzVk3sqU5dygSH2wuD+uslW5CK0oLtflIAOclrVjBsy5YTc2Bg
 77Rw==
X-Gm-Message-State: APjAAAU24jIB2H7VNFhHmZRU7URDrtZXsWEMkhhq1R0LL5LcyFHbHD4Q
 3I79VvI2miMGkrvKrZ8t5oLg/w==
X-Google-Smtp-Source: APXvYqyMfifY65haasTe+0rgvLhCeYDfEiW9wVbHqKfZPRH8VMKJlHQZKtU/12FI2Cwvig9Y8yUxLg==
X-Received: by 2002:adf:b446:: with SMTP id v6mr75583998wrd.30.1558963330491; 
 Mon, 27 May 2019 06:22:10 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id l12sm7019836wmj.22.2019.05.27.06.22.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 27 May 2019 06:22:09 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 09/10] arm64: dts: meson-gxbb-vega-s95: fix WiFi/BT module
 support
Date: Mon, 27 May 2019 15:21:59 +0200
Message-Id: <20190527132200.17377-10-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190527132200.17377-1-narmstrong@baylibre.com>
References: <20190527132200.17377-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190527_062212_452038_0356BCC8 
X-CRM114-Status: GOOD (  12.01  )
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
Cc: linux-amlogic@lists.infradead.org, christianshewitt@gmail.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Fix the SDIO WiFi support and add proper Bluetooth support on the
Vega S95 board.

Suggested-by: Christian Hewitt <christianshewitt@gmail.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../boot/dts/amlogic/meson-gxbb-vega-s95.dtsi  | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
index 4d2aa4dc59e7..9b52f3dcdd49 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
@@ -93,8 +93,7 @@
 
 	sdio_pwrseq: sdio-pwrseq {
 		compatible = "mmc-pwrseq-simple";
-		reset-gpios = <&gpio GPIOX_6 GPIO_ACTIVE_LOW>,
-				<&gpio GPIOX_20 GPIO_ACTIVE_LOW>;
+		reset-gpios = <&gpio GPIOX_6 GPIO_ACTIVE_LOW>;
 		clocks = <&wifi32k>;
 		clock-names = "ext_clock";
 	};
@@ -167,7 +166,7 @@
 /* Wireless SDIO Module */
 &sd_emmc_a {
 	status = "okay";
-	pinctrl-0 = <&sdio_pins &sdio_irq_pins>;
+	pinctrl-0 = <&sdio_pins>;
 	pinctrl-1 = <&sdio_clk_gate_pins>;
 	pinctrl-names = "default", "clk-gate";
 	#address-cells = <1>;
@@ -229,6 +228,19 @@
 	vqmmc-supply = <&vddio_boot>;
 };
 
+/* This is connected to the Bluetooth module: */
+&uart_A {
+	status = "okay";
+	pinctrl-0 = <&uart_a_pins>, <&uart_a_cts_rts_pins>;
+	pinctrl-names = "default";
+
+	bluetooth {
+		compatible = "brcm,bcm43438-bt";
+		shutdown-gpios = <&gpio GPIOX_20 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+/* This UART is brought out to the DB9 connector */
 &uart_AO {
 	status = "okay";
 	pinctrl-0 = <&uart_ao_a_pins>;
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
