Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03692C27C52
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Jun 2024 08:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rqxyHeUUPmHpmmSIyf9PRjw5O8L5r5bDW6s0rrbJc08=; b=q17FtTQj7HGgve
	cyyEKC5Trnd7rvTpR1MupTjeBfLIaVsL+jbFlQuzqb+8rcmIEThnbpt7zj/h1DXys8QvtrvEkiQ6R
	I2vFtfD+mkZmRnampyf+E8FtqgD51sP/o1zUd7k8AitAxItUXOpKb3h0250etlCfkX6BFwpHP4x9N
	rT3dureyZLEqiVtvwVgEtbG9JdHqUje/cEtO4PtLlyET9IWtPy2BbQCXgTFp/IADb9mXuUeoALmDY
	JCQP4leciTHv9cWRNufs42KlJHgaphkvO0e8KMY/Q9TwGUWoUgWoDUDaKahut67y7FFQWI9tHyqT0
	UMCu52IMiRC/kotA5KaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEPjo-00000001hUc-23Le;
	Tue, 04 Jun 2024 08:41:48 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEPjk-00000001hT7-1Kqe;
	Tue, 04 Jun 2024 08:41:45 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-57a526c6a2cso2965079a12.2;
        Tue, 04 Jun 2024 01:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717490501; x=1718095301; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fgqvf7dSV2wg1wNnuZIK3NfsH411d74v9AFFfs0leYc=;
        b=i1aI0lPLP4kRwK/CaZLebC76sIHRzTpiHktUisBk3rf+qX2CAO+7MKY0v5Jd7wdBy2
         XJSOfa9XXTfqeYW6007auHP1MGIUet/ZcbNNOrHkml010t5agvR8ug4qUiKuyDLNhYa7
         P60dgiXDRhImPJt61krKXjBF5mESKtx8Z2+pN9xUigwVoI4xcPRdsJ7YH7CE3TtRiwkk
         E9U7McxB/tUU/JgFpj1DkmWBjsDGxLtvak+hLgTVSv1NH85oXebfhKqigSgldoTrRHFe
         QFn5q9UbWNfXj0u+7vTlmSvHRV9/B7z7/adWtXDUFLu1Zg6d9N00xWw8h8KJ7wgMwVS0
         ufSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717490501; x=1718095301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fgqvf7dSV2wg1wNnuZIK3NfsH411d74v9AFFfs0leYc=;
        b=mwoSPf9qpK18XQ2EikBlHqX0Bc0IWl1F+TriUNBnMxhLlr7HOgvMW9k5j5uLn8wRIG
         FYX64kyYh3UnCuLh4N7eG+iaJOHBhL5JZWl6tENTAfl4+sxEWitPM/kIn07qpCELZhtK
         FObzQRDuyTQ5DG9yIyeLqLecb0hPWeEL0V5Z3oZeahIRut7OFpmgH60hsJeCu2Lh+kJ0
         t0lOUIaIiNUgemLA5+g6gSJuFHkL4W+ff6cRLtqEB1PoO5auPPkY3QUvWGshMLeGx1BA
         UlPxxVhQ3IvxDeRVOA2DGNKV/w0CdaaNF/0PiYbboJJPngOmBf86OAoDzC3oY8ZJ5kgN
         8DXg==
X-Forwarded-Encrypted: i=1; AJvYcCUA3AxEAWjCWYgkglG4kw7qUpwLWTct76qq63uJ61Y0sASfwzPShsr3wMbsR/w8b96g7uEBfMmeM4Y3ccyasH5vV/aebzV+pkIxZqAFsU748jeiJjVmDgiaSpDHvE5rbXuG931KRrHOcxUdRo3g9mMGOqDAylLyHQ==
X-Gm-Message-State: AOJu0YwPp06h09J5Y8zHWT+WVo03ejIaI3FlOgV4ns8iqrBjGo44ZG9B
	xQHK225f6gG4iWp0X6iHoy65tM0fyWVE6SLy9ikGRfOESTbKEld8+1859VvSk/u0Bg==
X-Google-Smtp-Source: AGHT+IF5RkpOyKdBjOA7FhxkRqHcjGiGJP05hVM1+o69oyRQ6HrXgoBqgxpOdIC/4HMia/nXUvIFQA==
X-Received: by 2002:a17:907:9708:b0:a69:2553:92b8 with SMTP id a640c23a62f3a-a6925539323mr273452866b.34.1717490501265;
        Tue, 04 Jun 2024 01:41:41 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a692ad28816sm166550966b.31.2024.06.04.01.41.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 01:41:40 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: meson: add GXLX/S905L/p271 support
Date: Tue,  4 Jun 2024 08:41:34 +0000
Message-Id: <20240604084134.3315841-2-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240604084134.3315841-1-christianshewitt@gmail.com>
References: <20240604084134.3315841-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_014144_378573_4AF51A0E 
X-CRM114-Status: GOOD (  15.01  )
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

Add a device-tree for the GXLX Amlogic P271 (S905L) reference design
board. This is a low-cost design similar to P281 (S905W) but with
silicon differences to omit VP9 and use Mali 450-MP2 (not MP3). The
SoC is marked with S905L and "2" (believed to denote MP2) resulting
in chip distributor stock lists and Android STB marketing sometimes
describing it as an S905L2 chip.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
NOTE: This patch depends upon the following submitted patches for
VDEC [0] and SARADC [1] support:

[0] https://patchwork.kernel.org/project/linux-amlogic/list/?series=858514
[1] https://patchwork.kernel.org/project/linux-amlogic/list/?series=858525

CHECK_DTBS generates some warnings for pre-existing issues inherited
from common dtsi files. The patch does not add any new issues.

 arch/arm64/boot/dts/amlogic/Makefile          |  1 +
 .../dts/amlogic/meson-gxlx-s905l-p271.dts     | 51 +++++++++++++++++++
 2 files changed, 52 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxlx-s905l-p271.dts

diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
index 0f29517da5ec..0746e01b5853 100644
--- a/arch/arm64/boot/dts/amlogic/Makefile
+++ b/arch/arm64/boot/dts/amlogic/Makefile
@@ -62,6 +62,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-libretech-cc-v2.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-libretech-cc.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-nexbox-a95x.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-p212.dtb
+dtb-$(CONFIG_ARCH_MESON) += meson-gxlx-s905l-p271.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxm-gt1-ultimate.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxm-khadas-vim2.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxm-mecool-kiii-pro.dtb
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxlx-s905l-p271.dts b/arch/arm64/boot/dts/amlogic/meson-gxlx-s905l-p271.dts
new file mode 100644
index 000000000000..1221f4545130
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-gxlx-s905l-p271.dts
@@ -0,0 +1,51 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2024 Christian Hewitt <christianshewitt@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "meson-gxl-s905x.dtsi"
+#include "meson-gx-p23x-q20x.dtsi"
+
+/ {
+	compatible = "amlogic,p271", "amlogic,s905l", "amlogic,meson-gxlx";
+	model = "Amlogic Meson GXLX (S905L) P271 Development Board";
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x0 0x0 0x40000000>;
+	};
+
+	sound {
+		model = "P271";
+	};
+};
+
+&apb {
+	mali: gpu@c0000 {
+		/* Mali 450-MP2 */
+		interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>,
+			<GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>,
+			<GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH>,
+			<GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>,
+			<GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>,
+			<GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH>,
+			<GIC_SPI 166 IRQ_TYPE_LEVEL_HIGH>,
+			<GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "gp", "gpmmu", "pp", "pmu",
+			"pp0", "ppmmu0", "pp1", "ppmmu1";
+	};
+};
+
+&saradc {
+	compatible = "amlogic,meson-gxlx-saradc", "amlogic,meson-saradc";
+};
+
+&usb {
+	dr_mode = "host";
+};
+
+&vdec {
+	compatible = "amlogic,gxlx-vdec", "amlogic,gx-vdec";
+};
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
