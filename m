Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFE83CCF9E0
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Oct 2025 08:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MlG5EWkzUi4RxziUPe97m5WlDX2t8qvj9+4TvaQjvpE=; b=fOAzuoT4Pz+8Mo
	JYgI9QrBLA2VOg2gSmk+ZozDS1lkx8dZU9xOo5yQ2yYSZmMxwZ5NcpJKLbIBHzBM4hlXLIMz/aJV9
	gZsCQY4URkeJ5XXEVgVyjERLaqtBhl52O/vdmQNrZgR323qRNeWGf9RMyKQknAZ4w443O+R3KbVm3
	+o83l7rf5ricPPyok90/AEi3C1TRqCcJIwUFAiczC97bmEj0IivFlV1o3uiQ6j+HtPTJCgVXeeY4m
	7NFgEySq4aj8J4xWNM3nnu2peePwI3/ZCUHi8FwoloSY2PIANcQzAK1bkpBEsXnvSeNxlSLv/ErCf
	nFaX3+kwEZBb5XDe5ZaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDIp0-0000000DNf8-1Do0;
	Mon, 27 Oct 2025 08:43:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDIoy-0000000DNcr-3HhL
	for linux-amlogic@bombadil.infradead.org;
	Mon, 27 Oct 2025 08:43:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=UHwoqgImEy7LQLhZWFXUDhaPJoy+ecZ3A4KynxwsxS0=; b=GglhllcXdBfaPx+JCUJmEsO9Jp
	Tdk4acG1voZIMWFbzT62D0eUuFeurHLXNgnmMtAsEQCDjCVwHR4nP8yB3fXPOGImYuNBiKJk3TM7V
	q1PYb2C6ilDhldKVMs25U/SQOJR9pGYub8PNzmbZAS9dibmhdKpy9X2FHpBCX+H1lPUVuDIjl0FI3
	gBSDVL4c+XGNs/KbwWnWjik4LVSKdTRCZKdM1dLiffcjLhD8Ax5hTrrDolGxjY/ZjjY10jukb2M//
	1b0+AyCpuRLqTlHvAbVb4K943CfgfPUBRhQIkV0jtR+0yUB9VUiuOoe2RUMgIm9SYRG7jXkwemFf3
	aNq5mW5A==;
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDHxB-00000001cGJ-3Vli
	for linux-amlogic@lists.infradead.org;
	Mon, 27 Oct 2025 07:47:47 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-b6271ea3a6fso2946842a12.0
        for <linux-amlogic@lists.infradead.org>; Mon, 27 Oct 2025 01:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761554595; x=1762159395; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UHwoqgImEy7LQLhZWFXUDhaPJoy+ecZ3A4KynxwsxS0=;
        b=V0t9NVOU760H4pMnLqRm1uGe8VHoaSBF4coo2wF4cG2vFTlHhYZ8VqPOQYUEy6LNCY
         fP0jOnoE5JJS1Yi/z1lUs1gQhwD15LR4v55/fFH/w8QohrOslGsnzHprnmuS/OaPu+w8
         /YXjO9cyQur+xTB44aaFOoewTGyB68/WVSz5RaMqkIT33OwiEgPckSwEG9ZKJ2jWznhM
         v5nRezPOFtDSHGajHZn7G9NY2Yy1B03A6yNnn5q/XkM5kcqkxzjVWtXoLJsydvZDiAkg
         z9H1+KDqqZOcKVf5+noX9bDYtRXyJUA2k6jOiCzSTmH2vhcwx1FbrvX/bbAYBGpNCN2z
         wmgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761554595; x=1762159395;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UHwoqgImEy7LQLhZWFXUDhaPJoy+ecZ3A4KynxwsxS0=;
        b=es0/c4bRPnHQ/w6jYSY5rfr0ifasz0pVzPij03cW5rK2VY30rQafp7yxSV189Toa30
         +RQ9OdA4VR3So6hmnOOku8idUvDcnOShCYE7IqYPt9qJ1Vw2+JYve6SPOcs5wPFjaSOu
         qLdxjlVBmQ94QAdhbVZiqjD9iop4Gdu2hcKLV3RZngAbqj5Gbk38w0aNuWIvEk/attSb
         vG5QL/7rRYx/D3BGIMDjpTdwIuCIVI4ZFz0prO6096hjzDL4ogD/Vt8xjssoiDWZ/0pL
         lFtmjT9RBMW4eUUoL/wMvMHjM3Ae3t6ij9TIWQTqIaZ3qau2vfeqOjsR8/oHXr5WIxiw
         aIhA==
X-Forwarded-Encrypted: i=1; AJvYcCX6PNAqCAfehjv5/nsfgZ1yjQtqV1/lfzWvUw7OsEnlB2Ch4cCZYdiKkRUJEEIgiT1o9ph4av0MOhRuLHhK@lists.infradead.org
X-Gm-Message-State: AOJu0YxWumVd9s407m81iu9Ng6wHakqxRCkX3GoMrM0cWIk+oHhBwQfD
	38iPKmpLjoEx7G9tPy4e4sAcmrOriLJ7rYG0o3Rw1/krHd/VPv0JMlBH
X-Gm-Gg: ASbGncu33QOCIS9oXUIB4sI94FsS0VLJCpuLW9BFSsV8ldiUQWMpfb8yLnGrCw5OylX
	Ikxj5p7nrP4LVGargCbc/D2o9JeMaBFtT7I8lAHKerqGRcfYzfb22ErLQi+bxX0kShK2C6aW9Op
	W+P6f/z+83/Bmbz7mMnKHSSDtOsAWseFpTUwNRylls986P3CQjeopb9N8qE+GiWW8VG8I1iGHR2
	ZfRMYRYdo42A2d5qRa8ONPSkKHlSa1t30MgpTRj7V++MxslDDDn5nE7DxGdt5e8PeTvS2ZvQH81
	OYpwRLHirjT42TBF8j16sunZEZhEYZ2Cwt6l933c4etiEXN7qV+2IxM+/8r6lsiax8S5uAaQl2D
	9xm7VzSP5fjQuFW1AtdoqsatMx2hwLEDt264iY2jOBlOpEiw47cIHjHacNShol7YrbpzpEJCNWt
	QCdAvZN+WjyVdh2ADJd4h/901erUCaVPtFLhF9j61agBw=
X-Google-Smtp-Source: AGHT+IHwgVcslq+1mjD8C6Vh5GqRLux2tDGUe1R/TUV71B2G9ynp6h0rzEeVb0xZxIg7lRsdj6RNXQ==
X-Received: by 2002:a17:903:247:b0:294:c189:68dd with SMTP id d9443c01a7336-294c1896977mr7969545ad.44.1761554595286;
        Mon, 27 Oct 2025 01:43:15 -0700 (PDT)
Received: from localhost.localdomain ([124.77.218.104])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-29498e3d2aasm75349815ad.88.2025.10.27.01.43.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 27 Oct 2025 01:43:14 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Nicolas Belin <nbelin@baylibre.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	dri-devel@lists.freedesktop.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: linmq006@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH] drm/meson: Fix reference count leak in meson_encoder_dsi_probe
Date: Mon, 27 Oct 2025 16:42:58 +0800
Message-Id: <20251027084258.79180-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_074745_917928_E81691BC 
X-CRM114-Status: UNSURE (   8.33  )
X-CRM114-Notice: Please train this message.
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

The of_graph_get_remote_node() function returns a device node with its
reference count incremented. The caller is responsible for calling
of_node_put() to release this reference when done.

Fixes: 42dcf15f901c ("drm/meson: add DSI encoder")
Cc: stable@vger.kernel.org
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/gpu/drm/meson/meson_encoder_dsi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/meson/meson_encoder_dsi.c b/drivers/gpu/drm/meson/meson_encoder_dsi.c
index 6c6624f9ba24..01edf46e30d0 100644
--- a/drivers/gpu/drm/meson/meson_encoder_dsi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_dsi.c
@@ -121,6 +121,7 @@ int meson_encoder_dsi_probe(struct meson_drm *priv)
 	}
 
 	meson_encoder_dsi->next_bridge = of_drm_find_bridge(remote);
+	of_node_put(remote);
 	if (!meson_encoder_dsi->next_bridge)
 		return dev_err_probe(priv->dev, -EPROBE_DEFER,
 				     "Failed to find DSI transceiver bridge\n");
-- 
2.39.5 (Apple Git-154)


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
