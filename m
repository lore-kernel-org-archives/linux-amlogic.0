Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40EADC77B7A
	for <linux-amlogic@archiver.kernel.org>; Thu,  1 Jun 2023 14:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aiDRBfbMWFR/LBAoI4jV6FcreBtZbaSzAahCRSAzu/Y=; b=Tuxv3RL/HDJFBQ
	RUNc1xuc5MOSvb9JwFrsqBXRYw4K7lV4cf5ZplrJECyNZ5vepmOWKsm1YOvZoAxFJqVVofZZtv0Ex
	NIZgU3623B6TN2H/EWAA8XHMjisv0s3CVMkIhssDQAlb/P7vZFLnVT1cD87rApZEFFcd96sSEe0QN
	9jS1LeXhZywt/4HxUEc87303qeSz+4WrIiPl66si31X5cp6hVYtRDhjOeDK3AapVJbG+nQhkOVGhO
	fIxzlDqMokyD+ruI8nHpVtCAZ4YIqmMzCb7EAlGEVdgZ0LuPyZ/I9lWk1hcp26WRyK3A/kQsz/pG5
	opyL3P8zsFIvzQifmvvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4j6R-003oc0-2F;
	Thu, 01 Jun 2023 14:16:35 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4j6O-003oZa-0R
	for linux-amlogic@lists.infradead.org;
	Thu, 01 Jun 2023 14:16:34 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-651e181cef3so174492b3a.0
        for <linux-amlogic@lists.infradead.org>; Thu, 01 Jun 2023 07:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1685628989; x=1688220989;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=twYg540X1PIqbMF2MOY+lphD+IJXhD0ehbrQ95GCUew=;
        b=jGOM7i6CcGiTXBM1GKdxW+jDWjdpp2qglXKx6pdPELGipE5rc4OtuIloV7IG5PtsTa
         AhO2ZY5uCu1mLbAzLjCtGTTEbs/0A5y+LD09wjEcQHrh5s5BmE8SOnMudG2hb0hv4qJI
         63ENFL98pu0rrzG4Yqkt9aFn60UFMHD/omZWo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685628989; x=1688220989;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=twYg540X1PIqbMF2MOY+lphD+IJXhD0ehbrQ95GCUew=;
        b=lsZsfTTnLRyvJC3RzX73nFtuJ7VF0BwQBmqy7sfxOVhkLVub6epFFgEERFyIUqzrfZ
         defnpah46HlTUmANp2yXvS3ZPUoM5fgCEMeQsomFcauMUNi1pynUgrjIAjAcfHuT3juR
         0LBiW5EM0IskdTXYFJ6C1eUeZXpx/qX8JB3uRHulgw+3Vo6D4t2Tv8G4/B9on/1AF3H5
         3rsMLQ5TfVTHvH/4pniSLFAyc+2Y+3CRkiWU9VaG5EPxaickD82epBNSno2NqP7WC2fy
         s4R0B86wLEM3iv5Vc+hoF+T8dcW9xTdfkkNFsrip88+kpg2CMfgy+GzrK5quJ0MhtS1w
         pjOg==
X-Gm-Message-State: AC+VfDzQomsdlSltunpu/yleW05582Pq1qMEtatXFsG/OJTmbLONRhZy
	ZFyPYh8HjsayD3YGZ+R8jsMKRA==
X-Google-Smtp-Source: ACHHUZ6dhSWZ+kaR9tr/tIo/y+AEBG5s4fnH5RJmGHToxHiUhgSxFkypP+G3Y/KlWXTXgmEvAZ48Zw==
X-Received: by 2002:a05:6a00:24cc:b0:644:8172:3ea9 with SMTP id d12-20020a056a0024cc00b0064481723ea9mr7579505pfv.15.1685628989187;
        Thu, 01 Jun 2023 07:16:29 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id c24-20020aa78c18000000b0064fe332209esm5272822pfd.98.2023.06.01.07.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 07:16:28 -0700 (PDT)
Date: Thu, 1 Jun 2023 07:16:27 -0700
From: Kees Cook <keescook@chromium.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	linux-arm-kernel@lists.infradead.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org,
	Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH] firmware: meson_sm: Fix memcpy vs iomem type warnings
Message-ID: <202306010716.02A835503C@keescook>
References: <20221012185234.never.936-kees@kernel.org>
 <166602031304.3572695.12870664862275915316.b4-ty@linaro.org>
 <202305171124.4EB0D65@keescook>
 <9158d9ca-fe00-760c-4c95-f2ee045038ee@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9158d9ca-fe00-760c-4c95-f2ee045038ee@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_071632_178726_ECD51D9B 
X-CRM114-Status: GOOD (  26.08  )
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

On Wed, May 31, 2023 at 10:59:14AM +0200, Neil Armstrong wrote:
> On 17/05/2023 20:25, Kees Cook wrote:
> > *thread necromancy*
> > 
> > On Mon, Oct 17, 2022 at 05:25:13PM +0200, Neil Armstrong wrote:
> > > Hi,
> > > 
> > > On Wed, 12 Oct 2022 11:53:16 -0700, Kees Cook wrote:
> > > > Use memcpy_{toio,fromio}() instead of memcpy(). Silences warnings from
> > > > Sparse:
> > > > 
> > > > drivers/firmware/meson/meson_sm.c:170:17: warning: incorrect type in argument 1 (different address spaces)
> > > > drivers/firmware/meson/meson_sm.c:170:17:    expected void const *
> > > > drivers/firmware/meson/meson_sm.c:170:17:    got void [noderef] __iomem *sm_shmem_out_base
> > > > drivers/firmware/meson/meson_sm.c:170:17: warning: incorrect type in argument 2 (different address spaces)
> > > > drivers/firmware/meson/meson_sm.c:170:17:    expected void const *
> > > > drivers/firmware/meson/meson_sm.c:170:17:    got void [noderef] __iomem *sm_shmem_out_base
> > > > drivers/firmware/meson/meson_sm.c:206:9: warning: incorrect type in argument 1 (different address spaces)
> > > > drivers/firmware/meson/meson_sm.c:206:9:    expected void const *
> > > > drivers/firmware/meson/meson_sm.c:206:9:    got void [noderef] __iomem *sm_shmem_in_base
> > > > drivers/firmware/meson/meson_sm.c:206:9: warning: incorrect type in argument 1 (different address spaces)
> > > > drivers/firmware/meson/meson_sm.c:206:9:    expected void const *
> > > > drivers/firmware/meson/meson_sm.c:206:9:    got void [noderef] __iomem *sm_shmem_in_base
> > > > drivers/firmware/meson/meson_sm.c:206:9: warning: incorrect type in argument 1 (different address spaces)
> > > > drivers/firmware/meson/meson_sm.c:206:9:    expected void const *
> > > > drivers/firmware/meson/meson_sm.c:206:9:    got void [noderef] __iomem *sm_shmem_in_base
> > > > drivers/firmware/meson/meson_sm.c:206:9: warning: incorrect type in argument 1 (different address spaces)
> > > > drivers/firmware/meson/meson_sm.c:206:9:    expected void *
> > > > drivers/firmware/meson/meson_sm.c:206:9:    got void [noderef] __iomem *sm_shmem_in_base
> > > > 
> > > > [...]
> > > 
> > > Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.2/drivers)
> > > 
> > > [1/1] firmware: meson_sm: Fix memcpy vs iomem type warnings
> > >        https://git.kernel.org/amlogic/c/7dc69c7d073e6004a281db8f7f15cf6ebf702ea0
> > > 
> > > These changes has been applied on the intermediate git tree [1].
> > > 
> > > The v6.2/drivers branch will then be sent via a formal Pull Request to the Linux SoC maintainers
> > > for inclusion in their intermediate git branches in order to be sent to Linus during
> > > the next merge window, or sooner if it's a set of fixes.
> > > 
> > > In the cases of fixes, those will be merged in the current release candidate
> > > kernel and as soon they appear on the Linux master branch they will be
> > > backported to the previous Stable and Long-Stable kernels [2].
> > > 
> > > The intermediate git branches are merged daily in the linux-next tree [3],
> > > people are encouraged testing these pre-release kernels and report issues on the
> > > relevant mailing-lists.
> > > 
> > > If problems are discovered on those changes, please submit a signed-off-by revert
> > > patch followed by a corrective changeset.
> > > 
> > > [1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
> > > [2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
> > > [3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> > 
> > Hi! This change seems to have never been mainlined and seems to have
> > disappeared from linux-next.
> > 
> Hi,
> 
> Indeed it was rejected by Arnd, but I failed to find time to investigate how to fix it
> 
> https://lore.kernel.org/all/4a6b34ef-f5d2-4e56-a7f6-6a7c9cdda416@app.fastmail.com/

Ah-ha! Thanks for the pointer.

-- 
Kees Cook

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
