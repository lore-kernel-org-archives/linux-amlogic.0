Return-Path: <SRS0=DVbv=PT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FC9EC43387
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Jan 2019 09:41:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DCD22146F
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Jan 2019 09:41:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eretFE94"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3DCD22146F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tw84hgAa2mrDe90e3nF5JSADtYEcRJXbGrTzZqjPGYA=; b=eretFE94H2EkXN
	zc9p4R6GFyiKCl4PR8Mxyrt7k+Og6wBROwrL8gVWuOnzQTUdYe2GXPNBwERp3xbr3lJJ3tdua7cLE
	aqOFvXi1Bheg/dEP10A80o56dqNNJ90leMeo2lHWJhe9f1+GHZbauTOUaSiYHVajc8DcTBL82c5+u
	mdxjYpaCTZGAa2BPcEZ3KdWvG531OId0xpU78DAHQ9BqEyKH0JdC/qVkvfg97SfxrHus9p0b9FjPg
	lqdO3vcXtgct5mBCssDt9EGnzkSZ1EZ5RvttLrPmYlTeKeL6UnttxCsV4OIA+VUThe0CQYoQ55luO
	1aRdk4xDF+0COEiCOB6g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ghtJz-0003oW-M3; Fri, 11 Jan 2019 09:41:47 +0000
Received: from mail-oi1-f196.google.com ([209.85.167.196])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ghtJv-0003mu-Kk
 for linux-amlogic@lists.infradead.org; Fri, 11 Jan 2019 09:41:45 +0000
Received: by mail-oi1-f196.google.com with SMTP id t204so11699624oie.7
 for <linux-amlogic@lists.infradead.org>; Fri, 11 Jan 2019 01:41:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lq5kxItlnpnFbfKz4N5S5DXe16Fa09lPVZ+gHUIVQH4=;
 b=QwTq/yLCrLNlhSf95jqPdez5XMuHL5a9DGtZKcrDf2oV97VT25FT6v91fWKm44H+qT
 AaPoJjkacydLz8iGiZBYU1aDfq2PUVyssu0gJ6scjCBj/yYY2d01i7HymqB3mhf5qlPE
 cO6juFS7Q7NuAkR1SL9iu/hRLjXH4TAHlwHLSsbzsL0qTfPeteVSbxmUl4gzWHyU1fxH
 q4aRqiuH/C8StzDTFIHbgdS2tWFJKds9iXCA1qvJESkX8aDtwueMX6ATgm9sctPfuzeI
 XNcJkQ3uUTQrCPIfslSnXUW9gcCUw3xRHLsUY0Hhwv7Xz2FaY5GhYVaKtjIPyHacUDdS
 xt8A==
X-Gm-Message-State: AJcUukeaAzh0Jdc7P8415i5aunLuW5kFqgzWgSjQZ0np1gFy1V3vmnQD
 1JpmorAkPqqQKdIFcVFTTRX7Ha6uJmDZqdyr7KU=
X-Google-Smtp-Source: ALg8bN7WN6InQu+GEgdjDknIBEwAQMOcMxBtRyBgo8GHQNnxyS0fIoCurmwPZLHW2hLaR++Vt2UPA44PmCBsqW2Jf5Q=
X-Received: by 2002:aca:6c8b:: with SMTP id h133mr8866617oic.33.1547199702255; 
 Fri, 11 Jan 2019 01:41:42 -0800 (PST)
MIME-Version: 1.0
References: <20181221162341.9847-1-jbrunet@baylibre.com>
In-Reply-To: <20181221162341.9847-1-jbrunet@baylibre.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 11 Jan 2019 10:41:30 +0100
Message-ID: <CAJZ5v0jaGwxcLf81R0eeLmoaJbUpPr9g6OzN38hWPfyX4C_6Dw@mail.gmail.com>
Subject: Re: [PATCH] driver core: silence device link messages unless debugging
To: Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190111_014143_683349_FC3F5837 
X-CRM114-Status: GOOD (  15.31  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-amlogic@lists.infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, Dec 21, 2018 at 5:23 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
> On platforms making a fair use of regulators, the dev_info() messages
> coming from the device link function are a bit too verbose. The amount
> of message will increase further with the clock framework joining the
> device link party.
>
> These messages looks valuable for people debugging device link related
> issues, so dev_dbg() looks more appropriate than dev_info().
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Reviewed-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

> ---
>  drivers/base/core.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/base/core.c b/drivers/base/core.c
> index 04bbcd779e11..8d330f921ad7 100644
> --- a/drivers/base/core.c
> +++ b/drivers/base/core.c
> @@ -301,7 +301,7 @@ struct device_link *device_link_add(struct device *consumer,
>         list_add_tail_rcu(&link->s_node, &supplier->links.consumers);
>         list_add_tail_rcu(&link->c_node, &consumer->links.suppliers);
>
> -       dev_info(consumer, "Linked as a consumer to %s\n", dev_name(supplier));
> +       dev_dbg(consumer, "Linked as a consumer to %s\n", dev_name(supplier));
>
>   out:
>         device_pm_unlock();
> @@ -327,8 +327,8 @@ static void __device_link_del(struct kref *kref)
>  {
>         struct device_link *link = container_of(kref, struct device_link, kref);
>
> -       dev_info(link->consumer, "Dropping the link to %s\n",
> -                dev_name(link->supplier));
> +       dev_dbg(link->consumer, "Dropping the link to %s\n",
> +               dev_name(link->supplier));
>
>         if (link->flags & DL_FLAG_PM_RUNTIME)
>                 pm_runtime_drop_link(link->consumer);
> --
> 2.19.2
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
