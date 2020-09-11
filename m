Return-Path: <SRS0=cGvQ=CU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20D61C43461
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Sep 2020 15:34:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA0B1206E9
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Sep 2020 15:34:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2ggoRO5r"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA0B1206E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pbeRh37kiMwukgWvltrwyGQ7ZY/WdqGvn4gL31zg78I=; b=2ggoRO5r3GwIgSjEVDgYdtL/Y
	sU1oeSlIR+f+Nqhz/F1PxUErHwL9/zuFlj/ua30HS4p9H27lqE6RlQFHeI1Yw4+VzIWfFiuKCbe/v
	vMHf8hvDmups9wGU41yMZ7F0ycBZ0RB6qC/X3pPWiyVZcr33xnkarL3qIRyTW4k84E5wn51mdI6ml
	DZc3w7VZMuFBApqdfUX4wucFKskePPMBUawTL99N9ozF2gHd6XB+Zqj/8Oz23Duc1xBgK76dOD+bG
	PznlrqntIWCZ3uy3UbToMtrxVE+f8fdH3Bz3qfXQLvkhAK/u1NJ/BxUMmcfB/a5+rp8QnS/ZTq3xu
	nr71UFbZw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGl4e-0006oX-J7; Fri, 11 Sep 2020 15:34:52 +0000
Received: from mail-ej1-f66.google.com ([209.85.218.66])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGl4Y-0006mO-38; Fri, 11 Sep 2020 15:34:46 +0000
Received: by mail-ej1-f66.google.com with SMTP id u21so14385751eja.2;
 Fri, 11 Sep 2020 08:34:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Rv8Uq4Yh5DeMvinWPQeAnG3AGmpR0//uZ7bahTCq3MA=;
 b=seBJFBD0Jxp7C7OSvaRfPQogQjpD//qIPBdXXj7GtgrPW3iQLOmnm/a0blN3uHsnVD
 SQqnY2l3mqNxXz5UtbfCRju+ETS7k0VGLD9QcFZlcOgpBvv4uTxZw5Zp0eOka2GxqWf6
 +hmCWIeOViiw03UHXOxCW7jwkwV1Qyf7w+eE8uYZR4bV3Ga7+60lFRPpO5z0f9tt3xZZ
 OJFGGZoEgkotZpYOGEony4LVmIyNazVo14oneRcKStY5xpPkViqvvVEyK6FipeN43RsY
 r0cyg0I+8sfp4HHrsc9OSVtTdZ7fLgZl68fuKAe6PsCFrPuZ9tKet8tkHaPRvIKYUj2A
 yhrg==
X-Gm-Message-State: AOAM530BzC7BC78/WhJhLiFAfxv/QHkYCLVjuYtdrV9TY4JcAoDQEX6X
 pnps99ewrgkCnbhcQ8ohIEc=
X-Google-Smtp-Source: ABdhPJwqMxehrWj5AIk6bwgWo/6J4nFSeUNA+neqTDckmCySfnip8jOFjrj8I8PS1NPWYbv5f2Tj9w==
X-Received: by 2002:a17:906:7d0d:: with SMTP id
 u13mr2745908ejo.448.1599838484902; 
 Fri, 11 Sep 2020 08:34:44 -0700 (PDT)
Received: from kozik-lap ([194.230.155.174])
 by smtp.googlemail.com with ESMTPSA id 16sm1970663edx.72.2020.09.11.08.34.42
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 11 Sep 2020 08:34:43 -0700 (PDT)
Date: Fri, 11 Sep 2020 17:34:41 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 01/10] clk: at91: Drop unused at91sam9g45_pcr_layout
Message-ID: <20200911153441.GA18190@kozik-lap>
References: <20200902150348.14465-1-krzk@kernel.org>
 <20200902163558.GA4137028@piout.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200902163558.GA4137028@piout.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200911_113446_140013_69EF891E 
X-CRM114-Status: GOOD (  14.96  )
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
 linux-kernel@vger.kernel.org, David Lechner <david@lechnology.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Sekhar Nori <nsekhar@ti.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Maxime Ripard <mripard@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Andy Gross <agross@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>,
 linux-amlogic@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, Sep 02, 2020 at 06:35:58PM +0200, Alexandre Belloni wrote:
> On 02/09/2020 17:03:39+0200, Krzysztof Kozlowski wrote:
> > The at91sam9g45_pcr_layout is not used so drop it to fix build warning:
> > 
> >   drivers/clk/at91/at91sam9g45.c:49:36: warning:
> >     'at91sam9g45_pcr_layout' defined but not used [-Wunused-const-variable=]
> > 
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> 
> > ---
> >  drivers/clk/at91/at91sam9g45.c | 7 -------
> >  1 file changed, 7 deletions(-)
> > 

Hi Stephen,

If the dev_err_probe() waits/skips/goes to /dev/null, then how about the
fixes in the series? This patch and few other?

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
