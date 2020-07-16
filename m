Return-Path: <SRS0=svws=A3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49335C433E3
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Jul 2020 13:29:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1563C20760
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Jul 2020 13:29:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ya1AENft";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="e4FEY+O3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1563C20760
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:In-reply-to:Subject:To:
	From:References:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qcu5dICSo8tozMEAkSXj7vapSZWovS/PaoJKNOQK1cY=; b=ya1AENftQrqrw9PWILeWtuC9J
	rNRSUR/8b8+YJpajPoHd7D23RNmtkDTlGXv+nW8XQE043os//Odbjh1KDVg0P8HGHV4ioNtaDAcOP
	RysdHXcD2AYjmBW5wcb/b1FfTK62do39MoXOHV9ZzI8UgNa/KUs6l3C618Wfsc0y2AcMj4d0kMK/Y
	hVWjQxMiN1A9RpkvQDAcn6Fx61k/CPN3n9sZY841CxHvqtWpi0ILV41Qvd5gFIOBd/n+vaGf4d7EG
	BNBHmYSvWbflV47KxWvs0FzRagvGENt+8A1TtpZo1omg347uS5KcXFOtRxZ+U80xgGhaqkSIK0Ypo
	B7sfJcsdQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jw3xM-0007W3-Ls; Thu, 16 Jul 2020 13:29:48 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jw3xF-0007Sn-O9
 for linux-amlogic@lists.infradead.org; Thu, 16 Jul 2020 13:29:44 +0000
Received: by mail-wm1-x344.google.com with SMTP id c80so10328165wme.0
 for <linux-amlogic@lists.infradead.org>; Thu, 16 Jul 2020 06:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=ekSSt/5t2jmT5g2LzLm9iiouocorbUPUaL0+PSkZByk=;
 b=e4FEY+O3MN9kneCWpjw2AuA6M3EOeHa76eTJCimRqpdrtKBQSSOraxPXNbBS8f8Hzc
 tz6zo/FvGqILsjj+bkWDfBySfy7EQhsxQfhljSHeGFQUXL1R14dAuoybNl747hLEjDPY
 vNppE3yDsKtFgZlvE7vJe6drtvYw7kI2pOfy2MRc5OuRRPF1FSQ8K8uCJQgeihxxobQi
 QVzUMhFg6KbZManF2vD441ml3dsS6g5yEkZFsIp/v/x1LiDzvlWdzu0jxI4KmMVzVDtZ
 mvFloFDMjuuzLmqzI356WyXrn6UiezpZ3f74qnVUym5bzdrugxI4+QulkFaW1qEiGlH3
 oUmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=ekSSt/5t2jmT5g2LzLm9iiouocorbUPUaL0+PSkZByk=;
 b=KcRuJ9DtN9u1R7j1YM+Z9gCQC5PgAWWi5Q5XXJJvk65ZQNU4uI0x+qaEEoudp9Ps5M
 7Wmb3wg2X6Y6Q/TJkA7dy70Xye+KaVCSDy8pxTbcT9/+kPWO4SI4AM/FGmFeJJw7Wo+9
 gxxj3ujG7whO+iQUTHbqOX+TF9OiRfXTLhsgeB54UnULDFBA+GyO8si/hfn/2guSHYRW
 qtslrAYuZMjZHU2NnOdJII8rfbQ29Zge3nfuwo6nQhCqHEHaZuahXhni9k2u5KzepYxA
 IvlMoN57A+PbQdFtMb3q3+0cFQYMZqVlHhrLJRbxmHJ89A4hpMSe+3pW4Tg1PH95N0pX
 KpXQ==
X-Gm-Message-State: AOAM5317rpvWzXReckXfZmFj9VaBwhguDs9OXxDdqTZrexHyJmi+YYe+
 4cjddjIMuGGK+8uI9AgMPa+cx1ax6p0=
X-Google-Smtp-Source: ABdhPJyADBcDb+XzELdoJ99YW8KYEjCgWzkM0ZKScl+XNUWRXJyRD/oosm2ILnxfvcz3p0ggTeii6Q==
X-Received: by 2002:a1c:4c0a:: with SMTP id z10mr4618549wmf.38.1594906180632; 
 Thu, 16 Jul 2020 06:29:40 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id x7sm8945595wrr.72.2020.07.16.06.29.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2020 06:29:39 -0700 (PDT)
References: <20200716132558.33932-1-jingxiangfeng@huawei.com>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jing Xiangfeng <jingxiangfeng@huawei.com>, lgirdwood@gmail.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com, khilman@baylibre.com,
 kuninori.morimoto.gx@renesas.com
Subject: Re: [PATCH] ASoC: meson: add the missed kfree() for
 axg_card_add_tdm_loopback
In-reply-to: <20200716132558.33932-1-jingxiangfeng@huawei.com>
Date: Thu, 16 Jul 2020 15:29:39 +0200
Message-ID: <1jzh7zegfw.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200716_092941_966959_831D90F4 
X-CRM114-Status: GOOD (  12.41  )
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


On Thu 16 Jul 2020 at 15:25, Jing Xiangfeng <jingxiangfeng@huawei.com> wrote:

> axg_card_add_tdm_loopback() misses to call kfree() in an error path. Add
> the missed function call to fix it.
>
> Fixes: c84836d7f650 ("ASoC: meson: axg-card: use modern dai_link style")
> Signed-off-by: Jing Xiangfeng <jingxiangfeng@huawei.com>

Thanks for fixing this.
Maybe it would be better to use the devm_ variant for the name instead ?

> ---
>  sound/soc/meson/axg-card.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/sound/soc/meson/axg-card.c b/sound/soc/meson/axg-card.c
> index 89f7f64747cd..6eac22ba8b99 100644
> --- a/sound/soc/meson/axg-card.c
> +++ b/sound/soc/meson/axg-card.c
> @@ -121,8 +121,10 @@ static int axg_card_add_tdm_loopback(struct snd_soc_card *card,
>  		return -ENOMEM;
>  
>  	dlc = devm_kzalloc(card->dev, 2 * sizeof(*dlc), GFP_KERNEL);
> -	if (!dlc)
> +	if (!dlc) {
> +		kfree(lb->name);
>  		return -ENOMEM;
> +	}
>  
>  	lb->cpus = &dlc[0];
>  	lb->codecs = &dlc[1];


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
