Return-Path: <SRS0=rBUq=TP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D786C04E84
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 May 2019 13:19:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC3A820881
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 May 2019 13:19:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IkWroau7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="gNNGu9FD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="X1lAu5ZH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC3A820881
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bv+Ot+bMmR5eRUFo5aPqM7vo6MDcEKRTx9Y5Hd8N+uY=; b=IkWroau7mpwUZ2
	6XiyzgxvhBOWU9QO2E/nffeYoJ3n+T2kuakU90THAi4EVjwQNOkFxA1DJV73momA2kNPKdPVhYGMw
	Ee5OfW45dFxNc9UqIgCoUYbNxbFmxc74vTeFgq0Y7soo/c/ZSPBC2p8qkl9IGEXj+DDIYnwXJnQ3j
	nFruOAtKosMkYqp38OAEc4Jkot5mfaf0fZYV+Q+In1H7eytbLW3UEUzQhOJIa2wpuP0y5ylAl28Yi
	+9HDy3g6+piu0LZiIEuPYa6ra/pMcaj14eJt5OzLsmDGllLzy60Q5HIA1ZiwDD3cfGFmqdBtTXDbe
	zToTnEwMGVMt9xf8iyUQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQtoS-0004GQ-Mx; Wed, 15 May 2019 13:19:16 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQtoN-0004Ch-T7
 for linux-amlogic@bombadil.infradead.org; Wed, 15 May 2019 13:19:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2h106Z4/ATcPU1QRPJE9+ZrjCSAT+SxJpUGNW5+ypdI=; b=gNNGu9FDYfFQzKbprM7lQMoW7e
 8L9psqIt9KyGBg28HQGUqtUvZF3UtJjACvinQgu0XnBJno26TwBRQCezubolOQmNfuSVnX5SO4QGg
 VetLwj2eDNVCdCcKKip2C8dUFsfaDHZtBUfLD5CZw+rfD0/RlVGwH2S14fShMUNPZfIkgtFPjMfsO
 AN18qP95uMQqpCrWjJe+N4D99ogb7T6i347xq1bq7LLMPTVSF6iza927DOZjIopri0eeXJwznbdGu
 yC5y/yIKh3GplTHYCXtFBckt8S/30iQCzXDuRBpPqcfsE38dx3Gd1tsfaDKF/qAjrVCerT3+YMKS+
 MB99vyWA==;
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQtoK-0000SJ-OL
 for linux-amlogic@lists.infradead.org; Wed, 15 May 2019 13:19:09 +0000
Received: by mail-wr1-x442.google.com with SMTP id r7so2621989wrr.13
 for <linux-amlogic@lists.infradead.org>; Wed, 15 May 2019 06:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2h106Z4/ATcPU1QRPJE9+ZrjCSAT+SxJpUGNW5+ypdI=;
 b=X1lAu5ZHCCzjYghnscD0OX/jA0eMlPFEIG8XZk5dovfhL4UaTlEOtCBhFZFxVzm/Tx
 pAuVx3DJBiDzhUUHz/kN5GlFuAml795hgYaBtvabvfgbbSrUquNiIytC02wU6fj3fGpV
 INbx6MKpj3ZgfAYTSaDK2uVDCHND1QaFcBdR+pzG5vz7wuf9++VSiy/sSnyHl2lnRX4K
 iD8w9VgD4eEWjD7rTwGUzq2ueadZtVALe0cg3iNfzNm+P/LBrM1AkLpMcCw3Fcdvgogo
 fQ92LKWlhxnHDQLEc8iLHSjHlbisyKDTjc72ScH+sPXvyRVEgeAlm70JJ+g8h/ZGY0eW
 KeKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2h106Z4/ATcPU1QRPJE9+ZrjCSAT+SxJpUGNW5+ypdI=;
 b=qyk1N2jaoLB0+bIL8SY4U5rHrG+1FjjhyYm66q/uV+M3eX5zlY0ePNPHYCwFIhN50n
 a+3ohOCDwZkU5Rnu/FXPNnsYTbr43fSYKHu6QBwmTzhg3zXdvH46sEZ0T82NhW/ZbOH4
 OvjZY84Kct3nhcTdOH1BNw1D6OYkkxENw5tWKny8CdtSk3LfQmOcaEjMOeIWYmzvafTm
 HyqZyLx5mLRtiuY8b/dd9y3eyzWFzSe+o0OOdSDfZBZmcTcJlEphThw3piTKt98DCrth
 KGrrTvHlSiNwXoYa+Eg2zNwc10YDAifNjEV6mlEDIg6v5Vr2C1F3KrkByAFafMOhWpcD
 wAdQ==
X-Gm-Message-State: APjAAAVsVDM5axnfP2L9zxhwWaUo84+Ta0qYYj5CWz9vd/xLsIK/9qti
 vAsl7ueGldnXCmJEJbnMfXO+8g==
X-Google-Smtp-Source: APXvYqz/lQB5wpF2+qRrJ4I1Hpnj5Nzq4JBpunwqfTjfsaJ/6TVlW1DUT56LRi4iginnZTHgAhAYZg==
X-Received: by 2002:adf:f5d1:: with SMTP id k17mr25107467wrp.281.1557926344035; 
 Wed, 15 May 2019 06:19:04 -0700 (PDT)
Received: from boomer.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id b206sm2789848wmd.28.2019.05.15.06.19.02
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 15 May 2019 06:19:03 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 1/5] ASoC: meson: axg-card: set link name based on link node
 name
Date: Wed, 15 May 2019 15:18:54 +0200
Message-Id: <20190515131858.32130-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190515131858.32130-1-jbrunet@baylibre.com>
References: <20190515131858.32130-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190515_091908_794534_64400273 
X-CRM114-Status: GOOD (  12.28  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

So far the link names of the axg sound card was derived from the cpu name
of the link. Since the dai link must be unique, it works as long as a
device does not provide more than one cpu dai. However, the 'tohdmitx'
does provide 2 dais used as cpu on codec-to-codec links

Instead of cpu name, use the node name of the dai link. DT already enforce
the uniqueness of this name

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/axg-card.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/sound/soc/meson/axg-card.c b/sound/soc/meson/axg-card.c
index aa54d2c612c9..5c8deee8d512 100644
--- a/sound/soc/meson/axg-card.c
+++ b/sound/soc/meson/axg-card.c
@@ -80,10 +80,11 @@ static int axg_card_parse_dai(struct snd_soc_card *card,
 
 static int axg_card_set_link_name(struct snd_soc_card *card,
 				  struct snd_soc_dai_link *link,
+				  struct device_node *node,
 				  const char *prefix)
 {
 	char *name = devm_kasprintf(card->dev, GFP_KERNEL, "%s.%s",
-				    prefix, link->cpu_of_node->full_name);
+				    prefix, node->full_name);
 	if (!name)
 		return -ENOMEM;
 
@@ -474,7 +475,7 @@ static int axg_card_set_be_link(struct snd_soc_card *card,
 		codec++;
 	}
 
-	ret = axg_card_set_link_name(card, link, "be");
+	ret = axg_card_set_link_name(card, link, node, "be");
 	if (ret)
 		dev_err(card->dev, "error setting %pOFn link name\n", np);
 
@@ -483,6 +484,7 @@ static int axg_card_set_be_link(struct snd_soc_card *card,
 
 static int axg_card_set_fe_link(struct snd_soc_card *card,
 				struct snd_soc_dai_link *link,
+				struct device_node *node,
 				bool is_playback)
 {
 	link->dynamic = 1;
@@ -497,7 +499,7 @@ static int axg_card_set_fe_link(struct snd_soc_card *card,
 	else
 		link->dpcm_capture = 1;
 
-	return axg_card_set_link_name(card, link, "fe");
+	return axg_card_set_link_name(card, link, node, "fe");
 }
 
 static int axg_card_cpu_is_capture_fe(struct device_node *np)
@@ -527,9 +529,9 @@ static int axg_card_add_link(struct snd_soc_card *card, struct device_node *np,
 		return ret;
 
 	if (axg_card_cpu_is_playback_fe(dai_link->cpu_of_node))
-		ret = axg_card_set_fe_link(card, dai_link, true);
+		ret = axg_card_set_fe_link(card, dai_link, np, true);
 	else if (axg_card_cpu_is_capture_fe(dai_link->cpu_of_node))
-		ret = axg_card_set_fe_link(card, dai_link, false);
+		ret = axg_card_set_fe_link(card, dai_link, np, false);
 	else
 		ret = axg_card_set_be_link(card, dai_link, np);
 
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
