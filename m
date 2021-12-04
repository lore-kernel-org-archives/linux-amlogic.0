Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A3ACC433EF
	for <linux-amlogic@archiver.kernel.org>; Sat,  4 Dec 2021 21:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F/MyLCo99QWCSUKLrK6MB80JeBpOyb7nQS4tyjuvcaI=; b=tvc75TrccEFgVe
	5eMMq1MYbbtuEha7bLBBgjH+YSRqaPHPeAXF9jt4OAciKApk3ct3oa8xJ1eAHpJ+ZlM0x7fltSktV
	pGb1NxDg29gkkAsMaR4YYUGGKwq3brvJVKcM9621ypakcBaZ2C98jHegCM1uBMlRK0iG6vwZ8QJ/0
	vExz9WZVq4u7Tm+/v+V474wheOcNkrE9wliuW4y8GfqvcMJ7qkWqLfiB83gWpzr8yAl7MCxB0Mva+
	SDQhEuJ1ujdmPVsFQ272q3RmDHMOGt8AS8dgZTt5YopnUpLRi7J1t24crgPcKovR+n2pNmsgiY0iy
	4VkqcMMHvyFoumVhHzAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mtcdk-000ne2-GE; Sat, 04 Dec 2021 21:32:16 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mtcdh-000ndM-54
 for linux-amlogic@lists.infradead.org; Sat, 04 Dec 2021 21:32:15 +0000
Received: by mail-wr1-x42a.google.com with SMTP id c4so13558929wrd.9
 for <linux-amlogic@lists.infradead.org>; Sat, 04 Dec 2021 13:32:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RkY3blJ2Gldzm+0qHRdrD81J+3rGk6mYv8Gy9C8RedM=;
 b=aqZqdI52CCuOAzXWDjKPlSTeHkT8Hj7N35FGkJQXpRJXcBTbw6LMePty77LTPMmNNL
 vYkgtDk9ub3H9STsrSWnmqf49LC7f6YoetGg8f6nubRf/GlGzvPzU7kDYXFXds8JVxQj
 aKCJWivUG4hJ9WyjDtbHoYPMWt5xn3pDSwdMIeuT4MIsIZy1PD/DL4EKKCtsk76arzhq
 IdF1UG5oo1HFBwe90zGSAu5PxRlSM9ZB66C2aCVfKv9wRyeD6oUCLke/SWuJraXPdalI
 Of910fz47WNMsHc1Cbq1OcX7NLNcDLeT0Yn6faN5FJ24e2cx/LrSVklwsveiuKsZrXnG
 0b+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RkY3blJ2Gldzm+0qHRdrD81J+3rGk6mYv8Gy9C8RedM=;
 b=0DLjymrVzufshTGh2u0H+rzPKu1L6OErxBzC+ulwcEaYBE1RhobDSaThR8Jx8wQa5d
 A5OziaTJrUkQpUXPDfOIng7TWzK7kIzwAn5G4LD8b6wD5LB9SAIM3k3XglZvSZoYNyeR
 NjUbyLbGtBjNd5pkSqHoY00HKmh+GLZNbT++KqYZ7Ps+lAhFAS+O55Q5TAoEPWgVTz2x
 F3QusK+OI6ZKbPagfzxn7UHO7Af03nipuWH5qWTdC/Hv1AbIucOMaLqVr1E4mBavIaZI
 I3dMC4I2r09OF2DKH6gf8sgjSoti+eoHsrPjPXx+MVQ76OXdX2A1Hkh76CZBB0cGVEsT
 H2CQ==
X-Gm-Message-State: AOAM533iM2ROHg5sbPKVx0N2n6WrE0g7XWneLNvLHlNSgG8M725L75BP
 Bcxwe0Id9hHggLQeKlwLsRwXDrRjq11wCg==
X-Google-Smtp-Source: ABdhPJySTG4c/z2C68cNyuWV71sWaNj8aQK267LRo47C1gEMe3wfNA9R9GzwZ1O6OlP6rHjs2wFPXA==
X-Received: by 2002:a05:6000:381:: with SMTP id
 u1mr32036226wrf.383.1638653529560; 
 Sat, 04 Dec 2021 13:32:09 -0800 (PST)
Received: from jackdaw.lan (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.googlemail.com with ESMTPSA id n184sm8980868wme.2.2021.12.04.13.32.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Dec 2021 13:32:09 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	stable@vger.kernel.org
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org,
 Artem Lapkin <art@khadas.com>, Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 5.10] Revert "drm: meson_drv add shutdown function"
Date: Sat,  4 Dec 2021 22:31:57 +0100
Message-Id: <20211204213157.27551-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20210315135545.132503808@linuxfoundation.org>
References: <20210315135545.132503808@linuxfoundation.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211204_133213_283131_8DB852E5 
X-CRM114-Status: GOOD (  13.31  )
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

This reverts commit d66083c0d6f5125a4d982aa177dd71ab4cd3d212
and commit d4ec1ffbdaa8939a208656e9c1440742c457ef16.

On v5.10 stable, reboot gets stuck on gxl and g12a chip family (at least).
This was tested on the aml-s905x-cc from libretch and the u200 reference
design.

Bisecting on the v5.10 stable branch lead to
commit d4ec1ffbdaa8 ("drm: meson_drv add shutdown function").

Reverting it (and a fixes on the it) sloves the problem.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---

Hi Greg,

Things are fine on master but it breaks on v5.10-y.
I did not check v5.14-y yet. I'll try next week.


 drivers/gpu/drm/meson/meson_drv.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index 2753067c08e6..3d1de9cbb1c8 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -482,17 +482,6 @@ static int meson_probe_remote(struct platform_device *pdev,
 	return count;
 }
 
-static void meson_drv_shutdown(struct platform_device *pdev)
-{
-	struct meson_drm *priv = dev_get_drvdata(&pdev->dev);
-
-	if (!priv)
-		return;
-
-	drm_kms_helper_poll_fini(priv->drm);
-	drm_atomic_helper_shutdown(priv->drm);
-}
-
 static int meson_drv_probe(struct platform_device *pdev)
 {
 	struct component_match *match = NULL;
@@ -564,7 +553,6 @@ static const struct dev_pm_ops meson_drv_pm_ops = {
 
 static struct platform_driver meson_drm_platform_driver = {
 	.probe      = meson_drv_probe,
-	.shutdown   = meson_drv_shutdown,
 	.driver     = {
 		.name	= "meson-drm",
 		.of_match_table = dt_match,
-- 
2.34.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
