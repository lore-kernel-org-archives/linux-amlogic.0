Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E59AFC54EAA
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Jan 2023 10:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lF9PVG9bvINNv1641ojNM81deZTqrFj+UR0COx2GJpc=; b=i4KZftBfcRshJW
	nvnk3dvwa19UGF2s8VzFxnGA3N+PI3/0JSWkV8zE94h1bM0gUZQlibkDDncWbGe77OPLVsDtVn7Lv
	hDewF4mVq9ILaX3Jyq8gF67Cv4JUZrjSP0zjOC9cvQzlohhmwqZqSaUcIQJ0aIzyUaCuQyYtaU39n
	Rd/i1gWYnOGbLa9wnkaX3pFGLVNXT6Bb5YbZOEfSl5Ybd5bgP9P/u81C6NZmJzqSMprnCt2s2y3Cj
	tfGbmJh39tJBJxwBF6LhbaPlAbDzh82HNtpSrPD8Vk0Z5vpk6Cgem0NUaU4YYcgoF+i0hPGaGR57F
	5miYkndFK18DQij8kKYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLLaN-00Dq7Z-Ss; Fri, 27 Jan 2023 10:03:55 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLLZM-00DpfF-9o; Fri, 27 Jan 2023 10:02:53 +0000
Received: by mail-wr1-x434.google.com with SMTP id q10so4476700wrm.4;
        Fri, 27 Jan 2023 02:02:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+i0eLMTWjOI2xC42he9R9s//kUQXBFdMh3V8zfod4pQ=;
        b=CEDqIzPAE0IuViSWoc4Jbuq4+Ywymqqxss4De4eoB/GtIMGKJemPE0LXqNAkw4gv8/
         PS0n7qDXtOdkuGVn7ZMsP+LSXOY8qExML2zTkr2gvws+g+qUwR1V57R69jpYoD0GzWHq
         jBTv19svOOwtUeYVaYs9C2xtSS85lii6GTlJRxcNgpzxshGilz9DnUnx9LxLEJQ088Pa
         L5y+g4FpMFShtPBf9s4e4ZN5KuRs4zU/DOE/QWTEiJgr+MWXfsNpneChEweXin8qf3Jq
         NJFF49FXjHCP9fO40daUS2qowGQFJ5I8m+1jSWMTbj+RQNdI4tn8I5IppYxuPdPAdo+f
         X70g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+i0eLMTWjOI2xC42he9R9s//kUQXBFdMh3V8zfod4pQ=;
        b=3pt/WShQb3JN5tmZiTb4ZFHDB/6NGwS1wJNH16CiAzZNlKyGwehzgkGqe3GVUyHfSl
         nfEj8rB19kF44ZcjIzRcShI0J0sNs2JKE/kFZp8EaUkS8Kc8zNjzUjENxtPcGBKcg4fT
         StGZDs/z8fQuwAX4DBbxKYhbsRxiyiPDIUaF9rJIH5ihGmhgXbJRqbknL5ppx+wiEkh8
         e+R9AG6hwDvqQ7KGp/5hd13esVNJogBWawO5+jk762L7SdkapHaWxcXMun8n8oJ8PABL
         6Nui3C0qJJaRNA0F9tzmITz1csDX/FyONm52XkCyrMnPFMiWG33n7OyXeVIXE7i78yJW
         bV3A==
X-Gm-Message-State: AO0yUKVUlhbw7RBGUG8E4OaA3i4Zn/ELWVE/7JH+2mFsY2B+bLvAzjYg
	NUviKuoSNJPc47yzUYx6sIM=
X-Google-Smtp-Source: AK7set/sExxhpwfnb0/OUAoqxgO6THNrfla6W5lL0Vl3QVhcUlTPuU3lQDcCiY7dvm2OuFiwjR64aA==
X-Received: by 2002:adf:a1dc:0:b0:2bf:b4ca:6bac with SMTP id v28-20020adfa1dc000000b002bfb4ca6bacmr9050741wrv.59.1674813771093;
        Fri, 27 Jan 2023 02:02:51 -0800 (PST)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id l7-20020adffe87000000b002bfbe30e8f8sm3493858wrr.98.2023.01.27.02.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 02:02:50 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] arm64: dts: meson: add support for BananaPi M2-Pro
Date: Fri, 27 Jan 2023 10:02:36 +0000
Message-Id: <20230127100236.3385154-5-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230127100236.3385154-1-christianshewitt@gmail.com>
References: <20230127100236.3385154-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_020252_386519_010DBC4A 
X-CRM114-Status: GOOD (  14.10  )
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

BPI-M2-PRO is based upon the BPI-M5 design except for a different
physical board layout and the following changes:

- USB 3.0 ports reduced from 4x to 2x
- 3.5mm Combined CVBS/Audio Jack removed
- RTL8821BU WiFi/BT module (internal USB connected)

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 arch/arm64/boot/dts/amlogic/Makefile          |  1 +
 .../dts/amlogic/meson-sm1-bananapi-m2-pro.dts | 98 +++++++++++++++++++
 2 files changed, 99 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m2-pro.dts

diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
index 97b42e2100e0..644451794aca 100644
--- a/arch/arm64/boot/dts/amlogic/Makefile
+++ b/arch/arm64/boot/dts/amlogic/Makefile
@@ -60,6 +60,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-gxm-wetek-core2.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-s4-s805x2-aq222.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-sm1-a95xf3-air-gbit.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-sm1-a95xf3-air.dtb
+dtb-$(CONFIG_ARCH_MESON) += meson-sm1-bananapi-m2-pro.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-sm1-bananapi-m5.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-sm1-h96-max.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-sm1-khadas-vim3l.dtb
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m2-pro.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m2-pro.dts
new file mode 100644
index 000000000000..4890d5d9a4f7
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m2-pro.dts
@@ -0,0 +1,98 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2021 BayLibre SAS
+ * Author: Neil Armstrong <narmstrong@baylibre.com>
+ */
+
+/dts-v1/;
+
+#include "meson-sm1-bananapi.dtsi"
+#include <dt-bindings/sound/meson-g12a-tohdmitx.h>
+
+/ {
+	compatible = "bananapi,bpi-m2-pro", "amlogic,sm1";
+	model = "Banana Pi BPI-M2-PRO";
+
+	sound {
+		compatible = "amlogic,axg-sound-card";
+		model = "BPI-M2-PRO";
+		audio-aux-devs = <&tdmout_b>;
+		audio-routing = "TDMOUT_B IN 0", "FRDDR_A OUT 1",
+				"TDMOUT_B IN 1", "FRDDR_B OUT 1",
+				"TDMOUT_B IN 2", "FRDDR_C OUT 1",
+				"TDM_B Playback", "TDMOUT_B OUT";
+
+		assigned-clocks = <&clkc CLKID_MPLL2>,
+				  <&clkc CLKID_MPLL0>,
+				  <&clkc CLKID_MPLL1>;
+		assigned-clock-parents = <0>, <0>, <0>;
+		assigned-clock-rates = <294912000>,
+				       <270950400>,
+				       <393216000>;
+		status = "okay";
+
+		dai-link-0 {
+			sound-dai = <&frddr_a>;
+		};
+
+		dai-link-1 {
+			sound-dai = <&frddr_b>;
+		};
+
+		dai-link-2 {
+			sound-dai = <&frddr_c>;
+		};
+
+		/* 8ch hdmi interface */
+		dai-link-3 {
+			sound-dai = <&tdmif_b>;
+			dai-format = "i2s";
+			dai-tdm-slot-tx-mask-0 = <1 1>;
+			dai-tdm-slot-tx-mask-1 = <1 1>;
+			dai-tdm-slot-tx-mask-2 = <1 1>;
+			dai-tdm-slot-tx-mask-3 = <1 1>;
+			mclk-fs = <256>;
+
+			codec {
+				sound-dai = <&tohdmitx TOHDMITX_I2S_IN_B>;
+			};
+		};
+
+		/* hdmi glue */
+		dai-link-4 {
+			sound-dai = <&tohdmitx TOHDMITX_I2S_OUT>;
+
+			codec {
+				sound-dai = <&hdmi_tx>;
+			};
+		};
+	};
+};
+
+&clkc_audio {
+	status = "okay";
+};
+
+&frddr_a {
+	status = "okay";
+};
+
+&frddr_b {
+	status = "okay";
+};
+
+&frddr_c {
+	status = "okay";
+};
+
+&tdmif_b {
+	status = "okay";
+};
+
+&tdmout_b {
+	status = "okay";
+};
+
+&tohdmitx {
+	status = "okay";
+};
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
