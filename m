Return-Path: <SRS0=cow0=5P=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 105D2C43331
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Mar 2020 07:10:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6C0B2073B
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Mar 2020 07:10:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aEkrsWYg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="1sthGaoH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D6C0B2073B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8jQakK1uoQHNMBwYo2+6VpDQz+Ak59rEYFtNVTQ437w=; b=aEkrsWYgS8BJgr
	vhJv5cbQdm3D5WHY66L09QEvkHLw/X6ToTYWei/xv2nFtZ54R6cwZdu3lgIOzk8wKLLjLgpVj4ZBG
	xaIEaePSkaxrA+DvqW9PchaXyHIPTikcZEHtiqqNF+lQFPmiLIswpjr9u+dHRR899LURCNeIm+wjw
	aTrlXvyLkeY3H8REcW7DrkGVCh2HKOncFSUwoq0RbWGZ3LvdcTZf/VE6lh5zmDUq49IG4adZfRRyX
	RmD18ZkKaLVDYrhIoR1fw4K55nyhGfrbt2UQomu/EIo3HV2FMTQjy+/qzyicvv0KNFq89UKNBRDB7
	Aau0hJL6wvp+xQ0bhAxQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jIoYw-0003qU-Se; Mon, 30 Mar 2020 07:10:22 +0000
Received: from conssluserg-03.nifty.com ([210.131.2.82])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jIoYt-0003pV-Q1; Mon, 30 Mar 2020 07:10:21 +0000
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com
 [209.85.217.44]) (authenticated)
 by conssluserg-03.nifty.com with ESMTP id 02U79xRc029741;
 Mon, 30 Mar 2020 16:09:59 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 02U79xRc029741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1585552200;
 bh=ln1CQt+YaUVnJf/8SbMK3iPTVvG1KE5EE/FUul8MWQc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=1sthGaoHw8qoSp3F/D3eH8NqZjk++zLNoSrFExAge5M5k4o6izC7znUZmDsjrR95d
 3LRi45OyZDxUKTfu4A/3P4aV5+yY39DtCxwP5T2nox/GAPp7PJ3ZaF7u226D4E6kMs
 pxp3tchjSZY1dsGYXfpp7Fyf63ssOrWN+V8tr3iI8kkkZhdSc6hQrcCJehpowCH1tV
 t5Ybjs0wWAwMh0SzhZruoB9o66WBYJD1t+qP7ZqRNrr7efxFSXjCoLMubpsREjCj3w
 uh2OG10xugvGzdVuKY1o+FeM5bjbz3bVeCv27FcaCEJ6WsaSLhERu5H58t5BiMZ2Xi
 G3vbpTZyiHDew==
X-Nifty-SrcIP: [209.85.217.44]
Received: by mail-vs1-f44.google.com with SMTP id j128so10319668vsd.6;
 Mon, 30 Mar 2020 00:09:59 -0700 (PDT)
X-Gm-Message-State: AGi0PuYXZQS+fQhfbbyeRQbcnksYHX4o4kpapq3/huuCXksEg895DOaj
 t/NzCpAxYM5LJv+uWDXJZggJ2wDQ38Ai/wzEdQE=
X-Google-Smtp-Source: APiQypLmGnB9GmkGFIr7L8MQtdRTKDMNPR3ere0jKX6O5/r2adqpWFQ5TPcwWpLgYxRGXDf4dZ6YCv27RE8dCFz54+s=
X-Received: by 2002:a67:2d55:: with SMTP id t82mr7452280vst.215.1585552198446; 
 Mon, 30 Mar 2020 00:09:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200325220542.19189-1-robh@kernel.org>
 <20200325220542.19189-5-robh@kernel.org>
In-Reply-To: <20200325220542.19189-5-robh@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 30 Mar 2020 16:09:22 +0900
X-Gmail-Original-Message-ID: <CAK7LNARJn4uugHxcjK+WOWBs0gPVZQsCu4y6M8hkNK1U5FehRA@mail.gmail.com>
Message-ID: <CAK7LNARJn4uugHxcjK+WOWBs0gPVZQsCu4y6M8hkNK1U5FehRA@mail.gmail.com>
Subject: Re: [PATCH 4/4] dt-bindings: Add missing 'additionalProperties: false'
To: Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200330_001020_102349_E1739945 
X-CRM114-Status: GOOD (  11.59  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-iio@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Guillaume La Roque <glaroque@baylibre.com>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Lee Jones <lee.jones@linaro.org>,
 linux-clk <linux-clk@vger.kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Kevin Hilman <khilman@baylibre.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Zhang Rui <rui.zhang@intel.com>, Brian Masney <masneyb@onstation.org>,
 DTML <devicetree@vger.kernel.org>,
 Michael Hennerich <michael.hennerich@analog.com>,
 Linux PM mailing list <linux-pm@vger.kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, linux-amlogic@lists.infradead.org,
 Thomas Gleixner <tglx@linutronix.de>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Stephen Boyd <sboyd@kernel.org>, Networking <netdev@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Hartmut Knaack <knaack.h@gmx.de>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Jonathan Cameron <jic23@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, Mar 26, 2020 at 7:06 AM Rob Herring <robh@kernel.org> wrote:
>
> Setting 'additionalProperties: false' is frequently omitted, but is
> important in order to check that there aren't extra undocumented
> properties in a binding.
>
> Ideally, we'd just add this automatically and make this the default, but
> there's some cases where it doesn't work. For example, if a common
> schema is referenced, then properties in the common schema aren't part
> of what's considered for 'additionalProperties'. Also, sometimes there
> are bus specific properties such as 'spi-max-frequency' that go into
> bus child nodes, but aren't defined in the child node's schema.
>
> So let's stick with the json-schema defined default and add
> 'additionalProperties: false' where needed. This will be a continual
> review comment and game of wack-a-mole.
>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---


>  .../devicetree/bindings/gpio/socionext,uniphier-gpio.yaml      | 2 ++


You may have already queue this up, but just in case.

Acked-by: Masahiro Yamada <yamada.masahiro@socionext.com>

-- 
Best Regards
Masahiro Yamada

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
