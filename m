Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4100FCD4F3C
	for <linux-amlogic@archiver.kernel.org>; Thu, 21 May 2026 07:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a638UC4A/rRnraN/oPqQRpcWVi/pbOBii6wJ/sgYFAg=; b=1oQgWyS+piFrU1
	WGrRZTTOWsGmImLiD5g48ivPYzlgavIoQCmu8QEJlTiVWt+isPXBzhqwAFCGlno0flwuz/qa9Pzd+
	g1wEaskXw89WmiWkJUiAtLMq8yoAWNzJFdlUSpxjov7Riy47TiNSDXSwRgBpCzjITicZnm6BdpPD5
	ZUhm6iznIdzFinX1yyidDngujpO7s9ESC8chqar0hSb2z2aOkIKua3dra1HTeHSnQYE+/7essNyrO
	qGRiDQ2Vzc7T1aKLq2lXpbUM8NN7LDLPyVzHzFJTw6xqNFopmcBuewHdfAQT0IGzh0tv+CBaH3jom
	1k4UbM1dVA5J0aUup5jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPxw8-00000006yaL-1Ost;
	Thu, 21 May 2026 07:35:20 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPxw4-00000006yYe-2BFU
	for linux-amlogic@lists.infradead.org;
	Thu, 21 May 2026 07:35:18 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-3698e34a567so5060796a91.2
        for <linux-amlogic@lists.infradead.org>; Thu, 21 May 2026 00:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779348915; x=1779953715; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=62v+VUjFmSMO7xe18HMoRAsN6xnzoeMa1iqyd56dOLs=;
        b=ktzam2IDvhWIUrgcLTiidUgd3jrylevkH4hgPiXO4bzdshP2eP+h4rsudhfubEEs9Q
         cYHPNTd33CgjLe3dXN4yHcs/qYOP9bNGRZaexL8vYcJoQsOoLqtODstkYWGmLNmFZJW3
         WOCqViq5s7M9IX1yZ9tvW1nZChZTCobde9TuAu0SA84o/g5EgYUMSBz+4btQXFp+28qt
         mlFr99Wv3TFVy0lYSOfsJ25iN8N9rOV5GUT78BDReAkXEwWHD9FQHGfb95GVejCXWmq0
         ydmTvR8m/P2o0h383NrWh/a1+e/Nb0uXaNypGhjAIzOMGiBqVFLQpDMxCweNjUBPk2Fz
         BkWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779348915; x=1779953715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=62v+VUjFmSMO7xe18HMoRAsN6xnzoeMa1iqyd56dOLs=;
        b=bOJ2o5LJ0zw9QfsbRbbRR+L08JK1Bz4YClwLHuCyRt2iVvWUipH7Danme/FOROSAW3
         89oBboHikpepgwtlbnElTkixYvlF9914wKixHRsJPdtL/RcG4SRLT4w697I8rJo0G+bI
         9HeGrTqzFCOX6LkMtNrV9DfaBaukbBrjlxKTUrHSyUYQ+BnTLPyTcN3KwpnLRt1jYDuR
         21bcPd04CmGtfgRVpT/LMSEvRAgGqd8UlRy7WWtM++bDhXkXvTemlK1/tC+ofCtpC7Gg
         pXzkjtFSvgsWCWEm+tlSkx8/uudSvjkp5WSEBUJ95T8F/f4iTDtHtTYEyyj8ngD+vMBr
         c6Uw==
X-Forwarded-Encrypted: i=1; AFNElJ/fhAaojS6jqLoQjxC9iP4S9jpKoLYUO5pK/eeMkQjVGj8s9ytFM/CD+kV+iyJY0XGDL6LJGqzXzUvepBBA@lists.infradead.org
X-Gm-Message-State: AOJu0Yzn6iMhnynUGu95//uR0NunY2FbtY74fxvNNLL6dSWLBer3aLH1
	Xtgv+BEBFP2TVW2FL966zOowIrZ2SFgB3xGxQNMItmyarlZ1UMNwiK9X
X-Gm-Gg: Acq92OEcnmDUeU/jOS/lOpiIrRSOKIRnPpxdzPREtDxktuX2irw3YU9tn9hnLQZJ8ai
	UJG93ItoRgengmlOX9TIwzVh1DPfKxhAJ3UKDdB+t/4HzjZEiIOcgmscQ0xQOiiMdKQnQYCJujf
	T+oMsOGknA9bcNfEzVisGVyrwyLMlPp20cLeiu0bFVJyNZgZ4OhHKyRs7NMJOaQQGrDjl53cXnr
	x7QuHFoByH8Eki2rUAZxvjFv0Em96bZX1woaXjWJ95mzPXVAKSvadjbyXoJx0v9fLyqLI4qZ2iH
	Tmkvtmq2shVcrfhX5JNR5LqX5QTuSN2YlB4iqVyxTHvb+dzya1lFJ7rwaoSNRdt6+EwFVuhSYVd
	QMmFP7xl0Ce/iL7ECOKiU513rYxoydgbjIXKQDhUE1g+8OoRZdoaqd51gMkpuROTENVSppH54ly
	LgQUW35IRlQd7cVr9Hk6wP
X-Received: by 2002:a17:90b:2c8d:b0:36a:2a9b:3fb2 with SMTP id 98e67ed59e1d1-36a45600421mr1777569a91.16.1779348915390;
        Thu, 21 May 2026 00:35:15 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.230])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a45c5decesm783833a91.1.2026.05.21.00.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 00:35:14 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Maxime Jourdan <mjourdan@baylibre.com>,
	linux-media@vger.kernel.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-amlogic@lists.infradead.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 1/3] media: meson: vdec: Fix memory leak in error path of vdec_open
Date: Thu, 21 May 2026 13:04:11 +0530
Message-ID: <20260521073449.10057-2-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260521073449.10057-1-linux.amoon@gmail.com>
References: <20260521073449.10057-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_003516_563080_CC3DFE6B 
X-CRM114-Status: GOOD (  16.00  )
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
Cc: Sashiko <sashiko-bot@kernel.org>, Nicolas Dufresne <nicolas@ndufresne.ca>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The vdec_open() function previously jumped directly to err_m2m_release
when vdec_init_ctrls() failed, skipping release of the m2m context.
This caused a resource leak.

Fix it by introducing a proper err_m2m_ctx_release label that calls
v4l2_m2m_ctx_release(sess->m2m_ctx) before releasing the m2m device.
Also free the v4l2 control handler memory allocated by vdec_init_ctrls()
in vdec_close().

This was identified via kmemleak:
unreferenced object 0xffff0000205d6878 (size 8):
  comm "v4l_id", pid 5289, jiffies 4294938580
  hex dump (first 8 bytes):
    40 d2 49 18 00 00 ff ff                          @.I.....
  backtrace (crc d3204599):
    kmemleak_alloc+0xc8/0xf0
    __kvmalloc_node_noprof+0x60c/0x850
    v4l2_ctrl_handler_init_class+0x1b4/0x2e8 [videodev]
    vdec_open+0x1f4/0x788 [meson_vdec]
    v4l2_open+0x144/0x460 [videodev]
    chrdev_open+0x1ac/0x500
    do_dentry_open+0x3f0/0xfe8
    vfs_open+0x68/0x320
    do_open+0x2d8/0x9a8
    path_openat+0x1d0/0x4f0
    do_filp_open+0x190/0x380
    do_sys_openat2+0xf8/0x1b0
    __arm64_sys_openat+0x13c/0x1e8
    invoke_syscall+0xdc/0x268
    el0_svc_common.constprop.0+0x178/0x258
    do_el0_svc+0x4c/0x70

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260520045905.6ACBA1F000E9@smtp.kernel.org/#t
Fixes: 3e7f51bd9607 ("media: meson: add v4l2 m2m video decoder driver")
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v4: update the commit message to add v4l2_ctrl_handler_free() in vdec_close()
to adderss the issue:
  This isn't a bug introduced by this patch, but does vdec_close() properly
  free the v4l2 control handler memory allocated by vdec_init_ctrls() here?

v3: https://lore.kernel.org/all/20260520044046.7553-1-linux.amoon@gmail.com/
  update the commit messagee.

v2: https://lore.kernel.org/all/20260321065408.209723-1-linux.amoon@gmail.com/
  updated the commit message, applied the suggestion from sashiko below.

  [3] https://sashiko.dev/#/patchset/20260321065408.209723-1-linux.amoon%40gmail.com

v1: https://lore.kernel.org/all/20260304100557.126488-1-linux.amoon@gmail.com/
  tried to address the issue reported by Nicolas improve the commit message.
---
 drivers/staging/media/meson/vdec/vdec.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 4b77ec1af5a7..9244fb09eb36 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -889,7 +889,7 @@ static int vdec_open(struct file *file)
 
 	ret = vdec_init_ctrls(sess);
 	if (ret)
-		goto err_m2m_release;
+		goto err_m2m_ctx_release;
 
 	sess->pixfmt_cap = formats[0].pixfmts_cap[0];
 	sess->fmt_out = &formats[0];
@@ -913,6 +913,8 @@ static int vdec_open(struct file *file)
 
 	return 0;
 
+err_m2m_ctx_release:
+	v4l2_m2m_ctx_release(sess->m2m_ctx);
 err_m2m_release:
 	v4l2_m2m_release(sess->m2m_dev);
 err_free_sess:
@@ -926,6 +928,7 @@ static int vdec_close(struct file *file)
 
 	v4l2_m2m_ctx_release(sess->m2m_ctx);
 	v4l2_m2m_release(sess->m2m_dev);
+	v4l2_ctrl_handler_free(&sess->ctrl_handler);
 	v4l2_fh_del(&sess->fh, file);
 	v4l2_fh_exit(&sess->fh);
 
-- 
2.50.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
