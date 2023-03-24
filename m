Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA01FC6FD1C
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 Mar 2023 14:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uHyDphn05YwaEgolPvXE3NecOsi539aOuOrfVCqEMcU=; b=rcSh0uxlwCT3eI
	XlOz++3kihnMxHcHAQRzqq8lV8wSOTMhn00qVA/wLQT7QEXeBkGgmK04L28bBv9gL8b+Kayr1q6jS
	AsDkjlpUJlnDVtuqv6tyuDvSiPeOXRQn3yWBWeuEgE3+kNKj/8o2CTUyG3RNMMYW1XYWcZkOKqxuN
	N9wjfDll2RQk6LwFEYv+mz8V66sNPkcV5FSdqFINpD4H/hFpSdvUXAZJ7ckYPY+/IcRKK+qPFbsv/
	2fNswigvEGj1ujg5EA7iLs9Dcp9eeLuBJtmD3WSnD44VyZJ8FyEA/2/8g9ylOY0v/W1oK/895xqx+
	fzCN82p7aXo1fV52zHUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfipy-004jHo-1q;
	Fri, 24 Mar 2023 14:56:14 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfipw-004jGZ-0w;
	Fri, 24 Mar 2023 14:56:13 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 23C035FD35;
	Fri, 24 Mar 2023 17:56:08 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1679669768;
	bh=jKGFF0Da4+1cXaHKpDC/eneHomsmAiAzeGToPU73Ezw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=n9hzZenddFoehGW/bLJK8iYJ1+F+cmLzgGNjzI05HGrl0Dbm9UYRrZOoPP09iAy7W
	 gKUbM5uO2+5SDZWi16LZdE7mRi2Xxhg+Am1QSs0i3jd7ylClla2wTVMZjGex/WgZPY
	 6i4FOs0642yY94YTdoRTfq3LP7K3OmxroX4Auqy3TuNUwVZ7U7yvgzgt6H5PVaE6HJ
	 hNf4Ehyy4P+32/cAZbdTXsJ/0vKUC18x3q5i8tRtA6fGnNKJS5dfr+6YcoJLzBeego
	 XK2DWZGWgq7HkrcpsCyBvyjfuAeSM0N9gbR4gt6wOBYwxHe8yl9hCLa25DwLpUnnb5
	 o2xr2q6GEBeVA==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Fri, 24 Mar 2023 17:56:07 +0300 (MSK)
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: <krzysztof.kozlowski@linaro.org>, <robh@kernel.org>,
	<neil.armstrong@linaro.org>, <khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <jianxin.pan@amlogic.com>
CC: <kernel@sberdevices.ru>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <rockosov@gmail.com>, Dmitry Rokosov
	<ddrokosov@sberdevices.ru>
Subject: [PATCH v3] firmware: meson_sm: populate platform devices from sm device tree data
Date: Fri, 24 Mar 2023 17:55:57 +0300
Message-ID: <20230324145557.27797-1-ddrokosov@sberdevices.ru>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH02.sberdevices.ru (172.16.1.5) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/03/24 06:52:00 #21002836
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_075612_500048_FF057AF5 
X-CRM114-Status: GOOD (  12.78  )
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
Changes v3 since v2 at [2]:
    - unmap meson sm shmem region if devm_of_platform_populate() failed
    - move pr_info() log about successfully enabled secure-monitor to
      the end of probe() routine

Changes v2 since v1 at [1]:
    - decline the device tree /firmware based solution
    - introduce devm_of_platform_populate() solution in the meson sm driver

Links:
    [1] https://lore.kernel.org/all/20230323185548.13731-1-ddrokosov@sberdevices.ru/
    [2] https://lore.kernel.org/linux-amlogic/20230324140141.6743-1-ddrokosov@sberdevices.ru/
---
 drivers/firmware/meson/meson_sm.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/meson/meson_sm.c b/drivers/firmware/meson/meson_sm.c
index 77aa5c6398aa..1a99dbc274fa 100644
--- a/drivers/firmware/meson/meson_sm.c
+++ b/drivers/firmware/meson/meson_sm.c
@@ -311,11 +311,14 @@ static int __init meson_sm_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, fw);
 
-	pr_info("secure-monitor enabled\n");
+	if (devm_of_platform_populate(dev))
+		goto out_in_base;
 
 	if (sysfs_create_group(&pdev->dev.kobj, &meson_sm_sysfs_attr_group))
 		goto out_in_base;
 
+	pr_info("secure-monitor enabled\n");
+
 	return 0;
 
 out_in_base:
-- 
2.36.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
