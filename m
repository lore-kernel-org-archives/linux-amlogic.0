Return-Path: <SRS0=lgrq=RV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC15AC43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2019 10:12:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E30D2075C
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2019 10:12:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UaepSqIa";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="BpmL3z6K"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E30D2075C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HCpNkFOF/WlriXfDwqKPWm+zVChBG3gHzWp0oYs4S3A=; b=UaepSqIaJ/buk2
	PXq1RDeCviPvwS0yX9n6wmkW/6BqQBwFjcN4muHocf3S5FfNWzfVnaEFrLhoC37pIreevz6aCDfhw
	Pbsq45/5a3GmsCKRygINLjlb1sz1FA5N+Cyx2di2kGpJaWowtGTpAeQ1VqTOcJ9PfLPiJ9domtYRC
	Pu9N18L4nohedhmPmpMVmA42ZTPgIwHNzAWmWtYKYxqmnyOmx0yx6XhoQIchPwP0mUc8gh2AW3FpV
	wrm2k5RcYiaIU68XdNcnVCwstu5xyPBEMtFpTuJExW0NGI83K3RsV4Nr6JUezj8hnvRQ2DCKyievO
	tE3ncg5X3KDjCIpsGZ+A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h5pFe-0007fs-NC; Mon, 18 Mar 2019 10:12:14 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h5pFP-0007Mv-In
 for linux-amlogic@lists.infradead.org; Mon, 18 Mar 2019 10:12:00 +0000
Received: by mail-wr1-x442.google.com with SMTP id g12so16322681wrm.5
 for <linux-amlogic@lists.infradead.org>; Mon, 18 Mar 2019 03:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g6ocBA+5CcZLFehmuenX/brSnm02yANlgkqtJdTZvaM=;
 b=BpmL3z6K1oIo81odcihCKBfnXDjGvWfD2Kr6RBNXQ41EaMVoG/4LYFi+jourMJhqQF
 r9GSz4WyqhrJz07lssaq4sY27oxLWCQfi4P9EYsnEXQa/x3KhxMiTaylM09YuZIwlH9k
 T1AJ5ZGgGqXb1qrF581kM/r1XR8/BW//YpaLwquMtuwCXHiW1aSodQ0nYg6PF0LIZoK0
 5hqV2Kxw6CVan35XSUZW43hos9+fECW1UoBfbHvlM+2sV2Or5+rD8e9vpip2ExposJbP
 Atq/fXxH9fR5KmQOlt7D/qzVw1aCCXWrjZ3LD6VUOfxwzw05kHLew88EyTu1sYanb1+q
 SS3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g6ocBA+5CcZLFehmuenX/brSnm02yANlgkqtJdTZvaM=;
 b=bykivoPjDw0E4FprvQ+myxRweMTsAo8fTtu+BYIkHPlY+n7uMi06AuEf4EZl2RIpKU
 mGZnGOARRyNsf28TaSbudU4KxKdA90uR2M7p/ixh3z9HZJ0TrvVz23qzXl+CLS25zWai
 MMe5YTuIUaxgLb+ydYwMVnpPBeKLitW15XHueLMxJtkx4fHtWvI0BZ3djiPYwojlZEIl
 y/Ka+BmTsPxlj7Rx7Ba7tymf47R1DrroPOJp8pLOp+NRzUcfdxW6JAXt6YN4bXqtgSpM
 PkU/5EFUk7S6V5Yd4sza7YfdUWbW+VJBjTmbQfzE8cbih488642uZ1iskdA/C5dCLpSD
 q9lQ==
X-Gm-Message-State: APjAAAVBNTI/eFPfgX9f3Hz/rxjTrXrNhusV6bPEG/EyLO/UnwddO/8E
 stKy7vXWlS1u4qeZ/wytG4j5QA==
X-Google-Smtp-Source: APXvYqx1AJ63n0tl2hlTrLnOloaBnlcu/datzW+s5d7DVDtnk2hh1NxTKTlVFSL5kIbF5w/Osfwfmg==
X-Received: by 2002:adf:822d:: with SMTP id 42mr11907063wrb.162.1552903918168; 
 Mon, 18 Mar 2019 03:11:58 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id z8sm6697855wrl.59.2019.03.18.03.11.57
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 18 Mar 2019 03:11:57 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: gregkh@linuxfoundation.org, hminas@synopsys.com, balbi@kernel.org,
 kishon@ti.com, devicetree@vger.kernel.org
Subject: [PATCH v3 2/8] dt-bindings: phy: Add Amlogic G12A USB3+PCIE Combo PHY
 Bindings
Date: Mon, 18 Mar 2019 11:11:47 +0100
Message-Id: <20190318101153.7531-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190318101153.7531-1-narmstrong@baylibre.com>
References: <20190318101153.7531-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190318_031159_614833_DEEEBF32 
X-CRM114-Status: GOOD (  10.85  )
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
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
