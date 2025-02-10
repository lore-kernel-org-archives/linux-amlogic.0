Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20A3BC021A3
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Feb 2025 15:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NMHkxmbwQEZie0ESO29vqheoOb5bhemPFFMafvojK9o=; b=Nqh9Mu1fxEeKwj
	RPMpdmYUEkTcPH5pR4DucVV5jRa8KF495dX/Aw7Y4Gq7akN1IfkZJA/qdMtz2n3G+gU7x+BXzOvqT
	fSQ0jJZsD0+4EWk+5tvmRB1zMC6hojcEbIiabQAP65Ow76/dY8PMTjUsuWhWFibG9wHfTcCtX8gp2
	kEW9Wz8OAZh/7CUQgezauxG6GVWrBsVkyUDw0bfY8Lk+cUMoUQTs/K5ksFbA6p2l/W6C760wzejQw
	JIPTMEXcEBXNwRqYKMUK+c9PuI9lxpC1avjNpMHdBAF8+h0NT0igYNJelsymUCzVcG0XWWp7EtRof
	N3xLeCkT6rL7+1/PbOiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thVJ9-00000000EGf-0gic;
	Mon, 10 Feb 2025 15:02:47 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thVI6-00000000DxQ-304g
	for linux-amlogic@lists.infradead.org;
	Mon, 10 Feb 2025 15:01:43 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-ab7d58aa674so47983966b.0
        for <linux-amlogic@lists.infradead.org>; Mon, 10 Feb 2025 07:01:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739199701; x=1739804501; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XDwysfrxYdnvpIdJT7USDkw1h39r5hFh2YykRChg6Kc=;
        b=MrK8qURzSBnd4Bz8NuoLzSJD4WS4zlHP7ymoNJ8uX1lNSLQBuAa+f1ypCqAFUnZMwU
         sIZwXGijk6zIPseN/H/cVkAgu1yCNA/6W+8HgC/p9cHQBsnJihOqdgi9K18EYhYSHesk
         PfuTH2h8ecv9jIYn1VT3PaCT/c78K1HCWZTQyWdEceeyPh0hD55PfG6B5RDA6U3APdJ2
         byNEiTR1T+415/CCnYTLImX2QB8TcWoIM8m7vmpsM/dkwFfk2AJ08riUbjGf4bWtUbNa
         R49Hu7NDK7rpMcut1RwZq5aZP69knHvb2+qspucI58FooMlbHIP385bz5ZbosXsScQq6
         i9Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739199701; x=1739804501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XDwysfrxYdnvpIdJT7USDkw1h39r5hFh2YykRChg6Kc=;
        b=Gejhzu9rSF82+wxVDGRHbEh4LwoxiQB1nFebiWCBuCb7IzbSD7XUxAjBviKeFiIlkg
         4U1X3hKQt7G7ArG9/SP9yud37p90OaD8ECAbbLnQtw+07+4UCgGtkmTg2YOrSBf7n8fX
         CqSE1puO7tHgONs8HXT+TkVDNAfj9T7i7vqiKfEmh8Mk46o0ZcCe1L1gR6tsoDRVigTA
         ITTaodMau/MLVv+ap56AWVuTjed8MfBV2iwLbTR8RzvYjfUy6DrR3Tqs75aRd0e+nknr
         b8g6/qE6JVERx9md2yBAC50TzpLLXvAXP2XhrvjGwzade7tjivEIT0HS+i3hOM3aSmU2
         b6bw==
X-Forwarded-Encrypted: i=1; AJvYcCWdxBDdNVp5ZybLzQ5afMAQIaOS0wiPiVAYbGoK38n+4s4ai704HYdycOBJQm+61zgQtID0JtxF3Wl5YggK@lists.infradead.org
X-Gm-Message-State: AOJu0Yxu0U18AR1WFj7RrqLTe/6fM3uWoqMhA3pjmfZBcMDjKQY8M31q
	c17jt8PNdwKQ6uPCOzoetb6nRDnDYNKkwTA144N40BS75Si+5ow0S6Z8elbvFSo=
X-Gm-Gg: ASbGncvIZ2mhHp0JZk7Tggh2kRGr5nv8Euk2dAfgydNKjSwIe0xrquB8diRjx3mi5Vz
	8Cn3sDSRm6NfHE+mDjE4cfmIPlHemGeT4l/opPX4s+x3reH5+gShOsPa0BEkeDGQz0olqd+itM8
	6uJ/szVFl+oUyWXZeOrGePWHERjWkk4SA9InMqBLq/RVCJSL+eJs54pjKt6pLsMUn7YpkNKPjaP
	CHQrardp2Vh9KmqVC9VUuaYicAVorUf3q3In9U7OVBYN91XAi1N+pKFVf1RLIQk5VLYmhtpujz+
	0xWBZkz8VS47fmJumm72mgbZpswN
X-Google-Smtp-Source: AGHT+IGGApn1+B5eCaOcf/7nnDOcbipSWzqajWhFXoUzR2omWufSb2FAoBNmw4R/1Cmqf9KlenerKQ==
X-Received: by 2002:a17:907:9411:b0:ab7:b84c:361 with SMTP id a640c23a62f3a-ab7b84c05e6mr572978266b.25.1739199700513;
        Mon, 10 Feb 2025 07:01:40 -0800 (PST)
Received: from localhost.localdomain ([151.41.218.186])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7bec717f7sm250400466b.81.2025.02.10.07.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 07:01:40 -0800 (PST)
From: Valerio Setti <vsetti@baylibre.com>
To: jbrunet@baylibre.com,
	neil.armstrong@linaro.org,
	khilman@baylibre.com,
	martin.blumenstingl@googlemail.com,
	linux-amlogic@lists.infradead.org,
	linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Valerio Setti <vsetti@baylibre.com>
Subject: [PATCH RFC 6/6] arm64: dts: meson-gx: enable audin on odroidc2 platform
Date: Mon, 10 Feb 2025 16:01:29 +0100
Message-Id: <20250210150129.40248-7-vsetti@baylibre.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250210150129.40248-1-vsetti@baylibre.com>
References: <20250210150129.40248-1-vsetti@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_070142_752105_8851C776 
X-CRM114-Status: GOOD (  10.66  )
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

This commit adds the TODDR #0 module to the Odroid-C2 platform.

Note: this not enough to be able to start recording data. An addiditional
dai-link node should be added with a reference to the external codec
being used. For example here's what should be added when an NXP SGTL5000
is used:

		dai-link-4 {
			sound-dai = <&audin CPU_I2S_DECODER>;
			dai-format = "i2s";
			mclk-fs = <256>;

			codec-0 {
				sound-dai = <&sgtl5000>;
			};
		};

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
index 959bd8d77a82..a83373739019 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
@@ -10,6 +10,7 @@
 #include "meson-gxbb.dtsi"
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/sound/meson-aiu.h>
+#include <dt-bindings/sound/meson-audin.h>
 
 / {
 	compatible = "hardkernel,odroid-c2", "amlogic,meson-gxbb";
@@ -210,6 +211,10 @@ codec-0 {
 				sound-dai = <&hdmi_tx>;
 			};
 		};
+
+		dai-link-3 {
+			sound-dai = <&audin CPU_AUDIN_TODDR_0>;
+		};
 	};
 };
 
@@ -217,6 +222,10 @@ &aiu {
 	status = "okay";
 };
 
+&audin {
+	status = "okay";
+};
+
 &cec_AO {
 	status = "okay";
 	pinctrl-0 = <&ao_cec_pins>;
-- 
2.39.5


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
