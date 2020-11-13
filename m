Return-Path: <SRS0=eCnW=ET=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37732C2D0E4
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Nov 2020 00:13:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C32B20872
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Nov 2020 00:13:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Oc+KYvff";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="a3g8ssQ0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C32B20872
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gfWQBgx/aj0QaqDr66V8adW8W+UV0PkjYf7zusG6UtM=; b=Oc+KYvff7ejqT3T6IKkqXAlRV
	ZWTAW2X1EVAVZUbd+g+UdjNn4rsETPcdB+eRCzKGyiqMoyGI0xGpYLiUofB2p/wwIfhl0sin3yjKt
	6Iq8CqusnbXnnr6RjenQa6S7ke24sw/rieXGYSSToCR1DZllRk4tB2AmtHRZEjgZlrFCcal2pNNIs
	JJY1vzo+I/n0DWy6FdAEyzraHitkNplXUIy2ddrZ9gAbTMtrS3oxgyaKplrs02dbjvV9/ACFqi5M6
	rMIe4xLBja4GgW7RWqPvd1RvI9Y5mqcokpNt59wo8CG/IS2aBGej0CowiyKaoHJsbVGDNyk7Upjz2
	Uo/Lm2QdQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdMhy-0000uY-QM; Fri, 13 Nov 2020 00:12:54 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdMhv-0000tr-Sw
 for linux-amlogic@lists.infradead.org; Fri, 13 Nov 2020 00:12:53 +0000
Received: by mail-wm1-x342.google.com with SMTP id c16so6982662wmd.2
 for <linux-amlogic@lists.infradead.org>; Thu, 12 Nov 2020 16:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=5aQjoHmKrLDA7704pKLy9Q0aTKPXPjODcZdmkkFaAvM=;
 b=a3g8ssQ0AnZoCd/JTaE9Zur8XHCobId19WHZqBZ9OMzRvt0/2DWgwUGv4tIAYyA9ti
 NTKWqXcty0BqPatWH4ydgNSlYEfib+xVdMhJarL7bhnykWoKfFJJb8yiHAj1X5m8lb2f
 owZczQKIpJtxzDVx2PBtu93q39CfsSRQOlk2uYeFUhg66C4QhqUUCZ2hzU6VuuQkd5QX
 w6yaLJItUN4m2PZRNeqqN0B5AG9dm1upZsdvjochKSzR2RFsqc2591uPSb/JrGvVYXtd
 Qe5oS0H2xgfHUDs/HqK7+9HFeJq3AVWdVwrwfGYUWrgHki6ke5DRH7Wv5c3fY8j51Eoc
 4Qfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=5aQjoHmKrLDA7704pKLy9Q0aTKPXPjODcZdmkkFaAvM=;
 b=HAP4Ib5ezqyYi1XYpA9Z/FAi+AEplO9w5d6UWZ0u2cLRxK0NAM3O+OHaHlIkRjquzm
 wX2B+RGB4wkzH/+c7noMT5gtVQDUaTUSSBHE2MfSgpMQPPRZIKr9+Hgc08HT2pw5dAab
 zMnYT3m0LwDilaKU9ibUvxMU+625wUZPYG5sn/glZsUYm3tCD4F1RsQ5eXlyIgAcFtrA
 tY2Py073T8fqQ8mx5f0abzCIbvdAaaPn6lmYK1P6lht6yzPSNEFtbuZAwJuYhWMS5kup
 zuEPD4AwIJjfqx20pZYKf/JXeUHe93prOQV5mM3ICcVGAYXSW0/6+gi1knw161weuWcv
 wEog==
X-Gm-Message-State: AOAM5330xOiykZSLU4VduI62E5cgOfR1ZYO5Hfmg5lIiFQIk+MvQe2Lu
 fzcSXEliOjYBo0KLUhmyzEnDGQ==
X-Google-Smtp-Source: ABdhPJycOkoPoA49v+6wIv01mpIMZOe0z2s1IdIKn9+jEMRFcTEdNcyZ60fn59VzPo5JZPEvWCQN9g==
X-Received: by 2002:a1c:4ca:: with SMTP id 193mr326206wme.137.1605226370583;
 Thu, 12 Nov 2020 16:12:50 -0800 (PST)
Received: from ?IPv6:2001:861:3a84:7260:5d3c:83d5:8524:33ca?
 ([2001:861:3a84:7260:5d3c:83d5:8524:33ca])
 by smtp.gmail.com with ESMTPSA id v8sm8046333wmg.28.2020.11.12.16.12.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Nov 2020 16:12:49 -0800 (PST)
Subject: Re: [PATCH v2] reset: make shared pulsed reset controls re-triggerable
To: Philipp Zabel <p.zabel@pengutronix.de>
References: <20201112230043.28987-1-aouledameur@baylibre.com>
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Message-ID: <96bce8ff-9601-e6cc-94b1-abd9583e19ae@baylibre.com>
Date: Fri, 13 Nov 2020 01:12:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201112230043.28987-1-aouledameur@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201112_191252_013642_B2BEFE3E 
X-CRM114-Status: GOOD (  31.03  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jim Quinlan <james.quinlan@broadcom.com>,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Please find in this patchset [0] a use case of the reset_control_rearm() call
on some of meson usb drivers:


[0] https://lore.kernel.org/lkml/20201113000508.14702-1-aouledameur@baylibre.com/

On 13/11/2020 00:00, Amjad Ouled-Ameur wrote:

> The current reset framework API does not allow to release what is done by
> reset_control_reset(), IOW decrement triggered_count. Add the new
> reset_control_rearm() call to do so.
>
> When reset_control_reset() has been called once, the counter
> triggered_count, in the reset framework, is incremented i.e the resource
> under the reset is in-use and the reset should not be done again.
> reset_control_rearm() would be the way to state that the resource is
> no longer used and, that from the caller's perspective, the reset can be
> fired again if necessary.
>
> Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
> Reported-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
> Change since v1: [0]
> * Renamed the new call from reset_control_(array_)resettable to
> reset_control_(array_)rearm
> * Open-coded reset_control_array_rearm to check for errors before
> decrementing triggered_count because we cannot roll back in case an
> error occurs while decrementing one of the rstc.
> * Reworded the new call's description.
>
> [0] https://lore.kernel.org/lkml/20201001132758.12280-1-aouledameur@baylibre.com
>
>   drivers/reset/core.c  | 73 +++++++++++++++++++++++++++++++++++++++++++
>   include/linux/reset.h |  1 +
>   2 files changed, 74 insertions(+)
>
> diff --git a/drivers/reset/core.c b/drivers/reset/core.c
> index a2df88e90011..34e89aa0fb5e 100644
> --- a/drivers/reset/core.c
> +++ b/drivers/reset/core.c
> @@ -208,6 +208,39 @@ static int reset_control_array_reset(struct reset_control_array *resets)
>   	return 0;
>   }
>   
> +static int reset_control_array_rearm(struct reset_control_array *resets)
> +{
> +	struct reset_control *rstc;
> +	int i;
> +
> +	for (i = 0; i < resets->num_rstcs; i++) {
> +		rstc = resets->rstc[i];
> +
> +		if (!rstc)
> +			continue;
> +
> +		if (WARN_ON(IS_ERR(rstc)))
> +			return -EINVAL;
> +
> +		if (rstc->shared) {
> +			if (WARN_ON(atomic_read(&rstc->deassert_count) != 0))
> +				return -EINVAL;
> +		} else {
> +			if (!rstc->acquired)
> +				return -EPERM;
> +		}
> +	}
> +
> +	for (i = 0; i < resets->num_rstcs; i++) {
> +		rstc = resets->rstc[i];
> +
> +		if (rstc && rstc->shared)
> +			WARN_ON(atomic_dec_return(&rstc->triggered_count) < 0);
> +	}
> +
> +	return 0;
> +}
> +
>   static int reset_control_array_assert(struct reset_control_array *resets)
>   {
>   	int ret, i;
> @@ -325,6 +358,46 @@ int reset_control_reset(struct reset_control *rstc)
>   }
>   EXPORT_SYMBOL_GPL(reset_control_reset);
>   
> +/**
> + * reset_control_rearm - allow shared reset line to be re-triggered"
> + * @rstc: reset controller
> + *
> + * On a shared reset line the actual reset pulse is only triggered once for the
> + * lifetime of the reset_control instance, except if this call is used.
> + *
> + * Calls to this function must be balanced with calls to reset_control_reset,
> + * a warning is thrown in case triggered_count ever dips below 0.
> + *
> + * Consumers must not use reset_control_(de)assert on shared reset lines when
> + * reset_control_reset or reset_control_rearm have been used.
> + *
> + * If rstc is NULL the function will just return 0.
> + */
> +int reset_control_rearm(struct reset_control *rstc)
> +{
> +	if (!rstc)
> +		return 0;
> +
> +	if (WARN_ON(IS_ERR(rstc)))
> +		return -EINVAL;
> +
> +	if (reset_control_is_array(rstc))
> +		return reset_control_array_rearm(rstc_to_array(rstc));
> +
> +	if (rstc->shared) {
> +		if (WARN_ON(atomic_read(&rstc->deassert_count) != 0))
> +			return -EINVAL;
> +
> +		WARN_ON(atomic_dec_return(&rstc->triggered_count) < 0);
> +	} else {
> +		if (!rstc->acquired)
> +			return -EPERM;
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(reset_control_rearm);
> +
>   /**
>    * reset_control_assert - asserts the reset line
>    * @rstc: reset controller
> diff --git a/include/linux/reset.h b/include/linux/reset.h
> index 05aa9f440f48..439fec7112a9 100644
> --- a/include/linux/reset.h
> +++ b/include/linux/reset.h
> @@ -13,6 +13,7 @@ struct reset_control;
>   #ifdef CONFIG_RESET_CONTROLLER
>   
>   int reset_control_reset(struct reset_control *rstc);
> +int reset_control_rearm(struct reset_control *rstc);
>   int reset_control_assert(struct reset_control *rstc);
>   int reset_control_deassert(struct reset_control *rstc);
>   int reset_control_status(struct reset_control *rstc);


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
