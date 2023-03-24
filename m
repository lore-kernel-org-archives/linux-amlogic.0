Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51CC1C6FD20
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 Mar 2023 14:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Wpt7LjuDfzw6fkO2je0l0qbXDygFrhvnlslypqaXtpM=; b=E0KE384MyCPhfk
	Fto2qlQfSfdfE5yfJMAVKwBjyjUDpWqPmBNnZEtWgXdDWg2MJgSeykXvWuKUtKDmunPpEJb15eJVJ
	L9uUkxe8RaOQlbg4vn1vAySmGWn6AKb9kYHRaXyrSqQbKrUTICEAyUiWKqIE4kYuquKH8kB3xSYMa
	JNWJLobF0/2tjbSU6wpvjVOkD8RV6MegmBc2Y18gn4DdAKxpRV9gqioxm7L5UDtvZR1L80i2QJzzi
	B7mP+cT8B0VBc3iRh7dAXgp+F3DlHbNKRoQjz9il4E42936p5naZs/WKab6EFt1Fuw+wxgqDlDpTm
	MstxqNOV0YJc7Td82lmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfhzc-004Za5-0z;
	Fri, 24 Mar 2023 14:02:08 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfhzY-004ZXl-0N;
	Fri, 24 Mar 2023 14:02:06 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 8F8975FD2F;
	Fri, 24 Mar 2023 17:01:51 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1679666511;
	bh=IlFUWYEeDUhp/CciNDBSLCyclwAtjmsXI28Xo3rwRSw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=sHf1Y8yk9o4VXC8BZNagl2tiGnwtFelKqjJUtNAxFegqckcy7GjyeJVzHPfAe3OKK
	 dfguX36kq9gogm/CyzjmalabqgtiqOj+DLRUh3trhID3+221x2tdk4OqYHSMP4UDyK
	 HXrpUHlnWIF8Ni3FI1B19Z7c1JiVRHCVAc36LVr1+q5Hq3ejDBOcPODnEBtfEt0+Kw
	 9YElqH9KUvCL/tAIwRDrvPEmg8M9NVbCuOpZq+XRcTkz2bxoEYdKZZy3UeD+nmKSVH
	 G5MQ/sAjmKbKeSVHhefXHBP+SA9JjtKbCGqkqqKzZlSxpBUbFivQXNGrzjDm/ikNuK
	 TY67koCIxlmMQ==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Fri, 24 Mar 2023 17:01:50 +0300 (MSK)
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: <krzysztof.kozlowski@linaro.org>, <robh@kernel.org>,
	<neil.armstrong@linaro.org>, <khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <jianxin.pan@amlogic.com>
CC: <kernel@sberdevices.ru>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <rockosov@gmail.com>, Dmitry Rokosov
	<ddrokosov@sberdevices.ru>
Subject: [PATCH v2] firmware: meson_sm: populate platform devices from sm device tree data
Date: Fri, 24 Mar 2023 17:01:41 +0300
Message-ID: <20230324140141.6743-1-ddrokosov@sberdevices.ru>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/03/24 06:52:00 #21002836
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_070204_679964_F41E408B 
X-CRM114-Status: GOOD (  11.18  )
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

In some meson boards, secure monitor device has children, for example,
power secure controller. By default, secure monitor isn't the bus in terms
of device tree subsystem, so the of_platform initialization code doesn't
populate its device tree data. As a result, secure monitor's children
aren't probed at all.

Run the 'of_platform_populate()' routine manually to resolve such issues.

Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
---
 drivers/firmware/meson/meson_sm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/meson/meson_sm.c b/drivers/firmware/meson/meson_sm.c
index 77aa5c6398aa..b79d0e316cb1 100644
--- a/drivers/firmware/meson/meson_sm.c
+++ b/drivers/firmware/meson/meson_sm.c
@@ -316,7 +316,7 @@ static int __init meson_sm_probe(struct platform_device *pdev)
 	if (sysfs_create_group(&pdev->dev.kobj, &meson_sm_sysfs_attr_group))
 		goto out_in_base;
 
-	return 0;
+	return devm_of_platform_populate(dev);
 
 out_in_base:
 	iounmap(fw->sm_shmem_in_base);
-- 
2.36.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
