Return-Path: <SRS0=lgrq=RV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0865EC43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2019 10:12:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCA102075C
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2019 10:12:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WadS9czM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="uZiehy1P"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CCA102075C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+bmsJrSgqtHTB4phFhpjeYXC2HoBno/whyRsODzUhcs=; b=WadS9czMR83gQG
	gHZ2XK4hyLiOJkJrfyPvre2hEz6iPd39gngxngS2SzKErud0RiqTgX/QZePSM4Tpvrxf2KcgkWCjQ
	ounDhIyYabMp0eGrx/344TizVegKofKKTYMM1n11RNsQG0x/MK0vKvMpDC8nWrqIp1H3qzMguM1Ti
	fYxQaN9F2bNiSA+xEKwzuJhMm1ZUtiCS+N2PdDrUg0UFkSH23nH1rH9bExtxNwFCuZrDgbblEr0Mr
	o+irIZYpIa79R+iGB41I3EK68H6im2LiMZ9DU09xRzrj3AmMgluNJR4OcFchlTPoNIDwen30YUhC4
	HYvCENdxGXBOBwZqn1lw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h5pFc-0007dc-HG; Mon, 18 Mar 2019 10:12:12 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h5pFO-0007MZ-NY
 for linux-amlogic@lists.infradead.org; Mon, 18 Mar 2019 10:12:00 +0000
Received: by mail-wr1-x444.google.com with SMTP id s15so950223wra.12
 for <linux-amlogic@lists.infradead.org>; Mon, 18 Mar 2019 03:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S2taATSeLwYLlK3AoeIDGHb1SmDZDEtC2Zy8s96NWr0=;
 b=uZiehy1Pkj8HeRnG8b+OAw61mBfpoetMn1l7ItxkS5UIHofyDCMYNNa57xIAKvV3H/
 zgvF24rErH0zumgH3DZU162mdwHHwolJ8xCSLAajEG6oFUAhZb4krrCDZBI2gtnJY9P4
 pP8V3DgBc51x3+Jh/xUS77339Q4Ylrt35xZpOE6p0FnE33RgcIhFatwcJb3HAdrIbLrg
 tM7dlmLnz6IRyi9PfLNKMg+IAoHp7aKGp2kpGKotUveF7/6VWAu33LHOfYnFXB+Q2YXu
 OeLyi+W67Itao4mjZ3IczGWLwZ8PSkBWQUvdXeYPHUz6HE5zoI3DpVlwyGajO0X45qEF
 jfug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S2taATSeLwYLlK3AoeIDGHb1SmDZDEtC2Zy8s96NWr0=;
 b=IyvUM4nNP809sljUaJpLh1+/t7q/dW9PcIyCad+KAtIbpvj/zmdZhmTlt/LtAPyT8O
 AWQdnBBpBk3Afl7o90T0Mha1ca5tEtGgvGbuT/mE3s5DJmifgXiwtL/MR1lTxoHO6wD7
 2GgChwwhxp9wJm+BVova1HyQLqkR8jAu7WqAxtlQ6j+9VjqFzpYbO9rjiVfBRSp3UtHG
 nmN73lLhurcoRGjKA9UIw64h7Y/zLbzVUqbsXKyinwyRUYWlx4M0TbroVHzSMxdNuR02
 HnReC9+4QAtoy/k7aEKAOdi20V36fZIN7GD2CbVa2D9BPRPgCpRbGkUou7n4szq8EQ3U
 VA9A==
X-Gm-Message-State: APjAAAUbiMQoK1nCufG9zPQfiwrNHzs+HwSLWh1jSKZyyGCgiIC5GcPN
 EdEelbNHCjo1ma+dPJxBN58AZQ==
X-Google-Smtp-Source: APXvYqx4UUWMu3ithhWuFDOAOqWDb3jZ0Zk8xcYwGo0XAgJTOH3zTeBLW6l44V0yX3JPiGrPSnu4NA==
X-Received: by 2002:a5d:530f:: with SMTP id e15mr409937wrv.19.1552903917127;
 Mon, 18 Mar 2019 03:11:57 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id z8sm6697855wrl.59.2019.03.18.03.11.56
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 18 Mar 2019 03:11:56 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: gregkh@linuxfoundation.org, hminas@synopsys.com, balbi@kernel.org,
 kishon@ti.com, devicetree@vger.kernel.org
Subject: [PATCH v3 1/8] dt-bindings: phy: Add Amlogic G12A USB2 PHY Bindings
Date: Mon, 18 Mar 2019 11:11:46 +0100
Message-Id: <20190318101153.7531-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190318101153.7531-1-narmstrong@baylibre.com>
References: <20190318101153.7531-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190318_031158_762380_C74C6E64 
X-CRM114-Status: GOOD (  10.81  )
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
