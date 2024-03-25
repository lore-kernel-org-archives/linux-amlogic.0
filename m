Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBAF7CD11DF
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2024 11:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cLTueFW61W0CbfcpXlZYuyb89RXczNMnXZvxU3Y+sy0=; b=SeDP3gvrebrlWg
	CAVkJtyCI2zPz5x74B4Ov/2WVfrB0XngwVoY811IctJ+Kq76RD/EDvOLjDol1rTQDyCnXBOIDmtqO
	Y9VIG2GhsJ+J+kVrzVcvWzj+3DNO5PE1hL9/V15UrjS/EHfthbmQT8VwsSlrOkwHAP0d4YDQwgKfh
	eqnVcg9C1D0O5a6IG7M7zvFjbWXgKHcKu0shPc/WKeE8c7KJwJye0ntBNTnck+AO/Pcg36nVTzc3s
	h9eINVm6n9z7SfEfkJAyG1/Yk5+3/hjvLSGUamKRow82TfFxjs8+Nk09wXnzhZpZeXKsGAYtdh5vk
	Kmsd4PGR33EVIfkblWUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roiDk-0000000GxRY-21hG;
	Mon, 25 Mar 2024 11:10:28 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roiDJ-0000000Gx45-1MpU
	for linux-amlogic@lists.infradead.org;
	Mon, 25 Mar 2024 11:10:04 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-a4715d4c2cbso524569766b.1
        for <linux-amlogic@lists.infradead.org>; Mon, 25 Mar 2024 04:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711364998; x=1711969798; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/kTGO29vezq1Gc7J5O9OI72ko2OnA3sM69gX9LY6c8Y=;
        b=OUDIxy/p+nGvoJXoFvqgqEYWZ6VIfMtI56aiSd7RrNJtwlDEwCuhxtA4LSA1ASXXgd
         AjHSFF7OIBi8n50gn+r92jRvPkV0Frm1G5f1vTpIfnQ454IEQPsMP1gFJcWoKfHtq1Ig
         F4yoLcKmPU41d6nDwHpbD5h6e9wXhkScldCF9QHYL6acClvpQ2NfIdF3H0oSEGhk4Od4
         rzi/swibAqcRfqabeM4G55v16/qHQzO1UuKwLYkG7xveNpSsmklLsLfO3BMU9UXAkGCO
         XDUr/4wUQ2mBd1fme3fNfgkXAW6FvnA+K1mR2OcuV1TW6MKRGABpK/oGCysP676YsKPo
         vBfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711364998; x=1711969798;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/kTGO29vezq1Gc7J5O9OI72ko2OnA3sM69gX9LY6c8Y=;
        b=M31V5zhBf/2Xr41skDCXDgjb71CkkIXfsRHZ+Q3WwE6Q86MKRsG069QMvV8z9FjpMo
         eVhv8tQ+JbnSGklovg59ibwf0TFhs/NO73T0GVncgEJ72fUYmpDF7ZKx/ZukVBUqKPY8
         CRJMbVYB0FiSZtSEz0bLnakykhsJSHqsUBw3+YWQI+QAfB6VKSFeaQueelkdffoTOCa+
         47fT1jsmaetFe/kXjOpLcYQZx+aNKFEJQ3fvkHQIKhyYUO5Z7RwVp2O6mJxERw8L4geF
         o9isRQzxt1Dw3soRfNuPB1LdE47efXCf+aATqVlocsvC+E5V+pb4KRPDQ3YU1c55CK9l
         650Q==
X-Forwarded-Encrypted: i=1; AJvYcCVHoenO9Q48lnjGky2YWgNmk9CEAyD+AkmbYJvB4ZpruO+SwlJFPE7n9ar5BWfvQTtipLiYvoJzsNqi09CkFkkFjIyk1ldso5nJZdkm7nrVOMw=
X-Gm-Message-State: AOJu0Yx9sPFsYgsKNiKr65NKZalzYv9NQuAY2SSEv2ROc71HHyBJTvEP
	Hb9SbonddzYB0FrWr1tbxz9CcahVlBE0vrWSZe8PO0VwIdcsx1FjLgWPw6Vhhrw=
X-Google-Smtp-Source: AGHT+IHd2loUo9esvRyCMJmbLmzeubWwPmclSwwr5gWi/CXFBjKiq/1gx79j0VlUc5MnXrG6uSfvvg==
X-Received: by 2002:a17:906:ae8e:b0:a47:52ff:194d with SMTP id md14-20020a170906ae8e00b00a4752ff194dmr2271273ejb.35.1711364998404;
        Mon, 25 Mar 2024 04:09:58 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id bw26-20020a170906c1da00b00a4650ec48d0sm2972367ejb.140.2024.03.25.04.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 04:09:57 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 25 Mar 2024 12:09:50 +0100
Subject: [PATCH v11 4/7] drm/meson: gate px_clk when setting rate
MIME-Version: 1.0
Message-Id: <20240325-amlogic-v6-4-upstream-dsi-ccf-vim3-v11-4-04f55de44604@linaro.org>
References: <20240325-amlogic-v6-4-upstream-dsi-ccf-vim3-v11-0-04f55de44604@linaro.org>
In-Reply-To: <20240325-amlogic-v6-4-upstream-dsi-ccf-vim3-v11-0-04f55de44604@linaro.org>
To: Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Nicolas Belin <nbelin@baylibre.com>, 
 Jagan Teki <jagan@amarulasolutions.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1213;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=IE7LBQJSwmFpro9NRvngqeq31VcV/n9f72AsydUqbws=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmAVt9++1oPrnjR7tTQa1Ol0n8wYjRZy17oMVcXzVP
 cqgFiMeJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZgFbfQAKCRB33NvayMhJ0WMUEA
 CXRnTt7k4f4HAGknmsHODxGaAF/HThv+ptZ8CFtkMmHBbZzN4J3Gk11mdKg/k9ZWwRokrDvuupCdwO
 f8NLV62azMhLxpsx1FsDjVqVgUhV04e7OcSzfYkpWjloXO7V3G1r7g1d1mANLIomYCi2uW7R9gF21R
 qJGaGaVLkmPUBy5VYkOQSPSCjd4PkRFqQ1ZwiiCP23DNRdICPkIPfy8MUqZtlJlMaSHm/bIMxlFJGO
 DayCAnXbINnd4HFG8DOOsnLi936dtQwF39hAZf+PAygwBV/0ctv0pAmQdLcQw3ySQqb2gam9S6YTMH
 ixSV0Iro8prstkZZU4TdtBSzF9iMsk0eLHGyxBBPWEig8Qb+3fYlZ2zv4YJqrz26X1B7Edv75W0oBP
 0wH4a7+UKe5aGkcTJ8/aOipwnV0EDf6suxY0b3WsTpOSLmUJ12PjCFUxJkpDIlcA2rP+bnZSMzwCwS
 y2QCfsbvlYWQje9Q6YwJiBIOcbsJJCcpgb8XmMtE9HiH2S8yNMmBUTSZPYYqb8vHGEwHOuhMO65B9l
 zSNqFchB8ORbgObxgDfKOe4T9Ngu1ZPAiIMY7GlofBfzu0bpVMeonZ16WymC86Y0WLYqQjBy3fsjZ1
 DlekGujVu8UOStOHsh5Gwvp10BAJs4tb10Zxs+P2Nk/3dz/wXVipm/M/hONA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_041001_572324_68B471FA 
X-CRM114-Status: GOOD (  10.58  )
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
