Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9142C433FE
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Nov 2022 11:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6hMe1A26f7lIhkCVoVHbLWswPtOXvi9YZD58FfmN7Pk=; b=og6C4S9WitrsWu
	HE6caX10FDH90IkbrdV2Ov84HM79c+hsVRnx/U5rXTMxhEzoxwsUMAyPj8V3gf2BgZXnsx4JD3G+/
	cwS+Thl8ZNqXo2WLIRxV5fpy+VJgjjLJ8BXUlSXMz2auapE8E8OrILCTLC43Y5g5DKvyZFRuUQ5yN
	seQwNhV9GDau3Gxc1Y41OdbnfQ28NRaM59c4PANDS1/96YhHiVTq247efhTjb/+zck6Pg36ppLbpu
	5Dn+MGEtGaglmG/JrHSpNiGS6PUT1bMQKRwxlDL5fQtvnKbFrh1GeIiclLmoqrBYcCSbsblF/RCSD
	gisDXqiNTA6hNc8GQLcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oppYN-004f9T-4q; Tue, 01 Nov 2022 11:35:35 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oppTT-004cUv-ET; Tue, 01 Nov 2022 11:30:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id DF9E9B81CC1;
	Tue,  1 Nov 2022 11:30:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B262C433D7;
	Tue,  1 Nov 2022 11:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667302228;
	bh=1+Gtk/lM3WWJOYb0UT2QDICBrYedhOEGI6VJvrirL4c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pRRWm956jbQ0SmXrIl9M+9wWIptHnhfgN0F2UdFWnydWP+3MGdmpUsUq0mMy7l+Ph
	 IirGMmUln9wEdrjAtsaJHkhqnb/JXekpfwwJldiDvg6NmqBJ/CCK8WTCmr1z1fxm4P
	 Z57FrBi1+zJaVn+b+1bov89eQZlzmmP4ZuugOTa5gcJl3ibmf7rEqwmtKH07t+kP1H
	 oOMuq7FlJiUgPG13hGwCNOHkEgi3sHLDePgBvb7I7JKwVtOkgJ6g/bwi9BOmKwdsAI
	 2Fu+548KBtPXfhfrm7hMqCFjuBRrVmRQqmTcC2gBsqM1JZDTVFpG7C9AIiENqRSZO9
	 ewxLdKP6RkHZA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Hangyu Hua <hbh25y@gmail.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	neil.armstrong@linaro.org,
	gregkh@linuxfoundation.org,
	khilman@baylibre.com,
	linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 5.10 06/14] media: meson: vdec: fix possible refcount leak in vdec_probe()
Date: Tue,  1 Nov 2022 07:30:02 -0400
Message-Id: <20221101113012.800271-6-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221101113012.800271-1-sashal@kernel.org>
References: <20221101113012.800271-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221101_043031_644997_D191FFE9 
X-CRM114-Status: GOOD (  11.55  )
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

From: Hangyu Hua <hbh25y@gmail.com>

[ Upstream commit 7718999356234d9cc6a11b4641bb773928f1390f ]

v4l2_device_unregister need to be called to put the refcount got by
v4l2_device_register when vdec_probe fails or vdec_remove is called.

Signed-off-by: Hangyu Hua <hbh25y@gmail.com>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/staging/media/meson/vdec/vdec.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 5ccb3846c879..7a818ca15b37 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -1109,6 +1109,7 @@ static int vdec_probe(struct platform_device *pdev)
 
 err_vdev_release:
 	video_device_release(vdev);
+	v4l2_device_unregister(&core->v4l2_dev);
 	return ret;
 }
 
@@ -1117,6 +1118,7 @@ static int vdec_remove(struct platform_device *pdev)
 	struct amvdec_core *core = platform_get_drvdata(pdev);
 
 	video_unregister_device(core->vdev_dec);
+	v4l2_device_unregister(&core->v4l2_dev);
 
 	return 0;
 }
-- 
2.35.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
