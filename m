Return-Path: <SRS0=P8k8=QL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93258C282C4
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Feb 2019 09:55:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61C4C2147A
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Feb 2019 09:55:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lr06R/vW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="005/w22S"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61C4C2147A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=H9os8kwC6UgYqnoiEqq/uhswTemW33qY9/YVubW9tWk=; b=lr06R/vW96AZIk
	RWzPYm4uJPXLq9IvpbhFGRwNnhsbyRLC1EWpmL6m3RbPwoLiCyuiBorak7hH3tTuzc9fxMYedeOC2
	wSPLwWCZXkTm3krNA3ST5iWFH6wGZ9SVN1D7uQavZ/adb1NVfJ1EzRDfk5zhExEcEOzQPbE2UU8SD
	xHEScmSOIvU0TQxtdc1eOLEJFLFsHuGqib71i6iqKoW1nU7RSagss4NZIA3XMr41E0jjwPZOnwJQs
	02m9Ka0OWsuubIZc7nzPcnjhnTHQu5oekboiee2JlBWEPOwLszcSHFRhXoug+VClnY0UWrjmbblR/
	B+rfKSqlTe+FZbKUsPKw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gqaya-00089r-GH; Mon, 04 Feb 2019 09:55:40 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gqayX-00088i-43
 for linux-amlogic@lists.infradead.org; Mon, 04 Feb 2019 09:55:38 +0000
Received: by mail-wm1-x343.google.com with SMTP id p6so12649413wmc.1
 for <linux-amlogic@lists.infradead.org>; Mon, 04 Feb 2019 01:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pkjz/f0QfqEm9NzY0SVdhwC//Bv3LcwK48URNAuYP+A=;
 b=005/w22SjKaKR+OcSUPI0xl637BCseo2Vn7Ri2qV4IF2msRMe2NJBsZ79L8nefX8cn
 Ym7ZT5o74573nDVQRufx8Jy1COyDtO0rVEFqJb+1ukeyEJ2YiQMTWbSzr2bFiouXKv44
 Td4xnY/yo5iCjCCRu8lEPixq/xI0MAwJL8ym/3wnylukSGIQkqforVcJbo4XoHLsMS5+
 Bqbl5dzaib6RDHfnYAuxLMTTJ8Fdjj8fqcuZZEYlUAGv3bA+q7O5jLiAUg3/O4xHKltb
 UkVxNTmaj4Ti3fjpFcB3cOoz5MTuGacokYr73H3eu7D9KfHD+Brx1r5tIxfuj9NBtNa6
 hzFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pkjz/f0QfqEm9NzY0SVdhwC//Bv3LcwK48URNAuYP+A=;
 b=DX6jAIEbjntEv/WWMf2ul8xNOFTs6uQATK5EcCmrMjIfqmp0Bq6XdyNfK/xQ9JIlly
 mVt52RNrP4TKqJgiXZeTh/Z/PY2f+WnEZ7NsPCI7o7+uOSGlqQuhalZZTK8LomqVo+2W
 Ikg/yDxmRapp6d6bFMVD/fY2tECc833Xq5L2lV0kkdG3CsZmqFzmWnbOsmqPsiR+olgt
 YXZdRtAE0Ejf/LZj7ZX8hUOih381lrxRN+29OPL/DCj1rJb8hT22nyOT5D+yOF5dOXLP
 9yYeukIpqCtCgzzWEdToKnSN8Yr0toKBSy/GJlmSo/5WFIlf6avuwtniW5KX4JIwFZdV
 +AAA==
X-Gm-Message-State: AHQUAuY3mCCS/0tZIai1R6hbv2aLJBuB4nQU/Hch6us6JoT/0BcZcesx
 fxvUaWKEaKnz6wAjkqYJrMu9u1htBzUsdA==
X-Google-Smtp-Source: AHgI3IYQZtyGrCgztWDiCxQW2vcfV7LQU+ZmP5HkQx2m5TyjJ/4sZs9DC4i01BhL+drnz7l8aBEPZA==
X-Received: by 2002:a1c:410b:: with SMTP id o11mr12752545wma.109.1549274135224; 
 Mon, 04 Feb 2019 01:55:35 -0800 (PST)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id y14sm12450683wro.92.2019.02.04.01.55.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 04 Feb 2019 01:55:34 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: daniel@ffwll.ch
Subject: [PATCH] drm/meson: handle when meson_canvas_get returns -EPROBE_DEFER
Date: Mon,  4 Feb 2019 10:55:32 +0100
Message-Id: <20190204095532.27185-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190204_015537_311131_C3EC60B9 
X-CRM114-Status: UNSURE (   9.88  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

When meson_canvas is not yet probed, meson_canvas_get returns -EPROBE_DEFER.

Handle this case but deferring the probe of the drm driver aswell.

Fixes: 66cae477c380 ("drm/meson: Use optional canvas provider")
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/meson/meson_drv.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index ef4afaadaf8d..17e55d63daff 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -236,6 +236,9 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
 			meson_canvas_free(priv->canvas, priv->canvas_id_vd1_1);
 			goto free_drm;
 		}
+	} else if (PTR_ERR(priv->canvas) == -EPROBE_DEFER) {
+		ret = PTR_ERR(priv->canvas);
+		goto free_drm;
 	} else {
 		priv->canvas = NULL;
 
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
