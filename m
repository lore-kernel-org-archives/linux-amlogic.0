Return-Path: <SRS0=/1bK=BN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 389E6C433E0
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Aug 2020 09:39:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 042A82075A
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Aug 2020 09:39:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="so9SDBHE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="gYG3VprT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 042A82075A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:In-reply-to:Subject:To:
	From:References:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=R4jS6IQlqUk2L3F/sXvnvC5JCR5MkUGlT8nPUMtT5jw=; b=so9SDBHEdna1GuuMq1cMTu9Hz
	NzHY2O8nJCTW1RkdUsnTxdpXHZGKaCDUGoRi0NCQ5KIfceHE5Z0zBqKWjdawqy9NIfGv/smdU9MQ4
	a7VBICH4JN/SieTmUFjlKNLre3Oi+i8MqmFk7AP1a9EF9JiYAuJnvEd08VKvSQDbMwEnrTHOMN6lH
	3EZoaKL77CKRYL3n9N9ER1utaJuKA74HFDX+VlY3TNAw8esPJG3j1XwtWNCgDK8SorvNRpbGHFDJN
	F7V0bLgeOh0Lvdc2KqSwnTXVgycOUZbZRZEVOJBJPeuCZaIiGr604xTxzRtqY3lLPHZLoMxlbfgks
	wfU6BUgtQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2Wwh-0007se-UL; Mon, 03 Aug 2020 09:39:51 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2Wwe-0007rc-Ri
 for linux-amlogic@lists.infradead.org; Mon, 03 Aug 2020 09:39:50 +0000
Received: by mail-wm1-x342.google.com with SMTP id k8so14821208wma.2
 for <linux-amlogic@lists.infradead.org>; Mon, 03 Aug 2020 02:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=6QUUCiSRWx0cpMWOE+7etzD4gWREdtJncDtY+oNf8Es=;
 b=gYG3VprTs39JpS6F3wLhind763Vo+uclDbPkuI+6Pkn/YS29u+xaRKlRafTLv63V/z
 aZkt5f7bm2mKcjdiCWHT9qNOvY3TbEla3amVSPXxkmuEfR9LWdbYYlJTzuz+D9CUd1dy
 mca8nkKUjunMQ3rG2n2wpEgUvzRYZj40yS/eaatotlKiJXu4H/hHK10/rMpRi5+2em2m
 k4QherY/oEIrWzKQGkQDiGOjVh5lrzK0BXSh/YzoacVwkNI99bz1yXMFjKZgpDvIj+GS
 XuA3eI1AfF/YBVbEGnTTB6PqlsvMi/gE+Qx9K65T4xZreeS/8Q/eoHUfI1cDJn4WQphG
 cibQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=6QUUCiSRWx0cpMWOE+7etzD4gWREdtJncDtY+oNf8Es=;
 b=T/6r9CUrNW1LskvNMmei2BhXanw0g+xCxVe/yGB9H6Pi2tJHFBGcCisja8AOh9t5VQ
 ucchvGhQd9UgqX5SwY4SWAMkdjaNrW61dnv/Wk4d0uXoF600U6+hW61o2f2G8+PUIsrd
 jrvLiBax+LWqFabzsA90m6sl4qNGRZqmhSb1PFg70DFgdEB+bx3wR6lYKBWQeWo8kW+B
 XBGx9Nr2VKiZrGVDiQchId6qVMmZz2bJuDgOoZkDkVcY/EzzlH30Gc4NxDqnRC1Z9Nbq
 vTc57vbljjDuIOXBgW7NwClUYXfNF+zzX99kWrtBxhGxmfxTPNS6jDxxJX+uzPLHV+Ai
 zAGw==
X-Gm-Message-State: AOAM533m0O48gmYs1nRNhh2f0arbL+hhxfzaCVJAiD1Tvfa+4lxTJ9op
 38AGj0eptX7XK4MSybjBx+BuBQ==
X-Google-Smtp-Source: ABdhPJxS2SJ6y3vngrEeM+aLBXtDZLuCLohsm6eDSyYvd+X0PiQtu6SlZw7r9qMWVXMHVjHrMzOoOg==
X-Received: by 2002:a1c:770c:: with SMTP id t12mr16145691wmi.65.1596447585766; 
 Mon, 03 Aug 2020 02:39:45 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id 124sm5166278wmd.31.2020.08.03.02.39.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Aug 2020 02:39:44 -0700 (PDT)
References: <20200801100257.22658-1-stephan@gerhold.net>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephan Gerhold <stephan@gerhold.net>, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/3] ASoC: core: Add common helper to parse aux devs from
 device tree
In-reply-to: <20200801100257.22658-1-stephan@gerhold.net>
Date: Mon, 03 Aug 2020 11:39:44 +0200
Message-ID: <1j5za02hlr.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_053949_073915_CB2E543E 
X-CRM114-Status: GOOD (  24.56  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Sat 01 Aug 2020 at 12:02, Stephan Gerhold <stephan@gerhold.net> wrote:

> simple-card.c and meson-card-utils.c use pretty much the same
> helper function to parse auxiliary devices from the device tree.
>
> Make it easier for other drivers to parse these from the device tree
> as well by adding a shared helper function to soc-core.c.
>
> snd_soc_of_parse_aux_devs() is pretty much a copy of
> meson_card_add_aux_devices() from meson-card-utils.c
> with two minor changes:
>
>   - Make property name configurable as parameter
>   - Change dev_err() message slightly for consistency with other
>     error messages in soc-core.c
>
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>

When you send multiple patches like that, you should a cover-letter
describing the overall purpose of the patchset, then the patches

If you look around on the mailing list this cover is usually starting
with the subject "[PATCH 0/X]"

Apart from this, the change looks good to me

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

> ---
> I have another patch set that I will submit separately which makes
> use of this function to parse aux devs from the device tree within
> qcom_snd_parse_of(). This is preparation for that patch set.
> ---
>  include/sound/soc.h  |  1 +
>  sound/soc/soc-core.c | 31 +++++++++++++++++++++++++++++++
>  2 files changed, 32 insertions(+)
>
> diff --git a/include/sound/soc.h b/include/sound/soc.h
> index 5e3919ffb00c..a0918d159fd3 100644
> --- a/include/sound/soc.h
> +++ b/include/sound/soc.h
> @@ -1331,6 +1331,7 @@ void snd_soc_of_parse_audio_prefix(struct snd_soc_card *card,
>  
>  int snd_soc_of_parse_audio_routing(struct snd_soc_card *card,
>  				   const char *propname);
> +int snd_soc_of_parse_aux_devs(struct snd_soc_card *card, const char *propname);
>  unsigned int snd_soc_of_parse_daifmt(struct device_node *np,
>  				     const char *prefix,
>  				     struct device_node **bitclkmaster,
> diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
> index 2fe1b2ec7c8f..bf46f410c8c6 100644
> --- a/sound/soc/soc-core.c
> +++ b/sound/soc/soc-core.c
> @@ -2827,6 +2827,37 @@ int snd_soc_of_parse_audio_routing(struct snd_soc_card *card,
>  }
>  EXPORT_SYMBOL_GPL(snd_soc_of_parse_audio_routing);
>  
> +int snd_soc_of_parse_aux_devs(struct snd_soc_card *card, const char *propname)
> +{
> +	struct device_node *node = card->dev->of_node;
> +	struct snd_soc_aux_dev *aux;
> +	int num, i;
> +
> +	num = of_count_phandle_with_args(node, propname, NULL);
> +	if (num == -ENOENT) {
> +		return 0;
> +	} else if (num < 0) {
> +		dev_err(card->dev, "ASOC: Property '%s' could not be read: %d\n",
> +			propname, num);
> +		return num;
> +	}
> +
> +	aux = devm_kcalloc(card->dev, num, sizeof(*aux), GFP_KERNEL);
> +	if (!aux)
> +		return -ENOMEM;
> +	card->aux_dev = aux;
> +	card->num_aux_devs = num;
> +
> +	for_each_card_pre_auxs(card, i, aux) {
> +		aux->dlc.of_node = of_parse_phandle(node, propname, i);
> +		if (!aux->dlc.of_node)
> +			return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(snd_soc_of_parse_aux_devs);
> +
>  unsigned int snd_soc_of_parse_daifmt(struct device_node *np,
>  				     const char *prefix,
>  				     struct device_node **bitclkmaster,


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
