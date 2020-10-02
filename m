Return-Path: <SRS0=twEQ=DJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 692ACC4363D
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Oct 2020 14:33:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C97A206DB
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Oct 2020 14:33:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nb+7fZCF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MfBTfakv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C97A206DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EcjfQuuwiReBH6s/3z25BikQQoUPjwPNQI7YR/3cFHs=; b=nb+7fZCFYQoRLaM3HhYlkZTaXY
	gCCeYO+c40OORwGn595CKNeRNLRWj5zO6si2J13ZnkIeq8WYkdJubRMs8LrL49GZaTRC9Mkltfj4S
	/8/13bIFlLpE2/PBrr6s4kEgbKFopXB0UOM3SZSwAclCZEw7DWesDSIE9/o4NI4UOGrBBQjtB1vI4
	MAju4GY2ObuumWvPG/MjQSoANS2MEEpPVmK452lIMTMzHrSYvqSJ96zo4RIcILBGs6E/uwvcu+Rn4
	olLkzIRjzkBTvI3yFBM4UaPIrB53GiLIGohLByFTxhFMjaiNOLHzmuRNHh+cDDV2CNGOzhkdd68ms
	CYW8iEnw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kOM7q-0002M8-FV; Fri, 02 Oct 2020 14:33:34 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kOM6U-0001Th-70; Fri, 02 Oct 2020 14:32:11 +0000
Received: by mail-wr1-x443.google.com with SMTP id m6so2093201wrn.0;
 Fri, 02 Oct 2020 07:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=1gIivsKhrs5B4E2eM/SXdSVH3UTq3Ox3b3pPitMs8zM=;
 b=MfBTfakv1DRtuw9LCRw4XUKI/kYSLWvtvMK9+FY9LWPBYKa40UMI4u0TIeCpfNWSyU
 h8v9BKBhEWmYAAVutZzmZGlI9cFjvlgLBKuoVeZjZudhJa9W1uZKQnnHHV4x+cdm8Zc6
 DpuKoW1hlmiQ6Nzuw6CTxk+aTMBmgidolj0Fj+ngitt+nHGa1wyHA/bR2bebyp2CoxVV
 kvn6ZdzqjxjDZXtcGhJ614im0o+M8ANk5EqdxwpyIXNaHwkGFneoX5kNowMHZd4GjBTn
 rdsI5WZxm8dpwai4anLgXgXvUm5W9RLNGkdtGY0xwMkagvbHJj9zf5wOlAcv90jMshdj
 dofg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=1gIivsKhrs5B4E2eM/SXdSVH3UTq3Ox3b3pPitMs8zM=;
 b=HyXkvtL8ArEDP0WO5pd8nNvUdLeSjzfpfEpW+TL/4we2z1zslquX+HXBHeaPqeuNAk
 fqY/fnfuBti5VCAtCwBwY4VAr6BzfwgkTrvYhBMTe7s2znyomnZ5hwGD3qQAk6EDCTNW
 qU1qP42AQ8R3pm7x/4w+gFvIXiUjttpXRTL6nq1uJwbFtn47qJRH2nSPJDZcCgAuvq/B
 UWul0k+33GyklkzJYysnSqXgKCQHjpT7N+RlyWp5iIOUsioChKwfuINZSgklfzjU+tPY
 NLvfQEcPWfts0vERNlnsd8578E1o3iyEfcoyuPWT4kaK4Pn9jhzAf0K1ZZLxEn0RDLWn
 XpIQ==
X-Gm-Message-State: AOAM533BN5/S1I9vvWhzrgaX2A/eN+hK6JoBi0VyN/2n5MyoLmdmFbK6
 i/85wAMzN6qCltZJeNIGevI=
X-Google-Smtp-Source: ABdhPJxAsMJBFt1mDap8JdZGwOlH4Qktsgmqvksw+2k8HBZUYiiD/BrMPdckAeioJ12tY1m0Iy9+tw==
X-Received: by 2002:adf:a18c:: with SMTP id u12mr3591224wru.90.1601649129282; 
 Fri, 02 Oct 2020 07:32:09 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id w7sm1907392wrm.92.2020.10.02.07.32.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2020 07:32:08 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 10/10] arm64: dts: meson: add audio playback to wetek-play2
Date: Fri,  2 Oct 2020 14:31:41 +0000
Message-Id: <20201002143141.14870-11-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201002143141.14870-1-christianshewitt@gmail.com>
References: <20201002143141.14870-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201002_103210_477348_B2595B93 
X-CRM114-Status: GOOD (  14.28  )
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
Cc: Christian Hewitt <christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add initial support limited to HDMI i2s and SPDIF (LPCM).

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 .../dts/amlogic/meson-gxbb-wetek-play2.dts    | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dts
index 2ab8a3d10079..f2562c7de67c 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dts
@@ -8,11 +8,19 @@
 
 #include "meson-gxbb-wetek.dtsi"
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/sound/meson-aiu.h>
 
 / {
 	compatible = "wetek,play2", "amlogic,meson-gxbb";
 	model = "WeTek Play 2";
 
+	spdif_dit: audio-codec-0 {
+		#sound-dai-cells = <0>;
+		compatible = "linux,spdif-dit";
+		status = "okay";
+		sound-name-prefix = "DIT";
+	};
+
 	leds {
 		led-wifi {
 			label = "wetek-play:wifi-status";
@@ -39,6 +47,59 @@
 			gpios = <&gpio_ao GPIOAO_3 GPIO_ACTIVE_LOW>;
 		};
 	};
+
+	sound {
+		compatible = "amlogic,gx-sound-card";
+		model = "GXBB-WETEK-PLAY2";
+		assigned-clocks = <&clkc CLKID_MPLL0>,
+				  <&clkc CLKID_MPLL1>,
+				  <&clkc CLKID_MPLL2>;
+		assigned-clock-parents = <0>, <0>, <0>;
+		assigned-clock-rates = <294912000>,
+				       <270950400>,
+				       <393216000>;
+		status = "okay";
+
+		dai-link-0 {
+			sound-dai = <&aiu AIU_CPU CPU_I2S_FIFO>;
+		};
+
+		dai-link-1 {
+			sound-dai = <&aiu AIU_CPU CPU_SPDIF_FIFO>;
+		};
+
+		dai-link-2 {
+			sound-dai = <&aiu AIU_CPU CPU_I2S_ENCODER>;
+			dai-format = "i2s";
+			mclk-fs = <256>;
+
+			codec-0 {
+				sound-dai = <&aiu AIU_HDMI CTRL_I2S>;
+			};
+		};
+
+		dai-link-3 {
+			sound-dai = <&aiu AIU_CPU CPU_SPDIF_ENCODER>;
+
+			codec-0 {
+				sound-dai = <&spdif_dit>;
+			};
+		};
+
+		dai-link-4 {
+			sound-dai = <&aiu AIU_HDMI CTRL_OUT>;
+
+			codec-0 {
+				sound-dai = <&hdmi_tx>;
+			};
+		};
+	};
+};
+
+&aiu {
+	status = "okay";
+	pinctrl-0 = <&spdif_out_y_pins>;
+	pinctrl-names = "default";
 };
 
 &i2c_A {
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
