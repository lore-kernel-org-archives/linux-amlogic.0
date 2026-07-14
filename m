Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68111C44501
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 Jul 2026 14:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0TDdIUEqUlNW/cFk4kEq0P8KBxLLzPnjsjDic/Hc1ok=; b=nqmOmL/a1FY5hs
	bxzyXjM4FYuXRr7Gc6qfG9Ub0VIOqQkUkQtGVsiOspnmmBCYE8xFxnLt1qW/vE42vo8EE0/bT/xlE
	xsNnDserC2WT//8KclEKPFi7XmRq/dJPnQIO1YXLuOgYDx0dZgI7+jcUVt8UuN+lP/lzSkfX4+jkn
	hx55esS89OfeCQCEnkqEPO3xkfXI713cG7qgQ317CzjqFbgIlXD3Y8rEP0SxwrMttJkrr0GWJTu3A
	pIRViY4ECtD9tqcqxpxJNDeZ5ybxGKS4e9oeFkk/9V3AzpANt8EbUcLYz8S+f+e7cZwyv/6JMJN9U
	Xs5ORdcBU7OGdu9w6B+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjdl1-0000000CHW8-0OFN;
	Tue, 14 Jul 2026 14:05:11 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjdkv-0000000CHUW-3c7g
	for linux-amlogic@lists.infradead.org;
	Tue, 14 Jul 2026 14:05:09 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-38e08baf860so1780253a91.2
        for <linux-amlogic@lists.infradead.org>; Tue, 14 Jul 2026 07:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784037905; x=1784642705; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bCS+xhHigKk4Qit1FS738ySqpbHn6h48fVzGRxbPZzk=;
        b=YbYitBuznSnkkMmTyYK0Tf2ZT8IVeU0ZQtDcn1/mCb3By/LK7S8VpM1AGs7msl0BUY
         03ry04YA0Lc2O2WgRauKUCar/Nvc5oL0kQ530VcuKhxfYbEr+xi8/bDIWORjjdvDwP2v
         6QnOBH0tdjkncNr/LVD5dXxa4kSZkLg7SzKrG7gbxHKuIp7VrokEh9wzblYb2MJT19UY
         1qMgU772873AdGz8mgZaga7fF3Ywu3z0axIoEHtvVSLy8DHIDB004bbVQZY/1TJPw3ks
         Z1qDKXKR2QuJKri6T4MbcvWnhzbI+RjxIdbSqnrkpnV9mpNAuYI+Roec3dp1dUtK9r5z
         7axg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784037905; x=1784642705;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bCS+xhHigKk4Qit1FS738ySqpbHn6h48fVzGRxbPZzk=;
        b=ILeF3sPNS0wYKhN68rtVUoLxU2PNUn6/u/lLywz6/4tLZcmLuod3Eph+J6Py8MsgZl
         eg4nRXZmrLRpmtFmEOHT1+vytmC4jLOpgcSl33mZrbRO4O/2HYMA9sJqXgFu6SxgKpVr
         4Pp+cA9nzUmbbdM1v92+/gcnpIFyNizy6JUyqQiDga60zt2o94G0+rVQlNGbxu16tOFR
         tm6InROEoRZPKVoXdNe633rdAn+AN2umP9rMVQR/+7yuBIu7aW+Lfvj4Md/y/m3BIoNT
         qgxCq703nZq1o/HWP3bngs48O+U8vYa1Dwt57vH2fBH1lJVSDC6PgLgc+/KLnmkHaatm
         LRLQ==
X-Forwarded-Encrypted: i=1; AHgh+RqBmjdPDjpuJxPRPI41STkFt1IIYT8ogQdFyaOGBPCGezeUpYjPVBRcj3cqt6RmCvabdIaF9A6GpdMT2Qnm@lists.infradead.org
X-Gm-Message-State: AOJu0Yym5WSSPnORdITf1Gv6+eIkzs9nGPU13q5BdAWB/uhyg4izF3t7
	zhPHd7hXKyRPhUA1ersJGv2/qaN1o2tJBPQRaJ5WRHdNhIv8YFdXHr/8
X-Gm-Gg: AfdE7clflVckjLI9mcV1N7SZ0m1/XgFZ4GWTtMmiE9QmTNEBqAL1+EUNGMNjbbR9nCz
	c18chZsuwHI2ZQSuIfd6ywH0D9APM6heYrISEjxzjHUdlPTcfZUZxZ2jAAKFkDi8DY9y5GaCVXf
	Elk/6Ig+gBp8o6gmJrH22Ecym69duxlk25HdiMFLMR8oJVzV/T2yvQJ0uZ2MpGrsaFWY45NgveR
	ia3L3WyllUs00/dRuewKpQyIvM8rcLLDM0UtmtIr+y6vQGWqAgrW7EoohUMaSmnCnQ9FPUfIKtX
	48e0JNtr/8kTdH4ccFguaOho821kSr+yOkhvfw6OF4IzJd4gUKpqDWNSkpD6/gSUVT/fZl65S9Q
	HIMuNrTCdzooP3vNFcvEdXAyXaCk5XQdvs5bssbwlJVv948EouvvHndL9x9JHZyZNhNh2EkB2sX
	iBKh1xjY4t36RIU9U/4kM33zP/VEFHRbCVUYeOoMCvcZonm3vnR7gDAM2tun3nJqrf1JDtI0oyY
	nYamJ6zEpKccDl0QM7HiZ1s5aZ+QOMi5RhcjPIi0sMGSDU=
X-Received: by 2002:a17:90b:3c8a:b0:381:5bd6:eb19 with SMTP id 98e67ed59e1d1-38dc7605e7dmr12912747a91.18.1784037904733;
        Tue, 14 Jul 2026 07:05:04 -0700 (PDT)
Received: from OMEN ([103.184.238.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174ac14f2sm86964943eec.27.2026.07.14.07.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 07:05:04 -0700 (PDT)
From: Alfie Varghese <alfievarghese22@gmail.com>
To: neil.armstrong@linaro.org
Cc: gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	dan.carpenter@linaro.org,
	error27@gmail.com,
	alfievarghese22@gmail.com
Subject: [PATCH v2] staging: media: meson: vdec: propagate devm_clk_get() errors
Date: Tue, 14 Jul 2026 19:34:58 +0530
Message-ID: <20260714140458.1276-1-alfievarghese22@gmail.com>
X-Mailer: git-send-email 2.54.0.windows.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_070508_742090_34B8425C 
X-CRM114-Status: GOOD (  11.13  )
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

vdec_probe() hardcodes -EPROBE_DEFER for all devm_clk_get() failures.
This masks the actual error code returned by the clock framework, such
as -ENOENT when a clock is not registered or -ENOMEM on allocation
failure.

Return PTR_ERR() instead to propagate the real error to the caller.

Fixes: 4f75e7dfa6dc ("media: meson: vdec: add driver")
Signed-off-by: Alfie Varghese <alfievarghese22@gmail.com>
---
 drivers/staging/media/meson/vdec/vdec.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index a039d925c0fe..fba1e7f88d81 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -1026,24 +1026,24 @@ static int vdec_probe(struct platform_device *pdev)
 	    core->platform->revision == VDEC_REVISION_SM1) {
 		core->vdec_hevcf_clk = devm_clk_get(dev, "vdec_hevcf");
 		if (IS_ERR(core->vdec_hevcf_clk))
-			return -EPROBE_DEFER;
+			return PTR_ERR(core->vdec_hevcf_clk);
 	}
 
 	core->dos_parser_clk = devm_clk_get(dev, "dos_parser");
 	if (IS_ERR(core->dos_parser_clk))
-		return -EPROBE_DEFER;
+		return PTR_ERR(core->dos_parser_clk);
 
 	core->dos_clk = devm_clk_get(dev, "dos");
 	if (IS_ERR(core->dos_clk))
-		return -EPROBE_DEFER;
+		return PTR_ERR(core->dos_clk);
 
 	core->vdec_1_clk = devm_clk_get(dev, "vdec_1");
 	if (IS_ERR(core->vdec_1_clk))
-		return -EPROBE_DEFER;
+		return PTR_ERR(core->vdec_1_clk);
 
 	core->vdec_hevc_clk = devm_clk_get(dev, "vdec_hevc");
 	if (IS_ERR(core->vdec_hevc_clk))
-		return -EPROBE_DEFER;
+		return PTR_ERR(core->vdec_hevc_clk);
 
 	irq = platform_get_irq_byname(pdev, "vdec");
 	if (irq < 0)
-- 
2.54.0.windows.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
