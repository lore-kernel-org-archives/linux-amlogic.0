Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 281BFC982D0
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Sep 2026 21:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d8GI57VjcgpTQtqLqO9r/KYgSVZOLwm9TgczNNDoAx4=; b=It+zhda8ALT09W
	PJ7cOESd6uIGXO8b28Ib8utYyUYpW3YlCMSkrMYVz97YXYr7Q950kYwmfMFrlGO4nwttaJn5QwHfZ
	RCzbcMj5QsLVmKGfFKOIXA/g8az4A7jWWQW1zB+p0AgthlDIERoo8x2dQMYTRW0Zxb361W4qq0qef
	qZCSP8a/JcBkMm4UfTkaEJIlstKdl/qplBboSZRONTm6/9UJy2YVmVBmnDOHajnyaTzRf8jhMHd6x
	Ror2E5XjyEk/5E86XCae3xN7C/766/iBjMpC7Y/gFhGnqidYKAzOTSEY0xzXA8UA4RxN4ZPUy4zjL
	N15uz6Dk/WY2FQM7D8hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7JGa-0000000CWRn-1KoG;
	Thu, 17 Sep 2026 21:03:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7JGY-0000000CWPm-2Xtf
	for linux-amlogic@bombadil.infradead.org;
	Thu, 17 Sep 2026 21:03:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=OrTs8R98RYpxja2qfNL5l+wSlcq0HfU9S2hHFoYZzL8=; b=ZQThzQ9Gm0NS16MSn9vwk+9WSl
	t0OF9fac196muksfp3XrUsLX2GR3ypcfLitx0G8QqNZTNAJIitDQuiGvrKZAu0nQgTMSxzxzI7Yzc
	rK/o0kG7D5Ah2XZ150ViNJQQJE/rVzEtPVCCrdK2PlfbmZtiEzlXm+JnQtnYhzRQ7nshAaDM/knv4
	1Wy03iFtn0v3NB1oAHlDi1Vm6nr65uTeym/BELZ0TiDWhehduXe17uELGF+WoK25ekUp/qfwKZPAU
	a5Zasv8XtGbVv8wacUJyg9qIRC+pW+IKnE9c6dz4TRQDVzh2rVWnZiRSgEDjjrBo5++801Ssq3Qbz
	wzttErRg==;
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x7JFs-00000009GdB-24tU
	for linux-amlogic@lists.infradead.org;
	Thu, 17 Sep 2026 21:03:33 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49b912e2406so366575e9.1
        for <linux-amlogic@lists.infradead.org>; Thu, 17 Sep 2026 14:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789678966; x=1790283766; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OrTs8R98RYpxja2qfNL5l+wSlcq0HfU9S2hHFoYZzL8=;
        b=kXUGaWTM9fdq8Zh4mY0n9lJcdoZvZL5rtfM6EnoWHmkCrNytdpHjfn48p+jrXI/HJj
         a0Zn6xxRaaLjAcehHEXyXts9DQt2R6/aCkGLkUWxTafozeE+kfqb3H8Ub/3rHO5kmXgV
         6dms5tLAH2onVRTRH4RrMLQkoIyiFLe7xDHBkk6q737qpdK14M+jvMP3Can6NZuJu3Gi
         62xnwOk3a7A0d1QFzTxl2HUr7r7MCPyOyJWav32ilXCjgwkj/CBRRybsnCR75Gm1A9Kd
         aHBcreh+Ks31mAAMNYYvZvADMWNzc2LFu+EDLWwIwLRoUKWAAGEB9GdfGwG1vT0Ui3oF
         LaaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789678966; x=1790283766;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OrTs8R98RYpxja2qfNL5l+wSlcq0HfU9S2hHFoYZzL8=;
        b=iijL97jACx7LBWezZADgWda8+Ii/jHYiGvWnakg2bmj9u2v7MCz6ONGHRn6j3Sqikv
         xyHG5jdfE7Yt3sd0WX8fgf28FO/4i2qaUr/iSYPlGwA1/JuU+Jov8LaeuSq5Ng02Z3wA
         GW7DS+pT0D03bkpGmzkeiDmrnZ6lKKIepkdTN62JPGfD8VqMmn6FyDZepmmvz3Qjiz4T
         MbSGaXlq0zTmcFZ5PtipTifOHARrAfBtu3P39pMpNr6+aaupOK0UEtuC0HQshQd+vYWZ
         dMM6lkCoo+cILtKRs9TgtnZwl5iBPj43cgugJcXmIMgHu2zRpPxxpTwqOzci+/6Z8+zC
         kx2g==
X-Forwarded-Encrypted: i=1; AKwUvBwQthneYg9qAnUahNFdduPkfc/jTGxmt0UuXUaBRwk5LogPNCWnoyhmawjCHbqayg+sDODleCwSoxnKg6rk@lists.infradead.org
X-Gm-Message-State: AFuF++lxLKKOmIVw9trAbxAxouWm+hbhpF68LBo56yX7BwOsRmwRIO4e
	bKLCkjjivZ/3CEW8rvDlPxC5B3ILRXFSKjTow+bTDOjcbrdMjb0riqf0mNcAg+Cyhvw=
X-Gm-Gg: AYBFou2teDOWosbBJTjTuVl/9KNE5YSDt113avmZmsTpFfHVMzEpTHJ+SbTNkzoyttC
	ctlVdZ1UFmRHPZn02X9grS8q+Ivnx/QCpyLjova+IvnSaOVYgp68V9U4ZaEfOYBwg5P2Wo7BBRF
	U1Ot5n5Z6KLBtELLG418fv2AYTp2pR5zVxVWOb6Xjqs9mxk1habny/QSgghGoS+QjLvDcIaQ5F9
	/TvDJMDBBtkk8vooE8izW40wee3iW9FoNk7skE0UfYqYFfGk2tWCqCFDZTt0jYHkPNPJ6QridK5
	9nAd9mnC4STn210NU7aTBlxC+Xn97sVfaERSGqHYd3XoUSYGmAbVS7k8W2hNx6HgsC0pbaYpXrQ
	l+Yg7QvDca7NCU/wmXxXYF3Z3p3kE/sViECI8L+Wk9qiuppnEwAeNKEHaxobmv1lhQmukigeGa7
	qZErN5IYhklXyIHoI4cViX6R76Ssyk8OcpG8lDsFkevB643FSyM9EZok5SRkILCQvmCwMmFSfV0
	4Ir
X-Received: by 2002:a05:600c:1d06:b0:49e:8222:3451 with SMTP id 5b1f17b1804b1-49fc5001358mr4202515e9.14.1789678966047;
        Thu, 17 Sep 2026 14:02:46 -0700 (PDT)
Received: from [127.0.1.1] ([151.42.87.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc5755c40sm3106095e9.3.2026.09.17.14.02.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 14:02:45 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Thu, 17 Sep 2026 23:02:36 +0200
Subject: [PATCH v2 6/6] arm64: dts: amlogic: gx: add AUDIN node
MIME-Version: 1.0
Message-Id: <20260917-audin-v2-6-38de4bc1de34@baylibre.com>
References: <20260917-audin-v2-0-38de4bc1de34@baylibre.com>
In-Reply-To: <20260917-audin-v2-0-38de4bc1de34@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Valerio Setti <vsetti@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3080; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=TZWXiYpGe3PgSXyHXeQpQDxriAYLZIkbRgm507qkSqQ=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFlrQvNmvF8unFH9eH6EzySORvUZecWKr2zfpoin7n3IZ
 Pr0cfujjlIWBjEuBlkxRRaW6fd+F5SqPTROOFkAM4eVCWQIAxenAExkUTIjw8en9zJ2svh/+rbU
 ff5ZllW67KenBohvO8zx3b2e5fi9Un6G/9GnGbPtczkErYJuBjNXp/QLT67Xi2s6cP1A6E+3vFf
 OrAA=
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_220311_979122_57DF016C 
X-CRM114-Status: UNSURE (   9.78  )
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

AUDIN provides audio input support to Amlogic Meson GXBB/GXL platforms.

What's missing after this to get capture support working is to connect a
capture capable codec to the SoC. For example to test these changes an
NXP SGTL5000 chip has been connected to an OdroidC2 (Meson GXBB) board
using a custom hat board.

The following additions/overlay are required on top of
'amlogic/meson-gxbb-odroidc2.dts' to make that hat board to work:

    &sound {
            audio-routing = "AUDIN I2S Formatter", "AIU I2S Encoder Capture";

            dai-link-1 {
                    codec-1 {
                            sound-dai = <&sgtl5000>;
                    };
            };

            dai-link-3 {
                    sound-dai = <&audin 0>;
            };
    };

    &audin {
            status = "okay";
    };

Then, from userspace:

    $ amixer sset 'AUDIN FIFO0 SRC SEL' 'I2S'
    $ arecord -l  # find the "FIFO Capture" device
    $ arecord -D hw:0,<N> -f S16_LE -r 48000 -c 2 /tmp/in.wav

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi   | 9 +++++++++
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 6 ++++++
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi  | 6 ++++++
 3 files changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
index c1d8e81d95cb..54b6cc0bb8ff 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -436,6 +436,15 @@ watchdog@98d0 {
 				reg = <0x0 0x098d0 0x0 0x10>;
 				clocks = <&xtal>;
 			};
+
+			audin: audio-controller@a000 {
+				compatible = "amlogic,gx-audin";
+				reg = <0x0 0xa000 0x0 0x148>;
+				interrupts = <GIC_SPI 7 IRQ_TYPE_EDGE_RISING>;
+				sound-name-prefix = "AUDIN";
+				#sound-dai-cells = <1>;
+				status = "disabled";
+			};
 		};
 
 		gic: interrupt-controller@c4301000 {
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
index a9c830a570cc..7ad69992a226 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
@@ -84,6 +84,12 @@ &aiu {
 	resets = <&reset RESET_AIU>;
 };
 
+&audin {
+	compatible = "amlogic,gxbb-audin", "amlogic,gx-audin";
+	clocks = <&clkc CLKID_I2S_SPDIF>;
+	resets = <&reset RESET_AUDIN>;
+};
+
 &aobus {
 	pinctrl_aobus: pinctrl@14 {
 		compatible = "amlogic,meson-gxbb-aobus-pinctrl";
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
index d5e0f72892f8..9181eba81eb7 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
@@ -100,6 +100,12 @@ &aiu {
 	resets = <&reset RESET_AIU>;
 };
 
+&audin {
+	compatible = "amlogic,gxl-audin", "amlogic,gx-audin";
+	clocks = <&clkc CLKID_I2S_SPDIF>;
+	resets = <&reset RESET_AUDIN>;
+};
+
 &apb {
 	usb2_phy0: phy@78000 {
 		compatible = "amlogic,meson-gxl-usb2-phy";

-- 
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
