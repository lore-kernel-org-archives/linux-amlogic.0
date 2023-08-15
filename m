Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90F83C001E0
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Aug 2023 09:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e5rJ5vEoM35Ul9aFLBQMkKXJWoPlD6v745LQ6R7YpgY=; b=Yr8ZrKOniC2fay
	J8GrJ+Y1G3Q+rd2akonho92a5nJ1rebOq+SxdYYWcVZin21N6WEkV3MmjQ9KHLk4TuQc2mTZLXoLH
	3HLSDtOSM0ceUp/TcthJn9fughM49qOXCiVRK5afhVaHuC0Gpe97jvbM+aiTFe6TxCYNbKs8KBZ80
	JFLGpZCiLoErzqx6/afQS3arHgHk08pFl7lThOAuB8GdG1v4q9+gViHmnjeLLdQ7RIsbWlE2sRPkE
	lcxRkdMidPfHX520tEV4rxck1t2qh4FBV393vJgXfzYPCDW7vGP2DFX9BF7dY2Jnxgi4OjRKwCb3w
	ueeSX0tAQJ7UDBh3jbmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVqLS-001Cvw-07;
	Tue, 15 Aug 2023 09:28:10 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVqLL-001CtN-0c;
	Tue, 15 Aug 2023 09:28:04 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-31783d02093so4611771f8f.0;
        Tue, 15 Aug 2023 02:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692091682; x=1692696482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EwfzrnXrzs3srhIJvT0mhp0xOGZ4O82IIuIkbmzCw5w=;
        b=kpH0+vVgFu0XNZt2m6cDg7G6SmrMzwp/GgX+g0GuIL+CVr2BQx6zlBfyaBsb4MMzvb
         KOsZiZP4/IFdWBEa5TIb+BZAcsuLmj4qxvYnlB79lzxR87zTqmxLJSDPANSTz4JoMwt3
         x7vLY1SBDYle13X6Ev2o/8yx8RgQYsoiMOmTcEHr3FDbmKG2kFR2L6v3QAPvqqtNDW9V
         c89HLh7yjtPJAKTI5nngLMvcIErkZYI/Eh/TbbuVqBUEfuv+eFQU7obb3utpFz6kVS0+
         vs69o7QN2CJblnN9QWWEavsHBhJwn+7Um8NxQtYnNEY0WWUb+soe9YMFCpfZM/0WtZDf
         JwSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692091682; x=1692696482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EwfzrnXrzs3srhIJvT0mhp0xOGZ4O82IIuIkbmzCw5w=;
        b=l610pSKO3yHDlualeC6A+4cTGo7yQSuc8SPPzPMxLmJI+jhGZ469pKfL1gK0NYax+Q
         wVTxb5YM72XICfhlY8PjA/aXisxmjAfjviij8JOTtzW5ytlpRuAD5Szp16jQR3sxAiCE
         4KevEFlcgVLO2Xluv9rV937aG5K5BJAe30uAx5aZ7E/d1+hn4BJoeEqjEzaxyxr1pNzr
         v+TzGytFh70+h2p4Kt2Hs8bKqwP9HM7oAWhiqRKulkZpnNxO+glbx7evHyVGvU/HpOmT
         E9L0ETrN86MYUR/+cAKYwqJZXHrVvkuVGrq1W9gA174LeI1aIP6rOCiM2oMIDKUy9BjJ
         dYeA==
X-Gm-Message-State: AOJu0YxbaS4pxIiIGd21N8IvM/GtlnMxi7F7EplGS8XoB9sd1MUfteMA
	t0Z1faOhyY9gUimRIb6h8CI=
X-Google-Smtp-Source: AGHT+IF2AQqeJrtG/7WlxfiZa445yC5atouzCZjTj2PShhJzRkZSg2tTZD5WWUIvGr+e32sTlD7Xyg==
X-Received: by 2002:adf:f281:0:b0:317:6a07:83a7 with SMTP id k1-20020adff281000000b003176a0783a7mr8573440wro.38.1692091681922;
        Tue, 15 Aug 2023 02:28:01 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id p1-20020adfcc81000000b003179b3fd837sm17230853wrj.33.2023.08.15.02.27.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Aug 2023 02:28:01 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] arm64: dts: meson: add audio playback to p201
Date: Tue, 15 Aug 2023 09:27:50 +0000
Message-Id: <20230815092751.1791195-3-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230815092751.1791195-1-christianshewitt@gmail.com>
References: <20230815092751.1791195-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230815_022803_235380_2FC93D75 
X-CRM114-Status: UNSURE (   9.41  )
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

Add initial audio support limited to HDMI i2s.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 .../boot/dts/amlogic/meson-gxbb-p201.dts      | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-p201.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-p201.dts
index 150a82f3b2d7..6f81eed83bec 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-p201.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-p201.dts
@@ -8,10 +8,49 @@
 /dts-v1/;
 
 #include "meson-gxbb-p20x.dtsi"
+#include <dt-bindings/sound/meson-aiu.h>
 
 / {
 	compatible = "amlogic,p201", "amlogic,meson-gxbb";
 	model = "Amlogic Meson GXBB P201 Development Board";
+
+	sound {
+		compatible = "amlogic,gx-sound-card";
+		model = "P201";
+		assigned-clocks = <&clkc CLKID_MPLL0>,
+				  <&clkc CLKID_MPLL1>,
+				  <&clkc CLKID_MPLL2>;
+		assigned-clock-parents = <0>, <0>, <0>;
+		assigned-clock-rates = <294912000>,
+				       <270950400>,
+				       <393216000>;
+
+		dai-link-0 {
+			sound-dai = <&aiu AIU_CPU CPU_I2S_FIFO>;
+		};
+
+		dai-link-1 {
+			sound-dai = <&aiu AIU_CPU CPU_I2S_ENCODER>;
+			dai-format = "i2s";
+			mclk-fs = <256>;
+
+			codec-0 {
+				sound-dai = <&aiu AIU_HDMI CTRL_I2S>;
+			};
+		};
+
+		dai-link-2 {
+			sound-dai = <&aiu AIU_HDMI CTRL_OUT>;
+
+			codec-0 {
+				sound-dai = <&hdmi_tx>;
+			};
+		};
+	};
+};
+
+&aiu {
+	status = "okay";
 };
 
 &ethmac {
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
