Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 741D8C433F5
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Dec 2021 03:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=D2OIkEJL5mDFOHtW1RoW58VRf33oJrAyGvKNGhflcS0=; b=R9fQYMqQzqe1N4
	KWZy4wCL+jRSqGbZDgmtKTozgt61rndLFnqb9VOtBmKXZgSRr8OMZEOqwThk+FG9TuwliSAzCXm4Q
	HDH1T89LCixmCQZTyMMf6ravUyc5r/P1QAw1q7wuSnxnVbkrQximTI93inkfkoJ9+i25rd/+o6SRa
	EJT9s8Dkx+4sEoZ1stPeHERijj51q2sHHvFTHIC0CIFQKBlYfkMBhsJ3K2pKyvnLyt7vwQU2dgHDx
	u7NCwi3zlohAjBXd7QyOQvM6iyGMzlF4WnFr6CuP64GwQtPod8OZYPzx6QuFHiJis4JKQgW/aZ17e
	zA8lBZpw6doebYg2BGtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxKZH-00GUYn-6w; Wed, 15 Dec 2021 03:02:59 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxKZ4-00GUX9-Ta; Wed, 15 Dec 2021 03:02:48 +0000
Received: by mail-pf1-x430.google.com with SMTP id 8so19469732pfo.4;
 Tue, 14 Dec 2021 19:02:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=l67OnNQFpi2JYi2qvaEeFRFUbyO8Epk70jYmuOz7uo4=;
 b=Lf9QL5bNinlRjGR8nZNc3KOPZx+c7Jhvml5Bb5Hp6PHijmQCEdGur26Q//GujanDlh
 VBd2sNiTwtb0UZL3+57Zl3naAaatM5v+vMSZZTTqXC9LytN5uAhweC/s6Jt+EmphikxO
 0aFcVCPgG3f8L7RPgjeRKRtQEvgaNBEB16gAj1wxzUJAlMheztpuVBJ/+B2+KBTa4zYm
 ORpDhYsnXBp15zqXWG25IBclPAFrc49QmxOoPF+siP1ZghLZIOwJpiaouhMJQUCzskBW
 DlJr/LxJvHRvCOYtS6GBIl/bHmMiiCa7hixaMB9r0sXr2bz/phi1PdPAEckkjPfz028w
 IUJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=l67OnNQFpi2JYi2qvaEeFRFUbyO8Epk70jYmuOz7uo4=;
 b=3UU6pGkSx/isIemR1uZ2GZyFueDgxsIKHwwIMwOhYSCXZv+KUXETbBm8aIE8Mm1QWe
 yB+mHmUqcHIFq9UhliAeq+oUI28bBVwaILcAAZELAxMOxW/CotPu2RfIntxwzs4pc5OE
 ZI3ia7P3EXLcxS4soQr0m9fiESuLT/yoAWcnxmNup4czW5OB2p4J1+19iBzk62rTTTW7
 cVJwpWixQtEENRSIV2wfV7RFUjtpcz0QliUXCahPiK7rbAOzJCL4tiBPN8NVJVd3znPx
 KKdL748RmJ7MrD2XUlfE8+hk8PcM7MD9m5V+Yk+IUoDcVy54NlVkspukI0KChEo9Y0wP
 FGGw==
X-Gm-Message-State: AOAM531HgNSFqjJeHUAwfQmU3BdTHNAK5XG6DTnFUi07bKMc7DYY8RsY
 otvdJijtB97fLyTyUNAhkCes/1FFjEJMKsu5
X-Google-Smtp-Source: ABdhPJxY3eE3zPwATkRF8wmarHs7T8JxnX7iltrhlfirDvo192Q7t2UsImxYFDbChKVoFY3Sraz1Fg==
X-Received: by 2002:a63:65c3:: with SMTP id z186mr6154548pgb.308.1639537365986; 
 Tue, 14 Dec 2021 19:02:45 -0800 (PST)
Received: from localhost.localdomain (104.194.74.249.16clouds.com.
 [104.194.74.249])
 by smtp.gmail.com with ESMTPSA id d185sm402490pgc.58.2021.12.14.19.02.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 19:02:45 -0800 (PST)
From: Artem Lapkin <email2tema@gmail.com>
X-Google-Original-From: Artem Lapkin <art@khadas.com>
To: narmstrong@baylibre.com
Cc: jbrunet@baylibre.com, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 christianshewitt@gmail.com, art@khadas.com, nick@khadas.com,
 gouwa@khadas.com
Subject: [PATCH] arm64: dts: meson-sm1: add spdifin spdifout nodes
Date: Wed, 15 Dec 2021 11:02:36 +0800
Message-Id: <20211215030236.340841-1-art@khadas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211214_190246_973248_0DEC78BF 
X-CRM114-Status: UNSURE (   9.80  )
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

Add spdifin spdifout nodes for Amlogic SM1 SoCs.

Signed-off-by: Artem Lapkin <art@khadas.com>
---

SPDIF IN and SPDIF OUT both tested and works fine for VIM3L (meson-sm1)
same as for VIM3 (meson-g12)

SPDIF in and SPDIF OUT both pins available via GPIO header (SPDIF_OUT PIN
13 spdif_ao_out_pins and SPDIF_IN PIN 35 - same PWM_F spdif_in_h_pins)

https://lore.kernel.org/linux-arm-kernel/1jtuhwvqxa.fsf@starbuckisacylon.baylibre.com/t/

ALSA spdifin test example
=========================

# arecord -fS16_LE -r48000 -c2 -Dplug:spdifin

# cat .asoundrc
pcm.spdifin {
type iec958
slave {
pcm "hw:0,1"
format IEC958_SUBFRAME_LE
}
}

DT sound card configs for testing
=================================

&spdifout {
    pinctrl-0 = <&spdif_ao_out_pins>;
    pinctrl-names = "default";
    status = "okay";
};

&spdifin {
    pinctrl-0 = <&spdif_in_h_pins>;
    pinctrl-names = "default";
    status = "okay";
};

...
    spdif_dit: audio-codec-1 {
	#sound-dai-cells = <0>;
	compatible = "linux,spdif-dit";
	status = "okay";
	sound-name-prefix = "DIT";
    };

    spdif_dir: audio-codec-2 {
	#sound-dai-cells = <0>;
	compatible = "linux,spdif-dir";
	status = "okay";
	sound-name-prefix = "DIR";
    };
...
	audio-routing = ...
		"TODDR_B IN 3", "SPDIFIN Capture",
		"SPDIFOUT IN 0", "FRDDR_A OUT 3";

...
	dai-link-10 {
	    sound-dai = <&spdifout>;

	    codec-0 {
		sound-dai = <&spdif_dit>;
	    };
	};

	/* spdif or toslink interface */
	dai-link-11 {
	    sound-dai = <&spdifin>;

	    codec-0 {
		sound-dai = <&spdif_dir>;
	    };
	};
...

---
 arch/arm64/boot/dts/amlogic/meson-sm1.dtsi | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
index 3d8b1f4f2001..1e0adf259d61 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
@@ -356,6 +356,33 @@ tdmin_lb: audio-controller@3c0 {
 			status = "disabled";
 		};
 
+		spdifin: audio-controller@400 {
+			compatible = "amlogic,g12a-spdifin",
+			"amlogic,axg-spdifin";
+			reg = <0x0 0x400 0x0 0x30>;
+			#sound-dai-cells = <0>;
+			sound-name-prefix = "SPDIFIN";
+			interrupts = <GIC_SPI 151 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&clkc_audio AUD_CLKID_SPDIFIN>,
+			<&clkc_audio AUD_CLKID_SPDIFIN_CLK>;
+			clock-names = "pclk", "refclk";
+			resets = <&clkc_audio AUD_RESET_SPDIFIN>;
+			status = "disabled";
+		};
+
+		spdifout: audio-controller@480 {
+			compatible = "amlogic,g12a-spdifout",
+			"amlogic,axg-spdifout";
+			reg = <0x0 0x480 0x0 0x50>;
+			#sound-dai-cells = <0>;
+			sound-name-prefix = "SPDIFOUT";
+			clocks = <&clkc_audio AUD_CLKID_SPDIFOUT>,
+			<&clkc_audio AUD_CLKID_SPDIFOUT_CLK>;
+			clock-names = "pclk", "mclk";
+			resets = <&clkc_audio AUD_RESET_SPDIFOUT>;
+			status = "disabled";
+		};
+
 		tdmout_a: audio-controller@500 {
 			compatible = "amlogic,sm1-tdmout";
 			reg = <0x0 0x500 0x0 0x40>;
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
