Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95A75C433EF
	for <linux-amlogic@archiver.kernel.org>; Tue, 31 May 2022 14:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C3w8zArXlVK7i1Y2xu2fhZjvw7QSJdIM/CQBSIhACvg=; b=pwPuSlIZlTZwx7
	dDTsUS4w3S2JLuSA5l0jnEohE+HmwNd/WGgx39PXGsFw3cCSbDRwKYounPWWbxuGVRQd+4o5wIsAe
	SdteYJXdXHBrPGPjZOa78iApajHnOwwbiovi1HnP++qDscZW7FLkzAgVZUskBqp9X4l7fbvPJzyPM
	/AVz34e9efcsPl0drth6aisrGEsCUGCMikxEpYIEcaTziQX9nXjZvOi+12OESCDxsz5X709YDprUr
	+dbe+MAvZo0otyHSfYyX9YoGJ4FHg1JLvef+LgWaxWL3nCTdjv/a0WM2ne0tbF3NXYcznSrsoslri
	9xa7hzujiWIVp5zzPuwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw3C1-00BLxj-C8; Tue, 31 May 2022 14:49:57 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw3Bq-00BLtf-MP; Tue, 31 May 2022 14:49:47 +0000
Received: by mail-pf1-x435.google.com with SMTP id b135so13378608pfb.12;
        Tue, 31 May 2022 07:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ceYIzlL/twTH8Sr59LajLbKK1xxBDxgWw7CtT5vS84w=;
        b=K0S/p3jRO0pqQZ0yw9hdVvC9iMKHlzc6CLAZtSMin3YKcxUYUj0ek3P+WGYNxDZl/h
         9azmVFZ0uzK8PCDufF/Gjw66qtxTwQqzJdFJuIxxWUxF8ww4bqrf15X+U13iBBErU1fp
         DX3oH+7ABnJSlbwItxycWDd41+OPp8j+1cKrlbFn39i5y4pgUCwGq499xs8oPoiRbGv/
         bwfjPX/feLbTjyI0TiFgnStzne1oJOBmjMLEgxGWTeffJ/3xpVBhg6lwr/qhOoGdjBWq
         JqCwX0CVSpdiZWifOYpTuacvZTwYd6lwx9r5/r0M8zr3ltCWRlJ2SukjjgtidI0y2BYS
         Zzdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ceYIzlL/twTH8Sr59LajLbKK1xxBDxgWw7CtT5vS84w=;
        b=BCRLG9P8zm1CqqK/+/8doKiUG3GEVb+jr4k5erqIvEXLYnmFLqR3E3vrB5bm8lNIp5
         7+WIEATm5cYcxNX7q3hqcwRNoBYbTNozpslT7nlqHpi/QgihwLppdsTs7oa4AgUIqnRQ
         X7bxOZZ1Sdpxu/nPHb/htysgq3YcCrmMbxuEfV/k+gO5MdTa5bCABs7xw4dye0br69Sq
         BVDeuksBxFSW+2qIJMHVyVFdjRhY+tQX4UAhxosxb/4kME9DFSn9MSkfxW/yor0Itd3F
         G2qXMANkrCqCZi5OrYk/9e+EB88W719mBaF5wLs3gotTQ7BKOwC7r0ji118PvzriWHeN
         qlFA==
X-Gm-Message-State: AOAM533CFiyWeUye2n5l0VW0EUIcUGJl/I9y9qpxgvZdPhyVQ/6RrgyR
	zcoqn+jIG55hkoxGP17k2ww=
X-Google-Smtp-Source: ABdhPJzDSi4itj4Z6llVe4OArFqnAITyU34dFBtLDFQN+cm+fuixe6WVqtcPuXnd4vYgLmf0MRQtHA==
X-Received: by 2002:a63:ef4e:0:b0:3f9:e8c4:b72d with SMTP id c14-20020a63ef4e000000b003f9e8c4b72dmr42409832pgk.328.1654008585955;
        Tue, 31 May 2022 07:49:45 -0700 (PDT)
Received: from localhost.localdomain ([202.120.234.246])
        by smtp.googlemail.com with ESMTPSA id d3-20020a17090a8d8300b001e2d4ef6160sm2007215pjo.27.2022.05.31.07.49.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 May 2022 07:49:45 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
	David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	dri-devel@lists.freedesktop.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: linmq006@gmail.com
Subject: [PATCH 2/2] drm/meson: encoder_hdmi: Fix refcount leak in meson_encoder_hdmi_init
Date: Tue, 31 May 2022 18:48:16 +0400
Message-Id: <20220531144818.26943-2-linmq006@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220531144818.26943-1-linmq006@gmail.com>
References: <20220531144818.26943-1-linmq006@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_074946_812720_A47002F5 
X-CRM114-Status: GOOD (  10.70  )
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

of_graph_get_remote_node() returns remote device nodepointer with
refcount incremented, we should use of_node_put() on it when done.
Add missing of_node_put() to avoid refcount leak.

Fixes: e67f6037ae1b ("drm/meson: split out encoder from meson_dw_hdmi")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/gpu/drm/meson/meson_encoder_hdmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
index 5e306de6f485..f3341458f8b7 100644
--- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
@@ -363,6 +363,7 @@ int meson_encoder_hdmi_init(struct meson_drm *priv)
 	}
 
 	meson_encoder_hdmi->next_bridge = of_drm_find_bridge(remote);
+	of_node_put(remote);
 	if (!meson_encoder_hdmi->next_bridge) {
 		dev_err(priv->dev, "Failed to find HDMI transceiver bridge\n");
 		return -EPROBE_DEFER;
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
