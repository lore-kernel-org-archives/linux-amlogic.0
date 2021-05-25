Return-Path: <SRS0=3IHZ=KU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 210C9C2B9F8
	for <linux-amlogic@archiver.kernel.org>; Tue, 25 May 2021 16:50:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D37DA6140F
	for <linux-amlogic@archiver.kernel.org>; Tue, 25 May 2021 16:50:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D37DA6140F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Raxaw3Pisf8jOY6c3czADpWhprqp7CxBAWS9FG1KgWs=; b=NkBa5q+U/vnk1S
	Jd4J5edllP3uyicau4Gpbh6TYh2P07a8AEi6QWpJz/i2WNPPMvUzDWHi5g1viNYCmRwWauJwOFFA2
	3+/hg4ik/ZzC/p0k24YRoyFw3m6FWf3KGVSyN53OOqFQja7G6k2Xi0ioABa+6XLkNHP1pKAiIYOHV
	DMDrrxAv1d3sica8VKvDIvH120rTzUAH8ywrsbXZzrFWd2Dw2irxRNcjZ+/+neRHUOjT5KZAzAGkf
	BIE3Ohawd0s7+kyvMxNJiBHO0+C4KnIhpuozZUC1PiDVoWZyFMZuMzmAjWtwMD41/EUJNDiscIeSE
	aAsyy11HoXCVslDLUBbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llaGP-006aRa-3i; Tue, 25 May 2021 16:50:41 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1llZkC-006LJS-Cf
 for linux-amlogic@lists.infradead.org; Tue, 25 May 2021 16:17:26 +0000
Received: by mail-pg1-x529.google.com with SMTP id 29so12034867pgu.11
 for <linux-amlogic@lists.infradead.org>; Tue, 25 May 2021 09:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=CdawJkwPb9uxGnIRp9sk4Ip1oxhSpAGWGCOpyXEqx3g=;
 b=rJa7zjMSgGyyG5fwmAUqCwPtrvv5JuaUKfxyI61BvANPK873nbdYjwwSjEBuK0gT25
 bibqdjWTQkuJfcvRwuHpDEvogNf1OE8pGaQVKnej1GuGJjOvQUqyVx2yWvHYvxfmmQZs
 z7CGPOEE7deJ9nzz04LL9+8FGtraj1iBOe8UGT/1mLQP/4FXxWY7mMbNVj2dlhXxjqvw
 86/X/rEH7ucKSTM9gDVLhRFBfeIw2flglowb78NSBj7Rs1EgHKdYX54u94csuW6HvU7e
 l6LW+wd2y4up625x5S8t7ek9oUDnUa46mFOYztJgNUXH3elg132tlr2EtjMeQPp+VuLo
 EXjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=CdawJkwPb9uxGnIRp9sk4Ip1oxhSpAGWGCOpyXEqx3g=;
 b=roiU8Rw2sIB+DkbZC38mj6ipgTeiKF1wWR85u3ZgNMW7r13h3BBI2G/H5sCtqTuYTC
 3WyuJ6DK+euv1LbTWhGPr93D0XbQ3MsFf4IXzlFLPoZO3jux0qX7S6AlBOoHAiN+iTkT
 gw3Cyi5varN9hoM1b6ZOb0S1n7SsM4ch+UcYSRTSB/tzCnmTeOjrY1ZD0qOCTWiOutl8
 onmjtJq90iuG4dplRhNZEevH9Rz2IIbaQ5FiOKQmIcC4LENoPHWJ+40ZY4EJDWIgJf1G
 HVy1C8dMQRQsy1ubODo6EXkj0XV9WzBjVHMqMsYk1E2f5wC38iHPsdh+CLEbRUSakhc/
 kmKA==
X-Gm-Message-State: AOAM531JQ4BXF9CG0uAR8ZLmY39rfNPHJKNUPz2xkrIbFKYUvRUdbRHY
 JvJZVGcu4syUIBc/WiLVI6IkiA==
X-Google-Smtp-Source: ABdhPJwQWoLkB15dMgqBWwSPOLHy1X9eow40SiKRJfG7tRn1R38sCBNzVxm0PiH9htEgLG2ov+FjZQ==
X-Received: by 2002:a62:55c4:0:b029:2e8:f854:d31c with SMTP id
 j187-20020a6255c40000b02902e8f854d31cmr7833707pfb.59.1621959442277; 
 Tue, 25 May 2021 09:17:22 -0700 (PDT)
Received: from localhost ([2601:602:9200:1465:2dea:a51d:f517:6a56])
 by smtp.gmail.com with ESMTPSA id m14sm13861320pff.17.2021.05.25.09.17.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 09:17:21 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Marc Zyngier <maz@kernel.org>, Lee Jones <lee.jones@linaro.org>
Cc: Neil Armstrong <narmstrong@baylibre.com>, Jerome Brunet
 <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, open list
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] irqchip: irq-meson-gpio: make it possible to build
 as a module
In-Reply-To: <87r1hwwier.wl-maz@kernel.org>
References: <20201020072532.949137-1-narmstrong@baylibre.com>
 <20201020072532.949137-2-narmstrong@baylibre.com>
 <7hsga8kb8z.fsf@baylibre.com>
 <CAF2Aj3g6c8FEZb3e1by6sd8LpKLaeN5hsKrrQkZUvh8hosiW9A@mail.gmail.com>
 <87r1hwwier.wl-maz@kernel.org>
Date: Tue, 25 May 2021 09:17:20 -0700
Message-ID: <7hsg2au6sv.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210525_091724_506228_AF6A180A 
X-CRM114-Status: GOOD (  16.48  )
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

Marc Zyngier <maz@kernel.org> writes:

> On Fri, 21 May 2021 10:47:48 +0100,
> Lee Jones <lee.jones@linaro.org> wrote:
>> 
>> [1  <text/plain; UTF-8 (quoted-printable)>]
>> On Tue, 20 Oct 2020 at 19:23, Kevin Hilman <khilman@baylibre.com> wrote:
>> 
>> > Neil Armstrong <narmstrong@baylibre.com> writes:
>> >
>> > > In order to reduce the kernel Image size on multi-platform distributions,
>> > > make it possible to build the Amlogic GPIO IRQ controller as a module
>> > > by switching it to a platform driver.
>> > >
>> > > Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> >
>> > Reviewed-by: Kevin Hilman <khilman@baylibre.com>
>> > Tested-by: Kevin Hilman <khilman@baylibre.com>
>> >
>> > Tested as a module on meson-sm1-khadas-vim3l where the wired networking
>> > uses GPIO IRQs.
>> >
>> 
>> Good morning Neil, Kevin,
>> 
>> What happened to this set in the end?  I still don't see it in Mainline.
>
> Last time I tried this patch, it broke my test setup in non-obvious
> ways. Has someone checked that the issue I reported back then has been
> resolved now that fw_devlink is more usable?

Not yet, that's (still) on my TODO list... (well, TBH, I forgot about
it, but I'll have another look.)

Kevin



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
