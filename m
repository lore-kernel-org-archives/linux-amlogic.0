Return-Path: <SRS0=pzWI=4C=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58523C3B19F
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Feb 2020 16:17:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14B162468E
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Feb 2020 16:17:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sQ3gUdcj";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="nCeP60jh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 14B162468E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J2AhzC5pv9iYRQVaMkwq9u3JrfHSxgwPBg0R6rhbw0I=; b=sQ3gUdcj6Lutd9
	lEUTITXLxO5/UhVoGkrEbUKaoNphvYO10q8C+3m0QkfUnycGpS3isAzLHWDp09GBLNDEX6RCU0etH
	wlc7sj9fRYkHsoEoV0VrSlgVqYGD1Z3ncxlneiOKAOXvFymfW9J5zupheTis2oWibbN/MUSSUhbbw
	pE6Yqc92pIY9zJXVxdfpDHK+wgDX5X8mDC4CJUPOGYn2hItRXCh1PY442o/aT6AiBivnLhW42+T2a
	5FTxJ6H/MTpPlCKPeDTPp9O9/f71P86FseeT75IHIksVzHjb4I/M83z8q/7a2Th4jRI3bUCsChNbX
	lrDS5v+06/IA/FXOGTbw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j2dej-0000s4-TJ; Fri, 14 Feb 2020 16:17:29 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j2dPv-0000Jn-Kc; Fri, 14 Feb 2020 16:02:13 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9C4B024676;
 Fri, 14 Feb 2020 16:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581696130;
 bh=HDNfsmOpb9MK1yv2aN+/E97lXV9iDVXQh3D1EFAviJE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nCeP60jhUGVvFg+8vLNWolMx7SIrbn2HxbQKN5BzRWlP/8Kw/Uts61Tcsm/XVi3iO
 pPFhJSsLqPnpW2WD/ozY94wtFflbVGLsfkmpq224GOocSGdZxtN6F73tbG5L/1rdCs
 weoyd/ubyLDYNWSWN3MzPqXIyn+mpuvgkTR204MU=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 015/459] media: meson: add missing allocation
 failure check on new_buf
Date: Fri, 14 Feb 2020 10:54:25 -0500
Message-Id: <20200214160149.11681-15-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214160149.11681-1-sashal@kernel.org>
References: <20200214160149.11681-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200214_080211_721982_837C6383 
X-CRM114-Status: UNSURE (   8.56  )
X-CRM114-Notice: Please train this message.
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
Cc: Sasha Levin <sashal@kernel.org>, devel@driverdev.osuosl.org,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Colin Ian King <colin.king@canonical.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Colin Ian King <colin.king@canonical.com>

[ Upstream commit 11e0e167d071a28288a7a0a211d48c571d19b56f ]

Currently if the allocation of new_buf fails then a null pointer
dereference occurs when assiging new_buf->vb. Avoid this by returning
early on a memory allocation failure as there is not much more can
be done at this point.

Addresses-Coverity: ("Dereference null return")

Fixes: 3e7f51bd9607 ("media: meson: add v4l2 m2m video decoder driver")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
Reviewed-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/staging/media/meson/vdec/vdec.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 0a1a04fd5d13d..8dd1396909d7e 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -133,6 +133,8 @@ vdec_queue_recycle(struct amvdec_session *sess, struct vb2_buffer *vb)
 	struct amvdec_buffer *new_buf;
 
 	new_buf = kmalloc(sizeof(*new_buf), GFP_KERNEL);
+	if (!new_buf)
+		return;
 	new_buf->vb = vb;
 
 	mutex_lock(&sess->bufs_recycle_lock);
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
