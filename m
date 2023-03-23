Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1215C76195
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Mar 2023 12:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ruUzGQvuiAAW4tDex7IvJyxxOoX0OgvunPMKGfmJAnA=; b=asjBkostlv6mYG
	bMP1GO+ILXsX2jqwbjqgsRTzPWODEKpdiYzk5NNC7V0a5HfFog3iQ0SjiN8DArss/HfyBdI0um7bc
	61ChBccxqwRDmjPXU4C8FOZyY/cv0DUmky1AMfe+tRPzyXxfr1Z79KWetevhe7tSZP9R1XXTwsJyI
	3CX0CCD62KF4gwnUtSoDtKAoFwoBBdxA2C1tuvvdgi7gA8N4ty0Ni88h6zlu7FqEON31U2g6RjPir
	9Dli+2UHRoVvkk8sNaOmxonk+VKbTYx+nx5ZhpCAVbNAEqOHjDqaOhfzqYZf0I8D/VRrKvDen7oXb
	KKlQ0XITtBmYIA9zygnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfJoo-001rR1-2Y;
	Thu, 23 Mar 2023 12:13:22 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfJom-001rPF-0o
	for linux-amlogic@lists.infradead.org;
	Thu, 23 Mar 2023 12:13:21 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-541a05e4124so391628697b3.1
        for <linux-amlogic@lists.infradead.org>; Thu, 23 Mar 2023 05:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679573599;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=B16rkBzYZJZIfz4nN7+PWbHREgEhvwGKHJmdyTrsREI=;
        b=k2ifNPIw6jZmT+vxBj0rBix73jWXTZN0h3AfOkyQHtFhSj3Jj7elh66U0cUmGaHAVn
         t5hitmZqnDNjc4UPFgGDaeFRJZD/9XDdqVT+DR2641WqEwrs6DIIwJGLZpDJBB1qQQEL
         0NRVIxt2nJaZypantK+ZzS+7GC4oCxKKp8jv12uGWNRsziJaCicZbicbbFRPb11z0JDu
         mua2IKj+YxkIZw199HF3xCKfkprYAynziguTCiPuBYgEKwRoca1NFU98pbijFpelDj3E
         XdqpNIx9rpwBamToMFg/YQB5WLidhcaVs8GvvUWK/KLWs7O2Wu3vo6noUzL0Udo/xe9X
         hFDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679573599;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B16rkBzYZJZIfz4nN7+PWbHREgEhvwGKHJmdyTrsREI=;
        b=zdltivH6gudHaG7TqPXflQX5dC44vIyc6PWJnj902+5KPg+flVZbamZofwV2xbNuzD
         bITS5d6HHDs1JbfseApqzQwYcXV+kZemmgEGyVAn2Ew1YR3rrvjBqZdJO0rLNG3yWsIJ
         NKLuy8IJ5AP9sa1/BWxo+9QndAWGukrQwAtCUQ55lb19WoPW2qlnrXlA66HS3uLxCcW1
         c6L8RHtX3x9EEgm+HTD47T4l/5HZkEp8ccI01z8zDJGaPYMNj5hN2ktO+mFf9NmLDN3L
         1POZjb5KOI/Ztnbe+OqPcf2XteGBMxRg4Ip+1nrNxo06qBnnsLGWODZLE2ZQ7B4qf/HP
         bPpQ==
X-Gm-Message-State: AAQBX9el6eEwRVbGxZ6buwCxQqgVS4ex8P6wwOip/pUYTfrVVBAYyOF7
	nYKF6iDrWqDAWkM/5sAFtv3Dku++TiwgA7Wac1iOdA==
X-Google-Smtp-Source: AKy350aFlkEwble08xseD9G21q1vBGsScCuffbA9Q9Buw614fzfZsHTiZNLse3rFreSeUsVuVKHGGdKSlsaz6Pn4+oA=
X-Received: by 2002:a81:b344:0:b0:536:4194:e6eb with SMTP id
 r65-20020a81b344000000b005364194e6ebmr1735646ywh.0.1679573598613; Thu, 23 Mar
 2023 05:13:18 -0700 (PDT)
MIME-Version: 1.0
References: <9ae6f90e-e1ea-d088-cdae-7dd8a541f00f@gmail.com>
In-Reply-To: <9ae6f90e-e1ea-d088-cdae-7dd8a541f00f@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 23 Mar 2023 13:12:42 +0100
Message-ID: <CAPDyKFq_P_7gzuH3c3TGhRcWfujFqP2KiEnbwevZYp9fW0nVtw@mail.gmail.com>
Subject: Re: [PATCH 0/2] mmc: add and use helpers mmc_regulator_enable/disable_vqmmc
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, 
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, 
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_051320_293371_6B0BC2F6 
X-CRM114-Status: GOOD (  11.25  )
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

On Sat, 11 Mar 2023 at 23:38, Heiner Kallweit <hkallweit1@gmail.com> wrote:
>
> There's a number of drivers (e.g. dw_mmc, meson-gx, mmci, sunxi) using
> the same mechanism and a private flag vqmmc_enabled to deal with
> enabling/disabling the vqmmc regulator.
>
> Move this to the core and create new helpers mmc_regulator_enable_vqmmc
> and mmc_regulator_disable_vqmmc. Make meson-gx the first user of the
> new helpers.
>
> Heiner Kallweit (2):
>   mmc: core: add helpers mmc_regulator_enable/disable_vqmmc
>   mmc: meson-gx: use new helpers mmc_regulator_enable/disable_vqmmc
>
>  drivers/mmc/core/regulator.c    | 41 +++++++++++++++++++++++++++++++++
>  drivers/mmc/host/meson-gx-mmc.c | 18 ++-------------
>  include/linux/mmc/host.h        |  3 +++
>  3 files changed, 46 insertions(+), 16 deletions(-)
>

Applied for next, thanks!

Kind regards
Uffe

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
