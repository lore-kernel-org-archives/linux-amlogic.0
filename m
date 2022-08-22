Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C7D3C28D13
	for <linux-amlogic@archiver.kernel.org>; Mon, 22 Aug 2022 05:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LgOY/DLPZoFnSY/09ktBj9R4wYm/6z6uZITYCwTbF10=; b=c7W3KW5xW8vrGz
	JAAzzHBrPErOBRKUmo8tJl95DSedqHMYfNWzUBOhQI9BZ13vvRViu9HTH6GTKdinf0DWsq1UclgPI
	HaMGF8li5jByPJ0wMKmVSZe3uG3JHsfGW4ZuBQGWPpXuLBA0W1JIAUAnUh74lVpXut//1oqJEMz32
	sk64YDLGjfftTU7lTUB2C4H/FDm3DjqAmR6iPfq9TxeOJf6MTCPtkxlue1prMlmK0bgFKUTMIkJ3K
	OF2qAOVvo10217D9l0qzDrWqQDfjV76byg+4h1DgqhIevWHrVGtcYy7fIvlAKJMAm2e7lZC4qSglV
	GfcT5L//grkqqzePEDdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPznJ-004wSf-7O; Mon, 22 Aug 2022 05:16:13 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPznC-004wOT-VD
	for linux-amlogic@lists.infradead.org; Mon, 22 Aug 2022 05:16:09 +0000
Received: by mail-ed1-x530.google.com with SMTP id b16so12360950edd.4
        for <linux-amlogic@lists.infradead.org>; Sun, 21 Aug 2022 22:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=9XRquiKtczGZrdHPEqA6WSyvm81oF4bOEAQ+13HYerQ=;
        b=SAiIxcHb4kUDUc3VEa2ho1tzuxThoNNZY/1Uy6ob5cxWpDMAgeWid7qhh1JGHzMGbM
         adHSfp3pJPdwumkTe334GAsPu2EKY2zVf0ZgMGTJDuJ3SrI6UEqh91/qCHuGRXQw1snv
         /1e79EhM6MjTf5SwV0uMLfQFrJ1HoFYfZpqvevvweqdEzjyYFlZtmV/EJfgjhfVj3EUi
         0XsC/T4XkSWokdnUY+/CPOVzfVcr8ThORv6pb4680aMO7Op76cXl+fqJrMS3ioeO09hy
         SzOT7E/D2WeM6kDvgcsmWkGn1PHym4wj8/UETx7DyE0Kmsc+CgU2T07R9NxHLpKuhXhA
         8OYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=9XRquiKtczGZrdHPEqA6WSyvm81oF4bOEAQ+13HYerQ=;
        b=MMZiyN+5I8QNU2f3B4sB5UVh4NZHQKxdCNoiV55JsBOXm+TxBLjCCie/EtE/5AZR8M
         rvLMkiwUvdaGqtX1r9Un3ikPo+Xz7Xo7C3DxWtO2ZMveu0DgilkmCNwjSVHkxgG7goK3
         /QRaX0p/7JEEr3hoLKS0deSE5oij70C20E57OgcrsR/bUgjHFoAfrXK6vCWx8UgoPlk5
         Y1a32iZelWgFupvPhls/UZKH70YfgbVCdpM6g0J1w6FarB7xTXfthriBRAWUx9dPyhmb
         Eu9ydxJbmvyrXpMlJzX77hIK2+v1ft5rsgedSTa6cUSRHIYUebe/Lt7IiNVYgl7VLXpJ
         oRFQ==
X-Gm-Message-State: ACgBeo3a8HaU9nwtoOYrSqZrPrbwlz45Fjskh1UO8Ikr6fSyBAjgcK9s
	TKRjleNUAoRYT4LGtNWFhbhhq90ecWJnElKLgtbInw==
X-Google-Smtp-Source: AA6agR6LybaPwlMMl65wRvlyq8H6WWQJz/BQN9DIdJiuMLxwbfIvJqdASIjHGPhvc2W10vBYnlWtHxkr+SF+OLGyRk4=
X-Received: by 2002:a05:6402:42d3:b0:435:2c49:313d with SMTP id
 i19-20020a05640242d300b004352c49313dmr14569874edc.86.1661145364525; Sun, 21
 Aug 2022 22:16:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220819060801.10443-1-jinpu.wang@ionos.com> <20220819060801.10443-18-jinpu.wang@ionos.com>
 <CAFBinCCbjF_mkV+EaOtC0g_YbtX9TzBEN5fRJ_MiPaie5hxCwQ@mail.gmail.com>
In-Reply-To: <CAFBinCCbjF_mkV+EaOtC0g_YbtX9TzBEN5fRJ_MiPaie5hxCwQ@mail.gmail.com>
From: Jinpu Wang <jinpu.wang@ionos.com>
Date: Mon, 22 Aug 2022 07:15:53 +0200
Message-ID: <CAMGffEnmGPDyuPPhWN0vyTMOtCHzfOo-Je=dVJ6ed7494ekKgw@mail.gmail.com>
Subject: Re: [PATCH v1 17/19] mmc: meson-mx-sdhc: Fix error check for dma_map_sg
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-kernel@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, 
	Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, linux-mmc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220821_221607_423572_F7B6580B 
X-CRM114-Status: GOOD (  12.46  )
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

Hi Martin,
On Sat, Aug 20, 2022 at 7:26 PM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Hello Jack,
>
> first of all: thank you for this patch!
welcome.
>
> On Fri, Aug 19, 2022 at 8:08 AM Jack Wang <jinpu.wang@ionos.com> wrote:
> [...]
> > @@ -388,7 +388,7 @@ static int meson_mx_sdhc_map_dma(struct mmc_host *mmc, struct mmc_request *mrq)
> >
> >         dma_len = dma_map_sg(mmc_dev(mmc), data->sg, data->sg_len,
> Does it also make sense to change the type of the dma_len variable
> from (signed) int to "unsigned int" (a few lines above)?
I double checked, it seems a good idea, I will do it in v2.
>
>
> Best regards,
> Martin
Thx!

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
