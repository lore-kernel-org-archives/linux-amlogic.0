Return-Path: <SRS0=phzD=OL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38BE1C433F5
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Sep 2021 07:22:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB25B610A0
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Sep 2021 07:22:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DB25B610A0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/7IhCAM6uWrX6yo/44jc9hzL3mguYP3LncHhDXDqCsM=; b=jCA/QWdeRA7JnG
	aWa+/IqRwwKSyCbYPf8HN/JBJ7nZ9Dp92M/tjRAHXDbP99X4HZ9QoON38n+GvvngT27SlZBKwRpyN
	w4Muypg/bUW1KnfgRSQnqhok8TwKxqKo33J68TIb0E5p3NGybhwt8miGTTUKe6IK+DX1E4TWK4ba6
	cIC+gsGkH0hfBguFgUU+keXW+N9XxHQPFSxC5YuWYjt9PVVKEwY/uFqMM+5k/HuApvkXbtizlhWwn
	LQODq44rox9EnCnhtokZAm9gGZlMZSgO9YVRp410VNiljkG4hfk2ZBKLF0TCtR6jpuBst9Gh2egmU
	ki4gjR12QbxlsiohQA4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSa7A-003mdw-QE; Tue, 21 Sep 2021 07:22:52 +0000
Received: from mout.kundenserver.de ([217.72.192.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSa77-003mcB-H6
 for linux-amlogic@lists.infradead.org; Tue, 21 Sep 2021 07:22:51 +0000
Received: from mail-wr1-f41.google.com ([209.85.221.41]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1Ma1HG-1mPPFK2SbU-00Vun3 for <linux-amlogic@lists.infradead.org>; Tue, 21
 Sep 2021 09:22:46 +0200
Received: by mail-wr1-f41.google.com with SMTP id t7so3022886wrw.13
 for <linux-amlogic@lists.infradead.org>; Tue, 21 Sep 2021 00:22:46 -0700 (PDT)
X-Gm-Message-State: AOAM5334gGwg5C2V/hwIMndU9wCr/ivTW280zVgcHPuKJKBepVLw6Ru9
 RtAXjGaDlIKQh09j0MuSdMK4qGhatC9zGOgVDIs=
X-Google-Smtp-Source: ABdhPJzapA/5jtcoB94jn9ge9Fj+s5pxy/e/DbFSc3rYCEZg0MHMrtc17EsSTcWr8PozWiJ0+otX+Z1g+aGoXHzkQ6A=
X-Received: by 2002:a5d:6c6f:: with SMTP id r15mr4994612wrz.428.1632208965957; 
 Tue, 21 Sep 2021 00:22:45 -0700 (PDT)
MIME-Version: 1.0
References: <CAEsQvcsNLJYezYNpDNGJX49NhWgAqjAYAPDcbwrg3+0PmZdh+w@mail.gmail.com>
In-Reply-To: <CAEsQvcsNLJYezYNpDNGJX49NhWgAqjAYAPDcbwrg3+0PmZdh+w@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 21 Sep 2021 09:22:29 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0tKubvQR=Tks7sfWbR6n39DGOiXrkdBV8jUwa70X4kug@mail.gmail.com>
Message-ID: <CAK8P3a0tKubvQR=Tks7sfWbR6n39DGOiXrkdBV8jUwa70X4kug@mail.gmail.com>
Subject: Re: Regression, bisected: meson-dwmac8b never loads, no ethernet
To: Geraldo Nascimento <geraldogabriel@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 "open list:ARM/Amlogic Meson SoC support" <linux-amlogic@lists.infradead.org>
X-Provags-ID: V03:K1:lJw9FR22qqhAkiP8v/gfzgQzgQ3BcHfmeyz4tAXA9g+n3Z7kq+b
 zByRtwv3c6T02LISGYrBpvrIvKRjYkrOW5oKaf6Arj9jrKo6nflrep65VrFNwRQY0n0kxcB
 SKu6CoUdlT6rkzZ61p32221SZjFp4QaPVHChOQwdPtQYpDrd2R77UQxDkNuYq2FSXu16F86
 O1VnRMGzNxkz1/w9w86Fg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:1swrVkIrY9I=:H40qrgTiyu8bKKQxHYHYgj
 iA5Q31OhRv5XNKPXqGCy/EUC/cOIfGAlF8TNfOx9xBxasuofKmNl81KsSkBQlJcOyusVLMYp0
 jzf42LJVTCTyJGvu8yDiqTzSsuhBsaQGhIgccBRo+V9E1MLuMHaSD0wxxrze8NH87QeV6Osql
 Pj9jh6l2I1GUFGV3nAZrDHEG0QMZIdH7YDwys7kIcZ9CXSEO9AyMw1f4UNo8zk12GZQkSuwlh
 delfiX1GBSNX5v9GUB4Wo1RX7lXZAsAZGbWeDIj5oifz/PSkxbrdrVGx9YrpZfrQxPhbns/fB
 EWqEdqGJgzihkdBMBJg7GM27T9lC5AdHoTJ4pwBP26SqShu2vcKJnKuHZMlovhYwqVBK9N8jP
 hd8cyp8yJ9pbSfMwYwhVzF5Uugm31svzCK13pFI1zVW8Uyb5ZBHQKRjYASAC8wT3YE2BcyjFn
 N7U4HPYucT6PTw3g0ZWQ0q61WOyydsUoO0bHOd9kBRn+xZm/rYuv7VCpr9/799pDT9pmvDC22
 EWq0NEWxUcNLhHVBg+HjnJbMeKjLSG4/+C+2GesdKZI8VN23zV8Fo8woij7rVxzUgJPvF5hVh
 7LbKIjbi1hJkAPqWLGGEiydAHEjnjOpt3PSs+vJ6AWPbFL+bMvlZkGyKII6JX2zmvmHZCVWg+
 nBWwKS4X5GCP5OeOWCAiCsmGtZZWQJGb2aLSDJ+6NWRj269+ZBvlyri9SieX3gnvZQf43xa8S
 OrIKFViB5ReG3++daskGazRHDWHb2kAYyi8dSg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210921_002249_909976_D9C0DFBD 
X-CRM114-Status: GOOD (  17.07  )
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

On Tue, Sep 21, 2021 at 1:43 AM Geraldo Nascimento
<geraldogabriel@gmail.com> wrote:
>
> Hello Arnd,
>
> I'm sorry to inform you that commit
> a0f480dc6546b9d97027bf7bc8145aad48ddad00 causes a regression in
> 5.15-rc1 for the meson-dwmac8b ethernet driver.
>
> meson-dwmac8b never loads and libphy never probes stmmac
>
> I've bisected it over the weekend. The results follow.
>
> The bad commit mostly consists of qcom DT changes that shouldn't
> trigger anything nasty like missing ethernet for meson (amlogic) but
> there's the possibility the regression is caused by stmmac
> modifications inside "Merge tag 'v5.14-rc3' into arm64-for-5.15
> (2021-08-16 18:02:26 -0500)"
>
> This is just a guess as I haven't been able to pinpoint so far what
> precisely causes the regression.

I'm sure it's not this commit, looking at the contents of the tree
before and after,
it does not touch a single file that is used on your machine.

Sometimes bisections are unreliable. I would suggest you re-test commit
 a0f480dc6546b9 and the one before it, one of them will likely show a different
result from what you had. You can then replay your bisection to find
the actual cause.

       Arnd

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
