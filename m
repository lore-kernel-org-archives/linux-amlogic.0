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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 654EDC433DF
	for <linux-amlogic@archiver.kernel.org>; Sun, 19 Jul 2020 02:46:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3640020738
	for <linux-amlogic@archiver.kernel.org>; Sun, 19 Jul 2020 02:46:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iR9ulU0+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GB/p6r90"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3640020738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5BN/b/cOSih4qfoVE0iD65zdciyTUGG4QgB/+6D+0B0=; b=iR9ulU0+QVrtEJXu+mTThTi1bc
	nZAeErTbscBWMXq8ChSuubp6SAwPLOLmpY/mmSUbe1jIQjs4ESEAuDOECJ2llEq2NGXq5xN/SBRaN
	zR4TC1NF6uGvK240QJZwdNgR9eTp8Du1ratoioyAdT43ud0sdwy7ZYSST4gZ6xrTOg4grGC2deMEQ
	SrK5OcWOVfx3FOG47nhJcnfC7OWsSjEQ/er5iSc+tPDXXV9uLhiWMp2NK0syTs+RtO/nFu5O2p2bQ
	lP3QcZgT4ScJtc/0y2t9fnXrL2Osfc2SeUzqmmTg/s4z/1YyNlYV1UwqrDUt3yHzWZ2+ZLRhEpnos
	3NZ6h1oQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jwzLB-0003Az-5R; Sun, 19 Jul 2020 02:46:13 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jwzKw-00037k-Fk; Sun, 19 Jul 2020 02:45:59 +0000
Received: by mail-wr1-x441.google.com with SMTP id z2so14686199wrp.2;
 Sat, 18 Jul 2020 19:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=keAVpGfsQcEDqnbHUMyN/ynnpJsp1LvUpjA6RoHC1Co=;
 b=GB/p6r90sAJgHXEEV7QpiFlvwmXSlJw0OtYyzSJPZyId1OjKBkqkcuPl3AbyVGLoyW
 EXsP2Tk+VC/iF9bMG2rZUpYN/90XpHhDelJwE+sM4i+zGpnQwP9SqpiOZuphXNHoXOAP
 OQS5VY1Kvw6xCaeGBFWPzBN0v3cONA30DLx14y5qkQOuCTnMvTrYwv9F7mjm952WDLUX
 kfXCm+7xaIzHVJO8t3lI2vnn+PwkZGxCGSWAasQvvo8gtd7ToEY3OPvVSAT+zPPNUsXw
 O+yrRHVsAUKFBvz0ExVv56wEHfOiJ6KMyL51vkfonxXqC35hMdghD91eO8N0xB0/sE/S
 oYMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=keAVpGfsQcEDqnbHUMyN/ynnpJsp1LvUpjA6RoHC1Co=;
 b=ksTEmnhcMxTy/bgW+67DNPHx23vEA0nN+flYvDR0U0POEF/HdmPtX1VO/H61JIH8kF
 Hg9B5HZs5DdcwbW6JYLonrwYzu9DyrvU/MTeZDc95tQJRku8UP8A6fS9DMJ1QN2yGqVb
 6I5EO/W11dW5/pGQkFTTNoHDp4BsFWrwPOAK5Suvf5L/96f4vhxpJ3Vpc48L7qc5kp+P
 wNepmHQJkFVwXf3Po0ZwAzQfPPhpRU5emX3lOOIxn+j2gPRGIBB9Gm5Ezp45OrfeUjvV
 c4ke29E9F6z0v64m+HtNz/mbr8SssYC71VydhIh04NsnO6cVfVd4QH+lORLeu3eh8zzG
 1fDg==
X-Gm-Message-State: AOAM530tk1X1g7Rg0aI/Za0W7wUrWQawYHaZP/RIwJRKBOl6tMVVq9Kv
 hsuVKiD6YSyeIR8O4VMBEXrOrSO8
X-Google-Smtp-Source: ABdhPJyaMEwSnwK/6OKFvL9g3D3y1T1zk4zp3fsUqT9d20r+5NvIMPQk1HfZLkXziE0Qtwmm/ttVdw==
X-Received: by 2002:a5d:5647:: with SMTP id j7mr16036425wrw.242.1595126757149; 
 Sat, 18 Jul 2020 19:45:57 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id e5sm5176242wrc.37.2020.07.18.19.45.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Jul 2020 19:45:56 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] arm64: dts: meson: add audio playback to khadas-vim3l
Date: Sun, 19 Jul 2020 02:45:47 +0000
Message-Id: <20200719024548.8940-3-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200719024548.8940-1-christianshewitt@gmail.com>
References: <20200719024548.8940-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200718_224558_627187_809A39DF 
X-CRM114-Status: GOOD (  12.76  )
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
