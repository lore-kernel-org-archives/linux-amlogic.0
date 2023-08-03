Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA5ADC001DF
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Aug 2023 12:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2hkT3KBuBot7A1OU0AMJl3qtRnFJTh0Tw5GyE+nf96A=; b=hPOcbj+LNdhk5F
	Xfpc6j/CY4sFAOaxho2JZjeDNZdniIdwNPaVuvkDQ+kNkjKZfmcXRKTjzH7SS0X5JHWAgv2ublEh7
	oCvboZBbm/yRFmI+cgLv6d5RVm8g8lvQEWzdgehmFqKNxG6PynKM7xSM2FdFXnKlguBMDFGdShMqt
	QcACo8x7gy2Ch84aQBJ5Cc6CXkirKL8Ue6Pauvu8Lw/MYZyNARS44/OoAhUMvwqFjZ4sqovIhypl4
	m7ouqg3r1jS4S1W7p43Vhn7qyL+ZoShZ7qKfCCd9Np6EXuDI/N+tr9HIr/3KoXF7enupToZt1N1vC
	ODG/LEXJvdChK8OHBOBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRX3y-008BGy-15;
	Thu, 03 Aug 2023 12:04:18 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRX3p-008B3l-0x
	for linux-amlogic@lists.infradead.org;
	Thu, 03 Aug 2023 12:04:11 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-3fbea147034so8952905e9.0
        for <linux-amlogic@lists.infradead.org>; Thu, 03 Aug 2023 05:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691064245; x=1691669045;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rfvt+EmrHZv1zbeX+XtXPk6Fy/0gOVGXRVeJ603Il6c=;
        b=MyHUsgRRMHSkZ6qLbXroIG85T6WWK2ZHKgoQEtUUZ1od5FzypfMMuLf2df2pa9Ns0d
         0RgOFw8RC8NzLVUWkTHp8sEEJuf2pMQ3njOFjsjfJ2+n3woo1xFIiDVQSAQPXIjK13fz
         y/4Hzbf1atwfzMbiE5rKvMful6lMlBkSpgXAwjCL2vzV4WgS+6raJ00j6qBFYciWIlLV
         iv9Ga0x1KWd/5GgEuVQFVuUItjfkUqQJAyuy41U7wPZJDAKwVCOixSy38CUX+UBdeJE5
         aO6vSLt4ZSYOEXnDd1KMmO6dXXMilm71qTKRvVMazm227YmgO6PPCnjVIPykA/RowZty
         M3yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691064245; x=1691669045;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rfvt+EmrHZv1zbeX+XtXPk6Fy/0gOVGXRVeJ603Il6c=;
        b=jt54zVAiWE8608CN3gfzC41W1SNO+4Lph7ZLwygCgJWoSIZ4Epf9K++KiQyk6rG2ag
         Mwnu650ajkJ9wiNp5/q25qYINv1zECQPzZSTh1igT6w1TRLra5ksjmafaUHGuzIUSyCW
         fKWvNYsDS2WHInyqF7BxAvxf7SqU8jpW1ewgKz6o+y1Pz0Lq2D7+psglTZ5PCj3vVcMB
         ro/WmK/CsqtJhOLEy7tKDUwxWnY6m3zHNV+F1+IMzAq9IVVDKWNdj00tvPRBAmIwnVnR
         /8/LxF30CiUKNqjoC9Du3ti7YhpuFuEJpYMLftSmwq7AWchb/PFl8ibplwxTenejJSo+
         vc9A==
X-Gm-Message-State: ABy/qLZzbfddwtVsocX12hwF0iRdwUoedfx9Ef3KzNHue3F1yqaIynKT
	xJ5GtZr/pmZJ5B3OoLVFs0Hblg==
X-Google-Smtp-Source: APBJJlHyl5WYI6N8c8ajSFmQT4ZqGANnisyCQEfMYfWWz8LEKIkaPLA4Ac14e/Ko1++3dxrq9AhIaQ==
X-Received: by 2002:a05:600c:282:b0:3fc:85c:5ed2 with SMTP id 2-20020a05600c028200b003fc085c5ed2mr7182732wmk.11.1691064245559;
        Thu, 03 Aug 2023 05:04:05 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id d10-20020a056000114a00b00317046f21f9sm21487465wrx.114.2023.08.03.05.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 05:04:05 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 03 Aug 2023 14:03:55 +0200
Subject: [PATCH v7 1/9] dt-bindings: clk: g12a-clkc: add CTS_ENCL clock ids
MIME-Version: 1.0
Message-Id: <20230803-amlogic-v6-4-upstream-dsi-ccf-vim3-v7-1-762219fc5b28@linaro.org>
References: <20230803-amlogic-v6-4-upstream-dsi-ccf-vim3-v7-0-762219fc5b28@linaro.org>
In-Reply-To: <20230803-amlogic-v6-4-upstream-dsi-ccf-vim3-v7-0-762219fc5b28@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=761;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=OBDzXE6zqX89kc7pvzy4CIEH7gf5glqDzs5WzIgtsF0=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBky5evPqlyqm2PHjNKCgp/BXcAaRArzuGQt1FzLmzh
 IYCgxKSJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZMuXrwAKCRB33NvayMhJ0TAlEA
 C8/B9GuS3bdWQiUB/DwPVUIrv6jpMVkEuWwOY+3i31cD13nkHcb7O4C6Ld9WZbE94JrqeKg0/t9+iL
 JsdOzdf6971IiUC5SwHTtSVEHjxPbFzkOubk/eeoTJkxGRF/MsYM0iAg+rvNzbeTaxVF/9AtKrwriM
 9OzyJBguvh9wmnESKYRY0cSLznjvA+GxVDPHIzAYHDPLX3LJJ0cfpAx8JjEzx0PNWRjww7FGpm+zVa
 FYfy9EDQ6OQ06WQo9vNfskyh5SCBTWnFLvZbcb7/t0v7xncEuhNWtJvuyz6tWYw4yp/oFcmGXgjSFv
 aUqluT8S0r4sfNH/DGkXvBBpzHMbaNx7Kbdl+eyrrYjP7yu5h+Ig8urwtnW/qiu/myoj4DhwUQwXGo
 poOC5lpwnkbvAiFmFe3FGf8Hr2SEWuCelnjhfN8yBVKfAYzpJFN4jlCwUid2B/XPT0LDdnTjSnKmOC
 mzH0kUPdwR7m0g6eUYMW/wEpW00uNwDQgyPbBViE/hZqPg1oXFYG2e/5f7MY7VeQr6IWEq8XPJg7aL
 2XYlxslPMFYDCrDabsNy/o5baT4C26V/H1IuYCheOZeS/WHq2kd392DxMb1XwS+Cj+5FsMbJJnBaMh
 fjX9Kv43/zWgfJnIkL1GE7S7hAnc43MbnztJ7+TvF2D9S0bWJ5X8vEOlMhrg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_050409_378667_19D2992B 
X-CRM114-Status: UNSURE (   8.72  )
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

Add new CLK ids for the CTS_ENCL and CTS_ENCL_SEL clocks
on G12A compatible SoCs.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 include/dt-bindings/clock/g12a-clkc.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/g12a-clkc.h b/include/dt-bindings/clock/g12a-clkc.h
index 387767f4e298..636d713f95ff 100644
--- a/include/dt-bindings/clock/g12a-clkc.h
+++ b/include/dt-bindings/clock/g12a-clkc.h
@@ -279,5 +279,7 @@
 #define CLKID_MIPI_DSI_PXCLK_DIV		268
 #define CLKID_MIPI_DSI_PXCLK_SEL		269
 #define CLKID_MIPI_DSI_PXCLK			270
+#define CLKID_CTS_ENCL				271
+#define CLKID_CTS_ENCL_SEL			272
 
 #endif /* __G12A_CLKC_H */

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
