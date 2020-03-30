Return-Path: <SRS0=cow0=5P=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B60DAC2D0E9
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Mar 2020 07:11:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8791C2073B
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Mar 2020 07:11:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VSuve5gQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="oPp+I+mz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8791C2073B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5NDkqlmIhLeTsoJy6Dfs0Vd6oZuoK6H6OHQDixFegRA=; b=VSuve5gQVTpLtx
	BGCauZsuJK0XWRItVHPXiY+q5uztVwBob5+ikLdJAyBoO9hP2nZQQtE/xyFIefcMi1Q6OIeyAyH/E
	kKZHurfKmtv0djqOsbpdCu7sGnCYP5l+eVm3+M03YZQRGs3btxhKkdOxyrFgaNaeVnrBeooi3gScQ
	OuQRQpYHIGCUiI/4KuSXeRqeNHwsSfpdTkubMLubC7idg/MV7EJVKGxxcFY1BpJtN6mpz1j/pnkOz
	oMsnrAHV8XbtDCoJqNMJNQvDBENUiMEWuL+QGuA6sR4debhOMtdqN/xU7FJmXkGoli6Rw0ixltiSZ
	s0V2cLdPdsUe28FyUaCg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jIoZs-0004AK-57; Mon, 30 Mar 2020 07:11:20 +0000
Received: from conssluserg-02.nifty.com ([210.131.2.81])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jIoZp-00049g-4N; Mon, 30 Mar 2020 07:11:18 +0000
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com
 [209.85.221.182]) (authenticated)
 by conssluserg-02.nifty.com with ESMTP id 02U7AvjY029925;
 Mon, 30 Mar 2020 16:10:58 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 02U7AvjY029925
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1585552258;
 bh=hkMe26g7xlvZHHpLSXHK4NtsfOWPZ3tdB27BX4Gdox4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=oPp+I+mz1Zy3dMJu1DG1J/OuZx6GQ0LKyyaftGbmcdZRQGSQhsRM5J7b9z04BimiF
 dVDQRd4VsNqQgAFxI8xrLtuOVZqzSR+afIeX2l7xiPTXvvFVBR8WqP8xrt73QX6p7B
 8iqWKVKKRNPrzbRnmAnD+riMmCBNwvT/oDHMHTlDvMD0CiKd6izFoDt2QOFT1NlblQ
 uRJ9HtSeioPn3Lfvq8BXaEYCEIDn9ufBulL9pxXgL2PgnWBJmRfNAwOCmYFsmzVwCd
 ZNmml/c32C2Ks2C4J76xjDPMTY/zFDHylpXzXxehTy9QoDn5U3g/GHwZg0RVUop0AL
 QIRc8+nDR/dVA==
X-Nifty-SrcIP: [209.85.221.182]
Received: by mail-vk1-f182.google.com with SMTP id s139so4366131vka.13;
 Mon, 30 Mar 2020 00:10:58 -0700 (PDT)
X-Gm-Message-State: AGi0PuaOqatRAh/3BuFOaOB/T7rVc+oNyMRU/AUaheF+mi3SDw6hdPvI
 tAexfinlEa0SB+i+qWtO0JGzZTCEJRRvuvKq538=
X-Google-Smtp-Source: APiQypLNZL0F1SjmrpxCYWMM92Tc2B289mmJ4nqnInP/lERMnXKF0z9Hs/o7lbsUDIM38rMhrwxOtOM94wAMTS6itNI=
X-Received: by 2002:a1f:3649:: with SMTP id d70mr6296693vka.12.1585552257254; 
 Mon, 30 Mar 2020 00:10:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200325220542.19189-1-robh@kernel.org>
 <20200325220542.19189-4-robh@kernel.org>
In-Reply-To: <20200325220542.19189-4-robh@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 30 Mar 2020 16:10:21 +0900
X-Gmail-Original-Message-ID: <CAK7LNASHkBoOP_uGXLuO-UT1JL-rN3od_L+F4cB0SRPCzQCyKA@mail.gmail.com>
Message-ID: <CAK7LNASHkBoOP_uGXLuO-UT1JL-rN3od_L+F4cB0SRPCzQCyKA@mail.gmail.com>
Subject: Re: [PATCH 3/4] dt-bindings: Clean-up schema errors due to missing
 'addtionalProperties: false'
To: Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200330_001117_391697_58594B62 
X-CRM114-Status: UNSURE (   8.80  )
X-CRM114-Notice: Please train this message.
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
> Numerous schemas are missing 'additionalProperties: false' statements which
> ensures a binding doesn't have any extra undocumented properties or child
> nodes. Fixing this reveals various missing properties, so let's fix all
> those occurrences.
>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> Cc: Jonathan Cameron <jic23@kernel.org>
> Cc: Hartmut Knaack <knaack.h@gmx.de>
> Cc: Lars-Peter Clausen <lars@metafoo.de>
> Cc: Peter Meerwald-Stadler <pmeerw@pmeerw.net>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Kevin Hilman <khilman@baylibre.com>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Guillaume La Roque <glaroque@baylibre.com>
> Cc: Zhang Rui <rui.zhang@intel.com>
> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: linux-clk@vger.kernel.org
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-iio@vger.kernel.org
> Cc: linux-media@vger.kernel.org
> Cc: linux-amlogic@lists.infradead.org
> Cc: netdev@vger.kernel.org
> Cc: linux-pm@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---



>  .../gpio/socionext,uniphier-gpio.yaml         |  2 ++


You may have already queue this up, but just in case.

Acked-by: Masahiro Yamada <yamada.masahiro@socionext.com>


-- 
Best Regards
Masahiro Yamada

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
