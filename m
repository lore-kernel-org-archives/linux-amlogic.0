Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AC49C54F30
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 May 2025 08:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y3Ab13Shq5fGZfCkmWL0zf2vIC0y+BefgvM2wtg6z0o=; b=0jK2lorxIP6p9m
	11V3+WNdw2yEruqW8ARYytmW4Ds4c74jupnlbHJuM/bGB06XgtphxFm3xHN/7/mnieyeRzZe1S+Ei
	tiE29k2X2rsUQ9WPc+m4a1GWGIrZx3JpBtGFbsfnNG181eyZKNYnf/ZylPl0Fb1S8bn/oRsiOV60+
	zPDcSKGqHEHatMTv5ZsUgoUGIhQ0CLYZB0Fju2yf9OUcJWxUyrDEZo9QkugNHSNMJGSzcEmgQykRL
	yjZ0cRgXBsvzHD/62R5jraqZPg3kPh3zna3Z5/+mPgyVUNuKTb2+m/TdEYhG9Rf12rlY23IJEbm3P
	e+zhzYg65EgVyoH5rYGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJpj6-0000000AGJU-3yTj;
	Tue, 27 May 2025 08:32:00 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJpcd-0000000AFB3-03jQ;
	Tue, 27 May 2025 08:25:20 +0000
X-UUID: 1be07e0c3ad411f0b29709d653e92f7d-20250527
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:d92f471f-a90a-48cf-9ece-d16b7edd8a45,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:6493067,CLOUDID:ccf9f53adcad70a7c340a906c6d1460f,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3,IP:
	nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,L
	ES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 1be07e0c3ad411f0b29709d653e92f7d-20250527
Received: from node4.com.cn [(10.44.16.170)] by mailgw.kylinos.cn
	(envelope-from <aichao@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 974318342; Tue, 27 May 2025 16:25:12 +0800
Received: from node4.com.cn (localhost [127.0.0.1])
	by node4.com.cn (NSMail) with SMTP id 124C916001F52;
	Tue, 27 May 2025 16:25:12 +0800 (CST)
X-ns-mid: postfix-683576E7-8481202684
Received: from kylin-pc.. (unknown [172.25.130.133])
	by node4.com.cn (NSMail) with ESMTPA id AC60716001F49;
	Tue, 27 May 2025 08:25:09 +0000 (UTC)
From: Ai Chao <aichao@kylinos.cn>
To: perex@perex.cz,
	tiwai@suse.com,
	johannes@sipsolutions.net,
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
	srinivas.kandagatla@linaro.org
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	imx@lists.linux.dev,
	kernel@pengutronix.de,
	linux-arm-msm@vger.kernel.org,
	Ai Chao <aichao@kylinos.cn>
Subject: [PATCH v3 2/6] ALSA: aoa: Use helper function for_each_child_of_node_scoped()
Date: Tue, 27 May 2025 16:24:42 +0800
Message-ID: <20250527082446.2265500-3-aichao@kylinos.cn>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250527082446.2265500-1-aichao@kylinos.cn>
References: <20250527082446.2265500-1-aichao@kylinos.cn>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_012519_367825_D8BF1E45 
X-CRM114-Status: UNSURE (   8.09  )
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
clean-up functionality to put the device_node automatically.

Signed-off-by: Ai Chao <aichao@kylinos.cn>
---
 sound/aoa/soundbus/i2sbus/core.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/aoa/soundbus/i2sbus/core.c b/sound/aoa/soundbus/i2sbus/core.c
index ce84288168e4..c1bd0565fc51 100644
--- a/sound/aoa/soundbus/i2sbus/core.c
+++ b/sound/aoa/soundbus/i2sbus/core.c
@@ -155,7 +155,7 @@ static int i2sbus_add_dev(struct macio_dev *macio,
 			  struct device_node *np)
 {
 	struct i2sbus_dev *dev;
-	struct device_node *child, *sound = NULL;
+	struct device_node *sound = NULL;
 	struct resource *r;
 	int i, layout = 0, rlen, ok = force;
 	char node_name[8];
@@ -178,7 +178,7 @@ static int i2sbus_add_dev(struct macio_dev *macio,
 		return 0;
 
 	i = 0;
-	for_each_child_of_node(np, child) {
+	for_each_child_of_node_scoped(np, child) {
 		if (of_node_name_eq(child, "sound")) {
 			i++;
 			sound = child;
@@ -335,7 +335,6 @@ static int i2sbus_add_dev(struct macio_dev *macio,
 
 static int i2sbus_probe(struct macio_dev* dev, const struct of_device_id *match)
 {
-	struct device_node *np;
 	int got = 0, err;
 	struct i2sbus_control *control = NULL;
 
@@ -347,7 +346,7 @@ static int i2sbus_probe(struct macio_dev* dev, const struct of_device_id *match)
 		return -ENODEV;
 	}
 
-	for_each_child_of_node(dev->ofdev.dev.of_node, np) {
+	for_each_child_of_node_scoped(dev->ofdev.dev.of_node, np) {
 		if (of_device_is_compatible(np, "i2sbus") ||
 		    of_device_is_compatible(np, "i2s-modem")) {
 			got += i2sbus_add_dev(dev, control, np);
-- 
2.47.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
