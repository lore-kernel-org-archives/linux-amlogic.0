Return-Path: <SRS0=lgrq=RV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1C8CC43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2019 13:27:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56753213F2
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2019 13:27:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ry5p4dQx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="UxfoaKCo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56753213F2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+bmsJrSgqtHTB4phFhpjeYXC2HoBno/whyRsODzUhcs=; b=ry5p4dQx9mSQFL
	TVDMr6DzICu96bvTQCL7vYeU/FuhlLpVnDqBdQ+d8mjuCYB6QjoKjcN4LBMrf33J2bQRWbvJMN3T5
	7BXjf1Umf/GMYkEzX+GnOyW2e/cc5CIr+GYTN89lW8IhZJH1oXpCBMYEgoS9S+b9XMUwAinZZVfgp
	/FjcYrOWbpcHHevkpPxaPUMOjgAYe3wzFoq4g2LeztqB9wYgdNIQ7AwA7RS0BAnsLinzTWzxw0pJj
	5Yh6xFulrqqJYtPiuVZ81GJ+dNsRUI3rf8gY94d/pD16aEIpMaosz7Tvw4GP+cXOZ9oFaaLUVRI4t
	i5pqQu9MymKi4yZGYZoA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h5sIZ-0004s1-Ty; Mon, 18 Mar 2019 13:27:27 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h5sI8-0004La-7a
 for linux-amlogic@lists.infradead.org; Mon, 18 Mar 2019 13:27:04 +0000
Received: by mail-wr1-x443.google.com with SMTP id y15so17044533wro.4
 for <linux-amlogic@lists.infradead.org>; Mon, 18 Mar 2019 06:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S2taATSeLwYLlK3AoeIDGHb1SmDZDEtC2Zy8s96NWr0=;
 b=UxfoaKCodDKWM/fMLqfRLPZbMQ8mYOBpQVeNkESThMkjRtFNwenDw8/crEYok1ZT+c
 I3DbLBUoriYpbZfFJ4z1QH93cn44hzdy+u9n6t4V600opfh8oq9Pm4BMZp6EJCCBKazq
 FVObvP10p/bKKuDfPm2QwKo2+tHIfw3mcAeo3Jp6CPRm0blorH8WWkNUtafevy4o5bp5
 v0vfqY04BiL6K5xtVP50yqkVl1SJG3ZCo9z9FcYECoYKCJ3FF7Qjjw8tAJ4+ivcf/iu1
 1fO1u6VIhA3qBdiTZtrG9KA6ZVkzUB9iezOR2jv6xoU6wZ8pSTGakI+sjPpnDV4WEv2o
 mfuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S2taATSeLwYLlK3AoeIDGHb1SmDZDEtC2Zy8s96NWr0=;
 b=R10tFq6Q07MpxCbXjALsEfgE/DFWJf3QNXqUiodhKO0hu+JsQVb1YMyAh6bp0F9kxx
 oIKGLIcPeqBiwvzFHv2K3rZdp2TGpNOJ7DNBq4wXEX7ioVLbVnQ48EXmchCCIXHfgehq
 nqWTrqhioEOJ/Tf1YBf5yzPHgPvdB88ByfNc/d2Khdgo2/liMtmSME2LskLQlO2fVduc
 ML8L/4qyYEcf4phRldkfU70jDwKOynQUPkzdVm0R5t9U5vc9pGwHp7+5DYrA1e6lZcZs
 pP/mmCU/4cUdnzwJgMK90JGRKW9XjV9UnSSOYdTt5BJyY0dCU5UM0oAUobKBm7+f7ln1
 BocQ==
X-Gm-Message-State: APjAAAVJI57sTIi1YDhpl1vUnQxZ2rJlIsaBS+xpwTEeKqEstrPKm8lj
 ePTR2MGrRkUzAhrAStceQXuGmA==
X-Google-Smtp-Source: APXvYqyWketn5R+yzXKwlclGE7MSY9EAfsFayppYhUaNTbevks4EOVeGHkL8kSjZCZQWFTCZsl504w==
X-Received: by 2002:adf:9c85:: with SMTP id d5mr12098593wre.68.1552915618838; 
 Mon, 18 Mar 2019 06:26:58 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id j128sm10421601wmb.43.2019.03.18.06.26.57
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 18 Mar 2019 06:26:58 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: gregkh@linuxfoundation.org, hminas@synopsys.com, balbi@kernel.org,
 kishon@ti.com, devicetree@vger.kernel.org
Subject: [PATCH v4 1/8] dt-bindings: phy: Add Amlogic G12A USB2 PHY Bindings
Date: Mon, 18 Mar 2019 14:26:48 +0100
Message-Id: <20190318132655.30040-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190318132655.30040-1-narmstrong@baylibre.com>
References: <20190318132655.30040-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190318_062700_269807_1AE95CFE 
X-CRM114-Status: GOOD (  10.59  )
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
