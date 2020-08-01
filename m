Return-Path: <SRS0=1PXW=BL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DC49C433E0
	for <linux-amlogic@archiver.kernel.org>; Sat,  1 Aug 2020 10:04:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10A6E2080C
	for <linux-amlogic@archiver.kernel.org>; Sat,  1 Aug 2020 10:04:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="grjsE3qA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gerhold.net header.i=@gerhold.net header.b="I9ga3cOb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 10A6E2080C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gerhold.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9wLFFsJprNv7AzaT0u10QUyQ3dVrGifzqX44GRkrWxA=; b=grjsE3qAdpB6RqOPzWx9YvBzo
	aTJQfS6RvGVyyUHsHyF74zodx1IgGkp9SdKrKah1i3OG3ri0rN5mGXP3dW3rF6jnLHVsks3TyU9Vy
	ELOXwRNEr8hj7k8ecpLw8sZKcvmfCYuZAcv113xvOprytWYPVXQJnhjXGzkh+7uxZWMDAmC3PDLKH
	Xa8mApYdGb5Z8wEK3l/tDMbL7AcMAiF+O95XfFpOOU5P+20XNPOxcNBkSpXm0hFNJVjPM4dZxszm0
	VVqJ3ZPVB8j2vyy0G5lVnpLBWyiVvB+y96MIh0xjyikidwMSTeae+IIwHryDQYoD8PU5ErYiOUOWm
	CW4mU58fg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k1oN9-0007R4-1q; Sat, 01 Aug 2020 10:04:11 +0000
Received: from mo4-p02-ob.smtp.rzone.de ([81.169.146.170])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k1oN6-0007PY-E1
 for linux-amlogic@lists.infradead.org; Sat, 01 Aug 2020 10:04:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1596276242;
 s=strato-dkim-0002; d=gerhold.net;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=XWvOu54S0LJGbQq3Q4KDpCFi37RtmgZWkg+uKQEibNA=;
 b=I9ga3cObCrdxq7hjjL519txVh4+hApe+1eOrE0mrT49n9Qn9nOHel4J13+V98QcOC8
 r3EXeGIthzof4lttXAWk8OxagZ/gnjWdhgRWlV7A1CdULJfmTHsh3slQzkJUUjfvyKfM
 DuUhUY9294fK/+kfOr0lhGyAZoJgWoSAIy3o7W4ImMExsIdbVTE1Lgs6ZdT0CwH+1nJh
 crhDcg0Miw4OyVTt7OsEYAiFe1FESSTNKjk9w30XKcEc8GyC6NLqPPDAjRXxzOosgiIT
 GqBz/RNdf3UsqtrJLhIQfI3rGmX9vX1g3v9veyvB5U1HuM3FAJ4uDJcihzQ9w1P7TUFP
 E1vQ==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB5m6NBgYo"
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
 by smtp.strato.de (RZmta 46.10.5 DYNA|AUTH)
 with ESMTPSA id Y0939ew71A41rZ8
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Sat, 1 Aug 2020 12:04:01 +0200 (CEST)
From: Stephan Gerhold <stephan@gerhold.net>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 3/3] ASoC: meson: Use snd_soc_of_parse_aux_devs()
Date: Sat,  1 Aug 2020 12:02:57 +0200
Message-Id: <20200801100257.22658-3-stephan@gerhold.net>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200801100257.22658-1-stephan@gerhold.net>
References: <20200801100257.22658-1-stephan@gerhold.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200801_060408_727797_8B4FCCAA 
X-CRM114-Status: GOOD (  14.48  )
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
to parse auxiliary devices from the device tree. The new helper
is just a copy of meson_card_add_aux_devices() so there is no
functional change.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 sound/soc/meson/meson-card-utils.c | 33 +-----------------------------
 1 file changed, 1 insertion(+), 32 deletions(-)

diff --git a/sound/soc/meson/meson-card-utils.c b/sound/soc/meson/meson-card-utils.c
index 6a64ac01b5ca..300ac8be46ef 100644
--- a/sound/soc/meson/meson-card-utils.c
+++ b/sound/soc/meson/meson-card-utils.c
@@ -254,37 +254,6 @@ static int meson_card_parse_of_optional(struct snd_soc_card *card,
 	return func(card, propname);
 }
 
-static int meson_card_add_aux_devices(struct snd_soc_card *card)
-{
-	struct device_node *node = card->dev->of_node;
-	struct snd_soc_aux_dev *aux;
-	int num, i;
-
-	num = of_count_phandle_with_args(node, "audio-aux-devs", NULL);
-	if (num == -ENOENT) {
-		return 0;
-	} else if (num < 0) {
-		dev_err(card->dev, "error getting auxiliary devices: %d\n",
-			num);
-		return num;
-	}
-
-	aux = devm_kcalloc(card->dev, num, sizeof(*aux), GFP_KERNEL);
-	if (!aux)
-		return -ENOMEM;
-	card->aux_dev = aux;
-	card->num_aux_devs = num;
-
-	for_each_card_pre_auxs(card, i, aux) {
-		aux->dlc.of_node =
-			of_parse_phandle(node, "audio-aux-devs", i);
-		if (!aux->dlc.of_node)
-			return -EINVAL;
-	}
-
-	return 0;
-}
-
 static void meson_card_clean_references(struct meson_card *priv)
 {
 	struct snd_soc_card *card = &priv->card;
@@ -357,7 +326,7 @@ int meson_card_probe(struct platform_device *pdev)
 	if (ret)
 		goto out_err;
 
-	ret = meson_card_add_aux_devices(&priv->card);
+	ret = snd_soc_of_parse_aux_devs(&priv->card, "audio-aux-devs");
 	if (ret)
 		goto out_err;
 
-- 
2.27.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
