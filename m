Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E228CCD1288
	for <linux-amlogic@archiver.kernel.org>; Wed,  3 Apr 2024 07:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cLTueFW61W0CbfcpXlZYuyb89RXczNMnXZvxU3Y+sy0=; b=49HAprZCUvWJ9g
	7IM1uzd3hEw3xfL0CBtqz8fg5lK4wdG1gajVm1fK/zWdP26QVr6B+8FcflhyeTGzk8zxBPwcTMfzK
	AWHNsG4rOgvG2fORMiHHAH6RUrZ39e9y1Zft6ebnusmo1Ol5LI/QbLGZJ06p6c97DpDcD+Ov1ofvT
	PR/Tov7EGkdeHjH7V0mtziJ/uaqPgDkZa66Q4FYqrHwV1e+wmgPYJwjRZrGGtxKiFA1IB82HHx1hs
	je8fJ0t13M8EsprF9DE3mjP0mOCXNXFursL3sexNKBHN6vf/ZdeYo47WwJIafjucBYsN1DiwZiH/d
	0eUCFvNedxZS3nNtKvng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrvKu-0000000Ed8Y-0Y8C;
	Wed, 03 Apr 2024 07:47:08 +0000
Received: from mail-wr1-f52.google.com ([209.85.221.52])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrvKb-0000000Ecqc-1Sho
	for linux-amlogic@lists.infradead.org;
	Wed, 03 Apr 2024 07:46:54 +0000
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-34339f01cd2so3653334f8f.2
        for <linux-amlogic@lists.infradead.org>; Wed, 03 Apr 2024 00:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712130406; x=1712735206; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/kTGO29vezq1Gc7J5O9OI72ko2OnA3sM69gX9LY6c8Y=;
        b=MFFpquss0XYcCzJSZo4KRpa5YlM3sU8PBl84bfUp2Obv/Ae9aHtnRdac9ZEJHikUyc
         SVvDBatUWr/Wb3/ZGAbtLoEVIDSTEOGdRPScEzcWpCXsGf+5+dGcuUa/1tQritp0X1+n
         VJODLeyYh1L+pDyXasbcN3kaG38ht7mjP67O2iiXZYM0ZflDZPZ6SEESWyYqWdwIEGi1
         eeqEBWGgWoES1LsKeb9IFMaYYAakAM15a63eQJsk0stvZ5VIuqgwQVfUDLbgu8LVFWr2
         jV2kGQm53y3HBf5E7DHYdggU0YTReqs0ALObXYRzhH1vjT3Q4j+g1CnKGVmzq41PmNmU
         uTtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712130406; x=1712735206;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/kTGO29vezq1Gc7J5O9OI72ko2OnA3sM69gX9LY6c8Y=;
        b=u29apvrk6C3x4R88Om/frpDyu3qWgBb3MTfbhHlyW99ywRhA5DVouFwqOL12uNS2Eh
         G7aFg3PRuAjCsv9lJMpAG0y2zVYAyiZWj98EH+1MedUMkmNmHtimFnQWSoHONFI2OOvN
         NY+iHJfw09vHJsj+Jx741KTdhkIBs1UwRXYNvPQJ/b+ulE4g/lzcwY6ECAsrw1CZA9Vg
         wLOfQ/9HFwJ3DwDHP8BJeZp68HVC3WzQQWhNz1aP8gpD6gHZlWqB62bPYTuK57K2OVVI
         29ryA8L2w27APUlxJkFmTeicRhulxbWMi8gdfyQ3NRU6tOITebMyeAIiPwQ8hSvK5yF/
         mLhA==
X-Forwarded-Encrypted: i=1; AJvYcCWY9TjgF4Lw8fqGpVSlv+uypjMulG8+mudKPuecwgDJ8jas7fyzguxbg3erNnhVHsty1rG2Pc0SbWZjV8mpH/jTGeorBy3aLqWdnwYPCSunWS8=
X-Gm-Message-State: AOJu0YwR3W37XgysVYp27Ci43SR+PpHpZgKXtb8k4HPVzauvgmAZxfrO
	BYUb5YIBR28jycLvzaIEaqjqgbOTuDLGX7I13gsZ25v58qtblt9FbQhIDCq0KD0=
X-Google-Smtp-Source: AGHT+IGGBq46h/V4vx/Me2v91oAoyllp45G9fkusl1z2wLTpALiMyIumG2Nx4o8WN9H7lVUQlHmBwA==
X-Received: by 2002:a5d:4a87:0:b0:343:3dba:79ad with SMTP id o7-20020a5d4a87000000b003433dba79admr1387682wrq.26.1712130406071;
        Wed, 03 Apr 2024 00:46:46 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id cc13-20020a5d5c0d000000b00341b8edbe8csm14021282wrb.87.2024.04.03.00.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 00:46:45 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 03 Apr 2024 09:46:35 +0200
Subject: [PATCH v12 4/7] drm/meson: gate px_clk when setting rate
MIME-Version: 1.0
Message-Id: <20240403-amlogic-v6-4-upstream-dsi-ccf-vim3-v12-4-99ecdfdc87fc@linaro.org>
References: <20240403-amlogic-v6-4-upstream-dsi-ccf-vim3-v12-0-99ecdfdc87fc@linaro.org>
In-Reply-To: <20240403-amlogic-v6-4-upstream-dsi-ccf-vim3-v12-0-99ecdfdc87fc@linaro.org>
To: Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Nicolas Belin <nbelin@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1213;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=IE7LBQJSwmFpro9NRvngqeq31VcV/n9f72AsydUqbws=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmDQlejcQpqrYrAdfaoIKddWFOfQjzYTGqO7gkkwmM
 X08eYFCJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZg0JXgAKCRB33NvayMhJ0Q7FD/
 4pXY/d5+OF74duX+1KwCp8i59NBBA/JfD4gBGLG/y8peYkyi6uFoymroebTIXBTdk5OktdRxI2MY6k
 Yjcg/mDVItK4u5zTwrCSiL9dojIKHN5PueEDWQS6IV8/RsmrtJZOG/womzzmlOkl6B3/hR/49K9k6c
 oT1r6jV1q6/dCwoLjJZUs0qxsf2dbBS4lm7Kg9n8/j3+b1wq25ppIbXnbkACOXs4BOU+PKclGRwKJF
 StBh28gamk0zR5pezCjDBe3sdyYaVKkWXFHc2q5ph6bfpmZyz1+b/EMk9rmhxixkT8LeMNCf8IUAug
 Wz/jxtAyVjXCwwJHdFoiqdfg047aMW+ev4DjGD3gYEgivIruNyU7a7PqKlHimMxjx18m/3Z7gENtez
 Bu9iz3iMAbGc7tpsJpTimlVpLnY9m3sXgmkyV53z0w0/wFTGEPJJ1ovAVsfNJkq3pufN6AhdeJ6CWb
 O0htkhM8Xu3woGTfwn8NwVex41/0839yVaVOseg2JCEWrffVta4km1puojyKb/kSPer1cpbRugbmL1
 ff6acKY/vNIQ8OGAI8V6gW83mtpbrFI5ZJX9eK4CUBq6cMjlfo2zdDYfmCffnOw+CExXEtcT3LBPCV
 0XaCwjwkkEsUfB4ElfVGrV+pgK89u2lGxo6GINqE01Rrwy66Rj4gX+hgcRPg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_004649_532874_E3E22C84 
X-CRM114-Status: GOOD (  10.69  )
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

Disable the px_clk when setting the rate to recover a fully
configured and correctly reset VCLK clock tree after the rate
is set.

Fixes: 77d9e1e6b846 ("drm/meson: add support for MIPI-DSI transceiver")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/meson/meson_dw_mipi_dsi.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c b/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
index a6bc1bdb3d0d..a10cff3ca1fe 100644
--- a/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
+++ b/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
@@ -95,6 +95,7 @@ static int dw_mipi_dsi_phy_init(void *priv_data)
 		return ret;
 	}
 
+	clk_disable_unprepare(mipi_dsi->px_clk);
 	ret = clk_set_rate(mipi_dsi->px_clk, mipi_dsi->mode->clock * 1000);
 
 	if (ret) {
@@ -103,6 +104,12 @@ static int dw_mipi_dsi_phy_init(void *priv_data)
 		return ret;
 	}
 
+	ret = clk_prepare_enable(mipi_dsi->px_clk);
+	if (ret) {
+		dev_err(mipi_dsi->dev, "Failed to enable DSI Pixel clock (ret %d)\n", ret);
+		return ret;
+	}
+
 	switch (mipi_dsi->dsi_device->format) {
 	case MIPI_DSI_FMT_RGB888:
 		dpi_data_format = DPI_COLOR_24BIT;

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
