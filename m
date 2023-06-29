Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BBD1EB64DD
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Jun 2023 07:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yLZd041d6CJy25MerbDtJyGBCUH7qB4giSLnHMx/7c8=; b=T/cjCNjS7n4Utb
	QuYPsFxD6IBmzHs4tOehJ62SioLWLXhrH3AsXEOJa5i34PhRCZ7QQN+Ldu3DD33wdC5KOPT+dfXES
	aFLNUlJ5FDzUgnqER7JK328ZkbQKMiTfVmOesO7sgOMQ2vXo6fk6V7LKigILOXAtXp5++fsJKPdYy
	AOtQ3fUsnOcKs3UvMqP0JDlaKtODJvhk7/WRk4CWiil8XLzx07/HCQTcEnUQRhvtwJYsiT7unlu3W
	fSqqy0LzJvAOW2wuASOwotGHFF9rMiI96zt0yOp0hH7kA7etb0PzsP7NYZmb7CJ7gWaTm5M7t7M9R
	0JkeP/7nMDi++13+8Igw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEmAe-000DAt-25;
	Thu, 29 Jun 2023 07:34:28 +0000
Received: from mail-ed1-f50.google.com ([209.85.208.50])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEmAa-000D9i-2A;
	Thu, 29 Jun 2023 07:34:27 +0000
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-51d9128494cso333549a12.0;
        Thu, 29 Jun 2023 00:34:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688024061; x=1690616061;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rif8333vFODJ+ZtIJl2mdLq4SmOl1BT5+ld0NPLKn6E=;
        b=fgVTRqAvRWmV7JsBoRaw7wJHZR0ATgJd0WdOTLLhsY6Aaeun3MF9XM05Anq9h4Abny
         tkZb90lft6PXWEppkXgCw/6jQzsh6ZAT0v4Tt/h5TkgjuhpRv3GhlzcvYGHoUDvZG8WV
         odW1144G44jhKKXvl/OtuxJgrHZSqrReMGoVkRev6fDLwYBoJnd9RduXWXwHZS5pMHNa
         5yhLI7gpblhqlRKpsTcZ12y4JY4C4M4wJYou3oSvPjVC7MkBQu70ZqncfOL9AIkVk4IG
         yCpLegirgRbS7zdXqSzSZmMhi4qCkBwtUc1M7bnZ5t4NynlNG0zIDvyv3EBQkWC6ON/U
         rc/g==
X-Gm-Message-State: AC+VfDy39m0iOhaNaONtICStAJHXEfunkWjmifBOA2XFh6+t+XAaoKnm
	Unw4dmCoFzH908FhFfXIen0=
X-Google-Smtp-Source: ACHHUZ4/3jnZwWO5KJgttycbpIu/mlo3hiu1rv2BbfxFKwx5r5WS7JaU2JXRhKzXqDd+tg8BrAta6Q==
X-Received: by 2002:aa7:c7d7:0:b0:518:7437:bd9f with SMTP id o23-20020aa7c7d7000000b005187437bd9fmr26625569eds.24.1688024061407;
        Thu, 29 Jun 2023 00:34:21 -0700 (PDT)
Received: from ryzen.lan (cpc87451-finc19-2-0-cust61.4-2.cable.virginm.net. [82.11.51.62])
        by smtp.gmail.com with ESMTPSA id be28-20020a0564021a3c00b0051bfb7de166sm5453716edb.39.2023.06.29.00.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 00:34:20 -0700 (PDT)
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
Subject: [PATCH v7 0/4] Add Amlogic A311D2 and Khadas Vim4 Board Support
Date: Thu, 29 Jun 2023 08:34:15 +0100
Message-ID: <20230629073419.207886-1-tanure@linux.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230629_003424_708309_54B88919 
X-CRM114-Status: GOOD (  14.52  )
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

Changes Since v6:
 - Move Uart clock to amlogic-t7-a311d2-khadas-vim4 dts
 - Fix GIC_CPU_MASK_SIMPLE
 - Lowercase uart label

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
 .../amlogic/amlogic-t7-a311d2-khadas-vim4.dts |  54 ++++++
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi   | 155 ++++++++++++++++++
 drivers/tty/serial/meson_uart.c               |   2 +
 6 files changed, 223 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
 create mode 100644 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi

--
2.41.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
