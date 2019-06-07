Return-Path: <SRS0=bWzJ=UG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B688CC468BC
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Jun 2019 14:49:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C0B1212F5
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Jun 2019 14:49:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="f2D9OwNc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="eqpJtEhp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C0B1212F5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2lbA+9lzZuPnWB2U6mZ/vNqBPL4DrilM/smMoUNszwU=; b=f2D9OwNc/hkV3o
	ZoxnNfjV527dRQdA3J/ilioHqDwDX5hA1VGffMIiA83Uf/7TBxPzCjhJvyCkT8eP7XO9USxzG/2vb
	6d49gmOqt9BYLd0oy4yt0N2BaPUn8atK2/3LIgJAD8cX6upJtoXow/YdDKpjpf1Zls9wSgwpOsTBJ
	DvGA7Rcb7GSMRdEWd8QW8ClvjPOaSyHq3PzeYxYVipuq9h0p045J2aZ1WCETy9mzLDN2k08O+2Z34
	zr5aGW32kgwwiIwbmmnHjUX4/B1OTRA6scX0EOJAkw/zHiU75CuUeZp92J6+04USCgDw64FUeRoLw
	SMsGhS0NIdKkjSeFK53w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hZGBY-0002vC-Gp; Fri, 07 Jun 2019 14:49:40 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hZG9f-0001Ci-B2
 for linux-amlogic@lists.infradead.org; Fri, 07 Jun 2019 14:47:46 +0000
Received: by mail-wm1-x342.google.com with SMTP id 22so2195538wmg.2
 for <linux-amlogic@lists.infradead.org>; Fri, 07 Jun 2019 07:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lZkZr6EziWsPNbkH40RoVyz/4NEqFV1sE9ycOq6JdzQ=;
 b=eqpJtEhpH+OXz8eQ5Au51p7DYK/OWw2oSYWxJqlNVdEnI71fvOcr/E5+N+gdn1pUe3
 v9tUucsG1pIVpd5sqmfpnmts843CPSFB42eEpmDQb8BhJlgPKAH/qGSUdQyv7KYk57Kt
 LjW7h3V+7V9gFsaVoGWBHrMx4AoCy1JDblj8xksshzoh4+PN56NbpqKAinTzGeCHSucM
 znwVx9TmGxqyLcjdHK1FPdQw7dpwPpdair3kWj06MtTosDkXEU99QEvyLXmuHVBqlPna
 DOLAoNyJNj4HYPpJJOle9JjI/9MdZYqfBSuhStGtNZ75Id4Yjov4ib8/cD4k8LwTZji9
 nm+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lZkZr6EziWsPNbkH40RoVyz/4NEqFV1sE9ycOq6JdzQ=;
 b=TRquCF6VjCoVcxkMzchr5lFUlISiE/do5yBle0fuKL4YFD8ZHTL9FgnSOLq+nsUJNj
 mWyFwnFfEv+DcjDGxvUyO7wXIdoPdLE7nuSbKKeme+x+2m6xAfRersKSEbzptyWbzIo3
 MqXaRJ9jCwIfVP2WNWNZvaTqJEbQpnLwBw/TEWDw2PZG+2fk041LTk2hq1w6CMW1o4Sl
 3lucqrSlW0UAqP1OMJdMrcWnHklSd/uOMptwGr2RPHNzxZdN/m+sRavt384/jJw0+LMk
 IFaCXZR7mSIKpamKHpN8iYqQ/cp/k+vw0tJAK1EnCkpzXVpQJuI/m1/BTHiTyEM3nEll
 W7ug==
X-Gm-Message-State: APjAAAVviyD+GBo1j/piyYVuXicLSD2k/W6Zh4nsZyq1Vi1Sai0re+QZ
 FGTGtxxVzokpMdnRZOa20M2w1w==
X-Google-Smtp-Source: APXvYqyDd2VI/H4vsvCIyOTgJOV/JMwi2X8GQ5jPzrFPlCxLzMvdW2iCCef0MhC5PTSOKQc9dwebdw==
X-Received: by 2002:a1c:2c41:: with SMTP id s62mr3980950wms.8.1559918861330;
 Fri, 07 Jun 2019 07:47:41 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id q20sm5184516wra.36.2019.06.07.07.47.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 07 Jun 2019 07:47:40 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH v2 2/3] arm64: dts: meson-g12a-x96-max: Enable Wifi SDIO Module
Date: Fri,  7 Jun 2019 16:47:34 +0200
Message-Id: <20190607144735.3829-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190607144735.3829-1-narmstrong@baylibre.com>
References: <20190607144735.3829-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190607_074743_411488_AA343746 
X-CRM114-Status: GOOD (  10.76  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The X96 Max embeds an AP6398S SDIO module, let's add the
corresponding SDIO, PWM clock and mmc-pwrseq nodes.

Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../boot/dts/amlogic/meson-g12a-x96-max.dts   | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
index 69aae6c03dc5..345c9277cc4c 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
@@ -50,6 +50,13 @@
 		reset-gpios = <&gpio BOOT_12 GPIO_ACTIVE_LOW>;
 	};
 
+	sdio_pwrseq: sdio-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&gpio GPIOX_6 GPIO_ACTIVE_LOW>;
+		clocks = <&wifi32k>;
+		clock-names = "ext_clock";
+	};
+
 	flash_1v8: regulator-flash_1v8 {
 		compatible = "regulator-fixed";
 		regulator-name = "FLASH_1V8";
@@ -114,6 +121,13 @@
 		vin-supply = <&dc_in>;
 		regulator-always-on;
 	};
+
+	wifi32k: wifi32k {
+		compatible = "pwm-clock";
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
+		pwms = <&pwm_ef 0 30518 0>; /* PWM_E at 32.768KHz */
+	};
 };
 
 &cec_AO {
@@ -155,6 +169,14 @@
 	pinctrl-names = "default";
 };
 
+&pwm_ef {
+	status = "okay";
+	pinctrl-0 = <&pwm_e_pins>;
+	pinctrl-names = "default";
+	clocks = <&xtal>;
+	clock-names = "clkin0";
+};
+
 &uart_A {
 	status = "okay";
 	pinctrl-0 = <&uart_a_pins>, <&uart_a_cts_rts_pins>;
@@ -178,6 +200,34 @@
 	dr_mode = "host";
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
+	vqmmc-supply = <&vddao_1v8>;
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
