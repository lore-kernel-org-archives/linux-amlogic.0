Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E23D7C28B20
	for <linux-amlogic@archiver.kernel.org>; Sun, 30 Mar 2025 10:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AXmK+vLuzCyWtk3hbwlLwo+cka32Kg+3mt8n7owCmuE=; b=UdlRypO0OwqRv+
	+SEq6bR5umxJ0VpTmZeI6HcRAlllz7xTrVoUeWOfkQcyc3uoPzBtciQJY7gnOFowuiVaBc43yvpXw
	lWKEB2QCT4ELNpK4shUv8ibDHoa9CPqdXVSQvGW6IgoelpB/SJSM/ZR/i4tC0Lrc1Nj0CDAiNzIN0
	uvLLK1gmj0VP77oMRU0W/mv6K/5lDlljsYRKDT/W0EHfd3qBnCauqBZkoqJrmTOJIYuzKnH9jBKi9
	yUH/qnxHSTyDME+PnM4HObZBRUhp4G0N+onu2sVHDymRV8x2mEabhWp+tYXoC0x+1Yk+H6a+/tEEA
	4smGQ0NYatgKaXxQe+KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1typnF-0000000G5QD-0CH8;
	Sun, 30 Mar 2025 10:21:29 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1typlX-0000000G5FG-1rEm;
	Sun, 30 Mar 2025 10:19:44 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-ac2c663a3daso709150266b.2;
        Sun, 30 Mar 2025 03:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1743329981; x=1743934781; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tLkKZXokD8bZjd5ogLbKwW1Zw/6XdqzYpLIZPmwH8bk=;
        b=SXpsnpTAyfPd2LtmNDuwHgI9DSaI0AqEOreO4V2E4viCWaNgg4aJRrR/NLTyYAVqya
         2dxWSIxfEgOIJ/2KORTWYWuuHXmd/qgdU2jesBTVgIzJxddwmlMW4T+AmvljsRBNrYlH
         hLnhda0B/129w1LdVrOdTXGApgPcnLkwicp2cybgzr7ErFsp+9z4xKhRODQW1uz8GLKC
         mD2Gr/9Dy9YbekUSK51b/Yv5J2R+dmfYTQD7BU6nBsN/nP0YmbndIrmrmd1N04LuLa1q
         /RkKBYrMuAfHeiOQj3pDVlqDflp2re4ftXBEn0TXZo3/sC3+0PSKgK/fdZIknX128w5a
         CSyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743329981; x=1743934781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tLkKZXokD8bZjd5ogLbKwW1Zw/6XdqzYpLIZPmwH8bk=;
        b=n6nsNpLObZ45kKt85augr473q+N1T/qmC6+V5clJTRVPU6mnryckT0MpAPIrY4CMco
         NN/Zlvg/8RRtm7lmFDKCLNLfSuBvUuRNwkB0OYUchKe+zkegqRXU5dtnL3ROnI3sNQtA
         NrdZywGOzMCORozkNOl7Gw32CTOuWWa0JWOuwle7NYvKgSEZNn5DDUFcMZtib8eLXBi3
         LYcvX5+Z/GU1M01xQudKttmtdQEFZ//SeHFmJJ5zTAlEEarVvNPl5pDqqFEIhyGzmnOM
         ZSUIrUMw+t3DMJRa/POQPM2z1FVZPT/svuRk6NgAszlB6bIUUJKnSVa+bTKA0EltseB3
         xzzw==
X-Forwarded-Encrypted: i=1; AJvYcCWZw7XeT0Pbm+sxRqMXjWIKl0MTOKbsmbady6Z+J/UN+SVnT7mxdumElG069P3dB7Ckr38hlDUjHrQEhVl7Pzum@lists.infradead.org
X-Gm-Message-State: AOJu0YxM2BAUsmuOn6ssaK+nr5MyAj8r3q5oxfvekIdHeGxk97MQeNkT
	p9VuOYqSEBwtjs4fkFiWJwuvyREQnfk9UW4tLDUOpkmy4rUBAxZVFH44BA==
X-Gm-Gg: ASbGncvd026e31JmxGAzTFin33CQrbdhalkj/HDgS9tLOpWd1Hk4DHwc15oSqV5S+H2
	KGZsKLdcTpDmBiVwRxGgBgQFaqT9uyepeOcmEH8/EXK7248mCdeBRADPPFyk2n+8aSnL/KeXI0c
	wiideF87ekZsCwwukcZkklszlq9ykD5XYyBQXZooiRVOF0NbNYT7nZLfuPliqvRWXQdmIMLsNmO
	pw6Xq3us4zKyR/XxNC8J2KvAF+lQQPZwZOKrBWc1q2/dfkqoDZtalCw7YO2sPbfuQLPoAHj47EL
	JRranDHFWsA3OoXfSIxPXARFkQvkR2+Aq47R1oBwFhUX309gZtqtILmqsla4PYO0HdG2XkDs4s7
	aHtr/Kj7OjDLv5mx/UNejx8WiJsBqSfygO0Fb0Fm39xbZAIgdADa/iFgMjqarjCLtUADLkv79Su
	ZvNFQ/
X-Google-Smtp-Source: AGHT+IG1NOPASTZyke3wRafrQqzhy6Ty6ySHJJEPPfVYz7wlAQdJfI+jHXfQl/zLq9/QGC1snlwecw==
X-Received: by 2002:a17:907:3d9f:b0:ac3:bb5a:8758 with SMTP id a640c23a62f3a-ac7389e79acmr409616266b.16.1743329981073;
        Sun, 30 Mar 2025 03:19:41 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad73-6800-0000-0000-0000-0e63.310.pool.telefonica.de. [2a02:3100:ad73:6800::e63])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ac71922bb65sm459288866b.34.2025.03.30.03.19.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 03:19:39 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	linux-iio@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: iio: adc: amlogic,meson-saradc: Add GXLX SoC compatible
Date: Sun, 30 Mar 2025 12:19:21 +0200
Message-ID: <20250330101922.1942169-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250330101922.1942169-1-martin.blumenstingl@googlemail.com>
References: <20250330101922.1942169-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250330_031943_482923_3D627241 
X-CRM114-Status: UNSURE (   9.74  )
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, lars@metafoo.de, robh@kernel.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org, gnstark@salutedevices.com, krzk+dt@kernel.org, jic23@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add a compatible string for the GXLX SoC. It's very similar to GXL but
has three additional bits in MESON_SAR_ADC_REG12 for the three MPLL
clocks.

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 .../devicetree/bindings/iio/adc/amlogic,meson-saradc.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/amlogic,meson-saradc.yaml b/Documentation/devicetree/bindings/iio/adc/amlogic,meson-saradc.yaml
index b0962a4583ac..bb9825e7346d 100644
--- a/Documentation/devicetree/bindings/iio/adc/amlogic,meson-saradc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/amlogic,meson-saradc.yaml
@@ -23,6 +23,7 @@ properties:
               - amlogic,meson8m2-saradc
               - amlogic,meson-gxbb-saradc
               - amlogic,meson-gxl-saradc
+              - amlogic,meson-gxlx-saradc
               - amlogic,meson-gxm-saradc
               - amlogic,meson-axg-saradc
               - amlogic,meson-g12a-saradc
-- 
2.49.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
