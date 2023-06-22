Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 425ECEB64DD
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Jun 2023 08:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=46WWRMsHjHhKfhhcAbYOIrMHxo5YS1NgYyFOjJw4JOI=; b=OAMqs0J5akVoum
	LOpmUp/5FeRqpDKC8e4wbMy8OusSRkyfMOUAQkfDxAmO4idsu5L/AfUAzlDSQFTah8r6aOVl/AqdF
	JXXhe1l8vpKfKUMasCAbWvQpnA3/m93QGU804OGMPbbUFlsPdweLIVDbaom3RtpHQUanzUfRstkgE
	ZNT/tLghg153SWWN+ALCvFnCtzLDUAfoQPgSHvoOxmkDI3r4qGmcGMR3fsKCUTC3hTmq7xALEksFc
	uoDOjmnu5j8VS1YHh/8P7sqy43QfZC0barC9P+9Kz8p5MSuSwgKWdtT0nL53Nl4HxDJ5kQre+Jv5x
	UT5pKQu4NsF8k7PdWFcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCFs4-00HSnd-2Q;
	Thu, 22 Jun 2023 08:40:52 +0000
Received: from mail-lj1-f172.google.com ([209.85.208.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCFs2-00HSmA-0x;
	Thu, 22 Jun 2023 08:40:51 +0000
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2b46cad2fd9so74584211fa.1;
        Thu, 22 Jun 2023 01:40:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687423248; x=1690015248;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N9YCzbE3BtCbYZxorE+VgLmJ94PqcGOmK4iEO6z1Lc4=;
        b=VRBGkLulRRXjpP7l68jKUw4wY5T1NjT5XldA+b7TGYwVIDbnptE+FM/bckcMR9oRLK
         jf4PvTojopjv6GtQiSKzyifeWIgRoCEysbsJJvoKMYdEt0iMIF/Ks631MR0Nl/J8GF5a
         lZEtyIqI857yKaMS36iboaA+Ag5vZfUksxgWmNmClp1i23qaI82pd4SkoJotdGzo9Dn8
         jutNu97dcwAyoaLpcglRe+yGBQuNH9ir6ARajngAASznUefrGbe3hxtOnX2XKZ0EshiQ
         HnPf0W87p9B4MVZrq7Mw8NGvFe9rxFN9jiOS1YlDMFkjpxmowYdEfp7TzV0doYAUc9sv
         f48g==
X-Gm-Message-State: AC+VfDwbHQCJsGameTWgSOwGQB+GNz9yQ9LgZs7QU2j8tfA16UnI1/jx
	e4UU1TtD1ALwufo6bbXysak=
X-Google-Smtp-Source: ACHHUZ5N2r8BP6GAJSnJNPvHsWDjZfu+BRhku7SGsnPX5jaHsvXUVTjRzeDcGOayRShnS5fqe83ilw==
X-Received: by 2002:a2e:7a17:0:b0:2b5:1b80:2637 with SMTP id v23-20020a2e7a17000000b002b51b802637mr5498710ljc.25.1687423248013;
        Thu, 22 Jun 2023 01:40:48 -0700 (PDT)
Received: from ryzen.lan (cpc87451-finc19-2-0-cust61.4-2.cable.virginm.net. [82.11.51.62])
        by smtp.gmail.com with ESMTPSA id v5-20020a05600c214500b003f7f87ba116sm15441277wml.19.2023.06.22.01.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 01:40:47 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>
Cc: Nick <nick@khadas.com>,
	Artem <art@khadas.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Lucas Tanure <tanure@linux.com>
Subject: [PATCH v4 0/3] Add Amlogic A311D2 and Khadas Vim4 Board Support
Date: Thu, 22 Jun 2023 09:40:42 +0100
Message-ID: <20230622084045.519203-1-tanure@linux.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230622_014050_329646_E65FBEF3 
X-CRM114-Status: GOOD (  12.91  )
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

The Khadas VIM4 uses the Amlogic A311D2 SoC, based on the Amlogic
Meson T7 family. This chip is not the same as A311D used in Vim3
board.

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

Lucas Tanure (3):
  dt-bindings: arm: amlogic: add Amlogic A311D2 bindings
  dt-bindings: serial: amlogic,meson-uart: Add compatible string for T7
  arm64: dts: meson-t7-a311d2-khadas-vim4: add initial device-tree

 .../devicetree/bindings/arm/amlogic.yaml      |   7 +
 .../bindings/serial/amlogic,meson-uart.yaml   |   6 +
 arch/arm64/boot/dts/amlogic/Makefile          |   1 +
 .../amlogic/meson-t7-a311d2-khadas-vim4.dts   |  52 ++++++
 arch/arm64/boot/dts/amlogic/meson-t7.dtsi     | 159 ++++++++++++++++++
 5 files changed, 225 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-t7-a311d2-khadas-vim4.dts
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-t7.dtsi

-- 
2.41.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
