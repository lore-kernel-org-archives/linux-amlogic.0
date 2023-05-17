Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB90EC77B7A
	for <linux-amlogic@archiver.kernel.org>; Wed, 17 May 2023 18:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l4faHBIE1rl/9uTKD1TOpGgIxXjSOvxc/CX+gNkXJCQ=; b=oc5HvJrAviz/dg
	CClIL7onnBSTaNBfFbz1FhoqfHS6h7/wGIalyiiQ7re3Sp6r+tobkS1f2acaqQabMmhuELoZmduad
	7Dp49VUhkGVSieCFBJDx/6TaNnixPNEP2xfhrqPwonq4jhAEYtOHIs3R7ln68OVXYI6NRXfo3OKC7
	d4i9W0QQkwFPX8CKfnp8QYwcuOv+N4jumOim2Up1Eosbfb+hpovW5YwYIWUl5DTcdFWdpw9/gpOfy
	kDPafUeCmZe7muKUOB+da8kpeJXgrEY8IYJxfIXVHQZ01NCUxBkGQHOwp5DlE4gboPhi5g963GloW
	aZ+2iXACgNRJNZUe3kbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzLpr-00AjQH-2h;
	Wed, 17 May 2023 18:25:15 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzLpo-00AjOu-2R
	for linux-amlogic@lists.infradead.org;
	Wed, 17 May 2023 18:25:14 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-52c30fa5271so583335a12.0
        for <linux-amlogic@lists.infradead.org>; Wed, 17 May 2023 11:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1684347909; x=1686939909;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=45x6aIah125jOfw5DAw6akq7zYqDXWAyHyu9qSo7fA0=;
        b=H4099AwsRNj44sSGT6ogy8ufHfUuk1mCMpajqaFZm2RTsiOdTWnzN9o7fIL1fi+EN/
         DpMuUzPEUrTkIZFJWr7HT+5pu/aGMFZ9bFyqkVh4QGn8PH6i3QHtZBcMqwbgsN1Q26F9
         IaNgpyu3EyiCRbB+GFhmdhMe3m9A6KuTRo4ag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684347909; x=1686939909;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=45x6aIah125jOfw5DAw6akq7zYqDXWAyHyu9qSo7fA0=;
        b=jafre8Lfs/lEqvU0aJdLAbkGNuu/nft+ZEQSASfG/ssqelxaAGaNx9bm8CgH+d3PpW
         9XM5mAysKLcU47+uG16YPJELx+RBBen8Gc27OsWLaOaAePBvs2Hd6iq/mzWvf0+NfqMr
         SuZ6kiBrxBDCDst6/WAhy0UbZQ3JwoMBq5rGURpIgYmYNF1PulKVYbSHdENkLTo+RhT+
         PpIofVI6zp2NZrKryg5WurCskIAScr58/ZBI1orZIhHLkIwgKbiwthxjpADa8BqtKepE
         TGOcN/vZqcdwNfGo25b8lc4qUup/cDCIl3+LxIXeV3D1wgWk2PFlnMeAST+vL7xUlbxz
         DgFA==
X-Gm-Message-State: AC+VfDxU2ase6HsjgtxwAZr1+Fo2DH259+1CPUD5IDiBWiwJKHZD/lza
	ur4TIWhYogau1xsZoGUQ1yM4vQ==
X-Google-Smtp-Source: ACHHUZ7HRV57oX9mtBvMxH/rRkgfAocqgjQoyV0w1AqbEJxyB1hldkewGUNpqsBE+e10ortGtNQ0Lw==
X-Received: by 2002:a05:6a20:1590:b0:105:5086:fd42 with SMTP id h16-20020a056a20159000b001055086fd42mr20303935pzj.45.1684347909705;
        Wed, 17 May 2023 11:25:09 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id y24-20020aa78558000000b00634a96493f7sm13122932pfn.128.2023.05.17.11.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 11:25:09 -0700 (PDT)
Date: Wed, 17 May 2023 11:25:08 -0700
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
Message-ID: <202305171124.4EB0D65@keescook>
References: <20221012185234.never.936-kees@kernel.org>
 <166602031304.3572695.12870664862275915316.b4-ty@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <166602031304.3572695.12870664862275915316.b4-ty@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_112512_821829_900ACE7C 
X-CRM114-Status: GOOD (  17.95  )
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

*thread necromancy*

On Mon, Oct 17, 2022 at 05:25:13PM +0200, Neil Armstrong wrote:
> Hi,
> 
> On Wed, 12 Oct 2022 11:53:16 -0700, Kees Cook wrote:
> > Use memcpy_{toio,fromio}() instead of memcpy(). Silences warnings from
> > Sparse:
> > 
> > drivers/firmware/meson/meson_sm.c:170:17: warning: incorrect type in argument 1 (different address spaces)
> > drivers/firmware/meson/meson_sm.c:170:17:    expected void const *
> > drivers/firmware/meson/meson_sm.c:170:17:    got void [noderef] __iomem *sm_shmem_out_base
> > drivers/firmware/meson/meson_sm.c:170:17: warning: incorrect type in argument 2 (different address spaces)
> > drivers/firmware/meson/meson_sm.c:170:17:    expected void const *
> > drivers/firmware/meson/meson_sm.c:170:17:    got void [noderef] __iomem *sm_shmem_out_base
> > drivers/firmware/meson/meson_sm.c:206:9: warning: incorrect type in argument 1 (different address spaces)
> > drivers/firmware/meson/meson_sm.c:206:9:    expected void const *
> > drivers/firmware/meson/meson_sm.c:206:9:    got void [noderef] __iomem *sm_shmem_in_base
> > drivers/firmware/meson/meson_sm.c:206:9: warning: incorrect type in argument 1 (different address spaces)
> > drivers/firmware/meson/meson_sm.c:206:9:    expected void const *
> > drivers/firmware/meson/meson_sm.c:206:9:    got void [noderef] __iomem *sm_shmem_in_base
> > drivers/firmware/meson/meson_sm.c:206:9: warning: incorrect type in argument 1 (different address spaces)
> > drivers/firmware/meson/meson_sm.c:206:9:    expected void const *
> > drivers/firmware/meson/meson_sm.c:206:9:    got void [noderef] __iomem *sm_shmem_in_base
> > drivers/firmware/meson/meson_sm.c:206:9: warning: incorrect type in argument 1 (different address spaces)
> > drivers/firmware/meson/meson_sm.c:206:9:    expected void *
> > drivers/firmware/meson/meson_sm.c:206:9:    got void [noderef] __iomem *sm_shmem_in_base
> > 
> > [...]
> 
> Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.2/drivers)
> 
> [1/1] firmware: meson_sm: Fix memcpy vs iomem type warnings
>       https://git.kernel.org/amlogic/c/7dc69c7d073e6004a281db8f7f15cf6ebf702ea0
> 
> These changes has been applied on the intermediate git tree [1].
> 
> The v6.2/drivers branch will then be sent via a formal Pull Request to the Linux SoC maintainers
> for inclusion in their intermediate git branches in order to be sent to Linus during
> the next merge window, or sooner if it's a set of fixes.
> 
> In the cases of fixes, those will be merged in the current release candidate
> kernel and as soon they appear on the Linux master branch they will be
> backported to the previous Stable and Long-Stable kernels [2].
> 
> The intermediate git branches are merged daily in the linux-next tree [3],
> people are encouraged testing these pre-release kernels and report issues on the
> relevant mailing-lists.
> 
> If problems are discovered on those changes, please submit a signed-off-by revert
> patch followed by a corrective changeset.
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
> [3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

Hi! This change seems to have never been mainlined and seems to have
disappeared from linux-next.

-- 
Kees Cook

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
