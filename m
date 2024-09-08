Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2893CE6FE49
	for <linux-amlogic@archiver.kernel.org>; Sun,  8 Sep 2024 14:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UbfOv9mjqk2FC3c1IrS3+gKphP4/uS/oMYuHPb9iOts=; b=Rk3CoXqZwvd8u9
	4hOo4XJw6u1k7ZUjBKEJgqTrvcGjU2lOlvl2oTSKtiRq2J8lsZZGj8EOThvig/d/b7M21SLhS7s0m
	xDJWZ0ixAmETvRuOszZdLU8V+rSJQtG6wlNaAyciye6RBA/N3qzefaq9vmiA0XgxzhZodY1hU8uam
	OFt6eIB+uYsvzW186rHKKG/dIRvIEXzMXOH84gWcN/TwxDKG2GmNInbSAXibEVAls7N8zbXAigU6Y
	p+Svq/s+f0m4hSlks98U3DZIpvpd6xhVKPMHdcAEL71Rd43rW03ehJTwySWwryn31E0ESJxJWRbB2
	LPDRgBDzmbOTZhAzRQ1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snIqV-0000000GwaZ-2UPr;
	Sun, 08 Sep 2024 14:24:55 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snIna-0000000Gvt4-2OTF
	for linux-amlogic@lists.infradead.org;
	Sun, 08 Sep 2024 14:21:56 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-42cb3c6c353so796795e9.3
        for <linux-amlogic@lists.infradead.org>; Sun, 08 Sep 2024 07:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725805313; x=1726410113; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=opqWrHh+Ch6fI6vTB63ZLyRaFP0rdq6mZByygqOLt7w=;
        b=uscxuAkNAFTVaRPJ9KEOrTzpC558/FHz9olXUwTHWX2Ocgxai16FSmySNcTAnr1XiG
         k+rFO05m5jU0rK3KcRUZqHf6hk6lCAAByoUo8mzhYtXpf4L6K+KZZ3anVyX0JJcEQA2X
         iFoj3XVmpn5YN53YWiCJQnGhdqbK1CzRn1AGqbZB9Zo9KMoMNtXDtlK2vl2mJmv9HjTZ
         6Ir7AKOJsyHL4rQ1rbLxDDbha96Qm/m4KCCorLlhWM6VeUAuNMSW3J9iL6jW8nU50DYb
         Oz62g2bWJDb3ch/H9mMSlhO0o0kprn7FPRi5X0NZz7SY4QfCXtqWmufLsOYmoHeZZhe+
         R2pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725805313; x=1726410113;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=opqWrHh+Ch6fI6vTB63ZLyRaFP0rdq6mZByygqOLt7w=;
        b=FrnZfE/gN7V9oX74BTw2qv+Ey069oFjMfEtDz5HNrh/N5Wlar3c7AH5UwC1iGyEU3L
         ro04BveD8kkRzV2AQoOcf9rNLvTB0L+vY+xB4vfHmGAk2JLXBmNkMnnShL63r6m4xZ3N
         +UzJAJCF7A8AR1SgaVXLo9sVryARfpYO11Z8pfdD7ykAdXWVDZqba9X4zFBverQtotMT
         aSohRk2Atj1pwrkc+ign7op4TKbxoKvBiAeI23D+ZTBUlH0seHF2+6N1h683qMZ0T4DR
         fzMGTsOM89sD4kDTlHI4k7edFsUVkPDoWQDOv/YVhHDk+Lw51meS6ed+ShKX3kYffyIc
         wlcA==
X-Forwarded-Encrypted: i=1; AJvYcCXsM5bfQGAT1F2M/zbD2neN77Bl+SsoHKJO9hdKB1/FJMdydeK6uFybaeo8GyIKzdXccTShR3p/025n/iXr@lists.infradead.org
X-Gm-Message-State: AOJu0YxAuXgK1BEEJcdDgnLLHrtnckjI/2kgO74YIiyICPplrG1sOI0t
	uHUBRVaDAykeIr9ULn152yiYTTmMZ/MzUBNCO/mDJW3s1uXRv1dU1SaisJeiHpE=
X-Google-Smtp-Source: AGHT+IHk8lX+IYMMyPu1J/51I1ma3xgJuFFXQvGLe9njZslD8gy0z/8eNeprhovuMvXcy51jKG/AEQ==
X-Received: by 2002:a05:6000:4012:b0:374:cef0:fd3b with SMTP id ffacd0b85a97d-378896d9cb1mr2543013f8f.7.1725805312996;
        Sun, 08 Sep 2024 07:21:52 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37895675bc9sm3465092f8f.56.2024.09.08.07.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Sep 2024 07:21:52 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 08 Sep 2024 16:21:33 +0200
Subject: [PATCH 3/5] drm/fsl-dcu: constify regmap_config
MIME-Version: 1.0
Message-Id: <20240908-regmap-config-const-v1-3-28f349004811@linaro.org>
References: <20240908-regmap-config-const-v1-0-28f349004811@linaro.org>
In-Reply-To: <20240908-regmap-config-const-v1-0-28f349004811@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=773;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=fRgUGDqaRoZtIl+WHmIGQHM80N5JZYutQfaDHkXDk08=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBm3bL1Qv6Igmg4XEMVNhOLdsVdTsUR1ueqJ3Ovb
 bpFAYP2+5SJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZt2y9QAKCRDBN2bmhouD
 120OD/0T8cOrR9KrPkxGh35sFSSSYkDyfJm+7NO4H+CL5+6LxsJSQE32qyrJBthu/NHaSb0FOrS
 DuOXs0fccV7E2KOD0uWG1qqTFo1p+lRlt6xYtbe5JNCxa2Nb5Zyjj76X5BGxhnjHZwU7E/lVJDz
 UAKQC97zY7Lg5q0ipatllnHQtpXMxb9HzSbRpUO8nYrjKkFwTw9630C8UK7u7SG2+F3A+gEE27T
 R296FzEoWCTMK2XNdVIzoa8ReBXqqbA5OtA0FwjYu1NeORxZdfMyZoxVrOK6sj0K8C5PZOdiXAh
 KiGP8jZg+v/cZMqyGmMbyHn5upctXKk+zGRag4ntk3BZJILn30VGw0bEppoaWeDkmQ6QlsQlkBu
 Ez5xrnnarhQjKlcyUQ+p238dxH68dhDA3QPQ7i8U+hf7rAnNicPIYmbbPkpKE3vXrWD23XrxBZX
 1WNEXsc/idRNn+1RHHO7CsZuehyZL0TZJjbTAU1ZNWa9Mm2BbUwM+MaQxqRZr1w2tNWnk6A9UAQ
 TRSOKKX1sUFNsHOymhvkvG2J7It1/eYgYu3LKmvikixTnT7OwugUQdVVLAog52PVjM1Jojj5mHK
 cM88yx9IKD5tes6N9i5SWjkR2X7Ri5/9EOI0naJm452GPgBcBh2YQZFUC2VhKNQ3rWRWc1+ZhtU
 00CRDz+hXylwv1Q==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240908_072154_688401_6AE0D222 
X-CRM114-Status: GOOD (  10.41  )
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

Mark local static 'struct regmap_config' as const for safer and more
obvious code.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/fsl-dcu/fsl_tcon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/fsl-dcu/fsl_tcon.c b/drivers/gpu/drm/fsl-dcu/fsl_tcon.c
index 9eb5abaf7d66..49bbd00c77ae 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_tcon.c
+++ b/drivers/gpu/drm/fsl-dcu/fsl_tcon.c
@@ -29,7 +29,7 @@ void fsl_tcon_bypass_enable(struct fsl_tcon *tcon)
 			   FSL_TCON_CTRL1_TCON_BYPASS);
 }
 
-static struct regmap_config fsl_tcon_regmap_config = {
+static const struct regmap_config fsl_tcon_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
 	.val_bits = 32,

-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
