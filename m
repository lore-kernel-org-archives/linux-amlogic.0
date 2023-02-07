Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F655C6379F
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Feb 2023 15:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yw9Hh9oAq5BoYOeTlwlU74sZU5efCLdwxXc+hGvn0V0=; b=HxMlDViKSLXd08
	yT8uD5A6FulEmnutC/tLaAJ9qntt62ig8lcYU3FRanQ+fOV0RDXxZ+ZHYlvMBMkVaianX/fRTENwq
	r3jnh3HBR7R+0MoruMURF+Ha7DIRWMF+zjppel+mqoJ+F4UtqNgKaxb69OcNumUEThq3zPCAEbCIN
	H2FqPAGcQ8OcRxEbjHY1p/wO4fUFXnJK8xQNT8Vwg8cJKjgt3ha/fYWNtpxstnKnscfmZ/2gDnAp0
	9pK8n/AVbXbucVmnoh4ByqHk5HoLTmpMfbooRh+mDAO118WReJk+p0anayAO0+0HMlgEVL4WY4sRv
	4XrknFiBaWE16gRzvKBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPPbf-00CdhA-IC; Tue, 07 Feb 2023 15:10:03 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPPa3-00CciK-OG
	for linux-amlogic@lists.infradead.org; Tue, 07 Feb 2023 15:08:25 +0000
Received: by mail-wm1-x32c.google.com with SMTP id l37-20020a05600c1d2500b003dfe46a9801so10224963wms.0
        for <linux-amlogic@lists.infradead.org>; Tue, 07 Feb 2023 07:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xervDpi9D639e9DmVkznZiAeNp4KA5UAiEcaVrDAWRQ=;
        b=bwIrr9KidC8Qn0R8ATT8N5cRgCb1mbPALzqcqYGbi3HIifdS+hZeXXejIs1vkeR3P1
         +ri+ni7agOD9Qpn93hZAIoFmsNptdkPQgAkayVNVsmk79XKApQeGbM/LvC7bG9P4/R6x
         kZzgJXBVfi3KP+LeEJ7/1kYC6LH7/2KiqU/5UNk7ABNNl5Dx8Bf/I6Zs1RP89Wkgzwqq
         327w7evF4Yf3jAvuziHNB9TRYPEknTgJV3A24rRvUT0IkwX8MGTkwBdNoA43WR4jA/1f
         O3jiEZGyZEx0qJczhEQcx76fag5ZPVbFqVyRhueOZpqmrRksZn5Ukq+DMqV1acfzDOiy
         ry+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xervDpi9D639e9DmVkznZiAeNp4KA5UAiEcaVrDAWRQ=;
        b=J4WQTbDg/2aiCOHepmT5yEOjMDai2gUvdLzIb58tpUeeDPCyzx2AenZ769gj0PJW5y
         C5Z5A13N79nFH0sFmYHvyRTa5H9pPSIHwUT2wtf6odyqyz2w11pq8r+xFGSkeacalO1t
         IcD8zZROwYl8L7s8gqYX5n365M1Xe3GBwIpziUtvN0TmvTn13J3cR0VPbtPD3a+JEUuU
         gMgQb+aPIdixjEFBIAbv5SE3K144asLWz+lIhKHN34SfaljEyLqDPcKwfmdQDdTct+eN
         IpFfBz73BgPoJeXgvzoFJh8NHLSgmz7Yk+TiuRosMhLpRZwXGAfu58vXJv+9JXaerbq5
         DGaA==
X-Gm-Message-State: AO0yUKU3N1IaiSYANJZyfj2BIzYhrsxrBbr7vSsQ8/NOklxRdGAg7z60
	uU9Ul9XjmUpYa7FAJQoBbmau1w==
X-Google-Smtp-Source: AK7set9clGcAkYsuGtSupI1CVB5MZwN0SdmoLG01l6SzS7ZVU5JafWQcOjImOdmzeKWDn29HnXxb4w==
X-Received: by 2002:a05:600c:1887:b0:3dc:4318:d00d with SMTP id x7-20020a05600c188700b003dc4318d00dmr3336477wmp.11.1675782502585;
        Tue, 07 Feb 2023 07:08:22 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id j33-20020a05600c1c2100b003db0ad636d1sm22092173wms.28.2023.02.07.07.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 07:08:22 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 07 Feb 2023 16:08:01 +0100
Subject: [PATCH 8/8] arm64: dts: amlogic: meson-gxm-s912-libretech-pc:
 remove unused pinctrl-names from phy node
MIME-Version: 1.0
Message-Id: <20230207-b4-amlogic-bindings-fixups-v2-v1-8-93b7e50286e7@linaro.org>
References: <20230207-b4-amlogic-bindings-fixups-v2-v1-0-93b7e50286e7@linaro.org>
In-Reply-To: <20230207-b4-amlogic-bindings-fixups-v2-v1-0-93b7e50286e7@linaro.org>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Christian Hewitt <christianshewitt@gmail.com>, Yuntian Zhang <yt@radxa.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_070823_838031_5C74446F 
X-CRM114-Status: UNSURE (   9.14  )
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

Fixes the following bindings check error:
phy@78000: 'pinctrl-0' is a dependency of 'pinctrl-names'

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc-v2.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc-v2.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc-v2.dts
index 874f91c348ec..6c4e68e0e625 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc-v2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc-v2.dts
@@ -305,7 +305,6 @@ &usb {
 };
 
 &usb2_phy0 {
-	pinctrl-names = "default";
 	phy-supply = <&vcc5v>;
 };
 

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
