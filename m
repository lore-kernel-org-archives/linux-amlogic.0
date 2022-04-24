Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51431C433F5
	for <linux-amlogic@archiver.kernel.org>; Sun, 24 Apr 2022 19:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d0Wfzw2rd4kOvNaSu7GYP78smcjTprqmVuO5tJ7Cu2s=; b=i6uahsrwkUDpck
	+qoJ5tiF6u5lMBLOjbMRmKXSDZTXiKJjLBnFBF6K1n4hhoq4MLvV0PoDt/9Bi+PQbMtn61mMewtKf
	o/q7N/GXeZvOAeuKpnZA+Am+OIV25PTpKc72MLgryKmomemh+7H1Whmc4gv67MJNIR0fbI/wj07+r
	Fdw1mkzxMrBtVMK8f2RHP7IM2DpUXRC8qUeSUwCx4ZFMgnHy8vdw3RNmc8l+dsqHcoAoUyJh6/G45
	Rq9WuLLszc9zWPIh7WRVVdS9YQS5OG07UukO4oVEMautFgR2gMbKj5bPtkiJU+Am9dEWTTxLIbu+B
	eyTnwKEQnnQP//qHUiBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nii21-007Hgf-LO; Sun, 24 Apr 2022 19:36:29 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nii1z-007HgA-2m; Sun, 24 Apr 2022 19:36:28 +0000
Received: by mail-ed1-x530.google.com with SMTP id el3so11360295edb.11;
 Sun, 24 Apr 2022 12:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yVOHIop480qd4Gr/LYjCSPrgKYLop4lt8wSVfH5qvF0=;
 b=TrUTwR7kbvxcWabpO31VkDST1D26rIHkqeg351cvGg9gtptLAvDealNIt/RGogS5Bh
 d3EhuP5daLZq54Bt2ZPHUdF8SzNbv8BpALtrktPx7wkDMRJQlRXMiNhXiFSeoUAl8OfZ
 1692tOWuiNTLpovvo90VfOT7jQhOslWy8QQgCeFjZjQMRsFbhtyfwxFDwlV6Pe5I+5DX
 c9r6RZaZspORLPC/LRc4aq7gs0cvaGENDsFdNreWwn9U/d+nvF2WV5lrJEjNP2gOYaPW
 Ip8nOiM1SEWXQYSyOTojv/vDxnovsZdX/g5N4uaUqPTkCDgWfIhyHrzo+kLD0AfkQdrD
 OHWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yVOHIop480qd4Gr/LYjCSPrgKYLop4lt8wSVfH5qvF0=;
 b=Bc/V+hHAQ/svD5kbVvtHaOGydF7Fnsb9RZnCGBxjV4xgdEt+5GVka8u5Y7xBdekVpJ
 u8Ku/qCySjA6+yjBx5Bsro6v9xl5zFOS8t06Ymxsm2q+wX3kwMAnxdl6s/2OltVXkX5E
 iFzKr2B4cttiJnker32IJEwr3srXS9f+O9WkejCoNcW1YQru1HVuPgDjKEaWtq2w5ght
 50Gjk+yNMvSN6VscPfFTjg+xu224ubtg+cYIUipw/fq+O9cXJMJIHM++LVd6uNzXsWoj
 CIfGylxV8BRQLdsF7aYWL/37bz16+anWr4i/3NgQ/nHBxDsf3RieVnh+CQMdltBE6tDj
 RJHg==
X-Gm-Message-State: AOAM5313gXlwjHqiK34AaijKFSRQ91YNdGGBQMUs5n+6SoD++/kX806G
 2dF+cgZxx4M1oCGDQ2mudmUexWKVA4nbA9+S4Z3dFbdY
X-Google-Smtp-Source: ABdhPJzEKN5IOZJlCldmBtOqeOCM2SeHaSYlmVF6btock30J6RluGq7St0OGRGpWdKOxzf5CvxRmm8BGyY/Ea+Dz7/o=
X-Received: by 2002:a50:ed0e:0:b0:425:e476:f4ed with SMTP id
 j14-20020a50ed0e000000b00425e476f4edmr2696289eds.32.1650828983747; Sun, 24
 Apr 2022 12:36:23 -0700 (PDT)
MIME-Version: 1.0
References: <tencent_FE734C50BC851F2AB5FE1380F833A7E67A0A@qq.com>
 <CAFBinCC=Dp4bXT9sbmT=ZTiVfC1Mj=oRVxeDXfKbDczq45iekQ@mail.gmail.com>
 <20220423022541.B12F3C385A0@smtp.kernel.org>
In-Reply-To: <20220423022541.B12F3C385A0@smtp.kernel.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 24 Apr 2022 21:36:12 +0200
Message-ID: <CAFBinCB+o1vBECV+q_VnDx8yZW_wg4yQ7d5m68B_iwPO+RzUbQ@mail.gmail.com>
Subject: Re: [PATCH] clk: meson: meson8b: fix a memory leak in
 meson8b_clkc_init_common()
To: Stephen Boyd <sboyd@kernel.org>
Cc: xkernel.wang@foxmail.com, Neil Armstrong <narmstrong@baylibre.com>,
 jbrunet@baylibre.com, 
 mturquette@baylibre.com, khilman@baylibre.com, p.zabel@pengutronix.de, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220424_123627_159241_AF0BCF2F 
X-CRM114-Status: GOOD (  15.75  )
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

Hi Stephen,

On Sat, Apr 23, 2022 at 4:25 AM Stephen Boyd <sboyd@kernel.org> wrote:
[...]
> > Also a note about meson8b_clkc_init_common() itself: failures in that
> > function will result in a non-working system.
> > If we can't register the reset controller then most devices won't
> > probe and CPU SMP cannot work.
> > If registering any clock or the clock controller doesn't work then the
> > system also won't work as clocks are not available to other drivers.
> > So freeing memory in case of an error is good to have, but the end
> > result is still the same: the system won't work.
> >
>
> Can we get far enough to record this fact into either a pstore ramoops
> location or the serial console? That would be ideal to make debugging
> early problems easier.
earlycon shows these messages (as it's enabled by the bootloader)
while "normal" serial console won't come up without the corresponding
clocks.
I never tried ramoops but I expect it to be able to log these errors as well.


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
