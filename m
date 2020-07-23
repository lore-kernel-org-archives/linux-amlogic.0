Return-Path: <SRS0=T680=BC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4412C433EA
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Jul 2020 09:06:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 710C320656
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Jul 2020 09:06:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="X3ae7EZ+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="dp4NOUJq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 710C320656
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dhGsPgRmiofWpNucJLL5OE7UgDwMVo7CWzLMx4KfLfk=; b=X3ae7EZ+p43Q3/xS57oSjmZ55
	faD287kgoq7UMPW0MzYPAXch1KbNYFU/mV3jZbRorYaTSicPfFjmZN5vWeEXq7L1bDVI/sheLE8Vn
	+9kXVsfwJiZ5gDAtUnLHvTN3jzVPlSPjlntKI6UQmdtyHxru31lkCMf7OOk0yTLBZO8Mv7bW4GU8O
	VTuHkEBJhO2O8CtHErZt8F2LxYbZEQ6MUMrz2PUjJmjztEEjDz46vglA7mqHYVfPTefHyvraGU5br
	H7qViI8DPII8sJjJMBfugV0w6RjALGm+FaaXSxtetAI3Fz34B+UoxbuYHisnvds7wyvY/baw69Vva
	4MlMF5KOQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyXAv-00020n-Dv; Thu, 23 Jul 2020 09:06:01 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyXAr-0001z1-SP
 for linux-amlogic@lists.infradead.org; Thu, 23 Jul 2020 09:05:59 +0000
Received: by mail-wr1-x442.google.com with SMTP id f1so3849400wro.2
 for <linux-amlogic@lists.infradead.org>; Thu, 23 Jul 2020 02:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LreLnnZrmwYYHqpYhGckfxJZdjPdivebpamaHVtnHss=;
 b=dp4NOUJqQL/scm6GUYDjAXuLDt4cgSIbswqtZ6cIJfZCxfzC1NpMAwaIZ+2dvElcj9
 SDC0T7IQ44exhyDpzJ9m7bbXA8SelqJO/TmmnZPQfFDK63km9fcYn7YvPWQPd4zttNZm
 DgWrxRl6zwWKV+SF2Dezay6uB7J+zAzzIPC7iRSeLSi9hP4VzjDj2CYgg7Y9mSk1PDhz
 A52xl0Ki7OzQ5at/zyyUJtmVloPz8Vqhq2ZgYD6xs3fo1wUAWRJNN6adh8xK05051VJA
 f8qrpe2alI3fnTVS4Nrfn641a/3JssxJhg5jEeT8FUwJs2HZAvWCnrUvgjhoOUId9/CY
 j47A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LreLnnZrmwYYHqpYhGckfxJZdjPdivebpamaHVtnHss=;
 b=F26ApGJ+uAS/QuhxVQuTJl4nwigTh0O7ZzPzBFYfEPd3yfS7Pgx4gCqTN27f6CNy7b
 yA6ZRihxD3+WjjaeIbw7vpYEWTMqPdfExl3o7Sn952wM5xE95LgOd/+daStH7bEUYDZp
 grk2tJ/93pCn5hwZ/1qgjrA4fYGAqJo3+SMCOSRNLlgaJhVL48+HK0tORpd8vvElebDC
 xAjXTK6IyaQlurlUlS1f8dvvP1tjLs8PYO+z5ZeoMRGTLJMTlDXSJVmdr+2IDN0JwalG
 k9+0f8YcJbPl623xcucChcUsI8fphf9mXVa4AAe2xd6il5ahitD5FqOxSpkJ+sPJdcoU
 irUg==
X-Gm-Message-State: AOAM533vFRL5w51TNyBq1J0K1FURYeMIqfP/9HYt7YZnHOySw1O/M0n2
 M1xVBNcsLTC85R4MDFr7ep/opA==
X-Google-Smtp-Source: ABdhPJzqffe9YMOSst9S78aI/iVWmungmYo/9CY48wTFHegSvIqIB1PAqtLGwVADRl5r9zYcZipJCA==
X-Received: by 2002:adf:ec8b:: with SMTP id z11mr3032026wrn.51.1595495156669; 
 Thu, 23 Jul 2020 02:05:56 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5ce9:901f:7444:d44d])
 by smtp.gmail.com with ESMTPSA id 62sm2947397wrq.31.2020.07.23.02.05.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jul 2020 02:05:56 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: daniel@ffwll.ch
Subject: [PATCH 2/2] drm/meson: overlay: fix Amlogic Compressed Framebuffer
 modifier layout extract
Date: Thu, 23 Jul 2020 11:05:51 +0200
Message-Id: <20200723090551.27529-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200723090551.27529-1-narmstrong@baylibre.com>
References: <20200723090551.27529-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_050558_044032_D837D0A8 
X-CRM114-Status: GOOD (  10.24  )
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
Cc: khilman@baylibre.com, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The bitwise operation worked because the result is casted in a lower bits
integer, and was not changed after the modifier defines rework.

Use the correct operation as already used in meson_overlay_atomic_update().

Fixes: e860785d5730 ("drm/meson: overlay: setup overlay for Amlogic FBC")
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/meson/meson_overlay.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_overlay.c b/drivers/gpu/drm/meson/meson_overlay.c
index a8bcc70644df..83ec613bbfb6 100644
--- a/drivers/gpu/drm/meson/meson_overlay.c
+++ b/drivers/gpu/drm/meson/meson_overlay.c
@@ -756,8 +756,7 @@ static bool meson_overlay_format_mod_supported(struct drm_plane *plane,
 	if ((modifier & DRM_FORMAT_MOD_AMLOGIC_FBC(0, 0)) ==
 			DRM_FORMAT_MOD_AMLOGIC_FBC(0, 0)) {
 		unsigned int layout = modifier &
-			DRM_FORMAT_MOD_AMLOGIC_FBC(
-				__fourcc_mod_amlogic_layout_mask, 0);
+			__fourcc_mod_amlogic_layout_mask;
 		unsigned int options =
 			(modifier >> __fourcc_mod_amlogic_options_shift) &
 			__fourcc_mod_amlogic_options_mask;
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
