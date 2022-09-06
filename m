Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98F8AC38145
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Sep 2022 07:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=a/ZQvLmszlw03FylOtXR2+OZfjKZnZWdtQT8UBw1RLw=; b=lXnLaXqvbwuOho
	ynu/5J3c+1srXr7l6CpaiaED8bvJEQXw33TVnKAPR86lv41ZBK2FhmdY12ECPUib4OHpuwDodE867
	vva1W8u3Mu2Eq0vncdyPoosxpOmADWHDm+S1Sy3HT9LJZy/ibn18zvyJnMtq25JKJ8QWnQuCz0RAj
	IFmLQroOPWhjbkHuujb2C+C7itzm2M1jTL8usrHyIZhqU8t+VWpfszeouIT7UWWLw24WvlYv9aymO
	LG9NXBPo51emoHT0x2sMqanvlm1QpVeTjJNb0F0PKKEah16RIPB2Hn7iBoQHCQsTWjrO1TLSprcwh
	qQ3UDAoNRa3tUXTFZL6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVTIH-00AunA-DU; Tue, 06 Sep 2022 07:46:49 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVTIE-00Auhz-MD; Tue, 06 Sep 2022 07:46:48 +0000
Received: by mail-pl1-x643.google.com with SMTP id x23so10498730pll.7;
        Tue, 06 Sep 2022 00:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=SCIfIiiq/yyzgkPopZpz5RfhutkNUE2O01+O5PYJujM=;
        b=C0k5vt9j9FkkewR8ci4JPOODHwrNNGa4r6DSBf28d9sHkCrIfhiOvmM/yVAu3yv7YO
         jPiuPTFIk8lD3nTokg4njPbUFRZrPFc1r9UJZb0akD/lT+xfF96UbZ5Kj0wBUCw5Hy7o
         ZN/KLYRueo/p2NuOpICD7/kuf+OVSri78c0QxJFivRMvxpFg9MzaQgtM63mvKmasEBfW
         IrNk49J0dkpexeMxLgAPIqfAHdJjnAEJxAFQR0HaNkzSQaYn4aVU3fOGeP6ETjvRiz3l
         K70uDuALDAzeZv8516FHa16MObBRvKzdnFlGz10mu4S+bCgdfrd/uDrBq5sANyYdSFkV
         II+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=SCIfIiiq/yyzgkPopZpz5RfhutkNUE2O01+O5PYJujM=;
        b=GBEl8Ph4rTCc6n/LRBPUtIEgNjyQDUTffi/Ydc46DNBtxybChnM9/QUZpF2fVeyGEl
         UWB0bxMfngAaAzWVZzYYvszJkK9N1NBN9VbPM+hU6T0M95cl78JQgF2+9gYlocDzGRVd
         1DGi/w6IUVG0ROlUCiagR6rpB7BkFAClwqu7EcdO+jXztXjWpOaFe9zy4CsIdhknhusg
         BjjtumuYmInaWgMqvhiGtVommmv6LVvVyDpo+zpxoB3D/NdQBSNCiDilKx96HHH6W6IM
         6Em0gkdCVSWpZVIZhNoDK8iZ/mfmTJ5elJ+prindptsjuV7DUNxnxtvmVQ82XqEcSvVu
         YpOw==
X-Gm-Message-State: ACgBeo07kAa6o4ns9lZHbMDzGuIPR0pJ4cjBSVAXM4RYazrpj683W9YY
	tuy4ihLIaR35TdVTFZpKPTs=
X-Google-Smtp-Source: AA6agR75MPe4BTJ7xQ0L6D61Z4NNGMSJJtZlBcoUzwa1mbQDGNXmSb63h2KGTJtZ/zjJ7FwWon+EuQ==
X-Received: by 2002:a17:90b:4c8d:b0:1f5:29ef:4a36 with SMTP id my13-20020a17090b4c8d00b001f529ef4a36mr24029428pjb.127.1662450404429;
        Tue, 06 Sep 2022 00:46:44 -0700 (PDT)
Received: from hbh25y.. ([129.227.150.140])
        by smtp.gmail.com with ESMTPSA id j18-20020a170902759200b0016c50179b1esm8919604pll.152.2022.09.06.00.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 00:46:44 -0700 (PDT)
From: Hangyu Hua <hbh25y@gmail.com>
To: narmstrong@baylibre.com,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com
Cc: linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hangyu Hua <hbh25y@gmail.com>
Subject: [PATCH] meson: vdec: fix possible refcount leak in vdec_probe()
Date: Tue,  6 Sep 2022 15:46:30 +0800
Message-Id: <20220906074630.35779-1-hbh25y@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220906_004646_814300_993523A0 
X-CRM114-Status: UNSURE (   8.68  )
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

v4l2_device_unregister need to be called to put the refount got by
v4l2_device_register when vdec_probe fails or vdec_remove is called.

Signed-off-by: Hangyu Hua <hbh25y@gmail.com>
---
 drivers/staging/media/meson/vdec/vdec.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 8549d95be0f2..52f224d8def1 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -1102,6 +1102,7 @@ static int vdec_probe(struct platform_device *pdev)
 
 err_vdev_release:
 	video_device_release(vdev);
+	v4l2_device_unregister(&core->v4l2_dev);
 	return ret;
 }
 
@@ -1110,6 +1111,7 @@ static int vdec_remove(struct platform_device *pdev)
 	struct amvdec_core *core = platform_get_drvdata(pdev);
 
 	video_unregister_device(core->vdev_dec);
+	v4l2_device_unregister(&core->v4l2_dev);
 
 	return 0;
 }
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
