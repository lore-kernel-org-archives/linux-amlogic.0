Return-Path: <SRS0=lgrq=RV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2F63C43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2019 13:28:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A85D920850
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2019 13:28:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="A0bF7+F6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="THnHA3w3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A85D920850
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jrew7gT/BcrRcpoFB5kp84Gy/k4zm+TFOuBE07gdLR4=; b=A0bF7+F6ZihuGJ
	/08mnjSYjK0bEmti8oOE5JYfC2cJUWN4L9tYUJcPhBNbEe3cNdB+V2TQ6leB5mHnhvvXJ+CXVZVcT
	OKkzMWFhA68/lXFgCnRRYFSKQHeQbOTYWYd1CfYn2+add3U4X+GrotdIQGnJDRX7Fan+8FrCsdHcZ
	FYoJPMn+z0np3Xd3Uz8yEKqjSjK1MFUiOi7b9xwC/UHDOsmxYyqI+M1lKT3uJ6buvUyhGomCgmxnE
	9IJYkNzl6QxmeP9eP/Yz4dLtPWiYgPrrXzfs4MlPnrmLRPc4pZLdIXgu/FoCq5L+E/X6qXAQPgZT4
	wCKYbI9G4v7slOMSVKjw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h5sJB-0005hk-Ob; Mon, 18 Mar 2019 13:28:05 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h5sIB-0004Nn-3y
 for linux-amlogic@lists.infradead.org; Mon, 18 Mar 2019 13:27:10 +0000
Received: by mail-wr1-x442.google.com with SMTP id 33so17065273wrb.13
 for <linux-amlogic@lists.infradead.org>; Mon, 18 Mar 2019 06:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CUW/0oX1GPWgNe1zd7vEv15Hxq4TFiRMZCgKm/8ULe4=;
 b=THnHA3w3FzLurmZzpwYlGNfgWIpW4AYGQKVB7htGKxgXPnizpZxKtgY10dgBYjCGKF
 gTzsnpfMNYYm9okNuty/qRNY+s6wPALhxdE/x3WgtdhrnP/RXLE4nsLCXtZo1P+FndjU
 ZrHD9NifrbkAawPa3y3hYPg/7QgtKoazTc1BK5zEIuwozdLhZ7Qo3EmRN9ZICPGFbWP8
 aLla3WOX7cz1lghhc4D0Zo3ZC7HwqJdo3ESnB7M6RNDJDqQB8oslbIVQ1Q11fDjmWawP
 FjHoLRA0kAeqEk9M5ucAmc08txFAlRN4CPaPDsEsyNsDrjcfl2EJr/U/BlxsS2txkDAL
 EEeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CUW/0oX1GPWgNe1zd7vEv15Hxq4TFiRMZCgKm/8ULe4=;
 b=pKZVpQTB6uJMlgvGEJW5w2NymVhhYFi9Zy3CZNxJAJtXql0Gi7vyx6COp8G6Cq8B5l
 TwvOD7afC3OMIpM5C3lXdw0Q96icmjmjeWwTHNIbMslP7dcIRiwfoS+ltSc9F7QrgBfG
 vxdliMoXJkAbhyaZt0cTGx9DRnoq5kyH5/aIh+lPrkv73LHX4fQ6tqNxuCdoZQ8TEq92
 FFxM3il/d+XdChpxGr6Zrxk4PMMT016dV8wHhtKdumSKN60+11Bwev74lBKcjxJw9zyk
 jsvNizX+XQ04/vdB4x1huRl95jetIcBOQ+J9Pz120JhXZ+Y8qgb1Cnhjc7eUNPBkWk0l
 PfKQ==
X-Gm-Message-State: APjAAAW9j1bX9m1i/fzY1Efgr1R9cDNBCnQimzT+gNkGSYdqo8jioH0u
 VH5FzDEOgNnGllKHjBDjghHcXA==
X-Google-Smtp-Source: APXvYqxJYs1Pz/F/7+Pb8RKw4p5MJp3cMMuRa6H3DMuE5wC9SsJdkHoi/xktVkk9wUpYCKkDn+uqfA==
X-Received: by 2002:adf:eac9:: with SMTP id o9mr817933wrn.85.1552915621285;
 Mon, 18 Mar 2019 06:27:01 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id j128sm10421601wmb.43.2019.03.18.06.27.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 18 Mar 2019 06:27:00 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: gregkh@linuxfoundation.org, hminas@synopsys.com, balbi@kernel.org,
 kishon@ti.com, devicetree@vger.kernel.org
Subject: [PATCH v4 3/8] dt-bindings: usb: dwc2: Add Amlogic G12A DWC2
 Compatible
Date: Mon, 18 Mar 2019 14:26:50 +0100
Message-Id: <20190318132655.30040-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190318132655.30040-1-narmstrong@baylibre.com>
References: <20190318132655.30040-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190318_062703_455421_EF5BEA88 
X-CRM114-Status: UNSURE (   8.41  )
X-CRM114-Notice: Please train this message.
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

Adds the specific compatible string for the DWC2 IP found in the
Amlogic G12A SoC Family.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/usb/dwc2.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/dwc2.txt b/Documentation/devicetree/bindings/usb/dwc2.txt
index 6dc3c4a34483..e150b7b227c9 100644
--- a/Documentation/devicetree/bindings/usb/dwc2.txt
+++ b/Documentation/devicetree/bindings/usb/dwc2.txt
@@ -14,6 +14,7 @@ Required properties:
   - "amlogic,meson8-usb": The DWC2 USB controller instance in Amlogic Meson8 SoCs;
   - "amlogic,meson8b-usb": The DWC2 USB controller instance in Amlogic Meson8b SoCs;
   - "amlogic,meson-gxbb-usb": The DWC2 USB controller instance in Amlogic S905 SoCs;
+  - "amlogic,meson-g12a-usb": The DWC2 USB controller instance in Amlogic G12A SoCs;
   - "amcc,dwc-otg": The DWC2 USB controller instance in AMCC Canyonlands 460EX SoCs;
   - snps,dwc2: A generic DWC2 USB controller with default parameters.
   - "st,stm32f4x9-fsotg": The DWC2 USB FS/HS controller instance in STM32F4x9 SoCs
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
