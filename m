Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 039DBCCF2C9
	for <linux-amlogic@archiver.kernel.org>; Sun, 18 Oct 2026 10:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iXse1XJTZAemaZhnD/683tIPScFLnSz2ULLRpxhJvas=; b=XtnvZB0Jn+kRcV
	xCBo5tE7/ata/N4cPMocjQXXztONYe5Gs3ApqRuDt90HAgF3xjD3IVFU29AwP+Dfj0ECJMA/BVUAy
	ut1bXVv1PB94ck0X6Rgl7AhOCSCOjuNoTwPZvHmYRBzUwjjARBkGkxovKJMTW/jCCMYCZH/ey+Lo9
	vwBM9gQtT0PHhoDMa3Nq9o+2gM7k0wUu7mXk1V1T8vz640T/uSoyRJSrAFz1ntFf+8/NuctavXKLd
	xycyq169Fon8WEVqktDL+zOZJbMowxpGq7HfLrpeDv+YJfWNwf5Sqn1Yws9kUK+hoJ39DwoSBfq7t
	2A55T23h4hUJG88OBp6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xINyw-00000005jzp-3vyg;
	Sun, 18 Oct 2026 10:19:10 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xINyb-00000005jiV-3gpT
	for linux-amlogic@lists.infradead.org;
	Sun, 18 Oct 2026 10:18:53 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-48c5358fc28so959142f8f.0
        for <linux-amlogic@lists.infradead.org>; Sun, 18 Oct 2026 03:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792318728; x=1792923528; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xsXHC8OVQ58Ws2YIlszVdC880xyahIkcilQ/PKtCso0=;
        b=OZwh2l9EtsKF+8BKP0c6pH7R9xSp4UplleL+x49SrkK9zqgDU3pJ0UeGN4LY3MPJol
         gbdq0lwuA1KyA7kfPFFTtgSn7QoLmUxoaUhxbULw1yIHSUzyf3j2As7fqL4T5nA7x33K
         vNzPGnnbwg8civU6Q8SRFXp1DhKo5VPxtLKbsaJJXZJc/h5TbgtRSntpE71Pp8MUm2JZ
         yVHbmVXQWI/ZzawKn064SR88rIbu+1Me152TgItEpfhaG9kYBfjhRc2nc7kkYXm0/xxf
         16JlQIPsJF2QXLFpuCDoPLM1fb5XnZ6Wf1Z9AQ353Jb7yqy5/HVOccUeFwkASUI/Avjh
         0Biw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792318728; x=1792923528;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xsXHC8OVQ58Ws2YIlszVdC880xyahIkcilQ/PKtCso0=;
        b=bj928a9G7yV+n7tCC7bHxl/c18YNpfkMtT9QOgO5Nrnfp0kzaexo+5w8FHTFCIP7Dn
         lJKf2sSvSiqtLUHB9pOK/pKuDs4pVNx9y5qV3vG0g7yEupAv43YXcpwJHw09rzfa0Tp/
         EclAanOzwoTOVCfZXkvCBAxkRL47S2q1o/FWp6R1sktMEYJxa+iLRLPJ1AqNhdGs4jHb
         AW8DUkKHlqUGo5rPDnaKNimEZdKdMlWQKM/vjSGxkrwMkgIFk8Vi+HJECTrIBMQr/2wJ
         nqIF/HqnQZVVMgrl21uceGa6y6uuoLJUZJ/rE9R3atGijN7bpmVT2+USWcaTBiGSgp7e
         wdgg==
X-Forwarded-Encrypted: i=1; AKwUvBwGOBs5geRUjX4mHu/bn3EUQyRRrs3CueIjFHoXg6gZ6fP3wDfzrRu5qcr0h8kydoq4P9JGJiJH3XN8KNQX@lists.infradead.org
X-Gm-Message-State: AFq9FYKSBP1ucKvOHbs8F37A0mitWTo12sOXwxO//gPlVcyehJ+3EFLQ
	0hZMrJuy+Vf0EbqcxVvqIGl4nr1BalBnFzZTQ2Rt1pXCr6AnNuVY05swCXzzvPDbMjo=
X-Gm-Gg: AYBFou3Wilf3TAJi1tKOo87G8z2TI/L7o+vCcvGnoXLMXH2+ynwDjv9g/bzclnb+NFF
	ZImd9E9Ksszeo9yJow6jEP2deNv3mLD9SHb4KOxUa1fVeTU10XjS9C0L/VnD2ig6d3Rz2Gd2XaP
	h5qddYTz0sbvoHbfgbrpOJgNx5ix5GoM4jaa9jhB7ZJpIvTl6vMCHNta072HtDebMravu5slKAh
	uwVfp9ybZJiKgxOTMUfbJGE22F7Xnss65/iRUIgMfSaq1astWx36VqhPIIhs1L5ayr5dSZqQ7XB
	wxjPLebMKIA2/E6miQMDMvRNqanlFQ2vOMlxU7L+jz6yOYerLI91TJUigRkHXthhyThyWG2DL4A
	H6QXAjoFMU0l9VHNjkalFKqAkhZV0H8vSLxzKcAM9Eq6yklqt6BbuFnaN+/t8Rj09NWDeYGzaDd
	U7yiBO4d8e8B2yb+ABcz++NhLD7BdtunmibX5gwdH0Ab/e9IAl1HnFdfyWcwIVT3DeZLNz
X-Received: by 2002:a05:6000:1ac9:b0:48a:f1fb:e165 with SMTP id ffacd0b85a97d-48e07f98f93mr8926555f8f.21.1792318727874;
        Sun, 18 Oct 2026 03:18:47 -0700 (PDT)
Received: from [127.0.1.1] ([37.103.126.255])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4d4978sm14911507f8f.21.2026.10.18.03.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 03:18:47 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Sun, 18 Oct 2026 12:18:04 +0200
Subject: [PATCH v5 7/7] arm64: dts: amlogic: gx: add AUDIN node
MIME-Version: 1.0
Message-Id: <20261018-audin-v5-7-4b8cc13a1b22@baylibre.com>
References: <20261018-audin-v5-0-4b8cc13a1b22@baylibre.com>
In-Reply-To: <20261018-audin-v5-0-4b8cc13a1b22@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3059; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=BTkEujrtoKKaX+uvUffHfwFOsZT0LAV0Uau20Y5fzNw=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFlX5vxZs/znn10vTz1aVGtx7rD7yobH01tLBeL+LxKb0
 6M7vXTe6o5SFgYxLgZZMUUWlun3fheUqj00TjhZADOHlQlkCAMXpwBMRPU1w/+ord/1ttfu4qzv
 r311//sN2QCOWYkLT8wy6a1qU/m1zn0yI8O36bNiixwvHVhRL5ybXfGIl2HrQicZw0uCrMsfnNG
 4eIwbAA==
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_031849_962843_C1A2B067 
X-CRM114-Status: UNSURE (   9.97  )
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

AUDIN provides audio input support to Amlogic GXBB/GXL SoCs.

What's missing after this to get capture support working is to connect a
capture capable codec to the SoC. For example to test these changes an
NXP SGTL5000 chip has been connected to an OdroidC2 (GXBB) board using a
custom hat board.

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

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi   | 9 +++++++++
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 5 +++++
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi  | 6 ++++++
 3 files changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
index c1d8e81d95cb..2b92a99ab2cb 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -436,6 +436,15 @@ watchdog@98d0 {
 				reg = <0x0 0x098d0 0x0 0x10>;
 				clocks = <&xtal>;
 			};
+
+			audin: audio-controller@a000 {
+				compatible = "amlogic,gxbb-audin";
+				reg = <0x0 0xa000 0x0 0x148>;
+				interrupts = <GIC_SPI 7 IRQ_TYPE_EDGE_RISING>;
+				sound-name-prefix = "AUDIN";
+				#sound-dai-cells = <1>;
+				status = "disabled";
+			};
 		};
 
 		gic: interrupt-controller@c4301000 {
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
index a9c830a570cc..8f3c7ca06a3c 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
@@ -84,6 +84,11 @@ &aiu {
 	resets = <&reset RESET_AIU>;
 };
 
+&audin {
+	clocks = <&clkc CLKID_I2S_SPDIF>;
+	resets = <&reset RESET_AUDIN>;
+};
+
 &aobus {
 	pinctrl_aobus: pinctrl@14 {
 		compatible = "amlogic,meson-gxbb-aobus-pinctrl";
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
index d5e0f72892f8..de213c0b63a3 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
@@ -100,6 +100,12 @@ &aiu {
 	resets = <&reset RESET_AIU>;
 };
 
+&audin {
+	compatible = "amlogic,gxl-audin", "amlogic,gxbb-audin";
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
