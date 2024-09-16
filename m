Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B660C3ABB2
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Sep 2024 08:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1YZCfOui+VZpJpRNEDZSxl+OGr7ueDI4U+um2ON6tF4=; b=jaX1RSkO8VHDb0
	grgaHgjeoEGlx9u1YxcA8BREpXUYvvLLm6uENOofMXh2KYNNi/6xn/8CPmHKTV5bC5L8/poURx7ya
	DUVUDR9LJeGIMvU/b3ijvinsNn1YwTSdPoWePjwMjYF15rVWHqggsKAYRl6I/Vqv2687dXUzvniiY
	WXIdiwQBukD9bsnoqFrpjPbL7zWTyF0+EWWORxaLkELhT5kpbSDpHlumaWWZwtWqtSJhmoMLXoPnQ
	J1F6rM7xs2tENXiP/hUXZHTVUF4KmgTe7e7hBH/zwZlxcngYm2hn5fOO3r2c8m35EReKxsen3ybTR
	ALws27X0LpmkYP2s8j2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sq6sJ-00000003Op5-2qvL;
	Mon, 16 Sep 2024 08:14:23 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sq6mv-00000003NDU-1ruf
	for linux-amlogic@lists.infradead.org;
	Mon, 16 Sep 2024 08:08:51 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-378e5d4a80eso1532032f8f.0
        for <linux-amlogic@lists.infradead.org>; Mon, 16 Sep 2024 01:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726474127; x=1727078927; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+vaiPNxR0XK5pyaLYruFri0myinzPIOp6a/MWsTIxgE=;
        b=TzPBtg8FnTcBSZQT2CMUafXL5dUaYv3ANCAdexiBHYFV9pp5by4w9JwiKv6Bz+LHec
         ePfDhkU7yiO6z9XH+cOyFcbNT+ti39wRA8XgPcXAzvQva1IeR5fCAY3IWpsYJVKMDKBc
         feeBA3C5BP1Kr4itCteNGl2Xmv7BnL5KfbF4nJofQWLNYKAYwT1ZQ+57uNRasF900oRs
         dWUUYb+xj9hP9DXhddOovFheeOUSTrlxJJORkAXJc1CRBXZinFQPR1iF9Vf1aC/YpeQf
         jBqNR9Xwxbt9zKdVlw34mxPO4my80qN+n6AB5ZH3ob7euGy37pGOV/5IKBw9X4m+i8C+
         Uk5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726474127; x=1727078927;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+vaiPNxR0XK5pyaLYruFri0myinzPIOp6a/MWsTIxgE=;
        b=MEPE3fY3k0pU64XcLRktHhccMIZQhxjjZuphO8rKRGxuvA8bnMZYfd2VN0trGDKQPM
         gB6EVtHGkSsNaB/vKvE96LU/gpocDeQ55vq13mbtONEeitDY1N66uHPHJCW8PmelbJPY
         fa0EheOI9z1T2UhSNhTbDpqmKcx33WpNxOG1SK2xYsZC5SKGFfWuWzYGYM37/XL+sNSL
         ZmHC3vUsydGUq/HCeSbgWuL5oMBboANJ39rjWhP9zq0cp4Y96MfnczlugLDTeDwGhHDF
         gV44k3HGQe87mlJiG7RQBoB/9p6Y1AEHP6lSgh59NvdkU/Kk0z4U+QJemP1Ke8YXYLk3
         bcVA==
X-Forwarded-Encrypted: i=1; AJvYcCWMPrmFca54XS7nBvpd8M8/yMobykX9ZBcGmdSQoCRc3CFbLPWmjpChavznFNAqQ3D91z92kNsXz7gpxSJ2@lists.infradead.org
X-Gm-Message-State: AOJu0YwS6Y2zuBpVgGbQhsf7AE81RHunc1oWReLm061QhaMwLi6YE4PT
	TDaxJdUK5d4XQjiXpmaSG2gfQzO4vaxNk0Cbtw/TX3KTAAiFogOUi2Cp6D/CtdQ=
X-Google-Smtp-Source: AGHT+IGv0irCuAoicG7Lr0phnSGT+x0/Od23S5rTo8T4LkFhJ/RpG6g88rArjDFrUmZWYhQGrbZc+g==
X-Received: by 2002:a5d:668a:0:b0:371:86b2:a7e4 with SMTP id ffacd0b85a97d-378c2d4c778mr6386044f8f.37.1726474127254;
        Mon, 16 Sep 2024 01:08:47 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42da22b900esm69309465e9.1.2024.09.16.01.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2024 01:08:46 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 16 Sep 2024 10:08:34 +0200
Subject: [PATCH v2 05/11] ARM: dts: amlogic: meson8b-odroidc1: fix invalid
 reset-gpio
MIME-Version: 1.0
Message-Id: <20240916-topic-amlogic-arm32-upstream-bindings-fixes-v2-5-0b20ed4f0571@linaro.org>
References: <20240916-topic-amlogic-arm32-upstream-bindings-fixes-v2-0-0b20ed4f0571@linaro.org>
In-Reply-To: <20240916-topic-amlogic-arm32-upstream-bindings-fixes-v2-0-0b20ed4f0571@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=933;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=8p3c1zZNDRbhKzvcuIsd6kgB+jwe+Y0GqEbwHzRBQrE=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBm5+eGm1pVORxrl+M5mCZxk5fW+Gyb0Cp6ELp24eHI
 38eFHjCJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZufnhgAKCRB33NvayMhJ0ZvbD/
 93XUZPLCDvn6BGaj64fuJVuQX0HkBQ4AdU2nXTy+IF1EmRm1RSU7jeTj4Bn6sw4Ar1y5UtCvVpe1js
 kfL1a8IKJkw4O7iZIpHFPd6j52Lr2X44uhnQ6LF0VCkDxitLca/2vDZq2AYZc3dmLBVzWSYiRQnrBZ
 A8kfa+7U9TPVkOYV73yJtlHPJ4RPMMCI01yKgLx8QcaI/T/FEXzjSOD3liyWJd3M/Rifp4in6dV3s0
 9cYgmeP0z+Ats7rfeCtV6LQcV9uFuraoz86vZ+XIMcchVM4wR8BOnNy9sNdbtJAoG1Tu2Op6+QGymd
 2GthO5nTJdP6MpYJVIerZ3u044n5MXqtFEBJltyvvpv06XfDuaNCkYLN+yFD2eqf8eFaOzNld74R7w
 PH3sBb/GvfgD98cG/c9snlx6J224Rtie51acbdoc6IeQzX3pJfwWDQB/7Cm2MpMfFPDOXcytz7YvpN
 futN2u9IWNtzlUH6LehqZC8sr++By/fPTGFa46HHlII9GsvP2eNcxHfGnv1DzDrGyvufTevAzZD5Lr
 a07uLW4ScwZI0puFgZYnmjuth9rQ/AVcMO6OdMOr7drAg8uQdLelFpKsXl8clCyVrNPvsC+1p6vADT
 t2NPYDN9u3ipUuPCQEyC+8eZ2Cjmj1KGV1NQgkOqNbIcDvnwxo+K0MJm28kw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240916_010849_595657_8B7FD94B 
X-CRM114-Status: GOOD (  10.10  )
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

Use the proper "-gpios" property name, fixing:
hub@1: 'reset-gpio' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/usb/genesys,gl850g.yaml#

Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm/boot/dts/amlogic/meson8b-odroidc1.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/amlogic/meson8b-odroidc1.dts b/arch/arm/boot/dts/amlogic/meson8b-odroidc1.dts
index 941682844faf..962bbe3337db 100644
--- a/arch/arm/boot/dts/amlogic/meson8b-odroidc1.dts
+++ b/arch/arm/boot/dts/amlogic/meson8b-odroidc1.dts
@@ -378,6 +378,6 @@ hub@1 {
 		compatible = "usb5e3,610";
 		reg = <1>;
 		vdd-supply = <&p5v0>;
-		reset-gpio = <&gpio_ao GPIOAO_4 GPIO_ACTIVE_LOW>;
+		reset-gpios = <&gpio_ao GPIOAO_4 GPIO_ACTIVE_LOW>;
 	};
 };

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
