Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4929EC0015E
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Jun 2023 09:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=t7c8ODBL3sKrClqi7TAx/QMUPVh5h1uba7c0Wndp6c0=; b=3X2PEPFzpVBF+c
	bzrYsMani5V2ikdo2TMgxbA7Z2WyGV3ZAdp5ZLdwGcvrJC+Ayekw2TKBdv1BdugZyC2yGMrAKA2bM
	J/3kl5HN8EljUW0Pzka2kCqF9p6h6OxbFoHsNSayr2jXf0tNvwsp5LqGHmo38AB+sEeFcrJJ68w8j
	VK6wtNxVIwpe65WlBIydpEdJmF1qtxb/zkyFMZJIXdWw0TcwW/DqhVcvMF04iYpnnHu7zyMAMv632
	cW1j7Odxg1OKSCwajuOBgTKtqKh/lnEfv1j0MUc4GdWI0soL6E/UQ0j3Gdn/nZbwQAZHJTGafIl8W
	O6bagZSbSm9n6IvZR8/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qE4iF-00CeQF-2H;
	Tue, 27 Jun 2023 09:10:15 +0000
Received: from mail-wr1-f51.google.com ([209.85.221.51])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qE4iC-00CeOX-1N;
	Tue, 27 Jun 2023 09:10:13 +0000
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-307d20548adso3872332f8f.0;
        Tue, 27 Jun 2023 02:10:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687857010; x=1690449010;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e7hLSJVCCtLYpY+D0x3HcpH48zuU/KxVbnA9ZkjEUYc=;
        b=MeLtynvcvVIBhdmsz2zwQ+aPmdHWpn0mDC1/glHRTinVmOiKv6SuqY+KWigezqGHuz
         JB/WdixGBfoXfG88rsXb0WsLQ4nVXgfBxydAzbXjkCD1HyDb/CdiK7xMSgRM5QRWY8bF
         0IcoCT4sfXY70c2Vt/6dPOo4A1htZCkurQi7jzJtRmR19Zvsea77VGD0OM9QuFoAkirO
         mas/DegmZMG/P76Y4q0zma+0fjTu3tBQPl9Y0hV0pUmxnBS1M+WbP2Qxc2OdKaIV1Fjb
         WLlbJM6mwCnv6a6YgAPd+4lPyO4eHkz5nNfF4heIXVSwnNeSjy9fKgbjGgnRNbeRT/fr
         O1cg==
X-Gm-Message-State: AC+VfDwYPuGkY4INO9hR3x4XFPOQWNhBh8q9INApbjxL526WesctFq9T
	WeImWOMWP2yRZ96MSA2ateo=
X-Google-Smtp-Source: ACHHUZ4SyZagIQKKYwDBn+gOLO2udMSIlGgeLYgeg3krB1VeISWpZu7CSPdmbFqIeZYXEqna79kD2A==
X-Received: by 2002:adf:ea90:0:b0:30f:c5b1:23ef with SMTP id s16-20020adfea90000000b0030fc5b123efmr23619787wrm.41.1687857010328;
        Tue, 27 Jun 2023 02:10:10 -0700 (PDT)
Received: from ryzen.lan (cpc87451-finc19-2-0-cust61.4-2.cable.virginm.net. [82.11.51.62])
        by smtp.gmail.com with ESMTPSA id c15-20020adffb4f000000b00313e4d02be8sm8880122wrs.55.2023.06.27.02.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 02:10:09 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Nick <nick@khadas.com>,
	Artem <art@khadas.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Lucas Tanure <tanure@linux.com>
Subject: [PATCH v6 0/4] Add Amlogic A311D2 and Khadas Vim4 Board Support
Date: Tue, 27 Jun 2023 10:10:03 +0100
Message-ID: <20230627091007.190958-1-tanure@linux.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230627_021012_469337_7BAAFDF3 
X-CRM114-Status: GOOD (  14.28  )
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

The Khadas VIM4 uses the Amlogic A311D2 SoC, based on the Amlogic T7 family.
This chip is not the same as A311D used in Vim3 board.

Work based on Khadas 5.4 branch:
https://github.com/khadas/linux/tree/khadas-vims-5.4.y

The current status is Vim4 board booting to emergency shell via uart.

Board Features:
- 8GB LPDDR4X 2016MHz
- 32GB eMMC 5.1 storage
- 32MB SPI flash
- 10/100/1000 Base-T Ethernet
- AP6275S Wireless (802.11 a/b/g/n/ac/ax, BT5.1)
- HDMI 2.1 video
- HDMI Input
- 1x USB 2.0 + 1x USB 3.0 ports
- 1x USB-C (power) with USB 2.0 OTG
- 3x LED's (1x red, 1x blue, 1x white)
- 3x buttons (power, function, reset)
- M2 socket with PCIe, USB, ADC & I2C
- 40pin GPIO Header
- 1x micro SD card slot

Changes Since v5:
 - Remove meson as T7 its not a meson chip
 - Change Uart Document descript to S4 compatibles

Changes Since v4:
 - Use S4 instead of G12a for uart fallback
 - Add OF_EARLYCON_DECLARE for T7 uart

Changes Since v3:
 - Fix issues with "amlogic,meson-t7-uart" documentation

Changes Since v2:
 - Add "amlogic,meson-t7-uart" documentation

Changes Since v1:
 - Drop the T7 clock driver as it is not needed for serial boot. It will
 later use the S4 clock
 driver as S4 and  T7 seems to be similar chips.
 - Use "arm,gic-400" for interrupt controller to fix dtb_check
 - Remove CPU node properties not needed for serial boot
 - Move UART node to apb4 node
 - Drop T7 UART compatible line and use S4 uart
 - Use psci V1 instead of 0.2, it works, but I can't verify is correct
 as the datasheet I have
 doesn't contain that information.
 - Remove compatible from meson-t7.dtsi, move it to vim4 board dts
 - Add memory node with 8GB. Not sure about this one, works without,
 but doesn't detect 8GB
 - Use defines for GIC_CPU_MASK_SIMPLE, IRQ_TYPE_LEVEL_LOW,
 IRQ_TYPE_LEVEL_HIGH instead of hardcoded values


Lucas Tanure (4):
  dt-bindings: arm: amlogic: add Amlogic A311D2 bindings
  dt-bindings: serial: amlogic,meson-uart: Add compatible string for T7
  tty: serial: meson: Add a earlycon for the T7 SoC
  arm64: dts: amlogic-t7-a311d2-khadas-vim4: add initial device-tree

 .../devicetree/bindings/arm/amlogic.yaml      |   7 +
 .../bindings/serial/amlogic,meson-uart.yaml   |   4 +
 arch/arm64/boot/dts/amlogic/Makefile          |   1 +
 .../amlogic/amlogic-t7-a311d2-khadas-vim4.dts |  52 ++++++
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi   | 158 ++++++++++++++++++
 drivers/tty/serial/meson_uart.c               |   2 +
 6 files changed, 224 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
 create mode 100644 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi

--
2.41.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
