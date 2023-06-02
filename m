Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C74EC7EE29
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Jun 2023 09:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nkOKKFYyMr9i0ypDnngCvM1z6xssY1Mp4HKaT/bY/Fw=; b=iks3r+sPuhy9Ms
	sjYREq9bv3b1zZkmfjtOLNZFz69Ya1sxYAeiPph2GE8bgOo7tPM1uuR5S11MdGo6Q+NuJt6ZI7moa
	znwjanLRG7CsFkDZNXl+vvVjdib3S2GO5A/S0W/RipFROKqAHpKolpvnemWuJlNV1tgC6dl/FeDbp
	Ie/acOQ64KhApHvvjcd7Wvy/8tuow1LWiRySy0F+E2aW8Z2jaAHWhqGXpORF4jd3St9C9jTHCuGzu
	nVZ0h0JdbqKS8+rLz3XQ3360KPZEO0vn7/uLnEEZyx78DSlQZ6PUAv0S6fyxxOyoyT9sI7TLfwyuJ
	sO9p0UDzgt7Yqmgjz3Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q50re-006L6N-10;
	Fri, 02 Jun 2023 09:14:30 +0000
Received: from out30-110.freemail.mail.aliyun.com ([115.124.30.110])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q50rb-006L4A-0O;
	Fri, 02 Jun 2023 09:14:29 +0000
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R331e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046050;MF=yang.lee@linux.alibaba.com;NM=1;PH=DS;RN=12;SR=0;TI=SMTPD_---0Vk9MjkN_1685697257;
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0Vk9MjkN_1685697257)
          by smtp.aliyun-inc.com;
          Fri, 02 Jun 2023 17:14:18 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: airlied@gmail.com
Cc: daniel@ffwll.ch,
	khilman@baylibre.com,
	neil.armstrong@linaro.org,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	dri-devel@lists.freedesktop.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yang Li <yang.lee@linux.alibaba.com>,
	Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH -next] drm/meson: Remove unneeded semicolon
Date: Fri,  2 Jun 2023 17:14:16 +0800
Message-Id: <20230602091416.107850-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230602_021427_394529_37C06D78 
X-CRM114-Status: UNSURE (   7.67  )
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

./drivers/gpu/drm/meson/meson_dw_mipi_dsi.c:117:2-3: Unneeded semicolon
./drivers/gpu/drm/meson/meson_dw_mipi_dsi.c:231:2-3: Unneeded semicolon

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=5392
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/gpu/drm/meson/meson_dw_mipi_dsi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c b/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
index dd505ac37976..57447abf1a29 100644
--- a/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
+++ b/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
@@ -114,7 +114,7 @@ static int dw_mipi_dsi_phy_init(void *priv_data)
 	case MIPI_DSI_FMT_RGB666_PACKED:
 	case MIPI_DSI_FMT_RGB565:
 		return -EINVAL;
-	};
+	}
 
 	/* Configure color format for DPI register */
 	writel_relaxed(FIELD_PREP(MIPI_DSI_TOP_DPI_COLOR_MODE, dpi_data_format) |
@@ -228,7 +228,7 @@ static int meson_dw_mipi_dsi_host_attach(void *priv_data,
 	case MIPI_DSI_FMT_RGB565:
 		dev_err(mipi_dsi->dev, "invalid pixel format %d\n", device->format);
 		return -EINVAL;
-	};
+	}
 
 	ret = phy_init(mipi_dsi->phy);
 	if (ret)
-- 
2.20.1.7.g153144c


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
