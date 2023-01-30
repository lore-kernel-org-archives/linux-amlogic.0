Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB4ECC54EED
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Jan 2023 08:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7Vek4dC8d3dN6mn8T5dLgBpk4UNScLmPT3rubMPOjcU=; b=3fPnXunPn/2Xjq
	ETbwH2m+Ofm5prQ3Gv9lSvMsxqJ3w/0Ml2wNGWD7UvoSAdVsi4lZSwK/QA3EJf20egcDX+Sodr3id
	uPkmOpGPA1pGBD+6Ufcck8SdN52VzSpaMGn9L5oHokNjl79DFqgCKL+8zE8dAhjQ4dj+a7HpQQq0a
	gSyAQPVpL/MeiNnu4Tkt7OfIEsr+CazWdHpaTjR/CnO9CojRc82B+acdj5YHyg/lTK/L/ISLr0blC
	7cUorgGgjC9ohk2CrZwyo9w046aCXgbXIvcGZCLGGsflXog/DJx1rQWltx/5+71xPjqzxlKdgBPQB
	ONfKdtuebMuxOazu2LMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMPt4-002i49-5A; Mon, 30 Jan 2023 08:51:38 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMPpq-002hGw-1r; Mon, 30 Jan 2023 08:48:19 +0000
Received: by mail-pl1-x629.google.com with SMTP id h9so2249997plf.9;
        Mon, 30 Jan 2023 00:48:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PlNj6nV/dPZIBToTkn+V0Pg8NsW/e1iMo42iih8uevo=;
        b=ZL2pv4YX+WPOyt5YB+Dz1MDTtwU7sHsdyHVxJKwSD862zGTYLVGEfQpMkCiHoPNznq
         WpMr3wrJZ9CAve3J05cU0thOcV1ltoFlNyiR9n8KKplh2sF2yDhl1pXUrWVWuaMYEtx1
         nas71Z+r0GD1vxgO5iCMteAEE1xyRuLk6J4f/dj90YR/3BWRBl6jVjgynavaRGD8u1IH
         cXEmFDwo4gmYcozeDHRFSTFmQEddQm2IqXog8JOwHgb04O863UEh8/Vfj/GZrWkQNeqI
         DLrVQPGQ9ufijjduTrDvnDR+t4UxPX64qlkcpSh6tdA5AzOlFUHdaWHQ78Gv9oKEp7If
         Xuyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PlNj6nV/dPZIBToTkn+V0Pg8NsW/e1iMo42iih8uevo=;
        b=C8cF5uvSQM7xzwq7uFpQclFS6UtbWLcrWDq9KEL0q9QDaJK9blOSxHpzefg+WMJz3t
         LfTN5lzZFFFiQy6z+bKUSmt8C9cni3oKiIVPPvUvpuE61c2EwoHQdAaPwtoaDE6go0HT
         UzgjLQ3Oz9o/N5jEdfSN/jbcnKj8VNpC91Bp7B6vQvGxAZDZ891dg4UtK8yHJzdC4st2
         xfz0ZhQx5aWD0SjFUaX74FZFmu5fBKo9N5McNPAolBEe2RA4QKndZzrZgeXh/SP8bNmN
         3VUm3D27L3fW3vRGNpwQPyRKfCqx66QXYgTKxvb36R10aUJTLX/w2chU/pJEH6bYJSNe
         ZuLQ==
X-Gm-Message-State: AO0yUKWiem4JYvdrgjtZueknaT/EOqUq/wur6nKKKo5ICrcXw0YedAS1
	L04oPkTeeu2I4EI77qfMJ+g=
X-Google-Smtp-Source: AK7set8sw+QVFdw1TtJpqaY5CJwLSkyx7g399inzBBxohSwD0omwPF0st0dLS/JFX6cUrHuEDXh2Fw==
X-Received: by 2002:a17:903:32d2:b0:196:3ecd:c39a with SMTP id i18-20020a17090332d200b001963ecdc39amr18411085plr.43.1675068497047;
        Mon, 30 Jan 2023 00:48:17 -0800 (PST)
Received: from localhost.localdomain ([45.112.3.15])
        by smtp.gmail.com with ESMTPSA id ix1-20020a170902f80100b00192d9258512sm7205284plb.154.2023.01.30.00.48.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 00:48:16 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH linux-next v5 3/4] arm64: dts: meson: move usb-hub node under dwc3 node on Odroid C4
Date: Mon, 30 Jan 2023 08:47:42 +0000
Message-Id: <20230130084744.2539-4-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230130084744.2539-1-linux.amoon@gmail.com>
References: <20230130084744.2539-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_004818_116647_9E55111C 
X-CRM114-Status: GOOD (  13.45  )
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
v5: none
v4: new patch
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
