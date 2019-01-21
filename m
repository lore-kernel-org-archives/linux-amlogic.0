Return-Path: <SRS0=UU9i=P5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 206B6C2F441
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Jan 2019 15:52:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B9B420823
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Jan 2019 15:52:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Mj9+H9hu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ILLKqWAS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6B9B420823
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OK/c3XAZvkbNkfckEwSyWa7++enpg01N0h8AnZa0Jys=; b=Mj9+H9huwvxlCi
	7JLXO5EkRMUMJjO/3r2R2FBZiAYsRxWzgMLRZc/qeJ8YPeUsp2FEd/UcBf4Q7/GZyheLtUuDloMIK
	pLnKbhxx2vGxBmQ56gJW7mU1MYhna/L/OwkJH8TtKkXs+zqP/JHHz0ScU3dlCARVNsptoyojDCgHH
	jLjb3mp8ng9qNeJALEviIIz9CswJ6x/6B5SIh8BMcy4NqzoEjKhbngwAzRH8kxU0fW0ovLkpGYTRH
	DuJxU6S/XO1e806hSNu8zhLAzTQhWianC9i0gh1W0m4IToCN9os5c3Zn2VS9tlI1l80mlUSPKBr9e
	Z6eENsRds+JCrgm6+suw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1glbsG-0007m3-50; Mon, 21 Jan 2019 15:52:32 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1glbcS-0008OD-S4
 for linux-amlogic@lists.infradead.org; Mon, 21 Jan 2019 15:36:16 +0000
Received: by mail-wm1-x341.google.com with SMTP id p6so11209404wmc.1
 for <linux-amlogic@lists.infradead.org>; Mon, 21 Jan 2019 07:36:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=gsIWm4YAdMzHSFkBaQakNMAM/i+/75SJ59wg5CyuTfI=;
 b=ILLKqWASQ9GcKR2KmgabCHMcn46Kt5Fqhi2/syIf+dzthSJObEKL8UGqxkPZNRKvKj
 xJ+vc2PTmx9jVMhHNB/8a9ICOlw4Q2MyNWfzlhvwGjgzyMbXoe6g9A0elSruMdLlQy3f
 IShfp9EepVvSyyqsZgp5Y3t6Gb8zWX5nahtgjwtXRho/ygMcvQ66iPBiwiJ+jm9nVOJn
 FaQGesxObRFiUQ3phpy8r16CXDSrtucmxK3/laDVdj+CzKK8JheB667GFHA7TUudQRSl
 EVYESiK+Jk4954Pum4iM6qAr04VR/9d1PyJ0UFV48nSW4tMaFHxxPQbuZJVZX/+4fAWB
 YcIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=gsIWm4YAdMzHSFkBaQakNMAM/i+/75SJ59wg5CyuTfI=;
 b=ui6umKapA7b5MjbpVJFMF8cbFwDkoghgmbVjDYiRXxdLXffWU0Nwm1QXW5Gf/LdbcC
 N53/lHObBC8KgFrLepShAE+k6m+CCLQZE8bgcQjKkfGkvNLM9TMCyuR3tGx1c3mwlqhh
 l6RLl6xmGun+u+eABLeptwEIJ1neCbHWzqYh0CCO5Bgm9wzwnMaNqTQxi+kd4w3kRNRw
 58k9OJYTnm6s1soVRuGdpzyHrU/xN429XMoXA94d7mX+fJmObDxgxz/IptzgiM4nonJr
 H/TkwBSU+OfbU7CGCwmfmhgYeO05jmBGBJqbOP5cFVA+IVglAwtmDWQXWh0g7MmR+K5K
 RyUw==
X-Gm-Message-State: AJcUuke7zgx8Bd7nxaY+IvlHU0+aI+mY1XwQjpJqFq+rfrVWraIminOm
 FdqYbTniAI6M2yDvi5djK/eniA==
X-Google-Smtp-Source: ALg8bN4287u8JGodm32UPUcS7IXUrJK558ctFhFfap4xkwzei3zdL2VvgHfNTD0/Yf9x8Fs+Q5yHyw==
X-Received: by 2002:a1c:6e06:: with SMTP id j6mr26187811wmc.3.1548084970525;
 Mon, 21 Jan 2019 07:36:10 -0800 (PST)
Received: from boomer.lan (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.gmail.com with ESMTPSA id e27sm108804445wra.67.2019.01.21.07.36.09
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 21 Jan 2019 07:36:09 -0800 (PST)
Message-ID: <a434c3b1c55a1b5a1485adc29cfe26b45131a936.camel@baylibre.com>
Subject: Re: [PATCH 0/3] pinctrl: meson: g12a fixes
From: Jerome Brunet <jbrunet@baylibre.com>
To: Linus Walleij <linus.walleij@linaro.org>, Kevin Hilman
 <khilman@baylibre.com>
Date: Mon, 21 Jan 2019 16:36:08 +0100
In-Reply-To: <CACRpkdb7pje9mrgOQoiWTRxGQC8xsOvJ9a8PCguM807unPtpCg@mail.gmail.com>
References: <20190117102315.1833-1-jbrunet@baylibre.com>
 <CACRpkdb7pje9mrgOQoiWTRxGQC8xsOvJ9a8PCguM807unPtpCg@mail.gmail.com>
User-Agent: Evolution 3.30.4 (3.30.4-1.fc29) 
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190121_073613_158000_8F0CA549 
X-CRM114-Status: GOOD (  14.86  )
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
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open
 list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, 2019-01-21 at 14:53 +0100, Linus Walleij wrote:
> On Thu, Jan 17, 2019 at 11:23 AM Jerome Brunet <jbrunet@baylibre.com> wrote:
> 
> > This patchset fixes the initial pinctrl support added for th g12a SoC
> > family, which is mainly around the register regions claimed by the
> > driver.
> > 
> > Linus, would it possible for you to provide a tag with these changes to
> > Kevin ?
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/log/?h=ib-meson-fixes
> 
> > ATM, we can only use the devices for which the pinmux is already set by
> > the bootloader. Enabling the broken pinctrl driver could cause regressions
> > in kernelCI. Having a tag, would allow us to start using pinctrl on this
> > SoC in this cycle, w/o regression. It would be nice :)
> 
> When you say "this cycle" do you mean I should target fixes (v5.0-rcN)
> or next (v5.1) with these patches?

I was referring to the 5.1 release but it is a good question, I did not really
think about 5.0.

Those changes are mainly fixes, so guess it could go in the 5.0 but support
for this SoC is still in its early stages, so either way is fine by me. 

Whatever is simpler for you I guess ;)

> 
> Yours,
> Linus Walleij



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
