Return-Path: <SRS0=5QiQ=UK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75AC6C4321A
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 Jun 2019 14:31:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 479F8206BB
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 Jun 2019 14:31:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kBBci1xD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="H1Rp4asA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 479F8206BB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=05iDWEEsWYybH66s+n6IMd5pdxbZIdHsNrcqEuPSxPs=; b=kBBci1xDA9SM58
	UeVXigJFhDZvOTZGqYcYKNU80+y3EfVBu6XzVmEhYL73Rz6wnabOAFGy+4IVUxvCZli3YLKvUqlrN
	WQORg6H4AZ4hIlOhxvWGkGCekHho3idk5nLw0Sffmh9vL2rxGjqQ3Cmq+dv2YOhmrsvPH0aSbtZbp
	Rt+gVZGQE8SKNmbQ1ae+sqFSgpEpUzfCLLqP3WbzUyzzhcESg2mahHuEW+O7XrPFL01z1iR0UnRNX
	u++CRS/B/1zJqcKjE0FV7dvL0Mnoc296xyihXzEF51JWm8QF6K4fg88MAE1odSE7KbLFU90vxZ0RF
	s+RgOm1STiyZhfutZLcA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1haho7-00076V-Iy; Tue, 11 Jun 2019 14:31:27 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1haho4-0006xf-Oa
 for linux-amlogic@lists.infradead.org; Tue, 11 Jun 2019 14:31:26 +0000
Received: by mail-wm1-x344.google.com with SMTP id c66so3219040wmf.0
 for <linux-amlogic@lists.infradead.org>; Tue, 11 Jun 2019 07:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=I+b0ODQnts8tdntKoRjN83DkfLZxsjTT5tP4ANFK0k4=;
 b=H1Rp4asAc/hZnrIK3cSDkXVRv+QZjJckPEeF2q/uTMemu80KOX67ebHjCifYvVvnHK
 qlpRK/E+rZUqmXitAbYXycopEbSc1T02FYsVbUdbaCJeqXKwM1IGM8EaWjmVe6eGuBDC
 xooTOTX4XsptGZOm9gumVueKn7ZlQ44b2Q9Lemy51VObASpSRRyaP76mHUBSDzjvYVtl
 6l/XuxLLT1FfuXmrWk6UEIcFg5MeCHSJjE/AcvtvhPdyDdsL5YbiNO9PLJCmv526UZIZ
 2DtX3zCDbQAhrA5gD8F+xvVHvWv9iynL4BmgoEId1oJZispnKUNwCoFd+uFFavMjuqE5
 LnHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=I+b0ODQnts8tdntKoRjN83DkfLZxsjTT5tP4ANFK0k4=;
 b=X8hlYgAmXkzcvNfY4OXzzvjwAOS4WuPR5H97XVjQh/j9TUOkEQgY1v3uRZW82tVZP0
 Cvs/j89/w6FOSPiQ6OroNWAAJJTVPP3M7ppIfhKiMivQ6MiUeW1QJemQBEWJKfRk3+cJ
 m5RQSgB/aV+XpqFJ8kRTHgZWghfY1t1CuGWOHw8MwILxnwIX2ixmRQL/9TozHXpBRP6+
 1+10t3pYCYzggh90WYxGCCgX6xpbhU8UBb1lZ49oUIeJHV8J5OGDn18eAlTThZycUqNC
 /xLd3oPK/uQK9qMCNyFz+sV8Q2Xswk8M6YbTSkt/CjDZadS9rYzHGu2cRUWqxLZDD/mK
 17lg==
X-Gm-Message-State: APjAAAVHXjkk8kA5s0GsViJh5AxUokaE2XxQy1U4UR/frFaSSPXq5qRF
 QElcgGiexO1MjgTbla6+vpY+Sw==
X-Google-Smtp-Source: APXvYqx5tAOnKxTMOzMeeFvPPj0lnS6ngD12iizSOqlCEd/5eXH8GUPWfzhko832DOcAeL8z5bH+xg==
X-Received: by 2002:a1c:67c2:: with SMTP id b185mr17212929wmc.98.1560263482948; 
 Tue, 11 Jun 2019 07:31:22 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id w14sm13427258wrk.44.2019.06.11.07.31.22
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 11 Jun 2019 07:31:22 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com,
	jbrunet@baylibre.com
Subject: [PATCH] arm64: dts: meson-g12b-odroid-n2: add sound card
Date: Tue, 11 Jun 2019 16:31:20 +0200
Message-Id: <20190611143120.25074-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190611_073124_843588_8FDD74F1 
X-CRM114-Status: GOOD (  11.57  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Enable the sound card on the Hardkernel Odroid-N2, enabling HDMI output
using the TDM interface B, being aligned on other boards sound cards.

The internal DAC connected to the audio jack will be added later on, when
driver support is added.

Tested by running:
tinymix set "FRDDR_A SRC 1 EN Switch" 1
tinymix set "FRDDR_A SINK 1 SEL" "OUT 1"
tinymix set "FRDDR_B SRC 1 EN Switch" 1
tinymix set "FRDDR_B SINK 1 SEL" "OUT 1"
tinymix set "FRDDR_C SRC 1 EN Switch" 1
tinymix set "FRDDR_C SINK 1 SEL" "OUT 1"
tinymix set "TOHDMITX I2S SRC" "I2S B"
tinymix set "TOHDMITX Switch" 1

then:
tinymix set "TDMOUT_B SRC SEL" "IN 0"
speaker-test -Dhw:0,0 -c2

then:
tinymix set "TDMOUT_B SRC SEL" "IN 1"
speaker-test -Dhw:0,1 -c2

then:
tinymix set "TDMOUT_B SRC SEL" "IN 2"
speaker-test -Dhw:0,2 -c2

testing HDMI audio output from the all 3 ASoC playback interfaces.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../boot/dts/amlogic/meson-g12b-odroid-n2.dts | 88 +++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
index 4146cd84989c..c3e0735e6d9f 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
@@ -9,6 +9,7 @@
 #include "meson-g12b.dtsi"
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/gpio/meson-g12a-gpio.h>
+#include <dt-bindings/sound/meson-g12a-tohdmitx.h>
 
 / {
 	compatible = "hardkernel,odroid-n2", "amlogic,g12b";
@@ -165,6 +166,65 @@
 			};
 		};
 	};
+
+	sound {
+		compatible = "amlogic,axg-sound-card";
+		model = "G12A-ODROIDN2";
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
+&arb {
+	status = "okay";
 };
 
 &cec_AO {
@@ -181,6 +241,10 @@
 	hdmi-phandle = <&hdmi_tx>;
 };
 
+&clkc_audio {
+	status = "okay";
+};
+
 &ext_mdio {
 	external_phy: ethernet-phy@0 {
 		/* Realtek RTL8211F (0x001cc916) */	
@@ -198,6 +262,18 @@
 	amlogic,tx-delay-ns = <2>;
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
 &gpio {
 	/*
 	 * WARNING: The USB Hub on the Odroid-N2 needs a reset signal
@@ -269,6 +345,18 @@
 	vqmmc-supply = <&flash_1v8>;
 };
 
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
+
 &uart_AO {
 	status = "okay";
 	pinctrl-0 = <&uart_ao_a_pins>;
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
