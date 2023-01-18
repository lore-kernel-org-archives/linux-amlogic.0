Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E613AC004D4
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Jan 2023 04:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X1TGM1FEHchPS4zQ2BLfItccUInNmyI0BZmYAKjeqcQ=; b=gzR9JOrvT7S/fw
	sIFJER+TFZViAc7t1xVs0/LeRdass7pfPq+CBV6fmD0c1zvSAV8Z0emwg+MYhdNcMhjiM1HmyrZse
	W30acAKbp4sEWOSohjsrMKe5OtU0t+BMCgvALq0s/8yUsp4uuoiQouynB67cxqVUHam6z6TJzgjZx
	c0oQfDeu2NylophhMNgbiPcAlr26gnqu2OepCByulV5AJKxD7WHh4r2bLcpwgUqiy2IEeIVBAm23W
	8cb9XZN8gTvKxbbf3Zsi74JG6HJbkFdqGEu0q5qeaXzCL6ilq9I/1crVKBNTuoW435FNbiOmhQiPz
	rRCS1DFqDli014HDBOuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI0Jm-00Gsym-Nr; Wed, 18 Jan 2023 04:44:58 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI0Jg-00Gsw2-R3; Wed, 18 Jan 2023 04:44:54 +0000
Received: by mail-pf1-x429.google.com with SMTP id x4so21107320pfj.1;
        Tue, 17 Jan 2023 20:44:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=itXWojnygtxjpIeaCDfV4R7hBZ6s5zXg2DD6bBlDmBs=;
        b=eftewbe2CBi/5TV64gKK9OavY/tDi6b+9se+BEA3Z28iy4AcsbG082daQioK7e3Loi
         804DCiNVLoBU7Mh3a2+1Li+ryCxBdytyRgUd00pGZsFgDegiZiKbMWPY9mZwcMMUPbQY
         SOi7EZ3xkmngdy0yPw7iMuvyve+0A8DhScdS/+HQwhB2tWzssJE4qPcgy4sEuBGzcaYf
         Bmb9MsJMk/PGphbVBl7Op+mFA71C5FNYN8qO5cu8jiC1v+eMPCV2hKmSnVSkRYzpeYXc
         oUpqg6WrvR1pt60FnCNTD0kWYUTVMPE9WZTa1cH84ZuYbQjp5tjOy7x64Lpx3x9f5Rsa
         8f1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=itXWojnygtxjpIeaCDfV4R7hBZ6s5zXg2DD6bBlDmBs=;
        b=Y/2vrmuWElPdFVKZqu4vKniG/y0An2UnuWkfH6CokEIYMrDhgaRZ5Si6PGMOQsieA8
         EZQTcuCOxuqrN/U8IXzkhhkJDKG7UjuqiimqMsWXTdKlip1hxLjg69/i6VkS+jKk4+ZW
         DpRNrkR2/Jo7NSdSQRGU9CpJvYGm0DCk02wVGgoNsh4VnlaRyBzNlLCKwUSEAupwVA5W
         4mQyWcQFMMeTyfWtfn1efaDubCzk5uNauH9D5TOgeQUzY725igSv0JlKIBjuyi8qr2JM
         02ScaM7hKVtYZ1d/+HGgpGppXuuZFuPUbY1TuZHxFhP0kH/qkp9oUTwnSfPtS59ZJ7+S
         h14w==
X-Gm-Message-State: AFqh2kqG6hOFThIl2suH9udVkOoGlqt0hblof11dbH/K/oNOyBqTepzq
	IHJrKV7OvyP8cpnP0Rnik37gC5fWeAY=
X-Google-Smtp-Source: AMrXdXtBJtSFjDvd+tEKeroo4rlbneH5l+K+HTCDwQ7LNibIc+cAzkuTh9IotDPhn2l/gjbk/m3wtA==
X-Received: by 2002:a05:6a00:2986:b0:58c:8bdd:2e3c with SMTP id cj6-20020a056a00298600b0058c8bdd2e3cmr5927506pfb.20.1674017092407;
        Tue, 17 Jan 2023 20:44:52 -0800 (PST)
Received: from localhost.localdomain ([45.112.3.15])
        by smtp.gmail.com with ESMTPSA id i1-20020a056a00004100b00581a156b920sm8682770pfk.132.2023.01.17.20.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 20:44:52 -0800 (PST)
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
Subject: [PATCH v2 3/9] arm64: dts: amlogic: Used onboard usb hub reset on odroid c2
Date: Wed, 18 Jan 2023 04:44:11 +0000
Message-Id: <20230118044418.875-4-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230118044418.875-1-linux.amoon@gmail.com>
References: <20230118044418.875-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_204452_910400_DC7EA297 
X-CRM114-Status: GOOD (  16.64  )
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
v2 - drop the vendor name from compatible string.
   - move the hub node to USB controller node.
   - drop the usb_otg_pwr since it only liked to OTG port
         and link p5v0 to the vdd-supply.
---
 .../boot/dts/amlogic/meson-gxbb-odroidc2.dts  | 26 ++++++++-----------
 1 file changed, 11 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
index 201596247fd9..01356437a077 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
@@ -250,21 +250,6 @@ eth_phy0: ethernet-phy@0 {
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
@@ -414,5 +399,16 @@ &usb0 {
 };
 
 &usb1 {
+	dr_mode = "host";
+	#address-cells = <1>;
+	#size-cells = <0>;
 	status = "okay";
+
+	hub@1 {
+		/* Genesys Logic GL852G USB 2.0 hub */
+		compatible = "usb5e3,610";
+		reg = <1>;
+		vdd-supply = <&p5v0>;
+		reset-gpio = <&gpio_ao GPIOAO_4 GPIO_ACTIVE_LOW>;
+	};
 };
-- 
2.38.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
