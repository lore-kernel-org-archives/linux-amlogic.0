Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D25DFCCA48B
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Jun 2022 14:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nQXLlp6x68n6rtfAf5WT9R16+W0fuuZUV0zsNEcq3Y4=; b=vgmi5gb1gO50Qx
	g8ngBMVAOLo/+I+Ws33tKNqMmfrNUlojC4bj9R/WHhea3Juv0d45gTYZESZX5l3Eukgt9xxko7Rdl
	Y3YSqfg5uhpCmS07SyYcXmagkyrZFmq+R/tg/VmeUzJlGVOGdEGooBe0u+1IUYWaD4AnZdlpfLLHE
	Z2Re2Dq1PyU9HCUvfANYkjOYlhMQjCtRnTkQsVkUHV3BVw9Pj3uSqvLERqoRjkddahVv99aJxXkSd
	yUhZXmMOx8hVYS//IRtPV28SWtaOESR7nTA43p0YvWfpdxD/y/Erwi4JkwuwGR2mf+o3SEL28jsy2
	Vklgo7D5zrUfAHwW+VWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1qbm-002sk1-0F; Thu, 16 Jun 2022 14:36:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1qaa-002red-22; Thu, 16 Jun 2022 14:35:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=A965WNpWYSDhf9ldMo6HdYu7YQa1FzA7GWkgiub9ZVc=; b=GzyaCTzjTJ10yLa5hDg0q5VVx5
	LjbvERct4c5HXvf2DNzcZvx4PidiaE1vhh1QpKKXt91B8dZ+A8GAIY7eYv1Jq24kmHgSXG3c3K4hf
	vSvMjRvnH1ucFas5vcGyPEWUgkcmcGWbtBjRDNO3hLw7M//ii4z+FoYfXn93mbF/i2j8RbyTD0Gyj
	ognYwsWYzli0F4H+9xrbxEuzRz5bK1DSnsY0CO9C9oT5gx4iLZ/4Z/kpbd1R1yRVYW30ih17Ydxrk
	rDpdIs6/O1t2oGJnDpEOfElkb2GK2hUFN2vmkfvogqoQ0xfSShkFXBhHvlH2GCvM8B+faKBm/0oJ1
	ZlTEwWsg==;
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25] helo=mx0b-001ae601.pphosted.com)
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1qaR-008R3Z-E4; Thu, 16 Jun 2022 14:35:10 +0000
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25GC07CA027888;
	Thu, 16 Jun 2022 09:34:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=A965WNpWYSDhf9ldMo6HdYu7YQa1FzA7GWkgiub9ZVc=;
 b=o4pcf54h2lvTGqLC++sWvGrvDi9R7mH6giDArf04s/YK5MqnWSkEVltNC0CV26CxOKIw
 nkDy5YHhya+nJviuT2iHIxDr35diUWqXhmNtdBntQ1SMsyiWgzCEewLauXgxBzsylntq
 xmdTZFsgWKezBAndYro7eBapzc4XiC/tA1JEgFGC76whpe7xVo3hsr5pzIuoXE8HEbTl
 tjcDzqHzG78VgbXV8BoeqmxW6aAA1f8ChCBUyXOIJFVAF7T628e3pX3ouOsbb0jehZ2a
 aFM7gGE1mRwDlAYJZzCEUmjddGW2TnMFdaLg0qPVn15N010LFCKotjrcXqbAX30qyjQU OQ== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3gmrf35vuu-7
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 16 Jun 2022 09:34:37 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 16 Jun
 2022 15:34:31 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Thu, 16 Jun 2022 15:34:31 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 183E8478;
	Thu, 16 Jun 2022 14:34:31 +0000 (UTC)
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
Subject: [PATCH 15/96] ASoC: Intel: Migrate to new style legacy DAI naming flag
Date: Thu, 16 Jun 2022 15:33:08 +0100
Message-ID: <20220616143429.1324494-16-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220616143429.1324494-1-ckeepax@opensource.cirrus.com>
References: <20220616143429.1324494-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
X-Proofpoint-GUID: 9a5V09cUm1hVFJu6sv4Ty0VY0EecRsgM
X-Proofpoint-ORIG-GUID: 9a5V09cUm1hVFJu6sv4Ty0VY0EecRsgM
X-Proofpoint-Spam-Reason: safe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_153508_563783_C92DD38A 
X-CRM114-Status: GOOD (  14.15  )
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
 sound/soc/intel/keembay/kmb_platform.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/sound/soc/intel/keembay/kmb_platform.c b/sound/soc/intel/keembay/kmb_platform.c
index d10881fedc8bb..b4893365d01d5 100644
--- a/sound/soc/intel/keembay/kmb_platform.c
+++ b/sound/soc/intel/keembay/kmb_platform.c
@@ -388,15 +388,17 @@ static snd_pcm_uframes_t kmb_pcm_pointer(struct snd_soc_component *component,
 }
 
 static const struct snd_soc_component_driver kmb_component = {
-	.name		= "kmb",
-	.pcm_construct	= kmb_platform_pcm_new,
-	.open		= kmb_pcm_open,
-	.trigger	= kmb_pcm_trigger,
-	.pointer	= kmb_pcm_pointer,
+	.name			= "kmb",
+	.pcm_construct		= kmb_platform_pcm_new,
+	.open			= kmb_pcm_open,
+	.trigger		= kmb_pcm_trigger,
+	.pointer		= kmb_pcm_pointer,
+	.legacy_dai_naming	= 1,
 };
 
 static const struct snd_soc_component_driver kmb_component_dma = {
-	.name		= "kmb",
+	.name			= "kmb",
+	.legacy_dai_naming	= 1,
 };
 
 static int kmb_probe(struct snd_soc_dai *cpu_dai)
-- 
2.30.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
