Return-Path: <SRS0=VXFk=4I=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E6E1C11D20
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Feb 2020 21:15:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 219ED206F4
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Feb 2020 21:15:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Lcug2tBn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="Zk+cdZTJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 219ED206F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mXeUFeTuOlRrhPzndtc3th4dlAkuFT/HHAVbKHi0do8=; b=Lcug2tBnpaQfcF
	F1FW00Bp4RE7a6SK2pkPYCRDdCgO0u3VEm/jbC6YbjtLM94GrY8cKZtZnxg2XK8IojaZkYg93PL5K
	1QgtwlUxKZjROO2ShHEgCB7ORYbKElIhwhGVFhC/F4t7XIdh9CFr9Lo2eIRJpPnW4N1J7iH7kW7Ta
	JnrikRokzPJCouEWGbl969zKpCRgnU0vYJXnDSRhND0Jyf7LqIIDaJLuZ4REsjDEoEOaHLEVgpoVL
	UVbdL2RoVAGAhAM+sUlLZcL5ZmLxYycXCS6jzNsKt8eLghE4+EGIZzoBzZNrln29MHZ6vONmnvURJ
	puId3OnKoa/g1w5Zr9rw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4tAU-0004rt-Ec; Thu, 20 Feb 2020 21:15:34 +0000
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4tAE-0004fH-T6; Thu, 20 Feb 2020 21:15:20 +0000
Received: by mail-ed1-x543.google.com with SMTP id m13so35421740edb.6;
 Thu, 20 Feb 2020 13:15:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E0r8UtKklC8vn0exQFm1xc2bM7Px85fwUILOFwxpfXc=;
 b=Zk+cdZTJrrQGLS4LPCXUuDR4TnwujssZT/tflyRWzR4m5EuB74oGIb4XNsW8ZpTcV6
 0bMOKocFAC5Aws/uPZuTdgEtDPOjoyukKgAGlNmDCD977jXJDA419hAYFYPI1NXVuJQo
 h430UdKqeKyZxLWCK4GO4NKiUkni6qDd7foBhauhsIrn9EgNs9smHTIWE+gilQ/16aAA
 qfn6Hasa8dA4DT4sDD1+nxpUPc7G2OPFgzjY066Dx0k/Rav91/e4+SBstXos/38maA95
 wnZg7wriDejBaAEUGOUJBhPWdWDn0GFAE47f0mBxFDKwa5X6dxLRje0PnLK0qSHVgZ26
 oMsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E0r8UtKklC8vn0exQFm1xc2bM7Px85fwUILOFwxpfXc=;
 b=DktQ0ADLk0yIomADJM/oBKZ+oz3KyvjicwJJLh4XSSqZjUYOJFHaQsybXc4lkHrTRI
 tmVXj8Jy6rcFLQ7cOOBySk4w/KG7HzdAphzPnDJfTR31bs5dY1TaARPp4Xz+UEIOZ8sH
 Z2AkA+p6MWhKosIgQZhNvMo/e220p1qzhd3k6KFmRNZLivvbb3oezX9JVythWQ5MqOrP
 ZuuRYK+4oU7HUqHCHaJmKh/yoxgCGO+cq6m1k+eDOswaEhVKqSyDiRI0YkOeQjAhQkRv
 iXYH1gKqQsLAybhYupWd9KxAUckEjM7YRhKotRwqZV8cG7aMDUBbu4tOofvgadX2rd5K
 xJQw==
X-Gm-Message-State: APjAAAU/1t2juVZ0GjUawswdu/etU/73TjFVKu+VawIcdNajzy5roLms
 tLz34mV8j/tCZKdjfAUXepAGNGKZidiYUR5jMe4=
X-Google-Smtp-Source: APXvYqwXYPTGE8gx5kvAp7lnVSFQVA+NMeL3QVC6+h/cuRK/8EgB3ahTv0Vbyn5nmgxN9HxsBKLSAoZv7ayNwuuXxTA=
X-Received: by 2002:a05:6402:2037:: with SMTP id
 ay23mr29262250edb.146.1582233317366; 
 Thu, 20 Feb 2020 13:15:17 -0800 (PST)
MIME-Version: 1.0
References: <20200216173446.1823-1-linux.amoon@gmail.com>
 <20200216173446.1823-4-linux.amoon@gmail.com>
 <1jmu9hzlo2.fsf@starbuckisacylon.baylibre.com>
 <CANAwSgSaQgU=H3h0S9deT11HA8z9R=Fhy5Kawii9tSBxKf2Wgw@mail.gmail.com>
In-Reply-To: <CANAwSgSaQgU=H3h0S9deT11HA8z9R=Fhy5Kawii9tSBxKf2Wgw@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 20 Feb 2020 22:15:06 +0100
Message-ID: <CAFBinCCSosE1XfwbKZOR9G+DVYg8zFcKShmTNWUhh1e8W0VoAQ@mail.gmail.com>
Subject: Re: [PATCHv1 3/3] clk: meson: g12a: set cpu clock divider flags too
 CLK_IS_CRITICAL
To: Anand Moon <linux.amoon@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200220_131518_935988_47B7477C 
X-CRM114-Status: GOOD (  14.64  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Linux Kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-amlogic@lists.infradead.org,
 "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Anand,

On Mon, Feb 17, 2020 at 2:30 PM Anand Moon <linux.amoon@gmail.com> wrote:
[...]
> > > @@ -681,7 +682,7 @@ static struct clk_regmap g12b_cpub_clk = {
> > >                       &g12a_sys_pll.hw
> > >               },
> > >               .num_parents = 2,
> > > -             .flags = CLK_SET_RATE_PARENT,
> > > +             .flags = CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
> >
> > Why not. Neil what do you think of this ?
> > If nothing is claiming this clock and enabling it then I suppose it
> > could make sense.
> >
> I would like core developers to handle this.
> Sorry for the noise.
can you please resend this patch with only the change to g12b_cpub_clk?
I have no G12B board myself so it would be great if you could take care of this!


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
