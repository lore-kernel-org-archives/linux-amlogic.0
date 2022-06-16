Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E8D3C43334
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Jun 2022 14:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3cPa+zDFOafRIrccu/a3NO4Y1SC8QC6pucpfalGW+sw=; b=U3SwBIJ1ypAVN2
	9qJy6/XmKI1vRmVTsPnO4j5cb22OZTpPvCgeOcajgDuEdkviiqpv380CDKiYInHmtwlR0lvHXUJog
	7jQLoPwt4+f24Yz8Mha4tBM7RpxhjupI+HCDe7q/PT7byCDKTH5Xbghc4owk11d54aNIORnpSDYZx
	UW9XFRe86mzRbZCS5jk6DcNlf0CxDc9K92oK8a9YBr33r+QmgH7g/jT9bytIL2Dc0pSidMgtRjXnS
	WJ09DyBeWH2if3ApI+M270NaK5/hG8/BICxL/4etB2UBV3fjgRQ6FVusidFlZMb6UWSAqztfRjvdH
	gosR6FJWlyqDc7e6rWBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1qaU-002raK-VY; Thu, 16 Jun 2022 14:35:10 +0000
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25] helo=mx0b-001ae601.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1qaH-002rQx-0V; Thu, 16 Jun 2022 14:35:04 +0000
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25G4igBW030693;
	Thu, 16 Jun 2022 09:34:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=2TN13SaBviXFLG5SogVSnAtaPuCmUdh8Cf5QqA62gzA=;
 b=cTaxCGqjcMX9vYNRjlzTuEQRmbhMX94tk8RHDWcoZP9rwdFRNCkkyj89Lw2g/91oReCK
 02ESGbylFQ92PYkEWz2JfvljafrCteOsaDIHrsO4Fkpp1JAEYcFb/FwFPdFKwSZPtF7e
 ll/fK+rsMmCU/N+K88KesbKSrTnzBrsz76WXH8KZC1Tv/eUAWtuFLLTQ4dqVdgyiaVUE
 LvZetV1R1vE+dYq9iHF5hyZm3xgYSVPBCTFRkuUPb1DqShSuBfBCk6Tx//uJIRAglmnZ
 vvvDTcsjkmG7ptZ3tD3rN9Cmq4Tw4BlGaeeh1NWRW/pDmTQbuGJYhID1njaegUZHn+Xv 7w== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3gmrf35vuw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 16 Jun 2022 09:34:36 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 16 Jun
 2022 15:34:30 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Thu, 16 Jun 2022 15:34:30 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id C14AD468;
	Thu, 16 Jun 2022 14:34:30 +0000 (UTC)
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
Subject: [PATCH 11/96] ASoC: tegra: Migrate to new style legacy DAI naming flag
Date: Thu, 16 Jun 2022 15:33:04 +0100
Message-ID: <20220616143429.1324494-12-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220616143429.1324494-1-ckeepax@opensource.cirrus.com>
References: <20220616143429.1324494-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
X-Proofpoint-GUID: gj2uBh13TntIo5RBCznfQ89FQoVVbMrs
X-Proofpoint-ORIG-GUID: gj2uBh13TntIo5RBCznfQ89FQoVVbMrs
X-Proofpoint-Spam-Reason: safe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_073457_094301_0B088919 
X-CRM114-Status: GOOD (  15.70  )
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
These drivers appear to be on the CPU side of the DAI link and
currently uses the legacy naming, so add the new flag.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/tegra/tegra20_ac97.c  | 3 ++-
 sound/soc/tegra/tegra20_i2s.c   | 3 ++-
 sound/soc/tegra/tegra20_spdif.c | 1 +
 sound/soc/tegra/tegra30_i2s.c   | 3 ++-
 4 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/sound/soc/tegra/tegra20_ac97.c b/sound/soc/tegra/tegra20_ac97.c
index c454a34c15c4c..e17375c6cddb9 100644
--- a/sound/soc/tegra/tegra20_ac97.c
+++ b/sound/soc/tegra/tegra20_ac97.c
@@ -239,7 +239,8 @@ static struct snd_soc_dai_driver tegra20_ac97_dai = {
 };
 
 static const struct snd_soc_component_driver tegra20_ac97_component = {
-	.name		= DRV_NAME,
+	.name			= DRV_NAME,
+	.legacy_dai_naming	= 1,
 };
 
 static bool tegra20_ac97_wr_rd_reg(struct device *dev, unsigned int reg)
diff --git a/sound/soc/tegra/tegra20_i2s.c b/sound/soc/tegra/tegra20_i2s.c
index 2e1a726602f02..fff0cd6588f56 100644
--- a/sound/soc/tegra/tegra20_i2s.c
+++ b/sound/soc/tegra/tegra20_i2s.c
@@ -338,7 +338,8 @@ static const struct snd_soc_dai_driver tegra20_i2s_dai_template = {
 };
 
 static const struct snd_soc_component_driver tegra20_i2s_component = {
-	.name		= DRV_NAME,
+	.name			= DRV_NAME,
+	.legacy_dai_naming	= 1,
 };
 
 static bool tegra20_i2s_wr_rd_reg(struct device *dev, unsigned int reg)
diff --git a/sound/soc/tegra/tegra20_spdif.c b/sound/soc/tegra/tegra20_spdif.c
index 64c2f304f2542..ca7b222e07d05 100644
--- a/sound/soc/tegra/tegra20_spdif.c
+++ b/sound/soc/tegra/tegra20_spdif.c
@@ -264,6 +264,7 @@ static struct snd_soc_dai_driver tegra20_spdif_dai = {
 
 static const struct snd_soc_component_driver tegra20_spdif_component = {
 	.name = "tegra20-spdif",
+	.legacy_dai_naming = 1,
 };
 
 static bool tegra20_spdif_wr_rd_reg(struct device *dev, unsigned int reg)
diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
index 3aa157c82ae23..10cd37096fb33 100644
--- a/sound/soc/tegra/tegra30_i2s.c
+++ b/sound/soc/tegra/tegra30_i2s.c
@@ -331,7 +331,8 @@ static const struct snd_soc_dai_driver tegra30_i2s_dai_template = {
 };
 
 static const struct snd_soc_component_driver tegra30_i2s_component = {
-	.name		= DRV_NAME,
+	.name			= DRV_NAME,
+	.legacy_dai_naming	= 1,
 };
 
 static bool tegra30_i2s_wr_rd_reg(struct device *dev, unsigned int reg)
-- 
2.30.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
