Return-Path: <SRS0=bWzJ=UG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4D56C468BC
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Jun 2019 14:49:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88AE62083D
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Jun 2019 14:49:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="S5C+T4Oz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="m/K9VzHs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 88AE62083D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sexNnBaxJKGVLevED3T1DC0wDQ3R4+DtocNSjmomHYo=; b=S5C+T4Oz4cG1Wv
	FFXGbQrWTZTR7oD/GCUdRNuSpEgH4WcTkP2uHsywk2CWR2pWeCmdAFMYagx4IOKA6B8K6raGREvaV
	ODULVD9dYIFhUUz8yGEf1JczygPxu+ypitVwE8Cz8I2T2v226ikp4EYuoJMvi94zVfTkppbQv750t
	qpYgbcGDGssM2yQ53IQ6jROZRdbnlmTS30pyNNzVoDhPiQ7rnIGwJoH7SmFeDxXvBdYfue8xPpbid
	nuUKTSTae1sbTCTXvObVoDX30VQceXWcxnToYsQU6wf62/aYWZXuFnRqOXxKzAx5ZTwp4Fd4MIYZd
	ZK7nVbDuORkW0vLXcEyg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hZGB7-0002W9-0l; Fri, 07 Jun 2019 14:49:13 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hZG9e-0001BV-0f
 for linux-amlogic@lists.infradead.org; Fri, 07 Jun 2019 14:47:46 +0000
Received: by mail-wr1-x442.google.com with SMTP id v14so2452365wrr.4
 for <linux-amlogic@lists.infradead.org>; Fri, 07 Jun 2019 07:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/q31YJBntN7aERDn31WI4iT/fxCa5CdKI5jVgevLIGg=;
 b=m/K9VzHsqgtdqCgZnn8FiXFVa2tmOrV/uYTohpN41eUsEfmLuX4FjOkht0Es8GNV8M
 1rjOE/orKbGwIzp34kaqjOM/wWt7ZozDMQAdgZVG3UNqGaWECo/TbXHqW+u8zISJeXM2
 0H8/udl2i10r6WquXUwgiOsODs8vMYvOHya23dQ2JFbxx3YF+jffpCKHX36cHvlmy1Vo
 EPlhXiTqUHA/iEptOv6wCIlS1kJC1JirNrXHkaZqlL5aMmxFZMCEa9Ns3M8siQ7Exfl4
 /b5sdGGxvPBHz0YxcRzrGR5HsIkZEeDznqlljPXo607dbxGJdX8sYySfaPRrORFZljcn
 IU6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/q31YJBntN7aERDn31WI4iT/fxCa5CdKI5jVgevLIGg=;
 b=SrgtZbPFEvUk4nVDtj5hW0tEKAeEn9WsC9Z1hB3eDHgz0L3uBL6cweBpuEBbopmtx/
 SIJp3U6zbc5lzS+21ND/ycKuxzjVOf+2hNJ5vF3a3U572/hk4b1wJwWD7D7ccWudwBxg
 8LHO7g29VDc09S7vouu/fhfLgk7JgZENQ/kl8gUftdTevZ47+EpYgZzQTT1tqFr/lsIT
 lU3C6Qs/KZVvEsv6sOCJ0XHiQIa3jYZCZSU+31adqd9V6zxEC1Ke0f5w4swxXrHe/olz
 xMFVKmPlCHnbcvGX1FJokDmumlfNTpIwx/SYo9Xiqy+GSeiSMp0VXMMK9RrvjMY6tCR9
 QnLQ==
X-Gm-Message-State: APjAAAUZUp+MpjUUiZlInrTK6FaCc4EX43lW6bvZdqXwTmSO2WHck8Fo
 gUKIdR5XfNeGor7uW3iQkOElZQ==
X-Google-Smtp-Source: APXvYqx7nN0vbFi+WM1m4IK4O4uZDD/Xl1Qx+n1xucGQ8GFrcb+e0WJvGAdiLqpAfIS5NRuz4n7VyA==
X-Received: by 2002:a5d:6243:: with SMTP id m3mr3374922wrv.41.1559918860294;
 Fri, 07 Jun 2019 07:47:40 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id q20sm5184516wra.36.2019.06.07.07.47.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 07 Jun 2019 07:47:39 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH v2 1/3] arm64: dts: meson-g12a-x96-max: add support for sdcard
 and emmc
Date: Fri,  7 Jun 2019 16:47:33 +0200
Message-Id: <20190607144735.3829-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190607144735.3829-1-narmstrong@baylibre.com>
References: <20190607144735.3829-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190607_074742_119169_E7E8DB0B 
X-CRM114-Status: GOOD (  10.93  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, Guillaume La Roque <glaroque@baylibre.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Guillaume La Roque <glaroque@baylibre.com>

Add nodes to support SDCard and onboard eMMC on the X96 Max.

Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../boot/dts/amlogic/meson-g12a-x96-max.dts   | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
index 5cdc263b03e6..69aae6c03dc5 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
@@ -45,6 +45,11 @@
 		};
 	};
 
+	emmc_pwrseq: emmc-pwrseq {
+		compatible = "mmc-pwrseq-emmc";
+		reset-gpios = <&gpio BOOT_12 GPIO_ACTIVE_LOW>;
+	};
+
 	flash_1v8: regulator-flash_1v8 {
 		compatible = "regulator-fixed";
 		regulator-name = "FLASH_1V8";
@@ -172,3 +177,38 @@
 	status = "okay";
 	dr_mode = "host";
 };
+
+/* SD card */
+&sd_emmc_b {
+	status = "okay";
+	pinctrl-0 = <&sdcard_c_pins>;
+	pinctrl-1 = <&sdcard_clk_gate_c_pins>;
+	pinctrl-names = "default", "clk-gate";
+
+	bus-width = <4>;
+	cap-sd-highspeed;
+	max-frequency = <100000000>;
+	disable-wp;
+
+	cd-gpios = <&gpio GPIOC_6 GPIO_ACTIVE_LOW>;
+	vmmc-supply = <&vddao_3v3>;
+	vqmmc-supply = <&vddao_3v3>;
+};
+
+/* eMMC */
+&sd_emmc_c {
+	status = "okay";
+	pinctrl-0 = <&emmc_pins>, <&emmc_ds_pins>;
+	pinctrl-1 = <&emmc_clk_gate_pins>;
+	pinctrl-names = "default", "clk-gate";
+
+	bus-width = <8>;
+	cap-mmc-highspeed;
+	max-frequency = <100000000>;
+	non-removable;
+	disable-wp;
+
+	mmc-pwrseq = <&emmc_pwrseq>;
+	vmmc-supply = <&vcc_3v3>;
+	vqmmc-supply = <&flash_1v8>;
+};
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
