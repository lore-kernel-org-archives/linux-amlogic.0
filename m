Return-Path: <SRS0=1PXW=BL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5AE9C433E3
	for <linux-amlogic@archiver.kernel.org>; Sat,  1 Aug 2020 10:04:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8286420836
	for <linux-amlogic@archiver.kernel.org>; Sat,  1 Aug 2020 10:04:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q/r3/Ub+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gerhold.net header.i=@gerhold.net header.b="aiJgPnAW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8286420836
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gerhold.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JON0XbeaglSwAP5F1ztZQi0tahj46lCVbrK/QUWPaos=; b=Q/r3/Ub+dZ4augAMHNVidICge3
	Tbt8EsQEPcL2Nc5+O6fmSzKHeDKtIZT5zkTDC8T9c4ppZfkI+7OwwCXDFstyrFUJWqVzEP3ZL2CPO
	xVmQ1WYObZg0Ohw+SUg5UHftpCZVf+uAmDrnB4C9wFFb/uI1a+0zMR5fBeDyHZ0pRG+MiBBqnJkTc
	zXNJnBMkS5M+4KUUukNhWZLWvQc0186bds2O6pRD8YTiKu9iKQ07YgDqyaOLeYVqeeD0eP0oER5VZ
	2+gOQwqVoBx7nzZDmItsc7ELVBjQkrBxIuiZH7FhbBYJH5fQQqeAkUiP3zUk17vXxBDYCPocItov0
	l2ni+FkA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k1oNA-0007RR-Rx; Sat, 01 Aug 2020 10:04:12 +0000
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.167])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k1oN6-0007PZ-6P
 for linux-amlogic@lists.infradead.org; Sat, 01 Aug 2020 10:04:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1596276242;
 s=strato-dkim-0002; d=gerhold.net;
 h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
 Subject:Sender;
 bh=Pmv7+iLSVshdoV6ocv6fKYKPavqAIV2Sg/urAg838/A=;
 b=aiJgPnAWu9c8bBMOLToQ75oROhhqh4jRsx2EBRuUOb17SPNiU5EUdD3MEbIKS0WUeC
 wTd2UYnQ3IwrvUjevjjoaAbiYeyqEd2E3cv3UtuODBwn4K6J0IpbtVLN77OGuH0bIkGQ
 N9OQuumpbrhkeYmjCqbelhD2rNEXN+79dxWrU8Pl9ExSEt5nS3Dd0djfsYHNkcrCEq+c
 pvz/fpVRaphj6Fp3qx+XtPIqrM4EKVIioBFRp/SXOgBIE+dP6w/afvyp8FaaHAPyf0Lq
 Kxl8BevBF1Hi2fSXvbV7gbjbaqf5EZ9gSbXz9kKN7Kgjxc8HE8FTmWY9SMOuSodp3Sbh
 NJcg==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB5m6NBgYo"
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
 by smtp.strato.de (RZmta 46.10.5 DYNA|AUTH)
 with ESMTPSA id Y0939ew71A40rZ6
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Sat, 1 Aug 2020 12:04:00 +0200 (CEST)
From: Stephan Gerhold <stephan@gerhold.net>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 1/3] ASoC: core: Add common helper to parse aux devs from
 device tree
Date: Sat,  1 Aug 2020 12:02:55 +0200
Message-Id: <20200801100257.22658-1-stephan@gerhold.net>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200801_060408_731906_0E6D003E 
X-CRM114-Status: GOOD (  16.80  )
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

simple-card.c and meson-card-utils.c use pretty much the same
helper function to parse auxiliary devices from the device tree.

Make it easier for other drivers to parse these from the device tree
as well by adding a shared helper function to soc-core.c.

snd_soc_of_parse_aux_devs() is pretty much a copy of
meson_card_add_aux_devices() from meson-card-utils.c
with two minor changes:

  - Make property name configurable as parameter
  - Change dev_err() message slightly for consistency with other
    error messages in soc-core.c

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
I have another patch set that I will submit separately which makes
use of this function to parse aux devs from the device tree within
qcom_snd_parse_of(). This is preparation for that patch set.
---
 include/sound/soc.h  |  1 +
 sound/soc/soc-core.c | 31 +++++++++++++++++++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 5e3919ffb00c..a0918d159fd3 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1331,6 +1331,7 @@ void snd_soc_of_parse_audio_prefix(struct snd_soc_card *card,
 
 int snd_soc_of_parse_audio_routing(struct snd_soc_card *card,
 				   const char *propname);
+int snd_soc_of_parse_aux_devs(struct snd_soc_card *card, const char *propname);
 unsigned int snd_soc_of_parse_daifmt(struct device_node *np,
 				     const char *prefix,
 				     struct device_node **bitclkmaster,
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 2fe1b2ec7c8f..bf46f410c8c6 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2827,6 +2827,37 @@ int snd_soc_of_parse_audio_routing(struct snd_soc_card *card,
 }
 EXPORT_SYMBOL_GPL(snd_soc_of_parse_audio_routing);
 
+int snd_soc_of_parse_aux_devs(struct snd_soc_card *card, const char *propname)
+{
+	struct device_node *node = card->dev->of_node;
+	struct snd_soc_aux_dev *aux;
+	int num, i;
+
+	num = of_count_phandle_with_args(node, propname, NULL);
+	if (num == -ENOENT) {
+		return 0;
+	} else if (num < 0) {
+		dev_err(card->dev, "ASOC: Property '%s' could not be read: %d\n",
+			propname, num);
+		return num;
+	}
+
+	aux = devm_kcalloc(card->dev, num, sizeof(*aux), GFP_KERNEL);
+	if (!aux)
+		return -ENOMEM;
+	card->aux_dev = aux;
+	card->num_aux_devs = num;
+
+	for_each_card_pre_auxs(card, i, aux) {
+		aux->dlc.of_node = of_parse_phandle(node, propname, i);
+		if (!aux->dlc.of_node)
+			return -EINVAL;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(snd_soc_of_parse_aux_devs);
+
 unsigned int snd_soc_of_parse_daifmt(struct device_node *np,
 				     const char *prefix,
 				     struct device_node **bitclkmaster,
-- 
2.27.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
