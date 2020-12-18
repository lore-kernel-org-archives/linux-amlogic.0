Return-Path: <SRS0=hA9j=FW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B39B9C4361B
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Dec 2020 17:02:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B4FE23B4B
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Dec 2020 17:02:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B4FE23B4B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=metafoo.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/JvJ6gmqYBPzTVuij9/9FB7nrCOA+un9OwMBhcuSzwA=; b=upBYH0rncPPEXSPO0xLGUicF1m
	UNMYmfD6BzVsRe9Ku5IG1Gum89xg9AbS+xBMtO5INEnBTvjnc4qQCX8M1/yZnDDq+c5BXolg3QTiH
	+gd+Qz9CXnzPhxCFaakwWoty4whDpPEkPThC8EdyIJnYcjNSgZT4q8YX4Jhrd2Lmz2Ez7HTN40mHg
	6wc1jh2DhLPQdQtaNuEh7hOLUb5Io2/0tiTdvWElCqkflciY4dW6joVc9YUtqzhI+4vsFRLni5O6X
	frgRF9fVdzwSxzJ21x6L+q6lf5rnSIFf5sn/AVNfcir9s1pSgUV8IflHyaFOMrgpxVSaqS3fW/CE2
	2FA1YefA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kqJ7j-0001ZO-1R; Fri, 18 Dec 2020 17:01:08 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kqJ4U-00017S-W3
 for linux-amlogic@merlin.infradead.org; Fri, 18 Dec 2020 16:57:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=2yN8qgesIO1P4oCqpONyB4fEjXOvE+uhlwfozudTT6s=; b=JOZpm4fXwy/nwxiS2odf93UFj1
 AZmWo6i8JPpA7er5RUoZDZmxGFpflOYW108lA6QpEUN/+LG869T9v4edMCUw8NxD6RG2oiZNA2w1v
 OLNrVR9wFwwlzvsPMpIZACCGnneN+snWIIGTApQ0a7eLTX1I8POwt/+O1aZf480sXAGtM9mLKP8NU
 36qGvVg1UBorppycD74w8zdajlAJeKkrHCKY8q8BnyXJcnWfyn4j8d7QtLumPLSoh9i6RMXD73BGu
 YvHsH6DyqArIw/lkvtnn37i7qIBTtPYx3PlZawvIJvkC0wkfoEVBavf/jb5yZax+GoBxouMsDMrRo
 tLDh+r7Q==;
Received: from www381.your-server.de ([78.46.137.84])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kqHxA-0002D4-A4
 for linux-amlogic@lists.infradead.org; Fri, 18 Dec 2020 15:46:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de; 
 s=default2002;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References;
 bh=2yN8qgesIO1P4oCqpONyB4fEjXOvE+uhlwfozudTT6s=; b=D12txADGhrTu5MAuJ1ssuhlHJE
 XmEZsUk1KoOjukSQgjRfnjmqCNkxStFvndZyEGOg4Ge7ItHKx6SdZYlPocsQWmJG4/wU5DGkDyMzH
 nX1ZbXl0NfgMlvZBZCWjNtxazc3QLyrL+VLyiAlAImKME7Luuxq5XGUIURYBbbBJgPcFnpq+bDSsx
 YmsUsHtQB5omTB+3xsdyN2y4JPmcsjF/vg/D6Xx/k9Q7FvErrpV8JVvk7+bSvDphYp6LGOlNFuUwZ
 f585T3MQxV9LVu/iV7y7rsrrRymT3QLrnQrtxA1bWdxQv7FD2C1fTLrEtEIttTHHyq3weRzlHWpBH
 upbzM8XA==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
 by www381.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <lars@metafoo.de>)
 id 1kqHwz-000EfZ-IF; Fri, 18 Dec 2020 16:45:49 +0100
Received: from [62.216.202.54] (helo=lars-desktop.fritz.box)
 by sslproxy06.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <lars@metafoo.de>)
 id 1kqHwz-000APY-EG; Fri, 18 Dec 2020 16:45:49 +0100
From: Lars-Peter Clausen <lars@metafoo.de>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: meson: Use managed DMA buffer allocation
Date: Fri, 18 Dec 2020 16:45:44 +0100
Message-Id: <20201218154544.25513-1-lars@metafoo.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.102.4/26021/Fri Dec 18 13:56:31 2020)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201218_154600_544543_586EC7C9 
X-CRM114-Status: GOOD (  13.21  )
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
Cc: linux-amlogic@lists.infradead.org, alsa-devel@alsa-project.org,
 Lars-Peter Clausen <lars@metafoo.de>, Takashi Iwai <tiwai@suse.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Using a managed buffer will pre-allocate the buffer using
snd_pcm_lib_preallocate_pages() and automatically free it when the PCM is
destroyed.

In addition it will call snd_pcm_lib_malloc_pages() before the driver's
hw_params() callback and snd_pcm_lib_free_pages() after the driver's
hw_free() callback.

This slightly reduces the boilerplate code of the driver.

Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
---
 sound/soc/meson/aiu-fifo-i2s.c   |  1 -
 sound/soc/meson/aiu-fifo-spdif.c |  1 -
 sound/soc/meson/aiu-fifo.c       | 18 ++----------------
 3 files changed, 2 insertions(+), 18 deletions(-)

diff --git a/sound/soc/meson/aiu-fifo-i2s.c b/sound/soc/meson/aiu-fifo-i2s.c
index d91b0d874342..2388a2d0b3a6 100644
--- a/sound/soc/meson/aiu-fifo-i2s.c
+++ b/sound/soc/meson/aiu-fifo-i2s.c
@@ -124,7 +124,6 @@ const struct snd_soc_dai_ops aiu_fifo_i2s_dai_ops = {
 	.trigger	= aiu_fifo_i2s_trigger,
 	.prepare	= aiu_fifo_i2s_prepare,
 	.hw_params	= aiu_fifo_i2s_hw_params,
-	.hw_free	= aiu_fifo_hw_free,
 	.startup	= aiu_fifo_startup,
 	.shutdown	= aiu_fifo_shutdown,
 };
diff --git a/sound/soc/meson/aiu-fifo-spdif.c b/sound/soc/meson/aiu-fifo-spdif.c
index 44eb6faacf44..2fb30f89bf7a 100644
--- a/sound/soc/meson/aiu-fifo-spdif.c
+++ b/sound/soc/meson/aiu-fifo-spdif.c
@@ -158,7 +158,6 @@ const struct snd_soc_dai_ops aiu_fifo_spdif_dai_ops = {
 	.trigger	= fifo_spdif_trigger,
 	.prepare	= fifo_spdif_prepare,
 	.hw_params	= fifo_spdif_hw_params,
-	.hw_free	= aiu_fifo_hw_free,
 	.startup	= aiu_fifo_startup,
 	.shutdown	= aiu_fifo_shutdown,
 };
diff --git a/sound/soc/meson/aiu-fifo.c b/sound/soc/meson/aiu-fifo.c
index aa88aae8e517..4ad23267cace 100644
--- a/sound/soc/meson/aiu-fifo.c
+++ b/sound/soc/meson/aiu-fifo.c
@@ -99,11 +99,6 @@ int aiu_fifo_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_component *component = dai->component;
 	struct aiu_fifo *fifo = dai->playback_dma_data;
 	dma_addr_t end;
-	int ret;
-
-	ret = snd_pcm_lib_malloc_pages(substream, params_buffer_bytes(params));
-	if (ret < 0)
-		return ret;
 
 	/* Setup the fifo boundaries */
 	end = runtime->dma_addr + runtime->dma_bytes - fifo->fifo_block;
@@ -124,12 +119,6 @@ int aiu_fifo_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-int aiu_fifo_hw_free(struct snd_pcm_substream *substream,
-		     struct snd_soc_dai *dai)
-{
-	return snd_pcm_lib_free_pages(substream);
-}
-
 static irqreturn_t aiu_fifo_isr(int irq, void *dev_id)
 {
 	struct snd_pcm_substream *playback = dev_id;
@@ -187,15 +176,12 @@ void aiu_fifo_shutdown(struct snd_pcm_substream *substream,
 int aiu_fifo_pcm_new(struct snd_soc_pcm_runtime *rtd,
 		     struct snd_soc_dai *dai)
 {
-	struct snd_pcm_substream *substream =
-		rtd->pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream;
 	struct snd_card *card = rtd->card->snd_card;
 	struct aiu_fifo *fifo = dai->playback_dma_data;
 	size_t size = fifo->pcm->buffer_bytes_max;
 
-	snd_pcm_lib_preallocate_pages(substream,
-				      SNDRV_DMA_TYPE_DEV,
-				      card->dev, size, size);
+	snd_pcm_set_managed_buffer_all(rtd->pcm, SNDRV_DMA_TYPE_DEV,
+				       card->dev, size, size);
 
 	return 0;
 }
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
