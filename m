Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D69DCC433EF
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Jun 2022 14:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m/gag5IL5/mgm3BvTOFMJB9Zz4N1iE/kZ6jDuZZ2fpI=; b=02GKrrGhZIvNXJ
	9aL8jE530aDXUBng40D0RosMwb3kmS6HevQAkXZ8qrcFQ7iiTM3Bujf3EEHg57+O1RYsQ4WQr4UCQ
	VdTvHRik9e4QbMAUmDraN/P/dI41f1Z1z8ZEIQCEDVQU0/ZqQQ7QyW3a5dYiAX13Qh9xixaV2RPL2
	LMnqh9Qc3e24mVZpDilWdKtsMjOnJ0VnZtAi6ef1lK/KT233vC/+LRQKgynmNwpN1OdzBA7krwTYZ
	oxi5XZKNBWIm1Uw+zg07TxWbt9JfcswovohsKldG5l1RCIBOt1MbV6PuJutpBN9zio/1qB4mEPYcS
	xJBCacyS1NKmIionu5uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1qco-002twX-KA; Thu, 16 Jun 2022 14:37:34 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1qaf-002rhO-KI; Thu, 16 Jun 2022 14:35:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=PWSGRrWgNvQqI/FJwn730ONsTAALyjkFDX1e4aDoN0Y=; b=JxEnE0QWqDS1VaTdbGTgQ8A9wE
	xrSn+ugP36F3dTpIZLAwL+YugJcXnKs6qD2MTt+bjq1ySLyEZHaW+IqLvzIrhVcakI1uOYPzTI7rO
	wju5yn4jYhTFSTTaNt8Hw4DB/gAjcIvZkWZ/4D9Nlsi31oiUW3mPyv0M9oLFe6Gqa86x/mUk9xVil
	eLUslX2qCsf95922fK40PRLiGaMPgjrXAC9kxhhcVNpvNNsnftkA6f1a+EHbSWXMh9RvoY8lBHEsu
	uTqS9W3/c4lVZcnezFe7C61k/gLZIfm9S9UI57Ja1AuG6kzkXpc6fnSypFrr5HFxxF6rUh4T/qIcf
	WC9TQxeA==;
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25] helo=mx0b-001ae601.pphosted.com)
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1qaR-008R3S-E6; Thu, 16 Jun 2022 14:35:12 +0000
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25G4igBa030693;
	Thu, 16 Jun 2022 09:34:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=PWSGRrWgNvQqI/FJwn730ONsTAALyjkFDX1e4aDoN0Y=;
 b=aunoSd3Y2LL2Jh+8WAGSuUqS/F2Tah6wB9r4VPbfcwz95TZhTzl3UQ9GceTQLDOs532y
 iJ89IK50EAtZ4TMSfizFzR7Tvmturi6f+su6cOwHpNSPUpN+q4Sfb2ZqrcwBtuiWTFj/
 B+45969XSLj0aFL8/laa4Rqq/aqHvT5ebKeoa2163CMTDIgWN3lknry43+v57P78+u9C
 wnqkoiMeDYqBImmmP638gYKomrQBgbDtO8wAgSIPGKX9OGb1yuiR0IkSmd3AocEB6pm4
 NK0HGv1yk7ByxuVsi8FA6tFUaL6pwXX8er0JLSEKQoKFAh0MrG03/3W+Y7T2txTgxlat /Q== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3gmrf35vuw-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 16 Jun 2022 09:34:40 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 16 Jun
 2022 15:34:32 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Thu, 16 Jun 2022 15:34:32 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 84C4C11D3;
	Thu, 16 Jun 2022 14:34:32 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <kuninori.morimoto.gx@renesas.com>,
        <mripard@kernel.org>, <airlied@linux.ie>, <daniel@ffwll.ch>,
        <vkoul@kernel.org>, <nicolas.ferre@microchip.com>, <nsaenz@kernel.org>,
        <shawnguo@kernel.org>, <linux-imx@nxp.com>,
        <cezary.rojewski@intel.com>, <pierre-louis.bossart@linux.intel.com>,
        <linux-mips@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
        <daniel@zonque.org>, <srinivas.kandagatla@linaro.org>,
        <linux-rockchip@lists.infradead.org>, <krzk@kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-sunxi@lists.linux.dev>, <linux-tegra@vger.kernel.org>,
        <linux-omap@vger.kernel.org>, <linux-xtensa@linux-xtensa.org>,
        <peter.ujfalusi@gmail.com>, <jarkko.nikula@bitmer.com>,
        <heiko@sntech.de>, <jbrunet@baylibre.com>, <kernel@pengutronix.de>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <dri-devel@lists.freedesktop.org>,
        <linux-rpi-kernel@lists.infradead.org>
Subject: [PATCH 32/96] ASoC: mxs-saif: Migrate to new style legacy DAI naming flag
Date: Thu, 16 Jun 2022 15:33:25 +0100
Message-ID: <20220616143429.1324494-33-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220616143429.1324494-1-ckeepax@opensource.cirrus.com>
References: <20220616143429.1324494-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
X-Proofpoint-GUID: aFh-e9vjHCOO20rpLqkPvBmaX-DQ1kFa
X-Proofpoint-ORIG-GUID: aFh-e9vjHCOO20rpLqkPvBmaX-DQ1kFa
X-Proofpoint-Spam-Reason: safe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_153508_679297_392B74A3 
X-CRM114-Status: GOOD (  15.88  )
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

Change the legacy DAI naming flag from opting in to the new scheme
(non_legacy_dai_naming), to opting out of it (legacy_dai_naming).
This driver appears to be on the CPU side of the DAI link and
currently uses the legacy naming, so add the new flag.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/mxs/mxs-saif.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/mxs/mxs-saif.c b/sound/soc/mxs/mxs-saif.c
index 467b0f2ce0bb1..ac761d3a01c05 100644
--- a/sound/soc/mxs/mxs-saif.c
+++ b/sound/soc/mxs/mxs-saif.c
@@ -663,7 +663,8 @@ static struct snd_soc_dai_driver mxs_saif_dai = {
 };
 
 static const struct snd_soc_component_driver mxs_saif_component = {
-	.name		= "mxs-saif",
+	.name			= "mxs-saif",
+	.legacy_dai_naming	= 1,
 };
 
 static irqreturn_t mxs_saif_irq(int irq, void *dev_id)
-- 
2.30.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
