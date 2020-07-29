Return-Path: <SRS0=TJbE=BI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35EB0C433DF
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Jul 2020 15:56:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02D83208A9
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Jul 2020 15:56:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CYnz5MG+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 02D83208A9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QFty1KFbbk3w/hTjwHXpL4cLCBjXLPeCHOFhhEecPaY=; b=CYnz5MG+pd+WVoTbLib5A7nXi
	JyvTshsZTLjsawtU4wWCMq5HeNNWAhJG9MlrEs6wfIAgdNKQgoYVeiKt+UTEyh6IUMxtndphgfNNa
	AOOVy41jFicAjuJSbk93PcIMOlcSzVHAFj+SMOFvxLSN5IWAn8atAJcJKP9NJHenr8sgJY953jkxB
	h/w4R+cXkSSssp1eHRUio8ZG27Gi6qCnSGuAQ3qzCE06+fA0x7ywv93dROue3Uv8PmKmNTHZDYp1i
	zlrluUGZ7jJMfSfb42Al6KRuLIzg00/QNoOJm/TBDRJk4wOngHZ9GYmIKN4nlAzKs+QVamg5zuxSr
	JXQFnNrlA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0oRF-0006Ku-8n; Wed, 29 Jul 2020 15:56:17 +0000
Received: from mga04.intel.com ([192.55.52.120])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0oRB-0006JY-Pm
 for linux-amlogic@lists.infradead.org; Wed, 29 Jul 2020 15:56:15 +0000
IronPort-SDR: cLynv82HxE6l/0Ig1vMNk+EM7nmC5ZHX6xBm6EsFRxD3d6NU2tsElP7L/6e5ydHrrELzXYimQz
 OHyhfUqZZB+w==
X-IronPort-AV: E=McAfee;i="6000,8403,9697"; a="148903176"
X-IronPort-AV: E=Sophos;i="5.75,410,1589266800"; d="scan'208";a="148903176"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2020 08:56:10 -0700
IronPort-SDR: IDiwGItDXIzja3qJHXtAQwZsgkfdvjN51ZFJYyn4gETjqIXmWP3NNyN85itVh4GNZZCNBIn5O4
 HqvTijKzaFgQ==
X-IronPort-AV: E=Sophos;i="5.75,410,1589266800"; d="scan'208";a="322594221"
Received: from vmlivin-mobl1.amr.corp.intel.com (HELO [10.209.108.29])
 ([10.209.108.29])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2020 08:56:08 -0700
Subject: Re: [PATCH] ASoC: core: restore dpcm flags semantics
To: Jerome Brunet <jbrunet@baylibre.com>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
References: <20200723180533.220312-1-pierre-louis.bossart@linux.intel.com>
 <20200729154639.1983854-1-jbrunet@baylibre.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <2ad13f95-434d-376a-bc38-b209623b461e@linux.intel.com>
Date: Wed, 29 Jul 2020 10:56:05 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200729154639.1983854-1-jbrunet@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200729_115614_430743_43064261 
X-CRM114-Status: GOOD (  28.45  )
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
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 zhangn1985@outlook.com, linux-amlogic@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org



On 7/29/20 10:46 AM, Jerome Brunet wrote:
> commit b73287f0b0745 ('ASoC: soc-pcm: dpcm: fix playback/capture checks')
> changed dpcm_playback and dpcm_capture semantic by throwing an error if
> these flags are not aligned with DAIs capabilities on the link.
> 
> The former semantic did not force the flags and DAI caps to be aligned.
> The flag previously allowed card drivers to disable a stream direction on
> a link (whether or not such feature is deemed useful).
> 
> With change ('ASoC: core: use less strict tests for dailink capabilities')
> an error is thrown if the flags and and the DAI caps are not aligned. Those
> parameters were not meant to aligned initially. No technical reason was
> given about why cards should now be considered "broken" in such condition
> is not met, or why it should be considered to be an improvement to enforce
> that.
> 
> Forcing the flags to be aligned with DAI caps just make the information
> the flag carry redundant with DAI caps, breaking a few cards along the way.
> 
> This change drops the added error conditions and restore the initial flag
> semantics.

or rather lack thereof.

I am ok to move dev_err to dev_warn and remove the return -EINVAL, but I 
maintain that we have to reach a point where configurations make sense 
before we can clean them up. If we implicitly push issues under the rug 
by not even being aware of them we'll never make progress.

> 
> Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
> 
>   Hi Mark,
> 
>   Because b73287f0b0745 ('ASoC: soc-pcm: dpcm: fix playback/capture checks')
>   introduced more than one problem, the change
>   "ASoC: core: use less strict tests for dailink capabilities" [0] is still
>   necessary but the change of semantic remains a problem with it.
> 
>   This patch applies on top of it.
> 
>   sound/soc/soc-pcm.c | 14 --------------
>   1 file changed, 14 deletions(-)
> 
> diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
> index 00ac1cbf6f88..2e205b738eae 100644
> --- a/sound/soc/soc-pcm.c
> +++ b/sound/soc/soc-pcm.c
> @@ -2749,13 +2749,6 @@ int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, int num)
>   					break;
>   				}
>   			}
> -
> -			if (!playback) {
> -				dev_err(rtd->card->dev,
> -					"No CPU DAIs support playback for stream %s\n",
> -					rtd->dai_link->stream_name);
> -				return -EINVAL;
> -			}
>   		}
>   		if (rtd->dai_link->dpcm_capture) {
>   			stream = SNDRV_PCM_STREAM_CAPTURE;
> @@ -2766,13 +2759,6 @@ int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, int num)
>   					break;
>   				}
>   			}
> -
> -			if (!capture) {
> -				dev_err(rtd->card->dev,
> -					"No CPU DAIs support capture for stream %s\n",
> -					rtd->dai_link->stream_name);
> -				return -EINVAL;
> -			}
>   		}
>   	} else {
>   		/* Adapt stream for codec2codec links */
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
