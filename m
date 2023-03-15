Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A576C6FD1D
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Mar 2023 20:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=phLeBiKvWeShhN1ptRydP2J+sGzVPoyE9yGetvjd5LM=; b=X6PTokz1p9PPWh
	ffuKzxlgADcLYg+i/basP2WkCrxMhx819yjTB8f9FDe2+aT0exu0rPGwRtN+KcuHSkQZR6GLqPBWY
	L2RknTBaocpuIGpqBtl7pzYFRT5CDsmvwc2ah4XmdX1Z8G6+Uc3j3kDLTp52sY5WltPDgWLG7Z7i5
	Dh4pveWW9uPB7iU+Y14BUQISxvFGpoktsDbKNvZPclfIPpdjluqQElpIHvmiT4doxh+YscQ6sEzqu
	DsBJ/IRZXTWLCQqWhOkEYRm0fhoxw1t+4mDIQLQHVEEC2l9NZJCLIuJKvJ75dBgn5MfAW0OKG2Dhl
	UUQVXBFoyOrcmbQPnScw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcYAr-00EPmc-0d;
	Wed, 15 Mar 2023 20:56:41 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcYAo-00EPm4-01
	for linux-amlogic@lists.infradead.org;
	Wed, 15 Mar 2023 20:56:39 +0000
Received: by mail-pl1-x634.google.com with SMTP id p20so21406183plw.13
        for <linux-amlogic@lists.infradead.org>; Wed, 15 Mar 2023 13:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678913795;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=z84vdnHiRqRhIyxTsu5Pz3PgSNNcE2YtTRegy9XPJ4U=;
        b=W0vzKfbMSniEwUYBLxk3WHtG0hSZCnLx2K6R6OlCD0LwPHcI0RDH6i5waZnhw9kJzn
         N3XxS+LMwYpLw3zKzLZPvpq8kQbRpVBxQOd0cp9yJQVqsiq5nRqcaGYfttvvc9jZLvu+
         2wIFNiJQfVJFYf0U4AHxZloaqEy1T5MoLmCLMGxaAnvp04Ne3OesL8QVJAJ+jx3cBf7m
         NYYwyY8hVUVn2y3ffHY34baOVwfd/NaDuKLK3XWSjDFD27zMPhmXLoQIm4kLLo51y6Xw
         6gJqZw2LHxrwGkZhWstqT66lXaSHngVWk76252J05fblP/2/0CGeXg0WtXLs2euihfi4
         PhTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678913795;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z84vdnHiRqRhIyxTsu5Pz3PgSNNcE2YtTRegy9XPJ4U=;
        b=Us9oUMD/Cpu/2WDeZBBiupAIzwOwj4BODPWFT/OHxWtnYfDR3HMpd4WqaHsdvCfX8V
         XqwDzwoNr9zPD6BFVE4YC5FtDEiPv4jHnFC+TeDamSdmSrtXqbuTV0BKHtQaYUE3DuCp
         JY3qt3kensDSQx2eNLt93tMqsNYiAbsB6Q/3ptrgaUbDshrcuwH6SzxnduHb4FaPNJyX
         L83HxZcawkOltuyg3VdvhzhjkF9Um123dQV+KTGhlIjxUhwrQDyrLfB0Qo0CCRBDdJjP
         jhn/tAYxwd4rsBkXWVzBemU2opdG3yMj3yN0+WCxY17yEta3ytKWVToXspYJyMqDkDvK
         jwIg==
X-Gm-Message-State: AO0yUKWOsUAwkdcDVWVWww1wrPdj+FW3ynK0jgoGmPEdjxlamBurQBz1
	Y3FaCJdaNKOUnxNtLv+sLK9AKiL4D/Gf4ZJ4AGxlJQ==
X-Google-Smtp-Source: AK7set9Lqxc9Zjf6HNWj3hSvkV7xlNAl2GlygnkcJoOS+b4e1BHgUEzRwsa+zk5UtznFzSacYBz7tBCLaD6lhJ72m+A=
X-Received: by 2002:a17:903:25d5:b0:1a0:4847:864c with SMTP id
 jc21-20020a17090325d500b001a04847864cmr377557plb.13.1678913795246; Wed, 15
 Mar 2023 13:56:35 -0700 (PDT)
MIME-Version: 1.0
References: <05977cbb-8a8f-0a67-b4bd-b265dbb83280@free.fr> <895a3812-e490-cc40-0f8e-a88e166e8f24@linaro.org>
 <c1a215cf-94be-871b-2a8a-3cc381588f83@free.fr> <13676dcc-944f-cf3d-8adf-ee3d4e8fa699@free.fr>
 <e5baf73b-3b9d-1011-2ed9-4b6fc7ee644f@free.fr> <CAPDyKFoAT-jMkYb7=m--q_eEb2xxH-VPQy5vaHNvw4s=WiAeCg@mail.gmail.com>
 <0450e34e-7190-104c-832a-150f15f7c825@free.fr> <3d91a067-c9c3-6d71-11a7-1289ea67f109@free.fr>
 <eecb86be-81e3-09cd-8ec7-4e77c42f2795@free.fr> <CAFBinCDHRhLSyFsEv7cdhSgZorj-TdR3HhqSBnAQcUtEsecV=Q@mail.gmail.com>
 <6ac1ecb1-eba4-b0a3-579c-afcbe532a474@free.fr> <CAPDyKFrC3a5-VP2DvCYGYUzKtX4Jc7cvNQOKfutW0sha=szOyg@mail.gmail.com>
 <c7e48c6f-530b-7198-b8bb-fc927a2fdc66@free.fr> <CAPDyKFpJR9rgadXEBn+73FKgmLM8sZgzNbKV_x_udwOSRGH44Q@mail.gmail.com>
 <893311e7-6fce-118b-a683-6988de161698@free.fr>
In-Reply-To: <893311e7-6fce-118b-a683-6988de161698@free.fr>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 15 Mar 2023 21:55:58 +0100
Message-ID: <CAPDyKFotQ3hVHM379f8yp7LBcyN6zGTz18x3X07_mx4mZsAh+A@mail.gmail.com>
Subject: Re: [RFC PATCH] brcmfmac: add 43751 SDIO ids and initialization
To: Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Arend van Spriel <aspriel@gmail.com>, 
	Franky Lin <franky.lin@broadcom.com>, Hante Meuleman <hante.meuleman@broadcom.com>, 
	Kalle Valo <kvalo@kernel.org>, Eric Dumazet <edumazet@google.com>, 
	Pieter-Paul Giesberts <pieter-paul.giesberts@broadcom.com>, Alexander Prutskov <alep@cypress.com>, 
	Joseph chuang <jiac@cypress.com>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Angus Ainslie <angus@akkea.ca>, Pierre-Hugues Husson <phh@phh.me>, 
	linux-wireless@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230315_135638_085638_E13E4F3E 
X-CRM114-Status: GOOD (  15.17  )
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

On Tue, 14 Mar 2023 at 17:38, Marc Gonzalez <marc.w.gonzalez@free.fr> wrote:
>
> On 14/03/2023 12:08, Ulf Hansson wrote:
>
> > If the delay is to manage vmmc and vqmmc, which is somewhat part of
> > the generic specifications (SD/MMC), then it should be described in
> > the host's node.
> >
> > A pwrseq is something special, which is also platform and device
> > specific (the SDIO device). If the delays correspond to this, it
> > should be part of the pwrseq node.
>
> Uffe,
>
> Wouldn't it make sense to warn, when probing for a non-removable card
> returns nothing?
>
> Something along these lines (which I can spin into a formal patch)
>
> --- a/drivers/mmc/core/core.c
> +++ b/drivers/mmc/core/core.c
> @@ -2257,6 +2257,9 @@ void mmc_rescan(struct work_struct *work)
>                         break;
>         }
>
> +       if (!mmc_card_is_removable(host) && !host->card)
> +               dev_warn(mmc_dev(host), "no device found");
> +
>         /*
>          * Ignore the command timeout errors observed during
>          * the card init as those are excepted.
>
> Regards
>

Seems reasonable to me! Please post a patch.

Kind regards
Uffe

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
