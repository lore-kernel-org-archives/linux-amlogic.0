Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D052606A31C
	for <linux-amlogic@archiver.kernel.org>; Wed, 11 Nov 2026 09:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PiknxDuv;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p1kmO1Re
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=v82TUyGqw7P3a2bB3OBUMlnOncmuAoweliLyhFdgAeo=; b=PiknxDuv/TD9SY+LPfscQ+uM2M
	oaR7djnYJKLNVbWbALGsOBFtDYlTIipHRcjFgJWTMVmHlrVx1zmVAd0tBzdh+GIGE0U9Utvlk9waa
	q5sWEHlNSe286dDJuQM4Q1hGUqH/ocVM+IM9uRHGSJmH4Yu+bb/NLSuRMoAOgUC3E2iXnA6RTTh+m
	2HRFt1arU6io4g/2K5Iq/zylaTPMR/kLEETFYXZVbu6GEOZ66Ee/ff+TbST2/iBFzsuQ7ZU1U2MkK
	Wc4WBpiHEKOpxPVPIHfTBAZSzLHoDmBuPv2w5GiyUSM3NbWSuQ6KU6AhBpR7KFTesFEx/jx7Bv4gZ
	MPwcGlrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR4Si-0000000694o-30wv;
	Wed, 11 Nov 2026 09:17:48 +0000
Received: from mail-dy1-x1335.google.com ([2607:f8b0:4864:20::1335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR4Sg-0000000693o-31R9
	for linux-amlogic@lists.infradead.org;
	Wed, 11 Nov 2026 09:17:47 +0000
Received: by mail-dy1-x1335.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so5832472eec.0
        for <linux-amlogic@lists.infradead.org>; Wed, 11 Nov 2026 01:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794388665; x=1794993465; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aPNp2WgpgPHRfZu0DFCm+CGOWcM+7olBPXi5wHu617Q=;
        b=p1kmO1Re6vhA3st9e2obakiUmrtuBMqaH1m802JaCjq6iDGh2RvH22hBP1e2Mvwebm
         ufbNtun5kttsIb8ShaQAiTyAlwieQVbpKDp80mO7eF8X07kQthTavVjF1cXjAOLAprnd
         rQJArASXWCastMqcnO4UldE7rLfq3VMeDI02KULGj/zagDNGOQd6RIDU7pHi8Xp2tsuq
         n/VzXpVGbqVxwcrklcQyJ7B8ed3otqCwE3N/lye9nUV7TGfgBO7THsX5DZTw0ccyK8D4
         D7JZulVccu+B0YcMPxjOIFWbDFw1AkCd4HM/C9qmrQllFohUTWnbLi2WI89fVwwMpBZ8
         B7sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794388665; x=1794993465;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aPNp2WgpgPHRfZu0DFCm+CGOWcM+7olBPXi5wHu617Q=;
        b=bgTNcjPUq9twPuljpgnds087TEJQKOET5eQrmTtXx6lMfrTDb7e524okO+BRmZ0WW6
         +Z3KZ7Elg+u/tPdCU/KN9rQ1zJnHNYtInXqz+E9LDXcMKVpN8Vj1EDnft2wIi//x1jmf
         7xGvbk5bEBaDUbC8FtpLpQHfHi7SobHWaYbsCbU4uoSz04y+diEu86qYlwHo3hDUIAis
         otKKTfvt3qGydcLwUwt+Rq4F1HAM6CW/z5gGZ5y1WcVDiFoCKCynHCsuplPbIdGxb6tB
         oRqgT4tQE44RA1Ns1VF7P9KJ4F95EJRQg+KEqSZJvWZDHAvRR5cLRwxhnrC49tBukH2q
         aT0Q==
X-Forwarded-Encrypted: i=1; AL+hErEofnayO5cMry79xgHu51z83NlXWDJ82VlitkqCGM7LPVL8bLZdZm+azKIYs3J6o672KKaNXjlneHYhRWr0@lists.infradead.org
X-Gm-Message-State: APuU4Z+EHUuTebCJYsngpEhjbwrLt5QOZrUjD+BjiAG6nk3G4d+S+OQo
	wK2Pm+lTsGukF4TAV5hFHEjF+6vQw865JZktVVLdiCFOAauWI4KVFTMp
X-Gm-Gg: AYBFou2kFhIE+1q+H7Ohe22sNU5YRb8JridO65t34E6bzA2FW4sXF+FBC3HOHd0O9Tz
	Tb0Qgk8wpCxPowOrBA5irsV+JyYa4UI3b1SGe/8v6YCXmdIWaxn2xm3ANnDs/YIlOxSH/ULHJTw
	3xSjqc7kjmJ60F569pUkLZGYyZ+hVXdyrpcn8d37QjD1LzBOzaG8D1C1Zy/UXwOLQ97UmmfSW5p
	eITwI8yV2WGOPKKy5kQQQ68eD/mCHVFBeuSwaU+imfDy1eeI43Qdob3Rx8Ja/AqH3YcGfIHEciQ
	ifnjg8sTNf6OqgObIBx7WYViwDyU3wcTxXZH+HWgXzUt+Q6H4nVGnwwnByAcQJyRLKE4a+W23ic
	0hakzSLbXpIOsSrjFQPNPyp5SDCQ68Kx0ERScwcoAByUFxNdq14BMIVVSaMPTqTXO/oLip9Juc5
	SgLlIhCvKjitQppRcZBVA5s3zwuZ1fKcB3282DVBDUCyy+aPekTiyqdI8ZqYK2qokD86zFW/aYj
	wIImwBJTayTdZdZ1GSe2W5FQWpXn/GUjwFjaWeQcgsNpKfsMXmpV8KHaZTqNGK5QiLFytAJWz2w
	4Oc3wVkPhzTCo2osv4n1DFYA5SfGL0D+Vt6BNNHoAG9RXB2cPiMLTVpDl7h52bEndgBithgckba
	ec8aWrtEXZAYvYCCkqA95ATWuB+5OcBJEapbltEKny8WM3IO6
X-Received: by 2002:a05:7300:d94a:b0:36d:4135:cd7 with SMTP id 5a478bee46e88-3768617ce1bmr2715415eec.18.1794388665237;
        Wed, 11 Nov 2026 01:17:45 -0800 (PST)
Received: from DESKTOP-DIIS71I ([5.18.141.223])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520512ec1sm13540869eec.12.2026.11.11.01.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 01:17:44 -0800 (PST)
From: Rand Deeb <rand.sec96@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	dri-devel@lists.freedesktop.org
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Nicolas Belin <nbelin@baylibre.com>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	deeb.rand@confident.ru,
	shda@confident.ru,
	lvc-project@linuxtesting.org,
	Rand Deeb <rand.sec96@gmail.com>
Subject: [PATCH] drm/meson: fix NULL pointer dereference in meson_drv_bind_master()
Date: Wed, 11 Nov 2026 12:16:57 +0300
Message-ID: <20261111091657.598-1-rand.sec96@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_011746_757543_193D628D 
X-CRM114-Status: GOOD (  10.88  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

If the allocation of priv fails, meson_drv_bind_master() jumps to the
free_drm label, which calls meson_encoder_{dsi,hdmi,cvbs}_remove() with
a NULL priv. These functions dereference priv, so the error path oopses
instead of returning -ENOMEM.

Only the drm device has been allocated at that point, so put it and
return directly.

Found by Linux Verification Center (linuxtesting.org) with SVACE.
Compile tested only.

Fixes: 6a044642988b ("drm/meson: fix unbind path if HDMI fails to bind")
Signed-off-by: Rand Deeb <rand.sec96@gmail.com>
---
 drivers/gpu/drm/meson/meson_drv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index 38bf2811d..a9b707062 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -204,8 +204,8 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
 
 	priv = devm_kzalloc_obj(dev, *priv);
 	if (!priv) {
-		ret = -ENOMEM;
-		goto free_drm;
+		drm_dev_put(drm);
+		return -ENOMEM;
 	}
 	drm->dev_private = priv;
 	priv->drm = drm;

base-commit: b3dfbde62cf1981c4638939c159dfd087b7a72e9
-- 
2.39.5


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
