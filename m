Return-Path: <SRS0=lgrq=RV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50838C43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2019 13:27:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 231BA20872
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2019 13:27:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="r2q/nRrc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="k9psut69"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 231BA20872
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HCpNkFOF/WlriXfDwqKPWm+zVChBG3gHzWp0oYs4S3A=; b=r2q/nRrcGr6Dpq
	NGPDYwUGr8GPhY1SVrkiZQsgZwjNonNxyCSRmqrO8erMpIElz1xarBW91MYhO2rhcqqBjNCoCkqJL
	yr7+YOu0F+HbhwovaAMaZZphNE/qsFgx3SucaP5MwQVsDMdthb7XJq0gu2iAZlk6Nh47v8KRnPS1+
	nfvC1EYe14cAq448AhiKmCxS9ezRt6dsNMOHNLZ1W096Zn1nRWN6gYi2qO6zSzzX/b9ThT7Ta377m
	O2Z9TSvKgq2YbjMs+c7fKd0zL3RiHCzAbbZsb67GYRNYvR7nn7hWW428kn2otwEX58OwHUkejBOGD
	BI82c/oa4mnSgPQZ+I7g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h5sIm-0005AZ-Sk; Mon, 18 Mar 2019 13:27:40 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h5sI9-0004Mp-U7
 for linux-amlogic@lists.infradead.org; Mon, 18 Mar 2019 13:27:07 +0000
Received: by mail-wm1-x342.google.com with SMTP id f65so13007967wma.2
 for <linux-amlogic@lists.infradead.org>; Mon, 18 Mar 2019 06:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g6ocBA+5CcZLFehmuenX/brSnm02yANlgkqtJdTZvaM=;
 b=k9psut69Jf3ozrHv0nsInX4d37vW2Pzw8gdMlerCQ8c8oB5YYt19lCo2mTOLbWFd+i
 3dDLFHpE5CM1ZsWuqpzZBglObWO850Wkht7TT7LAfOL3C49G/sQypf7GIj+TH3X24jqR
 Q8daGAVWcgIYH5s63loThbf0HKnGl+zBD0NDMQPDpprdXcpZig6PXGqQm+gy/qo6mJYP
 Z0t8P+JF51Q5Qefsm2KdvPZkvqj14GSAYEhW1nkorEDzCeRxFE1p85M8cpeTgvgHUAKV
 30yYmOhohJHwJNVe5MvnbWhM4vJV/fWf5rxcSkHhy+ni0/ai27gdG0KXvfD0QL+JUsYA
 /dXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g6ocBA+5CcZLFehmuenX/brSnm02yANlgkqtJdTZvaM=;
 b=Dx/BVXlTz7gEQwjcu7qdAQRq4tL1bt36e4+Os08b9AGR8/niiIc1zlNTQsQFjro7Pi
 +oMs/P7kanfYiopD+cvLbx5fiI3SYZKSMdlCawyTAHmBpwrwGcuxDidF7Prhq2iqqWPp
 mSteopuWMFo1EGHfuZSSY76fjsQYbdpa2yYurVse4lmEodcmMzDnIUCGh8fiIJuQSWZL
 R2XhxtUpLSJ6yYoHiTo99xxFnxqbB/BfvzrvUPDGpNAlo4m8/9JFzzKb7Ty3VMhJJVVb
 2RLFmLU+g5sbmnZcqaFNZ8vwQDI1YpqiYKsXGco9d1g1lIWGnC9uRVkXT6cmAc7lIiAf
 zyIA==
X-Gm-Message-State: APjAAAV7W1b5mtrS1Bo1XoN0B85NZ0C2wTZ9LyeY3SKklduO+umxadBy
 F3aBtqUAvz7SHvTudNiwld7XKA==
X-Google-Smtp-Source: APXvYqy+438qD1uat7C6Dyw/bxfXr8AGTdadgnhWoXqIOwdUSthgwxA/qN2Mqb7oObjkcqc98xkXKw==
X-Received: by 2002:a1c:234d:: with SMTP id j74mr10395413wmj.130.1552915620192; 
 Mon, 18 Mar 2019 06:27:00 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id j128sm10421601wmb.43.2019.03.18.06.26.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 18 Mar 2019 06:26:59 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: gregkh@linuxfoundation.org, hminas@synopsys.com, balbi@kernel.org,
 kishon@ti.com, devicetree@vger.kernel.org
Subject: [PATCH v4 2/8] dt-bindings: phy: Add Amlogic G12A USB3+PCIE Combo PHY
 Bindings
Date: Mon, 18 Mar 2019 14:26:49 +0100
Message-Id: <20190318132655.30040-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190318132655.30040-1-narmstrong@baylibre.com>
References: <20190318132655.30040-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190318_062702_235649_CB3C38D4 
X-CRM114-Status: GOOD (  10.63  )
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
