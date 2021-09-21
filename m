Return-Path: <SRS0=phzD=OL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57945C433EF
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Sep 2021 07:29:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 273B261131
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Sep 2021 07:29:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 273B261131
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BwXF/BVWCqY+mLLejLtmuCyoALc35MTibwUs52CgEPg=; b=fZg5rJ/jChECma
	2WS59qKslBzxMonqaj3wor554dPlh5O+2VgQnY/k+K4e8fH6xA3xyAg2/1OwYjBfI9FlyTO4FJu+X
	7zD68v2ttUGbH/d8enZ2q1h6iMtKJAFiU76sngNBdbNcQ2Ri+mPvK0L0ReDWL5mit7IUhSP93lSmM
	VoD1LzZaJYmqlofbAJe13r38dovPt+iNF8v30xNfOWmI8QKrL5exPSpVbIiBUv8bG6etHRGZMcAMQ
	46izGQcOSingsTHoQY8hDnFFnfwiQ06U/Cs1sef8Ntie1g5STYS2DyXIYI+iTOsa1FCfj4Ho77zpj
	leUprADrU/e4A3e9gfhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSaDx-003oye-6b; Tue, 21 Sep 2021 07:29:53 +0000
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSaDr-003ove-43
 for linux-amlogic@lists.infradead.org; Tue, 21 Sep 2021 07:29:49 +0000
Received: by mail-qv1-xf31.google.com with SMTP id f2so290614qvx.2
 for <linux-amlogic@lists.infradead.org>; Tue, 21 Sep 2021 00:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4/kOOKaZ50RxJSNwW6tnvCuMNEKkE1uE3r1ltKSMRuU=;
 b=e0cQh3UBtXIjKVuxhwyeARG+13GQBsQ2m+yis2VZr1SxB4cyyHSd7WmZQFzjo9Ch32
 3jSvGYOqzQQDtP/h+o/uNJKkEP45FijXYrdlnrnPqBPnodwtE/WtQZ00hIyf7F99OXea
 JdbMxudewBOWk3pFykVFTg9YdRSj6xor8vPHMZpIV4wWxbfMNURFRSgedHrpQZJg0Qsy
 4DGpuQ9ICvPNAiMHy9n0NfXq3C/BFa3B7z38gcjBmeYOAzIce0jv/16mQNHQ0pE0f9ds
 AH2II9glH1dlUVOGlOfFuQ/K5MZL/hYBVxiH2hTGyu8dDU8Hcia46AScJYBU18eSDV/C
 XkRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4/kOOKaZ50RxJSNwW6tnvCuMNEKkE1uE3r1ltKSMRuU=;
 b=wyVvHDrgnilmmf5NOApFOnhNg8cf7/yIrPbVtG93EMHXrXJr5PFLbuC+gsLFafANEm
 CSri6ykcB4vSlgmZFQgl11UpHiNpPpjWeptJH/Gj27P+baRO26yFXjiQd0V1O5rkqNqS
 1P47aJoVpLDw0RIZ+joh7y7ZshcY4qtCgNoAPPBEECZMfC1UHqRV5q7Z3q8W1N3TZIKg
 WmaFgXLvlprAe4WEaMA79yMh/JZk+kVDX+DHFu1OwLxfRdw4l5fsVvdd9rGwd1c0GNOl
 WmPv9LH3GX3gEwvGZZVb6muEueGdoZ8F3yqDzvWBGqlheaX4PZWsSFA+oBfVmPXDXoC0
 mHVQ==
X-Gm-Message-State: AOAM533eX6LO7gggA4LZqZ+2tHyayww7xwScY0HG5ZHWvjsERU3/W8Bs
 36BkKmn+MYfW9BRdVMayffCJ8sBYr6CqDZTpKP4=
X-Google-Smtp-Source: ABdhPJxqNAbSwLB5nGfi1AZe4Savd4K0SfrnRmGS7vVzvfJJ76vJ5mw1vY+4Q3qXYmk9z6aAvZBbniQaGXWCGP5LdZQ=
X-Received: by 2002:ad4:46f0:: with SMTP id h16mr1944430qvw.24.1632209386016; 
 Tue, 21 Sep 2021 00:29:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAEsQvcsNLJYezYNpDNGJX49NhWgAqjAYAPDcbwrg3+0PmZdh+w@mail.gmail.com>
 <CAK8P3a0tKubvQR=Tks7sfWbR6n39DGOiXrkdBV8jUwa70X4kug@mail.gmail.com>
In-Reply-To: <CAK8P3a0tKubvQR=Tks7sfWbR6n39DGOiXrkdBV8jUwa70X4kug@mail.gmail.com>
From: Geraldo Nascimento <geraldogabriel@gmail.com>
Date: Tue, 21 Sep 2021 04:26:15 -0300
Message-ID: <CAEsQvctqM_GRHuDomZHo+L0KVMu-vjd9p2DnZYdrcSQBy9_RXQ@mail.gmail.com>
Subject: Re: Regression, bisected: meson-dwmac8b never loads, no ethernet
To: Arnd Bergmann <arnd@arndb.de>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 "open list:ARM/Amlogic Meson SoC support" <linux-amlogic@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210921_002947_250914_6B7429A8 
X-CRM114-Status: GOOD (  22.50  )
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

On Tue, Sep 21, 2021 at 4:22 AM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Tue, Sep 21, 2021 at 1:43 AM Geraldo Nascimento
> <geraldogabriel@gmail.com> wrote:
> >
> > Hello Arnd,
> >
> > I'm sorry to inform you that commit
> > a0f480dc6546b9d97027bf7bc8145aad48ddad00 causes a regression in
> > 5.15-rc1 for the meson-dwmac8b ethernet driver.
> >
> > meson-dwmac8b never loads and libphy never probes stmmac
> >
> > I've bisected it over the weekend. The results follow.
> >
> > The bad commit mostly consists of qcom DT changes that shouldn't
> > trigger anything nasty like missing ethernet for meson (amlogic) but
> > there's the possibility the regression is caused by stmmac
> > modifications inside "Merge tag 'v5.14-rc3' into arm64-for-5.15
> > (2021-08-16 18:02:26 -0500)"
> >
> > This is just a guess as I haven't been able to pinpoint so far what
> > precisely causes the regression.
>
> I'm sure it's not this commit, looking at the contents of the tree
> before and after,
> it does not touch a single file that is used on your machine.
>
> Sometimes bisections are unreliable. I would suggest you re-test commit
>  a0f480dc6546b9 and the one before it, one of them will likely show a different
> result from what you had. You can then replay your bisection to find
> the actual cause.

Thanks, Arnd, I was a bit puzzled to say the least because that commit
seemed totally unrelated like you state yourself.

Like I have mentioned in my other email in reply to Neil and Martin,
issue seems to be gone at least for me in 5.15-rc2.

So unless it reappears I think there's little to do.

Thanks,
Geraldo Nascimento

>
>        Arnd

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
