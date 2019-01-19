Return-Path: <SRS0=rSxG=P3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41858C61CE4
	for <linux-amlogic@archiver.kernel.org>; Sat, 19 Jan 2019 14:44:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D9502173C
	for <linux-amlogic@archiver.kernel.org>; Sat, 19 Jan 2019 14:44:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IDz8jsQt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="Nnh2Lig1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D9502173C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LtrzgYszLWcpr4BdAdROD5mu1OfxwI7sD3c97wTohRc=; b=IDz8jsQtRRTfM4
	fwC+MhT6sRWgRScI1/4okiRHmYLGhLhBYz8uae7m0SpeAwBgr8CnE2Mo81Ck3+SSC6glNi6m/vr9l
	5n3xQnGl3Im7L5sR3Z3bZPPoYIh/S9ps/ed0oSF2AVtsXXsgmwgKvY/Qw/rFWWMD2ttuhZLDdkxBV
	k/YqfYzfVEy/PE5E1RSCmx52M+sEpYQFcQiZUVlXGBEiT6Pg3OIqTSYVlQsh7s0Vj7RTh2e6rdOzT
	f5DSxuNF/8IxoD13kqBYjKIKdltDOVFb+dSxZbmV8zbE2b6cK2PhRNc3/ahyAVM/ckRXw5e5XuXsQ
	/IIosCJxTEmRWduy6vcw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkrrD-0005tL-1f; Sat, 19 Jan 2019 14:44:23 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkrqz-0005hm-9Q; Sat, 19 Jan 2019 14:44:10 +0000
Received: by mail-wr1-x443.google.com with SMTP id v13so18416600wrw.5;
 Sat, 19 Jan 2019 06:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v965bY0D36Opd3mmqvUPGRdQyL0pvZT1CqXXJhq8UPU=;
 b=Nnh2Lig13pFj8Ny2O40YfyIdjj/sMZNluZJASfgUi7/eDPECLPnl4uasJp3XgAjRRH
 gEhoQPqgFNisGiCccW63BjvScSTze/iygxvy9xwhpjF7tM2431ccGQuoqc8jkvvPCRhy
 DhR1u3SdySfaGUPsrCpmAWvEljoUGsCzNX/4sbkMaxNMe/79y5yl9rRBTj/KMON1YmDF
 8swRqVG8zh3IF8YXyRSQAWsPpNKvi/z32JxOP4y+knb8xGCvNS7MN2Fu09frCrR+PpRh
 umnhkNzOuWWfUBAQvY+EFEPIy+GZlwYxQZrgD2J5Po+XBe9slLKcj7NNL+c18e0sLql1
 TSkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v965bY0D36Opd3mmqvUPGRdQyL0pvZT1CqXXJhq8UPU=;
 b=IaNjsU/PMv34i/oyEJm9rEs4xE+P+KYH+uiucNq4DDl1Hh0KVaIjV9qlbtCrjZpQ74
 8w1bN5yGKmTaYMOXaHGakn9b2aADE/B7LWXQCHpxmHhOIIkQxLr57tEFnMxVk7vxJAWg
 5Sj8KDvnxDdTOjy5nOer68Gp48LBSH2pTxmqV2/oEH3SfyK6b1LRPFqfqrPXX1jcIcLy
 t9Ve1SbfKSvbuXQQunPVbBsuTyl9hPI2myHh/b38cWYy2B2uSoVy+ddIUqGRy2G23uFq
 H5jU2rs7D15l5MhCEam0UcvLj1i0vwlaR4Jdj0nB1ZkHkcrJZgE7dU86hLn1IFPNeReI
 Mcrg==
X-Gm-Message-State: AJcUukfzoyqm0zicGHDp6WxoqNAfN4YTDhCfbtna/4v8lU6cLwnh8nrp
 W4Y73coB/W4z8MRl3RMhcrINKhNf
X-Google-Smtp-Source: ALg8bN6aCCfzVYjp9rxAyKEpe41ounh8KxiHhOnxCgbhDHRIG+Zy04RCFLj+lOz2RvEnPDn06oyVqQ==
X-Received: by 2002:adf:d112:: with SMTP id a18mr21615284wri.17.1547909047111; 
 Sat, 19 Jan 2019 06:44:07 -0800 (PST)
Received: from blackbox.darklights.net
 (p200300DCD73A8100FDA9BD4E9DEACC2C.dip0.t-ipconnect.de.
 [2003:dc:d73a:8100:fda9:bd4e:9dea:cc2c])
 by smtp.googlemail.com with ESMTPSA id b7sm80452772wrs.47.2019.01.19.06.44.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 19 Jan 2019 06:44:06 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org, linux-rtc@vger.kernel.org,
 alexandre.belloni@bootlin.com, a.zummo@towertech.it
Subject: [PATCH v6 1/2] dt-bindings: rtc: add device-tree bindings for the
 Amlogic Meson RTC
Date: Sat, 19 Jan 2019 15:43:31 +0100
Message-Id: <20190119144332.11984-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190119144332.11984-1-martin.blumenstingl@googlemail.com>
References: <20190119144332.11984-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190119_064409_324976_9A2A4F47 
X-CRM114-Status: GOOD (  12.36  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 ben.dooks@codethink.co.uk, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, ccaione@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The 32-bit Amlogic Meson SoCs (Meson6, Meson8, Meson8b and Meson8m2)
have a built-in RTC block.
It has the following inputs:
- an 32.768kHz crystal oscillator
- an interrupt line
- a reset line
- 0.9V voltage input

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
[resurrected patches from Ben after 2 years]
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 .../devicetree/bindings/rtc/rtc-meson.txt     | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/rtc-meson.txt

diff --git a/Documentation/devicetree/bindings/rtc/rtc-meson.txt b/Documentation/devicetree/bindings/rtc/rtc-meson.txt
new file mode 100644
index 000000000000..23df3cf2dd73
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/rtc-meson.txt
@@ -0,0 +1,32 @@
+* Amlogic Meson6, Meson8, Meson8b and Meson8m2 RTC
+
+Required properties:
+- compatible: should be one of the following describing the hardware:
+	* "amlogic,meson6-rtc"
+	* "amlogic,meson8-rtc"
+	* "amlogic,meson8b-rtc"
+	* "amlogic,meson8m2-rtc"
+
+- reg: physical register space for the controller's memory mapped registers.
+- interrupts: the interrupt line of the RTC block.
+- clocks: reference to the external 32.768kHz crystal oscillator.
+- vdd-supply: reference to the power supply of the RTC block.
+- resets: reset controller reference to allow reset of the controller
+
+Optional properties:
+- #address-cells: should be 1 to address the internal non-volatile memory
+- #address-cells: should be 1 to reference the internal non-volatile memory
+
+Optional child nodes:
+- see ../nvmem/nvmem.txt
+
+Example:
+
+	rtc: rtc@740 {
+		compatible = "amlogic,meson6-rtc";
+		reg = <0x740 0x14>;
+		interrupts = <GIC_SPI 72 IRQ_TYPE_EDGE_RISING>;
+		clocks = <&rtc32k_xtal>;
+		vdd-supply = <&rtc_vdd>;
+		resets = <&reset RESET_RTC>;
+	};
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
