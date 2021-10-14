Return-Path: <SRS0=MFto=PC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13060C433F5
	for <linux-amlogic@archiver.kernel.org>; Thu, 14 Oct 2021 15:27:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFB6460C40
	for <linux-amlogic@archiver.kernel.org>; Thu, 14 Oct 2021 15:27:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BFB6460C40
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UX8jmNCv28XaS1k7V3Fgcn5SUtAuflt+tzDzmDTnBaw=; b=k5z4mpBzmp9hW+
	zuY4McC9FV5d3EydBXtSqYy8lv+QubMULKrJCgxtTWxfhZZpgVdjkD6O+ZE00CFribut3vST5EsjM
	Wm5xcTBOMCFqahdh7w6E+MKX/tQU8kBi9dRsUTGm6BfkQM2j6/oJCKHA6vKS1RlxX8iwxjXAZBkwh
	Hlur+J5/Z1puoRA7D77fJgN0nvK48fjYa9mQsVIlV51qYVGzXb+3EBvUl1/f3HzTZ4kD+b3qV1IPx
	kFwJHZ1sjR9Bbsy2M1E8YyNZzvUOY8n4edhK4gvPcvWdShijpnHEZQqD7kVxSFvhlzaAJWnBV5gPn
	dKob6pu1HjghZrfdotMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mb2dg-003dsL-TI; Thu, 14 Oct 2021 15:27:24 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mb2ca-003dL8-7o
 for linux-amlogic@lists.infradead.org; Thu, 14 Oct 2021 15:26:21 +0000
Received: by mail-wr1-x42c.google.com with SMTP id r7so20708640wrc.10
 for <linux-amlogic@lists.infradead.org>; Thu, 14 Oct 2021 08:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TQyJyeyxugDyeCUhn5i4YMOhGyD1g0TIMIamYKTURg8=;
 b=aUp3lJkhPh7AP+vd/IxIyLZ9pww2/86fdh30VMRPWAjOPgcYeMdPzrsxZP6sBE00E8
 pGgzyLGLmp7zVQ9cUv4mpduzaEXvlUsIaRQ5JV5NYw5sBZgTNhtsBPU8cWCoubF4OfIc
 We6escDBTXR7ecjOqAG4gkw4+7NGQRUo4+QsAzHDndGtbN1dr1o8V2Z1KEESagi+16Rl
 5fOOUoFuqRymwJctDz1xKKLZDd4T60MPavnGIjCNluwnnSLQII3vOnjSlAbJt3b7KJll
 vQmOM1DfYTWxh5JoOgbb+9xIQpmPQaoVZxhIPK6kR3U8HplWUWWagcbLKHRnB6FdBF16
 6gJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TQyJyeyxugDyeCUhn5i4YMOhGyD1g0TIMIamYKTURg8=;
 b=7qrCe7EMJYcoBdV4p8OYAW4h5zKO3ufZIAKKgYJ3rTosNNejpa4u0Kf/0lo12T3N3n
 X5mMCSzQNnH4/HMOgVmHZaSaOQthqja6cpRDaO2aQoq/Djvrsm04RY8dhLmY4rN57q7j
 JE4t2zyo9PHoA45Z2z5m+DytfMc+ib3V4gluNX3pCpKXWYjPwbD5O8q1BdtI4qDOPZc8
 O0CvbxdkkO8gLDRCYQ3VRvYCVbXDiHIpuwCqHqfHR6NmarWNgVHCMj3iUpuHNy/AxDSh
 hfH3pE33jmWz2hXPlj76O7zIZu3Wjinp4DTxl8O0ymnN0IKd27oMKEUpn/Rewfn/kSHO
 TtyA==
X-Gm-Message-State: AOAM532QQihxq7asPHijlfdVMDuqonuYAi7E7zeObwXXef+0KxoXpORr
 xiq2fudxsN0EJysnX92s8jYEhw==
X-Google-Smtp-Source: ABdhPJxnLyE8e0XkabFsMCNQvlY0H++PdbAFZrHOuqQqMKmsmbK8aX172SuBdkcJX2Cj9DFX3GNU8g==
X-Received: by 2002:adf:bb93:: with SMTP id q19mr7638741wrg.423.1634225174291; 
 Thu, 14 Oct 2021 08:26:14 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:209b:8400:2b80:b4ae])
 by smtp.gmail.com with ESMTPSA id k22sm2626790wrd.59.2021.10.14.08.26.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 08:26:13 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: daniel@ffwll.ch,
	Laurent.pinchart@ideasonboard.com
Cc: martin.blumenstingl@googlemail.com, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 2/7] drm/meson: remove useless recursive components matching
Date: Thu, 14 Oct 2021 17:26:01 +0200
Message-Id: <20211014152606.2289528-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211014152606.2289528-1-narmstrong@baylibre.com>
References: <20211014152606.2289528-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3111; h=from:subject;
 bh=hBDX9bpPEmClmGilczb0BvjIpqS0+aaehaCml/3nEUs=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBhaEt/6ArrByBlXtYa4Vcu1Celjod/sPgyacJsGSYf
 F+mjdc+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCYWhLfwAKCRB33NvayMhJ0UhTD/
 sH5NZJVQx2YWy6sRmd61nqnsAGOSLvKNLmGt8xiRmm0Zb6ckWoeM30vuE14uVqqzR5ikE4cAk/T3jF
 7/r1O/KwZkOPSCzUIFpNFuzUPkO2d0DjdyTSbkZFUEmBLmAwGFio3y6BQu8Pa4pURJP0FgXWNVYVye
 aT5CTX2lGsSJseYDx5JYNt6U71cmF9f78gV4+1PrRmu8s1rto3ltR/8K7WvWcURGAm8ordgWepmS5E
 7dj0ZYEWUvKWJLZFePsoHZwXUGBcrSLd4N6AP285F8+1dD7pULchywDPVlue6vJwlfVy+QUJUvwu3j
 iXKQNRu2FzqliPbcwmbtkymy6kUvBdRKp3WPoRpPZgAdlEzZMklGMm0UiUFICCyKNt8Cwd9a9mYNGu
 fuOllgCaOoC/cdInuHDEQP3wZdS+m1dlbdFzVPhcYOqSDgtbVGa17Y9DBms8ypC0KWUmIh3TopYHun
 o3mNZ3G5AOzbil+PIl+oFEef6n9t/9w55rU9m1638cRpZOJknrxAdP8NWUDkV3//J6Ynq4UzVEcWbl
 H+4OkvqyX+UchzQ+NrfCQssWeD3aF6Vn+17AML3/MN48tFNupMUCvq106yYJeucpiIlDpfx805qymA
 hXLGWVK/F9bG9qFrA6ImJQW6Otdxc+H9TRc2JpYtS+iSrdbcW7dw6ohCHb/Q==
X-Developer-Key: i=narmstrong@baylibre.com; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211014_082616_288213_E008C7D5 
X-CRM114-Status: GOOD (  14.78  )
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

The initial design was recursive to cover all port/endpoints, but only the first layer
of endpoints should be covered by the components list.
This also breaks the MIPI-DSI init/bridge attach sequence, thus only parse the
first endpoints instead of recursing.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/meson/meson_drv.c | 62 +++++++++++--------------------
 1 file changed, 21 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index bc0d60df04ae..b53606d8825f 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -427,46 +427,6 @@ static int compare_of(struct device *dev, void *data)
 	return dev->of_node == data;
 }
 
-/* Possible connectors nodes to ignore */
-static const struct of_device_id connectors_match[] = {
-	{ .compatible = "composite-video-connector" },
-	{ .compatible = "svideo-connector" },
-	{ .compatible = "hdmi-connector" },
-	{ .compatible = "dvi-connector" },
-	{}
-};
-
-static int meson_probe_remote(struct platform_device *pdev,
-			      struct component_match **match,
-			      struct device_node *parent,
-			      struct device_node *remote)
-{
-	struct device_node *ep, *remote_node;
-	int count = 1;
-
-	/* If node is a connector, return and do not add to match table */
-	if (of_match_node(connectors_match, remote))
-		return 1;
-
-	component_match_add(&pdev->dev, match, compare_of, remote);
-
-	for_each_endpoint_of_node(remote, ep) {
-		remote_node = of_graph_get_remote_port_parent(ep);
-		if (!remote_node ||
-		    remote_node == parent || /* Ignore parent endpoint */
-		    !of_device_is_available(remote_node)) {
-			of_node_put(remote_node);
-			continue;
-		}
-
-		count += meson_probe_remote(pdev, match, remote, remote_node);
-
-		of_node_put(remote_node);
-	}
-
-	return count;
-}
-
 static void meson_drv_shutdown(struct platform_device *pdev)
 {
 	struct meson_drm *priv = dev_get_drvdata(&pdev->dev);
@@ -478,6 +438,13 @@ static void meson_drv_shutdown(struct platform_device *pdev)
 	drm_atomic_helper_shutdown(priv->drm);
 }
 
+/* Possible connectors nodes to ignore */
+static const struct of_device_id connectors_match[] = {
+	{ .compatible = "composite-video-connector" },
+	{ .compatible = "svideo-connector" },
+	{}
+};
+
 static int meson_drv_probe(struct platform_device *pdev)
 {
 	struct component_match *match = NULL;
@@ -492,8 +459,21 @@ static int meson_drv_probe(struct platform_device *pdev)
 			continue;
 		}
 
-		count += meson_probe_remote(pdev, &match, np, remote);
+		/* If an analog connector is detected, count it as an output */
+		if (of_match_node(connectors_match, remote)) {
+			++count;
+			of_node_put(remote);
+			continue;
+		}
+
+		DRM_DEBUG_DRIVER("parent %pOF remote match add %pOF parent %s\n",
+				  np, remote, dev_name(&pdev->dev));
+
+		component_match_add(&pdev->dev, &match, compare_of, remote);
+
 		of_node_put(remote);
+
+		++count;
 	}
 
 	if (count && !match)
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
