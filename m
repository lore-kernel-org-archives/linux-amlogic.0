Return-Path: <SRS0=nqA+=MI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DD27C12002
	for <linux-amlogic@archiver.kernel.org>; Fri, 16 Jul 2021 10:38:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66A1D613D0
	for <linux-amlogic@archiver.kernel.org>; Fri, 16 Jul 2021 10:38:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 66A1D613D0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SwRlXhU5bXGiCq3M5KMt6s3tS6c1z4fSw/AiRlPo25A=; b=ARrMfMLfS4/Acu
	Cn+THskRBoz6z3pchhJWEERWlehH0mSv/jtVPn7ElPacD929hlWupgUrjI+nKPnJhpid/OuXV4DQ4
	w8lD3UWxUu1D7zdY4HHr16rHdhIJj0qcGNWI8BlnvPRSezqL/yErf+luWQj9/SM8+rG7A/K1nhAc/
	Zd7Ri9ZjJhFGN+OK1TIm5xv+txqv0KF5vLZ3+jMd4XL52E0TwShcEa0AFqZAQEKi66iX4s+ApAASN
	NVN6wml0kROXgjbo5sx4Fc47Kh4Qqwi0qoqlB0konqPsOIMr064SHBJoCUiAE7GecQDCodysRQltx
	bYy+8uDXLMkjsaPYGdIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4LES-0048jD-V3; Fri, 16 Jul 2021 10:38:12 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4LE7-0048XX-MC; Fri, 16 Jul 2021 10:37:53 +0000
Received: by mail-pj1-x102a.google.com with SMTP id
 b5-20020a17090a9905b029016fc06f6c5bso6779771pjp.5; 
 Fri, 16 Jul 2021 03:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NOqh4iRv8bzMC1v4LkBjVvsD8Lkl7UjXzwLeX3pJkx8=;
 b=S+HZDh+6imXk19NG3CPuTcEbgILrztpxAmUk0TtpzjM7XS0iHTzqBM1cQOM86udfnW
 YeMeFqO9KZmtln4zin0hp9YkejLcs0SxhITpg4a3lIu6To685WU/rrTvBIim4KfQCkFR
 GUVr3WzXiAHTjcGdTAKs9yc4eQsKZXme4S2zeaz7xqfsY0uxtS38PhMRHqZIwscoNYvI
 ULNGGcNtKRcdm8tONmPoXIsduyt8h8z5mrX3HpT4LPtWKpmXSoQFTUKZqYQuw2E1GKjf
 ZHXqcGycinnFF+I/xUJfzpZwkXkxRJZlGZWsT9R2ba69iBc5vsNrsN2pJkn/AC5Lb6Qv
 h0Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NOqh4iRv8bzMC1v4LkBjVvsD8Lkl7UjXzwLeX3pJkx8=;
 b=KdUeggV5Zuq1qE6IrmI3SzHDCZjeTPFMbiO8GIqDTx5zXp5ceUFbzN0AtGzCGV2HWP
 CtfqWqP/vdR7bEeNtmYj/r38pVWerD49GlV1gF5h2nlMyd6aX+ksZVQmea+W/f6OlENe
 vOYmZI3EGImAf1WN/3CUM0EF/XCHImhseqBST9Etd8eKZRnEZgQO+g/1vOFYVzlTfCNz
 +VWYT0HtUrIsIQ1jLay80ifx0Ot7JWDXargQQy4kFJoIAqrmgbDze293ZI8pXsg3QH+s
 8WDD+SfOBnCbLAwYmnySQ9mnpxQDfJ2i46Y79hC+gDuxEzRwMFEilhajzZ98EDzurtrR
 rg+g==
X-Gm-Message-State: AOAM533X5XgIa+KtUfpzoKzszahJklCmo8F7dybiO/h9vWBV8hZ9QZsQ
 uekhjUynRPrdooLI/3KPQCU/t6Uqiks=
X-Google-Smtp-Source: ABdhPJzH+ZY1CMrp9Is4HwQkAVX+28YqBZJDdwXI/77fszRGkHSp3wSrVmA55QJTPYuYukJ2ugUzUA==
X-Received: by 2002:a17:90a:658c:: with SMTP id
 k12mr14765303pjj.167.1626431863792; 
 Fri, 16 Jul 2021 03:37:43 -0700 (PDT)
Received: from archl-c2lm.. ([103.51.72.31])
 by smtp.gmail.com with ESMTPSA id d29sm10070111pfq.193.2021.07.16.03.37.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jul 2021 03:37:43 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Anand Moon <linux.amoon@gmail.com>,
 Matt Corallo <oc2udbzfd@mattcorallo.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Emiliano Ingrassia <ingrassia@epigenesys.com>,
 Brian Kim <brian.kim@hardkernel.com>, devicetree@vger.kernel.org
Subject: [PATCHv2 1/4] ARM: dts: meson8b: odroidc1: Add usb phy power node
Date: Fri, 16 Jul 2021 10:36:33 +0000
Message-Id: <20210716103651.1455-2-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210716103651.1455-1-linux.amoon@gmail.com>
References: <20210716103651.1455-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210716_033751_780716_00005284 
X-CRM114-Status: GOOD (  11.73  )
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
P5V0 regulator suppy input voltage range to USB host controller.
As descriped in the C1+ schematics, GPIO GPIOAO_5 is used to
enable input power to USB ports, set it to Active Low.

[    1.253149] phy phy-c1108820.phy.0: Looking up phy-supply from device tree
[    1.253166] phy phy-c1108820.phy.0: Looking up phy-supply property
		in node /soc/cbus@c1100000/phy@8820 failed

Fixes: 2eb79a4d15ff (ARM: dts: meson: enabling the USB Host
		controller on Odroid-C1/C1+ board)

Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
V1 > Fix the Input GPIO polarity from HIGH to LOW.

previous version
[0] https://patchwork.kernel.org/project/linux-amlogic/patch/20190113181808.5768-1-linux.amoon@gmail.com

changes fix the vbus-suppy to phy-supply, drop enable usb0

    USB_PWR                       2    1      0 unknown  5000mV     0mA  5000mV  5000mV
       phy-c1108820.phy.0-phy     2                                 0mA     0mV     0mV
---
 arch/arm/boot/dts/meson8b-odroidc1.dts | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm/boot/dts/meson8b-odroidc1.dts b/arch/arm/boot/dts/meson8b-odroidc1.dts
index c440ef94e082..26e8f91e0950 100644
--- a/arch/arm/boot/dts/meson8b-odroidc1.dts
+++ b/arch/arm/boot/dts/meson8b-odroidc1.dts
@@ -32,6 +32,24 @@ emmc_pwrseq: emmc-pwrseq {
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
+		 * signal name from schematics: USB_POWER - P5V0
+		 */
+		vin-supply = <&p5v0>;
+
+		/*
+		 * signal name from schematics: PWREN - GPIOAO.BIT5
+		 */
+		gpios = <&gpio_ao GPIOAO_5 GPIO_ACTIVE_HIGH>;
+	};
+
 	leds {
 		compatible = "gpio-leds";
 		blue {
@@ -378,6 +396,7 @@ &uart_AO {
 
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
