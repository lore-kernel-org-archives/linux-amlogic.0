Return-Path: <SRS0=Xszf=CZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1E29C43461
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Sep 2020 16:16:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25991224B2
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Sep 2020 16:16:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="X9j5QgWC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="xragdtJe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 25991224B2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=50SlNn+zKRHuVIUZfNYYKj5WjsXM25z0HbuxiVCmNJ4=; b=X9j5QgWCWMRtAFHzMg8o1Zn7S
	y96Y2dR61ktqFiZFNyFcf5N922WX08XOfLTDav3jMoBUvbvVQexo9jdfzHugxgz/3w/kmCfHybrN0
	C1lveJo6RtIeuJZtnGLtCd/MG3r1ZTxosGAaGLMqKwNOcIY/VeIdWVaVAyycaOUSS1pYx6+FtW6v4
	Ps3JtFj2jkEi12K7NoP2K7wiKgq1I87P5X0k1Oq5mpjEgs8cb6D5lUC2XtKmVfbwj5amNgSxYz3/T
	X8ywk42IGgnh17+ivP5iZngC7F4aZx33ImV0Irc12wnITs3Hit7g/1dt+1wZxlwVmGUgv3fNizKJ5
	MCwWCPwWA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIa68-0001xB-9b; Wed, 16 Sep 2020 16:15:56 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIa65-0001wj-N8; Wed, 16 Sep 2020 16:15:54 +0000
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A377622583;
 Wed, 16 Sep 2020 16:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600272953;
 bh=27sYm41mDiVDnZrWbm0QPVBaPRpD52EfmzkcCrZV80c=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=xragdtJe8YHzIw3Wo91ge6OnAiWFbdQWekGq7uQ55A3plRldzhLOZJek6GAqw16Qo
 f7/dvmr/hBN8SU0D5PkG68Wr5bTSnABYPkvHzR4/DeejXEltV8XqP+LYy8HViJ8b93
 Y4fewmHrG+9xMeZoauWCTBqJe0oLDpXVEeME55t8=
Received: by mail-ej1-f43.google.com with SMTP id z22so11157423ejl.7;
 Wed, 16 Sep 2020 09:15:52 -0700 (PDT)
X-Gm-Message-State: AOAM531Pqe9xynCCm0o0e0/XKPk7Poeq3scuVmkeP4A9vk8VZtO41W9j
 hjT8f9pXhve6doAq0ajN/rheyOUD/SYLRRUlcAw=
X-Google-Smtp-Source: ABdhPJxEK6ZjXsdxLcZySzuz0z9lSyaAmd9P0gRxYMJTfHrR5KxRYZH+Asvudz0vhNq7zAjPO6GX+HHY/5crRL//S3M=
X-Received: by 2002:a17:906:8401:: with SMTP id
 n1mr25499511ejx.215.1600272951032; 
 Wed, 16 Sep 2020 09:15:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200902150348.14465-1-krzk@kernel.org>
 <20200902163558.GA4137028@piout.net>
 <20200911153441.GA18190@kozik-lap>
 <160012811662.4188128.10109140799333292326@swboyd.mtv.corp.google.com>
In-Reply-To: <160012811662.4188128.10109140799333292326@swboyd.mtv.corp.google.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Wed, 16 Sep 2020 18:15:39 +0200
X-Gmail-Original-Message-ID: <CAJKOXPdjyETBwDqC+C75giz2bD0Gie-G4Yd_svpc-vYccywy_Q@mail.gmail.com>
Message-ID: <CAJKOXPdjyETBwDqC+C75giz2bD0Gie-G4Yd_svpc-vYccywy_Q@mail.gmail.com>
Subject: Re: [PATCH 01/10] clk: at91: Drop unused at91sam9g45_pcr_layout
To: Stephen Boyd <sboyd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200916_121553_839931_07E69FED 
X-CRM114-Status: GOOD (  19.18  )
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
Cc: linux-arm-msm@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 David Lechner <david@lechnology.com>, Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Sekhar Nori <nsekhar@ti.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Maxime Ripard <mripard@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Andy Gross <agross@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>,
 linux-amlogic@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, 15 Sep 2020 at 02:01, Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Krzysztof Kozlowski (2020-09-11 08:34:41)
> > On Wed, Sep 02, 2020 at 06:35:58PM +0200, Alexandre Belloni wrote:
> > > On 02/09/2020 17:03:39+0200, Krzysztof Kozlowski wrote:
> > > > The at91sam9g45_pcr_layout is not used so drop it to fix build warning:
> > > >
> > > >   drivers/clk/at91/at91sam9g45.c:49:36: warning:
> > > >     'at91sam9g45_pcr_layout' defined but not used [-Wunused-const-variable=]
> > > >
> > > > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > > Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > >
> > > > ---
> > > >  drivers/clk/at91/at91sam9g45.c | 7 -------
> > > >  1 file changed, 7 deletions(-)
> > > >
> >
> > Hi Stephen,
> >
> > If the dev_err_probe() waits/skips/goes to /dev/null, then how about the
> > fixes in the series? This patch and few other?
>
> Yes if dev_err_probe() is superseded by Rob's work then the fixes should
> be fine to pick up. Can you resend the fixes?

Sure, I will send the fixes only.

Best regards,
Krzysztof

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
