Return-Path: <SRS0=1PXW=BL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F5AEC433E1
	for <linux-amlogic@archiver.kernel.org>; Sat,  1 Aug 2020 10:04:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF8772087C
	for <linux-amlogic@archiver.kernel.org>; Sat,  1 Aug 2020 10:04:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Dlh+7Wir";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gerhold.net header.i=@gerhold.net header.b="mCIR+O7H"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF8772087C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gerhold.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Vx7Jg2XyKCD/xfJvfmG7KUyBVrcAMhNnu7J6p9CIsuQ=; b=Dlh+7WirgHc0m/aTmv4J8DR2a
	dQ45D2TtX5q67LU0TPTTAEOBZZjEnb6ndlNZBxqJzb3n3b2pO7pJl2nfu1PLU8qF7sI/yEvk9hNEt
	/FG9sfRtci4u2ShKevakvVe0co3tbRrSVm/QLnmhG8TW3sdlF1pc7fQY9ijwLOqUZeIGUC4vzgJAe
	FOsqD6oF6IWp9J8SPeeeWu5LNKLe23i0sg7YuP6rAsWHN8Tl3Nog4ofkpZ10vJ40Ddm1Q7Xic3u9X
	VO3XB0OOWXV/2xSBmhuaig6OidO3XfbHRLssWh7QDWS+Mm6zg2KkfhQQQfLW8NXIm+asC20XTvRvr
	RJ//OLdqw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k1oN9-0007RC-F3; Sat, 01 Aug 2020 10:04:11 +0000
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.54])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k1oN6-0007PX-Ei
 for linux-amlogic@lists.infradead.org; Sat, 01 Aug 2020 10:04:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1596276242;
 s=strato-dkim-0002; d=gerhold.net;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=D201RxrKY/jF6vCi3Z/0LyKu6Ty7PhswE7QCdIrJJ7c=;
 b=mCIR+O7HQN9Ug85B8/zjY7tCyOZaOxR/4cOAuG7NDgQzS3S4tjiWimVsaapTfw9kIe
 IFxNs6ltAKWiYbwTC+PUI6hzCmV9owdUIgjzv1corqBTvQG4liM+5x+QA9GwfdrN6PMo
 3bGckhQu+Z6q5g8OEuKBlRZeJsqGgknSKP6q6w8/6+1fblM5/tDT60djob4fRbQsa8cu
 rySV37Ljt0HAINqh5Mspc9d2De/gsCm4CXKDvaKYdzhxDtaIiAh03QJa8YwZvKP0aBLM
 SLBBCuq3GYWplIl3115IXyuDA04KXj15LfAEPL/WJBAmolgKU/X2d6E8eNyc0MkBhTwj
 Dzfg==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB5m6NBgYo"
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
 by smtp.strato.de (RZmta 46.10.5 DYNA|AUTH)
 with ESMTPSA id Y0939ew71A41rZ7
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Sat, 1 Aug 2020 12:04:01 +0200 (CEST)
From: Stephan Gerhold <stephan@gerhold.net>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 2/3] ASoC: simple-card: Use snd_soc_of_parse_aux_devs()
Date: Sat,  1 Aug 2020 12:02:56 +0200
Message-Id: <20200801100257.22658-2-stephan@gerhold.net>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200801100257.22658-1-stephan@gerhold.net>
References: <20200801100257.22658-1-stephan@gerhold.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200801_060408_731078_7FEBB681 
X-CRM114-Status: GOOD (  15.08  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: alsa-devel@alsa-project.org, Stephan Gerhold <stephan@gerhold.net>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Use the new common snd_soc_of_parse_aux_devs() helper function
to parse auxiliary devices from the device tree. The code is slightly
different but the binding that is parsed is exactly the same.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 sound/soc/generic/simple-card.c | 33 +--------------------------------
 1 file changed, 1 insertion(+), 32 deletions(-)

diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index 04d4d28ed511..75365c7bb393 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -424,37 +424,6 @@ static int simple_for_each_link(struct asoc_simple_priv *priv,
 	return ret;
 }
 
-static int simple_parse_aux_devs(struct device_node *node,
-				 struct asoc_simple_priv *priv)
-{
-	struct device *dev = simple_priv_to_dev(priv);
-	struct device_node *aux_node;
-	struct snd_soc_card *card = simple_priv_to_card(priv);
-	int i, n, len;
-
-	if (!of_find_property(node, PREFIX "aux-devs", &len))
-		return 0;		/* Ok to have no aux-devs */
-
-	n = len / sizeof(__be32);
-	if (n <= 0)
-		return -EINVAL;
-
-	card->aux_dev = devm_kcalloc(dev,
-			n, sizeof(*card->aux_dev), GFP_KERNEL);
-	if (!card->aux_dev)
-		return -ENOMEM;
-
-	for (i = 0; i < n; i++) {
-		aux_node = of_parse_phandle(node, PREFIX "aux-devs", i);
-		if (!aux_node)
-			return -EINVAL;
-		card->aux_dev[i].dlc.of_node = aux_node;
-	}
-
-	card->num_aux_devs = n;
-	return 0;
-}
-
 static int simple_parse_of(struct asoc_simple_priv *priv)
 {
 	struct device *dev = simple_priv_to_dev(priv);
@@ -504,7 +473,7 @@ static int simple_parse_of(struct asoc_simple_priv *priv)
 	if (ret < 0)
 		return ret;
 
-	ret = simple_parse_aux_devs(top, priv);
+	ret = snd_soc_of_parse_aux_devs(card, PREFIX "aux-devs");
 
 	return ret;
 }
-- 
2.27.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
