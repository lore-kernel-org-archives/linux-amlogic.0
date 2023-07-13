Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96EC6EB64DD
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Jul 2023 09:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ADJf/A7trkxASKV6l1FUi4IxpLGkwYo7bg+l8IuL4iM=; b=IpO5if1RwqV14M
	yjhU6dszDJnut9tAb9wtC0jzah60nSEIZLHrMxoA+IJjD4GlxtpyKiuADoqiRTs9ItKWFeS87XwkK
	o9aFgI4uPM7JIAwLaSaxA9ZjrOlfGVH9Vu1N1903gJNC1OnehXCdA1TkJGOnLq/+/JOdZhtDxxWeB
	Zsq6D4TRxdwOL9PGTKvGTnCIhKQ0Zo8ThPxZEfgRGTIBWtre4RWjD0eVsHFqs4Jy1yOb9nr1mQYiQ
	I28qOq/ddhtJy8OcdvGbfsE1hmOXnCaaBfPX0o+WwZa4Md6ldWhEpZ+3flu1aEvKmOLvmDy9wSBui
	UTweHnZROFDY+pm7Bh6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJsyc-002gmF-22;
	Thu, 13 Jul 2023 09:51:10 +0000
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJsyY-002gkV-33
	for linux-amlogic@lists.infradead.org;
	Thu, 13 Jul 2023 09:51:08 +0000
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-57a6df91b1eso4320577b3.1
        for <linux-amlogic@lists.infradead.org>; Thu, 13 Jul 2023 02:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689241865; x=1691833865;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qmboCy6O4VZ2QerNW0sFMiABzsIB0mZysPTru8Y01c0=;
        b=X+8WGU6NKzCqjvvD/xjNcjLtelRyK4iDs5BbDHlVwg1VEjSYATF5eO6w6UvsQijYgc
         LIdpy+8823AqRqqtHm/Byn5SnqU1jioj8iWBucyIO/8GGCKLPNopCe07qsbotbXNuZ/K
         ZChW9oJeLkneHmewLrbX0xWrOgsVkbtD9LMsu/sfgvQyAM0EQ52A1JXSqIefW9fRHRwO
         icCCl6CpS4rfSgfkpOpdEpz1JoFxgmdpRDMd28Fear69VP8cm55IvbgZKoA/6eMnyjBE
         f77w9OCZLVZibWJbXZNWqcm9xxEZLbW/SsfVsql6cPXnbNLDdYQikWeVAg+gWJI3fOg6
         WLuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689241865; x=1691833865;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qmboCy6O4VZ2QerNW0sFMiABzsIB0mZysPTru8Y01c0=;
        b=FqiJQgsFsEM5OklvJnIdO7k8QY/RyoaWexOLVoRC+h8KYqQtJ9M5a92yYTYm48KUXH
         6LnxXb8qBzkvmIeji/ogGnyiugEtRyEJ6cDXD5B+tMO8n9FGe/korUUyvY1Ql4hL9vIU
         IfsjmgeAhPDfmjzXAYi37yd3Cl6lWcux0pYKXttM+F34MSp7zGfN2DBKY64HJU68GPTc
         A+v3H+15T5fLLxugd3cD3K+qF/E96O39w9u0si4NQqUtyn1LecuX5yge8npS3V6ts8pJ
         pyECEbLr4hyWDsvnQRsTNl0S2Fysv5GFCCEFFDoWBmqYGRleYGLyLJ2ezwIR26/+928m
         aRXA==
X-Gm-Message-State: ABy/qLYIm/1qtdn+xLgyBKSXmiMIYwuvmwLcK8QWovNDrmgmdaKQKsJb
	nFFgZKRGAwOVtEX9XvfGzRtJ0o73Kpu+arb9JLiu7Q==
X-Google-Smtp-Source: APBJJlFFmSyXB6CIf5q786088dWd85CG5uGJ6KY0/vrCcgZMUgfn7tKweyGDHdnOOxLB1Txzq8Ej/g9GKVXT25PnLoE=
X-Received: by 2002:a81:7744:0:b0:577:189b:ad4 with SMTP id
 s65-20020a817744000000b00577189b0ad4mr1148836ywc.48.1689241865319; Thu, 13
 Jul 2023 02:51:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230707140434.723349-1-ulf.hansson@linaro.org>
 <20230707140434.723349-4-ulf.hansson@linaro.org> <0c8938a9-7a26-bf97-51ee-0c271901ec21@linaro.org>
 <CAPDyKFrOye96GyHS0tiTQ02Ve5S6Crtk8=bMsRS9Ljj=h5-nWQ@mail.gmail.com>
 <1496b9c1-289a-c354-f0ae-e14fd4c9bcfa@linaro.org> <CAPDyKFr7Mqy5bisLcxcA_iEGWqL8SFt2mDDng7zYEaTD1vNisA@mail.gmail.com>
 <deyyt5r2wkxo7ily434gl3wudls2sbinkmnehssqshwnbzmlwf@lmqskj6zwfu2>
 <CAPDyKFoRtEXTGQkNzGza-sS_j1ajGmjtCTaoPB7PXVDE2bS0tQ@mail.gmail.com>
 <2ef84fb8-b5eb-4c9a-b8a1-0c5f33e7f572@app.fastmail.com> <sxyavxzvezu5dorysn3nmwq7ew5xdclpm7rg474cifnnzy54mb@jljrhirrir2i>
In-Reply-To: <sxyavxzvezu5dorysn3nmwq7ew5xdclpm7rg474cifnnzy54mb@jljrhirrir2i>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 13 Jul 2023 11:50:29 +0200
Message-ID: <CAPDyKFoQoKx1uEpFBNfsaCFEG_9TOzSdNW90h-+bVz+_3xYObA@mail.gmail.com>
Subject: Re: [PATCH 03/18] soc: amlogic: Move power-domain drivers to the
 genpd dir
To: Bjorn Andersson <andersson@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Olof Johansson <olof@lixom.net>, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_025106_985203_82530C03 
X-CRM114-Status: GOOD (  32.66  )
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

On Thu, 13 Jul 2023 at 02:45, Bjorn Andersson <andersson@kernel.org> wrote:
>
> On Mon, Jul 10, 2023 at 02:45:12PM +0200, Arnd Bergmann wrote:
> > On Mon, Jul 10, 2023, at 14:37, Ulf Hansson wrote:
> > > On Sun, 9 Jul 2023 at 04:21, Bjorn Andersson <andersson@kernel.org> wrote:
> > >> On Fri, Jul 07, 2023 at 05:27:39PM +0200, Ulf Hansson wrote:
> > >
> > > If I understand correctly, you are suggesting that each platform
> > > maintainer should merge the immutable branch with patch1 - and that I
> > > should send the patches (based on the immutable branch) to each of the
> > > platform maintainers to manage. Instead of one pull request with
> > > everything directly to Arnd, right?
> > >
>
> That's what I suggest, yes.
>
> > > This still means that Arnd will have to resolve the conflicts as the
> > > pull requests arrive in his inbox.
> > >
>
> Yes, we will have N maintainers modifying drivers/genpd/Makefile, all
> adding their single obj-y line. A quite trivial conflict to manage.
>
> > > Although, I guess what you are looking for is less work for the soc/
> > > maintainers, which seems reasonable. Although, in that case, I might
> > > as well share an immutable branch with the complete series, rather
> > > than just patch1. That should help Arnd too, I think.
> > >
> > > Again, let's leave the call to Arnd on what to do.
> >
> > I think it's much easier for me to pick up a single branch with
> > all of your patches. For platform maintainers, other changes can
> > go one of two ways:
> >
> > - send a normal pull requests with changes against the same
> >   files, and have me take care of any conflicts where they
> >   arise. Since most of the changes are just simple file moves
> >   rather than changing file contents, 'git mergetool' handles
> >   these fine is most cases
> >
> > - If there is a non-obvious merge, the entire genpd branch
> >   can be shared as an immutable branch, with patches for
> >   a particular platform rebased on top of that branch.
> >
>
> I already have a set of patches to these drivers in my tree for v6.6, in
> their current location.

Right.

>
> I'm afraid I am unable to see how we're going to handle the merge
> conflict you're going to create in linux-next. Perhaps you're proposing
> to just never publish Ulf's patches to linux-next?
>
> By me merging the immutable patch 1 and the qcom-patch, the conflicts
> would be minimal, and except for the genpd/Makefile entirely handled by
> me.

If you would merge the immutable branch containing the complete
series, that should work too, rather than just patch1, right?

As a heads up, I am planning to send the pull request with the v2
series tomorrow, allowing a few more acks to arrive. At that point I
will announce the immutable branch too.

Kind regards
Uffe

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
