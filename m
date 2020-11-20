Return-Path: <SRS0=y0rr=E2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBF81C63777
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Nov 2020 09:42:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CC1D223B0
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Nov 2020 09:42:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fBqqUb+q";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="tI0i1Hgo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4CC1D223B0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8Cryh38XvfrBRGkXk64q1PYWm8Q5F/jZVNXi1i5PgEk=; b=fBqqUb+qAS2/EHBWSxP4km0PW
	9CxvkrFbKHJECudDCu3nTlzfVI4QoPSNiueHehrGNQSukXjc4na/Et+i1/OKgGS/UWVb2JB5Zn2jz
	Q46eDxeMHMZ/8kszM3xBjjRePG6RO2irdPVytvNfeIphq4W++n8poBaDk60Xkfjznp98IgP+f5Z7i
	9B9+q+/p4ZTdYFTTIFRLzSyol2A/GCKJM+CCnPtoEWVSp8pV1UcmsdzeHZuPo84OmjFloG1AN5Ko/
	/tlg7a4S805SWkd3iLquDpQrZLuhcTlMlzLrxEQ0J9sm9w31zI5AT4MAD1TqWegXpjKPcQSk8FvU2
	L4gXQjx/g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kg2w5-0004NB-38; Fri, 20 Nov 2020 09:42:33 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kg2vk-0004Fy-Vc; Fri, 20 Nov 2020 09:42:14 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 228D62240A;
 Fri, 20 Nov 2020 09:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605865332;
 bh=iQcVnrGpf37U4002Avz2RPHVjfPk0q8ZDK+TTqhRmEU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tI0i1HgoMJfpibnKglXJjmS1wJO8PAk9CTLWx2bG4/DhR/xFFoQhhHvyKfMTQ7YQp
 /kYqRu+xQDD/bOwUT1E60aktiEEdq46ogUSv9OGITvPFZvm4Utwctfj6FJTV3Csgmz
 1mYvZpBIy4k2GzKUYWWF7ih/FQ8J1cxwfJYmxzQc=
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78]
 helo=why.lan) by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94)
 (envelope-from <maz@kernel.org>)
 id 1kg2vi-00CDFB-92; Fri, 20 Nov 2020 09:42:10 +0000
From: Marc Zyngier <maz@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 2/2] drm/meson: dw-hdmi: Enable the iahb clock early enough
Date: Fri, 20 Nov 2020 09:42:05 +0000
Message-Id: <20201120094205.525228-3-maz@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201120094205.525228-1-maz@kernel.org>
References: <20201120094205.525228-1-maz@kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: narmstrong@baylibre.com, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 guillaume.tucker@collabora.com, kernel-team@android.com,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201120_044213_162478_F755E44F 
X-CRM114-Status: GOOD (  16.22  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Guillaume Tucker <guillaume.tucker@collabora.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, kernel-team@android.com,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Instead of moving meson_dw_hdmi_init() around which breaks existing
platform, let's enable the clock meson_dw_hdmi_init() depends on.
This means we don't have to worry about this clock being enabled or
not, depending on the boot-loader features.

Fixes: b33340e33acd ("drm/meson: dw-hdmi: Ensure that clocks are enabled before touching the TOP registers")
Reported-by: Guillaume Tucker <guillaume.tucker@collabora.com>
Tested-by: Guillaume Tucker <guillaume.tucker@collabora.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/gpu/drm/meson/meson_dw_hdmi.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
index 29623b309cb1..aad75a22dc33 100644
--- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
@@ -1051,6 +1051,10 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
 	if (ret)
 		return ret;
 
+	ret = meson_enable_clk(dev, "iahb");
+	if (ret)
+		return ret;
+
 	ret = meson_enable_clk(dev, "venci");
 	if (ret)
 		return ret;
@@ -1086,6 +1090,8 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
 
 	encoder->possible_crtcs = BIT(0);
 
+	meson_dw_hdmi_init(meson_dw_hdmi);
+
 	DRM_DEBUG_DRIVER("encoder initialized\n");
 
 	/* Bridge / Connector */
@@ -1110,8 +1116,6 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
 	if (IS_ERR(meson_dw_hdmi->hdmi))
 		return PTR_ERR(meson_dw_hdmi->hdmi);
 
-	meson_dw_hdmi_init(meson_dw_hdmi);
-
 	next_bridge = of_drm_find_bridge(pdev->dev.of_node);
 	if (next_bridge)
 		drm_bridge_attach(encoder, next_bridge,
-- 
2.28.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
