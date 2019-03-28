Return-Path: <SRS0=2qxk=R7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 385E3C43381
	for <linux-amlogic@archiver.kernel.org>; Thu, 28 Mar 2019 20:48:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06E7A20823
	for <linux-amlogic@archiver.kernel.org>; Thu, 28 Mar 2019 20:48:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SsdcWwMI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="sq6afwcB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 06E7A20823
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T38P/euwRr7nANVLXWLSqXVNiEfaU/eWZ/w23S316B8=; b=SsdcWwMI5sonX6
	fTsHKs8bSuPZEQ3nCKOPX6QyeStFbUeKrUkl3PvFJm+7NrU+Op4vHNnOBtt2B0Wuu64uJLTTArCoj
	uM1qChQzwg076Ix2z7rsa+HS639NsUbo7GM5hVzNgdam+ODz31qe3HCO1PODtb6WxRZcUG2Gtj8Sr
	kB6tvGEYI46wssXvvD38Du/vf+wMqxr8Tz0oUrm5tf95xhOFZZwkepk1a/aKiyY7H3IIOdwiUg8YC
	ffu0XLNlBY63jj0KMtpsJ+cb1dyX2W0AyjXNr3GdCPsUMxsTWCcGBdE7hhrOwVOJtEakD8y08qEge
	qymIUYVfhPPfp29ki9Mg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9bwK-0004yj-CL; Thu, 28 Mar 2019 20:47:56 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9bw7-0004l2-TY; Thu, 28 Mar 2019 20:47:50 +0000
Received: by mail-wm1-x341.google.com with SMTP id 4so260088wmf.1;
 Thu, 28 Mar 2019 13:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HZgQjHt1Nd6z+d3OPKfLJBIy/36DrcKsgVb4QbnZCvQ=;
 b=sq6afwcBJzuTTmJiiNyrHdhH0t7TWV9D182aXP/u6STRo5Zpq8lGYyfwWN72FArZZO
 s2IqDjgUK3IuRpA5iOXBHqNKVyiUukQa+nVTk4AmXUTysx4NA6bauHxRM3hU27bJd2/A
 LwbPI5g2of007gxUQC6bL3uDKfqYsbG2ASif3K6B7gw5opM6yL2iOqjyA7Zla23vsZoO
 kik3pgdFAekp8IxaLqejI480wjJLlEjecYu8nOSwGBDqGllKuoktmAIDiNsyXruPw3US
 FGVboJsuAKouYBYiNvvxOKXbYP5E1CLv5HPcSh95BFUU58hlsVXm/Te51iKI0JgeklBo
 WbXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HZgQjHt1Nd6z+d3OPKfLJBIy/36DrcKsgVb4QbnZCvQ=;
 b=lIV7QcHT+TO7HVYW56iL+5TlFqsDTSuBmu25AfNhs8QqRB76rtGWdyLCwhx5kaNet1
 SI5Me4pONZs7keZu0sF5km/pz70udLUGkm28LPGNN8pVrDNWp2bhKF1nioROcTRoa9l5
 D8DnBWghwhHOTObNHmGQtIv4h/dmDzZwHf8NWI8bJCkrPf+P28ilK6ddrN8NPXv/pQQR
 cF9EXCIPlpER12IjOec0DCHOBU0UeQnORfEdTTfY+6+H1HjWQJYLWE4aKhjIwchuc8vt
 kbN19UGRY9Oxan9+A9+tkSRwMrxH1QzhOaj8rpUs37JDoaHqn9eiMyQYRSEU2Aw1bizF
 rPJw==
X-Gm-Message-State: APjAAAXY1Qt8166CxSysOJ7oq0qO9+ftC2xA++kAq/IqGRbpEQA5bNz/
 u3Zt+kQy+vCuLR4UxEaprgcvHazr
X-Google-Smtp-Source: APXvYqye+k7ZxkONJ8PuOu2sCbS0dWz3UEoe9ZEiIjWyeYJpx33ACjsQ7bOl5noXG3IbU8jRcWuxlQ==
X-Received: by 2002:a1c:20c1:: with SMTP id g184mr1268390wmg.137.1553806060599; 
 Thu, 28 Mar 2019 13:47:40 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300DCD73999007CF185662A5FF671.dip0.t-ipconnect.de.
 [2003:dc:d739:9900:7cf1:8566:2a5f:f671])
 by smtp.googlemail.com with ESMTPSA id y9sm257173wrn.18.2019.03.28.13.47.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 28 Mar 2019 13:47:39 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	khilman@baylibre.com
Subject: [PATCH 1/1] ARM: dts: meson8b: odroidc1: add the GPIO line names
Date: Thu, 28 Mar 2019 21:47:21 +0100
Message-Id: <20190328204721.25970-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190328204721.25970-1-martin.blumenstingl@googlemail.com>
References: <20190328204721.25970-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190328_134743_947723_0AE96AF1 
X-CRM114-Status: GOOD (  10.06  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This adds the GPIO line names from the schematics to get them displayed
in the debugfs output of each GPIO controller.

The schematics from Odroid-C1+ PCB revision 0.4 20150615 are used as
referenced.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/meson8b-odroidc1.dts | 52 ++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/arch/arm/boot/dts/meson8b-odroidc1.dts b/arch/arm/boot/dts/meson8b-odroidc1.dts
index 3b0e0f8fbc23..0157646e3a89 100644
--- a/arch/arm/boot/dts/meson8b-odroidc1.dts
+++ b/arch/arm/boot/dts/meson8b-odroidc1.dts
@@ -234,7 +234,59 @@
 	};
 };
 
+&gpio {
+	gpio-line-names = /* Bank GPIOX */
+			  "J2 Header Pin 35", "J2 Header Pin 36",
+			  "J2 Header Pin 32", "J2 Header Pin 31",
+			  "J2 Header Pin 29", "J2 Header Pin 18",
+			  "J2 Header Pin 22", "J2 Header Pin 16",
+			  "J2 Header Pin 23", "J2 Header Pin 21",
+			  "J2 Header Pin 19", "J2 Header Pin 33",
+			  "J2 Header Pin 8", "J2 Header Pin 10",
+			  "J2 Header Pin 15", "J2 Header Pin 13",
+			  "J2 Header Pin 24", "J2 Header Pin 26",
+			  /* Bank GPIOY */
+			  "Revision (upper)", "Revision (lower)",
+			  "J2 Header Pin 7", "", "J2 Header Pin 12",
+			  "J2 Header Pin 11", "", "", "",
+			  "TFLASH_VDD_EN", "", "",
+			  /* Bank GPIODV */
+			  "VCCK_PWM (PWM_C)", "I2CA_SDA", "I2CA_SCL",
+			  "I2CB_SDA", "I2CB_SCL", "VDDEE_PWM (PWM_D)",
+			  "",
+			  /* Bank GPIOH */
+			  "HDMI_HPD", "HDMI_I2C_SDA", "HDMI_I2C_SCL",
+			  "ETH_PHY_INTR", "ETH_PHY_NRST", "ETH_TXD1",
+			  "ETH_TXD0", "ETH_TXD3", "ETH_TXD2",
+			  "ETH_RGMII_TX_CLK",
+			  /* Bank CARD */
+			  "SD_DATA1 (SDB_D1)", "SD_DATA0 (SDB_D0)",
+			  "SD_CLK",  "SD_CMD", "SD_DATA3 (SDB_D3)",
+			  "SD_DATA2 (SDB_D2)", "SD_CDN (SD_DET_N)",
+			  /* Bank BOOT */
+			  "SDC_D0 (EMMC)", "SDC_D1 (EMMC)",
+			  "SDC_D2 (EMMC)", "SDC_D3 (EMMC)",
+			  "SDC_D4 (EMMC)", "SDC_D5 (EMMC)",
+			  "SDC_D6 (EMMC)", "SDC_D7 (EMMC)",
+			  "SDC_CLK (EMMC)", "SDC_RSTn (EMMC)",
+			  "SDC_CMD (EMMC)", "BOOT_SEL", "", "", "",
+			  "", "", "", "",
+			  /* Bank DIF */
+			  "ETH_RXD1", "ETH_RXD0", "ETH_RX_DV",
+			  "RGMII_RX_CLK", "ETH_RXD3", "ETH_RXD2",
+			  "ETH_TXEN", "ETH_PHY_REF_CLK_25MOUT",
+			  "ETH_MDC", "ETH_MDIO";
+};
+
 &gpio_ao {
+	gpio-line-names = "UART TX", "UART RX", "",
+			  "TF_3V3N_1V8_EN", "USB_HUB_RST_N",
+			  "USB_OTG_PWREN", "J7 Header Pin 2",
+			  "IR_IN", "J7 Header Pin 4",
+			  "J7 Header Pin 6", "J7 Header Pin 5",
+			  "J7 Header Pin 7", "HDMI_CEC",
+			  "SYS_LED", "", "";
+
 	/*
 	 * WARNING: The USB Hub on the Odroid-C1/C1+ needs a reset signal
 	 * to be turned high in order to be detected by the USB Controller.
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
