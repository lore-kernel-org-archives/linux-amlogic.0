Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FFF6EB64DA
	for <linux-amlogic@archiver.kernel.org>; Thu, 15 Jun 2023 18:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=y2+2DxoMabEt7pty96rVeiWVq1m8NAuLpArBpTGf6v4=; b=dMWWNrNamX/9z1
	KZGbzGUPQVYBQ+LlEizr87XS7JO/YCvFUSEL5YPCpDwwBsI05ojPFaFsraI2keY/ajSAgFvX/Rktp
	L6GZyjUuL41W5gxwGRGkcCm3nTOCupnRmb3rYDYmKlvgkeKWwPsgcsG0YapP3OWWP30x4+lvfzAM7
	mcXbY8hopPpvRFnVLJp9SmkgAGCU5cPFU8sr5krVRvUTge8J36wcsBuCiHjP7uxDxxPbtlsXbVNcl
	L3CP4WXN7zePX6AUaKpY6mAqBvBJTJV6SoF+KmTSjqUDbyU6CyA6HRaE3BKYPfZKmOYuEKi5Wtf+F
	y0Y1rIwQu32e9lG1MuTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9rj8-00FkZP-0i;
	Thu, 15 Jun 2023 18:29:46 +0000
Received: from mail-wr1-f41.google.com ([209.85.221.41])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9rj5-00FkXw-14;
	Thu, 15 Jun 2023 18:29:44 +0000
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-31119a33ea8so656322f8f.2;
        Thu, 15 Jun 2023 11:29:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686853781; x=1689445781;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c8i3hO6Asw9z4pBJsjq1JNXvz4oP43/hziP/VGcJWDw=;
        b=bJlqXJL2hFXqykxJhExzG22JoUgAdnLOlDQFzmKWbZ/VyxJ5eVqdCGKyvEzcroIOTc
         kbAXTQ9eOgMbkC3frrG4TFT7ukBw/Ou83eHnk+yAJNYGa0uBzMNWjV5sq1vRi7FGBZ1+
         Wcam4f0zrek1qnovpSlusmYK51+j7ixOBE7xB+9hrde4sFsXhDQtH97PNNjcAgwYEhHU
         CCliHX6hJlP/IBN47MtWhsX6GRV110gRK5g6mzTaq2qdzWNH3mCDQc6kQc9TWD3xBEec
         K0yRfD4GFWBTPA4WblIPQ+0oZzCgMq/sd6Xcw8boPr43bTnIiMEBZ6pypjxIL3nyhHzT
         R38Q==
X-Gm-Message-State: AC+VfDw3HMT5fktIxQwtwWIa+BFzh2efZ2zmUsN1/m2E+ywSXiD4oG74
	+UfhPUQplWxpdH34L2rD0Kc=
X-Google-Smtp-Source: ACHHUZ5bNKCVo0ONW/4FCdjDRxW3DorS7WwJat8TD6mIj0BzMMV2c0ZYkNZEQqcZAdMqee8pptpPRQ==
X-Received: by 2002:adf:f810:0:b0:30f:d32c:ed8e with SMTP id s16-20020adff810000000b0030fd32ced8emr4950226wrp.45.1686853781021;
        Thu, 15 Jun 2023 11:29:41 -0700 (PDT)
Received: from ryzen.lan (cpc87451-finc19-2-0-cust61.4-2.cable.virginm.net. [82.11.51.62])
        by smtp.gmail.com with ESMTPSA id c3-20020adffb03000000b0030ab5ebefa8sm21525887wrr.46.2023.06.15.11.29.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 11:29:40 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Nick <nick@khadas.com>,
	Artem <art@khadas.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-serial@vger.kernel.org,
	Lucas Tanure <tanure@linux.com>
Subject: [PATCH 0/6] Add Amlogic A311D2 and Khadas Vim4 Board Support
Date: Thu, 15 Jun 2023 19:29:32 +0100
Message-ID: <20230615182938.18487-1-tanure@linux.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230615_112943_391179_61344F3C 
X-CRM114-Status: UNSURE (   8.85  )
X-CRM114-Notice: Please train this message.
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
Meson T7 SoC family. This chip is not the same as A311D used in Vim3
board.

Work based on Khadas 5.4 branch:
https://github.com/khadas/linux/tree/khadas-vims-5.4.y

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

Lucas Tanure (6):
  dt-bindings: arm: amlogic: add Amlogic T7 based Khadas VIM4 bindings
  dt-bindings: clock: Bindings for Meson T7 clock controller
  clk: meson: t7: add peripheral clock controller
  dt-bindings: serial: amlogic, meson-uart: support T7
  tty: serial: meson: Added T7 SOC compatibility
  arm64: dts: meson-t7-a311d2-khadas-vim4: add initial device-tree

 .../devicetree/bindings/arm/amlogic.yaml      |    7 +
 .../bindings/clock/amlogic,mesont7.yaml       |   69 +
 .../bindings/serial/amlogic,meson-uart.yaml   |    1 +
 arch/arm64/boot/dts/amlogic/Makefile          |    1 +
 .../amlogic/meson-t7-a311d2-khadas-vim4.dts   |  112 +
 arch/arm64/boot/dts/amlogic/meson-t7.dtsi     |  202 +
 drivers/clk/meson/Kconfig                     |   17 +
 drivers/clk/meson/Makefile                    |    1 +
 drivers/clk/meson/t7.c                        | 8014 +++++++++++++++++
 drivers/clk/meson/t7.h                        |  235 +
 drivers/tty/serial/meson_uart.c               |    4 +
 include/dt-bindings/clock/mesont7-clkc.h      |  487 +
 12 files changed, 9150 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/amlogic,mesont7.yaml
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-t7-a311d2-khadas-vim4.dts
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-t7.dtsi
 create mode 100644 drivers/clk/meson/t7.c
 create mode 100644 drivers/clk/meson/t7.h
 create mode 100644 include/dt-bindings/clock/mesont7-clkc.h

--
2.41.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
