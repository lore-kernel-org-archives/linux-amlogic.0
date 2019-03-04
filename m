Return-Path: <SRS0=/5FS=RH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8883C10F03
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Mar 2019 10:39:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A68A420663
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Mar 2019 10:39:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EPXK/Vct";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="g4/2160H"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A68A420663
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+bmsJrSgqtHTB4phFhpjeYXC2HoBno/whyRsODzUhcs=; b=EPXK/Vct7W7HPm
	fGvzXaZcm6MXkTMDJCf6lkXnuUyiP8VYJ7lGPukOT2/bcuXCyGCYpsVsiZePzzerdRqLzRHhJbp6X
	pAjeONnQjJFMoVxZ7SnhGBuQgfZoxAGkd1sZKwy5S4iQSGjQJJzJdG8inYv8CztLY/f9rMOxwt6eW
	6dTpEj+Xd3VDHx18GEq8yH1HIGSsqSvSeS508+m1FvXG0voiYVZxiFfXTrXCggA5o1tnedmJG7DEs
	GFaYTn48hauOK88tp7+r4bo6S2Yk38CRIkHsu/A4UiAWajGp4ipujIkUtlP2iFuWy4Ix1mb3cUzaO
	ASYyxxha9UWkXrs2M6Kg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h0kzy-0002CO-AM; Mon, 04 Mar 2019 10:39:06 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h0kzj-0001uV-SF
 for linux-amlogic@lists.infradead.org; Mon, 04 Mar 2019 10:38:54 +0000
Received: by mail-wm1-x344.google.com with SMTP id o10so3679356wmc.1
 for <linux-amlogic@lists.infradead.org>; Mon, 04 Mar 2019 02:38:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S2taATSeLwYLlK3AoeIDGHb1SmDZDEtC2Zy8s96NWr0=;
 b=g4/2160HSfKd8XRPPiSf9tpXJNBsPMIW29lKAkxpAzVxSTCo1+odo8nErsED55c3Hd
 Fk6vKBtvwF4CTbqskJVFHe0jucEtvzFfGxZ5xE8+eZUqsuWxQ9+lajW6h8UT+03WPeyC
 oFfp8zV4pIwGexIOQKQRHn+XWtx/wqdmpT2EuBiycznDrtYlXpr+mdppI22RR+dWXNwR
 IRG6o+p2ACi7EGjvNSv63f4U+ClhyHz6FCNRr4m+kLgcQeI9h6OSP+NAJv9FRQwpaAiT
 ItNAjs3SHTwFC8YKLoIKVaYn9+5Mg0Vzm3cYZaCMGJ+fxJkQ4SEikQLEanQO/GdiVZ8v
 zbJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S2taATSeLwYLlK3AoeIDGHb1SmDZDEtC2Zy8s96NWr0=;
 b=VyMjZ/cHHuQS1ZZs6jkSfbqe+D8Dj8++zbgQI1rCJTkIrC1pvzUfgHj9ANnRJuOvbF
 C3TbFVpHDC6MyQY+tXnjSPvoOhGSBeXEEzm8lPm6zaS8yHcCRZ7xSjLV3iQoywR7Xvcn
 s5RGh9CFt607sxo4Bl/XLoOlZRpF0BERj5XDJQn/UwonFwlwRIvmc04KrXHyM8uOsTh1
 wBtfartn9CxX7v8xgPGtwQks+il6sPdfECV+PS07D6nleymirvkGnn+iGQkUjmaXD+ZA
 fi0ckJ4va3YyivKJJcKUFVRbnQ4Gnxsz/3NoOby91NFcsku7Nb6PuxXuaUzGaFkP7A2M
 GlwA==
X-Gm-Message-State: APjAAAXrXGG57plSvfBWEyIMVpEFhbfCj0CUHNaGsi6sea6jQjjoXcZ8
 vItY11D4hdaDwA4Gh+1oYJXqKw==
X-Google-Smtp-Source: APXvYqyDJn4uyzB4Hi/bHTAo8UZVv79cmW8ylPRmDsbPLT+yF4S0bn/iUhQ4ChY6yO2EU2dOJVnNzw==
X-Received: by 2002:a7b:cbd1:: with SMTP id n17mr10432625wmi.21.1551695930410; 
 Mon, 04 Mar 2019 02:38:50 -0800 (PST)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id g24sm5505676wmh.45.2019.03.04.02.38.49
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 04 Mar 2019 02:38:49 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: gregkh@linuxfoundation.org, hminas@synopsys.com, balbi@kernel.org,
 kishon@ti.com, devicetree@vger.kernel.org
Subject: [PATCH v2 1/8] dt-bindings: phy: Add Amlogic G12A USB2 PHY Bindings
Date: Mon,  4 Mar 2019 11:38:39 +0100
Message-Id: <20190304103846.2060-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190304103846.2060-1-narmstrong@baylibre.com>
References: <20190304103846.2060-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190304_023851_907606_98CC6864 
X-CRM114-Status: GOOD (  11.07  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Rob Herring <robh@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the Amlogic G12A Family USB2 OTG PHY Bindings

The PHY can work in host or peripheral modes depending on it's position.
Configuration of the mode is part of the USBCTRL registers which are
outside of the PHY registers.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/phy/meson-g12a-usb2-phy.txt      | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/meson-g12a-usb2-phy.txt

diff --git a/Documentation/devicetree/bindings/phy/meson-g12a-usb2-phy.txt b/Documentation/devicetree/bindings/phy/meson-g12a-usb2-phy.txt
new file mode 100644
index 000000000000..a6ebc3dea159
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/meson-g12a-usb2-phy.txt
@@ -0,0 +1,22 @@
+* Amlogic G12A USB2 PHY binding
+
+Required properties:
+- compatible:	Should be "amlogic,meson-g12a-usb2-phy"
+- reg:		The base address and length of the registers
+- #phys-cells:	must be 0 (see phy-bindings.txt in this directory)
+- clocks:	a phandle to the clock of this PHY
+- clock-names:	must be "xtal"
+- resets:	a phandle to the reset line of this PHY
+- reset-names:	must be "phy"
+- phy-supply:	see phy-bindings.txt in this directory
+
+Example:
+	usb2_phy0: phy@36000 {
+		compatible = "amlogic,g12a-usb2-phy";
+		reg = <0x0 0x36000 0x0 0x2000>;
+		clocks = <&xtal>;
+		clock-names = "xtal";
+		resets = <&reset RESET_USB_PHY21>;
+		reset-names = "phy";
+		#phy-cells = <0>;
+	};
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
