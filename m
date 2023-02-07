Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD1FEC636CD
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Feb 2023 15:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CTZ5wnP2M8A2jZvU7Kkae8P1MJdW0X89EmAyI9fH5ew=; b=xxfmJ5kvrwMowQ
	1uah5kjZhYkWuu8sIYBmUbNGgXrzQa+NoF/+aT0/4WwbtFxwtIHP4t9HigalBLKbcKtf73dPwcjxk
	pAlpQ25xDTMSyXnTWgI5AitHz4AvHuF3bVTWCXOJy5i09GV1o8JJCh5HpphM/WJn8gMLRNuMwK6jl
	0kaIWEl1r2DD5aewo7ugJXAm1i3yVHHZ6KU0cRm7QVwLsIW3pdgR5Kf1HrvfeRcCV/zr5CZZDC8ty
	e4Gnr3MfvEroHbM+WO+5rZiED2JPLDeo5mJPLRr1YsO3xhOZO80hBlpX1UJfRv9LXrgi5VC+iyRK4
	0MvdFlS4Wj8Ota/hEXTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPPU5-00CbkX-1N; Tue, 07 Feb 2023 15:02:13 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPPU2-00CbjX-PN
	for linux-amlogic@lists.infradead.org; Tue, 07 Feb 2023 15:02:12 +0000
Received: by mail-wm1-x329.google.com with SMTP id n28-20020a05600c3b9c00b003ddca7a2bcbso11689868wms.3
        for <linux-amlogic@lists.infradead.org>; Tue, 07 Feb 2023 07:02:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ReMP1fTRj+2lUjIQIzq9JI1fRxLOQx1rg3anIwo/iw0=;
        b=sR3NjPoRRzWOQXyUZ0RJ5J0ibpc4nnmKD2/25SisIezzZBC25LC4AmcIRtPy4IQyrh
         tH4X5Jz6nu1BcEBAdmYu9QrEOYMUUTtO2WvNSf4Cj5Lm3JO9dF/PmD/eHshgltg2facd
         1znLlaUm1xqJFK7dVN/X+j4b1wvDVGgqfGo/mtabP13naZhkDBaOk3mNrhUDbFlyplWJ
         5rma2IpkAliJTZGy72WhmOCX8AYG18Rttef4CtKx5W/rBRk7O+E3u6U6JPHPdAA9JNqH
         0pawOk50lHD3P0jIuaTKJhzp2nt9+I+enDxS+9lCHGP7S6vEbSXHs0NXWpujzxXpxo9j
         L4XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ReMP1fTRj+2lUjIQIzq9JI1fRxLOQx1rg3anIwo/iw0=;
        b=n6O819+4NqnxfoPorx8yBrngwwD0uBS4GtOZ3BkHMPWGTdkyCCJH97e2/3V3gWRWoL
         5Ac+rm/4wThV9y+H/iZQ3xNPQeeTG1BYNGYzR3rtqU80mw10Mocuz+QYtV/+63SXXEG9
         o1tNEIJZCwniRjYewqTTLm0iqbXQCD20pAVcG3OhYSHpbzm89SYWYFmwEk/xKXNFdafi
         BYjMee0X8tHHpZPIwa2HA64eXOLHrTzQ2U8s4/9JKOFDII47StO2qv7z5a8CeiDh4Vu1
         VQmjb1Xl/730UPmcFD2vBMy61NfKTHnLVLW5ujIYLt+sjOPyCCkkSzCRtq5k9QIr5QNv
         OvSA==
X-Gm-Message-State: AO0yUKW0wmRgyxAY/rtKb3LGQJ9hZjZI3pRaFNK4kTe/eC86OE8DTxVr
	cPMWcrTuT8zIxh4XU+SeN2xZsw==
X-Google-Smtp-Source: AK7set+4Rc6Lc+fXClJniTktYSdYRjfsCxjlMj16mSKHcCU1TSNVVZVGZGFgicaFljxVHNg+9f+BBA==
X-Received: by 2002:a05:600c:4d92:b0:3df:dea7:8e3 with SMTP id v18-20020a05600c4d9200b003dfdea708e3mr3546852wmp.21.1675782126801;
        Tue, 07 Feb 2023 07:02:06 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id g24-20020a7bc4d8000000b003df30c94850sm18264340wmk.25.2023.02.07.07.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 07:02:06 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 07 Feb 2023 16:02:04 +0100
Subject: [PATCH] dt-bindings: usb: amlogic,meson-g12a-usb-ctrl: make G12A
 usb3-phy0 optional
MIME-Version: 1.0
Message-Id: <20230207-b4-amlogic-g12a-usb-ctrl-bindings-fix-v1-1-c310293da7a2@linaro.org>
X-B4-Tracking: v=1; b=H4sIAOtn4mMC/x2N3QrCMAxGX2X02kB/hKGvIl6kbewCNZPGiTD27
 gYvz+HjfLtTGkzqrtPuBn1YeRWDcJpcWVAaAVdjF31MPvoZ8hnw2dfGBVqICJtmKO/RIbNUlqb
 w4C9gCOFCaa6UirNWRiXIA6UsVpOtd5OvQbb9n9/ux/EDKFP+l4wAAAA=
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Felipe Balbi <balbi@kernel.org>
Cc: Rob Herring <robh@kernel.org>, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_070210_854962_DD8BBE65 
X-CRM114-Status: UNSURE (   8.11  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On the G12A USB complex, the USB3 PHY is shared with the PCIe controller,
thus on designs without PCIe enabled the USB3 PHY entry can be ommited from
the PHY list.

Fixes: cdff2c946f06 ("dt-bindings: usb: amlogic,meson-g12a-usb-ctrl: add the Amlogic AXG Families USB Glue Bindings")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml b/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml
index daf2a859418d..f38a2be07eda 100644
--- a/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml
+++ b/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml
@@ -108,6 +108,7 @@ allOf:
     then:
       properties:
         phy-names:
+          minItems: 2
           items:
             - const: usb2-phy0 # USB2 PHY0 if USBHOST_A port is used
             - const: usb2-phy1 # USB2 PHY1 if USBOTG_B port is used

---
base-commit: 49a8133221c71b935f36a7c340c0271c2a9ee2db
change-id: 20230207-b4-amlogic-g12a-usb-ctrl-bindings-fix-a1119e37de3c

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
