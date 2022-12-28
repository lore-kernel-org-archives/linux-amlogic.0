Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A126FC3DA7C
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 Dec 2022 10:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qj07Htu07fJe8u04SrFyyhyc9BEq5WjRsCctYLIcCzk=; b=GrrE+7CutH74WM
	ffXH3eh193RQjwq6WdzURGosLyeGPC4eE091SyvtKXH9APU3Hi+NrBbqmfTvKocrF9DJB6CRItwBK
	e1YMgar/9h36Z8NTTj9/p0FYf0qBc6bhvqYLA5KLtWITIjtdxshRh2Er3s3BntL6/yoMSkoXZq/N0
	nlXT1igj4RQy/hpVqbL5WJjytgYCJIhQPKtIU/ZoPvq/ZoGPghPZJZIjKXgJLznBkk1DI6PPDo1Fr
	xsP/GC4nmWrQ2F41N7f1MM0fnX71kSFdcY0hm3WncYJDSq4IKgcfl6u5iV/R3jS2gxyN35Qcfb4Kj
	RWsZV29iU2ulgtS0QQpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pATJY-003vVB-GB; Wed, 28 Dec 2022 10:05:36 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pATJI-003vLj-UZ; Wed, 28 Dec 2022 10:05:22 +0000
Received: by mail-pl1-x635.google.com with SMTP id t2so15659587ply.2;
        Wed, 28 Dec 2022 02:05:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gn5jvMyqX0GecgS3SjW9qlzhKx37olketReSn4DJoo8=;
        b=nAkTmTUil3MywHiG+sLJPQZJPLM3Dp/Oe56sMR/xDQTY7uIbMdzZ466Tz0A+cUORlr
         2fxDuPotsYVpIe55fsGRVNcZRm5MSlTCdVUeGzuPIzifG8ywpZ8wfrs+XRpVRCo6+ih3
         H8vwP5AEnc73NOcsD9thwEDSa4HennnRpFBjlyOEMB5rFDdxrRzJVoR2NQZcK8jstx9K
         7IMJgBo1RaksgBbOJSo+kjw3qhFnR/9rCxeJEBJVwiMOocU/XeSQa+/bfSNt/YQ3C7IU
         Z0jhKHp8Fa5BooM66tvsxvxdmQbQc9fKU3nUD8nt4xmIs7DfJo9cPDzEH/mTjqi3tmfK
         RenA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gn5jvMyqX0GecgS3SjW9qlzhKx37olketReSn4DJoo8=;
        b=gD5wsa4Og1GXBGjoimk5+dAFboVWo+jIGj65s2kJvUSUHiEKjGJ/nqmnArle1B5lUy
         o2XaklPI95m6WmmJKesL60d/GlF1eUPSn+38TPfVOefyorSYa0Etwg3/zJZ9plW5gVsi
         TPS3cMkQEDxBH41uK93dmJoZcn3QNpGjRzbmGwEtFNBuu5ZnO09K/ioh1dNlrP0TVpIY
         5O9Uv+ycXlsLbgslbOnkZXvFYP0VxKlYY22WC73c22zPhnaU7k1OG4Y4nXlDLuQCN7qU
         lFfijsXXzbATh3yf54Jooub47KptYX9ZXuwqEf5yOruPkMIiDI1Hahe/dFJYjSrc5sv9
         8l9w==
X-Gm-Message-State: AFqh2koYFpniB5kz2Xn9ws2vyXsVYQKCUU7GlefPfzObB32nfCpM0uuX
	+ooLO8ijc0N4NUp5RbSKf0c=
X-Google-Smtp-Source: AMrXdXuHhqxS7MfYPo8/enDYbq1jBAxX+4/gICB5Fh05G/QeVgK6F9eq+htlhjZCvbD/seggOCJozg==
X-Received: by 2002:a17:902:ce10:b0:189:af28:fd8d with SMTP id k16-20020a170902ce1000b00189af28fd8dmr31817789plg.1.1672221920466;
        Wed, 28 Dec 2022 02:05:20 -0800 (PST)
Received: from localhost.localdomain ([45.112.3.26])
        by smtp.gmail.com with ESMTPSA id t6-20020a1709027fc600b0019277df45a6sm5794915plb.53.2022.12.28.02.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 02:05:20 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 03/11] arm64: dts: amlogic: Used onboard usb hub reset on odroid c2
Date: Wed, 28 Dec 2022 10:03:12 +0000
Message-Id: <20221228100321.15949-4-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221228100321.15949-1-linux.amoon@gmail.com>
References: <20221228100321.15949-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221228_020521_097320_9130AC05 
X-CRM114-Status: GOOD (  14.69  )
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

On Odroid c2 previously use gpio-hog to reset the usb hub,
switch to used on-board usb hub reset to enable the usb hub
and enable power to hub.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 .../boot/dts/amlogic/meson-gxbb-odroidc2.dts  | 29 +++++++++----------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
index 201596247fd9..3d3e61cf65a8 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
@@ -208,6 +208,20 @@ codec-0 {
 			};
 		};
 	};
+
+	usb {
+		dr_mode = "host";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		hub@1 {
+			/* Genesys Logic GL852G-OHG usb hub */
+			compatible = "genesys,usb5e3,610";
+			reg = <1>;
+			vdd-supply = <&usb_otg_pwr>;
+			reset-gpio = <&gpio_ao GPIOAO_4 GPIO_ACTIVE_LOW>;
+		};
+	};
 };
 
 &aiu {
@@ -250,21 +264,6 @@ eth_phy0: ethernet-phy@0 {
 	};
 };
 
-&gpio_ao {
-	/*
-	 * WARNING: The USB Hub on the Odroid-C2 needs a reset signal
-	 * to be turned high in order to be detected by the USB Controller
-	 * This signal should be handled by a USB specific power sequence
-	 * in order to reset the Hub when USB bus is powered down.
-	 */
-	hog-0 {
-		gpio-hog;
-		gpios = <GPIOAO_4 GPIO_ACTIVE_HIGH>;
-		output-high;
-		line-name = "usb-hub-reset";
-	};
-};
-
 &hdmi_tx {
 	status = "okay";
 	pinctrl-0 = <&hdmi_hpd_pins>, <&hdmi_i2c_pins>;
-- 
2.38.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
