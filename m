Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4E93CA5FD6
	for <linux-amlogic@archiver.kernel.org>; Thu,  1 Oct 2026 16:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NVRWeqtQ9Okpy/S/q0WajEsD2KHOnLAyHBTUsX3oa0w=; b=H000Xhqs3qwWe8
	L2yLnKUnSHb/klbbPze/3LDJlyc2eQ6gxTIJxXQfsrf4U/YcIysMWdpPGHRdgVhLoxhHR3ftiOqqF
	3g0hZ+akVRWbcJoQ5df/rP3Q+DUdlXwDEAUyLlQb4+GBoeD+l7X5ze+AEE0JIBUCqv4IOpJo5wlk7
	SZ8VYoY090Va8FtczcNOPp2XcgPTjrzCipXoGUA0HpCtbTvkVcCwCDQr00ipaaS/noPw0g2GqM16C
	zTYuyPP9OxWLcIv+gCCPYIQ4YO/Ymj6LpggDoJLHflcpIzwhXY58pld3IypWsoXHv8vb9+ijvbRiO
	nVaK0LJI+B+gdwH6MbBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJJ4-00000009dyR-3nCB;
	Thu, 01 Oct 2026 16:06:50 +0000
Received: from mail-wr2-x17.google.com ([2a00:1450:4864:30::17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJJ0-00000009dpU-2m8t
	for linux-amlogic@lists.infradead.org;
	Thu, 01 Oct 2026 16:06:48 +0000
Received: by mail-wr2-x17.google.com with SMTP id ffacd0b85a97d-48b0622cc90so762801f8f.1
        for <linux-amlogic@lists.infradead.org>; Thu, 01 Oct 2026 09:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790870805; x=1791475605; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ij5hZ/f/5ZSAVNfXmFdWrj1YYWFbkwnSZJULxesQxbM=;
        b=hUE3Q/8yMN0W/MiLxoeJakv7gm64tYyoyCQOZfB+nMwYUyLuOaA9+muvkakBuN7IgG
         9/LAuRCcTx12ixRY2PAZtrddebAch+t+i/i2dLgXnLvUe9Lh12dtPPIfvEKsx5cAxt6w
         INkEtZC8kvr+60CW6cD6fVq4meuf9fwgZKh0WtvlzLOyZN2jB09u+llaKNBTM4OFZ4EG
         xKOe5PgHI+Kio5XQW5VZVLYoUBSqDV8OliUTcwpmvwr0Jw8n1Rl6N3f/Perq7E+aHbMe
         VArRIZ4eeIGv9rUzWIqC2Y38MwPfBsRig/gSCIE0t3VG58DWYCxczk+LgU0Pywr4r2Ck
         AuVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790870805; x=1791475605;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ij5hZ/f/5ZSAVNfXmFdWrj1YYWFbkwnSZJULxesQxbM=;
        b=EqZVaeyYBsupmQip8+FNfB0W5fBYVdkC6Mh7dLnjvZVo4SdiY4GpVJSBsGQ7cX6wJu
         fq+dJCLIo8Zn7jSF2h4dU8oEaN7Ro4LXKdOdMWqP5EavNpJpL54cu5TaWIazRVPcsEWe
         uq58a2HG9hgFbAUz6JonQdIRncovzpfw+R7e7j7Qdpn56fj9S4lNSPWTYBrBQlpGZA02
         62Jho7PBCRgZCd8iYreDiKJm7P0/1tV3DrIUCY630FwmVXgKCnVUcIC1yDf5yPnuulCY
         zZFiluOswtAvCrdtbTqyNYVwipzP8GUY/oCrTAH6VUrbmgBi3r6wyg1BJXYWikybWuMn
         yDxg==
X-Forwarded-Encrypted: i=1; AKwUvByfhooWL1HzYYcLg5JCbRikyJ6wf2Tgu3RWkkQCCAem3MHF48HhaiOgDvCRLfXJTKitTm3nTIxf38o2ymEg@lists.infradead.org
X-Gm-Message-State: AFuF++kDf++qT1PHr0Alqae6DjOQLBgmfYFVS+iG8mZs+RGrGWxzMaFT
	8hABHA6SI0Tm8075QFdcH1KgZny5InhX+bLViuk2edsh1+SWaoJbeNn0WM15bAzqObg=
X-Gm-Gg: AYBFou0Z0HQlTtfK4V0y0GCMb3SFt+VOH5dV/Vss4JL3DdfsrpNjqxMZITmW3Y142q0
	myG3dy5w8QcX8aEtRIgWKcKUN7KFrnLHZk0G0GWmeqy5rpEmQVukrNc59pwbvjvmfOYTQF+k2uR
	IbQBjdT//oktkq72I+GXMVNW51FWL4alLFGP4P3abLn1ofTnWwTrO9QukNTDNHogNmk5oWjeKLp
	o5jNebDITF/DdfIyn6hfdNuxeIr2wa+g6nrKKr75DoZ1cE8fz650ObpH1MqhfMavfiDJqkb7In7
	2Ojj+MO/koh/WZDYNYVc8aAWNZCeDuzAFyDD1MmrbbIFhqeteiwV0+w0tcH66xAfLzNqGo2jd/l
	ZpEjXoN6rriehGkLGRs43QGCRvAcm5rUbum7yBrXPYdNsUlKju/KYkQJjbs/jboPwZDMaRAvYCT
	2LYJ3+MK8asv/chUVTHP7JFFy3LAq1Mt1VOKdUd7OWropgn5gJoLkHhZ3X6IGgZCdi
X-Received: by 2002:a05:600c:6091:b0:4a0:a34:f6fe with SMTP id 5b1f17b1804b1-4a027577f81mr1689465e9.17.1790870804666;
        Thu, 01 Oct 2026 09:06:44 -0700 (PDT)
Received: from [127.0.1.1] ([151.42.82.6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f93ad0bsm52969705e9.4.2026.10.01.09.06.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 09:06:44 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Thu, 01 Oct 2026 18:06:32 +0200
Subject: [PATCH v4 7/7] arm64: dts: amlogic: gx: add AUDIN node
MIME-Version: 1.0
Message-Id: <20261001-audin-v4-7-2476646118b5@baylibre.com>
References: <20261001-audin-v4-0-2476646118b5@baylibre.com>
In-Reply-To: <20261001-audin-v4-0-2476646118b5@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3008; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=/Q2BrDG59GmMlxGGtQS3aLFT+KnRGjYRz96TAYWMkFk=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFn7Wrmf3L3b+J6zXq3/e8YmKettBq/Sry057jXRQ+VYt
 P1Sa2PNjhIWBjEuBlkxRRaW6fd+F5SqPTROOFkAM4eVCWQIAxenAExkigYjQ8+B1u1S3P6FHOV2
 drLNsuWG/ybtmm7978aTy/LL5rK47GT4cbX1npJ8voJV69w52luWKnJtFVn/+U93yXtBvqmTtp3
 hBAA=
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_090646_758893_4A00AE19 
X-CRM114-Status: GOOD (  10.39  )
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
