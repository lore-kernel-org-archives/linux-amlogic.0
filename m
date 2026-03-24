Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACB81E9A778
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Mar 2026 11:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:From:To:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LeuSh/zhnURzIHZnJFkbMa36Y8N5DSDXTJrdxZbwjTY=; b=o8AcbXtCBuk1Of
	WyZkRKwEKo1PYX9A9sxDGeu4GFGpmJ3zLrMIr3J+NU7Jo0V2YB6K8goqYOzcblnHydsJWzALuUvdr
	qwJPmA4pt/MZx6TGqc1Sh17oNvgC1kf29ujNLwe0iRctsVV2r9R2HUpTwCE2zeY44oty1maNQMZR/
	3hqxVKO3hZtHborbVg5rpdNWj3gHg2V1tSlewwZ+S9MWFmwZUYI7aNdby55fLmJ/vhL0rsdSBU4j4
	6jITxvooWzvz39thIh9VzPvzpjnEWMSeWqJ0BHztK6eAPNzjAEOv++begmUBZkk3JWUtfC7r8u1dZ
	DLEzAaDYnGeQoyqF1sxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w50FJ-00000001J6S-3FON;
	Tue, 24 Mar 2026 11:48:29 +0000
Received: from mail-106119.protonmail.ch ([79.135.106.119])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w50FF-00000001J2Y-33dd
	for linux-amlogic@lists.infradead.org;
	Tue, 24 Mar 2026 11:48:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1774352903; x=1774612103;
	bh=VRl6+bQSrvvEcwcEsxNzNmjm4DwgoFEo/s2/NFGDH+Y=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=gglrElKfA4oKICZE9ZQA8V4KLVGciE1d5/9strNJ3CLEmQrS2r8PAi9z8o9ze0xtU
	 dwrjABH1jlnjC+mkvY6CVOR+yTK2mU5amOwUmR0PHmrHRuPt2vLdtahMob6OmBZiIp
	 QobebVRgQMeqh3rvG5DCoPBqfFVaPVkauG3GmYz00pAEi0EhGzb8TO+gm7hbEzGo7X
	 +jlJNX5H4GPGj47+ehvwRDL9GXHTwT6fYi+uh1uIH/cA0Ubo/TX2IRTOtEgUIY2hUB
	 nTihCRZKMhsGQtFMNt4gUoHj05GgUcD0gu9e47qzlHP1NpCJL6EgPgGkjdkIMrqabM
	 EKsd0lhRCy8yw==
Date: Tue, 24 Mar 2026 11:48:17 +0000
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH v5 2/5] drm/meson: use default case for unsupported DSI pixel formats
Message-ID: <20260324-dsi-rgb101010-support-v5-2-ff6afc904115@pm.me>
In-Reply-To: <20260324-dsi-rgb101010-support-v5-0-ff6afc904115@pm.me>
References: <20260324-dsi-rgb101010-support-v5-0-ff6afc904115@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 8e6fb45145c770093500cd0a9292ca2a6ee94627
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_044825_946432_19E51688 
X-CRM114-Status: UNSURE (   6.12  )
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

Use default instead of listing unsupported formats explicitly, so the
switch statements don't need updating each time a new pixel format is
added.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 drivers/gpu/drm/meson/meson_dw_mipi_dsi.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c b/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
index 66c73c512b0e..4412bd678108 100644
--- a/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
+++ b/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
@@ -119,8 +119,7 @@ static int dw_mipi_dsi_phy_init(void *priv_data)
 		dpi_data_format = DPI_COLOR_18BIT_CFG_2;
 		venc_data_width = VENC_IN_COLOR_18B;
 		break;
-	case MIPI_DSI_FMT_RGB666_PACKED:
-	case MIPI_DSI_FMT_RGB565:
+	default:
 		return -EINVAL;
 	}
 
@@ -232,8 +231,7 @@ static int meson_dw_mipi_dsi_host_attach(void *priv_data,
 		break;
 	case MIPI_DSI_FMT_RGB666:
 		break;
-	case MIPI_DSI_FMT_RGB666_PACKED:
-	case MIPI_DSI_FMT_RGB565:
+	default:
 		dev_err(mipi_dsi->dev, "invalid pixel format %d\n", device->format);
 		return -EINVAL;
 	}

-- 
2.53.0



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
