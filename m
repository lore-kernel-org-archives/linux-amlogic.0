Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67A30C982D0
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Sep 2026 02:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WPGMVr+InkTSU1DBqtJ+UsgF+hTDxibQdEZudc8e4sY=; b=iVE3lEzumNGeD6
	OU1aKfxkwbOgQ3RazgZHVbJBvCqe0Agcfcu8o24JYu9UqtRCFX9hUALIIJuRUdSldl66bAQW0+N7D
	parqi4pcJ4HRCRduivdxuYk2AR8CMA+vXDgW0O56LBhP7pJ8MwPqHreZA15qtMOy4QkrL7FFjCxV5
	OnJ1Y2AgOIfhbHiQmBaXdJ21Tp7EzYLcZfuyfSiZ7WP03JyYmbeZxNEVDooI22IEChxdVPjpV/FHj
	hYl2nnC7ENn5a34qfj4+dMzoTcJX/mkjSf2IaXgA0V0mK/+ErmbI+bTdqh9X4tGwUlMCB28Xvx3cd
	DFxXxcFpqR+ilXtZFevQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7OA4-0000000DHrs-2eY5;
	Fri, 18 Sep 2026 02:17:12 +0000
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7OA0-0000000DHrD-440P
	for linux-amlogic@lists.infradead.org;
	Fri, 18 Sep 2026 02:17:10 +0000
Received: by mail-pz2-x10.google.com with SMTP id 41be03b00d2f7-cc1cea50dc1so95034a12.0
        for <linux-amlogic@lists.infradead.org>; Thu, 17 Sep 2026 19:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789697827; x=1790302627; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vW0Y3swTiioWAd7nzTHn4G51gEl3jxVd3j9M10H0xqA=;
        b=LWR11x64FYWkAwPsas/zmjeCwcKwBXjy2p1L3780YbYHCMBwsLhqjDQDwBQxVlFatn
         Zufb9EeRZQZ8hnImP+EjjWzghbwXcaXBgAoTpf4M1ItJp5CPf+bIteFiuiPdD4l1BGeu
         2doUTAM/6E7od8Jh+77ulg8w4g8QXTgkt+EekBMSGNRIy/yindDTdg3Tm5pjjSzLTIsX
         2V2BmhF1Dq03R+ZSauxZi4yA4Vb2jUI+7mZxLSwOAQ6SFnOI2zVYD9yhnidGpNgNd2Aj
         b7l3ylY7aBcLpnAQjH9kuZ6TbPk6lAaxzFUMONJVtXYsKwrTnxzK0Fmpctc9MK12Bm97
         buAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789697827; x=1790302627;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vW0Y3swTiioWAd7nzTHn4G51gEl3jxVd3j9M10H0xqA=;
        b=Qityg1GSo9R+YkG38dc80BMqA7rvAEh0/5yHtcP+HmFRCL7yaspeasPtZpeA7B5tsy
         jx6YsYZB8YrDFtabE9Z/3s0uO3yeJdehvE7YsnzAMl2VrTuFxKhTDi1ApNHQCahPv734
         adpFgRyPx8ITGH4a0sBkg7VUlyjUG0IC5S5JZVQ8iIXhyR1TwgutqFFs1v4Swu2g1SNs
         ZHPKJ80zTXuFwF45+3x6pBPIgx4nnvjxmWJC3oon5CU2BxjvT9NVhM8sFnECi8A6xGsP
         9jf98BjiiiU0O+RaXJ2R3dm4IipqjRiAcawzHfBYWf1uMycfGjgb/JKn5UnU+CaS6Csl
         T/YA==
X-Forwarded-Encrypted: i=1; AKwUvBzYXpOT3z+khCoYyeTvLNZQhs3GVeDcF0wq+omR/rylguBPnwxMQEJVosftx/M/PUndJGbGLiOkHvDUxb8Y@lists.infradead.org
X-Gm-Message-State: AFuF++ki6w+OLDMJKhogNbQGrO4gt5Gq6BeQQ3frO/nk0ITFc8uiLmda
	vclje/+SLp9kTWcnJ7HeOMOI6cV+PUao6swuKirgsgB6QMdLrPMTsS1Qz13gcJOO
X-Gm-Gg: AYBFou1BtzTfXmXyhKqf2xqtsRn2FlVnpuowwadN0tbz2A3Rw3Mva31rfy7wTe5y74O
	DYb29VqZ5gLv/VH3jeogmCKk1RdyW8077Xmx3o6Aj65GXNX9bUuf014T1vc7/vIgRY/0G8i4xA8
	jRI6Vogog26aKlSiIRPH0fBqj4PhLX7eLOVSLLvwqH41nGjuRKMBPMyV+6rVkW4yFXhnEu3s+jy
	L+XrJi5Xg9yms6n3fRQGQ3sif7fSsbauM4On5IiK138fyGeaa895CONyL0GZ8yiapDG13+F5cNO
	OCpuxH8oRPR9+UVtg8KRDC+FcICpCRE/X3gZQNxiSrCKOVk461FCo6Y7t4kcYW6VCT2qJLxgmnn
	TCngO5UcecERGf/l5u4s0Sp2vx30CA4hpZgtwCB9Bpg8ufTD1FpFevawrxKUhORQw5vweb4VDsK
	9g+EVv1RxcZ2DBpOFUmU8zvtRGLMYs21TDeq8vOimPhopKsYR7I2nA8La8udYlr/5gM+5bJYot3
	As/G9Ob4iAnQx/EtMPV
X-Received: by 2002:a17:90a:d443:b0:398:d132:ba76 with SMTP id 98e67ed59e1d1-39e54f9c08bmr2061562a91.21.1789697827210;
        Thu, 17 Sep 2026 19:17:07 -0700 (PDT)
Received: from kernel ([103.219.206.124])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144cdfc2346sm715786c88.4.2026.09.17.19.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 19:17:06 -0700 (PDT)
Date: Fri, 18 Sep 2026 07:47:00 +0530
From: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: clabbe@baylibre.com, davem@davemloft.net, linux-crypto@vger.kernel.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org, jkoolstra@xs4all.nl, lkp@intel.com
Subject: Re: [PATCH v2] crypto/amlogic: Use devm APIs for clock management
Message-ID: <aqyfHB1xBWFSvOl9@kernel>
References: <20260901024302.5407-1-raizudeen.kerneldev@gmail.com>
 <aqpmOzURNFOm78ls@gondor.apana.org.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aqpmOzURNFOm78ls@gondor.apana.org.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_191709_008911_D2896F4C 
X-CRM114-Status: GOOD (  20.22  )
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

On Wed, Sep 16, 2026 at 07:49:47PM +1000, Herbert Xu wrote:
> On Tue, Sep 01, 2026 at 08:12:52AM +0530, Mohamad Raizudeen wrote:
> > The driver currently gets the core clock and manually enables it using
> > clk_prepare_enable(). This requires matching calls to
> > clk_disable_unprepare() in the error paths and remove function.
> > 
> > Switch to devm_clk_get_enabled() instead. This lets the kernel handle
> > enabling and disabling the clock automatically, which allow us to drop
> > the manual cleanup code and keeps the probe function simple.
> > 
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202608310329.QgxCCMs1-lkp@intel.com/
> > Signed-off-by: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
> > ---
> > Changes in v2:
> > - Dropped the devm_crypto_engine_alloc_init() change due to build
> >   failure reported by the kernel test robot.
> > - Kept the devm_clk_get_enabled() clock cleanup as the sole focus of
> >   this patch.
> > - Link to v1: https://lore.kernel.org/linux-crypto/20260821151303.8150-1-raizudeen.kerneldev@gmail.com/T/#u
> > 
> >  drivers/crypto/amlogic/amlogic-gxl-core.c | 16 +++-------------
> >  1 file changed, 3 insertions(+), 13 deletions(-)
> 
> Please take a look at
> 
> https://sashiko.dev/#/patchset/20260901024302.5407-1-raizudeen.kerneldev%40gmail.com
> 
> Thanks,
> -- 
> Email: Herbert Xu <herbert@gondor.apana.org.au>
> Home Page: http://gondor.apana.org.au/~herbert/
> PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

Hi,
Thank you for pointing me to the sashiko review. I have addressed those
issues and a couple of other bugs the bot found in v3 and sent the v4
here: https://lore.kernel.org/all/20260916174227.5581-1-raizudeen.kerneldev@gmail.com/

Thanks,
Mohamad Raizudeen

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
