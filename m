Return-Path: <SRS0=/5FS=RH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 111B4C43381
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Mar 2019 10:39:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D40E520663
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Mar 2019 10:39:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eT00NwfH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="SB9Cs8Nr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D40E520663
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BiP8QoVDtr1BFy6Mi7Iz0cg1j97wy8FUO5V/kOtMMTU=; b=eT00NwfHy6cGY6
	Nxn405WPOLCwDaNMXSPL7N2467BmYZ3MTp9miB094ytLMLHswlK3WuYud2Lf2Q00wNcjZTIViCH0S
	RpeBYQ/JTmKeGACTTGzhOMITfbclLuOsmDvS1oG4ZIKTZLYf2BOi3RPMez1wDgbE3CTW/D8uEKgrN
	Da0tLy+bJUCi4DiJqFg7XzGqs6XZa5i0k6/vl4xqis0kqqyYI4SAB1Vs1FsR59WyV4WfdQV19VA1E
	UvmxQGP5iVJpKa09NuZ0PJ058aP2gcKJLVtZNu0PUJ0ggRuOR1dJy7/NCy2Dd0FETMAAuivkK9oFm
	lFK8ydUuZmJpYuK9Q42A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h0l0R-0002ou-4f; Mon, 04 Mar 2019 10:39:35 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h0kzl-0001v1-0n
 for linux-amlogic@lists.infradead.org; Mon, 04 Mar 2019 10:38:55 +0000
Received: by mail-wm1-x341.google.com with SMTP id o10so3679391wmc.1
 for <linux-amlogic@lists.infradead.org>; Mon, 04 Mar 2019 02:38:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=72v4hanMqXDrgOzm+tqI3X31HXue2r+EANQzMeKqzLE=;
 b=SB9Cs8NrcFoAysdT5wqeIpNirIvYRpHeUMRbI9E+2sthBPc7xfD1weWTfYu8CYHWOM
 YPd53BCc3lCMKuXBS6b3CwXNKvDGPGhrxYyLxKL1ybpJJTNgaukyhZnsSLXd1u5VTm+o
 uQOF/X8RKPUemDRtiD615+lctc7nzWcGXIn2UTpgEIAebsBG48/Lgm90UYYfaIsOOJaL
 VYmFJjcvK90pO7w+T3Qjm8UcPws+kL1qvdK3U6jFFvQK55zPtK1dwBCFLUWoJ5H9TR0S
 uOFJ+8okCGFe71b3Q873dQpKaV3xV6PQ0k9P3HifOElX4qwh9ElY7s1tXlId5mmohFSp
 m+Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=72v4hanMqXDrgOzm+tqI3X31HXue2r+EANQzMeKqzLE=;
 b=mkSQj1Ss2gDKhwhfVsCpYiDvh4P60RbuD11CSnkmZ28MU0RsLCraYDY1/k9C/u3S4P
 moV8mWKyvM6g2zjg3DVAFZmPjAtfpq0JD7rQdd0lQRo5yiOV8i5xA0mhbdgRw1wHgB74
 2nlbvHu34CvW7h5mc50/CyvTWtg9dpIu91DdvcTyr+Le5qI82yZf9uGICQeMX2P7WG4C
 5OtcWm61sIf6ChSCsRQXFLlm/xhUgIinmkMfXfcbbIVPVpI4IWZZwm0AmQFVho1KT6pi
 G6WogeYjJBbRZ8nHdBbnzNsvPslh2VG1NZYhb9sxAtDha3w3fNnXy94fmIpoxBd+jZwj
 zBEg==
X-Gm-Message-State: AHQUAubgY35eexBMnNSWS9G4B+8xR9djhgLoO+Zcdl1WJ3PdX1bMXfqA
 jT+Hysn+n5xCWsjGGC26KKrD4w==
X-Google-Smtp-Source: APXvYqwme+spwSChOM2OAQ1d4kRmi8GdP+TLE1UI9LgqzH9IUaC6HNhNDEmhNlB+8YvfArxsiseH+g==
X-Received: by 2002:a1c:3b06:: with SMTP id i6mr10555237wma.55.1551695931563; 
 Mon, 04 Mar 2019 02:38:51 -0800 (PST)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id g24sm5505676wmh.45.2019.03.04.02.38.50
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 04 Mar 2019 02:38:50 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: gregkh@linuxfoundation.org, hminas@synopsys.com, balbi@kernel.org,
 kishon@ti.com, devicetree@vger.kernel.org
Subject: [PATCH v2 2/8] dt-bindings: phy: Add Amlogic G12A USB3+PCIE Combo PHY
 Bindings
Date: Mon,  4 Mar 2019 11:38:40 +0100
Message-Id: <20190304103846.2060-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190304103846.2060-1-narmstrong@baylibre.com>
References: <20190304103846.2060-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190304_023853_282773_41354DA8 
X-CRM114-Status: GOOD (  11.06  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the Amlogic G12A Family USB3 + PCIE Combo PHY Bindings.

This PHY can provide exclusively USB3 or PCIE support on shared I/Os.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 .../bindings/phy/meson-g12a-usb3-pcie-phy.txt | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/meson-g12a-usb3-pcie-phy.txt

diff --git a/Documentation/devicetree/bindings/phy/meson-g12a-usb3-pcie-phy.txt b/Documentation/devicetree/bindings/phy/meson-g12a-usb3-pcie-phy.txt
new file mode 100644
index 000000000000..7cfc17e2df31
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/meson-g12a-usb3-pcie-phy.txt
@@ -0,0 +1,22 @@
+* Amlogic G12A USB3 + PCIE Combo PHY binding
+
+Required properties:
+- compatible:	Should be "amlogic,meson-g12a-usb3-pcie-phy"
+- #phys-cells:	must be 1. The cell number is used to select the phy mode
+  as defined in <dt-bindings/phy/phy.h> between PHY_TYPE_USB3 and PHY_TYPE_PCIE
+- reg:		The base address and length of the registers
+- clocks:	a phandle to the 100MHz reference clock of this PHY
+- clock-names:	must be "ref_clk"
+- resets:	phandle to the reset lines for the PHY control
+- reset-names:	must be "phy"
+
+Example:
+	usb3_pcie_phy: phy@46000 {
+		compatible = "amlogic,g12a-usb3-pcie-phy";
+		reg = <0x0 0x46000 0x0 0x2000>;
+		clocks = <&clkc CLKID_PCIE_PLL>;
+		clock-names = "ref_clk";
+		resets = <&reset RESET_PCIE_PHY>;
+		reset-names = "phy";
+		#phy-cells = <1>;
+	};
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
