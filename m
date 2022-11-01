Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 633FFFA3745
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Nov 2022 11:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eTW2s0bO2AtqoHgWzhwinywPkqFmpnmye5GBHBqRpn4=; b=MJPM+sR1lxoJlj
	p2tGAyAwfW94SdT1u3+Joabj7593a3ryZhcIJG8Ha4I+AValCootqCM024jH9NsSIhCr6ea5nazDV
	NjKR088XVLSYNeJuS5tVbwQsR2VU9ZaW1YuxevY1ZMm1QSjAq3P2AmKC6mPpw42WE4NwtgHxobUgV
	nsk23/qCA7FPUMe5UNV06RyeYAzNLa7/tRqyXe+tf9QC7+KIau6p7CCkryPQqPzJ5oXPV72uiKtS5
	tWKTd2CR90FvXmMkQYKbNjvVTmC3Gf5/uConJ72oC/YeQv7oLdZP5mfmCeEsoggrRFgHc7x5DMc+h
	C+BBktvXElZHtTS7EH6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oppb8-004gT4-O5; Tue, 01 Nov 2022 11:38:26 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oppU5-004cqV-P9; Tue, 01 Nov 2022 11:31:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5ECBE615FE;
	Tue,  1 Nov 2022 11:31:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BC6BC43140;
	Tue,  1 Nov 2022 11:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667302268;
	bh=LD0hUez/+4eQ/JcqQmqxn2cEjEtVgr9CXGubJIH/Jtg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lc1fFQmtZMJ5icOpHseNSqPWED6HhDZlhjctrN8SIkQKH736XGah+X5m0NGbunqwe
	 D2IJ5nAf8pMqyPzpYk/5e7RedhWERwYn8RcIQ2Byzy6aaGerSuauUO3C+da4SJr9VX
	 2AN67HJQnePNiRh/FSd7VXHJS997qxKOBCdDNcPQtupcGX57iS6ctr+JF+/YGkrJXu
	 1a0vPyeU6AII2giOIJBs3ksFH9CTzCh7PN50S2alp3+biYQYGX9gOCC346BKC3xulU
	 thwYzy7n/8Fw1fuNRQC5h4N75OCgQwiMZGBvrCq/G12PGFs7waDqJSWH0SzHk6W8MW
	 SHuSh/4RkFwrg==
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
Subject: [PATCH AUTOSEL 5.4 4/8] media: meson: vdec: fix possible refcount leak in vdec_probe()
Date: Tue,  1 Nov 2022 07:30:53 -0400
Message-Id: <20221101113059.800777-4-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221101113059.800777-1-sashal@kernel.org>
References: <20221101113059.800777-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221101_043109_893920_3CCDEEB5 
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
index 8dd1396909d7..a242bbe23ba2 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -1074,6 +1074,7 @@ static int vdec_probe(struct platform_device *pdev)
 
 err_vdev_release:
 	video_device_release(vdev);
+	v4l2_device_unregister(&core->v4l2_dev);
 	return ret;
 }
 
@@ -1082,6 +1083,7 @@ static int vdec_remove(struct platform_device *pdev)
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
