Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F17AC53219
	for <linux-amlogic@archiver.kernel.org>; Tue, 28 Jul 2026 15:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OwpOuG7ISe1ZlV0+viVvuU/5rSqpyR+G+ivPa5OX2ME=; b=VOfH+ITP1scGGP
	qe3NJABT1c52xYbaJCifD2q8n5rwPLwGAPjUF+oC0cqgAgn6UNnq7z7pm6agoWOClQ+vN+nC1QsJw
	cYws24tFdO5q5eYU7hBCxEi2JVF9wEFML5TCKrPNu4KqXY94ry3md6goDKfnBKabeCjr1mJb2s0g8
	9xFJ49amwJPgV4jKjMbE/REjS8O3MQTAQnTIe7peNdR2bU7VT+epfv1OuMQfoGTVIQwyOtmMKDLm/
	KTt+gOHFtmD9VZDkrgK7GAGD7BP/URgd9lr8+p4CkT5UxjWR/h9eZcztrz218jX3Qiwsr+SjBpPgZ
	0kxYGZqrPaV0bOhhaZyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wojXy-00000005c6A-18Qv;
	Tue, 28 Jul 2026 15:16:46 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wojXv-00000005c42-3pZZ
	for linux-amlogic@lists.infradead.org;
	Tue, 28 Jul 2026 15:16:45 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-47f703a9d05so1584f8f.0
        for <linux-amlogic@lists.infradead.org>; Tue, 28 Jul 2026 08:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785251802; x=1785856602; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/TYvBUpeT2RltElx7WsXqQl+6E8angCl/PINS2CX8a8=;
        b=f3TK6vDf30x+u7NRRk5giMe8/0l2zNGlD2izVpVEPMVODGXR2SqpPoeaFB5Cc9i6+J
         NBQ1Xzd/iMkUqkRonWPxjuNze+nkKaw6XJ1osIk5KK848gfWyeEoeAsKgHPt7PXtLNpx
         I/Dr5M6YfQcIsy8d7kP7hPEwSGVOlCaDNUss/HrORVJdkSY1n/40KQNF3bKWdIydaRJJ
         aF51tiS8XXzc5eiGB2ojSgN3woK9Fvy/L+rqO4i050KGWyQuG6Jf2x0W9owA3PRBEbXz
         NHm0NdHy5Ht7wRLlcbWwgNGuc9qdNG1ZM5T5kju9OrfDp3Ppxu7ZSjDw/WMUPbma4zvw
         kB+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785251802; x=1785856602;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/TYvBUpeT2RltElx7WsXqQl+6E8angCl/PINS2CX8a8=;
        b=nmYugXOVXA/fBvbaZpcknhFcfPtRI3uuHl0xs9he7eQ06tbdJuH6/rrN5fAWD6os2/
         9DcRILlm3yK9ybi8lxW8I9nuIfw3ulXJ/vF0H6vJDjvS8fP1FQaE7amOkMmv72UYeG2m
         lbv9xpmrJAS3Lon3ZfBSMKPnRxLfLtlfwsNtYLM9t1K2B8h38Aod+Rcy5NbZ+1nIWfpn
         elnz6iGDZjb3LhopHI2TleipuoJWSOGvsnYpNavo0w5uy6SuWAJjnkYA6Cn3l0MO0I5R
         N0mTPNEy2srjZp5Lpg6Gq/7IiECebWSEQ5LLzl17/C/hUupl65JINB/qU3dXaWWetWzN
         E18Q==
X-Forwarded-Encrypted: i=1; AHgh+Rp6wukMGVsk77gieDsu7zMpjecOGsK1Ps2YEW4VwLHfhmwI08vhzH7sMtvulaG6PmatDMz1fDshvx30P5yA@lists.infradead.org
X-Gm-Message-State: AOJu0YyhiH25YEeXmau+4FExGoZGDrCUZSN3tsHakmGQ9jw1K4gY1rA8
	9xVhobaLwLs4oXBFZYJHKBBk5HaIqXhxeG9YjDw0VahViM67A+VpzbYP
X-Gm-Gg: AR+sD10Oa4fZD0ZjEswDEF3YRkicO/mg6D77fuvHnsRuOR4HlZk5RCT7eqf9ZXDlN1n
	n04NeeEifE3qon1km3NTfeH86WklBKei553A6z2fyj0nXntbXB7vAb5EQp2CCEVgHcWNf66rNMs
	Mpja6rRgaLAxJNv1CqZ0owtaggTeA/hyAGGzJLaHcrvlWZmqWjrk/eleF7MS5q2CRiPqek9sDUe
	w7SPcoY9BEw4IK0KbExawYe1RgyRSvyGvNM/hYqfz0zVcLic+G7+LgfOEYITVzo6DqGZqlMSycG
	Rj2IT8fTQ0TrGgUkjFoQgsuEp2dED4ur2ZaLJ/RDcCb1DyG8VDzQkXOt9XjJX5q4b1S3Ud9SYy1
	r7K0xTL5HRQYBCAgJRNK6yp7dvMGo5m3i71kXPX3USQduigthy+FfksIT6nfc1aScl1U1wCA3qW
	pustgYwabtHjymfzF1aQOqu5CN8b20g/PKkHYdGVYQ6Sci8g==
X-Received: by 2002:a05:6000:4918:b0:47f:5a97:2a5d with SMTP id ffacd0b85a97d-47fb1e5cd25mr3577209f8f.11.1785251801287;
        Tue, 28 Jul 2026 08:16:41 -0700 (PDT)
Received: from slackboot (93-34-146-61.ip50.fastwebnet.it. [93.34.146.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c631fdsm58422500f8f.28.2026.07.28.08.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 08:16:40 -0700 (PDT)
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
Subject: [PATCH v3 0/3] arm64: dts: amlogic: add support for Orbbec Zora P1
Date: Tue, 28 Jul 2026 17:16:33 +0200
Message-ID: <20260728151636.236393-1-robazzalberto@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_081644_015793_29AC3670 
X-CRM114-Status: GOOD (  12.94  )
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
- Polished meson-g12b-zora-p1.dts
  - Use proper comment with /* and */
  - Use the new bindings with function and color properties instead of
    label in leds node
  - Include dt-bindings/leds/common.h

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
