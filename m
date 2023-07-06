Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01EE9C001B0
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jul 2023 11:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dW1I0HYbxGp6TNw4p69b8UXyHEz9ZAc/+lx06G7eI3c=; b=i9mSNT1wzVhRVM
	kplQeh4gggcVM9jO6XAlLr0pvzlbj13qqCW4IDft7AQm8kgUBea8LGDdFqOwrRWvllItf3yrnVhtn
	vUN2FjreV5NPp7Idow1K83OMFCAf5CjWvFc/9i94CxiaJxvOjUM1X6SOpaGPhOCsUCdStFlvW9hYQ
	L1hZ3glasIGS+qSAzHwTOWUuUr10JXGIZc/SWfuOCrF5p7udoAFuvif2BqMIc6jiFvO9fjLkTZzHf
	av76zk8vTujko3dtvq66iLKmXqwK2+Y/a7tuquc1thZGXmLYZ2ctlE4F8m25umnfWQIWtZQBJ4Ww2
	zKvAK8+mGjUZRhwELdUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHMmM-001Q8z-0S;
	Thu, 06 Jul 2023 11:04:06 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHMmH-001Q0F-0x
	for linux-amlogic@lists.infradead.org;
	Thu, 06 Jul 2023 11:04:04 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 7A45F120088;
	Thu,  6 Jul 2023 14:03:51 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 7A45F120088
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1688641431;
	bh=UVco8VzyFBkwCrFbrNr3zvNQFq8LFyScUlUs8ACcKXA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=p2YlJ6Aoa0sC+8Cgcts6rpg87g+FtFo/BR1u5OqQKiR2BFZyjwFVZjN4hnMPPL9nv
	 LSNuQMnYdsvV5QvxJvhl+nVpB+xa4VJ7BfEPunOQLRXYWuhJqUaxQ13GGSLTipRRMO
	 RZzYQIFFIftzSrPZS+U6LwZ4s6XvNbV8xiuCd68603XbOFMp7f7Bl/8BK4lg15aMF3
	 58LZ1oIRdh4Cqj2tPmtbVumscRe4ieYNIRqJdtJpVBB/jYhF72Lg17AMK74Qw7m+Nu
	 sq7aKCZeRUxO81SEI2926sJCAR1ByxQrAfdmW0HFrDwLrwHIYsnqgPI8ghQmA33KG3
	 vvCCqug0aiIQg==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Thu,  6 Jul 2023 14:03:51 +0300 (MSK)
Received: from CAB-WSD-0004828.sigma.sbrf.ru (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Thu, 6 Jul 2023 14:03:43 +0300
From: Martin Kurbanov <mmkurbanov@sberdevices.ru>
To: Mark Brown <broonie@kernel.org>, Neil Armstrong
	<neil.armstrong@linaro.org>, Andy Shevchenko <andy.shevchenko@gmail.com>
CC: <linux-spi@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <kernel@sberdevices.ru>, Martin Kurbanov
	<mmkurbanov@sberdevices.ru>
Subject: [PATCH v2 2/2] spi: amlogic-spifc-a1: add support for max_speed_hz
Date: Thu, 6 Jul 2023 14:03:31 +0300
Message-ID: <20230706110331.19794-3-mmkurbanov@sberdevices.ru>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230706110331.19794-1-mmkurbanov@sberdevices.ru>
References: <20230706110331.19794-1-mmkurbanov@sberdevices.ru>
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 178468 [Jul 06 2023]
X-KSMG-AntiSpam-Version: 5.9.59.0
X-KSMG-AntiSpam-Envelope-From: MMKurbanov@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 520 520 ccb018a655251011855942a2571029252d3d69a2, {Tracking_from_domain_doesnt_match_to}, d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;sberdevices.ru:5.0.1,7.1.1;100.64.160.123:7.1.2;p-i-exch-sc-m01.sberdevices.ru:5.0.1,7.1.1, FromAlignment: s, {Tracking_white_helo}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/07/05 14:57:00 #21566867
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230706_040402_191731_B7685140 
X-CRM114-Status: GOOD (  13.80  )
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

This patch sets the clock rate (spi_transfer->max_speed_hz) from the
amlogic_spifc_a1_exec_op().

Signed-off-by: Martin Kurbanov <mmkurbanov@sberdevices.ru>
---
 drivers/spi/spi-amlogic-spifc-a1.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/spi/spi-amlogic-spifc-a1.c b/drivers/spi/spi-amlogic-spifc-a1.c
index a92e4fc23396..605e9e40455c 100644
--- a/drivers/spi/spi-amlogic-spifc-a1.c
+++ b/drivers/spi/spi-amlogic-spifc-a1.c
@@ -107,6 +107,7 @@ struct amlogic_spifc_a1 {
 	struct clk *clk;
 	struct device *dev;
 	void __iomem *base;
+	u32 curr_speed_hz;
 };
 
 static int amlogic_spifc_a1_request(struct amlogic_spifc_a1 *spifc, bool read)
@@ -235,6 +236,21 @@ static int amlogic_spifc_a1_write(struct amlogic_spifc_a1 *spifc,
 	return amlogic_spifc_a1_request(spifc, false);
 }
 
+static int amlogic_spifc_a1_set_freq(struct amlogic_spifc_a1 *spifc, u32 freq)
+{
+	int ret;
+
+	if (freq == spifc->curr_speed_hz)
+		return 0;
+
+	ret = clk_set_rate(spifc->clk, freq);
+	if (ret)
+		return ret;
+
+	spifc->curr_speed_hz = freq;
+	return 0;
+}
+
 static int amlogic_spifc_a1_exec_op(struct spi_mem *mem,
 				    const struct spi_mem_op *op)
 {
@@ -243,6 +259,10 @@ static int amlogic_spifc_a1_exec_op(struct spi_mem *mem,
 	size_t data_size = op->data.nbytes;
 	int ret;
 
+	ret = amlogic_spifc_a1_set_freq(spifc, mem->spi->max_speed_hz);
+	if (ret)
+		return ret;
+
 	amlogic_spifc_a1_user_init(spifc);
 	amlogic_spifc_a1_set_cmd(spifc, SPIFC_A1_USER_CMD(op));
 
-- 
2.40.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
