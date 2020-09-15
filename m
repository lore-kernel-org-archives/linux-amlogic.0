Return-Path: <SRS0=PGU9=CY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DDDCC43461
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Sep 2020 15:25:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79DCF206B6
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Sep 2020 15:25:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2cLKa2sB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="EGfeOw4+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 79DCF206B6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kXWtOd0JKk/tC2J+JPR+wDq5tPK7hCqMbsmzIeU6DNE=; b=2cLKa2sBnAxrxV6lBHcDU1+cm
	Tqz5mOAYC0RsCyHyf9sBPShwMUKDR11plUa0gZ6ejgsVbQ5y84VWTVlUzb85ivLnn8EyshmRRtVyb
	DVA5yRVmjX3xMtkk6G56m0bnxpuiu75lH75m7+dY9LsjjkyfCHTPYDOOTVWIsTdYOYLO6b+WCU8Pi
	GO83Wklij1LE2cJg1W8s6ctHNc5EKmvfuS0qKqxNvak1oyq4PIGkXNVN6JFo9B5pU6MuPBv09Rfe5
	tD+WiaavFq4rwBX75QIwcaumSWEBpyRhH+YG0U7s5YHyxvA10ruFshuBP6996Qjd/02DoY1tigbbJ
	XxOamoASw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kICpg-0008E0-DR; Tue, 15 Sep 2020 15:25:24 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kICp2-00081c-KK
 for linux-amlogic@lists.infradead.org; Tue, 15 Sep 2020 15:24:55 +0000
Received: by mail-wr1-x441.google.com with SMTP id t10so3824026wrv.1
 for <linux-amlogic@lists.infradead.org>; Tue, 15 Sep 2020 08:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0gZ+YMPLfBO/R15jPy3oPKv0zNd05fNly8pHsr8U99U=;
 b=EGfeOw4+SDurso+Dyhq4JgPvPuNCfXkoF5QnHUhW0zyRByT6ESUh5yY24EgAkddZdp
 ES16D3aQqRdc2MR/AqU7vO6lq8TLl5CjS5pwYe4hFUvSaLFlxUiXGwpdMWcWrq4YKdQV
 8AkXGya0oC9dU1Hauzc7FDsgnC0zBI/no3zw/bu3XuH67AqWq5GuvR9pB4KjEKQf3Tqq
 S7oZZWQObIDARVrO8yUtmY/ptW6eBpVB+10wRoP42V3ICpu/mvdJ6fi9OPJjZuz4wiGZ
 wS7KZttndJL2wNMk7is2HT2ijtSNAdw4Gbo8NBNceVfx5cBHEHLX+oEiUraI6Q+zWCJk
 sEuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0gZ+YMPLfBO/R15jPy3oPKv0zNd05fNly8pHsr8U99U=;
 b=qhpZGHI8x4FR2e9tLHFGGj7hcQkbXZYmZdF9+M1R6s/RDMjfZFW4/tAMVNrOGG64Br
 GTGFAregwBznGu8IVKWBmUbCbH+D/ozoCqPd1hbwxXjOgu9Pac+Y00ToMRPTe/DmCer8
 sL3OzNLPl/MfETxQuPVu/Ck92Zqh3DvNLAg/nlaHUpqF8X92bE/3Te+KZ8WiwN4HQh2D
 WbxgXDEgfC/xkYDasxPqcXg8Tr3ov9P3dhFVpFAhsyON+YxqRL+j+7MgieDg5DVo1RCs
 jLjhcx25+0zvieNgAWb9++nEQxbiQT6UrLPKoMKvLuooLzuInf40X+FATrBV/ePcsqrs
 2RIg==
X-Gm-Message-State: AOAM5330MY0qUz9gw1ciKBaeDhmozjTsMKDUZdgjdkot3FuqzsjjXGSQ
 l8IPY143rNlclJEtQK7p0WFVeg==
X-Google-Smtp-Source: ABdhPJw8JXVzziE+/esCJy0ADiwegrvSaUzt3GxV73kE8tnHfqeExlt4rZyZ4kAU6JSUYWyoT/DCJw==
X-Received: by 2002:adf:f843:: with SMTP id d3mr23628823wrq.226.1600183483547; 
 Tue, 15 Sep 2020 08:24:43 -0700 (PDT)
Received: from bender.baylibre.local (home.beaume.starnux.net. [82.236.8.43])
 by smtp.gmail.com with ESMTPSA id
 189sm25984960wmb.3.2020.09.15.08.24.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2020 08:24:42 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH v2 3/3] arm64: dts: meson: add support for the ODROID-N2+
Date: Tue, 15 Sep 2020 17:24:32 +0200
Message-Id: <20200915152432.30616-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200915152432.30616-1-narmstrong@baylibre.com>
References: <20200915152432.30616-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200915_112444_790721_B5F72CEB 
X-CRM114-Status: GOOD (  15.69  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Christian Hewitt <christianshewitt@gmail.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, tobetter@hardkernel.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Christian Hewitt <christianshewitt@gmail.com>

HardKernel ODROID-N2+ uses an Amlogic S922X rev. C chip capable of higher
clock speeds than the original ODROID-N2.

The rev. C support a slighly higher VDDCPU_A & VDDCPU_B voltages and supports
the same OPPs as the Amlogic A311D SoC from the same G12B family.

Suggested-by: Dongjin Kim <tobetter@hardkernel.com>
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/Makefile          |  1 +
 .../dts/amlogic/meson-g12b-odroid-n2-plus.dts | 31 +++++++++++++++++++
 2 files changed, 32 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2-plus.dts

diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
index 4e2239ffcaa5..b0b3d6791499 100644
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
index 000000000000..5de2815ba99d
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2-plus.dts
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2019 BayLibre, SAS
+ * Author: Neil Armstrong <narmstrong@baylibre.com>
+ */
+
+/dts-v1/;
+
+/* The Amlogic S922X Rev. C supports the same OPPs as the A311D variant */
+#include "meson-g12b-a311d.dtsi"
+#include "meson-g12b-odroid-n2.dtsi"
+
+/ {
+	compatible = "hardkernel,odroid-n2-plus", "amlogic,s922x", "amlogic,g12b";
+	model = "Hardkernel ODROID-N2Plus";
+};
+
+&vddcpu_a {
+	regulator-min-microvolt = <680000>;
+	regulator-max-microvolt = <1040000>;
+
+	pwms = <&pwm_AO_cd 1 1500 0>;
+};
+
+&vddcpu_b {
+	regulator-min-microvolt = <680000>;
+	regulator-max-microvolt = <1040000>;
+
+	pwms = <&pwm_AO_cd 1 1500 0>;
+};
+
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
