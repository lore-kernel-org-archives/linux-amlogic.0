Return-Path: <SRS0=BDF+=SK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6911C282CE
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Apr 2019 07:38:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B518B20870
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Apr 2019 07:38:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="N9wNQD08";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="O44LSWDr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B518B20870
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B54A/UVWmgr1mc6LOjaLdppXn34OSBVLL6tD4JZ/qQ0=; b=N9wNQD08DLOj+O
	a6Eh70HthozmDcxU/4bZcfiEf1AjWJS7YlGrVYbBcvP7C1rVG5RMcdwBuH6MRYOr/4JncTTXZ7Hz+
	VMSfQQwdtGH1TEWX6gPUtZJ9wFLazXLTRvJNcodIriVjUKm+tEs6xTzbOP2hqimVCu++Zgf+/4YIC
	ZMndHJZkn65B6+cuT9KSFEz16hLw/Db5LPObq4rt0AB7E4EUfxUGpiFMFw6aRzH3xEHIBREce9muu
	fbmyvb+jMwXgFF0QioS5Pr+JUZf5/+jCtzKWbfsY1sQ6tcFw90ZRaNqdxZJuAp7vZZYE8XFmwNmy2
	IDqIOQ2C1p8kDtnGVgtQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hDOrk-0006uu-Je; Mon, 08 Apr 2019 07:38:52 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hDOrh-0006tr-TN
 for linux-amlogic@lists.infradead.org; Mon, 08 Apr 2019 07:38:51 +0000
Received: by mail-wr1-x443.google.com with SMTP id w1so15077052wrp.2
 for <linux-amlogic@lists.infradead.org>; Mon, 08 Apr 2019 00:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=M34WUxJXElG+xCIPmMPrZPxdlhgyl9xNwpJ13GMLopY=;
 b=O44LSWDra/2gwBedXk5or+Weqq5HCFJY0XOjsHIJ6LhmWSPCxVU4l/7k/Gub+XBVy2
 MtkFAA6dcSocMxyXdiqtzBOZpgSF3FourKrG4i3mW5zcSC9hQumWFMt/7q5viQ6jYEFO
 Y2HkIxNoOomIU1Yljx3ga+PYpQg1OcJG7MW1ZdsHBnfvKlJlM5V4K5EGimGGVzgVra0f
 pzK4puTNSnsEdU5IzQPhI41NOZQ6QREeoivFGimZbYvt4Pxl1fi119ZVJkJnEL5dOICm
 cMUWKQApP7S5ipW0XqUfkKRoCfBqTvsx4EMNMNqUSNhOSPtArRGUhMMs4QlkVDT3im+z
 VEqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=M34WUxJXElG+xCIPmMPrZPxdlhgyl9xNwpJ13GMLopY=;
 b=QKwL1nfyKR3iYkosP625tUnmFOeLeOTpKza0dG8u5g/OUQhn6QR87CSxu7cxB4eo9P
 SMRT1v2PlwRNxTh8l9SnnGr4kI/mm6w08Q6kld50/jnEyOBfrsRR1/gQqCQmCzmSxSZd
 0H5KZGz6gtN2vFnGMVKYDqjx5zKSCzMqdR4z3qbOgLn99Yf/yadilM/H+F2FOrf0aqK7
 IX5YcfPHyOtDJDS74u0PpAWnRyIjV78ug8TjvpRQid6I3SszZBOyDGlON3DTa0Z1RCRX
 DQTDNLlfh9SFOG1+xxra15fXllOeUz/cAO+qC1tlXiDCauqktlnZj51FgVJ7ltdjo2lZ
 MzWA==
X-Gm-Message-State: APjAAAVro8rRaBSTti1kd6sLv4frTO7BMU7L221nt6FQzPT/f6/z3Rvn
 zWAH6cWICAWx75XJwP+mYM3tVg==
X-Google-Smtp-Source: APXvYqya+98giA+Gl7P1A6wG7gR0BYEfTb9Zk8is/I02ucG3bcrMTUSRqE6G6YpPpG/7xwhDXK7tOQ==
X-Received: by 2002:adf:e889:: with SMTP id d9mr2257765wrm.162.1554709127980; 
 Mon, 08 Apr 2019 00:38:47 -0700 (PDT)
Received: from boomer.baylibre.com ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.gmail.com with ESMTPSA id
 f15sm34190799wru.21.2019.04.08.00.38.46
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 08 Apr 2019 00:38:47 -0700 (PDT)
Message-ID: <7bd9dd9123779165cc172853ae7ee6d3d63c329f.camel@baylibre.com>
Subject: Re: [PATCH 1/4] clk: meson: mpll: add init callback and regs
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>
Date: Mon, 08 Apr 2019 09:38:44 +0200
In-Reply-To: <155449701325.20095.2265240732374772927@swboyd.mtv.corp.google.com>
References: <20190325111200.15940-1-jbrunet@baylibre.com>
 <20190325111200.15940-2-jbrunet@baylibre.com>
 <155353381842.20095.17915880223118004926@swboyd.mtv.corp.google.com>
 <8b6f0bc6210834af2aff2de7dc95692dd87db539.camel@baylibre.com>
 <155389767798.20095.10570017301900287354@swboyd.mtv.corp.google.com>
 <6ef984dabf626760ae606567facdc5245fbba984.camel@baylibre.com>
 <CAEG3pNCrANkLBeEA_wVU7n4U57X3sd-1EzhUZ_PHBryqPHoAaQ@mail.gmail.com>
 <155449701325.20095.2265240732374772927@swboyd.mtv.corp.google.com>
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190408_003849_955837_A696AC7E 
X-CRM114-Status: GOOD (  36.05  )
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
Cc: Emilio Lopez <emilio@elopez.com.ar>, "open list:ARM/Amlogic
 Meson..." <linux-amlogic@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, 2019-04-05 at 13:43 -0700, Stephen Boyd wrote:
> Quoting Michael Turquette (2019-04-05 08:43:40)
> > Hi Jerome,
> > 
> > On Fri, Mar 29, 2019 at 3:58 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
> > > On Fri, 2019-03-29 at 15:14 -0700, Stephen Boyd wrote:
> > > > > > We actively discourage using init callbacks. Can you do this some other
> > > > > > way?
> > > > > 
> > > > > Yes I'm aware of that but init it the right place to do this.
> > > > > To be clear, this is not initializing the clock to some particular rate, the
> > > > > rate is preserved.
> > > > > 
> > > > > It just applies the necessary settings that needs to be done only once to make
> > > > > sure the clock is in working order and that the rate calculated is actually
> > > > > accurate.
> > > > 
> > > > Ok, but can you do that in your driver's probe routine instead of
> > > > attaching to the init callback? We want to get rid of "init" at some
> > > > point so throwing the init sequence stuff into the driver probe around
> > > > registration is a solution. Or we should think about not discouraging
> > > > the init callback
> > > 
> > > Is is callback really a problem after all ?
> > 
> > It is a problem, insofar as Stephen and I want to remove .init some day.
> > 
> > > I think we should actively prevent using it to set a particular rate.
> > > 
> > > Here, the goal is put the clock in working order. The bootloader does not
> > > always do that for us.
> > 
> > The above two sentences make it sound like this sequence belongs in .prepare().
> > 
> > I know that you're concerned with setting rate, but I guess it is safe
> > to assume that you'll always complete .prepare() before you begin to
> > execute .set_rate(), no? This also avoids the ugliness of putting it
> > in the .probe(), which I agree doesn't feel like an accurate thing to
> > do for a clock's own programming sequence.
> > 
> > .probe() is an OK place to put policy (turn these clocks on or set
> > them to this rate, for a known-good configuration).
> > 
> 
> Following along with this reasoning, maybe we need a 'prepare_once'
> callback that does this the first time the clk is prepared or set_rate
> is called on it. The problem I have with the init callback is that the
> semantics of when it's called and what has happened before it's called
> isn't clearly defined. I'm afraid to remove it and also afraid to move
> around where it's called from. I've been itching to get it out of under
> all the locks we're holding at registration time, but I don't know if
> that's feasible, for example.
> 

If removing .init() is important for you, I would prefer to help guys. That
being said, we need a decent solution to some use case if this is going to
work.

I'll illustrate with examples from the meson code but I think they represent
fairly common cases:

1) clk-pll: Without the work done init(), the pll just won't lock ...

I agree that we would see the problem when the clock is finally enabled, so we
could do "init" sequence in .prepare() each time it is called. The sequence
might be "long" (with a couple of delays in it) so doing it on each call to
.prepare() is wasting time but it could work.

Something like .prepare_once would help for this.

2) clk-mpll: Without the work done in .init(), the fractional part of the
divider will not work, only the integer part works => the rate calculated is
off by a significant margin. IOW, until the initial setup is done, the result
of .recalc_rate() is off and cannot be trusted.

.prepare() (and .prepare_once() if called a the same stage) is too late. We
would need something that runs before any call to .recalc_rate() is made.

We could also think about clocks with the ability to observe and feedback
(read-only) on the actual output signal. Such thing might need an initial()
setup as well.

3) sclk: This is a kind of divider which gates when the value is zero. We need
to save the divider value on .disable() to restore it on .enable(). In
.init(), if divider value is 0 (gated) we init cached value to the maximum
divider value. This done so a call to .enable() works, even without prior
calls to .set_rate().

Here, again, I think .prepare() is a too late.

Maybe it is a bit extreme but we could also think about weird muxes not
reporting the parent accurately until some prior setting is done. For those
you need something that runs before all the orphan mechanism in the clock
register.

Whatever the name we give it, It think it would help if we had a (not
discouraged) callback that is guaranteed to run before anything else is called
on the clock. This is what I tried to do with 541debae0adf ("clk: call the
clock init() callback before any other ops callback").

Having the counterpart callback, guaranteed to run last, would allow a clock
to allocate (and de-allocate) stuff. It would be an interesting addition IMO.
For clocks which needs to store things (such as sclk), it would allow to take
the runtime data out of the init data.

What about .register() and .deregister() ? It would map nicely to the CCF API
?





_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
