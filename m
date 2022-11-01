Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 432DBFA373D
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Nov 2022 11:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CiDVyYjvR8N2TzISd/qCQhHQOnNt2bxMcoZzX0BH4zQ=; b=cBNVAt+t0KClOW
	ItfYQFWhnxE2tjftziy4351DJXroNw4AV/wgj50xnxiYfnAzRO1al+PZscj9QHXyCJTNgfkJ/ztEm
	jwpfyb/G7ELomUUdmNFD3IqOObbfgJX1kSXbNhZ028lPDveXkoxSyM7lo0e9f3zQbyFMWRFGF4z5m
	+pIJPA8BNld1WfgrTU+egvunX7g35WWLWAxFtKowyfj6JrO+A0hOiiuRx6eOd84pK677ynctm7jY6
	HlnGNIQIYfMdjan2wVzAYYfxhM9quUqH4fqPmsyxRx40JLzVm+wSsUZZxl5F3r8XAgH1Y67ognXk2
	XpETyFqbz7HeCOgrk9fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oppVf-004dqW-9n; Tue, 01 Nov 2022 11:32:47 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oppSb-004bvJ-8K; Tue, 01 Nov 2022 11:29:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C70BC61588;
	Tue,  1 Nov 2022 11:29:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04383C43470;
	Tue,  1 Nov 2022 11:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667302176;
	bh=YQ4Lk3UcAKphAjqq5lv9bvPAgferpP7JxNfNGci/Xro=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=S+6dmSV4jvPQeDTsn/pBmxOuI1hVAXZKbmwRBsVi3wcbyNgN0lRxURyaZO8YfCp3U
	 m4OhrBzfmwo32wF1rFhsT0OdxuarRgCv8zuTL8qp8joQBd7TyReWFI74MZ2STObhR1
	 a39cRgJkSMi82ppcZAS/XCaJa+hbwRjguD4d1Y8HKXZJd02W+pkwvZUn+jo+EgyjM7
	 /BoxqPyBzzQYWdtAtQPtTPx99c8IFpp+o0ka3lt/2JiuodCipxSPxgTA9uSLyKxo+H
	 TcmdhH4fS50wtGBT8O6J5iFdlINdZbhR7viXKZ+SdSWkjpRaPA0QbF3ecABH4zpMVQ
	 lwPiSuDZsm91g==
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
Subject: [PATCH AUTOSEL 5.15 08/19] media: meson: vdec: fix possible refcount leak in vdec_probe()
Date: Tue,  1 Nov 2022 07:29:08 -0400
Message-Id: <20221101112919.799868-8-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221101112919.799868-1-sashal@kernel.org>
References: <20221101112919.799868-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221101_042937_380227_0E7B250F 
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
index e51d69c4729d..040ed56eb24f 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -1105,6 +1105,7 @@ static int vdec_probe(struct platform_device *pdev)
 
 err_vdev_release:
 	video_device_release(vdev);
+	v4l2_device_unregister(&core->v4l2_dev);
 	return ret;
 }
 
@@ -1113,6 +1114,7 @@ static int vdec_remove(struct platform_device *pdev)
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
