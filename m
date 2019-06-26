Return-Path: <SRS0=vIah=UZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5866C48BD3
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Jun 2019 21:20:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75B7A214DA
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Jun 2019 21:20:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QjM9qZtj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 75B7A214DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NzHQW3QxM0VwpVNk0TtqueYGLr06Lw90p4JsWBfB6zY=; b=QjM9qZtjhUiSIyHqCv9uKVarw
	caD5mwDxRNqGtnf6C0aJf7oHXTLAmIvoroVLSCYXFxDxvcOYyDwzPBK+ewvp1yJstSgBzTnDvW0KD
	ob6yjJ94oYUvc1V2pNaHh9Ch449bMXC31XotawP7Tldw2EanSTvMx+jdJJj5ySe2LoFw1rU1jRhKR
	2IhvGuz0YhyJ7myQGWlz/svlvQWV6AtaKs7fGHDnL8yIccbB9casWJZw1ap9yDzYZ54cwxA+wYi5n
	xMZBJzWACM3ZczkYwWJupBBuodSMhqSs+Qt0hX33o5HHpe9bDOt2akVXYF+gjHFnhRU7S4KTMjdKs
	QbX9MLU6Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hgFLC-0001tX-El; Wed, 26 Jun 2019 21:20:30 +0000
Received: from mga06.intel.com ([134.134.136.31])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hgFL9-0001sq-QC
 for linux-amlogic@lists.infradead.org; Wed, 26 Jun 2019 21:20:29 +0000
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Jun 2019 14:20:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,421,1557212400"; d="scan'208";a="188793233"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga002.fm.intel.com with ESMTP; 26 Jun 2019 14:20:26 -0700
Received: from iriji-mobl1.ger.corp.intel.com (unknown [10.252.28.127])
 by linux.intel.com (Postfix) with ESMTP id A171658046A;
 Wed, 26 Jun 2019 14:20:23 -0700 (PDT)
Subject: Re: [alsa-devel] [PATCH 1/2] ASoC: soc-core: defer card registration
 if codec component is missing
To: Jerome Brunet <jbrunet@baylibre.com>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Kevin Hilman <khilman@baylibre.com>
References: <20190626133617.25959-1-jbrunet@baylibre.com>
 <20190626133617.25959-2-jbrunet@baylibre.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <8b4822f7-6671-1c23-572d-37f7e94ea8cc@linux.intel.com>
Date: Wed, 26 Jun 2019 23:20:22 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190626133617.25959-2-jbrunet@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190626_142027_912214_010AAB71 
X-CRM114-Status: GOOD (  18.05  )
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 6/26/19 3:36 PM, Jerome Brunet wrote:
> Like cpus and platforms, defer sound card initialization if the codec
> component is missing when initializing the dai_link
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>   sound/soc/soc-core.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
> index 358f1fbf9a30..002ddbf4e5a3 100644
> --- a/sound/soc/soc-core.c
> +++ b/sound/soc/soc-core.c
> @@ -1064,12 +1064,20 @@ static int soc_init_dai_link(struct snd_soc_card *card,
>   				link->name);
>   			return -EINVAL;
>   		}
> +
>   		/* Codec DAI name must be specified */
>   		if (!codec->dai_name) {
>   			dev_err(card->dev, "ASoC: codec_dai_name not set for %s\n",
>   				link->name);
>   			return -EINVAL;
>   		}
> +
> +		/*
> +		 * Defer card registartion if codec component is not added to

registration

> +		 * component list.
> +		 */
> +		if (!soc_find_component(codec))
> +			return -EPROBE_DEFER;
>   	}
>   
>   	/*
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
