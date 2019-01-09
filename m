Return-Path: <SRS0=re6n=PR=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 507C4C43387
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Jan 2019 18:31:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2269620665
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Jan 2019 18:31:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="e+EjPj4/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="IY8xSVKB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2269620665
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=56AEHXU/2Lc4LCbSr0jiDCB65cXZ+sdxgso093CNAns=; b=e+EjPj4/n/g1n/
	RG82dJnQt1B6+y6KMYyjMxLKPAj+OPwrm/PkcZmOb9QEw/9TNQ/CyiCuxM2N2hp/KWnBjGQ7WOTwD
	83nmK9kJRkvRh0hp8NkUIoDpieC9ZSy4cSC26XrZ0wR04V72aguGcrnaD3nRMYMNPwqlrC5FZtNRu
	c2ONxDIpJt6gXVCb5RchXpm142YKCgNVyzMa0EM0vQuCxj6qTy4Nj2d6n83FgliUzer3tVdynKDRV
	C6casv61S7VlOjy1cDhE2rbESBemhGFcajW0924//94RYbWpVjBip0q6fjdj4CrCSHBBYaoVusD2Y
	Af11Hlw7ClHOZkesXkBw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ghIdL-0001Os-8E; Wed, 09 Jan 2019 18:31:19 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ghId9-0001Fi-Be
 for linux-amlogic@lists.infradead.org; Wed, 09 Jan 2019 18:31:09 +0000
Received: by mail-lj1-x244.google.com with SMTP id k19-v6so7328796lji.11
 for <linux-amlogic@lists.infradead.org>; Wed, 09 Jan 2019 10:31:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ce/DODD26yFEvlMGuasUOyI+VFOgUCm+7GsCPyVgRv4=;
 b=IY8xSVKBxUihEieMmiVeZWlluuxX+wotnXcvpzcCJW3eo+hdTOHWSsR5o5pDJCjBJk
 zPf/Mo9wlkwaAk1Pp8GgB91IMTBD1/17RbQ0tNVp/pLSlIEkaN5PAeS0715SXGIaTeNl
 1OHEzC1fC1LYVzESSkOwI9KWg09cg9PZa7uH8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ce/DODD26yFEvlMGuasUOyI+VFOgUCm+7GsCPyVgRv4=;
 b=Ff/cPpwotfmJ45JpV9LU69ca8/5A1erRX+HT5iMpfloxCPWONz88OiLqGr/v2l2L/o
 kXhWi53eKjRTP2Mf9OcLX5myKbFaHZD6ElMW3NlLGSNqDOjFev4NAKd4g6iv36pBDwTg
 BrYb1at4g41BIIzT7G6sR9bufubNifU1qTLK2dz7YEWhPcLSdEew/B8/ajuJcPL75/x+
 PcS2OmzDUxDeF47zWkH7JzEvmamTwWY6hLQTEDEWbBT+0KaNLW0+UhYupEe3GVznFh0S
 dA4Tv1JBgBWjIn0RSgEgNTOIjauFNM9641kSVf6dzjkRmJm21VhlbbnAFEWU/SHnefD6
 wymQ==
X-Gm-Message-State: AJcUukcQB4aa0WZb+QNtT9SX9prZjUIPMIfiDwjTHIuyJ60Y0sAXojA6
 aAKoNikXdCDwYXgbttS2Yfjy1pT5SZov78lNSyZ3oQ==
X-Google-Smtp-Source: ALg8bN4jIAccrE+Ui7PhA4BsjD7tt+eW6OjQ7jBZdVPqs7ct/u0Ni8dEYUBnmp98bWowikeVQrE1VRw11OmNeCaQhlg=
X-Received: by 2002:a2e:9849:: with SMTP id e9-v6mr4088776ljj.9.1547058665214; 
 Wed, 09 Jan 2019 10:31:05 -0800 (PST)
MIME-Version: 1.0
References: <1547042198-17601-1-git-send-email-lollivier@baylibre.com>
In-Reply-To: <1547042198-17601-1-git-send-email-lollivier@baylibre.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 9 Jan 2019 19:30:52 +0100
Message-ID: <CACRpkdbhVB7-Y9EBhBC6GAxqFt8zujS2QJ4CzGDJnDMDjj2Ptg@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: meson: Fix mmc cd-gpio polarity
To: Loys Ollivier <lollivier@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190109_103107_471052_7E608E3B 
X-CRM114-Status: UNSURE (   9.17  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Ollivier!

On Wed, Jan 9, 2019 at 2:56 PM Loys Ollivier <lollivier@baylibre.com> wrote:

> Commit 89a5e15bcba8 ("gpio/mmc/of: Respect polarity in the device tree")
> changed the behavior of "cd-inverted" to follow the device tree bindings
> specification.
> Lines specifying "cd-inverted" are now "acitve high".
>
> Fix the SD card for meson by setting the cd-gpio as "active low" according
> to the boards specifications.
>
> Fixes: 89a5e15bcba8 ("gpio/mmc/of: Respect polarity in the device tree")
> Signed-off-by: Loys Ollivier <lollivier@baylibre.com>
>
> v2: fix more occurences, also in other meson boards.

This is a good change in itself since it gets rid of some occasions
of the dreaded "cd-inverted" property. I think Martin Blumenstingl
already sent patches like these though (I might be confused).

But we should keep the old device trees working as well.
Can you test if Martins patch:
https://marc.info/?l=linux-mmc&m=154637189021211&w=2

Also makes your boards work?

Yours,
Linus Walleij

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
