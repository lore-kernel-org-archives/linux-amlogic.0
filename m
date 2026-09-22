Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3FA9C9830B
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Sep 2026 16:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d8GI57VjcgpTQtqLqO9r/KYgSVZOLwm9TgczNNDoAx4=; b=rA+37b9LpCK4s0
	DgOB7PqUU3Js3eztHZ3RROO5YfHOj3vsHgvCDp1h1wlfJYVWeYxcOVt9FUW0cIIWuhgHl0tr+NsKk
	0wx8hD135WhkGTDu6cB/Cyx3vxaBzc2ECuAevhtAyjiHm2caoPYWWjub9gfbmDcVCbZRTGzK8MprJ
	8HXTt4PdNLg09Pdz+2eAazOVcoUmpKKJ6AeOoM3pQrvl0/+JGYkCRNw6DZF4ZvzM5v9QcrMHnXosD
	om20XQybS3ONM3+8aqIKqMjo2fKgppNI/eiEHklWp9kvkcnpB2Igyf+G3rvQYJANZJZzt/AMc16or
	VTkDlDv1/UXHs9G1sUoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x92wO-00000005yhE-0woK;
	Tue, 22 Sep 2026 16:01:56 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x92w7-00000005yYf-3r9d
	for linux-amlogic@lists.infradead.org;
	Tue, 22 Sep 2026 16:01:41 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49cd4ba9f68so57835705e9.1
        for <linux-amlogic@lists.infradead.org>; Tue, 22 Sep 2026 09:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790092898; x=1790697698; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OrTs8R98RYpxja2qfNL5l+wSlcq0HfU9S2hHFoYZzL8=;
        b=h/bCMJ1hAxbl/X6hL4a18uqwDOLjk5uvZzAK4PmT8VXa/ghymmBNdGBj3K74oTrLbF
         DL27WIjTbF8EV7bdp8ngc1zaRcHmt8f7n1RovS0i6gMsQt9t/GHMGhJVKaT8cGybSRls
         4fmfzOMuDaocCBoTck+kMq54TDtqWgqPm3a2BfyXlV/fsLM9VeMAvd1hmSlW670W67L+
         K1cpqRlTBOy+A1OCTxZ62R40xFVTwdgd1DVKhgPcYiem5ng9R7R2u2vwgiw5Rn5Zmrgm
         FeiXBosMSIlU+EqYd88pBJBrkG9Zh6BTCUmp3RbNsMrR4G4ukPgF9SOcoq9HyQRHSadl
         HudA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790092898; x=1790697698;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OrTs8R98RYpxja2qfNL5l+wSlcq0HfU9S2hHFoYZzL8=;
        b=cC/E99HjAIxPrgzVMBb5Ln9eNIP6bAoWA/DYQL/uvjfqnC/+cLuZI1LVSEciDiQ1T0
         ILfIvFFJlkvd8bbzky/ZaziYUoID0/Vs8CFqnifnbC3IVTMV1W8TtZwC7SFQa/hOaEIM
         fY8JFkz1Uam0lHGXzMEEhwg3UpYh+c1Pfnzki1XP99/1I6inC2ZKcId0ny9GJjdy+SKe
         0Zcg+Vh2R0y21hJfSweh+3p+jYxcg20wWQ+u8XjXLqZ7s1WYwtzKIeltMMFrxxLDVExm
         rV71I+8wJEHW5pScmN57ddRaRSf2Jk/zSMvbEK0sc5IvSWqJUEcYSvdZ3n7p279A9pl7
         lncw==
X-Forwarded-Encrypted: i=1; AKwUvBxwEfUa5IfoH9NgAPameUsen8s941H5jh/vxN73iAz8x9dCNY3J3SfqJm/42Aap0QYTqIqN/bvIH6yC6jyC@lists.infradead.org
X-Gm-Message-State: AFuF++kq+icpRCR9BDzA6oYUg5ONiusxk7FIEAN9rGhaLQ1ScPIgBoj0
	8y0dv/8QEIkO8sY+/YxAOcZlhuSdAzF80C20ysfoEonTM7fXTwHi148XkKBb4NbPOPA=
X-Gm-Gg: AYBFou3Rt+Rs/nxRkDF/79PcDM4gSqjAW5EvGwBItjaudiNN5SOveRTzuY+ya97QAYJ
	dPbaoiPeqcj8nSLLHZYvvrIjFlPGgRuENjhNAXb8Q+ab5iah83mK3Bc9bqOy+FGuzjFPM+MK7tf
	POpWhdZS5ByUHKlIR5yd2rX35P2t/IPj97TzcnMAOeUzDOMkbSUv7ReIHQMV+JdbIXCqy/50mOo
	tDRoI32Gk+cA5DvNeaMHMJmJV33/cIyiCH/Z5ybiL03RjsC0vAsBlrwz8V/zRQENRwCMdwaogCr
	qJlH7fo4ZY7+S0iq6V1+J+6SywIuZKUJzbY45vlZ/cZ2Cx1YKSXf/Ikyy09vz0Bh/XYrDoWS0W2
	M2vACAeNO5iyK5UpqpTzcxRmPi8umVE7+EPRS5EjHw5e8voDI5KsYhvzGvZZ50Rh9LLvc+oz4Cl
	0eMeuHEYXnIqEFtjh/P2Ot/bDa+K4Jav/EGWRqMdWJbeF8Bwe0HAhUY+nlVXFkb8xrCw==
X-Received: by 2002:a05:600c:37ce:b0:49e:799a:8952 with SMTP id 5b1f17b1804b1-49fc5743c81mr211815845e9.26.1790092898289;
        Tue, 22 Sep 2026 09:01:38 -0700 (PDT)
Received: from [127.0.1.1] ([151.42.87.32])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48862786dc2sm6118020f8f.25.2026.09.22.09.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 09:01:38 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Tue, 22 Sep 2026 18:00:52 +0200
Subject: [PATCH v3 7/7] arm64: dts: amlogic: gx: add AUDIN node
MIME-Version: 1.0
Message-Id: <20260922-audin-v3-7-a760312c076c@baylibre.com>
References: <20260922-audin-v3-0-a760312c076c@baylibre.com>
In-Reply-To: <20260922-audin-v3-0-a760312c076c@baylibre.com>
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
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFmblkUluVq2notODD5885mM8wnW4gkfrmuWbj2g/WZV3
 jkRm4BbHaUsDGJcDLJiiiws0+/9LihVe2iccLIAZg4rE8gQBi5OAZgI30GGf/YJqwxtZTav1WHf
 IHpv+n120WDjmKciN9d/vhsdFxNpacfwV6bGgXeD9emgB0cmu0q4L9Q0DGix8TRbL1T96nVa9Jf
 jbAA=
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_090140_019291_4EAFD45B 
X-CRM114-Status: GOOD (  10.43  )
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
