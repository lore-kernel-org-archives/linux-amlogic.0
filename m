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
	by smtp.lore.kernel.org (Postfix) with ESMTP id E81D1C433EB
	for <linux-amlogic@archiver.kernel.org>; Sat, 18 Jul 2020 07:25:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B97B92074B
	for <linux-amlogic@archiver.kernel.org>; Sat, 18 Jul 2020 07:25:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="opAkvPNm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="osXXqc2/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B97B92074B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PE2TMngjc6raj7A3y/sSqcz5YTVUXrKqhDtdsH46/MI=; b=opAkvPNmVdTA01xPLm/+ZYbxQD
	oDaVO/0dmOzGVQeIrDeLROfLLadi/9laCFwpb4V4ZDttimtHC7m358VLTHORzNJya3UawhwVU4/0I
	2vEvRUHC8PuTKxqIsm2C++PFUxmQ0QjwQo3XlzWQXBJdYGOLn4d27iujlyINcrpb0NilFrX9BQJ4Q
	+gsY50keLG0d5CUdnUPqGtYvt2dH1XMpEtEsKGeORiYEYmMKReYvjGrG9mgOOeNbSafuro9svCl7s
	H6K9p0CKocbLRlzZwv3NIW3zGNoi1jj/LswWQn3hXL5mxpqyCERHAubY1HCqVAU4NS/1MnL27wISB
	39LaT1MA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jwhEA-00076O-O8; Sat, 18 Jul 2020 07:25:46 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jwhE3-00074D-Oa; Sat, 18 Jul 2020 07:25:40 +0000
Received: by mail-wm1-x341.google.com with SMTP id q15so17791873wmj.2;
 Sat, 18 Jul 2020 00:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=a0raR8kuawAw4Zwd1EY7iQ1XE5SS8HIOS1kFKtesceU=;
 b=osXXqc2/JMbxEZ8YQ66p//TaQKMxArFfVN9KBSLB+qBwhJf6oEYVzvJN7oiZBsSkUm
 3OxN7PXwnU19KmOmGYtda/bmnBycBbyth+YKiRctCk7HJ1fpFcEsoQ45WpNF+SYfQHId
 1M7uc3uNwehl25pm+3SPkLeVVJVnqsY3R01Bo0sELxDeXwOzuT2N8TltSix/9BwS/T8D
 +vBDNMcbwHmA5enOCYqFI3l7XjidAgUqzVcQZumcRI4nOMYFp8UxeNw9fcRFhkpgrTQL
 fHYuNnZBY7o4Cxs7y/Xdrn/8tJcMX6kMY5uTYBt/zYlq6Dvf2013q1FQl17eQAuldlfA
 uBVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=a0raR8kuawAw4Zwd1EY7iQ1XE5SS8HIOS1kFKtesceU=;
 b=aN5EF4xdK+Ppc/b0Fknp6grTsE8hvQUPmNAFJqzd666aJ7PZa+ACXivnqj73uGrY0u
 JYbqrItJGfo7sYgpLW0L0cWbidgY4CrSgagBXTgAagzu1yfJBU+n4RVE7vdW55sQGFwC
 mXaryRbLLsxu2mEFdOqIOKytb64olViG1wbKOdxT0uRDIFJ/IQI2qEpkTAauBj26wG97
 ptumk6hgKBaoRPoKeOhvMcRwlusQe9Z56/UJFenA6URi+8G4yqbUzR6cLvUpHMUIYN2O
 dru3OUcPl7SXcEQLxn/4c5JFAVotFZb+Jhs5MzfZRST876/BSleZiciC/b98L/VFuMb2
 P6oA==
X-Gm-Message-State: AOAM533nwovHawtfeqZJDwGpRn+YnsQPBH/3Kgyd8Gnlv0U0ZaHG6afZ
 On1IsVes4Drp5mhjwYtoCYo=
X-Google-Smtp-Source: ABdhPJxXJyJmP8Z5mILVzyKSOieQ5aqjprunD2SgBsMnxhd4PVg/62w+pERres4AaKLLNX7LdKTE6A==
X-Received: by 2002:a05:600c:2116:: with SMTP id
 u22mr12425037wml.82.1595057138822; 
 Sat, 18 Jul 2020 00:25:38 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id c7sm19550192wrq.58.2020.07.18.00.25.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Jul 2020 00:25:38 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: meson: add audio playback to odroid-c4
Date: Sat, 18 Jul 2020 07:25:31 +0000
Message-Id: <20200718072532.8427-2-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200718072532.8427-1-christianshewitt@gmail.com>
References: <20200718072532.8427-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200718_032539_847382_37D02035 
X-CRM114-Status: GOOD (  11.95  )
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
 .../boot/dts/amlogic/meson-sm1-odroid-c4.dts  | 88 +++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts
index 00d90b30f8b4..cf5a98f0e47c 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts
@@ -8,6 +8,7 @@
 #include "meson-sm1.dtsi"
 #include <dt-bindings/gpio/meson-g12a-gpio.h>
 #include <dt-bindings/leds/common.h>
+#include <dt-bindings/sound/meson-g12a-tohdmitx.h>
 
 / {
 	compatible = "hardkernel,odroid-c4", "amlogic,sm1";
@@ -186,6 +187,69 @@
 			};
 		};
 	};
+
+	sound {
+		compatible = "amlogic,axg-sound-card";
+		model = "SM1-ODROID-C4";
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
+};
+
+&clkc_audio {
+	status = "okay";
 };
 
 &cpu0 {
@@ -237,6 +301,18 @@
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
 	gpio-line-names =
 		/* GPIOZ */
@@ -381,6 +457,18 @@
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
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
