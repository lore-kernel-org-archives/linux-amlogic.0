Return-Path: <SRS0=sVtX=EW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2935C55ABD
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Nov 2020 06:21:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4FBE920684
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Nov 2020 06:21:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mMo+Tzhi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oVwJCEoU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4FBE920684
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=asE5S9SkJwiFyxEVX1d4dB0PPFcoC8gFkgyBO8KVPRM=; b=mMo+TzhiqLpG+yydvc+HfaLp9t
	WhOpLDZGYPTXZ9WKX2kNEuudDXSgToTF/DGMiwfrs4zmHSRO+JxEJWl5bjhKN00d7YI/x1Ys5OabY
	ZbIFA3NVBAHjWACGbI4WH8yeqSSTYHB0ax2THxJq4Rrf9NOzS0r5T4yLoUd05lHjA9xkHJdODMItL
	HGh8Cb0X0DHAcIhbL3CQpV+oSI2ZVFgKOF7zqsoM2mc5DeMEw+ALpzVUjmbRInjzF4gixnb5P3/+X
	sIEiJXq3Vu265xGcl6u0r0OMRparuTc8a5c2WiW5yQnnQ8i5KVzrsFgaXHKbCcnNO+cxHxVXR0Pae
	veBlLQ8Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1keXtV-0001Uc-Sq; Mon, 16 Nov 2020 06:21:41 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keXsa-00016W-SK; Mon, 16 Nov 2020 06:20:46 +0000
Received: by mail-wr1-x436.google.com with SMTP id u12so10157489wrt.0;
 Sun, 15 Nov 2020 22:20:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=0aTKJ5HZFsSQ+eCcPAw4QelVRGYoHt0VsuUcLv/a/yw=;
 b=oVwJCEoUO0cPE+bysHQys/P8gwJ4OSvwnJA4An072DSCY4iXPFcNH5wtV9UTVXxE6l
 DzKKbcQJrtAZrekquPHe3ihM4nKjwo2rGZ+sRj8zdhS7wJG66dfd8n26n3q0cEkgeMxr
 1cOJO64BQb2ClGanobW+xcd9G31OkyGekoMhJTt9aQWPIQQFTr4/loTS2OLKJo18nrjw
 jev2rgn+vK0yVGjEJOvcYHt4gMf41pnjydlpVz+yG8nKFYgeuDs/3FCTQ/TMwt1A7lOT
 4/xmPVhyydXRAAMEPOLvsLbEZIf71WZtEecDMbbyymOk0/kKesGkg5t1YhosoXy6M3UI
 de6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=0aTKJ5HZFsSQ+eCcPAw4QelVRGYoHt0VsuUcLv/a/yw=;
 b=PX+yZTOITO0NxUaZE7X0qg7L5QAtJVwfpsB0yFhW99v5aA1wND7mmRUzByo64c3IYG
 48Krlfxd3/eYnmkLrcjs56+Y3ITJIe9dP61UstZWjnNW1DIKWRANPvK7Kzw4ANDl22m/
 myAzQYgZbnZ9E9t6Q5DuQyrbOdNirlOCT1gCgwHWbPQU0HOtRd/326lmKU6Cst3sOQkd
 k08IlsS+1MDONdaQNrHRbvZfJicKWqFxo0u5uztqm6u9BSuQmgyKbikN+rISWv8rqfJP
 e5iofj/HRkUaVo0szVEQVF2UmF+cXNsGwqyIrk0xy2cu18jA0CDshZghbvG1xgWKlLmw
 RCpw==
X-Gm-Message-State: AOAM531ADflZQYCBTP71mjhIC0Zim79hA+n7QVzP5leEbhLt6k2xyPoK
 dvqwylBElBHLpfvSHbwbJBU=
X-Google-Smtp-Source: ABdhPJw3LqdgZebMeTfGoydpX1BZ+cu0qP7A/4FSFPeRA62GMGxV73zIG8beWWh+IHU5qZo4UVAf4g==
X-Received: by 2002:a5d:550f:: with SMTP id b15mr16793905wrv.145.1605507643792; 
 Sun, 15 Nov 2020 22:20:43 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id m3sm17065985wrv.6.2020.11.15.22.20.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Nov 2020 22:20:43 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/7] arm64: dts: meson: add audio playback to nanopi-k2
Date: Mon, 16 Nov 2020 06:20:28 +0000
Message-Id: <20201116062031.11233-5-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201116062031.11233-1-christianshewitt@gmail.com>
References: <20201116062031.11233-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_012045_129630_97DDF1E7 
X-CRM114-Status: GOOD (  13.89  )
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
 .../boot/dts/amlogic/meson-gxbb-nanopi-k2.dts | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts
index 7be3e354093b..8e5df00b06a2 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts
@@ -7,6 +7,7 @@
 
 #include "meson-gxbb.dtsi"
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/sound/meson-aiu.h>
 
 / {
 	compatible = "friendlyarm,nanopi-k2", "amlogic,meson-gxbb";
@@ -130,6 +131,45 @@
 			};
 		};
 	};
+
+	sound {
+		compatible = "amlogic,gx-sound-card";
+		model = "GXBB-NANOPI-K2";
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
 
 &cec_AO {
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
