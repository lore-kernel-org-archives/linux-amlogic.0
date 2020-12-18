Return-Path: <SRS0=hA9j=FW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E831C4361B
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Dec 2020 18:04:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1829D23B70
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Dec 2020 18:04:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1829D23B70
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=metafoo.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=W0tx1690Xcjqn9PU1Oq3LXouxUFYOpj9k4mr35O80YY=; b=jB7O85TBU2y02Bcf5Z7tB9Q2n
	8+tWccrGglJounnDpHwNRaVaYw2IBU2xNXiA6BT5uCgKGu2JzXfOlZGSGuEU8htYLXoqxhFDq4pSH
	XIPo47TuvEjWoWtunf77A31UEoZWEpPxR/F7hE+aharZXthpRdVbAjjgtOZVG0yS70A55Zajz6Ol+
	0N7vlD5d+7C1K28HFF8Rvl3ftaPFBJMOcDszebEMVHM5fmvu29EGr34e+giAJFVRmZbPXBs6jvluM
	eDNdGCPgwlf1ojcJwLsER1Hs/N8LISxcIGf5m7H0k+3n77iBpx17l3SoEZalFPeUYPsma0i/2yL7Z
	c5nurJhCw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kqK6n-0002Ae-Cp; Fri, 18 Dec 2020 18:04:05 +0000
Received: from www381.your-server.de ([78.46.137.84])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kqJks-0006tb-Ak
 for linux-amlogic@lists.infradead.org; Fri, 18 Dec 2020 17:41:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de; 
 s=default2002;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=HQh5MnvfaxoI+4jOAMOYaLiSa5/xT3fEKdJw3/ZzAh4=; b=LE2xZ95ygbrup8083xGM1wX1tI
 cUdP8nqPj4pixB9BD1x/RbcfM0ELKfTZ6bj+8cpKJzjexHXMkiTObmDSMSUOxnJqlXi1G0ZezmP/w
 8pmrZ8dqQYX5U8RpViekjAuWJnHowWLPveKMl91JsUSWwfQYolXM0BAULaCYp4xyr67G45JK3iAPj
 dusP1E1aC6w4lruAOKQYtAhtoNsXCxzp8X0NarG/HeZNbYXUCTO+gZu+IyQ6QJdgLDttJ8KShOAD2
 lUUWZ0b3XaO0zUZ5tdjm60topk39mTpqrgwIdCx8aJ1+XYz9Q0lAak88lvv4aflxrLgdIqAN7x5zC
 AShEh9LA==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
 by www381.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <lars@metafoo.de>)
 id 1kqJke-000FTb-OD; Fri, 18 Dec 2020 18:41:12 +0100
Received: from [62.216.202.54] (helo=[192.168.178.20])
 by sslproxy06.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <lars@metafoo.de>)
 id 1kqJke-000Txq-KD; Fri, 18 Dec 2020 18:41:12 +0100
Subject: Re: [PATCH] ASoC: meson: Use managed DMA buffer allocation
To: Jerome Brunet <jbrunet@baylibre.com>, Mark Brown <broonie@kernel.org>
References: <20201218154544.25513-1-lars@metafoo.de>
 <1jeejnnko5.fsf@starbuckisacylon.baylibre.com>
From: Lars-Peter Clausen <lars@metafoo.de>
Message-ID: <fa1f3bcc-885a-9258-6653-3d5a5dc4708e@metafoo.de>
Date: Fri, 18 Dec 2020 18:41:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <1jeejnnko5.fsf@starbuckisacylon.baylibre.com>
Content-Language: en-US
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.102.4/26021/Fri Dec 18 13:56:31 2020)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201218_124135_753524_8C36326F 
X-CRM114-Status: GOOD (  17.69  )
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
 Takashi Iwai <tiwai@suse.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 12/18/20 5:28 PM, Jerome Brunet wrote:
> On Fri 18 Dec 2020 at 16:45, Lars-Peter Clausen <lars@metafoo.de> wrote:
>
>> Using a managed buffer will pre-allocate the buffer using
>> snd_pcm_lib_preallocate_pages() and automatically free it when the PCM is
>> destroyed.
>>
>> In addition it will call snd_pcm_lib_malloc_pages() before the driver's
>> hw_params() callback and snd_pcm_lib_free_pages() after the driver's
>> hw_free() callback.
>>
>> This slightly reduces the boilerplate code of the driver.
>>
>> Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
>> ---
>>   sound/soc/meson/aiu-fifo-i2s.c   |  1 -
>>   sound/soc/meson/aiu-fifo-spdif.c |  1 -
>>   sound/soc/meson/aiu-fifo.c       | 18 ++----------------
>>   3 files changed, 2 insertions(+), 18 deletions(-)
>>
>> diff --git a/sound/soc/meson/aiu-fifo-i2s.c b/sound/soc/meson/aiu-fifo-i2s.c
>> index d91b0d874342..2388a2d0b3a6 100644
>> --- a/sound/soc/meson/aiu-fifo-i2s.c
>> +++ b/sound/soc/meson/aiu-fifo-i2s.c
>> @@ -124,7 +124,6 @@ const struct snd_soc_dai_ops aiu_fifo_i2s_dai_ops = {
>>   	.trigger	= aiu_fifo_i2s_trigger,
>>   	.prepare	= aiu_fifo_i2s_prepare,
>>   	.hw_params	= aiu_fifo_i2s_hw_params,
>> -	.hw_free	= aiu_fifo_hw_free,
>>   	.startup	= aiu_fifo_startup,
>>   	.shutdown	= aiu_fifo_shutdown,
>>   };
>> diff --git a/sound/soc/meson/aiu-fifo-spdif.c b/sound/soc/meson/aiu-fifo-spdif.c
>> index 44eb6faacf44..2fb30f89bf7a 100644
>> --- a/sound/soc/meson/aiu-fifo-spdif.c
>> +++ b/sound/soc/meson/aiu-fifo-spdif.c
>> @@ -158,7 +158,6 @@ const struct snd_soc_dai_ops aiu_fifo_spdif_dai_ops = {
>>   	.trigger	= fifo_spdif_trigger,
>>   	.prepare	= fifo_spdif_prepare,
>>   	.hw_params	= fifo_spdif_hw_params,
>> -	.hw_free	= aiu_fifo_hw_free,
>>   	.startup	= aiu_fifo_startup,
>>   	.shutdown	= aiu_fifo_shutdown,
>>   };
>> diff --git a/sound/soc/meson/aiu-fifo.c b/sound/soc/meson/aiu-fifo.c
>> index aa88aae8e517..4ad23267cace 100644
>> --- a/sound/soc/meson/aiu-fifo.c
>> +++ b/sound/soc/meson/aiu-fifo.c
>> @@ -99,11 +99,6 @@ int aiu_fifo_hw_params(struct snd_pcm_substream *substream,
>>   	struct snd_soc_component *component = dai->component;
>>   	struct aiu_fifo *fifo = dai->playback_dma_data;
>>   	dma_addr_t end;
>> -	int ret;
>> -
>> -	ret = snd_pcm_lib_malloc_pages(substream, params_buffer_bytes(params));
>> -	if (ret < 0)
>> -		return ret;
>>   
>>   	/* Setup the fifo boundaries */
>>   	end = runtime->dma_addr + runtime->dma_bytes - fifo->fifo_block;
>> @@ -124,12 +119,6 @@ int aiu_fifo_hw_params(struct snd_pcm_substream *substream,
>>   	return 0;
>>   }
>>   
>> -int aiu_fifo_hw_free(struct snd_pcm_substream *substream,
>> -		     struct snd_soc_dai *dai)
>> -{
>> -	return snd_pcm_lib_free_pages(substream);
>> -}
>> -
>>   static irqreturn_t aiu_fifo_isr(int irq, void *dev_id)
>>   {
>>   	struct snd_pcm_substream *playback = dev_id;
>> @@ -187,15 +176,12 @@ void aiu_fifo_shutdown(struct snd_pcm_substream *substream,
>>   int aiu_fifo_pcm_new(struct snd_soc_pcm_runtime *rtd,
>>   		     struct snd_soc_dai *dai)
>>   {
>> -	struct snd_pcm_substream *substream =
>> -		rtd->pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream;
>>   	struct snd_card *card = rtd->card->snd_card;
>>   	struct aiu_fifo *fifo = dai->playback_dma_data;
>>   	size_t size = fifo->pcm->buffer_bytes_max;
>>   
>> -	snd_pcm_lib_preallocate_pages(substream,
>> -				      SNDRV_DMA_TYPE_DEV,
>> -				      card->dev, size, size);
>> +	snd_pcm_set_managed_buffer_all(rtd->pcm, SNDRV_DMA_TYPE_DEV,
>> +				       card->dev, size, size);
> Hi Lars-Peter,
>
> These FIFOs only do playback so to avoid wasting memory
> s/snd_pcm_set_managed_buffer_all/snd_pcm_set_managed_buffer ?

snd_pcm_set_managed_buffer_all() will skip substreams that do not exist. E.g. if the there is not capture support it wont allocate memory for it.

To keep things simple I prefer snd_pcm_set_managed_buffer_all(). snd_pcm_set_managed_buffer() only makes sense if you have a different DMA device for capture and playback or you want different buffer sizes.


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
