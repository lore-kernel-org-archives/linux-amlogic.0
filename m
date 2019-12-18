Return-Path: <SRS0=A4ao=2I=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B2D0C43603
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Dec 2019 15:46:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2D4620717
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Dec 2019 15:46:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JDnZJx3A";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="MOzKOrop"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E2D4620717
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IDAbIX8pmpBEXhJ29w25fjjSJtfsrOCRuhV4qWM2mww=; b=JDnZJx3AgAffmH
	doUDu4FQ5v75geBeJtovoO2uYVy4uI3NvwjIuBl0Wo/FpKCtWeRF5LsZBd6CXBBa4oZsOXJwig5jB
	AcCvQFmoe1g4iMPSEQ1J4wrcgiP55q2TmHbgy3EYPWeEHWY53nQcvI/HtRcIdUQtwXJ19VSgh+T4R
	4D64pIvMbTWjF8Z5iG4ZSeXtevZYWJKXN6BVuIXcpVm9WmlhobODNcx0gjuBe2lNtr3I1G7cxdGXi
	BaGINUaZDoyrB2H4bgBElTJ67U80wnxpDYv38UxWG93+Z+JPYExtk3d0nSH8KA+nXrq2OoW4+fkK0
	Sbdt3Kw5ytgiXHPq8Lkw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ihbXF-00083I-0b; Wed, 18 Dec 2019 15:46:49 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihbXB-0007zO-9V
 for linux-amlogic@lists.infradead.org; Wed, 18 Dec 2019 15:46:46 +0000
Received: by mail-wm1-x344.google.com with SMTP id b19so2333094wmj.4
 for <linux-amlogic@lists.infradead.org>; Wed, 18 Dec 2019 07:46:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MpYk4ZxORLK9U8orRADFrmupc+cuzyuzN13HM6sJYsk=;
 b=MOzKOrop/aoyr4aHIj6FlChhibXTxUnlZmKs6ikdRKUMp+zSYo/wlD5qVVbl1bw4xU
 2bQvOxNy3CKZAp/KwuCQ2D1lSZhlN70czrJ3IptHa86I+/J56DeLusiU1MhQSBSyY8Sr
 L5cEME2FEgqbnNkB3HRXe7jbvbP06MkcR1T000/54CvnL3zxejL+vAZvOofvDv+kDCFV
 FxlUgi5L/Euv8iHd7qBCWJrzLez753ga4pqG3QfpAwAsHqFHpwjTYIoV/CzRmnX+V0qZ
 vIKNRmdzeKo2CvN7ecthWLeOuGHMj9dab+jboQEZvwpuHgeEj+fNg1A+7661UXLy1MOe
 vW6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MpYk4ZxORLK9U8orRADFrmupc+cuzyuzN13HM6sJYsk=;
 b=Myl37t0i1VHquiXe5p7QpB8QZ1XkKF7tRO3JvDTPhf1Pj05oLcnrjtpEXazISi69sb
 8Y87ej4H9PQRRmOtaBX01fY8OM9IM4XShROohYiqlrGwGNA7eYcn6TyEA6qx5gkfj2lE
 r9gEq+gTuCxm1ZpghFUdfVFb4TepGUAoX7ozKPo3o4c9e6utwwmngSPDEC5b75dHa5GM
 Ew1c8lx57MMVCZymmmYIyuC8QHbTJrvjJQu7iAklWfj/9GNhxK3mGQr+T0VxrDsN291x
 9q+6NmgDKZNicfs0/ExZk1BLsV4HOgXk7WlaI2miiLTKAHshB1r3LZwUf+LUbhdRglo4
 PLFQ==
X-Gm-Message-State: APjAAAU8blkmyRGonrTm9d8/uZaSMWt4sEzzGOFfvSv92tDamsdVQx44
 aHJae9bN/bhNbHcBVKuaRnON0w==
X-Google-Smtp-Source: APXvYqxCqnYVSKzPfGvRns3vdEALXKpTqlz/AJkEO7HjSjYsW4oXY6y7UG6ZL4cgrP7B3eIwD7+Iug==
X-Received: by 2002:a7b:cf12:: with SMTP id l18mr4310085wmg.66.1576684002484; 
 Wed, 18 Dec 2019 07:46:42 -0800 (PST)
Received: from bender.baylibre.local
 (lfbn-nic-1-505-157.w90-116.abo.wanadoo.fr. [90.116.92.157])
 by smtp.gmail.com with ESMTPSA id x1sm2891492wru.50.2019.12.18.07.46.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2019 07:46:41 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@siol.net, boris.brezillon@collabora.com
Subject: [PATCH v3 02/10] drm/bridge: dw-hdmi: add max bpc connector property
Date: Wed, 18 Dec 2019 16:46:29 +0100
Message-Id: <20191218154637.17509-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191218154637.17509-1-narmstrong@baylibre.com>
References: <20191218154637.17509-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191218_074645_331715_DB9085B8 
X-CRM114-Status: UNSURE (   7.09  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Jonas Karlman <jonas@kwiboo.se>

Add the max_bpc property to the dw-hdmi connector to prepare support
for 10, 12 & 16bit output support.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 6a0b4b3a6739..e7a0600f8cc5 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2368,6 +2368,10 @@ static int dw_hdmi_bridge_attach(struct drm_bridge *bridge)
 				    DRM_MODE_CONNECTOR_HDMIA,
 				    hdmi->ddc);
 
+	drm_atomic_helper_connector_reset(connector);
+
+	drm_connector_attach_max_bpc_property(connector, 8, 16);
+
 	if (hdmi->version >= 0x200a && hdmi->plat_data->use_drm_infoframe)
 		drm_object_attach_property(&connector->base,
 			connector->dev->mode_config.hdr_output_metadata_property, 0);
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
