Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53BA3C636CC
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Feb 2023 09:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Lsm4KNVS1DN9uEwp0pNpdFzCREeQbj3cvMLfKLsyGC0=; b=YA7BrDgrY2K+HC
	M4bddISmplunO8deUyJo4Z5F2vXW/1Kt2RI4zyjSQ3DZe4mMxKPmdjWbTuRReDwawxqM70vI93N7A
	13A91R/O7i4wcWhXg0v5T7b27ak/3yAbCJzQTt8yUr96JyjzFViFnX7O9nj2/fyR/v6xltler7O5v
	LfuSQ636XO7WTgyh/bIhfSaHIz6AAU1Ht6cj4S7g/6uveCQW8TTUa+wZE/Ye3+byjjctEGO/T17hQ
	LWcn9ba9zXCrDQ9smyVY1zSFp0lUHVK+/6hAjR+Wv8/astJicXUnWyttdnX6ApSvLGH7OmCTwDAfS
	YQnzCTEWcWOruAjtJlnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRVFn-00Dus5-DA; Mon, 13 Feb 2023 09:36:07 +0000
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRVCF-00DtBO-Qr
	for linux-amlogic@lists.infradead.org; Mon, 13 Feb 2023 09:32:44 +0000
Received: by mail-il1-x12d.google.com with SMTP id v15so4930321ilc.10
        for <linux-amlogic@lists.infradead.org>; Mon, 13 Feb 2023 01:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HBz92z5A8CZa/xH83NbuX5+91oG8R3c7gdeOhlTDlKA=;
        b=PTUc3vXyXoqSkn9BsgwWHkXFDBT0xwJkWyWTC06HDyAu0xsxh3wUGX1fSckmu64gDn
         LfMFHtwdZRRgfR2hl26pjCvG/Ptp6QdqNgWxQ1gq26Hz8QeF6ieFlTzuwqSmNr9IozIn
         ObSkHz1bBsm/sdePESII2BNovcKIPjnreiVQMuRpiHH4IP6f2gOqcLxpP5IDQJaGK32f
         Ww9Yz2RNxx0wdfykTiuZUIOrbHK/nvix7akhBdZ80wmN8muS7F635m61YLYj1141VZj0
         z6/fqyMlVSyfHKvl9FlRRZ3gUAhCTY6bo4hssX+Uz1pBn0FvI66VijCs6UBbg76vEke3
         fgpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HBz92z5A8CZa/xH83NbuX5+91oG8R3c7gdeOhlTDlKA=;
        b=dVHKB0gWUCby2n0nqOrOSVJINL8yzMpbrQehTd1/z3kArj7CzEubJpV4trcNOVs9Hz
         6iZWdZx23geonLXYhpNlJ4QJ+vybMAfR2NOJqbcbHvyThES7rMS2S2rI+//4Cx4v0tjg
         0LgwXkQWuYoixQgP8TCEip5a0NSoskNIMnLlkA/GbA2gHbazgdi3ur2KlfdgBLn1OZdH
         ew0vhqOGOLDzaV5IvsikZTHltkewfw2naiEVrAJVghFTVISt3dgNk9K6ddnJH9tz5e+E
         aJRv7uoWE9uv5smDC7CvRDlJshxvGulgdOipN9VXn7akzDCM2X0b2NXjngaTrrG6RSu0
         tW4g==
X-Gm-Message-State: AO0yUKVqjdT9leTIyf2vYiU0mjE6W50C9cTUsbIjk+3BuJOI4sFYSTDd
	corxQlepV0WWLrdCm6vVTi2dwg==
X-Google-Smtp-Source: AK7set+hjjq9yGMomTKRGA59ne7HDilQggjbF/jlQkSZf17NedHYh2S0uP13f98jIUFirkZ0Z844Gg==
X-Received: by 2002:a05:6e02:2143:b0:315:35d4:1d28 with SMTP id d3-20020a056e02214300b0031535d41d28mr6432722ilv.8.1676280744277;
        Mon, 13 Feb 2023 01:32:24 -0800 (PST)
Received: from [127.0.1.1] ([2a0e:41a:894f:0:2487:f87c:fb5b:9046])
        by smtp.gmail.com with ESMTPSA id v14-20020a02b90e000000b003a0565a5750sm3695383jan.119.2023.02.13.01.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 01:32:23 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
Date: Mon, 13 Feb 2023 10:32:09 +0100
Subject: [PATCH v2] drm/meson/meson_venc: Relax the supported mode checks
MIME-Version: 1.0
Message-Id: <20230210-relax_dmt_limits-v2-1-318913f08121@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAJgD6mMC/32NXQrCMBCEr1L22UiSthZ88h4iZZOudiE/kNRgK
 bm7wQP4NHwD38wBmRJThmt3QKLCmWNooE8d2BXDiwQvjUFL3UutpEjk8DMvfpsde96y6MeRNCo
 7WfuEphnMJEzCYNcmhrdzrVw5bzHtv5uiWtz/LBYlpEA1TMNFD8vYy5vB3bFJdLbRw6PW+gVai
 TTvuAAAAA==
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Da Xue <da@lessconfused.com>
Cc: dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.12.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_013228_369328_12223469 
X-CRM114-Status: GOOD (  10.34  )
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

Relax a bit the supported modes list by including also 480x1920 and
400x1280. This was actually tested on real hardware and it works
correctly.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
In particular relax the resolution checks to allow more resolutions like
480x1920 and 400x1280.
---
Changes in v2:
- Lower the hdisplay limit to support 400x1280 as well.
- Link to v1: https://lore.kernel.org/r/20230210-relax_dmt_limits-v1-0-a1474624d530@baylibre.com
---
 drivers/gpu/drm/meson/meson_venc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_venc.c b/drivers/gpu/drm/meson/meson_venc.c
index 3c55ed003359..fcd532db19c1 100644
--- a/drivers/gpu/drm/meson/meson_venc.c
+++ b/drivers/gpu/drm/meson/meson_venc.c
@@ -866,10 +866,10 @@ meson_venc_hdmi_supported_mode(const struct drm_display_mode *mode)
 			    DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_NVSYNC))
 		return MODE_BAD;
 
-	if (mode->hdisplay < 640 || mode->hdisplay > 1920)
+	if (mode->hdisplay < 400 || mode->hdisplay > 1920)
 		return MODE_BAD_HVALUE;
 
-	if (mode->vdisplay < 480 || mode->vdisplay > 1200)
+	if (mode->vdisplay < 480 || mode->vdisplay > 1920)
 		return MODE_BAD_VVALUE;
 
 	return MODE_OK;

---
base-commit: 38c1e0c65865426676123cc9a127526fa02bcac6
change-id: 20230210-relax_dmt_limits-355e2a1c7ccf

Best regards,
-- 
Carlo Caione


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
