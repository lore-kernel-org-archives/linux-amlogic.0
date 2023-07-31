Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC7CAC001E0
	for <linux-amlogic@archiver.kernel.org>; Mon, 31 Jul 2023 09:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tfgOPL4is4DzPV4mJvVuJ0eOx3oSuN5ypbndwl3nYyE=; b=sAlMGCvQxsTc0g
	dbm3lpKGroCVaeRq9H/pJFUqLlqyD3lbfGNm34Q+s/cpgj8U+wg//JKoYlRcnKaAHsFqCZ4BIbqNt
	lWJzmYWY7pZjP8b83SZQQVI6sbzhZjziYm21Yn8eYQmp9aBk++UgWN1mdW2pTDJvqR8XTxIiKWARX
	3tpoFFumBsxNcXlY0ViwJN4+R6MwqltnSgiaZyk6iEhk//asIwhN4ueSrzupY1AdPGiQzvPSSHPKK
	ZfMz7M2AUDxTraCEa7Yw2ksz4UsJ7UGG9XRajGR/xWFp38GlZYZUFSFCQsfeyPC3eIFo9+9WWv8DG
	woiZXahpESE6lUXmc9jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQPKC-00EmyF-2o;
	Mon, 31 Jul 2023 09:36:24 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQPK8-00EmxU-20
	for linux-amlogic@lists.infradead.org;
	Mon, 31 Jul 2023 09:36:23 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-522c9d388d2so1018360a12.3
        for <linux-amlogic@lists.infradead.org>; Mon, 31 Jul 2023 02:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690796179; x=1691400979;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XkKvGl98k7jbhJNYp8TOnQKWjAoQngtktIUofwxlKfo=;
        b=N+f5j0PP7D4jM9OojshnHzaAAeFKJboSLlope5zhdK8H5ldblSk402lkqWyo3MthCk
         4cRQGwdpZq2nWrI60dfhwtVXxYNPCgM8s5dTQtAXPA2JOSmIX+ggD5FnxXiQw1qAZMnP
         0n6ol4jSCDbuhX1mAoDi9NOzkbY36z6r7yzQiLHz7kNAZ0yDClRHSloKwGoXC0yDismQ
         M2zrbi5hifTR1mJ9njw4RhgfhkzzblB/WajQjDjniVrCACPEyT3cFTZrjbR3KZ7VtrR7
         BRTu32RxusavDjYox710JkGZPrvOl8+OP2Sjv9dbciHjZ0oMBVAWJL4eXlq7IYD/LD3a
         aGXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690796179; x=1691400979;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XkKvGl98k7jbhJNYp8TOnQKWjAoQngtktIUofwxlKfo=;
        b=ALswxaQBSMBnF2RW/HFcZB2VtgyxbWr3ozj8MxTaZ0n4dKNuqHvS7HRlYPkYaEaf9U
         DsvQuQ93/n4FCScHAHQ1IAMj1x4/pRFh9VBncwuHphl/DRwQ6sSnBOSBu3bxrHc4iobo
         RJ5slBMM8H882e5/Dc3dnHw6cDNYH5z2ayqi6v/S8QUXQxN0DHzw2KtNidOlasxYzyZ0
         zJh1jZKhZWNkPC2UEVq4rpG7uq0xyX/w7d9D9+1oLSPSUCM3QhQ9aMSIJEJ3NZR0l2cT
         y2CUCvtDCQ12zbQGj0ssj/IR5W+IfHywvgqOWONC2hBYZBzF8jV0sneHisvBc94TsFA1
         mgmg==
X-Gm-Message-State: ABy/qLag6K9CDJXD3typHQlcNgnqnwkaYA8RpKzI2ZbyXrIjDxOxXH35
	HNu6z7k6WbCzYdzVPZVQZy45fA==
X-Google-Smtp-Source: APBJJlFv3xeDejloRQWmofRYqg/5DaXOnNw8COfpktIdzpGLXIokOP2CRuYY9URmKYUlruwsQXfaSA==
X-Received: by 2002:a05:6402:296:b0:51e:34d5:a23f with SMTP id l22-20020a056402029600b0051e34d5a23fmr8629301edv.23.1690796178831;
        Mon, 31 Jul 2023 02:36:18 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.183])
        by smtp.gmail.com with ESMTPSA id by30-20020a0564021b1e00b00522d53bff56sm355886edb.65.2023.07.31.02.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 02:36:18 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2] arm64: dts: amlogic: drop redundant status=okay in sound nodes
Date: Mon, 31 Jul 2023 11:36:15 +0200
Message-Id: <20230731093615.148949-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_023620_701555_04BD1F9F 
X-CRM114-Status: UNSURE (   9.76  )
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

status=okay is by default.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Fix all occurrences I could find.
---
 arch/arm64/boot/dts/amlogic/meson-axg-s400.dts                  | 1 -
 arch/arm64/boot/dts/amlogic/meson-g12a-radxa-zero.dts           | 1 -
 arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts               | 1 -
 arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts              | 1 -
 arch/arm64/boot/dts/amlogic/meson-g12b-gsking-x.dts             | 1 -
 arch/arm64/boot/dts/amlogic/meson-g12b-gtking-pro.dts           | 1 -
 arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts               | 1 -
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi           | 1 -
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2l.dts           | 1 -
 arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dts            | 1 -
 arch/arm64/boot/dts/amlogic/meson-gx-libretech-pc.dtsi          | 1 -
 arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi             | 2 --
 arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts            | 1 -
 arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts          | 1 -
 arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts             | 1 -
 arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi            | 1 -
 arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-hub.dts            | 1 -
 arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dts          | 1 -
 arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dts    | 1 -
 arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dts            | 1 -
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts      | 1 -
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc-v2.dts | 1 -
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts    | 1 -
 arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts           | 1 -
 arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts             | 1 -
 arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts              | 1 -
 arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi              | 1 -
 arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air-gbit.dts       | 1 -
 arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air.dts            | 1 -
 arch/arm64/boot/dts/amlogic/meson-sm1-h96-max.dts               | 1 -
 arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi               | 1 -
 arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts                | 1 -
 arch/arm64/boot/dts/amlogic/meson-sm1-x96-air-gbit.dts          | 1 -
 arch/arm64/boot/dts/amlogic/meson-sm1-x96-air.dts               | 1 -
 34 files changed, 35 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
index 359589d1dfa9..df16eead2c80 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
@@ -280,7 +280,6 @@ sound {
 		assigned-clock-rates = <589824000>,
 				       <270950400>,
 				       <393216000>;
-		status = "okay";
 
 		dai-link-0 {
 			sound-dai = <&frddr_a>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-radxa-zero.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-radxa-zero.dts
index cf0a9be83fc4..fcd7e1d8e16f 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-radxa-zero.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-radxa-zero.dts
@@ -145,7 +145,6 @@ sound {
 		assigned-clock-rates = <294912000>,
 				       <270950400>,
 				       <393216000>;
-		status = "okay";
 
 		dai-link-0 {
 			sound-dai = <&frddr_a>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
index 4fb31c2ba31c..0ad0c2b7dfef 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
@@ -209,7 +209,6 @@ sound {
 		assigned-clock-rates = <294912000>,
 				       <270950400>,
 				       <393216000>;
-		status = "okay";
 
 		dai-link-0 {
 			sound-dai = <&frddr_a>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
index b2bb94981838..8237aa1f05e9 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
@@ -166,7 +166,6 @@ sound {
 		assigned-clock-rates = <294912000>,
 				       <270950400>,
 				       <393216000>;
-		status = "okay";
 
 		dai-link-0 {
 			sound-dai = <&frddr_a>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-gsking-x.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-gsking-x.dts
index 1fa6e75abd21..bb73e10b5e74 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-gsking-x.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-gsking-x.dts
@@ -55,7 +55,6 @@ sound {
 		assigned-clock-rates = <294912000>,
 				       <270950400>,
 				       <393216000>;
-		status = "okay";
 
 		dai-link-0 {
 			sound-dai = <&frddr_a>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-gtking-pro.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-gtking-pro.dts
index afe375fa83ca..6eeedd54ab91 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-gtking-pro.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-gtking-pro.dts
@@ -56,7 +56,6 @@ sound {
 		assigned-clock-rates = <294912000>,
 				       <270950400>,
 				       <393216000>;
-		status = "okay";
 
 		dai-link-0 {
 			sound-dai = <&frddr_a>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts
index 5d96c1449050..3e826095e792 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts
@@ -45,7 +45,6 @@ sound {
 		assigned-clock-rates = <294912000>,
 				       <270950400>,
 				       <393216000>;
-		status = "okay";
 
 		dai-link-0 {
 			sound-dai = <&frddr_a>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
index 24d0442dffb2..802b0256f1cb 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
@@ -78,7 +78,6 @@ sound {
 		assigned-clock-rates = <294912000>,
 				       <270950400>,
 				       <393216000>;
-		status = "okay";
 
 		dai-link-0 {
 			sound-dai = <&frddr_a>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2l.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2l.dts
index 70919f40d597..e26f3e3258e1 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2l.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2l.dts
@@ -46,7 +46,6 @@ sound {
 		assigned-clock-rates = <294912000>,
 				       <270950400>,
 				       <393216000>;
-		status = "okay";
 
 		dai-link-0 {
 			sound-dai = <&frddr_a>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dts
index 0c7892600d56..098a3af6d381 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dts
@@ -40,7 +40,6 @@ sound {
 		assigned-clock-rates = <294912000>,
 				       <270950400>,
 				       <393216000>;
-		status = "okay";
 
 		dai-link-0 {
 			sound-dai = <&frddr_a>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gx-libretech-pc.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx-libretech-pc.dtsi
index 4e84ab87cc7d..5e7b9273b062 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx-libretech-pc.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx-libretech-pc.dtsi
@@ -201,7 +201,6 @@ sound {
 		assigned-clock-rates = <294912000>,
 				       <270950400>,
 				       <393216000>;
-		status = "okay";
 
 		dai-link-0 {
 			sound-dai = <&aiu AIU_CPU CPU_I2S_FIFO>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi
index dafc841f7c16..18f7b730289e 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi
@@ -137,8 +137,6 @@ sound {
 		assigned-clock-rates = <294912000>,
 				       <270950400>,
 				       <393216000>;
-		status = "okay";
-
 		dai-link-0 {
 			sound-dai = <&aiu AIU_CPU CPU_I2S_FIFO>;
 		};
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts
index 7d94160f5802..1fd2e56e6b08 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts
@@ -142,7 +142,6 @@ sound {
 		assigned-clock-rates = <294912000>,
 				       <270950400>,
 				       <393216000>;
-		status = "okay";
 
 		dai-link-0 {
 			sound-dai = <&aiu AIU_CPU CPU_I2S_FIFO>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts
index 63137ce3cb9d..4aab1ab705b4 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts
@@ -149,7 +149,6 @@ sound {
 		assigned-clock-rates = <294912000>,
 				       <270950400>,
 				       <393216000>;
-		status = "okay";
 
 		dai-link-0 {
 			sound-dai = <&aiu AIU_CPU CPU_I2S_FIFO>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
index 01356437a077..e6d2de7c45a9 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
@@ -184,7 +184,6 @@ sound {
 		assigned-clock-rates = <294912000>,
 				       <270950400>,
 				       <393216000>;
-		status = "okay";
 
 		dai-link-0 {
 			sound-dai = <&aiu AIU_CPU CPU_I2S_FIFO>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
index 66daf3af34c3..e8303089bff6 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
@@ -116,7 +116,6 @@ sound {
 		assigned-clock-rates = <294912000>,
 				       <270950400>,
 				       <393216000>;
-		status = "okay";
 
 		dai-link-0 {
 			sound-dai = <&aiu AIU_CPU CPU_I2S_FIFO>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-hub.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-hub.dts
index 58733017eda8..af9ea32a2876 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-hub.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-hub.dts
@@ -23,7 +23,6 @@ sound {
 		assigned-clock-rates = <294912000>,
 				       <270950400>,
 				       <393216000>;
-		status = "okay";
 
 		dai-link-0 {
 			sound-dai = <&aiu AIU_CPU CPU_I2S_FIFO>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dts
index 505ffcd8eb76..e1b74b174915 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dts
@@ -56,7 +56,6 @@ sound {
 		assigned-clock-rates = <294912000>,
 				       <270950400>,
 				       <393216000>;
-		status = "okay";
 
 		dai-link-0 {
 			sound-dai = <&aiu AIU_CPU CPU_I2S_FIFO>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dts
index 213a0705ebdc..a29b49f051ae 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dts
@@ -130,7 +130,6 @@ sound {
 		assigned-clock-rates = <294912000>,
 				       <270950400>,
 				       <393216000>;
-		status = "okay";
 
 		dai-link-0 {
 			sound-dai = <&aiu AIU_CPU CPU_I2S_FIFO>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dts
index ff906becd2ab..c0d6eb55100a 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dts
@@ -135,7 +135,6 @@ sound {
 		assigned-clock-rates = <294912000>,
 				       <270950400>,
 				       <393216000>;
-		status = "okay";
 
 		dai-link-0 {
 			sound-dai = <&aiu AIU_CPU CPU_I2S_FIFO>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
index 02f81839d4e3..fea65f20523a 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
@@ -74,7 +74,6 @@ sound {
 		assigned-clock-rates = <294912000>,
 				       <270950400>,
 				       <393216000>;
-		status = "okay";
 
 		dai-link-0 {
 			sound-dai = <&aiu AIU_CPU CPU_I2S_FIFO>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc-v2.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc-v2.dts
index 6c4e68e0e625..2825db91e462 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc-v2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc-v2.dts
@@ -167,7 +167,6 @@ sound {
 		assigned-clock-rates = <294912000>,
 				       <270950400>,
 				       <393216000>;
-		status = "okay";
 
 		dai-link-0 {
 			sound-dai = <&aiu AIU_CPU CPU_I2S_FIFO>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
index 82bfabfbd39c..27093e6ac9e2 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
@@ -149,7 +149,6 @@ sound {
 		assigned-clock-rates = <294912000>,
 				       <270950400>,
 				       <393216000>;
-		status = "okay";
 
 		dai-link-0 {
 			sound-dai = <&aiu AIU_CPU CPU_I2S_FIFO>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
index 74897a154891..860f307494c5 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
@@ -157,7 +157,6 @@ sound {
 		assigned-clock-rates = <294912000>,
 				       <270950400>,
 				       <393216000>;
-		status = "okay";
 
 		dai-link-0 {
 			sound-dai = <&aiu AIU_CPU CPU_I2S_FIFO>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts
index 236c0a144142..7d525bdb0e06 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts
@@ -94,7 +94,6 @@ sound {
 		assigned-clock-rates = <294912000>,
 				       <270950400>,
 				       <393216000>;
-		status = "okay";
 
 		dai-link-0 {
 			sound-dai = <&aiu AIU_CPU CPU_I2S_FIFO>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts
index 50137aafab10..50d49aec41bd 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts
@@ -109,7 +109,6 @@ sound {
 		assigned-clock-rates = <294912000>,
 				       <270950400>,
 				       <393216000>;
-		status = "okay";
 
 		dai-link-0 {
 			sound-dai = <&aiu AIU_CPU CPU_I2S_FIFO>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
index c9705941e4ab..514a6dd4b124 100644
--- a/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
@@ -189,7 +189,6 @@ sound {
 		assigned-clock-rates = <294912000>,
 				       <270950400>,
 				       <393216000>;
-		status = "okay";
 
 		dai-link-0 {
 			sound-dai = <&frddr_a>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air-gbit.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air-gbit.dts
index d1debccdc1c2..7991fafed05c 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air-gbit.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air-gbit.dts
@@ -29,7 +29,6 @@ sound {
 		assigned-clock-rates = <294912000>,
 				       <270950400>,
 				       <393216000>;
-		status = "okay";
 
 		dai-link-0 {
 			sound-dai = <&frddr_a>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air.dts
index c94f2870b78b..6e34fd80ed71 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air.dts
@@ -29,7 +29,6 @@ sound {
 		assigned-clock-rates = <294912000>,
 				       <270950400>,
 				       <393216000>;
-		status = "okay";
 
 		dai-link-0 {
 			sound-dai = <&frddr_a>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-h96-max.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-h96-max.dts
index 0f6660e68e72..85d7e7110596 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-h96-max.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-h96-max.dts
@@ -29,7 +29,6 @@ sound {
 		assigned-clock-rates = <294912000>,
 				       <270950400>,
 				       <393216000>;
-		status = "okay";
 
 		dai-link-0 {
 			sound-dai = <&frddr_a>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
index 2fce44939f45..cdb80e0a7718 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
@@ -181,7 +181,6 @@ sound {
 		assigned-clock-rates = <294912000>,
 				       <270950400>,
 				       <393216000>;
-		status = "okay";
 
 		dai-link-0 {
 			sound-dai = <&frddr_a>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
index 9068a334ea57..cf4f78e6bd21 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
@@ -247,7 +247,6 @@ sound {
 		assigned-clock-rates = <294912000>,
 				       <270950400>,
 				       <393216000>;
-		status = "okay";
 
 		dai-link-0 {
 			sound-dai = <&frddr_a>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-x96-air-gbit.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-x96-air-gbit.dts
index 7e1a74046ba5..fda0630c235b 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-x96-air-gbit.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-x96-air-gbit.dts
@@ -29,7 +29,6 @@ sound {
 		assigned-clock-rates = <294912000>,
 				       <270950400>,
 				       <393216000>;
-		status = "okay";
 
 		dai-link-0 {
 			sound-dai = <&frddr_a>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-x96-air.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-x96-air.dts
index cd93d798f2a3..9ea969255b4f 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-x96-air.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-x96-air.dts
@@ -29,7 +29,6 @@ sound {
 		assigned-clock-rates = <294912000>,
 				       <270950400>,
 				       <393216000>;
-		status = "okay";
 
 		dai-link-0 {
 			sound-dai = <&frddr_a>;
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
