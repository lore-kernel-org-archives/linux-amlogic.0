Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92D0FC5AE59
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Jun 2025 06:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EXBcZCclP9WcTuKj/pU2sQyX3S6fhoVF97pkN6gxi0E=; b=FvlK7SdSRcBneV
	+CQCaN5gQ9X9/3tqAGOPxRCaQ2zagjjFOTlXU8uXnvboyTeV6eDeqZrDxylpooSzlh/+fa5+ICfl0
	zDxV1CDKuPrQWcZ7ucSn7y+dv6m15tiY341l2JZSPatzpZfSrVhIFgLu4s7z4mQTYyCKSAcp/GVRn
	ln2mu/ilzUXlVXRQ06TnJdGw4rK4dpRfGQAn22FdxKfrG6yYc4T2rd6LclM/Y9x8+h15d5gJ2tgD+
	AKIf9rXsHiT0vp9U6fDDj0NRkVU1hRIYeApYaI+i3gqqc5WPQrZmFxmj3sdNB/cfmdf0p3x/l7ivi
	jNh7j/VA8bYuytU3wr2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMKhJ-00000009t8a-0yjj;
	Tue, 03 Jun 2025 06:00:29 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMKYh-00000009rV1-2oDW;
	Tue, 03 Jun 2025 05:51:37 +0000
X-UUID: cd018a2c403e11f0b29709d653e92f7d-20250603
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:d00fb2fc-8931-4d82-af9f-370910dd06d0,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:82159c751699e0b2a3d463d53031854c,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3,IP:
	nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,L
	ES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: cd018a2c403e11f0b29709d653e92f7d-20250603
Received: from node4.com.cn [(10.44.16.170)] by mailgw.kylinos.cn
	(envelope-from <aichao@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 918867262; Tue, 03 Jun 2025 13:51:32 +0800
Received: from node4.com.cn (localhost [127.0.0.1])
	by node4.com.cn (NSMail) with SMTP id B8ECC16001A00;
	Tue,  3 Jun 2025 13:51:31 +0800 (CST)
X-ns-mid: postfix-683E8D63-59658677
Received: from kylin-pc.. (unknown [172.25.130.133])
	by node4.com.cn (NSMail) with ESMTPA id B945916001CC7;
	Tue,  3 Jun 2025 05:51:29 +0000 (UTC)
From: Ai Chao <aichao@kylinos.cn>
To: perex@perex.cz,
	tiwai@suse.com,
	kuninori.morimoto.gx@renesas.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	jbrunet@baylibre.com,
	neil.armstrong@linaro.org,
	khilman@baylibre.com,
	martin.blumenstingl@googlemail.com,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	Ai Chao <aichao@kylinos.cn>
Subject: [PATCH v4 4/4] ASoC: imx-card: Use helper function for_each_child_of_node_scoped()
Date: Tue,  3 Jun 2025 13:51:09 +0800
Message-ID: <20250603055109.3154061-5-aichao@kylinos.cn>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250603055109.3154061-1-aichao@kylinos.cn>
References: <20250603055109.3154061-1-aichao@kylinos.cn>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_225136_057554_1B58FC8B 
X-CRM114-Status: UNSURE (   8.23  )
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

The for_each_child_of_node_scoped() helper provides a scope-based
clean-up functionality to put the device_node automatically, and
as such, there is no need to call of_node_put() directly.

Signed-off-by: Ai Chao <aichao@kylinos.cn>
---
 sound/soc/fsl/imx-card.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/sound/soc/fsl/imx-card.c b/sound/soc/fsl/imx-card.c
index 9e668ae68039..ea5dbb54b584 100644
--- a/sound/soc/fsl/imx-card.c
+++ b/sound/soc/fsl/imx-card.c
@@ -513,7 +513,6 @@ static int imx_card_parse_of(struct imx_card_data *data)
 	struct device_node *platform = NULL;
 	struct device_node *codec = NULL;
 	struct device_node *cpu = NULL;
-	struct device_node *np;
 	struct device *dev = card->dev;
 	struct snd_soc_dai_link *link;
 	struct dai_link_data *link_data;
@@ -552,11 +551,10 @@ static int imx_card_parse_of(struct imx_card_data *data)
 	link = card->dai_link;
 	link_data = data->link_data;
 
-	for_each_child_of_node(dev->of_node, np) {
+	for_each_child_of_node_scoped(dev->of_node, np) {
 		dlc = devm_kzalloc(dev, 2 * sizeof(*dlc), GFP_KERNEL);
 		if (!dlc) {
-			ret = -ENOMEM;
-			goto err_put_np;
+			return -ENOMEM;
 		}
 
 		link->cpus	= &dlc[0];
@@ -567,8 +565,8 @@ static int imx_card_parse_of(struct imx_card_data *data)
 
 		ret = of_property_read_string(np, "link-name", &link->name);
 		if (ret) {
-			dev_err(card->dev, "error getting codec dai_link name\n");
-			goto err_put_np;
+			return dev_err_probe(card->dev, ret,
+					     "error getting codec dai_link name\n");
 		}
 
 		cpu = of_get_child_by_name(np, "cpu");
@@ -725,8 +723,7 @@ static int imx_card_parse_of(struct imx_card_data *data)
 	of_node_put(cpu);
 	of_node_put(codec);
 	of_node_put(platform);
-err_put_np:
-	of_node_put(np);
+
 	return ret;
 }
 
-- 
2.47.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
