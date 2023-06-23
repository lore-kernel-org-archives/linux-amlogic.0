Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0138EB64D7
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 Jun 2023 08:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ChiNQecNgmIo7dPp4Kr/qmjRl1vbGKev9WG1vNJjwa8=; b=BfGxuCdjB4NT2m
	rkSYMkXkIQRvsm5Q6xk9SIfB0YbReqgueQZOL6i8LE1w2yq5lnvcDZIZNmQmOa3lFqgIsCvB/CUqQ
	gaBg6RAuxq0O2/X0z1uiRBX1oLBIbJCqHgP+oMJmh9XGT/MOeHLFhld1C74bmWK40EP6XCowibF69
	HHCuPeOsRaanvtttDOln73BXbJ2/Mxz1YwebmTTKnfbZCiyPic1rg0H1wuFBILxn0/ycNY2fcBp5/
	5xWm5qdeCJZn0Qt0falaXBDkCEACYGEW2qFbkDjDx1apAUcnpGOlbuoJIl10LH97OIQ3tWjpmqfY8
	6Hf/h0iK8W7+GfG8Ko6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCbuV-002t47-1L;
	Fri, 23 Jun 2023 08:12:51 +0000
Received: from mail-wm1-f46.google.com ([209.85.128.46])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCbuR-002t2R-30;
	Fri, 23 Jun 2023 08:12:49 +0000
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-3fa7cd95dacso3686525e9.3;
        Fri, 23 Jun 2023 01:12:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687507965; x=1690099965;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l/dYwrBL+Qkk5ymGNSlPa75MZ37M5uNwNxJYrXJbylM=;
        b=MaMJbW99mjzazEP2W2/K5DBl5uP4bhJeCxKTLJKjEk3a3KzqGYAQwEpk+8Xb3XaAJS
         6gx+1AgNTQiBMu4J0rBuVnWFcmmX2bv+QvF31zJYC1LdX5FAu1gaf8dW+myBdVoCb4T9
         zirxsHCcK9oDy120sl/kZyoU/2/I2MT30vAJLsZhBDlHNITQ+REjYLzw1tU4kzICC/Aa
         aRYfl4y+Vb50LtJuBq0CTcuxNN1NsV05940NqAGKaO7gfgtUNjG3qZohvBWx8DMPSFHf
         7lMWBGhSLNjvwH267im69Un5zJ6CVowKKHLR+cl8SyEgO8zQ7XuqiIUSUVXx3U/RcmlA
         8FVA==
X-Gm-Message-State: AC+VfDwvPY8nV/1tnetlilOFTP7z1VBEg5QZV8TYfVQ8vjZWKIfjF85Z
	D7BSupI2zRZqyTYgNblqfe8=
X-Google-Smtp-Source: ACHHUZ7LKX3novj/TyogZZF0e3E27DTBlgtFUqcdbE/U6/bLSjrHEww2Tfh+muMz+xgZQ2xTnpVxgw==
X-Received: by 2002:a05:600c:220b:b0:3f9:b0fe:7e11 with SMTP id z11-20020a05600c220b00b003f9b0fe7e11mr10846336wml.28.1687507964681;
        Fri, 23 Jun 2023 01:12:44 -0700 (PDT)
Received: from ryzen.lan (cpc87451-finc19-2-0-cust61.4-2.cable.virginm.net. [82.11.51.62])
        by smtp.gmail.com with ESMTPSA id l21-20020a7bc455000000b003f9b29ba838sm1594141wmi.35.2023.06.23.01.12.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 01:12:44 -0700 (PDT)
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
Subject: [PATCH v5 0/4] Add Amlogic A311D2 and Khadas Vim4 Board Support
Date: Fri, 23 Jun 2023 09:12:38 +0100
Message-ID: <20230623081242.109131-1-tanure@linux.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230623_011247_965202_E74C606C 
X-CRM114-Status: GOOD (  13.59  )
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
  arm64: dts: meson-t7-a311d2-khadas-vim4: add initial device-tree

 .../devicetree/bindings/arm/amlogic.yaml      |   7 +
 .../bindings/serial/amlogic,meson-uart.yaml   |   4 +
 arch/arm64/boot/dts/amlogic/Makefile          |   1 +
 .../amlogic/meson-t7-a311d2-khadas-vim4.dts   |  52 ++++++
 arch/arm64/boot/dts/amlogic/meson-t7.dtsi     | 158 ++++++++++++++++++
 drivers/tty/serial/meson_uart.c               |   2 +
 6 files changed, 224 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-t7-a311d2-khadas-vim4.dts
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-t7.dtsi

--
2.41.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
