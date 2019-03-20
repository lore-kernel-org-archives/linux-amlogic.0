Return-Path: <SRS0=2I4g=RX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86CD5C4360F
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 Mar 2019 08:11:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56E532146E
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 Mar 2019 08:11:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="l+ctoD0h";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="OqNlY2d8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56E532146E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GSBG7xzKHDNnlMQHqLwwcOVL4ZwRn+VCyLMTGm3G0HA=; b=l+ctoD0h0/NS/Y
	5y60bCMAvSXPEnijZ5+SzFlfp5BvV6c8xi6x+a7H3CoZOxvjjvLGOdbAZ5qYJTxBpUhNSuihG8Q5h
	3J3XkDHZRoEDHkkm6g3OznjbNxudKtc2K/t3/3Ix88+kwArQjXH4KSfVoGxj56ZDhWe795VHzp9hR
	zhzGpfonw0cUBqi3KD9A7JDju4Vi+u/dy8w3sOu64nEhq0hgtPb+LprUT70h+usyCrv25Tg9HY0Ri
	CrNP885oaE9zz1dQThuA3tuNUWCxR9P0CWS6piIp2sik+dFobXrqFhaxCDzZSwHlZnZgcVx6GOPlU
	qRQaozRd6jt+ShJNwrIQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6WJi-0004Z8-Uo; Wed, 20 Mar 2019 08:11:18 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6WJf-0004YO-Ii
 for linux-amlogic@lists.infradead.org; Wed, 20 Mar 2019 08:11:16 +0000
Received: by mail-wm1-x343.google.com with SMTP id h18so10638477wml.1
 for <linux-amlogic@lists.infradead.org>; Wed, 20 Mar 2019 01:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eFtdP05d2Yd7J7Kr65hCVTF0i81Ds1QiBjoleRYSdg4=;
 b=OqNlY2d8zJN+yt4ujTovEzqj1DCk9qg2euOx/Lyzn+sh05433TflHUP6VmiPx+csOE
 aWrhIEzdYnMqQeADMxEvbPvo97EsJSQSWkulxhsK45lDWTgOtDf03FLQ5kTL+LwFLuA+
 P1BHwnyK4Kc/8PqivblcrR9HQ5ivXCqggJTd/inIj9hDemRhx0lUjaar/g45i5GSA0vV
 2iwsaJSgNpRqS6cj/aGaSNvZWq0x7DYkAbw2zikY5W7wwJhlCr/nv8H3iyp/gBzjOchS
 7BuSjEiwjLqAKr9gZKGsl0i74iIzOwutoBqsNdrDbOquL+QEYO1wkzH8Ww8SUCkNkVJh
 xa0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eFtdP05d2Yd7J7Kr65hCVTF0i81Ds1QiBjoleRYSdg4=;
 b=hzz/oNHI/kpQjQk2v81nCxeVwNXs95IAScT+t40vobwP+IgP8AAJr2Y7APsnAWfNYq
 a8c2Z2nID/1RQU9vsad33TOKaYL9b4ZeoOfsB35MOIQ65FZMIsGUNARFyRpvw2jgou7l
 FDqkHllnfRdOVX0qSUXYUiycfhkbkm6yg7AQWAXKiS7xqlsqkzK4DidlsRxz2R69+Dd1
 HXpnReieltN5cTQgJG6oVV35t0sPvgIDGW40RpW1RQtTIrzITXGwG8+Vr0Z6m2Ju/1zb
 npYJIJhkb4z5No7XuIaYlsgKPoI2mU3PtsW6vvId/wXnwJ16iOyK5GU2RkJe0yVgqvX5
 IYtw==
X-Gm-Message-State: APjAAAXrwbvjK6qFr9TT9Z3GrHeQEn+mHCDR1oicDYgWxw7i/Kf/DrjG
 Q0IYOdGhLkc/RqxT/J8Zn+nZYA==
X-Google-Smtp-Source: APXvYqwtuUEVnsZxXKA7EBFNRqaDkSSEbJFykQuv8l1AVpJLIqATxrOaPDhf5tfS1n6BAtUIMwowGw==
X-Received: by 2002:a1c:7e51:: with SMTP id z78mr7111964wmc.82.1553069473794; 
 Wed, 20 Mar 2019 01:11:13 -0700 (PDT)
Received: from localhost.localdomain (176-150-251-154.abo.bbox.fr.
 [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id 12sm3640670wme.25.2019.03.20.01.11.12
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 20 Mar 2019 01:11:13 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: daniel@ffwll.ch
Subject: [PATCH] drm/meson: fix TMDS clock filtering for DMT monitors
Date: Wed, 20 Mar 2019 09:11:10 +0100
Message-Id: <20190320081110.1718-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190320_011115_661114_7B134720 
X-CRM114-Status: GOOD (  10.82  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Maxime Jourdan <mjourdan@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

DMT monitors does not necessarely report a maximum TMDS clock
in a VSDB EDID extension.

In this case, all modes are wrongly rejected, including
the DRM fallback EDID.

This patch only rejects modes whith clock > max_tmds_clock if
the max_tmds_clock is specified. This will only reject
4:2:0 HDMI2.0 modes, who reports a clock > max_tmds_clock.

Reported-by: Maxime Jourdan <mjourdan@baylibre.com>
Fixes: d7d8fb7046b6 ("drm/meson: add HDMI div40 TMDS mode")
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/meson/meson_dw_hdmi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
index e28814f4ea6c..563953ec6ad0 100644
--- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
@@ -569,7 +569,8 @@ dw_hdmi_mode_valid(struct drm_connector *connector,
 	DRM_DEBUG_DRIVER("Modeline " DRM_MODE_FMT "\n", DRM_MODE_ARG(mode));
 
 	/* If sink max TMDS clock, we reject the mode */
-	if (mode->clock > connector->display_info.max_tmds_clock)
+	if (connector->display_info.max_tmds_clock &&
+	    mode->clock > connector->display_info.max_tmds_clock)
 		return MODE_BAD;
 
 	/* Check against non-VIC supported modes */
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
