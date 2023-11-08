Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9060C04A95
	for <linux-amlogic@archiver.kernel.org>; Wed,  8 Nov 2023 12:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0nCIk0XCep+a1AkxRpUBWsTjdLdQAYkUI8yXDYfIt8Q=; b=bgA7JJ0Cd9EAFi
	K55357EgILytdGXpZ4X/xgsKCZ1N2jjQk3EzuZU1Tst0oMEqHR8N2/WzWtnL5ly2EDojHItB41Ea1
	mKk5HD12HQ8ZBP8Gab3Im0A1BpZE7tPA+fxp00IbgVahFxanDsrR3aG1c7OAzNG7jQL1zQw00F2oU
	nvGP6w/CZGvXe8HxFFatHndpwHSW/ORbzTq4R7JJJNOWbT/Irg2j03BC1iWuWaJ96RIiwk19JYT+j
	CnkjFQwpa6ytQnDaiJ8NgvV5YK+NEUoUg2fbwriURBEIKL5niYzJhnxTItkfVPpgt7SiCpsjSCzCx
	LE0JcMj/WiU9wJ0yA0Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0i7X-003oWu-0x;
	Wed, 08 Nov 2023 12:57:23 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0i7T-003oTq-0p;
	Wed, 08 Nov 2023 12:57:21 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 878F6120007;
	Wed,  8 Nov 2023 15:57:07 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 878F6120007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1699448227;
	bh=73YJxpyKrfQZjMMYETXxSzxu5XhjcgY9c/ld2sap6w8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=WkehRfNprPkAjldqLgYlSoymSgsc2+zIApNxi6F8mrZNHKSCou8BTz+LASJO8ihAO
	 tMlZypl0xezt6PdmYbjA6Dnr19LqqD0NKUUHW3/OXJKg9/EqSGAdLda3P3Bp8ajYFl
	 3IgU5Gi3a4B5W/md/xPg2OKwmehqGOlMz/lI8ZjPdpLZEW8BVYUxXzLUZcZ+QBHo8E
	 M0fgsDFIy8Ca1qeF6DG3i7pQkry5SzSeH2yEJxhAoo2OSr/FrWrqneblPtT6kjcrzT
	 8N0nSVu7Be/RgsmW8cOK3tZ/XpM69yJ0RLpcLwCFiQevtntBL0mrT/Fm7G4DDo4x/n
	 /Fdxfi79rCIaQ==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Wed,  8 Nov 2023 15:57:07 +0300 (MSK)
Received: from pc (100.64.160.123) by p-i-exch-sc-m01.sberdevices.ru
 (172.16.192.107) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Wed, 8 Nov
 2023 15:57:07 +0300
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
Subject: [PATCH v1 1/2] firmware: meson_sm: refactor serial sysfs entry via dev_groups attrs
Date: Wed, 8 Nov 2023 15:56:03 +0300
Message-ID: <20231108125604.162383-2-EABachinin@salutedevices.com>
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
X-KSMG-AntiSpam-Info: LuaCore: 543 543 1e3516af5cdd92079dfeb0e292c8747a62cb1ee4, {Tracking_from_domain_doesnt_match_to}, d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;salutedevices.com:7.1.1;p-i-exch-sc-m01.sberdevices.ru:5.0.1,7.1.1;100.64.160.123:7.1.2, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/11/08 12:09:00 #22428609
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231108_045719_683555_576D7063 
X-CRM114-Status: GOOD (  15.14  )
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

Introduce just another way to register sysfs serial entry:
the less code, the better in the absence of extra error-paths

Signed-off-by: Evgeny Bachinin <EABachinin@salutedevices.com>
---
 drivers/firmware/meson/meson_sm.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/firmware/meson/meson_sm.c b/drivers/firmware/meson/meson_sm.c
index 27a8cd4747f8..73878ff9833c 100644
--- a/drivers/firmware/meson/meson_sm.c
+++ b/drivers/firmware/meson/meson_sm.c
@@ -273,14 +273,11 @@ static ssize_t serial_show(struct device *dev, struct device_attribute *attr,
 
 static DEVICE_ATTR_RO(serial);
 
-static struct attribute *meson_sm_sysfs_attributes[] = {
+static struct attribute *meson_sm_sysfs_attrs[] = {
 	&dev_attr_serial.attr,
 	NULL,
 };
-
-static const struct attribute_group meson_sm_sysfs_attr_group = {
-	.attrs = meson_sm_sysfs_attributes,
-};
+ATTRIBUTE_GROUPS(meson_sm_sysfs);
 
 static const struct of_device_id meson_sm_ids[] = {
 	{ .compatible = "amlogic,meson-gxbb-sm", .data = &gxbb_chip },
@@ -320,9 +317,6 @@ static int __init meson_sm_probe(struct platform_device *pdev)
 	if (devm_of_platform_populate(dev))
 		goto out_in_base;
 
-	if (sysfs_create_group(&pdev->dev.kobj, &meson_sm_sysfs_attr_group))
-		goto out_in_base;
-
 	pr_info("secure-monitor enabled\n");
 
 	return 0;
@@ -337,6 +331,7 @@ static struct platform_driver meson_sm_driver = {
 	.driver = {
 		.name = "meson-sm",
 		.of_match_table = of_match_ptr(meson_sm_ids),
+		.dev_groups = meson_sm_sysfs_groups,
 	},
 };
 module_platform_driver_probe(meson_sm_driver, meson_sm_probe);
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
