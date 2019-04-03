Return-Path: <SRS0=YRlM=SF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B303BC10F0B
	for <linux-amlogic@archiver.kernel.org>; Wed,  3 Apr 2019 20:57:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 80F442082C
	for <linux-amlogic@archiver.kernel.org>; Wed,  3 Apr 2019 20:57:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cJnnLUn3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=poorly.run header.i=@poorly.run header.b="CsIBJnWf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 80F442082C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=poorly.run
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WRDdCf7u5tbsmCeRuwi0jtLO3g31vBedG+1+gs+QqWY=; b=cJnnLUn3A2qal7
	iC5lRHiUaG8wgWd2rxgelHgQUbvvdWG3EaI4QmFO0O8r9izCHHG9p9YxBK9DDaPkoN4g3ylT8n/qK
	Vh4aQo7F11sRSa6RO2LfNipe6PJMJjDkJBo4IVjJxEupxdG1/Cc0qnoF+Yh4dfh+9nEttqelX0uhg
	xjCVrcq42PNaD20yfPfDV1xygNpAsgEIufwO2MzO0UULbM4jvYnDNn6S8lnY99mUPf12QylCfu+e9
	ynRbYDdRDE62RW21Tepm8K4lsf86h4lP1JnhkEfrhN3WhK9Lrooz3s+FCfj9pw82R1NJliFyhbqBU
	JMiFxxC/ecckZXQ4VkLQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hBmwM-0004rN-R0; Wed, 03 Apr 2019 20:56:58 +0000
Received: from mail-qk1-x743.google.com ([2607:f8b0:4864:20::743])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hBmwJ-0004qN-OO
 for linux-amlogic@lists.infradead.org; Wed, 03 Apr 2019 20:56:57 +0000
Received: by mail-qk1-x743.google.com with SMTP id z76so279418qkb.12
 for <linux-amlogic@lists.infradead.org>; Wed, 03 Apr 2019 13:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=stZxDD4/RlpqPkI85AH0c96rqP0StTYiJpkpgjsDnoM=;
 b=CsIBJnWfJpPzyCqAIU5cny97i2F+R4Pvkgtm/DLuMfzm8QWHgmOwdSoXe+HyphN1w3
 eR8ny5zi+qW9kOpCPm0SaEldAEVlW9Cy7YTtMOSETbAtuF7U+uluKgEFTmEkAX/6K8RS
 RktcO9ETfx2gWHWMHtJUc6fcCjml6p+hbgTIfHv5ORI7Mtz3GkUOIzRSgdgTM+w2cadV
 ch9o/Bkh/8Cid3zkvm2ZgQYzmybO205fjkIKvQaI+4K89SfYckKPUEGwaAIwuNsHDTFY
 7+/CCH/20Z78eXbzAjz51G/cqjRV/AVvj7rdaegd1nlfY5oCkA4G//kEdoGI16b7mqDi
 CSTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=stZxDD4/RlpqPkI85AH0c96rqP0StTYiJpkpgjsDnoM=;
 b=howJAEic6L8pXoazURacjO9PYANamRvscYsDt6N1uV4uJSRJ2C+YVIQLGRTMpBZP8t
 lrTYw+v2THVP2IETChXFXjnlmV2yHzqfMucmNaX4FhpRdZ1Wg5zY5/6th+YKf3ycTHCj
 kJxSndQPR/OfU3mu37uvAPy7KRwibZLGFeXz59/FTjwaZ+AlOdbJxoEgBAwtEdCvSXcx
 FdQsiFbwa/dB8OAdDijm1Ts5E3wLzo1X1skuVc56Rp1qoT286I551xE59oW4rf/5Rdet
 MwrVt7vOTZbD6uuk7KTp3MFwMil7RqJOunhXpnS0ddyKrNqtFVW+BJWzvVKhofyvDq4R
 FsHQ==
X-Gm-Message-State: APjAAAXV7VDVz9OaudDhX1rVwIGeqvSK3T3XobmUkXvH82Vf+GouqD4v
 EfaEirb0Ic3yhs4kMBdkgW41aw==
X-Google-Smtp-Source: APXvYqxcCCYV8i8I/W0oj0Xa6OjIg2fMiNWDfgZbUxTeFZcC5XsWhn8KbYqES02wedrCevgpiTmKCQ==
X-Received: by 2002:a05:620a:1244:: with SMTP id
 a4mr1889868qkl.282.1554325014312; 
 Wed, 03 Apr 2019 13:56:54 -0700 (PDT)
Received: from rosewood.cam.corp.google.com
 ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id s54sm10662373qtb.83.2019.04.03.13.56.53
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 03 Apr 2019 13:56:53 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] Documentation/gpu/meson: Remove link to meson_canvas.c
Date: Wed,  3 Apr 2019 16:56:45 -0400
Message-Id: <20190403205652.183496-1-sean@poorly.run>
X-Mailer: git-send-email 2.21.0.392.gf8f6787159e-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190403_135655_846389_08301E9C 
X-CRM114-Status: UNSURE (   8.26  )
X-CRM114-Notice: Please train this message.
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
Cc: Maxime Jourdan <mjourdan@baylibre.com>, linux-doc@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Kevin Hilman <khilman@baylibre.com>, Jonathan Corbet <corbet@lwn.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-kernel@vger.kernel.org, Maxime Ripard <maxime.ripard@bootlin.com>,
 Sean Paul <seanpaul@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 linux-amlogic@lists.infradead.org, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Sean Paul <seanpaul@chromium.org>

The file was removed in the below patch and is causing this error:
WARNING: kernel-doc '../scripts/kernel-doc -rst -enable-lineno -function Canvas ../drivers/gpu/drm/meson/meson_canvas.c' failed with return code

Fixes: 2bf6b5b0e374 ("drm/meson: exclusively use the canvas provider module")
Cc: Maxime Jourdan <mjourdan@baylibre.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 Documentation/gpu/meson.rst | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/Documentation/gpu/meson.rst b/Documentation/gpu/meson.rst
index 479f6f51a13b..b9e2f9aa3bd8 100644
--- a/Documentation/gpu/meson.rst
+++ b/Documentation/gpu/meson.rst
@@ -42,12 +42,6 @@ Video Encoder
 .. kernel-doc:: drivers/gpu/drm/meson/meson_venc.c
    :doc: Video Encoder
 
-Video Canvas Management
-=======================
-
-.. kernel-doc:: drivers/gpu/drm/meson/meson_canvas.c
-   :doc: Canvas
-
 Video Clocks
 ============
 
-- 
Sean Paul, Software Engineer, Google / Chromium OS


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
