Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D28A2C4332F
	for <linux-amlogic@archiver.kernel.org>; Wed,  8 Nov 2023 12:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mCG3baCUB84S2mEdVi3u6nqQOJ2m1Csrq17xuFfc7k8=; b=e6UmBWwNmZuAel
	k19CKIrOrZxB2bYB3KDi0AcUP/r/8W90/rehcau0OMUzSDWqI1RuogqcLQ+PYjqTW5vYFWoUCvP/N
	mfrlBD8Ph9F3Fwiu6nuWjdjBoW0HrE3HrOkgUHgA+FG38M9QMxeWry0l16wOV9Cfy2tJIa5XeF9LV
	wauqOmDdUIUn+A6hmCHlmafGbHSz3Cb+OC+pptArUr7lsq6dLIP/toGM38WIxtmflzAN64hPnFfr8
	9aB4XdESoOUQ0UNupOwOolcaSVPoAasnDlfqYXCDaIqQawt00gZVVUm4QsTlkFt6PcPwUOtsRoHia
	Y2vRtYEYQiDy4LL49F2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0i7X-003oX9-2G;
	Wed, 08 Nov 2023 12:57:23 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0i7S-003oUX-2b;
	Wed, 08 Nov 2023 12:57:21 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 90A93100031;
	Wed,  8 Nov 2023 15:57:12 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 90A93100031
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1699448232;
	bh=lEL9hzC+yiSK5zTbNOAn5LFfqRWf2kGLJXMdItJSVyA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=oYJ2iqyiUotP9czMjrfyU8wlpc0texQiVRLNMkG2/hyauuls9B3s6Rvh4QaHh4QnX
	 f5gigcnypL2BllMlJnzGyqw34HZA7qzHVDg5IJ6PO50AyO7w/HfYBG9FRT4HBlfgAC
	 MZ8Wpgb/cXI+hLB/W9+4NL5510IqsnoAyXaIpdBHTTzC2NB22AZH5xe2jfgrhbQoqU
	 WXWHcK8/C9Lr3hY8BJ6yPkPm7sgG99vToGBx4q4Q6AJlbYUosybUH5iZKKbWFntjfE
	 hLkjyMQmcfWjK/Mrzwpy7NnfUfM1MPnFuB4Ts041BQfu4du6rGyLSXQ+WFoEU+9YSF
	 zXB+wZ7Ehedqg==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Wed,  8 Nov 2023 15:57:12 +0300 (MSK)
Received: from pc (100.64.160.123) by p-i-exch-sc-m01.sberdevices.ru
 (172.16.192.107) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Wed, 8 Nov
 2023 15:57:12 +0300
From: Evgeny Bachinin <EABachinin@salutedevices.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
	<khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, Evgeny Bachinin
	<EABachinin@salutedevices.com>, Dmitry Rokosov <ddrokosov@sberdevices.ru>,
	Miles Chen <miles.chen@mediatek.com>, Alexey Romanov
	<avromanov@salutedevices.com>
CC: <kernel@sberdevices.ru>, <evgen89bachinin@gmail.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v1 2/2] firmware: meson-sm: unmap out_base shmem in error path
Date: Wed, 8 Nov 2023 15:56:04 +0300
Message-ID: <20231108125604.162383-3-EABachinin@salutedevices.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231108125604.162383-1-EABachinin@salutedevices.com>
References: <20231108125604.162383-1-EABachinin@salutedevices.com>
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 181206 [Nov 08 2023]
X-KSMG-AntiSpam-Version: 6.0.0.2
X-KSMG-AntiSpam-Envelope-From: eabachinin@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 543 543 1e3516af5cdd92079dfeb0e292c8747a62cb1ee4, {Tracking_uf_ne_domains}, {Tracking_from_domain_doesnt_match_to}, 100.64.160.123:7.1.2;lore.kernel.org:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;salutedevices.com:7.1.1;p-i-exch-sc-m01.sberdevices.ru:7.1.1,5.0.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2023/11/08 08:59:00
X-KSMG-LinksScanning: Clean, bases: 2023/11/08 08:57:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/11/08 08:25:00 #22426097
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231108_045719_234111_7484A4F9 
X-CRM114-Status: GOOD (  12.43  )
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

When SM driver was introduced in [1], the code flow did not require
to unmap out_base shmem in case of errors inside probe().
During [2], the additional error path appeared, which requires unmap.

Patch adds iounmap() missed.

Links:
[1] https://lore.kernel.org/linux-amlogic/1466339944-602-2-git-send-email-carlo@caione.org/
[2] https://lore.kernel.org/linux-amlogic/1532613556-5398-1-git-send-email-narmstrong@baylibre.com/

Fixes: 0789724f86a5 ("firmware: meson_sm: Add serial number sysfs entry")
Signed-off-by: Evgeny Bachinin <EABachinin@salutedevices.com>
---
 drivers/firmware/meson/meson_sm.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/meson/meson_sm.c b/drivers/firmware/meson/meson_sm.c
index 73878ff9833c..ca5f3534eddd 100644
--- a/drivers/firmware/meson/meson_sm.c
+++ b/drivers/firmware/meson/meson_sm.c
@@ -307,7 +307,7 @@ static int __init meson_sm_probe(struct platform_device *pdev)
 		fw->sm_shmem_out_base = meson_sm_map_shmem(chip->cmd_shmem_out_base,
 							   chip->shmem_size);
 		if (WARN_ON(!fw->sm_shmem_out_base))
-			goto out_in_base;
+			goto unmap_in_base;
 	}
 
 	fw->chip = chip;
@@ -315,13 +315,15 @@ static int __init meson_sm_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, fw);
 
 	if (devm_of_platform_populate(dev))
-		goto out_in_base;
+		goto unmap_out_base;
 
 	pr_info("secure-monitor enabled\n");
 
 	return 0;
 
-out_in_base:
+unmap_out_base:
+	iounmap(fw->sm_shmem_out_base);
+unmap_in_base:
 	iounmap(fw->sm_shmem_in_base);
 out:
 	return -EINVAL;
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
