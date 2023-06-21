Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB4E9EB64D8
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Jun 2023 13:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oJDOuGCSPNRds3pqyPoQe3NHdERB/5QHtQJ7pITA0uw=; b=VQgnuRJfuaT707
	p/Ol2FRcoqjokXl5HuWIhe5a+eFZtovXymrIdxWRSHHGkLVFjyUrQCfcRVE1a+eWmQTvW8JKjWhnD
	j0zKUbX2DWRHS4+RX8Fy+aeM6TbDO7ZDM/KTQu39K+KDWMdN/ES3pF/gntmQkcZWQ/S6nQBG4n1WQ
	5ih2BV/ZcIJfe85N37hduQxxZ1fgvjmlNklgRFTsLc/qex9qmnbuEmN/yPbNQA7RMDagJT9a0PVcK
	aXL6lc/OucIYx7GVuGSIxNmfZF9hDtZlQ+IgMEPwgiR44eZTyZfcHgex4H9R6CvzTDXzQD8Fp0TTj
	810JOP2E53C7nM5IU+bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBxwh-00EgmL-10;
	Wed, 21 Jun 2023 13:32:27 +0000
Received: from mail-oi1-f174.google.com ([209.85.167.174])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBxwe-00Egl3-0U;
	Wed, 21 Jun 2023 13:32:25 +0000
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-392116ae103so4039248b6e.0;
        Wed, 21 Jun 2023 06:32:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687354342; x=1689946342;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/IJMn0/zhbPXvpTVANrT1cs8Ypc7FJHdchkV1z/m0Hg=;
        b=SpPxmZD8qtb7owxwDl1oGeO3BENA+UlYr0jDpfZaOlzGyncr1iklWm6Ujl9Z7M8Ljt
         6Icyz2/Auc8nCwUMKIgcoMLNnOzN9+auFTpQqjtuPFiDMbzAGV/xtO4aVU8/jDMDRtIW
         yRevMEIG1Wr7c3m+pb1iljS32QLSTSb2+XvUd5OK6diwnwgJooo1tvoGGPj6wC+E9MwN
         Yh8ln+aWHuI8i8wD62BaEbhRDHQKJRqDStoxyok1/EE9BhXH73KnHa7exmjiLRF3iW6v
         0TTTY6YA5lAd9XNJdAaQA4hEPHHASTEq73Re+wPpbgHtr7j0o0kNAWwWi80epDdtkn+b
         Q3pQ==
X-Gm-Message-State: AC+VfDzNBNtDFGUTC7SeKN0AFRmxeto34BDiLfvcccn4YgDpTSVcxK5L
	+uFsXYrlM4bL29kTAKevn5s=
X-Google-Smtp-Source: ACHHUZ5ZaK8fBszARbtNRNohDQBzuxdQlCR3hu8a/EPENE6dcfIxTIt6R1TGNUF4Cdy+76NkOdPjuA==
X-Received: by 2002:aca:d0a:0:b0:3a0:30e8:f069 with SMTP id 10-20020aca0d0a000000b003a030e8f069mr6942247oin.30.1687354341857;
        Wed, 21 Jun 2023 06:32:21 -0700 (PDT)
Received: from localhost.localdomain (cpc87451-finc19-2-0-cust61.4-2.cable.virginm.net. [82.11.51.62])
        by smtp.gmail.com with ESMTPSA id bf24-20020a056808191800b00395f2c84b81sm2114206oib.54.2023.06.21.06.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 06:32:21 -0700 (PDT)
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
Subject: [PATCH v3 0/3] Add Amlogic A311D2 and Khadas Vim4 Board Support
Date: Wed, 21 Jun 2023 14:32:12 +0100
Message-ID: <20230621133215.109254-1-tanure@linux.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230621_063224_188387_D46FD71F 
X-CRM114-Status: GOOD (  13.88  )
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
 .../bindings/serial/amlogic,meson-uart.yaml   |   2 +
 arch/arm64/boot/dts/amlogic/Makefile          |   1 +
 .../amlogic/meson-t7-a311d2-khadas-vim4.dts   |  52 ++++++
 arch/arm64/boot/dts/amlogic/meson-t7.dtsi     | 158 ++++++++++++++++++
 5 files changed, 220 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-t7-a311d2-khadas-vim4.dts
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-t7.dtsi

--
2.41.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
