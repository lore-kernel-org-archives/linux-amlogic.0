Return-Path: <SRS0=B1XO=CM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D3F4C433E7
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Sep 2020 08:39:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB407205F4
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Sep 2020 08:39:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NLHetCtW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KvJqMahN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB407205F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Qc9BaxlaWlPRXgu+cYF+DxryrdXgCMDRkXYRp9H4R4I=; b=NLHetCtWluurSv8hHeIJqIha8
	EYMmXB3ZuAc65DE4lw6b8eAErmbmix9dfwTl3+VIPjk4rxDlbtIuGGG9FptaKU5LUZNYwrQoXGK9q
	vlZjSyOLJMMSQ5+myGr/NeZPBreGplDLUpzEdaFPA1AC+oEVgYKm76Cs5awd7byOruAnUvGsu56Bk
	8kOdrg6TqYiMaVXqYQWG/yUvcKUy4WFCRm1iF3YnKcSKFTOGnFzatdQ7zqXvZNXt2SNCq3ImzSUY/
	lMvGCoBcb1Rpd1dKt9HpadvQq3/2blYX8E15zxcs5VoGtNrhSDrxBpgkaR0OCSaBrJTG5GG8I7T+J
	Wk1S42bpw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDkmG-0004rB-23; Thu, 03 Sep 2020 08:39:28 +0000
Received: from mail-ua1-x941.google.com ([2607:f8b0:4864:20::941])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDkKI-0007aG-43
 for linux-amlogic@lists.infradead.org; Thu, 03 Sep 2020 08:10:51 +0000
Received: by mail-ua1-x941.google.com with SMTP id e41so620540uad.6
 for <linux-amlogic@lists.infradead.org>; Thu, 03 Sep 2020 01:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=t0hPUkXrts5hGV+gelozsNVJL831/qNHHpNikRUOxRI=;
 b=KvJqMahNGmcwZQvnzuao4zxMTJwrZ0aVd7RcYrE6hPpss6ABBzXgZfiKyN0Dc1xt3w
 d3AvbT3tUsr7G6i3EtAwWd+0XJ5MPlSy7K4kK/NeDlm6/Oo+WgIIiY7uz1D6RIs5kRTl
 dKWixy9q/3zuVRU3M/njOSPnnFTjXipSJ87wGBJtH7eiTaBcdN5ZUFQbWqAfd7QPVhU4
 FWG6f+ssqAmxHxYlswVTrkTyEBATxmqcTZ+YR/6XiBmCPeZOcSHKQUO12y6KiBnU5dUR
 2oEVUql1QDK9sCgoP2ChziQt2N+GXUK0rLFjOpZPxVz+l1LqejH6ftYDaJh35vQI3K+P
 LMJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t0hPUkXrts5hGV+gelozsNVJL831/qNHHpNikRUOxRI=;
 b=TYM7J0KWyjfnVjHcwH0G6DmnKLEaB2DkY1fLQXdc5cPI4VN2og2Ue5sIvivUzawlri
 ZIx4Rs/e4HuQ9GxrgDjn4a3YE5ZpdrhvCFAKKJ4pZuovX+hXDXBkIF/Z1nKlL9Vtmlts
 w6j8/im/z5tetyoAwfe4HNeqU8R0O3HfSS6WdXms8XPboYvxDHlWx2GPVYGNkLxm+APR
 i7fB2iw34vC+GXC6xJ9FgHwBnVAe7gbDNPFm+K7i+45RGvP7r/LNOninYf0aS23epwUQ
 6DkHXC5VCGd2bOQrFtAvm3E2b8+wAzr5rqNHX+4V5RLQANQHTx8nInSnIwxukmSE2OL7
 IZ2g==
X-Gm-Message-State: AOAM530E99M1T9h89XAGgKclwaa2jEXtexKwCjui1A2hikrIaj7DJ8xZ
 w5ZJFKtlzSqaTENFzqWCqUlelRlbOCAucBV3VBL0Og==
X-Google-Smtp-Source: ABdhPJyGFXf2GrcMm01qExZWSJ7jPtSw9m1PN/7SAvsSK9s1ZS20v0pF9sjrlhSxNVUE5hh22/OySMNemS1iIc0OoDQ=
X-Received: by 2002:a9f:2722:: with SMTP id a31mr381930uaa.100.1599120631644; 
 Thu, 03 Sep 2020 01:10:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200902193658.20539-1-krzk@kernel.org>
 <20200902193658.20539-7-krzk@kernel.org>
 <d98f6b67-c0d0-f701-af24-b01f61c4580d@gmail.com>
In-Reply-To: <d98f6b67-c0d0-f701-af24-b01f61c4580d@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 3 Sep 2020 10:09:53 +0200
Message-ID: <CAPDyKFrp3GLLTjdSroyB9_QOcGM=JkFcsv3Chfgu2FSfATxGqg@mail.gmail.com>
Subject: Re: [RFT 06/11] mmc: sdhci-brcmstb: Simplify with optional clock and
 dev_err_probe()
To: Florian Fainelli <f.fainelli@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200903_041034_472367_21ACE75C 
X-CRM114-Status: GOOD (  15.41  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, Al Cooper <alcooperx@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Paul Cercueil <paul@crapouillou.net>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 Michal Simek <michal.simek@xilinx.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Jaehoon Chung <jh80.chung@samsung.com>,
 BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Ray Jui <rjui@broadcom.com>, linux-rpi-kernel@lists.infradead.org,
 linux-tegra <linux-tegra@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Lars Povlsen <lars.povlsen@microchip.com>,
 Scott Branden <sbranden@broadcom.com>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
 Jun Nie <jun.nie@linaro.org>, Shawn Guo <shawnguo@kernel.org>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, 2 Sep 2020 at 21:58, Florian Fainelli <f.fainelli@gmail.com> wrote:
>
>
>
> On 9/2/2020 12:36 PM, Krzysztof Kozlowski wrote:
> > Only -ENOENT from devm_clk_get() means that clock is not present in
> > device tree.  Other errors have their own meaning and should not be
> > ignored.
> >
> > Simplify getting the clock which is in fact optional and also use
> > dev_err_probe() for handling deferred.
> >
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>
> This is actually an open coded version of devm_clk_get_optional(), so
> this is fine:

devm_clk_get_optional() treats -ENOENT specifically, so it's not an
exact open coded version. I think that's why Krzysztof prefered to get
it tested on HW.

>
> Acked-by: Florian Fainelli <f.fainelli@gmail.com>

Thanks!

I am queuing this up for next, without waiting for explicit tests .
There is time to get that from testing in linux-next anyway.

Kind regards
Uffe

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
