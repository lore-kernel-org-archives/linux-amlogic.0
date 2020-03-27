Return-Path: <SRS0=gyfY=5M=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F3EEC43331
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Mar 2020 10:00:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95CD9206F8
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Mar 2020 10:00:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Lal9cDAw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cWW3YcpE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 95CD9206F8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vDo0FUhsfXaWuCzmmdfb6MNbMlozZxyo/wK1LFZNebM=; b=Lal9cDAw3YmaGU
	U82S+pS+stYnOsCnlaE1bzpE4dmOGOI/K0NtJSfaBvyttpBkDWI9iHZreotvtFtEjRddmRO6zvW+O
	FUM7VEhAV5qbuJadPx8/fnf49U+Nqoqnf42j9eSZWcEN/IOIlz1H4RjBeshrqATmhqSpilUXHEnhx
	cLR5LmLKOA7Qk2MJO1mUkli27nfG3ZWQqO3GhxaptoThhHEh+w6zCWEZc9b4Fvuq8041dzdTll7o9
	taqvIdEgxA3phuY5L8n+OUi2ckjMEaGQ0ki1Y1QhcsBGLGMw90z3uPr5daCbkQ+52LIjjKnlOAzeb
	jhMrDi8oyfUwWx3H3q3w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHlmR-0007Sa-TT; Fri, 27 Mar 2020 09:59:59 +0000
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHlmG-0007Iw-9c
 for linux-amlogic@lists.infradead.org; Fri, 27 Mar 2020 09:59:49 +0000
Received: by mail-lj1-x243.google.com with SMTP id w1so9529348ljh.5
 for <linux-amlogic@lists.infradead.org>; Fri, 27 Mar 2020 02:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iT9ew65Ai4POSw9apePAlYbX2sb+iJXvkgJnQxpRw0g=;
 b=cWW3YcpEyyYutTrNo9KR9HBH3E1bK+HR2Lj5S1ufOBfKm/JNDbVKgSTehtTbK/piG7
 AKjHnGwyvO2icmwsa3kFw6Zy9abidGdYmBJm7RwikCnCpiGoaqgq5m3bGu0GFONHPovH
 s0c/WvnYnPEvbNXNyKweaiea++yeq0zcHNyQfUxojaI3SyGLY4+iyWjDQ0x68SaY8Drf
 JMetNVWiEP6KTRh7NjcfaAuyl0sKbJRnuDYUHwbVm3S17ouQgtixys00HdZ8IS96Ovz4
 pek6sQ78KGlTRqT5w9MPDkgc2TCFzKlFMmuVNKZoTHdy8naS5UOmiEGTokrk8DVStpkg
 Jd4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iT9ew65Ai4POSw9apePAlYbX2sb+iJXvkgJnQxpRw0g=;
 b=GitAWZrfdsxa2ctOveEaFpdi4KmNg6m78MMCqnV6hU35r+ppmWjVQHYvt0eMiWilOD
 ghtfoepwiL7fCr+yWWM0skb/qkPo+rLMgZyqCQLaYoWLOysQGLu6FjaKBWwq9DYgmz5t
 A7BJwaJkfW0Npfdvb0kk143ldM9JSlsARjw3vYgmK5wJ9DidFiJLqQ8qX1CbZlBlUkiu
 CYK/szB09wAaaGLp142Ny84C9MABWTbEH73yzmDoU/kgjf30bXOfwG+/cUKMoIaLV63L
 4NHO2r5skSaGl1g0BlfFvqSZC0fvqLKIEu8/RJFuIWef9IGPs4ziH7u+DbA6GYL8XWxi
 kZmg==
X-Gm-Message-State: AGi0PubHXCBDs7z5lo/7luFHI9oxzMpDjCXZzbknioMYshVUvB5yVumg
 Oc97YoAPyLo+zCKD4tQDvxis2QO3M2zAsDhTlQIcug==
X-Google-Smtp-Source: ADFU+vsFTyW5diEMQrZ6oc8ojCeBX7BYjVmipZYNTS3SNNq4tTiZwvSWUqKgPn07Ht2NDQ7OLG9B8uptAVDDcyFhwxQ=
X-Received: by 2002:a2e:9605:: with SMTP id v5mr7685010ljh.258.1585303186378; 
 Fri, 27 Mar 2020 02:59:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200325220542.19189-1-robh@kernel.org>
 <20200325220542.19189-4-robh@kernel.org>
In-Reply-To: <20200325220542.19189-4-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 27 Mar 2020 10:59:35 +0100
Message-ID: <CACRpkdbWeKjd6B2mLz3+7LOxSGP9FqSz6YRp_YHx+2qHkJVFCQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] dt-bindings: Clean-up schema errors due to missing
 'addtionalProperties: false'
To: Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200327_025948_340535_78FC7384 
X-CRM114-Status: UNSURE (   8.64  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 linux-iio <linux-iio@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Guillaume La Roque <glaroque@baylibre.com>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Lee Jones <lee.jones@linaro.org>,
 linux-clk <linux-clk@vger.kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Kevin Hilman <khilman@baylibre.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Zhang Rui <rui.zhang@intel.com>, Brian Masney <masneyb@onstation.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Michael Hennerich <michael.hennerich@analog.com>,
 Linux PM list <linux-pm@vger.kernel.org>, MSM <linux-arm-msm@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Stephen Boyd <sboyd@kernel.org>, netdev <netdev@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Hartmut Knaack <knaack.h@gmx.de>,
 linux-media@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Jonathan Cameron <jic23@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, Mar 25, 2020 at 11:05 PM Rob Herring <robh@kernel.org> wrote:

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
> Cc: linux-iio@vger.kernel.org.
> Cc: linux-media@vger.kernel.org
> Cc: linux-amlogic@lists.infradead.org
> Cc: netdev@vger.kernel.org
> Cc: linux-pm@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>

Sorry for errors caused by me,
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
