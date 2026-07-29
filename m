Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E2D1C54F51
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Jul 2026 17:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ax6GIsovy09nwgbQ2kGPl3wQ2cyePVW34WgMmkyHRP8=; b=FPoTyp84Pv8f2Q
	OcgejnkoQegjbuDQZQOX+AmXmtJES7esvUUX3AMPSptNvPub4UgWBy4RqLE/fTWRgtVx0DwC7U/N6
	3pw1xMHeoJVXx4O88Zj1pXLpnSRdX1iF6K47O7K51fHy9Ar4814Tzpaetj5GYj1kUSH9MMEMdDWgb
	7tBcpXv6lj9Nz7G1jpzDVMHbJWbYHE15Y+EGVHyVzlPEXGJu110K9eP/gGOOl0rLPYRmqJp6Yz3oK
	9uqm1nNPVauFqetA5bqtbglH9tWJO/7/rjxxbIzOqo38/4kTELvGQcAUTjh3j93s4xYA7HMdhj0JK
	Gj0Fw3Ij/VtnF7TErOWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp8RT-00000008kBc-1YbG;
	Wed, 29 Jul 2026 17:51:43 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp8RQ-00000008k9C-30AS
	for linux-amlogic@lists.infradead.org;
	Wed, 29 Jul 2026 17:51:42 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-49557167508so10910975e9.1
        for <linux-amlogic@lists.infradead.org>; Wed, 29 Jul 2026 10:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785347498; x=1785952298; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mHfyftPnrfhvR2Ntml4St86c0F/ZubW4Z9YdS0+Y/vk=;
        b=Cs8T/7zG/INDhju7TNePurpX8i+XtZ0xsrmjuhIyFtgz0YNDIqcU5x/l1WsrHzmdxC
         FjeqjdjqMh+JZ39Ox+wY5Bohom/cykkuoHPTH7S84YOfKNoDSdRMCYrzXYgBOc78KjYz
         krAufL4IzVsoforj1HhZzWTAfYlIxusIZYKwMhwR2cwIBoptXeL9EQWDCRL9XrYNxODt
         IoNj+jTLfaPAJK3iIrJ5mIKGaIep1Au8DKkje1I9JVOK6KNxssRkRx412QDnluyNyZfC
         qmsG0yqJqMkKn2fqtNbcNZVQHBTuiDpNANAtqDrTt7JW9xFmNxdJuQOEjLv+eaLw3+j8
         +ExA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785347498; x=1785952298;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mHfyftPnrfhvR2Ntml4St86c0F/ZubW4Z9YdS0+Y/vk=;
        b=pgH0q2nJ0ArPQYUTfklKtV25zmGwHYWFz2otCbRxhnqRnpG+EWo0TZOjak/rcyM2ab
         lU8ZwwFje1BGPPDgKfNrot96vIJtXAXoztNT0tIY2fZEYTqFmA7zw/DHXmsHLXUTzzvM
         u4lp19Z0AdslQzHQNfAwD5jnhdt4CYBnetSUHu5d1CZnZOLgd08tfMSthTsUz4w+7Xj7
         Iy4QDaCQO/MMagHl23jbumEZ4l92TmwG99sz8ZkV1hymHUngvi439E6Cu5S/8DoovDR2
         0ePqxSV7FREMznKw0+EMpfoz8gOrOqPrYX48qW6AsmiB3X5nU7p+EXbzWfzl97dVreNB
         nXvg==
X-Forwarded-Encrypted: i=1; AHgh+RpNaY9uudRqaG31bPi4pbtznkxsoabdo/8xlZdn3uPtiNHLijF/0lNG+M7wbasnrxqzxuQiWbByV9Ij4AAp@lists.infradead.org
X-Gm-Message-State: AOJu0YxY3zNoAHCjSoQdDCJOSxEYWnc133JH+/BuEMqrLLujYg1zkkbZ
	szyNnIxCvcqVnKGXTRUrHBtNWVFQuvNQUCfy9BSghEQ9Ca+gIVIhk+C2
X-Gm-Gg: AR+sD11AqY8ULzsuA+hbpRtMttzFluCFlvd0uKuYdhDIFMjPwIlSuyzn7+V+saAArzU
	GPhzrMKXlrz8Vt3mb5aupKwTiR4RiCSmNDgAXy7k/zmnhJcDQEg4sjmkYU3AzFS9/+oQNLZAr+U
	ZNg6Ro4X1lIIOfX+HdxD05IdvfZqAzmptxkeivBFF6U9pGpC4WZEcsZZ62hzg0XQ+vH/XbZ4QTq
	2tK1GYrP7K6TKrHO+viKfLo9V6X5XpzDNzDcueTqOxqY5i9DHUTCm8r4GqY0M9PsV4Xn1q+2DNa
	f310IaR6bYcU/g9WI8OrSsvvnCDqJvmX6YIt6S+jwhad47RkudUQPixmDSOYxvcQ/5i4J6vBNYj
	nkDvfaSXaokwChoMPBZMUam5tlN6rnPPL0p9mDZK+XwAdvdMaPBLyeLWDIm/GebPJG8Ia0bk4Nq
	DgX9pepd2IFRE6V9Nu2cXEiA1zZt1QPBPWqN5LOIyFWCx1vVmLoWj/dt6sh85TMfqdP9wTk+XJU
	BwQ9lig+O+VGM2BaMOcBA==
X-Received: by 2002:a05:600c:4693:b0:495:5045:39e6 with SMTP id 5b1f17b1804b1-496c643bc85mr87358905e9.17.1785347498162;
        Wed, 29 Jul 2026 10:51:38 -0700 (PDT)
Received: from slackboot (93-34-146-61.ip50.fastwebnet.it. [93.34.146.61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4976bd83fabsm75723775e9.15.2026.07.29.10.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 10:51:37 -0700 (PDT)
From: Alberto Robazza <robazzalberto@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	neil.armstrong@linaro.org,
	khilman@baylibre.com
Cc: jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	Alberto Robazza <robazzalberto@gmail.com>
Subject: [PATCH v5 0/3] arm64: dts: amlogic: add support for Orbbec Zora P1
Date: Wed, 29 Jul 2026 19:51:31 +0200
Message-ID: <20260729175134.92909-1-robazzalberto@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_105140_766686_3A117C35 
X-CRM114-Status: GOOD (  12.85  )
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
Reply-To: Alberto Robazza <robazza.alberto@proton.me>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The Orbbec Zora P1 is a vision development board based on the Amlogic
A311D (Meson G12B) SoC, with 2 or 4 GiB LPDDR4, an Ampak AP6256 combo
module (Broadcom BCM43456 Wi-Fi over SDIO and BCM4345C5 Bluetooth over
UART_A), HDMI output and Gigabit Ethernet.

According to its specifications and original device tree, the board is
a revised version of the ODROID-N2 with Wi-Fi, Bluetooth and an Amlogic
A311D instead of the original S922X. The device tree therefore builds on
meson-g12b-a311d.dtsi and meson-g12b-odroid-n2.dtsi, mirroring
meson-g12b-odroid-n2-plus.dts. It extends those descriptions with the
board-specific AP6256 wiring. The status LED is green instead of the
original ODROID-N2 blue and has inverted polarity.

This series consists of:
  Patch 1: add the "orbbec" vendor prefix.
  Patch 2: document the "orbbec,zora-p1" board compatible.
  Patch 3: add the meson-g12b-zora-p1.dts board file and Makefile entry.

The DTB was built, validated against the amlogic.yaml binding using
DT_SCHEMA_FILES, and boot-tested twice on the board. The AP6256 Wi-Fi
interface enumerates and operates with the GPIOX_16 reset and PWM clock
description present. Removing the wifi32k and pwm_ef descriptions causes
the SDIO Wi-Fi device to stop working on this board.

---
Changes in v2:
- Investigated the apparent GPIOX_16 overlap between the SDIO power
  sequence reset and the 32.768 kHz PWM clock. Retained the description
  after two successful hardware tests; removing the clock description
  prevents the AP6256 Wi-Fi device from working.
- Sort the new DTB entry alphabetically in the Amlogic Makefile.
- Sort the "orbbec" entry alphabetically in vendor-prefixes.yaml.

---
Changes in v3:
- Polished meson-g12b-zora-p1.dts.
  - Use proper comment with /* and */.
  - Use the new bindings with function and color properties instead of
    label in leds node.
  - Include dt-bindings/leds/common.h.

---
Changes in v4:
- Dropped unnecessary sentences from patch 1 and 2.
- Renamed "wifi32k" node to "clock-32768" as updated guidelines suggest.
---
Changes in v5:
- Add Krzysztof Kozlowski's Acked-by on patch 1/3 (given during v3
  review, was accidentally dropped in v4).

Alberto Robazza (3):
  dt-bindings: vendor-prefixes: add Orbbec
  dt-bindings: arm: amlogic: document Orbbec Zora P1 board compatible
  arm64: dts: amlogic: add support for Orbbec Zora P1

 .../devicetree/bindings/arm/amlogic.yaml      |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/amlogic/Makefile          |   1 +
 .../boot/dts/amlogic/meson-g12b-zora-p1.dts   | 105 ++++++++++++++++++
 4 files changed, 109 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-zora-p1.dts

-- 
2.55.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
