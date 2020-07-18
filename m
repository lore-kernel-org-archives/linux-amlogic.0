Return-Path: <SRS0=xEby=A5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0FBFC433EC
	for <linux-amlogic@archiver.kernel.org>; Sat, 18 Jul 2020 07:25:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ADAA82074B
	for <linux-amlogic@archiver.kernel.org>; Sat, 18 Jul 2020 07:25:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kv124GHl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ke+wmC2/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ADAA82074B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5BN/b/cOSih4qfoVE0iD65zdciyTUGG4QgB/+6D+0B0=; b=kv124GHlt+lf/0bFfaLTZcUlt3
	3uIUkZ8tEwJNmfd8mSWVMuMXJTBjpQSeEeiJboKXLEPqRYOVfL62G94yTkOp3xGy7cjkn3h9PyxK5
	hw1X0VWoP2Yima3McCU6Q1+qLbIb3RJoFyxDgeavauKKVaQkCpSH/JRITzHSysi068yZIabaKQxzh
	KhaXCMuPFcCRvNKpOaoPU3ybnTVO5tKOCpCvXcGXfwRPTEKppf7dXlfEWrKNanbPNcMWhUSWsI6J7
	hsaDzJRr9PSHAI2Se8fvpwqKjeaJMdRHj/WfstriaI2E8Q/wZAPj6lngqpQmqVowjCNBvKdLCyw1L
	ORZQsTEA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jwhEF-00077z-3u; Sat, 18 Jul 2020 07:25:51 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jwhE5-00075C-SN; Sat, 18 Jul 2020 07:25:43 +0000
Received: by mail-wm1-x341.google.com with SMTP id l2so20565301wmf.0;
 Sat, 18 Jul 2020 00:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=keAVpGfsQcEDqnbHUMyN/ynnpJsp1LvUpjA6RoHC1Co=;
 b=Ke+wmC2/T6ELScDbLkHP0eIT7W6dGZGXFAgyiQ/tHK+3jjRYLPqVh9oVmc1nhbz1to
 t2Gt2E6s2AHP/wcmbsvvCuinTIs2EzumrzEYS7Gb+OTqR8sWS7BTh99PJ79znsf2f129
 TsmhbcN+xnGHHJOrW6POeg3eR1xrYLIrGwg737I0ssgn2aPxXvJjg8+t6rwvxOJA+uRE
 eCbsaJ/ZvqCyt7YULkfoZFfKJwFGQuTmnL7lN+/3QqS67IPYXl+62/HX9GeOw9reGJ5i
 TbsA2uAEqBgKKsNFEGgKkgYAFIalYrwLXZgcGtFwFqzg5ZNt+wjkpfIGJNq29/x0SPho
 YA9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=keAVpGfsQcEDqnbHUMyN/ynnpJsp1LvUpjA6RoHC1Co=;
 b=Dl5cfeDGTz89MF3507ZDxzIqHEW9ZbImyRW1H0Kvfkuw3zpCL0QYmSrnxJ+Wr9oEta
 2JeMUE0e9e8LujnuCs+GkByTzJ+vXns8G4Zff/u/lfZcbywdPcLDZHEbOOzdhRdz1cwQ
 zCNhxPZ5vJk9wvoeRfRXtSi7jr7+akLzrggolE1qbZ225zdxOwUNEh9tXsQjAbktTigp
 ard+roHAjwnv9PfCyxaD/jlA2LXpSsZiLf+ivE6Cbo2Fss/MV8IYjdWnI1QM1AfWAe4S
 WPZqEW4+PCRF3DeD8O714cmbZMzHtcgtL2hVmBkCHJyUiBiytNm8B6E6jjMMrK6Qqmzc
 RG0w==
X-Gm-Message-State: AOAM532lrzJsCmbwmu7at0gTaPqT7aLjO5ocZgxnj9xk1rVV9NG/s8Gf
 wMjR1hOkp6b9JUu06F9ZrmI=
X-Google-Smtp-Source: ABdhPJwRIuNiryqRIXEdnd8PCtYBUxhPz4wLgti+0y9CRAHUV42vcSY23IDGC39u1ZoKBGL9EYxFUQ==
X-Received: by 2002:a1c:4b09:: with SMTP id y9mr13033409wma.46.1595057140962; 
 Sat, 18 Jul 2020 00:25:40 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id c7sm19550192wrq.58.2020.07.18.00.25.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Jul 2020 00:25:40 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: meson: add audio playback to khadas-vim3l
Date: Sat, 18 Jul 2020 07:25:32 +0000
Message-Id: <20200718072532.8427-3-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200718072532.8427-1-christianshewitt@gmail.com>
References: <20200718072532.8427-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200718_032541_991554_9842E2A4 
X-CRM114-Status: GOOD (  12.19  )
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

Add initial audio support limited to HDMI i2s, copying the config
from the existing VIM3 device-tree.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 .../dts/amlogic/meson-sm1-khadas-vim3l.dts    | 88 +++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts
index dbbf29a0dbf6..b104967dbef1 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts
@@ -8,6 +8,7 @@
 
 #include "meson-sm1.dtsi"
 #include "meson-khadas-vim3.dtsi"
+#include <dt-bindings/sound/meson-g12a-tohdmitx.h>
 
 / {
 	compatible = "khadas,vim3l", "amlogic,sm1";
@@ -31,6 +32,69 @@
 		regulator-boot-on;
 		regulator-always-on;
 	};
+
+	sound {
+		compatible = "amlogic,axg-sound-card";
+		model = "SM1-KHADAS-VIM3L";
+		audio-aux-devs = <&tdmout_a>;
+		audio-routing = "TDMOUT_A IN 0", "FRDDR_A OUT 0",
+				"TDMOUT_A IN 1", "FRDDR_B OUT 0",
+				"TDMOUT_A IN 2", "FRDDR_C OUT 0",
+				"TDM_A Playback", "TDMOUT_A OUT";
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
+			sound-dai = <&tdmif_a>;
+			dai-format = "i2s";
+			dai-tdm-slot-tx-mask-0 = <1 1>;
+			dai-tdm-slot-tx-mask-1 = <1 1>;
+			dai-tdm-slot-tx-mask-2 = <1 1>;
+			dai-tdm-slot-tx-mask-3 = <1 1>;
+			mclk-fs = <256>;
+
+			codec {
+				sound-dai = <&tohdmitx TOHDMITX_I2S_IN_A>;
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
+&arb {
+	status = "okay";
+};
+
+&clkc_audio {
+	status = "okay";
 };
 
 &cpu0 {
@@ -61,6 +125,18 @@
 	clock-latency = <50000>;
 };
 
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
 &pwm_AO_cd {
 	pinctrl-0 = <&pwm_ao_d_e_pins>;
 	pinctrl-names = "default";
@@ -93,3 +169,15 @@
 	phy-names = "usb2-phy0", "usb2-phy1";
 };
  */
+
+&tdmif_a {
+	status = "okay";
+};
+
+&tdmout_a {
+	status = "okay";
+};
+
+&tohdmitx {
+	status = "okay";
+};
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
