Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00274C3ABDD
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 May 2025 09:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Pk5Rz2/aNTJYna/MoxwM+64+MTlvDbzkSCNSOBbvT1I=; b=AhlMm2pSEjBYZa
	U1CzRzODBDRHKi72tZlyYnkNAKQIjB4LL6+r5aJ1/Tl8yyDvlxO8ea5Kp+32afgyALwLwQAQLOdc7
	KcA21oOA5AhkszeFCy54Te0x9cEXYpa2MCN5gSqZR6jXNk5a6zkDz36esQt5uoq+odkybwrkzF8iN
	daNWO3FRDNb76cl2JJ5sMKWZRPdHaGoLvJrX4MknnjtOgEVu9I5EKTHW5Remr4fegh9Gs5tjcRXCK
	KiizcaEJRyhZeXJIsGvmQ2HJhYHXoWf0Uq/+nILNaRmq3dO5+F2vEm3iYki6F4CrnlvyCjGzJ4Ijc
	x3H0eFpinZSQrV3mJSKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHJ3N-0000000C9V5-3KNA;
	Tue, 20 May 2025 09:14:29 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHJ0t-0000000C8yf-0jUD;
	Tue, 20 May 2025 09:11:57 +0000
X-UUID: 725ad2b6355a11f0b29709d653e92f7d-20250520
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:87f64f3f-8ff6-4a5d-836f-e892fc7371f5,IP:0,U
	RL:0,TC:0,Content:39,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:39
X-CID-META: VersionHash:6493067,CLOUDID:fd4d755d8717728699b6f10f854a64c4,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:4|50,EDM:-3,IP:nil,UR
	L:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,S
	PR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 725ad2b6355a11f0b29709d653e92f7d-20250520
Received: from node4.com.cn [(10.44.16.170)] by mailgw.kylinos.cn
	(envelope-from <aichao@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 1902263896; Tue, 20 May 2025 17:11:43 +0800
Received: from node4.com.cn (localhost [127.0.0.1])
	by node4.com.cn (NSMail) with SMTP id A477B16003840;
	Tue, 20 May 2025 17:11:42 +0800 (CST)
X-ns-mid: postfix-682C474E-846621685
Received: from kylin-pc.. (unknown [172.25.130.133])
	by node4.com.cn (NSMail) with ESMTPA id 3F67B16001CC7;
	Tue, 20 May 2025 09:11:36 +0000 (UTC)
From: Ai Chao <aichao@kylinos.cn>
To: johannes@sipsolutions.net,
	perex@perex.cz,
	tiwai@suse.com,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	jbrunet@baylibre.com,
	neil.armstrong@linaro.org,
	khilman@baylibre.com,
	martin.blumenstingl@googlemail.com,
	srinivas.kandagatla@linaro.org,
	kuninori.morimoto.gx@renesas.com,
	zhangzekun11@huawei.com,
	krzysztof.kozlowski@linaro.org,
	ckeepax@opensource.cirrus.com,
	drhodes@opensource.cirrus.com,
	alexey.klimov@linaro.org
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Ai Chao <aichao@kylinos.cn>
Subject: [PATCH 0/6] Use helper function for_each_child_of_node_scoped()
Date: Tue, 20 May 2025 17:11:25 +0800
Message-ID: <20250520091131.4150248-1-aichao@kylinos.cn>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_021155_530935_9451FBA9 
X-CRM114-Status: UNSURE (   4.98  )
X-CRM114-Notice: Please train this message.
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

This patch series introduces wrapper functions
for_each_child_of_node_scoped(). 

The for_each_child_of_node_scoped() helper provides a scope-based clean-up
functionality to put the device_node automatically, and as such, there is
no need to call of_node_put() directly.

Thus, use this helper to simplify the code.

Summary:

 - Patch 1 ASoC: ppc: Use helper function for_each_child_of_node_scoped()

 - Patch 2 ASoC: aoa: Use helper function for_each_child_of_node_scoped()

 - Patch 3 ASoC: renesas: Use helper function for_each_child_of_node_scoped()

 - Patch 4 ASoC: meson: Use helper function for_each_child_of_node_scoped()

 - Patch 5 ASoC: imx-card: Use helper function for_each_child_of_node_scoped()

 - Patch 6 ASoC: qcom: Use helper function for_each_child_of_node_scoped()

 sound/aoa/soundbus/i2sbus/core.c   |  5 ++--
 sound/ppc/tumbler.c                |  5 ++--
 sound/soc/fsl/imx-card.c           | 13 ++++------
 sound/soc/meson/axg-card.c         |  3 +--
 sound/soc/meson/meson-card-utils.c | 14 +++--------
 sound/soc/qcom/lpass-cpu.c         |  3 +--
 sound/soc/qcom/qdsp6/q6afe-dai.c   |  3 +--
 sound/soc/qcom/qdsp6/q6asm-dai.c   |  4 +--
 sound/soc/renesas/rcar/core.c      | 39 ++++++++++--------------------
 sound/soc/renesas/rcar/ctu.c       |  8 ++----
 sound/soc/renesas/rcar/dma.c       |  4 +--
 sound/soc/renesas/rcar/dvc.c       |  8 ++----
 sound/soc/renesas/rcar/mix.c       |  8 ++----
 sound/soc/renesas/rcar/src.c       | 10 ++------
 sound/soc/renesas/rcar/ssi.c       | 18 ++++----------
 sound/soc/renesas/rcar/ssiu.c      |  7 ++----
 16 files changed, 47 insertions(+), 105 deletions(-)

-- 
2.47.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
