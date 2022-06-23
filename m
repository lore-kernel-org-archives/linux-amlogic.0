Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3DE1C43334
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Jun 2022 13:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZGX8e+J7W0UjHyxy+G4mm13uyFQy/RwFOjyNk0+6sPU=; b=3LQjv9XuT1n0ys
	4A46Uf7Ajogxr1Lrx6nNCEKfI6TrhBt9nVynyoa4xK8BB+3ARYeCqwry39hnAkWepyKWs/zMZLsWf
	KTFgM6KxsuvKz/1HIgqwPGR3KErBuoOWeg3GgiIzJVttNa0i0YFrcDzZLb3EwuC9lelwMxc+jy3je
	rLuuMywqbrW/c2j8ubA6Xed8X01NONc/FIHuZ/mXUffwBZ3pJCJPpLgUrvAW58zKPhYN/v6mRF3jT
	7I2fkm9p08ligXTftx9rB/HT8AM/hVUctIsujNuX0SLkZjoYLgSjkG6pQfq5qeQSOfgkf+DU8uK0C
	9U+/KRL0obzANom8vAdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4MpV-00FLMb-3J; Thu, 23 Jun 2022 13:25:05 +0000
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25] helo=mx0b-001ae601.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4MpS-00FLKw-1H; Thu, 23 Jun 2022 13:25:03 +0000
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25N6FQeb013924;
	Thu, 23 Jun 2022 07:53:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=0akrc3t0gvqgAg9mHNYY5I7ETdh3VIkukD6HTMu03Q8=;
 b=RGBC0OgKsImgqtmzWxueuIWm/iPxb8fbLeQXo5Av1ekmhIFSzokkaVCMFH+7JjoxMjPH
 lEoYLGTJ9+TGbIGBtSLf7XElAQu1lbuysblI8dLUVy1KAxYu5qi/CQ9jfo2H4blpBakc
 QF9hvfE5fS5DgvOJGIH4NKgelpRDEaImVAbgofUpwHK6ix2g/Gd9adFCI0ooLCLbu2OP
 P24op62QObIYqEQeQgQyzZ8XhqYjzSgvjjmIemqtd3QA7XuUQpmcK9rwelzSan3Enepc
 ODufOzkG75k/EWwV1a62kde6kCvtQ4cM3PdAh8lvD0nTjV1BhHcvI501aWSx3LYKctcm RA== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3gsc41fa4x-13
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 23 Jun 2022 07:53:14 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 23 Jun
 2022 13:52:58 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Thu, 23 Jun 2022 13:52:58 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 8DBA511D4;
	Thu, 23 Jun 2022 12:52:58 +0000 (UTC)
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
        <linux-rpi-kernel@lists.infradead.org>, <frattaroli.nicolas@gmail.com>
Subject: [PATCH v2 88/96] ASoC: rk817: Remove now redundant non_legacy_dai_naming flag
Date: Thu, 23 Jun 2022 13:52:42 +0100
Message-ID: <20220623125250.2355471-89-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220623125250.2355471-1-ckeepax@opensource.cirrus.com>
References: <20220623125250.2355471-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
X-Proofpoint-GUID: 55AiC7Bk2_FY81iBWH4DMPNj2jdeZGYX
X-Proofpoint-ORIG-GUID: 55AiC7Bk2_FY81iBWH4DMPNj2jdeZGYX
X-Proofpoint-Spam-Reason: safe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220623_062502_124791_CCE6B499 
X-CRM114-Status: GOOD (  12.40  )
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

The ASoC core has now been changed to default to the non-legacy DAI
naming, as such drivers using the new scheme no longer need to specify
the non_legacy_dai_naming flag.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/rk817_codec.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/rk817_codec.c b/sound/soc/codecs/rk817_codec.c
index cce6f4e7992f5..2a5b274bfc0f5 100644
--- a/sound/soc/codecs/rk817_codec.c
+++ b/sound/soc/codecs/rk817_codec.c
@@ -444,7 +444,6 @@ static const struct snd_soc_component_driver soc_codec_dev_rk817 = {
 	.idle_bias_on = 1,
 	.use_pmdown_time = 1,
 	.endianness = 1,
-	.non_legacy_dai_naming = 1,
 	.controls = rk817_volume_controls,
 	.num_controls = ARRAY_SIZE(rk817_volume_controls),
 	.dapm_routes = rk817_dapm_routes,
-- 
2.30.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
