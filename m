Return-Path: <SRS0=UX1O=A6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E012C433EC
	for <linux-amlogic@archiver.kernel.org>; Sun, 19 Jul 2020 14:11:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED98822B4E
	for <linux-amlogic@archiver.kernel.org>; Sun, 19 Jul 2020 14:11:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q78Id7aT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DS1kNoof"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED98822B4E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SikiGlxNP/8WCkkEQDJau5YOst0UnF3g8wmXaP4nHDA=; b=Q78Id7aT3EHKwMWoAFd6N9VgqE
	DcoCrcXnLtPWK3FiuMkDgv/W4yxdpYF2E0aEsuW3gC0omG2Mo1pGvdqkKFIKUncSCnVXnJOo5si9X
	3BC/9mtjcAQWYJA6BcbWVicf+Ty/a4wNWvwe+Cej5zjxW5X1Z6dtoNxX2UR5e3ti37kWZ0PUXR42R
	RXm0ip9btHVefZTeyo03YbelxNrjxUiVUsA3Eha1l8Xqmil69hX7Rz+YMhl6RVPswZVJEzWfbJTWT
	w4fn0xLzphYZus1EgDhn60yD1YV9MDYNBMM93Ee2mag8plA/xqTc4Cf1MbBb3LxG8F5M431LGw27N
	j48FAlFA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxA22-0002ZR-Du; Sun, 19 Jul 2020 14:11:10 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxA1f-0002UA-5S; Sun, 19 Jul 2020 14:10:48 +0000
Received: by mail-wr1-x443.google.com with SMTP id a14so529832wra.5;
 Sun, 19 Jul 2020 07:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=BO3/npBe/d3IU+Xb/V+yWFJYQheJQv/P5LLMxy6zjOI=;
 b=DS1kNoof5nEfvtqD86NpiQvO/pKycqZpLQzz8mUB3MWCkvVyMJmRQ1FbhDzVqfrp/6
 laMgFtXMutsiEfpZtMG8O5zv2v7Hgm9R1JHkdUp/eGAD1S4BLt32HCwzuoS+LDECAuUp
 OJ1rqdgCZBWhI9KbCEshgetYXCa6/HWhX24XTjk3eh/xU8X781tF2AytCVqTOCDomH7c
 ev+gtrNpA+urtRvUWMynwGeoRwTQOupGV5ItsQj7FTuLnO8Ts3Wh/WWGSkH3DRCRVDHT
 1Tl7iTcwy7I2wWGZ0XX9HWJkmYrgOal+usAs164luVeeqbShAFEJ3WLYSZhTYJIDX2Dz
 HEgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=BO3/npBe/d3IU+Xb/V+yWFJYQheJQv/P5LLMxy6zjOI=;
 b=FkQ495296owensSTX5Yqh1wBbYvgL5JjlfcvHrHIagaUoQgBEaE9Il0VGU+rwpnVJ6
 8h0BgtKHbDMnyCSPuv7OJ+hI3XDGr2uSvj7/NhQlo/fTTdNjOBtvPnn4aYxvEjenlay8
 Ak0terbTKDsnGi3gziVbN1PRKuUsDPrxGB1gamgqOrkwv+hbQRAs0DtjaFcvXSeWRgab
 6AWajVebLSaU68sIp3WjtOgbctWGtIblccKcAtm7+6QXw3UbPq+ik66cwwDqR2ls2jJV
 CdMBtUL5qn/ObW6bev9yaagBNYvciY/rl3MvhPFoBHMY5BVA51Ah2CVJ54yZKJQMtUgv
 +nHQ==
X-Gm-Message-State: AOAM531N5hUnMOT8B3utSZbLQZBpnl/H0SGJp12VEPb+CS0B9f/t4oc/
 ye6dvqnnHhnqrMos+yTz3vU=
X-Google-Smtp-Source: ABdhPJyLN7KEli95FjWvMQPH5iNrxKCsln/FrY+b7WavAQ92CWP0VWbwceObDro0QbbWzaSdIEZH6Q==
X-Received: by 2002:adf:d084:: with SMTP id y4mr17959433wrh.161.1595167845879; 
 Sun, 19 Jul 2020 07:10:45 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id y11sm9215554wrs.80.2020.07.19.07.10.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jul 2020 07:10:45 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] arm64: dts: meson: add support for the ODROID-N2+
Date: Sun, 19 Jul 2020 14:10:34 +0000
Message-Id: <20200719141034.8403-4-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200719141034.8403-1-christianshewitt@gmail.com>
References: <20200719141034.8403-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200719_101047_266151_D69A9508 
X-CRM114-Status: GOOD (  16.09  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Dongjin Kim <tobetter@hardkernel.com>,
 Christian Hewitt <christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

HardKernel ODROID-N2+ uses an Amlogic S922X rev. C chip capable of higher
clock speeds than the original ODROID-N2. Hardkernel supports the big cpu
cluster at 2.4GHz and the little cpu cluster at 2.0GHz. Opp points and
regulator changess are from the HardKernel Linux kernel sources.

Suggested-by: Dongjin Kim <tobetter@hardkernel.com>
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 arch/arm64/boot/dts/amlogic/Makefile          |  1 +
 .../dts/amlogic/meson-g12b-odroid-n2-plus.dts | 53 +++++++++++++++++++
 2 files changed, 54 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2-plus.dts

diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
index 5cac4d1d487d..6dc508b80133 100644
--- a/arch/arm64/boot/dts/amlogic/Makefile
+++ b/arch/arm64/boot/dts/amlogic/Makefile
@@ -8,6 +8,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-g12b-gtking-pro.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-a311d-khadas-vim3.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-s922x-khadas-vim3.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-odroid-n2.dtb
+dtb-$(CONFIG_ARCH_MESON) += meson-g12b-odroid-n2-plus.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-ugoos-am6.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-kii-pro.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-nanopi-k2.dtb
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2-plus.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2-plus.dts
new file mode 100644
index 000000000000..99e96be509f8
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2-plus.dts
@@ -0,0 +1,53 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2019 BayLibre, SAS
+ * Author: Neil Armstrong <narmstrong@baylibre.com>
+ */
+
+/dts-v1/;
+
+#include "meson-g12b-odroid-n2.dtsi"
+
+/ {
+	compatible = "hardkernel,odroid-n2-plus", "amlogic,s922x", "amlogic,g12b";
+	model = "Hardkernel ODROID-N2+";
+
+	vddcpu_a: regulator-vddcpu-a {
+		regulator-min-microvolt = <680000>;
+		regulator-max-microvolt = <1040000>;
+
+		pwms = <&pwm_ab 0 1500 0>;
+	};
+
+	vddcpu_b: regulator-vddcpu-b {
+		regulator-min-microvolt = <680000>;
+		regulator-max-microvolt = <1040000>;
+
+		pwms = <&pwm_AO_cd 1 1500 0>;
+	};
+
+	cpu_opp_table_0: opp-table-0 {
+		opp-1908000000 {
+			opp-hz = /bits/ 64 <1908000000>;
+			opp-microvolt = <1030000>;
+		};
+
+		opp-2016000000 {
+			opp-hz = /bits/ 64 <2016000000>;
+			opp-microvolt = <1040000>;
+		};
+	};
+
+	cpub_opp_table_1: opp-table-1 {
+		opp-2304000000 {
+			opp-hz = /bits/ 64 <2304000000>;
+			opp-microvolt = <1030000>;
+		};
+
+		opp-2400000000 {
+			opp-hz = /bits/ 64 <2400000000>;
+			opp-microvolt = <1040000>;
+		};
+	};
+};
+
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
