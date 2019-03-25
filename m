Return-Path: <SRS0=Y5gA=R4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E961AC10F03
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 09:40:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B940020863
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 09:40:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pAEOYr35";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="wHo/2/uZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B940020863
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j2tT5tViAlFxBV1SqAx0BBHb4UkQiOvVb0ve9gEU1Xo=; b=pAEOYr35u520wg
	0W86OxsGEJCXm+FPAFs4exRbwi312O2D5IMA6k5N9moNT5ab1SwjGReoIVtwYjLHiIgQrEhKdiOLo
	fq2PiwamVVboYs+F0j76bbIrDBEDcRQUsJnkl0Ivsf3+tBlvq+jOynUrkRjwAAvInXJsBJSHOjH6k
	Nj2N5P/aBCRdRUwUb7H8qJ9aOG8Zfo/uMOQTYq+t/nzMKvSrYJIaBW7bQ5BvGpdf6lrqWH0XjY36R
	uZbdZCQkn09ecHHX3+sF9drXQis2pXkwwB1vMY2bvbX8CO3JAi9+wVSFaTP5wrMZlsBOdQKQfGwv3
	gWSs51SP53ZTf1iodrTA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8M5P-0003Po-51; Mon, 25 Mar 2019 09:40:07 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8M59-0002oy-38
 for linux-amlogic@lists.infradead.org; Mon, 25 Mar 2019 09:39:53 +0000
Received: by mail-wr1-x441.google.com with SMTP id y7so5136300wrn.11
 for <linux-amlogic@lists.infradead.org>; Mon, 25 Mar 2019 02:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gVIrPdOFdZvdnroywufsY+QsNjB1DOvF/UDjdy0FiHY=;
 b=wHo/2/uZgXxm+xw6/nHYKVfXM1qkY/ErPBMa2PYelMs7twOKz97S2oNvRX8AOi21Gy
 EFWO93IYeW5Hf77WSES6WCShjHUbmPlzVDVfyLV6MNdDr9z15RpIrnBkn8sUI9ua1hUT
 7XAhQ71P3GLWB3eyVj7eoe7nU78YWlwlSxLhOvwoJsQ6nt5FdyydSXUeZvi7CJAjyY7y
 FrlNuwGN/yfp2J1bRrXcOfajBDovrer3hkcZqDQIRsYIN0nq2roxErvfI+vfpwHByO+s
 OlLSeVMwLqk62qtVnWTZM0h5Bu4mdO8xUty2fkBCY9mVEpZJ+/zRp+SnzDzmr8mDoAEi
 zBHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gVIrPdOFdZvdnroywufsY+QsNjB1DOvF/UDjdy0FiHY=;
 b=UvD9d07kfkpuY394gyTtoO0/2YyFX5Gwmde+0mxDLI5gh6pBYOh5/sDa9moR4HWRbS
 lfmJKBtQct1Ro5FwaXl+7pSFhBBEsCOmEbFc7JYoO9nyaTvBbyRb6ZkPFvKu1CCWNL+Q
 pquQXBv4poC3M2TftFhfJ8pq+htOEEsBYulA5y/2tpGRXBLT0zRt4FZgkoEGVMv04PSp
 A34lXbzA3tq+9B/CWWPAzjwB/MEQPdFluhBNShFUQeF9sm+zAqbqeavjD4oCKlKDV5Ck
 V8aA/2DMJsIcXQS3BavYDPSiDrMXSPEPxEHrbMFqP9bOhcPZnJ3E9XJFx8DLGYOHgHJC
 NxkQ==
X-Gm-Message-State: APjAAAUpeaWawD2XWeP1BKvCMCF9MsgSPApZgLw0zS3fmAqFlRERi3G8
 +GXGUvnHCOOW+EoZ2DTMTQP6zw==
X-Google-Smtp-Source: APXvYqxwz/TOn5DsU4AZsdlDrmumTaQph5bp62v3v6MVqtZfZ8nFKu+fGvjFZuZMOw+Mq/vfV6PAUg==
X-Received: by 2002:adf:ec4e:: with SMTP id w14mr2332205wrn.53.1553506788719; 
 Mon, 25 Mar 2019 02:39:48 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id k14sm13044652wmj.26.2019.03.25.02.39.47
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 25 Mar 2019 02:39:48 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: gregkh@linuxfoundation.org, hminas@synopsys.com, balbi@kernel.org,
 kishon@ti.com, devicetree@vger.kernel.org
Subject: [PATCH v5 2/8] dt-bindings: phy: Add Amlogic G12A USB3+PCIE Combo PHY
 Bindings
Date: Mon, 25 Mar 2019 10:39:37 +0100
Message-Id: <20190325093943.29138-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190325093943.29138-1-narmstrong@baylibre.com>
References: <20190325093943.29138-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190325_023951_136009_945E5B78 
X-CRM114-Status: GOOD (  11.01  )
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

Add the Amlogic G12A Family USB3 + PCIE Combo PHY Bindings.

This PHY can provide exclusively USB3 or PCIE support on shared I/Os.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
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
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
