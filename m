Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F0D5C41535
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Nov 2023 09:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zrf0GpkmoyYe39jf0KAV0/2NKlpdYlarsLu6q69BkzY=; b=xqZnJDh2uZqGXC
	1Me570n9FioMJY2pzsq5W1QXayEIee8T/PbgwGx0OHxByeWEd9SfFO2OCd6dvuimzUmvGsSOvqlLk
	J9jX6Ma0VSz90tLTs+GVcZsrKkpsg2bEneD0CEtJl0iRHNf43/kB+hWxZvGsig5/vOkJT+o9PZw8G
	vB2EMDmXE8Jll/Xy2GsKQSYyd7elThXzRLYWpqltMhL+/+C84Uptqjn5cDt7CQOrlikaBja9hlT6F
	Bq8KJ+l/ZNyNcYlDfzIcYVBFvG3lQmywgYnjf89bxcDD4wK/PmKaHaeS3YDqxtuIQglQxWuIwfMi6
	mEMuH1IGW10jpgSHNeKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r10tv-005guS-1r;
	Thu, 09 Nov 2023 09:00:35 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r10ti-005gfg-39
	for linux-amlogic@lists.infradead.org;
	Thu, 09 Nov 2023 09:00:26 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-507be298d2aso768917e87.1
        for <linux-amlogic@lists.infradead.org>; Thu, 09 Nov 2023 01:00:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699520419; x=1700125219; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=szbyE8B5HmerWTS9QCGM8GNA9TtBAZ10zn0t2kxJOBs=;
        b=gOSN0ab8IPsZK2DxnRbWWmd8jghGq1MZy3XJ0MAKpES9AFb8REZQqUoBEa2j7zyALR
         qy6G4n0FSiCOJ5TMpv7uhSE1TV0+6ynQZpZQ+/z+W8+dSP1if06XZ5cD/UCrKb7vIH48
         UlrcLBMMvgAGkl/Ru/kKbHo2skJo178CtdUrpDsJKkDp4ZXqv9mF/R8PIvUXYDwhn6QJ
         ZMP/UpJT6X0XyPtfsBkI6uJI/TkANYUwxiheTCFogzpYGOVxluHH/J/vhV6pLrW5eXNC
         70MjwtuibW8sJYVhRHWMp+LisH02IYeeknSad1PPZ5KCK5izT3AatqJ//uX+9lE1os24
         FtCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699520419; x=1700125219;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=szbyE8B5HmerWTS9QCGM8GNA9TtBAZ10zn0t2kxJOBs=;
        b=vNbSdMmErkga0sA0TB5l3bM3hSCdB6+h2LD0iEuwRgmYXbSn8lwU9mjq1XG3zZib8j
         OsDh+lJW/r1YJBe6VXrJrqXxjlA83We0ysCiOhn0ujhyervt1IPYOkmI8qxGYAlLlO8/
         cpI+2KMcuItEXQll8Gs9nyqPeHBC5UD4yJbGZob5OOm1e8mCpfeg9EChx3rJXP0Xg9cZ
         ZWVegcHCRn/9e94qgMauIAGiKJ4nMf9SCtIoRYiN+b3GoFq7aAZbHxsQ8KZFlYcJfM7Z
         0Q52qtnLDw4+2kEHKzOFuxjQZo/shlThf0y5hrX3zpezB7P0LzQwdSDPyzPmMxh6j6fF
         fcqA==
X-Gm-Message-State: AOJu0Yz7NmOGOtF3zmhJlVKJMp1adAyRwnd6+cuOOsMBVnab6AcccGli
	9IJlC1VgZteft7X/19eBSv4e3Q==
X-Google-Smtp-Source: AGHT+IHS6tUZm8jOoxmt7gLhfCx4bKpuATMzr2y/aX20jzVc0HP5QxgoQ9hMcisEW+40E1hCOQ92oA==
X-Received: by 2002:ac2:46e9:0:b0:503:3890:ca3a with SMTP id q9-20020ac246e9000000b005033890ca3amr700600lfo.66.1699520419352;
        Thu, 09 Nov 2023 01:00:19 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ay36-20020a05600c1e2400b0040472ad9a3dsm1428484wmb.14.2023.11.09.01.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 01:00:18 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 09 Nov 2023 10:00:06 +0100
Subject: [PATCH v8 05/12] dt-bindings: arm: amlogic: Document the MNT
 Reform 2 CM4 adapter with a BPI-CM4 Module
MIME-Version: 1.0
Message-Id: <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-5-81e4aeeda193@linaro.org>
References: <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-0-81e4aeeda193@linaro.org>
In-Reply-To: <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-0-81e4aeeda193@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Nicolas Belin <nbelin@baylibre.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=886;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=dsHeljQP++qeke1zASpQ3YPnuH6eGTAu4r6z8mvmrbM=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlTJ+XRZWlbUe5Rri8/LQk6vQMDR/N4E1+/QArPJOQ
 hDPKMSqJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZUyflwAKCRB33NvayMhJ0fZ6EA
 DKGXANe+GiL0Hty6vwML+EcHg/3t3bvOMWaCVnFG9FBVAF5J/3hzgAZUrtexB3iTxBxv1Wi/MMuZCd
 D0EIB7HroUpPGzid5eOt7jARPicDb6OkZO1vTf54GNfi4tzMGkGWWX9Nox2SzRokE+qZ6JQfcjcw3n
 xPIZMCZaczLGIhSpD0J4IDfGJ2B7txsxkeomBs26wTTz1NLegZ2YuDmQ4Zds9gF+5Ar7nhPEcGZqbI
 Ouub7B4/p/D3K5HYHXPNCFhFLddpfXPAqXp9NW6nzeDBBa6nJSqv7i/CJ4s2FqP85+jTcOnzmDWb4L
 X/A+WhvP8g9+SwI358niGHButCjVqyipLvgPR+2hYipGZIcIeNWivGBu3GgeX5moi/X6ISMsq+h0yk
 QJD2QkrquMFAEGWvdfKK3kcR/ifPtXpes1OPYSEv7I2catEfNaTS89Xnlz65mLGSOdkQm7kHDZqS5D
 Q0tYEdEUeYJNcfe7XfKMhSErO0ChRdkDiRWpDIxuIabO/o4ogXHF/ltLdpvJurBs0LvcMSr5cwwKk+
 Pz8nffeKLBAW+eq0HOmCYE2o8B0kYQDiSZvOQRHAE1nyEiOXVTvS0OxF1i0EVs4x0PcZMAxmN/yva8
 ny3mxnhepxPQesscosm346kOJPir48KLdIfA1jU8pEb2Tk+xgcoVaAXBT0Tw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_010023_035866_A83F26C5 
X-CRM114-Status: UNSURE (   7.91  )
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

The MNT Reform 2 CM4 adapter can be populated with any Raspberry Pi CM4
compatible module such as a BPI-CM4 Module, document that.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index caab7ceeda45..2154a4614fda 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -164,6 +164,7 @@ properties:
         items:
           - enum:
               - bananapi,bpi-cm4io
+              - mntre,reform2-cm4
           - const: bananapi,bpi-cm4
           - const: amlogic,a311d
           - const: amlogic,g12b

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
