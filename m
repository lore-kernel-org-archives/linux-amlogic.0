Return-Path: <SRS0=3iKr=57=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FD3FC2BA19
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Apr 2020 10:23:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42D2220775
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Apr 2020 10:23:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qHo+9lQ7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="u0aNUsA/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42D2220775
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=QdUwHmSi100LRXMfYE4rn6ygop7fIpvShOQCGLZ+s64=; b=qHo
	+9lQ7e+MW1l8X+KkakbvcEU0EICuS8ocajVxGBTPdvObM3WuAEKb8IIZCeBaorlRW5Bkg/8okvlwd
	qsVLSqCWeweVBz+AzkBQwXvsfwPo7ywIs+y6yhK0l+sY75fbUp6YZo3aOjsRtpa608ZCwlIYlLQ4q
	gdmX2rJuqx8vZCr9esn7uSY7qNNNHHEHMjBBBb3xW2uX1+psu+IA4RtlhUQnmyiXtnJ42OpRDueN/
	dj0SRmCdAt6ITxLZewweFAE3uaqZl12FfmGWVB/tQDKY0UciVLpvlTPdC+GiZNgg//DcQVzqa7KNM
	gyZOmEdViy9i9+4nOkzN/WXGronmKNg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jOfCy-00033n-2E; Wed, 15 Apr 2020 10:23:52 +0000
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOfCZ-0002vc-5L; Wed, 15 Apr 2020 10:23:29 +0000
Received: by mail-lf1-x144.google.com with SMTP id r17so2221030lff.2;
 Wed, 15 Apr 2020 03:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=jKeaCgFpnmK28M7xOrZHtgGEs75wSDfctsMr7/8EUQ4=;
 b=u0aNUsA/ajvK6mw+4oTArTjesmheWK9IOjPXwcTInScU0ziIdquqPvAoRZ7JWHtU3e
 azgL3J3mFyNQ45f8l01s2gr+SSy3qihJSborjmg4ASd2rSEMBbhq0/ELiC+24ngeR37Z
 QOOOJn6nml0YT4MCSCwiFivQdSppsMUYq4y3blVHh9Vdtd4vgzVEAdm+DZnZ4EqT8mZC
 qEwXBMqVmVuBQeOkxPUkeg+I3OXA7KgWg1mHwKplqBn1diR32MgW/e2JzccROABQ6H5h
 5kcu1b0A0piOrKPAnsFZD9qUeMfzuMRVoUEJiC6TlLbm6ENviT5U66hzt5bR4JngrtJL
 91Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=jKeaCgFpnmK28M7xOrZHtgGEs75wSDfctsMr7/8EUQ4=;
 b=irH52M4ej6mbks1wwrk2vh7k6P3yjoq16fMb9PCGiEU6q++FliKqoFAYtK1lilTE5/
 E7uJvDVe7bn3QyrPKdHie8BADPhlYlZeXFEX0aMkx1afKJOppiNB/8Dc45MchmDv3EcT
 7huVDNnSXl0Dj5B0mDagwbcpE8xz0b5cpd52deJYtbTg171/QTjz12Bg8WSlVVmQe2yr
 CopbIjxSQOIUejsak5m/TZ4ab1fIEChigoqz6rThtrQXPfr+uvSg5z6EbZ58Nozmm0te
 o3FDiUBj84om7/DiASjYkfs4K1tVKroTNbI6bjhgGdTKRpzhZtikFDlEnk3YHhYRJhlq
 oxug==
X-Gm-Message-State: AGi0PuY27b3DuzYksZhVqc46jAcrb6LmwjNnKgJVZ9WPoeMVVc16+/20
 vJnpPzEznpJF/LY3P/mvRu4=
X-Google-Smtp-Source: APiQypINp9dsLX1m+G4LnnN392ZDggMCz6RWVuPhP53iuSY5f9+1hGDl1lDNmn3boXKr/63qJ5pMqg==
X-Received: by 2002:a19:c8cf:: with SMTP id y198mr2545251lff.197.1586946205638; 
 Wed, 15 Apr 2020 03:23:25 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id x23sm12442810lfe.51.2020.04.15.03.23.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Apr 2020 03:23:24 -0700 (PDT)
From: chewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: meson: sm1-khadas-vim3l: add audio playback to
 vim3l
Date: Wed, 15 Apr 2020 10:23:20 +0000
Message-Id: <20200415102320.4606-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200415_032328_229979_7E25B8C3 
X-CRM114-Status: GOOD (  10.78  )
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

From: Christian Hewitt <christianshewitt@gmail.com>

Add the sound and related audio nodes to the VIM3L board.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 .../dts/amlogic/meson-sm1-khadas-vim3l.dts    | 88 +++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts
index dbbf29a0dbf6..b900a433ef7a 100644
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
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
