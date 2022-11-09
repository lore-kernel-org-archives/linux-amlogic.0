Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B34CC4332F
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Nov 2022 12:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gun2njL8znkPNBTVPhiernWEhhzXowSjwW7OmB3g6Qs=; b=Vk4CLvCBzF1x6S
	jf4IYQTP5rDcRfxvM4E1xP08oc/+dlq2ieuXvrllDJNvuQA5GO7fF1+mctTf9CRj48noNIiAno2Z5
	cX2srJXxsjTQhr12js4l4DC4cIk4tfZ6R80UgDzDncpUeueDMk/m5YPh+6fA+UVu8gmhcfoU8N7g4
	nmB7QPChys0n8dKuCEQhwGdBLDGs21ITSToMznwkSBYo8KbT00FZtkxZD/2kViTHmydjCRJFSfnvj
	95ZKBlldzVJEBBAoZ1g5Wn6R9+G+y2NtUeExEFa3FTsLjZp1W2K1MlFdnvoqj+jegZ03YYcclAZ1+
	QDNbu7ldxBNDArQ0l4cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oskIM-00DPzA-Qr; Wed, 09 Nov 2022 12:35:06 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oskIJ-00DPvs-SY
	for linux-amlogic@lists.infradead.org; Wed, 09 Nov 2022 12:35:05 +0000
Received: by mail-pl1-x62c.google.com with SMTP id c2so16944705plz.11
        for <linux-amlogic@lists.infradead.org>; Wed, 09 Nov 2022 04:35:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=J+VVT+VZ5tB8LbvzqUOspyGnKu6apApc/p5DRNAwVag=;
        b=NxdQSEF8CvIZKuxcpZj+IRKRLwAAB4KqELxfYFTZJBYk8skLBiL5ggjyzeTSj+sKqV
         tiD9ga1cuf4C9I/ZL8/1EnvAGZA9xYMY3+2ApwVHRzFOXPmim9S02eJb77AXQtMV+MoD
         ZgLYI/miqSaIO6PNH1FQzQkSVv7wxorXom+xL/bQ18m2H9VC1/bTrRDUTgGimgCUK+7Y
         oTz3SDi5UaqpfN/oMLFYhLYAHls9Grwie8jpyYPrIbNIR/LEr37N3Il5GGkVd4SoScmx
         SYNaXdCUivsJ0s0np5nTjXolzJP/ttDPsvmlu+nWSIiQz6Zd8bmrB6E++zwBoaHvxcjk
         QjoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J+VVT+VZ5tB8LbvzqUOspyGnKu6apApc/p5DRNAwVag=;
        b=Hqe2StqdktGu3HAHrNdiT/0DBQ99kWOah0NiYDJ9jEN//VUGm+J76XUD0PIZFoZryy
         yPjjXoFK602Te/cBdRKiQoiu3irNPiNj0JdBv/RFaoKY0DiO9AINo55LuLVO3ITH2zZ2
         EVcO7gcA8ODHJNJIYojtjM3eaGNy0/fogMIKvXrQBW/eTkE0LvM67E+OkqzUgv0skJ9t
         Rc/zt14zRbVatkUBAA/N7hNXXJ4fzpl9Qrz07GQFJ9sHRChLCgNO4SnetFMd2x+8mOC2
         eqDJ44SKIPlu8aIRdThEkAFcJenGZQwd1AcH0WCTw6qpCbYcK8eJ9EBR6HrI8EhmkS7w
         YkmA==
X-Gm-Message-State: ACrzQf10/Te2mzmlsWzM5QgeQIfh7pwUJws5YFmA+eyAnpQpvPbH05Cd
	nFWDsImyUbHwY+5k2v5Za//3A0AfAgxzE9LURIwtIA==
X-Google-Smtp-Source: AMsMyM461RMVaPce/sghU2UJg9EnIvxKKF00CGE8IYeYy23QI0Zg1kLC7oC/A6wUyIRsRVKunFtnlzp3LNlnUNxIGUg=
X-Received: by 2002:a17:903:100c:b0:186:63a1:3b5d with SMTP id
 a12-20020a170903100c00b0018663a13b5dmr61929278plb.148.1667997300263; Wed, 09
 Nov 2022 04:35:00 -0800 (PST)
MIME-Version: 1.0
References: <20221108123417.479045-1-yangyingliang@huawei.com>
In-Reply-To: <20221108123417.479045-1-yangyingliang@huawei.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 9 Nov 2022 13:34:23 +0100
Message-ID: <CAPDyKFq0RwWiH5uYqUZsjy89f89fMiFbcOhJ6L2V5zf6HYCR1Q@mail.gmail.com>
Subject: Re: [PATCH] mmc: meson-gx: fix return value check of mmc_add_host()
To: Yang Yingliang <yangyingliang@huawei.com>
Cc: linux-mmc@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, 
	martin.blumenstingl@googlemail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221109_043503_944683_B14D2979 
X-CRM114-Status: GOOD (  18.42  )
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

On Tue, 8 Nov 2022 at 13:35, Yang Yingliang <yangyingliang@huawei.com> wrote:
>
> mmc_add_host() may return error, if we ignore its return value,
> it will lead two issues:
> 1. The memory that allocated in mmc_alloc_host() is leaked.
> 2. In the remove() path, mmc_remove_host() will be called to
>    delete device, but it's not added yet, it will lead a kernel
>    crash because of null-ptr-deref in device_del().
>
> Fix this by checking the return value and goto error path which
> will call mmc_free_host().
>
> Fixes: 51c5d8447bd7 ("MMC: meson: initial support for GX platforms")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/meson-gx-mmc.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
> index df05e60bed9a..6e5ea0213b47 100644
> --- a/drivers/mmc/host/meson-gx-mmc.c
> +++ b/drivers/mmc/host/meson-gx-mmc.c
> @@ -1335,7 +1335,9 @@ static int meson_mmc_probe(struct platform_device *pdev)
>         }
>
>         mmc->ops = &meson_mmc_ops;
> -       mmc_add_host(mmc);
> +       ret = mmc_add_host(mmc);
> +       if (ret)
> +               goto err_free_irq;
>
>         return 0;
>
> --
> 2.25.1
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
