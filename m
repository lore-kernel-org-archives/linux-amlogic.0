Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BBBCC982D7
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Sep 2026 09:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xWYvYs7e0QoNG+ccz0VMCxyeRu6kNYtH2X/v+SnQ37Y=; b=vzYb/S5L7RMK3M
	v1423nTtYcCMu/Lk/ER1adKiHPhqQkorRw/NGTuD5QPA3pLZ4bF0ZmRiWea9L/70LIzh324vj18AE
	FOt+a7jDwMhyqsO3CyI2Yeh4yGVis8ZbM0PcRRqfQm+5wKG8J6kJpR/oju12JLmJiHABET+aNwWs5
	sYj+37fDJFT7JitcHIA4rHQFQEOsHsl1V5aok3YcgpSyZ4rAZkLMsijgvNpWz16fhqVcdyQXXPQxF
	w8SnbdgEAdDTJRDpKHNP2KoKZeBYBf3ZhHzzLJQPPV08XbYFvYpTfsu2hAswr0u+CtB+t3lAR5bC0
	nTD/L61Qvo3ZCnetZl6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7VCt-0000000DzRL-1Cfl;
	Fri, 18 Sep 2026 09:48:35 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7VCq-0000000DzQg-0lYP
	for linux-amlogic@lists.infradead.org;
	Fri, 18 Sep 2026 09:48:33 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-396cccbba91so376355a91.1
        for <linux-amlogic@lists.infradead.org>; Fri, 18 Sep 2026 02:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789724911; x=1790329711; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dkQa2qIspUk8yEWkIO1+OC37h14n8QshhY0emIiOSZw=;
        b=MXTTrgnR/B3MSQhD9cEwSPiFTmSQjjdFlIQnutCQSoxd9Z3sCvYVeg2+3pc5YQwU7+
         jehCW7ZrfQFN0c/EpVEvcpexCVQx8fg6Fle4KGo9eLqfYvnPsHn7aWUmdgdmSICKohFS
         YOpOr+ZOb0QtdFcL4Ez2al3ZT9o7ebiBRQy3Mi1+Ji4Q0AFq9e5ONXmOsbPnku1YojAp
         An2b3bkb2JgU46fx6xacQ5NLAdD17Kthv14XKfd5Hkedv1Pb+kQlvTXihyCSpOoRBlfX
         Fbzba3IzEsNxbVQiAKKuBqFAYyPScW2RRT4Q4uO3Sx7XGwg/Grzu6wiZlSCmtT7ReiKZ
         rRsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789724911; x=1790329711;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dkQa2qIspUk8yEWkIO1+OC37h14n8QshhY0emIiOSZw=;
        b=xFF1l6oOIo4RKJ+XFO2krgiUs2GpxjyTPSq8NWmGsI5yZVPmtvT4i8YMl+uCt70vHI
         Hd6M4nL1XKqorjD4pmAX92VPaxT48wNfdEnjLb92hNCbK7jS2AncrLNXEqpOyojAdQ/z
         o45wy8oZa/atAOQIBNIukD/iqwRJnzMOnRHXB4KfWKpjy1K4Sl4zjmLQdqzbKNGrfOaL
         O3U1QB5HVrwSZo6eQX+67wzgWAVQpAtxeHg9IWQR5IL6wqbRhouc0w+DBK/g8gXUroqd
         X8d6d1VqSCb9AYbiqO5wF/h6UMY2mjLpOotXceIf1bLE50FPaa97+H5Ay3LDhLeux+s+
         qNBQ==
X-Forwarded-Encrypted: i=1; AKwUvBwgVlVgBkYJWbOg1b5bTFKXDZLKQyZmSFTHIpaJkj3OrSOgGvxyBBjcrEA8QyNQoVp0ZAmXu5o7rTIOyi+b@lists.infradead.org
X-Gm-Message-State: AFuF++n7jbfgtko374wWhwy1EOIg4cT8k203leC9CQJAhLJZLK6DorgH
	w8vv6koEndFuaWt8mTcs+dhRIbWZROI1u0fFknTnaG7dTBvFZgD3wMmi
X-Gm-Gg: AYBFou0khw2UUBFYN267jPmRii2CEOmip5gPM/wzUwTsAmKZqRMZjfQPfZmL1hcCIVZ
	e2mEbao+tpxfXyUiIGL23X5CZaDVIB8mqM7EfjaOSJi0erR6lsI++LnGPHla3WHfxFSIN2JwMOn
	2Wsoq2KwakIH/Pad0VOh9TYCG3d1B/GKwY/oQYDY0n2azsiG2cAbjSivO67VODxCfGGip+pGr14
	m6stHic1GMR4krMwrJu2UOUnfzNhx9T/n29q40RBBhZF37kaT5l43JTnvQ2MKR42MuGxAdohg76
	Pgh5xA141g10dm8HJPn7aNNOotwqygEIodVB34mfQPDQ0e0Q61zTL+t00rCtDNAND/1v3P3eSv8
	wnGNQEMWTkQqjd9qhW9CbglaFui2jfqR8riAsnhMFdvqBwfs8PyVxhnvdNGa8/3sFIqkXl27HwK
	5aEKXajkifZm2e50VFHtnGWv7MB4D3DOWyb8ydaWJYeftESso8rS1POhVkDyrNd7aAjTqFm2r6C
	/AGLM0pvlBRDh1BQMc=
X-Received: by 2002:a17:90b:548d:b0:398:c3ca:1ebc with SMTP id 98e67ed59e1d1-39e54d11d8dmr4503633a91.18.1789724911233;
        Fri, 18 Sep 2026 02:48:31 -0700 (PDT)
Received: from kernel ([103.219.206.97])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144ce065314sm3547378c88.14.2026.09.18.02.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 02:48:30 -0700 (PDT)
Date: Fri, 18 Sep 2026 15:18:23 +0530
From: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: clabbe@baylibre.com, davem@davemloft.net, skhan@linuxfoundation.org,
	me@brighamcampbell.com, jkoolstra@xs4all.nl,
	linux-crypto@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] crypto: amlogic: Fix IRQ handler return value and
 fallthrough logic
Message-ID: <aq0I57b04bh8HAyO@kernel>
References: <20260908160120.4805-1-raizudeen.kerneldev@gmail.com>
 <aqz7tT10SEMCrwV4@gondor.apana.org.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aqz7tT10SEMCrwV4@gondor.apana.org.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_024832_235738_A343B7BA 
X-CRM114-Status: GOOD (  16.97  )
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

On Fri, Sep 18, 2026 at 06:52:05PM +1000, Herbert Xu wrote:
> On Tue, Sep 08, 2026 at 09:31:20PM +0530, Mohamad Raizudeen wrote:
> > In irqreturn_t_meson_irq_handler(), when an interrupt matches a flow
> > but the status register is empty, the driver prints an error but
> > doesn't return. It falls through the loop and incorrectly prints an
> > `unknown irq` message.
> > 
> > Fix this by returning IRQ_HANDLED immediately after the error print.
> > 
> > Additionally, the handler returns IRQ_HANDLED for genuinely unknown
> > interrupts. This masks false interrupts and prevents the kernel from
> > detecting interrupts. Return IRQ_NONE instead for unhandled
> > interrupts.
> > 
> > Cc: stable@vger.kernel.org
> > Fixes: 48fe583fe5417 ("crypto: amlogic - Add crypto accelerator for amlogic GXL")
> > Signed-off-by: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
> > ---
> >  drivers/crypto/amlogic/amlogic-gxl-core.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> Please check
> 
> https://sashiko.dev/#/patchset/20260908160120.4805-1-raizudeen.kerneldev%40gmail.com
> 
> Thanks,
> -- 
> Email: Herbert Xu <herbert@gondor.apana.org.au>
> Home Page: http://gondor.apana.org.au/~herbert/
> PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

Hi Herbert,

Thank you for pointing out. I will send the v2 soon.

Thanks,
Mohamad Raizudeen

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
