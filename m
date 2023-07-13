Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68CB6EB64DA
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Jul 2023 00:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=45Z2Na+9Yt1OYMsM4USSKwFJwGF2f7tBQSXTuwMSrxI=; b=roK/oTee0cIoIA
	GqrFvD+Fma3cdHa/EjOc3NyQ0NuP8twpsFAoUAbQNqL8h6BgaGSBdWC1v0dDgNiWBEwM353fC+qnO
	/yPyOmjr8d8bTcrT/w+kmiWloF46w8gDGe4gqSRq8ytZk/zca8MY+IedbMVi2IfOtW2z3tBJIskDC
	CxcU3/a6Mre//7a/vjPYhHMhnIArhwzB33k6sxs5kEfVRXh+cvw+J9JAp1yV5KJxlwGQzhy/8xqR4
	ZxcP0vV9sG+DMfqrlkBmKg8kgiHtneW6N4/VJ+29A44HO/yPii2NHx46MyO9Ujo5BnK9PL/9YFxmH
	FFbUoK19UO1EXDan5cwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJkSJ-001aai-1e;
	Thu, 13 Jul 2023 00:45:15 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJkSG-001aaL-1k;
	Thu, 13 Jul 2023 00:45:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1682761804;
	Thu, 13 Jul 2023 00:45:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B17CCC433C7;
	Thu, 13 Jul 2023 00:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689209110;
	bh=yFR665h9HRQk4pzANvQ3qHMfUBBBNqtYA9IDmea3bl4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h6Mhpi+vhSR90aqCx0cW1C4/k+xrLy1DIqs9jKvP11Np+NlifitcfNmKVxrp9qYsX
	 Nt2XBI02n6ugLfWwPQM3Jg5wsX9O/5rNAYmGx4y851kRmvhE2hp58kp0vUCaFG/2oi
	 oa1ODPQ93bKz+pl8HlRWxcsrydbnoKcPVQw+C3P2GIe6iK33gaLO+SgDDe/Q82lXiS
	 /gAZGF522pGGnPQMMMLEikQuWsLqbT5zZUyV7I1ApT4UziL6/gBr8U4FtBqyjvf+VF
	 dvWOMGrnq3rYzcqMa1Dy3d/IP9sgn2pUoqY0dBGfGdpM4/FpshuYYwuzM8b5djfOEm
	 m5IWUogCSIajw==
Date: Wed, 12 Jul 2023 17:48:41 -0700
From: Bjorn Andersson <andersson@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Olof Johansson <olof@lixom.net>, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 03/18] soc: amlogic: Move power-domain drivers to the
 genpd dir
Message-ID: <sxyavxzvezu5dorysn3nmwq7ew5xdclpm7rg474cifnnzy54mb@jljrhirrir2i>
References: <20230707140434.723349-1-ulf.hansson@linaro.org>
 <20230707140434.723349-4-ulf.hansson@linaro.org>
 <0c8938a9-7a26-bf97-51ee-0c271901ec21@linaro.org>
 <CAPDyKFrOye96GyHS0tiTQ02Ve5S6Crtk8=bMsRS9Ljj=h5-nWQ@mail.gmail.com>
 <1496b9c1-289a-c354-f0ae-e14fd4c9bcfa@linaro.org>
 <CAPDyKFr7Mqy5bisLcxcA_iEGWqL8SFt2mDDng7zYEaTD1vNisA@mail.gmail.com>
 <deyyt5r2wkxo7ily434gl3wudls2sbinkmnehssqshwnbzmlwf@lmqskj6zwfu2>
 <CAPDyKFoRtEXTGQkNzGza-sS_j1ajGmjtCTaoPB7PXVDE2bS0tQ@mail.gmail.com>
 <2ef84fb8-b5eb-4c9a-b8a1-0c5f33e7f572@app.fastmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2ef84fb8-b5eb-4c9a-b8a1-0c5f33e7f572@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_174512_715033_192B5EEF 
X-CRM114-Status: GOOD (  28.76  )
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

On Mon, Jul 10, 2023 at 02:45:12PM +0200, Arnd Bergmann wrote:
> On Mon, Jul 10, 2023, at 14:37, Ulf Hansson wrote:
> > On Sun, 9 Jul 2023 at 04:21, Bjorn Andersson <andersson@kernel.org> wrote:
> >> On Fri, Jul 07, 2023 at 05:27:39PM +0200, Ulf Hansson wrote:
> >
> > If I understand correctly, you are suggesting that each platform
> > maintainer should merge the immutable branch with patch1 - and that I
> > should send the patches (based on the immutable branch) to each of the
> > platform maintainers to manage. Instead of one pull request with
> > everything directly to Arnd, right?
> >

That's what I suggest, yes.

> > This still means that Arnd will have to resolve the conflicts as the
> > pull requests arrive in his inbox.
> >

Yes, we will have N maintainers modifying drivers/genpd/Makefile, all
adding their single obj-y line. A quite trivial conflict to manage.

> > Although, I guess what you are looking for is less work for the soc/
> > maintainers, which seems reasonable. Although, in that case, I might
> > as well share an immutable branch with the complete series, rather
> > than just patch1. That should help Arnd too, I think.
> >
> > Again, let's leave the call to Arnd on what to do.
> 
> I think it's much easier for me to pick up a single branch with
> all of your patches. For platform maintainers, other changes can
> go one of two ways:
> 
> - send a normal pull requests with changes against the same
>   files, and have me take care of any conflicts where they
>   arise. Since most of the changes are just simple file moves
>   rather than changing file contents, 'git mergetool' handles
>   these fine is most cases
> 
> - If there is a non-obvious merge, the entire genpd branch
>   can be shared as an immutable branch, with patches for
>   a particular platform rebased on top of that branch.
> 

I already have a set of patches to these drivers in my tree for v6.6, in
their current location.

I'm afraid I am unable to see how we're going to handle the merge
conflict you're going to create in linux-next. Perhaps you're proposing
to just never publish Ulf's patches to linux-next?

By me merging the immutable patch 1 and the qcom-patch, the conflicts
would be minimal, and except for the genpd/Makefile entirely handled by
me.

Regards,
Bjorn

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
