Return-Path: <SRS0=twEQ=DJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 749F6C47425
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Oct 2020 14:32:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0716E2074B
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Oct 2020 14:32:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jN7RO+Di";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HzKtPkn9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0716E2074B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SwPE7rYRrDzCfV9XiYuGzUsSIl+umzOZTugL1URDwQM=; b=jN7RO+Di5MwH5mlDSSVnukvLRO
	35jSE9ODXqWgCc5m+VQxyRm5+HLvKD12oYu7QCOIIlYwbAocOs3cGGbIaHsrAptUOSW1L7FI9Bzod
	Z7QFDr2MwQfieaIy6aLGYvOrYkZstpCDJnbwfKiBNe0iS1YeHFZgQHn0XzcLpDDS+JYUXF3MTKzxO
	UbL4+uTFlB05nUbEvPo42E2tE6UmXn9MZCVSpDslXau51hqdF8aeosTQWZgto9EuJ1Nt/r41X5o26
	KI8iwsYujxIZ+T/lMf4M+oqTuNMc/O9/8pubhxCbuU60NTvwfsXLPUXX5aB5zgy2QdXdIS92tbGQy
	wKeAoawg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kOM6H-0001Mg-SL; Fri, 02 Oct 2020 14:31:57 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kOM69-0001Ic-AH; Fri, 02 Oct 2020 14:31:50 +0000
Received: by mail-wr1-x443.google.com with SMTP id z4so2076642wrr.4;
 Fri, 02 Oct 2020 07:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=UrTzQqJfmOE3wc4LgtWfzvjavE1CxqA487snNOvdDF4=;
 b=HzKtPkn9lPvk9zekQGxzBIYhDFNmhiIH2IVZUA+5GBMe8/a7f/oD87qbUjd8TsEX8L
 UfoFMPFmFb/kcEijFUgXnBuySA4y0wW203Ck5X5rkAxkIm3xI8dl+OS1ZWO4/wJ6Xvue
 KpThXqWs50Q5OyciJu8wYfitbRzkMaz5RVMrsw90jn5d1Jo2709FafQmjG63al/ak9wC
 2hZydOSZH+RZ7xnF5U6GvoDEKOSCzPNejVzm+APlbm4ufNTICeFPN5cARj4BQOTYYcrR
 +wGcFF1WFx66MqyixJl7WvGlWAP11AJRwZWVQUKfBJhRvYugXJFTONBlPO9DI4mNUvWa
 zBOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=UrTzQqJfmOE3wc4LgtWfzvjavE1CxqA487snNOvdDF4=;
 b=SxP7sbclE3dp7oc9/fPWWByPRsd4ORoV22DrSdZTSbyjffVrWIuM4pbUePEZem2ap0
 6e2t7TklISFFSISntJU2DDPgUaWHBfEPARjIXGSIxO/YbCq1cl4crgsaHnvPB8a3ig2R
 aHUVL/7G1EkM/7orgaqiYenMPo+BJ1NEkxXkYLxcoTfL4lC1crndwdKmr0XXLI0Au2nJ
 5uq/SwGceae1yJscJTOvV0x2QtP+bbKmI8VU/6yuyZVO1v+iPdzYW1VMXlidrO2wHHrd
 N+JVIFqoBw/lB7TCx6jgvMs4vGoEL+v0Xkz/GLscMNyd83ynGbStjnIhs84vP9Ws9sEP
 Qg9g==
X-Gm-Message-State: AOAM5316oa5iZTUFzSRGA8eSBaPgaIChC515sAWDWBG80gyRJd1OUIAZ
 m8PFhprlsqhhwoM1SPzIvMA=
X-Google-Smtp-Source: ABdhPJytmUAYV37QaWavgwlpzOpwki1PMc3p+mJ1MwKtsGs63D+2RGUUGDMrlc9koWdviIlzszwzzQ==
X-Received: by 2002:a05:6000:108a:: with SMTP id
 y10mr3640936wrw.41.1601649108246; 
 Fri, 02 Oct 2020 07:31:48 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id w7sm1907392wrm.92.2020.10.02.07.31.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2020 07:31:47 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 01/10] arm64: dts: meson: add audio playback to a95x
Date: Fri,  2 Oct 2020 14:31:32 +0000
Message-Id: <20201002143141.14870-2-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201002143141.14870-1-christianshewitt@gmail.com>
References: <20201002143141.14870-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201002_103149_419288_7F27C8CC 
X-CRM114-Status: GOOD (  13.94  )
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

Add initial audio support limited to HDMI i2s.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 .../dts/amlogic/meson-gxbb-nexbox-a95x.dts    | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts
index 67d901ed2fa3..b5b11cb9f393 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts
@@ -10,6 +10,7 @@
 #include "meson-gxbb.dtsi"
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/sound/meson-aiu.h>
 
 / {
 	compatible = "nexbox,a95x", "amlogic,meson-gxbb";
@@ -139,6 +140,45 @@
 			};
 		};
 	};
+
+	sound {
+		compatible = "amlogic,gx-sound-card";
+		model = "GXBB-NEXBOX-A95X";
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
+			sound-dai = <&aiu AIU_CPU CPU_I2S_ENCODER>;
+			dai-format = "i2s";
+			mclk-fs = <256>;
+
+			codec-0 {
+				sound-dai = <&aiu AIU_HDMI CTRL_I2S>;
+			};
+		};
+
+		dai-link-2 {
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
 };
 
 &cvbs_vdac_port {
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
