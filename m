Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30F97C38142
	for <linux-amlogic@archiver.kernel.org>; Sat, 21 Jan 2023 17:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YTXl+weDX8uqiWnv/nykgQDnAwwIbW6Z3HXlUKL2GRE=; b=tfiWLQbzqCYjAw
	F3ajyj+0g95Siea4VX7eTYOosOyIWQpiOqAICb7Z78vyo5Qwbf4CEJNyfK55DVZjHEUU8oYQdXLk8
	xW0SGR4oFMh8vyCNfotZ01pBe65EFuwZwn5zhR/5dIY09bnGv57fgxIFNtSOy9gn8umyEgMreQemL
	PkBLTANCmt1vTLGbbwzpCTfXfiRluN/z8Go87EJG1UENazyomQZNgDz559HoFwrTI/idG5vFPl5Sj
	e/wSDNg0yEUoiLh7gzBQMk4mKu2FdSPvj113d9k5G1Ryhr6dMAu8MxWO6mjdvJ9bTA0yn/2GvJCWG
	a+ybfIONeo3ea25Td+BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJI7c-00EEHp-RJ; Sat, 21 Jan 2023 17:57:44 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJI7a-00EEF2-HN; Sat, 21 Jan 2023 17:57:43 +0000
Received: by mail-pl1-x62c.google.com with SMTP id 5so2662268plo.3;
        Sat, 21 Jan 2023 09:57:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=upFXHM11fb8yyn8//u4LSFSs+SLvgplDwfC/Z4GzEYs=;
        b=G/niI8tNgy0IBZ45FMpgN9Cg0vU6UMRJC+qgcOkXOl2tZnhL2C1yqOW4EcWnazNiJh
         iZBus2mj8G0dZKDV100wor82NE05Yi4TpBAmomdVAR8rcz8BS+0QqY6oJ0LJ5Ax2vq/a
         /hswCL1e6YO2wuNB5uIr+pk7kNbO2Ff2CDQZr0G9JMA5NbaKXRvb8ca2YFRvnrlhR4qr
         bdDKCqSV78mFdGGHR/qMn2NolU9zfn2YkbApyXVX72Tcur77K7AZ2JW40Jheg0njvbYm
         ekIXvKsdgiJ68buXJ99N2cwPMUtXr6+AeQDygBNCyXkVVhtQyD/kSrnWEYLmjT9hB4lz
         CEZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=upFXHM11fb8yyn8//u4LSFSs+SLvgplDwfC/Z4GzEYs=;
        b=hGQMX7EgdGv+OVVvNRwIcJ1La22pzK2ZtTzM3j+kr2tN7r2Or399ejQm+kdcOP1bs4
         8vMhtaUrxpDxuIFzEawEtRtujXwrlhh6JUgg8Ovjz3Vovd+N3DpQKxETyBNI0QuXibi2
         8roNWNvvpW0PQSRgrea8wgRiha4ITt30VtfaAgzNt/fEvMjaP2qgKundL/YGEB0iZoDO
         T9V6boJw+lhOCNfllZ8y2pSmuF+hDI3G6ALaNWSiBDXNwsBJShxeLE35Cr9ywLYcMVUm
         Ng4/YxGxP/TW7WTg1HwLvvIXFrBpqXRC1OLn8QiRQSCv4u8DZ3PVQbg8fxaZvrMwmIsx
         g9og==
X-Gm-Message-State: AFqh2krm4SURDbJCiIFE9T9YhRWisl6BxQVA1Z0c0q1UjWXCSzgOmN/R
	mxJ2mdz7cUOOKPlmywP129Y=
X-Google-Smtp-Source: AMrXdXuo12QaVYDgvO1xmkU+zpACLfQxEe1cvQTovdbHbEVM3OfIwnNKEqoK0HGMEIyZk6bK+Ppktw==
X-Received: by 2002:a05:6a20:2a15:b0:ac:f68:d0f8 with SMTP id e21-20020a056a202a1500b000ac0f68d0f8mr15681592pzh.23.1674323860897;
        Sat, 21 Jan 2023 09:57:40 -0800 (PST)
Received: from localhost.localdomain ([45.112.3.15])
        by smtp.gmail.com with ESMTPSA id r3-20020a632b03000000b00478e14e6e76sm24857374pgr.32.2023.01.21.09.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jan 2023 09:57:40 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org,
	Matthias Kaehlcke <mka@chromium.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Johan Hovold <johan@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 7/9] arm64: dts: amlogic: Used onboard usb hub reset on odroid c4
Date: Sat, 21 Jan 2023 17:56:35 +0000
Message-Id: <20230121175639.12818-8-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230121175639.12818-1-linux.amoon@gmail.com>
References: <20230121175639.12818-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230121_095742_598956_6EA469A6 
X-CRM114-Status: GOOD (  16.36  )
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

On Odroid c4 previously use gpio-hog to reset the usb hub,
switch to used on-board usb hub reset to enable the usb hub
and enable power to hub.

USB hub is combination of USB 2.0 and USB 3.0 root hub so
use peer-hub node to link then.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v3: - move the usb hub under dwc3 node.
      dropped dr_mode
v2: - fix the compatible string.
    - Fix the hub node to use peer-hub to link the usb 2.0 and usb 3.0.
---
 .../boot/dts/amlogic/meson-sm1-odroid-c4.dts  | 33 ++++++++++++-------
 1 file changed, 21 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts
index 8c30ce63686e..a988015dd2d5 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts
@@ -28,18 +28,27 @@ sound {
 	};
 };
 
-&gpio {
-	/*
-	 * WARNING: The USB Hub on the Odroid-C4 needs a reset signal
-	 * to be turned high in order to be detected by the USB Controller
-	 * This signal should be handled by a USB specific power sequence
-	 * in order to reset the Hub when USB bus is powered down.
-	 */
-	hog-0 {
-		gpio-hog;
-		gpios = <GPIOH_4 GPIO_ACTIVE_HIGH>;
-		output-high;
-		line-name = "usb-hub-reset";
+&dwc3 {
+	/* USB hub supports both USB 2.0 and USB 3.0 root hub */
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
+
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
