Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B323C433F5
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Dec 2021 13:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VGx+IysSLtXb4G9617q/28F0MU4+jFsCj1UPuYwCpSs=; b=fI+U7Ja+cov/jr
	YzRG2YOmBMKq5JQs+QdgeFH12kOloV2tI6yX0ytKTQ0pvk5y+xWJItY1cAVBfNtq9h078+K67CvCQ
	t7J0xWWzfjjYuSURPk3Acmc0yCSgu5gZe5EPH+IAncr3ju+z28CLtJXV98hTMYMzZCUNSHoxuKe/j
	eL/Eg3HyR+HwC2wPA5n080tqsHaOMmhz9JVgkh8EP75gDJaE6xg33qc9Qx1Ub85kFgRgENdzmDfl+
	xFw3r3IqVegBat53f6+prZsmD9b4TuzXIeuWyNFVpPqogrFt9sPLd3GTgqwnZiyE7+EKs3wxCI6By
	Llz6Kcmv2DId5aQyJnGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzepI-006rFO-0w; Tue, 21 Dec 2021 13:05:08 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzeo0-006qgg-V2
 for linux-amlogic@lists.infradead.org; Tue, 21 Dec 2021 13:03:50 +0000
Received: by mail-lj1-x232.google.com with SMTP id a37so21272909ljq.13
 for <linux-amlogic@lists.infradead.org>; Tue, 21 Dec 2021 05:03:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wMhiWcyt3C3agW9WNYMlNJT9if+c4LmUGb4U5c05gKk=;
 b=a/sUpSDAdDrvtZCYQ/X3KUo0kWqRnuCF7xI2oBVZApm/IilNdOYWLTqCdBdYEaYVrK
 5JkEwBfLC957fT2ofqY5PE3TgC7gHmN7KWmHb45xufia0WyEJntiI+cj9kHeAqIUvEbB
 /pmhjtFI28lLR3fKr3hw8AGjfCJG5P4PW96BsLbbmHIcB0pOGBbdPtKYo4P+W9eGkfPG
 saYR1ZiVcLQsU7Zx0lSIDus/n3J+U3JbCoVHtRD9k1EQgv5Nk+6kvM7vlSUcqbItqf0f
 bgh3rE3wPQiZ/iVz/cO9FgDIm2tjsFZcBUJYhU4YQwuQx4E7eG0b/cjHiiLxKLZt7WSM
 61wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wMhiWcyt3C3agW9WNYMlNJT9if+c4LmUGb4U5c05gKk=;
 b=La1IAI2IJIh9u/ZV6SN3C35HpWIWS3icr9O8dXJsCK1MJIK+pWY5QQAfecOpfkoi3G
 H4bpBXD9pML1eIpaYeAF1ISFMzNvgez+p+96t1k8nTe5EGTiCfn5lRtLsFj8kr/UXyQP
 saTdSqSpJgOT1l7YYQOA2HReE9+2bE/7r35E+Z4gxR0Q7TQrUA6uGceJThUyrxUrTrkp
 XNchUryEj6yeTBpcWWrYAy0rolTHYIY3EmyGki2wTpeM0evkeDHQPp5CVaqs6KveFTHw
 inBC/5DjRzaxJFTcmsZ+lXm3plN7Owm6CYOVAGALV47bu5j/5/bKBC+ArUvMo72J8X7A
 9n4Q==
X-Gm-Message-State: AOAM532C+XQixVkopCi80WCiBJ02SSDPqNnMX09tiXLNIS9iaBaaR/xd
 OguLzSr1Zv5LXP1/UCdJEpj3mnFS8nzjCAc2eSUt2Q==
X-Google-Smtp-Source: ABdhPJxsLMOqAKppSLH9abPC07q7PTD/rFOMgPUTodejUrypm+XH9ou1n1RROg6+ygPROenDgcS6hUgBKCNNCra1f00=
X-Received: by 2002:a2e:80c3:: with SMTP id r3mr2592426ljg.4.1640091826894;
 Tue, 21 Dec 2021 05:03:46 -0800 (PST)
MIME-Version: 1.0
References: <20211217202717.10041-1-s.shtylyov@omp.ru>
In-Reply-To: <20211217202717.10041-1-s.shtylyov@omp.ru>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 21 Dec 2021 14:03:10 +0100
Message-ID: <CAPDyKFoxVEyVumKLQzXZvFSrkopbd0gR40ZgfvUMd_wME+eMWQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] Add IRQ check to the Meson MMC/SD drivers
To: Sergey Shtylyov <s.shtylyov@omp.ru>
Cc: linux-mmc@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211221_050349_073242_D6C0290E 
X-CRM114-Status: UNSURE (   9.68  )
X-CRM114-Notice: Please train this message.
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

On Fri, 17 Dec 2021 at 21:27, Sergey Shtylyov <s.shtylyov@omp.ru> wrote:
>
> Here are 2 patches against the 'fixes' branch of Ulf Hansson's 'mmc.git' repo.
> The affected drivers call platform_get_irq() but forget to check for the error
> case and blithely pass the negative error codes to devm_request_threaded_irq()
> (which takes *unsigned* IRQ #). Now stop calling devm_request_threaded_irq()
> with the invalid IRQ #s!
>
> Sergey Shtylyov (2):
>   mmc: meson-mx-sdhc: add IRQ check
>   mmc: meson-mx-sdio: add IRQ check
>
>  drivers/mmc/host/meson-mx-sdhc-mmc.c | 5 +++++
>  drivers/mmc/host/meson-mx-sdio.c     | 5 +++++
>  2 files changed, 10 insertions(+)
>

Applied for next, thanks!

Kind regards
Uffe

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
