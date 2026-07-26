Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CE2AC53209
	for <linux-amlogic@archiver.kernel.org>; Sun, 26 Jul 2026 20:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cl1xEJYtRQmk8BtzVMFKJ4W10WzTffUeW7hfwks/Pew=; b=yzQHQx0yb1hR/I
	P0byexZbdTbPoTv1h0JC6buKxNCfL14941XvAKqPy7Wo9AL5PkvQuwa5W2IkHkWVJDX+iwhv3VXnQ
	TKVW/X89h+ML2VedRo+Hr106AZCc0fm2znogpQ5ToWOWDT7qGei6JabTd686euW/6kyMffHCJ/kNG
	WQD76hHtAvnEVX8gLaC+U2JRCpTRdmR6RUG+pjIK/LKgLyOqm30/oxhuGG7lWqBWGfLqmExmT7n2u
	RP+w3WyNkW/8jTNckFmj+bXvNTW+nST9XOOrcJTjm+of2kKa6yTO27Csjgca3bMmsSYPeVteBsGNv
	u0AirUXOMmvV/a/BmtxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo5HO-00000001ZxH-1F4A;
	Sun, 26 Jul 2026 20:16:58 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo5HL-00000001Zuq-1B1O
	for linux-amlogic@lists.infradead.org;
	Sun, 26 Jul 2026 20:16:57 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-47f703a9d05so1227134f8f.0
        for <linux-amlogic@lists.infradead.org>; Sun, 26 Jul 2026 13:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785097013; x=1785701813; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cdAQWN4AxqGOJCdFwI3NHZplXBxu4k7L9Z5qFft+R/U=;
        b=HhZTLgv+Jq4GFjutaAb+5A8h01QH/8cAKnEVjK379I+O8x5Z92FpNm3/bZBH4oEecE
         KXjsDkZGzkBS8EqY9fVU4Ou5WAFKMf9uOpThgxCObGqaP3gS5eijftZG+CodAqC5dFEr
         BlMkRZDjwYQSDp+3Uc2adHDoZ837ZaQI9gci/x894j5vjvnFCgt/DAhXdVFN555i5yod
         xhLsi8ewlBXdKqtvcek3D+7i7G7CJrLp+zP6rq7QWN52m11qQU6RnupTMo91zzUtV38E
         jlJjMEONWAU8mifYb7xpLdeEAd6nzyaQxnJC6zvwfTM7g/PQ4qN5J4Mgb3mcu5TfXuVO
         Bv9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785097013; x=1785701813;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cdAQWN4AxqGOJCdFwI3NHZplXBxu4k7L9Z5qFft+R/U=;
        b=b7/hWBz1pACE4xHwZFPMo6jJk3Koa5hiOvL/H8d/J0rlNZQYUfe4yu4j3EVWcri8Cp
         xuK28stTfFsBslntAGXoc0UNqusBbOuYGbU2JLUAeH0JP0+ZPXOHOcD8YTHxzrqvlhS5
         y6qPujUHWb404w1jL/qTMau1vnqBtJYLLQVzZ0mjHjRZuSY1sw8cMzi5CBR/wY9MJlaz
         CyfsphCiN3NYhv8Rzkz7N2WUJ1CSdk23K3E8q13ElNDCgGSAClt0UOYpmpzUzE4eKzyQ
         hJAxj4wzL6WpsCt5ZV19eCKpnUM4iVrKiiEGihDNqfvF0070FJtyNm+P4g9PNXcgcyeo
         XR9Q==
X-Forwarded-Encrypted: i=1; AHgh+RpF2W2ngaqzoEm8AiV1r/fhqlGwlLUC8UtmuU7KdxoJ2s1osacieoLyozelI//qVSKbx520oS9eEePp7Gb7@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/7/BtHO+FuQd727i5mA/tPQTHWuCpMDiC3u/Xb2m8M9M4F+Zk
	/oS5Lmxt2Wmp+AQCWhHSj5526Q6otxbAa96wRQXCeO/Ds2CpektSVD1Z
X-Gm-Gg: AR+sD10KPDBTlOA8Kb49c2Ej4v6eL+37vFd2p2h+1CKoYlRYjijbafJj0CoOD6lAlTh
	13X/d4A5/IEouniMkZGB4HPcNTULIdjd0Ha3/t2XcrC1FAZZKIMTenmdPgHe81F31mDLSW7LZrI
	tPvuBcjcLnFp2xwADabBgMsPUzL58ALwbNxFdZIhUdHBywyPMMNDyB/UX9+E2vnZNYOc8MrXvS9
	69YZOnRQPdiQPxbuhOimWYehz7lZ8dOwsguj2+ZGjbub7uecCO0EyGqFrWPodnbPXbREqyvHmVe
	Di5lDtJsyEUqNAy/TeepY+0OCiDpzHD4c2ZDTfhy45qx3o5TBWWd2f9XFH0RYZ3UsggcKYcFo5T
	mCtNRL9FVGdv+FywsmcyOx0eJy/Ph1oRe5DH4oDawH4SBRiNiudNz38yI5iXZmtMcJ06KzOy0za
	IFuZrvzCaTEf9pNW2v9u/BERPaLCRH97fQ7obmZg==
X-Received: by 2002:a05:6000:1ac9:b0:47f:8f5d:182 with SMTP id ffacd0b85a97d-47f9feba3c7mr8328950f8f.61.1785097013209;
        Sun, 26 Jul 2026 13:16:53 -0700 (PDT)
Received: from slackboot (93-34-145-231.ip50.fastwebnet.it. [93.34.145.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c52fa9sm43621117f8f.20.2026.07.26.13.16.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 13:16:52 -0700 (PDT)
From: Alberto Robazza <robazzalberto@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	neil.armstrong@linaro.org,
	khilman@baylibre.com
Cc: robazza.alberto@proton.me,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH v2 0/3] arm64: dts: amlogic: add support for Orbbec Zora P1
Date: Sun, 26 Jul 2026 22:16:44 +0200
Message-ID: <20260726201647.264108-1-robazzalberto@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_131655_332853_1EF6010E 
X-CRM114-Status: GOOD (  12.06  )
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
Reply-To: robazza.alberto@proton.me
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

Alberto Robazza (3):
  dt-bindings: vendor-prefixes: add Orbbec
  dt-bindings: arm: amlogic: document Orbbec Zora P1 board compatible
  arm64: dts: amlogic: add support for Orbbec Zora P1

 .../devicetree/bindings/arm/amlogic.yaml      |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/amlogic/Makefile          |   1 +
 .../boot/dts/amlogic/meson-g12b-zora-p1.dts   | 103 ++++++++++++++++++
 4 files changed, 107 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-zora-p1.dts

-- 
2.55.0

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
