Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50783C001B3
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Jun 2023 16:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n+eWLeOW9g3w8svZV4u44izfTXg50w/2xD9+kYsNVJs=; b=tzPWY95fQMsI59
	2G4Si+7hPnbcZyc2PYjCeTaWaPN528Kpluph7l5icUp2E/nKC8nJJvil602ZxSjHtFcA9/OsJFJIG
	UWck8+N42UgnnTCHkkOp+wqLdMmIqgOxd4zngur7sFknos5O7WTV/ThsNh7RLWla9Urq7FlN/tNUf
	E7WPAiCOHMkaj0z+7TvS4TzMIoqJQUnujDUZ06Jb5Fe5KON79WE27GlKSWbe1v4TtzkAj6jJqkMw6
	f6ag/NigdPR4mr2OsCeVy8uwb5aVNN0g7n7YAYYlBsKAbSiaKojSZdh68UcX/gF3259mHcVB+RPWH
	eCUjBW9ahGiyPmz2ZxLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFH0A-0043Mt-0O;
	Fri, 30 Jun 2023 16:29:42 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFGzw-00439e-2v
	for linux-amlogic@lists.infradead.org;
	Fri, 30 Jun 2023 16:29:30 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-31427ddd3fbso307046f8f.0
        for <linux-amlogic@lists.infradead.org>; Fri, 30 Jun 2023 09:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688142565; x=1690734565;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QLQomoWqlEuvut1iVqbbj5exi8ubZWITHtJI3sKzn+8=;
        b=cmgqLpfuvG+if0xbg3zKjJmHd0RdVwXPeIhGpqg1MY4MUogkWDggmX3vNdUceKIQ5e
         J4OQRqLWYhUrTFtpVRdOqJFoNtQURpTCsF9Tua/BR6KVH1Z5uwzkti3gQkxVZQNu9lRG
         0UvJt7czJeoYcSJ5N35jxfpqhWtKcFRfOosQSBu2m8MgCzhs/kJf+QIMSu7DQDxLglis
         VHTPmRYqqhZvvwdiGkLc8dcZE7EKNa4nksg57/BOwLD/22L91EVszEl8D9AkIUQxybIL
         gqvCFsZ2zb/8p+mdWlkttwzh5I94B7T5p4POfgvwOsRQtcTyvJHPy7rfVsMzeI3JC4fb
         V2tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688142565; x=1690734565;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QLQomoWqlEuvut1iVqbbj5exi8ubZWITHtJI3sKzn+8=;
        b=jq9RukmCNwVVqhTt0Seo8hdEZcISGaVTZ6y4bO/xqn4iIjokTvK6dsQ7tDbE6jg4EY
         ljLvkdo5AzHTvqkKF837XFVy7xVMvOb1W7NyEScC2nHbtiGx3Qgt9Y5oQbYA5S8MXtU2
         X/6goYmA6WOH/TlPAzKgxX5SCHscnNbBdoTEek/irDCe0txdrTBqnNcu1oNAuuuNsBlu
         rYkA4OV097CqcnbjGF/lQkmaMIagnKEVFhTwxltZdQE7iT8Ct3PRTBiTmP4ehNoHTIuH
         HUBYsiaqPKCfcqJZJxDhmk28o+T9dteJS2ctbqv6wPbdOSzps2maC+rmGHyaKGVL57Uf
         Pi9A==
X-Gm-Message-State: ABy/qLZCQo9w2q+29oSlZgys5F+w5X3D/oeEO5TzubEM8WBhW+P/UMCe
	Pvo9i4zd+rzE6iy1oaKXXySiuA==
X-Google-Smtp-Source: APBJJlFauMJrbtEhAPnBe75TN+jmd6XzbnZMpUxj/sIL52hxut6neaSf+FGnEne95dLchbEIkdRBZg==
X-Received: by 2002:adf:cc86:0:b0:314:1244:7fe5 with SMTP id p6-20020adfcc86000000b0031412447fe5mr2455634wrj.55.1688142565225;
        Fri, 30 Jun 2023 09:29:25 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id cx16-20020a056000093000b00301a351a8d6sm18835836wrb.84.2023.06.30.09.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 09:29:24 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 30 Jun 2023 18:29:12 +0200
Subject: [PATCH v6 5/9] drm/meson: gate px_clk when setting rate
MIME-Version: 1.0
Message-Id: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v6-5-fd2ac9845472@linaro.org>
References: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v6-0-fd2ac9845472@linaro.org>
In-Reply-To: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v6-0-fd2ac9845472@linaro.org>
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
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1207;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=+pwHqu7ZxC7Ri6gVdtmlOTLk1wyBSRQ1FGdiXUQUWjE=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBknwLbtNANq+/HzXMwO/oD3Ticr4j3+8MstaXiDrlk
 AGLwCXWJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZJ8C2wAKCRB33NvayMhJ0Zt2D/
 9ruyKKElwSqnsoH9WgUG+bQVpc7hi+zAfq714A1xl/IfX6w66J92C407oo1AmST/B7W8nthq2Icl64
 fRZYduun8JHmQE4z82jK3SzdIIXIOe7MJbgZTQbewAwmgbWlWR6uDh8j3KWL5moO/Qn+HAceY6AMBW
 Xz89TrKd6lZYNbksxR3ZdREBUFa3kEbzpKPvuCib1FrsHu3FY/kBVjcZxRBvFXFeyNQwyLVTI9Ww3a
 7iuy5hJlISdeqkRwCOqHDSezEKlfVlCO6vbGEeR5elF2Q0gxfuT+Po/bLLroDP7UuQmtxTna04hF5T
 nuRILRb4+2cb5eOV4392RcLaquxbFdYT+UmaBX3L+7xhDUU9gNciuwNmeR2aIaBEjhqzIHVCbMwyuQ
 vqVhlJM6+M4LPZhy0qXpZuQsuvyinYOY8EcWTWP9taudTNuOD3KD95VMkEpj9ZLoaZojc2ULEZ01oO
 /jwv3hk0TeDgVP72XKk85vJbYGC1xMLkll8XGFDhFOvKHO3B4DEWLkrkyzh2bBS8+VJjh7W42QNzpw
 OuqBk4nmoVKOS0rgHsbN3u0I2sGwFzntG1CU0IDTyfEaI+5kCL/SjIMz6M13N0O4R0zZB6Ak33fDwo
 HUMEub2+IlcdqBVY5vf0vzpRJPzCKd7VO91ARFOBj8+1GAiTwBAlDqcemXpw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230630_092928_982711_688E9771 
X-CRM114-Status: UNSURE (   9.66  )
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

Disable the px_clk when setting the rate to recover a fully
configured and correctly reset VCLK clock tree after the rate
is set.

Fixes: 77d9e1e6b846 ("drm/meson: add support for MIPI-DSI transceiver")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/meson/meson_dw_mipi_dsi.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c b/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
index 57447abf1a29..dc63d2d813a9 100644
--- a/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
+++ b/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
@@ -94,6 +94,7 @@ static int dw_mipi_dsi_phy_init(void *priv_data)
 		return ret;
 	}
 
+	clk_disable_unprepare(mipi_dsi->px_clk);
 	ret = clk_set_rate(mipi_dsi->px_clk, mipi_dsi->mode->clock * 1000);
 
 	if (ret) {
@@ -102,6 +103,12 @@ static int dw_mipi_dsi_phy_init(void *priv_data)
 		return ret;
 	}
 
+	clk_prepare_enable(mipi_dsi->px_clk);
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
