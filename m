Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCD95EB64DD
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Jun 2023 13:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uW98DWpm3jAxLib/ZwFZqkvvgpv8WH9wE9cVhZSiW9A=; b=rI0tabyu5muey9
	F+1Nv1kn3Qc3jkf0W9wPr51PQnfL+JwcQQQbxtNVif81MvJNTFZVs6jqKosJzRwGvun01sDftjfZ8
	PeIOIQx1IWH6c08u9XwlPUHhghZXvubUb9+A2Eev1O0zGSP2GjR5Vi27gkrw1hdzokPj2FPilrN6P
	tkNx+Ry8kv9P6/7iNCAEH3vDMKGxxfwKdKw2kp98lx5leVQRHcmy3UaKSdI6HN+wc9X7it5LIlt2G
	1LEuBb1QUiif1xbRENf7sYafV5n85RnkLAr+c+JuY5OtGegmIzcZmPz3owDX0wj08rZ7MzO8IS5X9
	zQqCiplCtaNPxTFIDpkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBbjI-00BS2w-0C;
	Tue, 20 Jun 2023 13:49:08 +0000
Received: from mail-wr1-f44.google.com ([209.85.221.44])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBbjD-00BS07-2d;
	Tue, 20 Jun 2023 13:49:05 +0000
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3110ab7110aso4720824f8f.3;
        Tue, 20 Jun 2023 06:49:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687268941; x=1689860941;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q/KbsrDZwCLVPdQPy4lnm1FCV5FpIxxRPzJUA6ihk/Y=;
        b=iJd+QAweU7GKNVWqWeBpZXcG2/fnJMeewNBj20JOQWnr8KKekDR0SLGmoKW+/daPfF
         1VCKiw119+P5COy+7v4pYb62e8N1QbHVxNKLOhF2uLarySwwv7crjovXWpmvNtvPXINT
         0irQVFwMF7V3dzOyY4NekAYIEdd30nUAxUwQKDvjChsBuwTAoJ5UnRHl1r/NBq+VYa6p
         rqG7hy3ETZgQ03p5SwvPUKEG7mtTUJieCi2d2QtaI3EvBELHj5W+u7SY/DPMa0locsSG
         L4yo7Tpetjll7mBvuBirRFZgK/5qgV9e5pAugXwlhYaPUgjvNIcPqXpvzE/TBY2Y8IZw
         IhJQ==
X-Gm-Message-State: AC+VfDxbmRRFR+gFnbGmBDJYx6RcNnZOCpa5u/p7O6+u+lqrjBbuSsPG
	Tw9virMxJim30MBLyLORAtw=
X-Google-Smtp-Source: ACHHUZ7lxQUDlH2I4Oj6WbxFRj7LFURpH9yAN9v1vrE+z2hRWqe//vkfkWqeBNXwmIRMpP/JxMzk8Q==
X-Received: by 2002:adf:f882:0:b0:311:15a7:8789 with SMTP id u2-20020adff882000000b0031115a78789mr9849154wrp.56.1687268940653;
        Tue, 20 Jun 2023 06:49:00 -0700 (PDT)
Received: from ryzen.lan (cpc87451-finc19-2-0-cust61.4-2.cable.virginm.net. [82.11.51.62])
        by smtp.gmail.com with ESMTPSA id k3-20020a5d4283000000b00312780bedc3sm2038012wrq.56.2023.06.20.06.48.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 06:48:59 -0700 (PDT)
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
Subject: [PATCH v2 0/2] Add Amlogic A311D2 and Khadas Vim4 Board Support
Date: Tue, 20 Jun 2023 14:48:55 +0100
Message-ID: <20230620134857.238941-1-tanure@linux.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230620_064903_856163_02F96269 
X-CRM114-Status: GOOD (  13.51  )
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


Lucas Tanure (2):
  dt-bindings: arm: amlogic: add Amlogic A311D2 bindings
  arm64: dts: meson-t7-a311d2-khadas-vim4: add initial device-tree

 .../devicetree/bindings/arm/amlogic.yaml      |   7 +
 arch/arm64/boot/dts/amlogic/Makefile          |   1 +
 .../amlogic/meson-t7-a311d2-khadas-vim4.dts   |  52 ++++++
 arch/arm64/boot/dts/amlogic/meson-t7.dtsi     | 158 ++++++++++++++++++
 4 files changed, 218 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-t7-a311d2-khadas-vim4.dts
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-t7.dtsi

--
2.41.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
