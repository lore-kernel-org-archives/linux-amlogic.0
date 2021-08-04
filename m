Return-Path: <SRS0=RlPG=M3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A44E0C4338F
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Aug 2021 02:13:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4EA0C60F43
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Aug 2021 02:13:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4EA0C60F43
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nQ+JrCLJRX4ctpBR70bTJ6+JBtqoxQp9KV0qvyhOW/0=; b=Sw2SsNeltkr221
	UDMNIayseO9RojK7/z9xd8pHsDCllILeDOAlTYS7yuMDYACyvvED09bSbaZz9o4cB6CfJCD8EnHrC
	kfGJcYJPGeggA9IzpPt7DCN4YRVb3IzIutEVU+ruu4/LwCQ55CT7U+50UfxyLbANCh8FLb7Yrnnuy
	sEREVr4rrBbJ1uun0ILs/gM4BNDuo8SA0jvDPlGFEko4v2WXbp/t5dNGqsTLU6U+k/JpqZr01ctz7
	SJeV9OfJO0PPGbzrQ9+0xFcg+cQUeaMlcwS4r5Jc0YYVa3XP3ffKiJ3qa8IK4faVJu3V8NoAkyYVH
	boz0D+KSXT9U2bbNEBGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mB6Os-004ch4-EW; Wed, 04 Aug 2021 02:12:54 +0000
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mB6Of-004ccU-Fr
 for linux-amlogic@lists.infradead.org; Wed, 04 Aug 2021 02:12:43 +0000
Received: by mail-yb1-xb30.google.com with SMTP id b133so1764008ybg.4
 for <linux-amlogic@lists.infradead.org>; Tue, 03 Aug 2021 19:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Sm451czZd0rWklvsSmqNKdExE0Oj2B0x8c+hMELIQJ0=;
 b=LO5hlyuJnToPkkXBhogL5LHyT5V9JfEPAsQnS4Vq36uK6+Kc6QRqhIZIQFQ6kqSfb+
 704Lh8LXVFCYj8eEYADECGLuYS9F/lBJroIYFqRFj5aRqgYdv3tRzP9LW9BS4yOPS1Q6
 7G5YhqLaMNCQd9Sv1xBs5lWGFZ+3oIlCxNijBYqQpx647ZfX2rEYR++jyrSOQYkkEFVS
 bfSt7sP0PMi4ZQK/0YeER2XhOH0yCS8gzTtlQshcm05WqDdzjMCKpVqdjz+RisHq1nlN
 Jqg7F6HLl0aO5XMQdZKgDsBkf8smwo5E/1rVFYQHFQ2Lu+rfmLfPx6u8AJiNNzzbWY+i
 /IcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Sm451czZd0rWklvsSmqNKdExE0Oj2B0x8c+hMELIQJ0=;
 b=uAfCM1LNQf51/zbtRlItPBFj0Fo4PZtJVVBAoLfIEzJ/vBvIcPhJ3HkUEt6GM9GYQX
 cRzL1OXRVHqsWAtfpTx6SyVP7xc4+PD49h1+80/rB74/gqSXQPtmI583FtDQt02dOvqi
 DFvKPUqnX6LPMpBmU79QSEdsV2XpDSBZCbCRmZoOofRnw3FZRnDdY1IDbTGDsWE0pcCp
 zlUCUPc901s30uFmy7XfPHbTVSSNw46chwYRF27l4RLb/WhKbHJUS+BcfFyf+D8/ziD2
 /2ZWMsxLQhAZzLKgdtQDzNRdtyNxOFR4jtBxo5v6n5ZZL072Ve2hzpA+N3R7TfxiLRov
 IR/Q==
X-Gm-Message-State: AOAM531wsAG4OIXwyAKY3/Ha7HrVZJncvmlhqAlnKf1Nub0IbTIGSV/l
 y14tqH0VcFD7tak9irowh8FzAG1BhIGt3KVc662zgw==
X-Google-Smtp-Source: ABdhPJygfpE1YkHtbzYX/2h95P7IvsLukbbMRLifnuJXjoooqapqG3VNL9zYjmvV8A8r8iWaiCz+j2nxYB/UiYwk0pI=
X-Received: by 2002:a25:8b91:: with SMTP id j17mr30240817ybl.228.1628043154789; 
 Tue, 03 Aug 2021 19:12:34 -0700 (PDT)
MIME-Version: 1.0
References: <20201020072532.949137-1-narmstrong@baylibre.com>
 <20201020072532.949137-2-narmstrong@baylibre.com>
 <7hsga8kb8z.fsf@baylibre.com>
 <CAF2Aj3g6c8FEZb3e1by6sd8LpKLaeN5hsKrrQkZUvh8hosiW9A@mail.gmail.com>
 <87r1hwwier.wl-maz@kernel.org> <7h7diwgjup.fsf@baylibre.com>
 <87im0m277h.wl-maz@kernel.org> <87h7g626wg.wl-maz@kernel.org>
In-Reply-To: <87h7g626wg.wl-maz@kernel.org>
From: Saravana Kannan <saravanak@google.com>
Date: Tue, 3 Aug 2021 19:11:58 -0700
Message-ID: <CAGETcx-XEJ25SvUO92wVyqjna+=CU6UTSQKqDimy008z0afA1g@mail.gmail.com>
Subject: Re: [PATCH 1/2] irqchip: irq-meson-gpio: make it possible to build as
 a module
To: Marc Zyngier <maz@kernel.org>
Cc: Kevin Hilman <khilman@baylibre.com>, Lee Jones <lee.jones@linaro.org>, 
 Neil Armstrong <narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 linux-amlogic@lists.infradead.org, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 open list <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210803_191241_594442_5B35FFD0 
X-CRM114-Status: GOOD (  15.18  )
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

On Tue, Aug 3, 2021 at 2:51 AM Marc Zyngier <maz@kernel.org> wrote:
>
> On Tue, 03 Aug 2021 10:44:34 +0100,
> Marc Zyngier <maz@kernel.org> wrote:
>
> [...]
>
> > This thing keeps failing on my end. It only works if I force the
> > irqchip module to be present before the MDIO module is loaded. Here's
> > an example:
> >
> > root@tiger-roach:~# modprobe mdio_mux_meson_g12a
> > [  125.871544] libphy: mdio_mux: probed
> > [  125.882575] g12a-mdio_mux ff64c000.mdio-multiplexer: Error: Failed to register MDIO bus for child /soc/bus@ff600000/mdio-multiplexer@4c000/mdio@0
> > [  125.892630] libphy: mdio_mux: probed
> >
> > Trying to bring up the Ethernet interface will fail. Note that there
> > was no attempt to load the irqchip driver.
> >
> > root@tiger-roach:~# modprobe -r mdio_mux_meson_g12a
> > root@tiger-roach:~# modprobe irq-meson-gpio
> > [  144.983344] meson-gpio-intc ffd0f080.interrupt-controller: 100 to 8 gpio interrupt mux initialized
> > root@tiger-roach:~# modprobe mdio_mux_meson_g12a
> > [  150.376464] libphy: mdio_mux: probed
> > [  150.391039] libphy: mdio_mux: probed
> >
> > And it now works.
>
> An additional source of amusement is that this patch allows the
> irqchip to be removed from the kernel. It becomes really fun when you
> have live interrupts...

Which is why I wrote IRQCHIP_PLATFORM_DRIVER_BEGIN/END macros. Maybe
those should be used instead?

-Saravana

[1] - https://lore.kernel.org/lkml/20200718000637.3632841-2-saravanak@google.com/

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
