Return-Path: <SRS0=arCo=SG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 879A0C4360F
	for <linux-amlogic@archiver.kernel.org>; Thu,  4 Apr 2019 03:41:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5476A2133D
	for <linux-amlogic@archiver.kernel.org>; Thu,  4 Apr 2019 03:41:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ninw+gcD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YfPok6IO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5476A2133D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VF0x6RbuakQBIqcUya+X0aNxe4KxLI/avWByBija0vs=; b=Ninw+gcD1Ri0yD
	SQT2AJusn/bOvFrWeOI8HZWG/4qY+LRXDMsdAWvuddeLmTCU5tdC0Q3BT+ygffBhYFNlmOwQ8lLST
	DtSieJgT0D98kmNHjiAJILUehio3YFX6ep/ld/hsTkgADjLFlky1f+3rqNsWeX98bT0M28hfMAsOI
	hRvICin/+u4zr3rQ297Hf4pzcIZBdKYUb+PU9vG4MxaOm3eOXGptPBRyfG+a5fMgbu3/NCbyclMVV
	M5fSrKTThR+cjST6lOiQgYkVQNJfRPhdXlidpzwR4oRME5mg1wcdYWQqfOUJ9MflUkISmNZrp3iDg
	3aS+FJXdDhrfpxmDP5eQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hBtFh-0007TK-TX; Thu, 04 Apr 2019 03:41:21 +0000
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hBtFf-0007QO-KJ
 for linux-amlogic@lists.infradead.org; Thu, 04 Apr 2019 03:41:20 +0000
Received: by mail-lj1-x241.google.com with SMTP id v13so743734ljk.4
 for <linux-amlogic@lists.infradead.org>; Wed, 03 Apr 2019 20:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1n3vNyf2Cpl+mI4a9w2n20PNikLsfrphaPgu96srNGI=;
 b=YfPok6IO8vKE7hBaL71PCRaGkCdMagS7QR2HypB6bqjTMLbGbXxs8V0p6VvgYogGLM
 nOBuBEYbEMW+50hO3gog9keaK1s+oz2Z4RmUOn21ajca+Ssrqe5QL1w0skk/Bzoh55ia
 Y/VKKRb+CPVtFLrLlInFm6X9mvTL0cwfewk02uDwnjLO/D9GBUE6g4Z7OfWkPIlrNjI6
 pHtcDDNWQjNan+XGuFvtGDf9J+iofDu9O2KtR2xW32ByOuc2nmltR4n0GnXbeGiFtcmv
 5fRAUaKKG0cTArcF9nR2pRbjH8rfRn1nQyVDbHj9PUuV6QZgn073JSXjLC0EJKNdkG9b
 mOBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1n3vNyf2Cpl+mI4a9w2n20PNikLsfrphaPgu96srNGI=;
 b=tnNpdTV2lPzOAgYTcloPQdPmIQi9mR4pjnjutbWo2+HOivG/+265v6Z6X16PRlZncd
 9CxdG2knHzMqdZzZRRbFPkx7LUHC5GRNLpMppkqHVcQef6UBIpD8lSUEGjZO91/K7A8b
 pSDf9/XvQlB26oLmMNB/zo97zNFo5S2dmlLwe0xy81Pefjz4gAEJszlX33cFnkjTQ2kK
 8lvrnVXWu+MgMXR3N+whwrw8Mz3jGAxCI6+pFOhqGgiHWzW9oXpa+KpJrFmbvJdWoOxk
 MTwea3QgLKqioxh5uZ2u/V0kQbNnFKLKS8N3/j8s0L7UdpinjPaNYI3EXjcAqXmAGixR
 WlXQ==
X-Gm-Message-State: APjAAAW5oxOXEIWng1O6TITUXQlzuWfNp8RTeSdYhXm0msUbvRt04Q1I
 o2+JgBxpZdYtgRNM5SEX7BYvBS+g9N1sihO+ucRdzQ==
X-Google-Smtp-Source: APXvYqwq6cI/I6as+O2M5gIyEEVWrjmp5qU7fGuvVIEo6BxhMR39ALKTiLBEMv59FXhB5GSdUDq24O2JVfsCMiPRMcU=
X-Received: by 2002:a2e:9d12:: with SMTP id t18mr1778098lji.163.1554349276108; 
 Wed, 03 Apr 2019 20:41:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190314163725.7918-1-jbrunet@baylibre.com>
In-Reply-To: <20190314163725.7918-1-jbrunet@baylibre.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 4 Apr 2019 10:41:04 +0700
Message-ID: <CACRpkdYdRfm=OLmfzZeJEXpfOdnxg=YE+yAexHTh_-EePBtxaA@mail.gmail.com>
Subject: Re: [PATCH 0/2] pinctrl: meson: add g12a drive strength support
To: Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh+dt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190403_204119_668824_5082BC63 
X-CRM114-Status: GOOD (  16.44  )
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
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Guillaume La Roque <glaroque@baylibre.com>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, Mar 14, 2019 at 11:37 PM Jerome Brunet <jbrunet@baylibre.com> wrote:

> Now the slightly annoying part :(
> The value achievable by the SoC are 0.5mA, 2.5mA, 3mA and 4mA and the DT property
> 'drive-strength' is expressed in mA.
>
> 1) Rounding down the value, we could be requesting a 0mA drive strength.
>    That would look weird.
> 2) Rounding up, we can't distinguish between 2.5mA and 3mA
>
> To solve this issue in this in this v1, we chose to document that, on Amlogic,
> drive-strength is expressed in uA instead of mA.
> It works well and there is no impact on the other platforms but I'm not sure this
> is really OK with the DT rules ?

I want the DT people to say what they think about this.

> Linus, if this is not OK with you, here are 2 other options we are
> considering. We would be very interested to get your opinion on the matter:
>
> 1) instead the generic 'drive-strength' property, we could add an amlogic
> specific property, 'amlogic,drive-strength'. It would be expressed in uA
> and parsed in amlogic specific code.
> I think this option is kind of overkill. Expressing drive strength in uA is
> not really amlogic specific so it does not make much sense, but it would
> work ...
>
> 2) Add another generic property "drive-strength-uA". The change to do so
> would be minimal and could be benefit to other platforms later on.

I would go for 2).

But we really need input from bindings people on this.

Yours,
Linus Walleij

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
