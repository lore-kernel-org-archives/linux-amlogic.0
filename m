Return-Path: <SRS0=WAM1=5J=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41553C43331
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Mar 2020 10:24:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14A052080C
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Mar 2020 10:24:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LbJVA1H8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="G9GUxZPZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 14A052080C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yP6B2h3Mhr9Kt11QogJnpIoB/XFQMrElfmoZ+EGFrrE=; b=LbJVA1H86gef6G
	BBDsF3EtNydLOJfQ6cb0nyl0smzq59Txytpf6leValzDkuBmfD+rVADiC6ach2MEi8ZZ82GIyrkBO
	U/dqiI3sqHXGRk7Qrhd1E/7Xz6wrXjExy25tfETKA5H5OEpX4MLxW/fPNOzlw0XyO/SVfz5ZVY816
	h41IQhGzrGtfW8gqyoqiU3Hd5ohopswLnf4jySkU6IKruVK/jEPVYMLvKwIppcPTYo+d9MEfGE6oV
	wY6m+4k5P6eBD2WKw17WCUxnFU3Lm8TvWbGtoxluBvkPhuBadpaqNVNQs3qy1u3VcRba31ZfOwyVR
	WuQ5ouUVJ3vcfGNNV40w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jGgjJ-0005Bf-71; Tue, 24 Mar 2020 10:24:17 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jGgg5-00024h-1F
 for linux-amlogic@lists.infradead.org; Tue, 24 Mar 2020 10:20:59 +0000
Received: by mail-wr1-x442.google.com with SMTP id w10so20720315wrm.4
 for <linux-amlogic@lists.infradead.org>; Tue, 24 Mar 2020 03:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=67sFvVtkG1ivlSk+fGwbgHaYe6cmIRn/pWHBZ0lu9g4=;
 b=G9GUxZPZnPhLAajMtiZxgmUxpYrGOcJIkPozWgUDMvAuy8EBmZbwC30xlR9wHUDnJV
 ALFika3tbYFYgOcbEy6lLg62lZVK5VultjcamVietFmwqmduFKScAs2xljobVRPKpRXB
 i+0XwLWm2dPB3T/cVEbeziTgctq2IaB8JoXEKasglnWC/N+nQosrtmb+n8kp06GIIR0w
 30OWNQB2zwjvbXX5cMH+cNlV+3NUfzEfVtxBP2DaojGqjDvF5egj+tn0DSOrKutBLBFj
 t77PxOjT7DJ0Obl93NXUkDItQyzWrNOnIQ9JmQ3KbXHMtLKZy6nVXVOBML4RvL87vvDb
 rSqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=67sFvVtkG1ivlSk+fGwbgHaYe6cmIRn/pWHBZ0lu9g4=;
 b=kGEga4pnrlcFwKLEf7W8nVZwyRBbhxLkibxmIR3vJd+ttH+O9xhgidmJLZMzAu6PPN
 77OHuZdWXESiJAbT2qLqjoQukPIM9nV1Fld78rllRGB8SzIB6yKqcIwUXGyu4MRPL2LP
 qg+T5//ggdS4qDhpe0xUypqaGEowfTSjApqNPuxod/6A9Q5S7wjYq9QcjcIt3AAQakhD
 P0GBpDXy3TuA8fjOWhRiAehy6hFuksSElRwKWgk+lP2q5xIbHHEJsWh59vecA9srgDE3
 qILumKQXDha39lLo0Q6LzPgkv9Y0YSmFrN1sp5WXXBI+5+A//WZtNUMQZt6/yz1zcPKJ
 udzg==
X-Gm-Message-State: ANhLgQ3wwHaozlvEl15BeL7vop0d7uD1LwpUX8CjifHKCPby34V33dSg
 3wwNDZAGYfjxjM6ilyHTpWL2GA==
X-Google-Smtp-Source: ADFU+vuGwhRTHhtQBh24wMOPnFqWmD8WEDTDqhBcn0GQZbxNq7+HwZ5AGbojto+87MT0Z8I4IEGjhQ==
X-Received: by 2002:adf:fd87:: with SMTP id d7mr35578867wrr.393.1585045255321; 
 Tue, 24 Mar 2020 03:20:55 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5c5f:613e:f775:b6a2])
 by smtp.gmail.com with ESMTPSA id h5sm2879527wro.83.2020.03.24.03.20.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Mar 2020 03:20:54 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: kishon@ti.com, balbi@kernel.org, khilman@baylibre.com,
 martin.blumenstingl@googlemail.com, devicetree@vger.kernel.org
Subject: [PATCH 13/13] dt-bindings: usb: amlogic, dwc3: remove old DWC3 wrapper
Date: Tue, 24 Mar 2020 11:20:30 +0100
Message-Id: <20200324102030.31000-14-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200324102030.31000-1-narmstrong@baylibre.com>
References: <20200324102030.31000-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200324_032057_104104_3E8D9FAE 
X-CRM114-Status: UNSURE (   9.23  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

There is now an updated bindings for these SoCs making the old
compatible obsolete.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../devicetree/bindings/usb/amlogic,dwc3.txt  | 42 -------------------
 1 file changed, 42 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/usb/amlogic,dwc3.txt

diff --git a/Documentation/devicetree/bindings/usb/amlogic,dwc3.txt b/Documentation/devicetree/bindings/usb/amlogic,dwc3.txt
deleted file mode 100644
index 9a8b631904fd..000000000000
--- a/Documentation/devicetree/bindings/usb/amlogic,dwc3.txt
+++ /dev/null
@@ -1,42 +0,0 @@
-Amlogic Meson GX DWC3 USB SoC controller
-
-Required properties:
-- compatible:	depending on the SoC this should contain one of:
-			* amlogic,meson-axg-dwc3
-			* amlogic,meson-gxl-dwc3
-- clocks:	a handle for the "USB general" clock
-- clock-names:	must be "usb_general"
-- resets:	a handle for the shared "USB OTG" reset line
-- reset-names:	must be "usb_otg"
-
-Required child node:
-A child node must exist to represent the core DWC3 IP block. The name of
-the node is not important. The content of the node is defined in dwc3.txt.
-
-PHY documentation is provided in the following places:
-- Documentation/devicetree/bindings/phy/meson-gxl-usb2-phy.txt
-- Documentation/devicetree/bindings/phy/meson-gxl-usb3-phy.txt
-
-Example device nodes:
-		usb0: usb@ff500000 {
-			compatible = "amlogic,meson-axg-dwc3";
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
-
-			clocks = <&clkc CLKID_USB>;
-			clock-names = "usb_general";
-			resets = <&reset RESET_USB_OTG>;
-			reset-names = "usb_otg";
-
-			dwc3: dwc3@ff500000 {
-				compatible = "snps,dwc3";
-				reg = <0x0 0xff500000 0x0 0x100000>;
-				interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
-				dr_mode = "host";
-				maximum-speed = "high-speed";
-				snps,dis_u2_susphy_quirk;
-				phys = <&usb3_phy>, <&usb2_phy0>;
-				phy-names = "usb2-phy", "usb3-phy";
-			};
-		};
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
