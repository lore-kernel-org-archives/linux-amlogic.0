Return-Path: <SRS0=ej2R=UC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37896C04AB5
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Jun 2019 10:05:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D87E28071
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Jun 2019 10:05:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LB+N9dmw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="DdmABLlI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D87E28071
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3h38rh9Ph6Z3JRCALSW3bQlsAYgf3fLrteGPHTeTZ2Y=; b=LB+N9dmwxCPPWV
	pAU9dRx3zBUidlhM8L7o838+cSFgnR5jCZjYCLAxEcdhlDlr7d8nwjAB4A+LVlyyinhGUam9UwMdn
	xoM/1Y77OvAaS1VMG0P/d0LHI4avY1dDlMp5SrnZHxW5R0zO5nBHQRTyTMTFxnzirLRmYSxbW0Ezi
	mSZouCOU0W0qUNN5dPSPu48sS5dlL6/YXA8OnCdIbRo6NjFUjJozQN0s8pgTLuu7k09XIqfF6CULM
	efZCCa/ApSJs85/cinso0yEadhFjFBTthxwWGUJEuKFtTq+F1xhMXp+xgsB6CaGtTr7AZtLWr2Hxe
	UN76NAZdIedpj5tAOj4w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hXjpl-0007f4-T8; Mon, 03 Jun 2019 10:04:53 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hXjoy-0006Vi-0x
 for linux-amlogic@lists.infradead.org; Mon, 03 Jun 2019 10:04:06 +0000
Received: by mail-wm1-x341.google.com with SMTP id g135so7303632wme.4
 for <linux-amlogic@lists.infradead.org>; Mon, 03 Jun 2019 03:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YMQH+YmMqEi+gsXseHBWQuJ/Imet99lfOVHmWm+WY1U=;
 b=DdmABLlIarebcQdqi3kcWqkFCKN8OCuNG59wewyDGcKAmrYKfr4JXLl1AP6wzl3YnU
 cafRtqasdDcyAiVJ1sbLHANKERnpmh+6duZfsY8gKWAXzaEw+YRofetU93bp1TwWWjT1
 2JQCeHyGP0sIj91aN+eYFRhbHw7QgLBofq5ImYTNMbTpKVhB3SI7gIdVQXuZs93/kyBY
 PHLRTZXOWh4QigbIJpr+9Plzf4c58yNlDaY1APglo5023V6SHJdFFiQgB5lpbkMjZGZh
 0j26+h44qPOXglXqXVh/dkcJ2Rfq5Qrmim/TrYizfEvchBGLPcnAvQplDPEl/jktQQJ5
 qilA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YMQH+YmMqEi+gsXseHBWQuJ/Imet99lfOVHmWm+WY1U=;
 b=fzgNdirBHd25IyvvYuY0/qXmQTkUSmcR5WWMiLmWoyTmVld9yOmMxgPHrVejy2Qphn
 Bwss61S4Da/EHsb3wZ4gBCnlubVkKFKmObCVh4kEj7ze+YU4vr84kW2WcxNMDKpv7Rhf
 UIYTCoVsFCEoWTf31dBhUtuYtMj9m073Rkkv00UKDB5WxLjUaUJP7xkdV3ARHIjDqMX2
 /mbtCGe6TD94959ztLodvoQGV79ZkEEO8m+QmEjYxT6Ine/3rmOVBBaPmGR7gEiufLSq
 lgAm/6O4dyy/NpMaYEUdU1EjpbVLTCp5lqx9bIVaEpuF01Wn3D3XCXHahe9D5OICOtUz
 jOjQ==
X-Gm-Message-State: APjAAAUvcKhrx5oReN/IYMBIVxHBW9Htkc0KRafbtlG64ZDG6TPzg/t9
 YXZbbOkBqcPNT+7LRFvKN0XauQ==
X-Google-Smtp-Source: APXvYqxdgJNt/Z8H7RA95G1FQJxTUqwXFFclxWFD9X0UAVrW1pgptWbzt5ot7MgiYRg+s06Hj5jzqw==
X-Received: by 2002:a1c:5546:: with SMTP id j67mr1855939wmb.80.1559556242355; 
 Mon, 03 Jun 2019 03:04:02 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id o3sm11282098wrv.94.2019.06.03.03.04.01
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 03 Jun 2019 03:04:01 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 4/4] arm64: dts: meson-g12a-sei510: Enable Wifi SDIO module
Date: Mon,  3 Jun 2019 12:03:57 +0200
Message-Id: <20190603100357.16799-5-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190603100357.16799-1-narmstrong@baylibre.com>
References: <20190603100357.16799-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190603_030404_179427_782B5253 
X-CRM114-Status: GOOD (  11.43  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The SEI510 embeds an AP6398S SDIO module, let's add the
corresponding SDIO, PWM clock and mmc-pwrseq nodes.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../boot/dts/amlogic/meson-g12a-sei510.dts    | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
index be1d9ed6d521..5a97379f2417 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
@@ -128,6 +128,20 @@
 			no-map;
 		};
 	};
+
+	sdio_pwrseq: sdio-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&gpio GPIOX_6 GPIO_ACTIVE_LOW>;
+		clocks = <&wifi32k>;
+		clock-names = "ext_clock";
+	};
+
+	wifi32k: wifi32k {
+		compatible = "pwm-clock";
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
+		pwms = <&pwm_ef 0 30518 0>; /* PWM_E at 32.768KHz */
+	};
 };
 
 &cec_AO {
@@ -174,11 +188,45 @@
 	pinctrl-names = "default";
 };
 
+&pwm_ef {
+	status = "okay";
+	pinctrl-0 = <&pwm_e_pins>;
+	pinctrl-names = "default";
+};
+
 &saradc {
 	status = "okay";
 	vref-supply = <&vddio_ao1v8>;
 };
 
+/* SDIO */
+&sd_emmc_a {
+	status = "okay";
+	pinctrl-0 = <&sdio_pins>;
+	pinctrl-1 = <&sdio_clk_gate_pins>;
+	pinctrl-names = "default", "clk-gate";
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	bus-width = <4>;
+	cap-sd-highspeed;
+	sd-uhs-sdr50;
+	max-frequency = <100000000>;
+
+	non-removable;
+	disable-wp;
+
+	mmc-pwrseq = <&sdio_pwrseq>;
+
+	vmmc-supply = <&vddao_3v3>;
+	vqmmc-supply = <&vddio_ao1v8>;
+
+	brcmf: wifi@1 {
+		reg = <1>;
+		compatible = "brcm,bcm4329-fmac";
+	};
+};
+
 /* SD card */
 &sd_emmc_b {
 	status = "okay";
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
