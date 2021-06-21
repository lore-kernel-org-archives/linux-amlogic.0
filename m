Return-Path: <SRS0=jJRA=LP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE4EFC48BE5
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Jun 2021 07:21:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A50E561026
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Jun 2021 07:21:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A50E561026
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YsQNqga3wV6vnW9YSzwLDLMzT6WS4bq/Qxw8tk3VoIE=; b=h3i9HEDy1BZlU4
	aS0OTshT/ypIUruNiO3PwsdBJCB6dR5QUuBzjHJ5htK/pkQ4fyBuCgowSyJ60Kq5Tc6JOYe15F63a
	InC4+qMUjnFNhHhhAMm0ONQ/reM31X05XESuN4Qzpwa5Jne2HZ92eKZkOxSXB990JTiXZeEJzNAVM
	K+u0hRsBG+9WGJG0m5+DD8EF77hHDKDNF9kX+A8w5RsfuT1/cueFRexRGzP7D7A3w3hsyyU19sOXB
	GhZ92LZPLD6jAbi1wQyLtj26iZ/9xw/LgZ/QV0zwceqfgGrKCKewQUyGRsNfvyXeyhRWaINaZEQv1
	FBerzmToXslnanC+qg3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvEFQ-002Skg-V4; Mon, 21 Jun 2021 07:21:32 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvEF9-002Sdq-UQ; Mon, 21 Jun 2021 07:21:17 +0000
Received: by mail-ed1-x530.google.com with SMTP id i24so6812553edx.4;
 Mon, 21 Jun 2021 00:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Mbnpi+F4BB/za1oZMA5jK8Z4P2+DO3unM76FgufrKCk=;
 b=C1wLOHrY+8yhoDafdxlC+Y0cECMb7v+XjOPS3rH+P2Q1WcsO3W3Ujeip9PHRSxraJA
 n1DY1bRWGnPiGESaP7X8wiyJDg06t+h2dXdFHbUtF4k9gfMm5yfuJU+CXRAZhaVZD5Px
 ZM+sxnjmJrFVWLCZVITVK/u6ClhSfIoAXb2aFrx0890J65fENt6EqvO7oeib0Il388wH
 Sfr5jRmp66bSmL6MwLDac09qoxIypuUlznhLJE3X+sh+ggRAu1WLccmiruaTk+5vJQEp
 Cr4gHD8jcdHk0X8OTlyjizOPF0jZv6vzutA/QjWdcBWZc3epT5HKoMeew2lcb9fws58c
 p86w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Mbnpi+F4BB/za1oZMA5jK8Z4P2+DO3unM76FgufrKCk=;
 b=DTNMODGUIYSS7RHD3GnRH1Go+KHA7hEYe7dFoVRwbjH0JildtTGmafbUJ78J5pE2cP
 4TVL0EPh93vLLlHSQoQo9X03rlRFXLWynvQ+FxJaqDwi08EkgWW3G3kIXzbpyJNmfZg8
 YSz77x+aHhYL61sJV/3aGpzwpU4mMzdEl17X/8usganRiKVXA4um1Ku6iwCCCbJ/z1Wq
 nnt6ZessUl4F7FOfnVKuoh77Go6jYnpnv+yGMagWg+AN/nChq7ZleXpX55wxP5uDDgpS
 wLIzvYSPMsNLe95nim72+Id8WgnToo6hnLNUG2DXhbf8HliYbPmlWCt8TmvYs+VlsvlB
 TW9w==
X-Gm-Message-State: AOAM532CjOZoZi7ws9sMSs58ACQ9jnCHVWbEYnwZ0nh1oD7t0QUaBeC4
 8/iqifSLDCPDdlOUOuovJ2zXKMLg/YbakLPgJBs=
X-Google-Smtp-Source: ABdhPJzlIsUmCD7QxdwFQ9JK241Kbhh7qVixABRLmzZHYhoNnheWKO0m38DxzqM0PUPXsxCYX3EZhXqDzI0UcRcRofI=
X-Received: by 2002:a05:6402:3581:: with SMTP id
 y1mr2055328edc.31.1624260073558; 
 Mon, 21 Jun 2021 00:21:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210617194154.2397-1-linux.amoon@gmail.com>
 <CAFBinCDVnBApYziHazeS8f2FXHQ-tUS55-g6B22c20OtfYD=xw@mail.gmail.com>
 <CANAwSgQcVDdPMZjuaN4O1dpVDd-KrNCGLDq0h4vfP4YZ2vSV2Q@mail.gmail.com>
 <CAFBinCA0-M-P5bWMKmMTq+Kgx+iEBpxirjWGxpaQqR3pfn84Fw@mail.gmail.com>
In-Reply-To: <CAFBinCA0-M-P5bWMKmMTq+Kgx+iEBpxirjWGxpaQqR3pfn84Fw@mail.gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Mon, 21 Jun 2021 12:51:02 +0530
Message-ID: <CANAwSgQnW6RknOjfn2q0avggG7VLwEo+LaxUdbfTw1v17g5UGQ@mail.gmail.com>
Subject: Re: [RFCv1 0/8] Meson-8b and Meson-gxbb USB phy code re-structure
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 linux-phy@lists.infradead.org, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-amlogic@lists.infradead.org, 
 Linux Kernel <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210621_002116_050907_1CBC6BCD 
X-CRM114-Status: GOOD (  26.19  )
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

Hi Martin,

On Sat, 19 Jun 2021 at 01:47, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Hi Anand,
>
> On Fri, Jun 18, 2021 at 3:20 PM Anand Moon <linux.amoon@gmail.com> wrote:
> [...]
> > (some email id got messed up while sending these changes.)
> it happened to me before: don't worry, it's something that can be fixed
>
> [...]
> > > > Initially if we connect USB HDD at initial boot it get detected.
> > > > but after that usb hotplug of USB HDD is broken.
> > > > I did not observe and USB debug events messages to trace the root cause.
> > > >
> > > > Another issue I observed is increase of USB interrupts event
> > > > even if there is not much activity on USB ports.
> > > > I tried some clk changes but it did not workout for me.
> > > I suggest reporting this to the dwc2 maintainers and asking for advice
> > > on how to debug these issues.
> > >
> > Yes I have enabled the CONFIG_USB_DWC2_DEBUG
> > to help debug this issue but could not find much clue on
> > why this is happening.
> I think CONFIG_USB_DWC2_DEBUG is a good starting point.
> For myself I came to the conclusion that the dwc2 IP is too complex to
> understand without additional information
> Some additional information can be found in public datasheets of other
> SoCs which are also using a dwc2 core, see for example RK3128 [0] or
> RT3050 [1]
> That's why my suggestion is to additionally ask the dwc2 maintainers
> (which are not Cc'ed on this mail) for debugging suggestions.
>

Yes, I will investigate with mode debugging and Cc USB maintainers in
the next version for more details.

>
> Best regards,
> Martin
>

Thanks for these inputs.
>
> [0] https://rockchip.fr/RK312X%20TRM/chapter-26-usb-otg-2-0.pdf
> [1] http://static6.arrow.com/aropdfconversion/aa9a14376a75e7c5d6daa9f6aaed8411909d2021/rt3050_5x_v2.0_081408_0902.pdf

Thanks

-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
