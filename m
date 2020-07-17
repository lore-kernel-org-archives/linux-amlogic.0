Return-Path: <SRS0=P5SD=A4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EEA5C433E1
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 Jul 2020 08:44:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A9AC20691
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 Jul 2020 08:44:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="maKLATz4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="CcrWH877"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A9AC20691
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:In-reply-to:Subject:To:
	From:References:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4Tn3vjO/zN05v1uWk/jpsA9F+QDQgcqUh3Ah3JXNbbk=; b=maKLATz4V9/Ui5yGnTigZ2v5t
	QRk6Nmd+YzHhNhFKgrasK5tamMfkBqpLM9h1UzPG1uiXg3WsGDgw3rnvA41iJ24WzxjysbSvUHUiT
	mZqRo4lPIIiGRhHvuJI1xCj8bDvhlHtf1LytOLe4u1zzN8d8WN4wByBDjd9mW6h0c3zXcgHLbpfmB
	lcDmpZG+U/0p2vTcwNLXN3TAQO/2iEc1GOFYao21YitRQVYtLnHqBWhtxx+3BFTHpifxLo8CxVGec
	z0dkk+gNTOwzpwB5acVlc6qXZ7+7P0yPecppnasJYGLdD7gDHSwNYH/qgdoiElqd8AJIwllvIci4U
	bLj3b4Q1A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jwLz1-0000bG-Le; Fri, 17 Jul 2020 08:44:43 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jwLyz-0000a2-DY
 for linux-amlogic@lists.infradead.org; Fri, 17 Jul 2020 08:44:42 +0000
Received: by mail-wr1-x443.google.com with SMTP id f2so10119838wrp.7
 for <linux-amlogic@lists.infradead.org>; Fri, 17 Jul 2020 01:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=9x6fTHZjafmueEMmRdi+LdlMzC2EII5ZkFzc9Fwx204=;
 b=CcrWH877Ri20PNsFBMBPs4KP9jLSBxVMwMQejX+OakrhCpNGurKvg/YYuWyooyngHO
 PGII9nSP3QITVgwaA4IMlURWO0b7gngGMwk2tXW0Z30dsgpHUZLhxbzH/rTNZ6LaErsg
 7bkbz0aMZlBSeE8sWKk1eu+xm6tMvSYt1dz3W5nHlHPy0+YrsvYM20RZqDXAcgy0hIFY
 IFcZv1BdkCGDXemcAcUKGgqaTS1rWgYSHbLZmWdaW+gVOH6Yvi9Ca51nI3rlF4f4cg4Q
 4J6q5a2drV9N+LEkPNNOqAy8bOGoph8gzskNnKVVKah64U9qztXuUs/d7VCVkGxWUC63
 2AiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=9x6fTHZjafmueEMmRdi+LdlMzC2EII5ZkFzc9Fwx204=;
 b=BtaKrYnUaqZSlS6nQ2nq70UD6VLm4sjGEfKaODOGKwzBdQJAGPMB50QVbCfOofxvZf
 diOv/9IlUTHB4KqH7OjTP74YfD6fQEMLjqhR2rwymKys6F1ygNaNh+r7RLMTvrwlMs/I
 Czb0qKMrQMiVrUfoGeEsxIhuBCd+eF5YY3dbKFo+jSvo8tfgSUKVh+Q5pjxa4T+0K66N
 +7uugVcPTDt/9hLS02pjo+9Dyd2mct20N4i/ytcTsn3oOpVJeJ1IDHcsnspNvZFyctIb
 /FxOkoyqMtcMIwV3ruKmDi/GBJj4O17H40ftnmD5fTyQBysbNx2cU7p7oiZPERRs/YsK
 g67w==
X-Gm-Message-State: AOAM530rAeOk+GMNN4/uLZRc17ZUlbHqicIlrXdVh2TijvDM7bk25UrM
 xV1QnlkipQx5Oo/tpOiwhslZPw==
X-Google-Smtp-Source: ABdhPJyovxSTvHHpc7ZiBtlMV3klZ1rwvUq3jT7v0dWg3bOYRkcwggR2do8xcR8ffqqZT8dB2S5bOA==
X-Received: by 2002:adf:f311:: with SMTP id i17mr9496093wro.237.1594975477992; 
 Fri, 17 Jul 2020 01:44:37 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id k20sm12480834wmi.27.2020.07.17.01.44.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2020 01:44:35 -0700 (PDT)
References: <20200717082242.130627-1-jingxiangfeng@huawei.com>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jing Xiangfeng <jingxiangfeng@huawei.com>, lgirdwood@gmail.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com, khilman@baylibre.com,
 kuninori.morimoto.gx@renesas.com
Subject: Re: [PATCH v2] ASoC: meson: fixes the missed kfree() for
 axg_card_add_tdm_loopback
In-reply-to: <20200717082242.130627-1-jingxiangfeng@huawei.com>
Date: Fri, 17 Jul 2020 10:44:35 +0200
Message-ID: <1j7dv2sf7w.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200717_044441_611316_3ED49950 
X-CRM114-Status: GOOD (  12.14  )
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
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Fri 17 Jul 2020 at 10:22, Jing Xiangfeng <jingxiangfeng@huawei.com> wrote:

> axg_card_add_tdm_loopback() misses to call kfree() in an error path. We
> can use devm_kasprintf() to fix the issue, also improve maintainability.
> So use it instead.
>
> Fixes: c84836d7f650 ("ASoC: meson: axg-card: use modern dai_link style")
> Signed-off-by: Jing Xiangfeng <jingxiangfeng@huawei.com>

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

> ---
>  sound/soc/meson/axg-card.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/sound/soc/meson/axg-card.c b/sound/soc/meson/axg-card.c
> index 89f7f64747cd..47f2d93224fe 100644
> --- a/sound/soc/meson/axg-card.c
> +++ b/sound/soc/meson/axg-card.c
> @@ -116,7 +116,7 @@ static int axg_card_add_tdm_loopback(struct snd_soc_card *card,
>  
>  	lb = &card->dai_link[*index + 1];
>  
> -	lb->name = kasprintf(GFP_KERNEL, "%s-lb", pad->name);
> +	lb->name = devm_kasprintf(card->dev, GFP_KERNEL, "%s-lb", pad->name);
>  	if (!lb->name)
>  		return -ENOMEM;


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
