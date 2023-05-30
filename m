Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F01CBC7EE23
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 May 2023 08:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9YIuVXKSLCyvXvDCUEIhu9FBfJ4bL2nEE3fqSaJAOn0=; b=Uv9F4dW72eq5cf
	rmv2rZN+k1ijQcXBrHKI3ivhrAHqF345xYMiWeDCfW21W6RWFVNxN3Wb23JBab3cJbSVA/aLIHj9N
	0aYf1YzF2W8G4//0oR3l+MLfW5LI4S1GVxOC8Cd5grBY/9RvXthelF4exZ0xoLyuj+GPY8/VkWVNe
	+lTvglfdJhLMbERLHRQh/g+iJ1/UWxQuX2tUY7sgTAF4SeG7IDeb5MrYIc2LIQgad2KWFAqi2xNI+
	ebWDIt26dsNT7r7yhaRwnUVkDaKZlSm3GZOiLMsA0JbpkpvIgKCRE0D2ioNHkH5vfkuqbXconfUX7
	yRlH7tBfA6pyZtzPW/7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3uuo-00CzJp-0R;
	Tue, 30 May 2023 08:41:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3uud-00CzCe-1p
	for linux-amlogic@bombadil.infradead.org;
	Tue, 30 May 2023 08:41:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=jfEXvkrzeaqY3Zz/djBQFxvd7vEtcQQIyY+Jgs9PfMk=; b=eMYZQ2Ao5b7zbDE+VtV5p8dYLm
	uU/ZEX9S7H4XtDAwTy0YyJMSUHfEu7xeslXYCki5/EAcDv68cedViqZFCwVrGjjKvRy7693wrIiDB
	5/KgPH1s8z2ZpBjXSDhLRCn2hO4GeHplwnpavoPf/fGN2hWcS0siN930/1b+UQ7IKHc3tdJKvz7W7
	za2GdRLx9zOszL55Q8onnEZ5CqOTa8qqfkQsEfqc9DidCf34MOOfTN9IH9sH3fXqEGoTOnwTg5fRz
	TDsa76i3gYQBe2wlekj1O9xUmYKvBTZnC2wBh3DUZo9sY3xfU913u9vfSFyKvCfwDZ3XAHoErI9bX
	8eH3kwwA==;
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3tw1-00DbtU-0i
	for linux-amlogic@lists.infradead.org;
	Tue, 30 May 2023 07:38:37 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-30abe551605so2928748f8f.0
        for <linux-amlogic@lists.infradead.org>; Tue, 30 May 2023 00:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685432304; x=1688024304;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jfEXvkrzeaqY3Zz/djBQFxvd7vEtcQQIyY+Jgs9PfMk=;
        b=krxbND8uKOMMZsMfjM4tgwX0/ik3KeKaeWX6435WFpJSGefc/k9tb6CEc6ELkHKQDX
         gHm1rc7h1CPqB0W8opYJWRRwrkCSsrKUULYrkeLlnwjEo/fHheAG5HE3vUydEIJ8msGk
         kvdNuyNnOrpIfR8dLNRjJA2daGNb+B9peXTRayFhm+mqrmfVDTWXdjzVJnv/uW/Hrt4K
         fGd5TXk4puGWhtT2JIc8vrOm2pRyYBa8VWwZ+CcfC9lU13zGAJ5zQeuzeA9unmpZALvq
         jerl1Ervf0exDkS9wig6JqxHOBALoaNIUDQaGXqRzzTG1cgQE2yEmem1zPnWnhcvymLd
         Hxfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685432304; x=1688024304;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jfEXvkrzeaqY3Zz/djBQFxvd7vEtcQQIyY+Jgs9PfMk=;
        b=Y/qIOFSkh5QbkEOmdrc1B3Jwg9vCrUnnL/6hCHG41pxV/9eip7fN/h0vAm9KZP+Hy0
         9CF15cNx88JDBqNk8b5Ej4HcFj4r7tvX5KCTuMSt70TgYXAg2LfdsWIqxCOqmxJjsapn
         6TtqqxiW9EE/pZ9zKlzYUO6gIQ8X3vh/gFj4f+ozLyaNH8K4VjALvJIUH5RumzPmBXp4
         l/5trXHjapDwTMCxwazBesKR1ce4wZobUFME5FAq5zZf6Gez2AStZpjpEgxdPH9NAj7W
         YLTz7m8xhKzHholNLagpzXxJQrPDQPom2eOzXO7dU9rb1yhqWuehF+ON49H/ZDQ+nc2n
         2l1Q==
X-Gm-Message-State: AC+VfDzQ/OsPywz6uTZmsAJDTK7TeE762EqRockWdX60nJ5wh1A8Iben
	nbT35FWkJz5rRHUm2ZAd2l+KeQ==
X-Google-Smtp-Source: ACHHUZ6mZIDAxfv5le0pkcFkIO+8ARVgJXLbbQt8/vxlwETrhc1V1bFh5QTnMwv7dpsAPCXNUZOoFg==
X-Received: by 2002:a5d:4044:0:b0:30a:8e6a:3d77 with SMTP id w4-20020a5d4044000000b0030a8e6a3d77mr1142304wrp.1.1685432304012;
        Tue, 30 May 2023 00:38:24 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id m4-20020a5d4a04000000b003079c402762sm2312013wrq.19.2023.05.30.00.38.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 00:38:23 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 30 May 2023 09:38:10 +0200
Subject: [PATCH v5 09/17] drm/meson: only use components with dw-hdmi
MIME-Version: 1.0
Message-Id: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-9-56eb7a4d5b8e@linaro.org>
References: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-0-56eb7a4d5b8e@linaro.org>
In-Reply-To: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-0-56eb7a4d5b8e@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Sam Ravnborg <sam@ravnborg.org>
Cc: "Lukas F. Hartmann" <lukas@mntre.com>, 
 Nicolas Belin <nbelin@baylibre.com>, linux-amlogic@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2777;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=nVXfezvQbKE5gC4JrB0CVduxieCr6UkdveYDXaG+sjI=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkdafgB8ChwHhm0E9pEZfTkphqOUzLZTgFYnPzxmOG
 /S4wCUKJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZHWn4AAKCRB33NvayMhJ0UkyD/
 4nse+EzB7hATP8CQAMK3zfVTtmlq8CoWG5Fcwju9bfQsCYBVPvp9Zysjg6wxBX+W13gkaO96AOb2J7
 foQf4doFXgEZJzBRjoX21BePaAK5dtyqI27XYUWL8zvYWQfZ/kDfhezwKt6FBKyalaeNCMgTwsvnbe
 60ycoHMPi4z56Gc08oDa4f5DcqQ6eWkAXe+SVypHwmoti6uEyl3icc6ca0D8APd+s/Jg4sHopL/Xr3
 JiiGulF3tQXV6hF88aWtgMKQyLpKhbBu2Qcm1mhi+G5rnkdFFxB9spFkTYLuMsn6O/+EZjdC+qhCAI
 rP6BhyvoAYUB+MHEvTbjIja5e9v7x874k5tXcxQ+CpCmIdrJxTAuNQgur1E0DZOMMisqTmeap/vHyZ
 AH09CltXd1ZrSl5qlliTw0vrwplJb6cDK8L/nQka5f868acWitvPVcpUKeA32xF8X6WA7iQWBHBRO4
 EMpnhPZH0+2/2rZZcOqqBgRWs4jL6/D4rXpZzkQZ+Q0l7k5VbNt8tjVG3v3giWr369aRlQNZs9SePj
 vM68t+3W47ka0W7g5jJ3cFXafmjJme1FwBjc9PXiSEeYAjSaDVCE6iNfyQmLtruHqFev5ITlubRTBm
 yIquMb+6j1mJXzhswTrD205PsdVr1BDSFRBvv4WUcoKNU8XCUv7Pfe1GWIUA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_083828_698242_A8165ACC 
X-CRM114-Status: GOOD (  13.84  )
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

Only DW-HDMI currently needs components since it reuses
the drm-meson driver context to access HHI registers (sic).

Once this is solved, we can get rid on components.

Until now, limit the components matching to the dw-hdmi compatibles
we know to require this hack, for other bridges simply use probe defer
instead and get over this components sitation.

The back story is that we simply cannot attach DSI adapters bridges
if we use components, only DSI panels, this is because we bind/unbind
the DSI controller at each drm-meson driver master bind tentative.
With this the I2C DSI bridge is unable to find the DSI controller
host and everything fails to probe.

This will simplify a lot adding new or older HDMI bridges.

Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/meson/meson_drv.c | 30 ++++++++++++++++--------------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index e060279dc80a..e935c0286a20 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -451,10 +451,17 @@ static void meson_drv_shutdown(struct platform_device *pdev)
 	drm_atomic_helper_shutdown(priv->drm);
 }
 
-/* Possible connectors nodes to ignore */
-static const struct of_device_id connectors_match[] = {
-	{ .compatible = "composite-video-connector" },
-	{ .compatible = "svideo-connector" },
+/*
+ * Only devices to use as components
+ * TOFIX: get rid of components when we can finally
+ * get meson_dx_hdmi to stop using the meson_drm
+ * private structure for HHI registers.
+ */
+static const struct of_device_id components_dev_match[] = {
+	{ .compatible = "amlogic,meson-gxbb-dw-hdmi" },
+	{ .compatible = "amlogic,meson-gxl-dw-hdmi" },
+	{ .compatible = "amlogic,meson-gxm-dw-hdmi" },
+	{ .compatible = "amlogic,meson-g12a-dw-hdmi" },
 	{}
 };
 
@@ -472,17 +479,12 @@ static int meson_drv_probe(struct platform_device *pdev)
 			continue;
 		}
 
-		/* If an analog connector is detected, count it as an output */
-		if (of_match_node(connectors_match, remote)) {
-			++count;
-			of_node_put(remote);
-			continue;
-		}
-
-		dev_dbg(&pdev->dev, "parent %pOF remote match add %pOF parent %s\n",
-			np, remote, dev_name(&pdev->dev));
+		if (of_match_node(components_dev_match, remote)) {
+			component_match_add(&pdev->dev, &match, component_compare_of, remote);
 
-		component_match_add(&pdev->dev, &match, component_compare_of, remote);
+			dev_dbg(&pdev->dev, "parent %pOF remote match add %pOF parent %s\n",
+				np, remote, dev_name(&pdev->dev));
+		}
 
 		of_node_put(remote);
 

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
