Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23F9AC54E94
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Jan 2023 07:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=olYv6M6bLrtRZLVcn2GKLXtCfS1iI2DjJuXTcMC6RGY=; b=fbuLoVyhy+nM66
	TFkL+P1vHZ5XUh/k5TVV5MiqcVpxofhA697lVLgvQXIJaasl2pEQ34p6DXwS2GzuqK3frW0OrAxnV
	iRxzM8VbfNkgyWDYoMNmQsHEZuaAGxwQ8kRkioHP5ZjtRoHWfiBzZsPmkSUCW+It1Xlcf0Z+acREL
	pmsc677LqGq0yqsnswL4fOG2cK9Odg1wAX8Rx+l33fl+/5OLwnc6ByjRaMFrds351Hv0nt+OXvsfa
	nGeDtPxQtk9DWlXZJIkwe6mVKZPhvyNQs5Eim3iOjvEboDSVo3WGxZYkdBWRQz92QVirNGwaZ7Qyr
	ZXXOfGX1bgRzH+0c/HDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKaBG-006ERI-BZ; Wed, 25 Jan 2023 07:26:50 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKaB6-006EMM-Ve; Wed, 25 Jan 2023 07:26:42 +0000
Received: by mail-pl1-x636.google.com with SMTP id a18so4542901plm.2;
        Tue, 24 Jan 2023 23:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9uUEIUXRT9q9lHy3kc8AWUGd4aWNpn7Eo0QlIhJUhEE=;
        b=X0XWijY9JfCYybLM/HfBwKnyqBgOPEk+d07/QIJq+DM7C442Ts8X9fW7lpJYKvGXTg
         60A6CSWE2DSCdmhWiY7pxRrzI/ZmydYxmAUDknCN5clTtQ15WfGqGOQFH8atmyXuDEgh
         Bnn9kCt4vB4pLWQfkKGro6/Q+UljY5tPr2YAmfEIzBicsQfJlvVSP/6hbCmN7NDX6L5V
         RFTgoAwjQYV2gzCklEhDOi8WsWsbD9YU9zUcHo6vrHtfuUqgFB7EPCHlVlqt7pQp9gE7
         wDbIwJIvJMDdiTf2eakBXfojZcEH/B/dYyQ6l/jbXvTGhuRh8J2fwCsYjIAPEY7tw67F
         YFZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9uUEIUXRT9q9lHy3kc8AWUGd4aWNpn7Eo0QlIhJUhEE=;
        b=FcUgw+ujmMHXcsijmZ+aUaG3oi4sTVDW3bUiX0+phG0ACuqooQ/wT+TefzKyIqRSd1
         U4vbalnHGRzHvRqpW9BoUF0XgeOmcLGlpl3J6M4CP7O+go2KHu49ubWLAEkzLTnuiZa1
         EsvknkyLxbdiRT2I97rb04vbYuwGZVw+jds9acEMPBHN9MaKy48Yhej1j+eYGn2ncL/x
         MuwwqXD8Vjxt5rAN9rbiygSAHFNUlvcOjWtsKrdCbj2xfXrI1dxouINSYfMnUQW+pXPS
         CiAyNL7SLCEpNEFu3w15wD0RPIcWTA7xVS0PrM1ktiGo7FgPhtQ0VqGCre/Y4l7IPftW
         bnvA==
X-Gm-Message-State: AFqh2krgu6IHSLwPiA9J+F9ZWMx9xdtEkavnBs2rLclAAjl1h+7cm0Qz
	GkpPHj1MVOAdAGXFYEvP7Gk=
X-Google-Smtp-Source: AMrXdXtcs456r8VJhzFeKDQsxx/LQpqmPVqc4vhq/PITCJoGk78ReA65L/U+CpboKGnKjLdeYOMAhA==
X-Received: by 2002:a17:903:2487:b0:194:9874:5e07 with SMTP id p7-20020a170903248700b0019498745e07mr31010694plw.18.1674631598042;
        Tue, 24 Jan 2023 23:26:38 -0800 (PST)
Received: from localhost.localdomain ([45.112.3.15])
        by smtp.gmail.com with ESMTPSA id h6-20020a170902f54600b001769e6d4fafsm2902500plf.57.2023.01.24.23.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 23:26:37 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND linux-next v4 3/4] arm64: dts: meson: move usb-hub node under dwc3 node on Odroid C4
Date: Wed, 25 Jan 2023 07:26:03 +0000
Message-Id: <20230125072605.1121-4-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230125072605.1121-1-linux.amoon@gmail.com>
References: <20230125072605.1121-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_232641_033673_0DE6C30B 
X-CRM114-Status: GOOD (  14.22  )
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

Move the usb-hub node under dwc3 node and drop superfluous
dr_mode as it is the default in meson-g12-common.dtsi.

Fixes: 71593b2020b3 ("arm64: dts: amlogic: Used onboard usb hub reset on odroid c4")
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 .../boot/dts/amlogic/meson-sm1-odroid-c4.dts  | 41 +++++++++----------
 1 file changed, 20 insertions(+), 21 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts
index d04768a66bfe..a988015dd2d5 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts
@@ -26,30 +26,29 @@ led-blue {
 	sound {
 		model = "ODROID-C4";
 	};
+};
 
+&dwc3 {
 	/* USB hub supports both USB 2.0 and USB 3.0 root hub */
-	usb-hub {
-		dr_mode = "host";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		/* 2.0 hub on port 1 */
-		hub_2_0: hub@1 {
-			compatible = "usb2109,2817";
-			reg = <1>;
-			peer-hub = <&hub_3_0>;
-			reset-gpios = <&gpio GPIOH_4 GPIO_ACTIVE_LOW>;
-			vdd-supply = <&vcc_5v>;
-		};
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	/* 2.0 hub on port 1 */
+	hub_2_0: hub@1 {
+		compatible = "usb2109,2817";
+		reg = <1>;
+		peer-hub = <&hub_3_0>;
+		reset-gpios = <&gpio GPIOH_4 GPIO_ACTIVE_LOW>;
+		vdd-supply = <&vcc_5v>;
+	};
 
-		/* 3.1 hub on port 4 */
-		hub_3_0: hub@2 {
-			compatible = "usb2109,817";
-			reg = <2>;
-			peer-hub = <&hub_2_0>;
-			reset-gpios = <&gpio GPIOH_4 GPIO_ACTIVE_LOW>;
-			vdd-supply = <&vcc_5v>;
-		};
+	/* 3.1 hub on port 4 */
+	hub_3_0: hub@2 {
+		compatible = "usb2109,817";
+		reg = <2>;
+		peer-hub = <&hub_2_0>;
+		reset-gpios = <&gpio GPIOH_4 GPIO_ACTIVE_LOW>;
+		vdd-supply = <&vcc_5v>;
 	};
 };
 
-- 
2.38.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
