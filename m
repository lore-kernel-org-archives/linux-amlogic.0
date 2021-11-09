Return-Path: <SRS0=Jxtm=P4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEA1BC433FE
	for <linux-amlogic@archiver.kernel.org>; Tue,  9 Nov 2021 08:00:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C35FE610F8
	for <linux-amlogic@archiver.kernel.org>; Tue,  9 Nov 2021 08:00:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C35FE610F8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dLmS+dCjlTgo7TxPaRprUS5l5KchfNkhlTE6agNtMM0=; b=C3oBUWiDumgZXD
	459E7KVRH5+XnmQlfNMB8MGtcEr/bRY+nDn3+8KG5C+F+wCsjeV8PzXshyZxERBsrdvmr9GBk9YJL
	KotcZ7qnuUbiW6bPdtaAO6nFp2fzFFWdy52+otZrM2vOiBuu2STvuylcPw9XGu4asfciM2XqbeWbt
	ijeOuDJ44S9QMlrA0Bkamn4N5dVOzvRUz3gA0bnVpxFuyDZWpwNZwl8Npve+w3QIdzZR0CLYJECvf
	YBUhmA1tBFsNVchMaO3lq3n8I3ktLvVnHLS5IyY/4NCTSmBn9lLhyTityg/spruhJC9CrnWSQlWq0
	46AJzygzkC3XX8VSwiSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkM3G-000uQJ-9l; Tue, 09 Nov 2021 08:00:18 +0000
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkM2v-000uEg-JQ; Tue, 09 Nov 2021 07:59:59 +0000
Received: by mail-il1-x129.google.com with SMTP id s15so810834ild.9;
 Mon, 08 Nov 2021 23:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iGTLUmZFXXi8TM5i97jxZTDNrNCsnanJmw2eZUcoYuo=;
 b=Mmz2mTVK2B6vz/4KEGe+N1RhRqNQK5ZN7luaXzJDbU6gddP/cEKQiM9rQeFq7D3sUd
 VBndsUntcjqvVqRVWkzoPIbDb3EsUIG9B7uSlf0cgMb2zpch5ia1Vt5JD/TooD+UzOZd
 KVy2NND5QEIvRxJfbdpcm0i3kwuchsBYADCUVtxlk9Oyo5W9d0SMnge8BHDoDyGe+z0E
 ttwJHTNQVFP1YxPML5iMMWSM1Pktx6K1vYOk9APdtEjp0wGxF6PUJvm3psLadF5wunnH
 49H+MUW9QQkU3w4ZslNOIzFpKR/H2RG9gQefLCrJf3q6pIOTUf6BlKVv6sWjF3nvcRv3
 nB0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iGTLUmZFXXi8TM5i97jxZTDNrNCsnanJmw2eZUcoYuo=;
 b=Z4VAGcZ7EidYeUiua5wJR0e2xynFKNQmwO6pDqZadBCzDMjx12xcD6r2iDm7DR/TNM
 57zH5d7v+L/qB889bZLW51Vzm8fJuWXAQaDR0goND1wCAqE9shqR3lEEVvVKHyigtNyH
 Uf+1dD/qdvwaOwPawAz2VO/I49HRA7kXTYntJadCDLfJNKz7W334wVhuRkZCkyp0IBfw
 0umuHTv55xjX7pd5axmoaCpaWRAhA1lPgS9I0wLoE6Wu/6Cev7GnBat21JyfTks37zIk
 BzUjCj5XH/t9CtUoksCu6t7mEryu0lhfRgfuNeTMxDUEzYnl0NHA2UwPaIWkschMriUO
 G99g==
X-Gm-Message-State: AOAM533ism20m2vPynIhKbsjEQj3CwfqNcEGtHZl3eIvqq3BU8XHlJi+
 8Up7fYkM0aL0zFpMpxsa/UanJS7Blk9qtMvrNi8=
X-Google-Smtp-Source: ABdhPJw2TWFh/34/tIN/mpZc8hZh2FjBcNIqCxxOwKS7eIeYvSqIuNEpPcJHt5ssTq+ZApXvVAd/8WM4QDc8HTZEttM=
X-Received: by 2002:a05:6e02:b42:: with SMTP id
 f2mr3874183ilu.93.1636444796818; 
 Mon, 08 Nov 2021 23:59:56 -0800 (PST)
MIME-Version: 1.0
References: <20210730041355.2810397-1-art@khadas.com>
 <20210730041355.2810397-4-art@khadas.com>
In-Reply-To: <20210730041355.2810397-4-art@khadas.com>
From: Art Nikpal <email2tema@gmail.com>
Date: Tue, 9 Nov 2021 15:59:46 +0800
Message-ID: <CAKaHn9KxZDAHdKGZg3-Pi3jZO5E3knESHCFjgaV09u5QYe074A@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] watchdog: meson_gxbb_wdt: remove stop_on_reboot
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: wim@linux-watchdog.org, Guenter Roeck <linux@roeck-us.net>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Christian Hewitt <christianshewitt@gmail.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-watchdog@vger.kernel.org, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>, 
 Artem Lapkin <art@khadas.com>, Nick Xie <nick@khadas.com>,
 Gouwa Wang <gouwa@khadas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211108_235957_666386_801C7E05 
X-CRM114-Status: GOOD (  19.25  )
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

hi Guenter Roeck
why still not merged to upstream ?

On Fri, Jul 30, 2021 at 12:14 PM Artem Lapkin <email2tema@gmail.com> wrote:
>
> Remove watchdog_stop_on_reboot()
>
> Meson platform still have some hardware drivers problems for some
> configurations which can freeze device on shutdown/reboot stage and i
> think better to have reboot warranty by default.
>
> I feel that it is important to keep the watchdog running during the
> reboot sequence, in the event that an abnormal driver freezes the reboot
> process.
>
> This is my personal opinion and I hope the driver authors will agree
> with my proposal, or just ignore this commit if not.
>
> https://lore.kernel.org/linux-watchdog/20210729072308.1908904-1-art@khadas.com/T/#t
>
> Signed-off-by: Artem Lapkin <art@khadas.com>
> ---
>  drivers/watchdog/meson_gxbb_wdt.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/watchdog/meson_gxbb_wdt.c b/drivers/watchdog/meson_gxbb_wdt.c
> index 945f5e65db57..d3c9e2f6e63b 100644
> --- a/drivers/watchdog/meson_gxbb_wdt.c
> +++ b/drivers/watchdog/meson_gxbb_wdt.c
> @@ -198,7 +198,6 @@ static int meson_gxbb_wdt_probe(struct platform_device *pdev)
>
>         meson_gxbb_wdt_set_timeout(&data->wdt_dev, data->wdt_dev.timeout);
>
> -       watchdog_stop_on_reboot(&data->wdt_dev);
>         return devm_watchdog_register_device(dev, &data->wdt_dev);
>  }
>
> --
> 2.25.1
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
