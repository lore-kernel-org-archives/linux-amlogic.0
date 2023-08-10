Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C60CC001DE
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Aug 2023 09:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HfWNgANRSq+tS/sDP9igxXdEp07uQAOP/vrmT1ed7w8=; b=1fDVR6CQ4BvrBT
	PFII6S/ifefntcNicFaRy+i91dfnybku4w+t32Urs2+HptJU5AyMKNwn4Strbc/eNHgrYDuYAo17M
	pInP458UEhxnYnIO7aMkOyD30THp1I7oQsZwqPSX7N72YhbPdxnNmb7TVf0Nc5vbOrsm+XzcM7qcx
	O1qPZLWViwYi+XiMLhkXtd668LLH6eNYsh1k/Pn9MuqURIa3Mx/Uie/moaYmJmsMsNmeMwgudmnev
	uJFH9TG40HTdg3esO8FiD5sP8yfDB+x7PP0fR48NyB+AlXuEFBNtMnI7s5RbCiL0pDBIpPBBkcT6M
	s2P0l+IvWWEzLDrtBNow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qU1jK-006x4t-30;
	Thu, 10 Aug 2023 09:13:18 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qU1jI-006x2N-0z
	for linux-amlogic@lists.infradead.org;
	Thu, 10 Aug 2023 09:13:17 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-9936b3d0286so106868666b.0
        for <linux-amlogic@lists.infradead.org>; Thu, 10 Aug 2023 02:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691658794; x=1692263594;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cXtGVjQOMnic1+0ei+lZLPytdxhtK171VprnemCbHig=;
        b=cg6oXYkJ1EEcITsyqXe57SyZm+KYFc6S4rQMLzpAexMoHNj1gI81VjfWpuPjP/g354
         siPiscVUA3VXZRWgdQIOU4GjMK/+ABhuv+iQUGV4pBud5d+EPmOPRHgUytm9aatVj5Zh
         vmkh2tYOfHzKer69WVpJP3FJOu84r0N4p2F+dxRLUsSEDKX64g3vlZzeFQcieD25rfG5
         +FNjSnjV4Mr5X5+/3CRgXL5D7gxcGs14XhKLkBDyIR7G/JBUgONESsS/KokXoeBpUap3
         p7WaXyos7ZoPK2w35GJJP7l0tPM4S8c8Kl6cK6bh0XSIHFyylS3Lt/FhK40yg2Zq4+W/
         pryw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691658794; x=1692263594;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cXtGVjQOMnic1+0ei+lZLPytdxhtK171VprnemCbHig=;
        b=RLSvAEPOhTVDjLLS48OUPWCdQZ+YClIvyce5c50bho6jGvZnrIiRY1T7J1P4ZdXyKS
         XYVVPIJrbfcbIaZPaEl2C2moOQCiQtN8m/IGOK7QXuwEwE+5e05yQlUW5mhQRChGu4gN
         fG4AnFM/fEwC31vYXdhq69+3GM5xhWqixTn5cu45z+gRQq25gFqQqyQoQ6QITxKkEkRR
         N2NcECAphBXiS6mIIDYbnoUA0Ue3AbKNi/CpSOP7P5KygE2mDNihiOzqYvZjaR1C4oQX
         rSnQwMecI4vc+gFVMwJgvwOnbVUEbyah9Y7OtPmCEBVULXm2hORA/55T5Vjr7vRp/EGU
         8IOw==
X-Gm-Message-State: AOJu0Yyb9mTzWM3uSY3bdNWt1YxOgiwXx3QW27eRXgjLyXg+D9E2Zy2M
	rkqyeFV9eOitxhu1GR4OAqah0Q==
X-Google-Smtp-Source: AGHT+IFGeEvXqMvDY3+sQ3I/t8okkCSs/dqOrA9AWjerSX9C5S3HbS/ruj8SGoKA/0hkHxQUZ30KEQ==
X-Received: by 2002:a17:906:18d:b0:97d:ee82:920a with SMTP id 13-20020a170906018d00b0097dee82920amr1723205ejb.74.1691658794233;
        Thu, 10 Aug 2023 02:13:14 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id o16-20020a170906861000b0099bd5d28dc4sm643984ejx.195.2023.08.10.02.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 02:13:13 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH net-next] phy: amlogic: meson-g12a-usb2: fix Wvoid-pointer-to-enum-cast warning
Date: Thu, 10 Aug 2023 11:13:10 +0200
Message-Id: <20230810091310.70231-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_021316_360028_77A13F18 
X-CRM114-Status: GOOD (  10.38  )
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

'soc_id' is an enum, thus cast of pointer on 64-bit compile test with
W=1 causes:

  phy-meson-g12a-usb2.c:322:17: error: cast to smaller integer type 'enum meson_soc_id' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/phy/amlogic/phy-meson-g12a-usb2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/amlogic/phy-meson-g12a-usb2.c b/drivers/phy/amlogic/phy-meson-g12a-usb2.c
index a628c59e5cf0..0e0b5c00b676 100644
--- a/drivers/phy/amlogic/phy-meson-g12a-usb2.c
+++ b/drivers/phy/amlogic/phy-meson-g12a-usb2.c
@@ -319,7 +319,7 @@ static int phy_meson_g12a_usb2_probe(struct platform_device *pdev)
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
-	priv->soc_id = (enum meson_soc_id)of_device_get_match_data(&pdev->dev);
+	priv->soc_id = (uintptr_t)of_device_get_match_data(&pdev->dev);
 
 	priv->regmap = devm_regmap_init_mmio(dev, base,
 					     &phy_meson_g12a_usb2_regmap_conf);
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
