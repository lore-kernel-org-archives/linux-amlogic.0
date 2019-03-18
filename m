Return-Path: <SRS0=lgrq=RV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D0BEC43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2019 10:13:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0CD992075C
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2019 10:13:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mwxTmDvP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="NbOqExCG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0CD992075C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jrew7gT/BcrRcpoFB5kp84Gy/k4zm+TFOuBE07gdLR4=; b=mwxTmDvPxFqMNB
	9DIxKpqqgU0k6YXnn0a7Wylbmfw2EBFKNuDASe34bo7DO6Q5g9WurfzOEnJ/9BgFy0RCuNojaoabZ
	XKWI+x0UFfAt8irHA51vOKJJZ/9+JfYbyKyg9gGwLU8bkoTmqjt4MlZKXPryIi4BHRCJvMlOW3hXj
	8CDbBR9hXVWm46hFwJicOLCebA4jrTg55eA5MZWPIOOt0uYeNPHmAuJDQZNUnRWAC5fsWqsJvOLfP
	wQLO/PFZA1swpG4m/xnOemyzhiRfofnLxuvUGBUFwgrIo/up2DVpaeMRSypURrm0QpabHGo+u/BbO
	m7h+6ulKUPcYLmRZJ+kQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h5pGK-000066-Qk; Mon, 18 Mar 2019 10:12:56 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h5pFR-0007O9-9a
 for linux-amlogic@lists.infradead.org; Mon, 18 Mar 2019 10:12:02 +0000
Received: by mail-wm1-x343.google.com with SMTP id f65so12337463wma.2
 for <linux-amlogic@lists.infradead.org>; Mon, 18 Mar 2019 03:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CUW/0oX1GPWgNe1zd7vEv15Hxq4TFiRMZCgKm/8ULe4=;
 b=NbOqExCGZ0ZWcv6OK56p0ISNDwMEj+I7eqERXUL9LeI4+57DTlyMcCnT8+bf1VatR7
 ENDvdMHT9j90jipmnxLmGn46t0eIFP4pS8oQLLpgIM8ts7+qtofkedOAPjF0q+eFJn3a
 3dzD6DPrJx+I2rSm+A5qvuYy7HOAVbF6gfqR/NkyIpItSS04bd75RRx7Fl7Cxd7pGzWY
 0xHDS8sgMCV6I+Qk6OSieye5gLU+PH0U92NkxBgmJK35GRgf2FDsA2NVC9O5P1nUGY+2
 GX+BT2DvBGkDwgFBsIzmPd5AWUr+0NRV+V40/Wcvr12pV8tUEE/Tnx6fscyZ1xY+LnA4
 LwWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CUW/0oX1GPWgNe1zd7vEv15Hxq4TFiRMZCgKm/8ULe4=;
 b=f5zRgArx68D6sKIYh6QupwZoAHK/8L8PvmVKHKmpQtghVRsXkX9ZkfbhnUxxzPNsAt
 KNPAhivxr9KIy0v04UKQXczH7d/03Gx8E/USFy3p2RHNKDf3xwdCYR1Ivyadx4g5+f9N
 MACowYbxgOzmCPxskva1gZ6XMeJaHKmb8/lc2d3nvdrp29CCaC/wyfHwBl9wziyL1aAe
 nAFZPyV5melooZ/R1+Y3CfbyRCsnaSgeFr0yHlD75OgHr0vD6qxXQP+J289XNpSO2INO
 gqkjN221FnNzq29MFQKocwyvjIg1+NkKI72tZX/yZwhY5rkobZQziHoi213UjjBmQhM9
 OmUg==
X-Gm-Message-State: APjAAAUmFPDuR0hpafTI6S+LmbyXkVnA0LH/SKgSlAJjiA3NhGOK1U03
 FevaB30IUqhg1DdywB5nvShYqw==
X-Google-Smtp-Source: APXvYqx6NYeyh64Qt5sdHoPOjHpVXK780Jxx0ATdpoL2SKpw8hLl8FQkmM1vyuXbv6ErBoD+z5PQgA==
X-Received: by 2002:a1c:6c08:: with SMTP id h8mr3810546wmc.146.1552903919268; 
 Mon, 18 Mar 2019 03:11:59 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id z8sm6697855wrl.59.2019.03.18.03.11.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 18 Mar 2019 03:11:58 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: gregkh@linuxfoundation.org, hminas@synopsys.com, balbi@kernel.org,
 kishon@ti.com, devicetree@vger.kernel.org
Subject: [PATCH v3 3/8] dt-bindings: usb: dwc2: Add Amlogic G12A DWC2
 Compatible
Date: Mon, 18 Mar 2019 11:11:48 +0100
Message-Id: <20190318101153.7531-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190318101153.7531-1-narmstrong@baylibre.com>
References: <20190318101153.7531-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190318_031201_331231_E8D61D93 
X-CRM114-Status: UNSURE (   8.61  )
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
