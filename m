Return-Path: <SRS0=b0VC=J2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F54CC433ED
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Apr 2021 17:43:33 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2EB7D61456
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Apr 2021 17:43:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2EB7D61456
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:In-reply-to:Subject:Cc:
	To:From:References:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hHhAR9Hb6Ad/NiTDF/EEmtnbQ97jqRxCS9Wu6tTtpfM=; b=alsr2JOoRYWrXCy07SuemPqFi
	FxZRF7K3F0tZBo64CJK21Dky9Ya3XWultq5rc5D0/QMiWBX7SdN4kygBue7bYvox1k6SLNdAs0zd7
	O394l+ZBt3VRFoHiXscLVKMbqp6UGk9YRp/jbzRY7bxEXbz3TmGsVbJ/WLD+HVbQ4AAXKY4qpmhwg
	BwDJ66q7pa6v2841QOzSSWOhhJawaSIA0EdzFvYl9un7YWoG1vz0zr/ZjPEmvZiG6XM6htDdQBPik
	ddJCuBU7c5chI2pRyCMoVcv6DEMmisB0i6B3mdUTjMWb4Rl5/3b5CWvMTfpmZHW8AvibjyVC1mry2
	rW5oMhK4Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lcAhB-0068P9-Ec; Thu, 29 Apr 2021 17:43:25 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcAgy-0068Nz-Of
 for linux-amlogic@desiato.infradead.org; Thu, 29 Apr 2021 17:43:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:MIME-Version:Date:
 Message-ID:In-reply-to:Subject:Cc:To:From:References:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=BRjhSBhHMw0cfh8McFGX3T1RGcT74vqYpGonK7mWYDI=; b=HqT5+I2VuxAtSBJYi8m9WVmUtB
 3wxWWys1J9EHks3PawZb3rirBDVZkolAdYJ0vfyjQdinxfrjLtlGpUgDvsKRwxblTFctqyP4rIVoo
 QlchVYnLUScxNNc3+6S1CfY1hdF6Ynzd9NZeCrnQyUCGieo7dPS7w+iilLgPCG7RwzpyN2piTvK/U
 xqlfPVawqlTDB1LkO+jJr2UGzehmPfL4HAPyEdqdoEnhL4wliVrunsL9PUsN+xAkQw5hLbzTJ02Xs
 NssjergfnylTX5ALNikIzco2OAT2H4MTRvWoScjugLB6W9kibBvU/17ptdEAsLnwb1zOhGOGlIM1h
 ZRrKnmeg==;
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcAgv-000pO3-FK
 for linux-amlogic@lists.infradead.org; Thu, 29 Apr 2021 17:43:11 +0000
Received: by mail-ej1-x629.google.com with SMTP id zg3so19531135ejb.8
 for <linux-amlogic@lists.infradead.org>; Thu, 29 Apr 2021 10:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:message-id
 :date:mime-version;
 bh=BRjhSBhHMw0cfh8McFGX3T1RGcT74vqYpGonK7mWYDI=;
 b=Kiq0l4riPAKiNrT7WJO38D0K2S1WMBBF2WDDoJYhcaFGNwXSu6bwya5fgqLoocpIPD
 OsdN/9XBiFLxC8xL4EdVJp+Xrvc9Wti1b8t1aPWQWuH1msE9XiPLnG/NE6OpkTQBsD5j
 pMMWNN3OJOJmB00zYIioJfkMihUkBabKT6p+oP0ATQUZ/sr1nbp0An9yeszAe4Y7mtZR
 BBqr9c8jl3OFLieEYDvoVUb0gahKb766iwSp0mvFTeYJo/ddUY00IBk3YfgT8BzDTwHQ
 cy7OEJwYCiCOnfZ+8OL2Eyv/gnCBDDnkgiX8B4JZvXl4H05uO+OQCquxXTaGQ0bHM6/a
 RKGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:message-id:date:mime-version;
 bh=BRjhSBhHMw0cfh8McFGX3T1RGcT74vqYpGonK7mWYDI=;
 b=L/JcPXI4CZvYx17QEFjItxra/Oupt1cnKtzDkZJmvdY5XZQ+QTed9Ve9EBLsVQ5VZV
 I8r5M0KWkvKtoxittPeU98VsE2bRbYst2JkQnH/q24RGXcFCkxV6LRT480qoAb7GLbMf
 MZcCqRe4R5Cjo8I9tsbDl3k6AwgyufQii2mkaOP7qpyhcNQ0w/3+FD/Epfqf4XMbolVk
 44DyTw55TrewQ3dcoBYuIkShbFr0fV7u6WcJHLyZEJX0AKRQ6ngMPQBpkokVjJo4enXb
 xxEbXrs0+tnvQ9WxXO0YJEpTly2EMrxH9tSPCbjTyr/DsfmJHBrG6dPeIsdtY+c6QzW+
 9bBQ==
X-Gm-Message-State: AOAM53030VNQOz2qWyGkB9Tk00ow1m9NO8cDaLE35EY3fUT7tvOX+ZU/
 eDh/LJQYvSTmy1xOOBK4igWU/g==
X-Google-Smtp-Source: ABdhPJx1ZgmV97KuEwi9+JdPZAVO4jUb2ew4j//svpTXFE+Kseaa2P/yi/AHDBRde4cmoKrvVSnHGw==
X-Received: by 2002:a17:906:6544:: with SMTP id
 u4mr1065841ejn.455.1619718187971; 
 Thu, 29 Apr 2021 10:43:07 -0700 (PDT)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.gmail.com with ESMTPSA id d5sm2877135edt.49.2021.04.29.10.43.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 10:43:07 -0700 (PDT)
References: <20210429170147.3615883-1-narmstrong@baylibre.com>
User-agent: mu4e 1.4.15; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, broonie@kernel.org
Cc: alsa-devel@alsa-project.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: meson: g12a-toacodec: add support for SM1 TOACODEC
In-reply-to: <20210429170147.3615883-1-narmstrong@baylibre.com>
Message-ID: <1jo8dx9ec5.fsf@starbuckisacylon.baylibre.com>
Date: Thu, 29 Apr 2021 19:43:06 +0200
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210429_104309_533917_8EAE6366 
X-CRM114-Status: GOOD (  15.04  )
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


On Thu 29 Apr 2021 at 19:01, Neil Armstrong <narmstrong@baylibre.com> wrote:


>  
> +static int sm1_toacodec_mux_put_enum(struct snd_kcontrol *kcontrol,
> +				     struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component =
> +		snd_soc_dapm_kcontrol_component(kcontrol);
> +	struct snd_soc_dapm_context *dapm =
> +		snd_soc_dapm_kcontrol_dapm(kcontrol);
> +	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
> +	unsigned int mux, changed;
> +
> +	mux = snd_soc_enum_item_to_val(e, ucontrol->value.enumerated.item[0]);
> +	changed = snd_soc_component_test_bits(component, e->reg,
> +					      CTRL0_DAT_SEL_SM1,
> +					      FIELD_PREP(CTRL0_DAT_SEL_SM1, mux));
> +
> +	if (!changed)
> +		return 0;
> +
> +	/* Force disconnect of the mux while updating */
> +	snd_soc_dapm_mux_update_power(dapm, kcontrol, 0, NULL, NULL);
> +
> +	snd_soc_component_update_bits(component, e->reg,
> +				      CTRL0_DAT_SEL_SM1 |
> +				      CTRL0_LRCLK_SEL_SM1 |
> +				      CTRL0_BCLK_SEL_SM1,
> +				      FIELD_PREP(CTRL0_DAT_SEL_SM1, mux) |
> +				      FIELD_PREP(CTRL0_LRCLK_SEL_SM1, mux) |
> +				      FIELD_PREP(CTRL0_BCLK_SEL_SM1, mux));
> +
> +	/*
> +	 * FIXME:
> +	 * On this soc, the glue gets the MCLK directly from the clock
> +	 * controller instead of going the through the TDM interface.
> +	 *
> +	 * Here we assume interface A uses clock A, etc ... While it is
> +	 * true for now, it could be different. Instead the glue should
> +	 * find out the clock used by the interface and select the same
> +	 * source. For that, we will need regmap backed clock mux which
> +	 * is a work in progress
> +	 */
> +	snd_soc_component_update_bits(component, e->reg,
> +				      CTRL0_MCLK_SEL,
> +				      FIELD_PREP(CTRL0_MCLK_SEL, mux));
> +
> +	snd_soc_dapm_mux_update_power(dapm, kcontrol, mux, e, NULL);
> +
> +	return 0;
> +}

Instead of duplicating this function, I'd prefer if you could use regmap fields



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
