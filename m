Return-Path: <SRS0=b0VC=J2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61EA6C433ED
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Apr 2021 20:50:32 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6D5C6143A
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Apr 2021 20:50:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D6D5C6143A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1CUwyP7Bu+g9rCQ+XCW389gCR96jKEsfbQGGgXUv6CQ=; b=NiBYn9gfr6DGVv+7cUZ0klYvf
	UixthOk0e7Oj2RG57Z+XxV1sfXurtRoiFeWClP3Ndhs3qd7nMJy3o+r60h2BZLpbMf0dZmX/gWomo
	Dnd3Qlo1939HxbTcwwCDd9mkyTAoggEuSZ2lNC/AEMyyFFtAAuvjg49OdC8CkR5SGrs21VDCJy6JQ
	sfBWTZPSbs1N07hKupMHT85wCPd/IkNKyKIRAfWEY77llDHYAiVhhJP/2d/nVdxXVM+eiGTRFkIbQ
	lgl81tl18knc34PwRlvZKeY8CzkR4SRAt9y3fr0cA8WNJtbrbZJBc6zXDXObuDOHSKFs3s2gAjasc
	ze8Y98yPA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lcDc8-006WPT-8q; Thu, 29 Apr 2021 20:50:24 +0000
Received: from [2607:7c80:54:e::133] (helo=bombadil.infradead.org)
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcDc3-006WOl-QD
 for linux-amlogic@desiato.infradead.org; Thu, 29 Apr 2021 20:50:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=gYep7DOlIrBwf9rsY4DQWIcoFlibsgvSZY3B/DcJdfg=; b=lhLveqahtQj0h3lpRxAkz0LcTy
 6IT3AwcJTY9Od6fmxxscDrb69PuUlGsoV7ShunWqJGz5pvP45kMPp1S/sjTji8X5jliEhzon45hdT
 W0B1eOKauZOBagnDWFDdrAFHAhoBpPeMwZNMj24qiSb+d7+y92ako5vjdkiytZqGQB485amSuES0Z
 +kcJ6wYxLY3d4GujMRjCX42/HkSsjZ9Bf9GCNGJQri3sthXh/GMP5p8e0m+F3gKXOn7TT8wjFoW1p
 o0AhVbamAJYVx2bM685TTOcV/PS4AworqqUMNffxoZ+/jfj2ZdrYIG7ggRDpBz/SpQP2cdMHet7RB
 BfnzR6/A==;
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcDbr-000y5I-5J
 for linux-amlogic@lists.infradead.org; Thu, 29 Apr 2021 20:50:08 +0000
Received: by mail-ed1-x536.google.com with SMTP id q6so20907814edr.3
 for <linux-amlogic@lists.infradead.org>; Thu, 29 Apr 2021 13:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gYep7DOlIrBwf9rsY4DQWIcoFlibsgvSZY3B/DcJdfg=;
 b=I25T9hixgQAsDaNe83dVEDp50wP1nN6G63BPhGqPcFsE2D5fUk/NTom7hVS70E4DRA
 VhvrxRR9YtQ02ExDrIkFXqjDFp7mnrpJjQA5Ra+hqaL3IgOFJelW95+rYKQ8OsL9Ft44
 flHVH0IVmclqSFS4asalpYPc6lQO4ZKkbEzXzh//j2DVZOjxObUaLKKltYPxXMydK9W2
 1bVV6+GIol/5a1eM/UxaYzBucIDBoDQPP58MneazC6EflvUABOhm8q2qXH3XI17dt+vt
 GhyWVd3H6XsBoQCZjSpfoMkwt6PfobGaiV/j5dc1Npb4cgLIE67REI/XQ4rJogA9YNFc
 Nkag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gYep7DOlIrBwf9rsY4DQWIcoFlibsgvSZY3B/DcJdfg=;
 b=g6iXCFGZwsDoOy4AzNZaujAbKoBYqzPJOUTHzm5Y6N3/1EcAKyWyvC9rb7/PKJ+Lsz
 axEqm0XnlvRE0pCoDzz8whw98vwfTq+pjxbW1UK+bHUz2QHAWzlF9EPZTpFTIusSFYWC
 YxpIh2aC3nG2CAYybLH0aMOzcfPjDEq229hn3qcQl73EWHe3x3SeKDzJMTMFu/S3GJjd
 VN2ZIhlJmkxFO8XJhJxpgxPvrWIPcEhhZq72I20YioleZs3zk/UM3Ra+BOpSjiiiPlY5
 Rf0b/VxrQ7Drdh37R5BaZSYdrrvoP+MKepGoSFlxNJ0hQUA+FkY8fz/R5qweNFKhNX85
 wMJw==
X-Gm-Message-State: AOAM531YxCqyhfC7+ZK6ChqmDYHq/ij4QyvhTm53Iq3js6f20hnvOdq3
 eUj0E1wUtuxenrqUt4RbU1YuDsU02vDi7jyHvl+jcVKgfoo=
X-Google-Smtp-Source: ABdhPJz8oW/YGEAMbGIiBMqPkwePjgTRbJCwGYkAtXYds2j96mVj2F2/CsZH1CG9WOp4AOfV5vP0fYnhzUgu+uuDVEU=
X-Received: by 2002:a05:6402:3109:: with SMTP id
 dc9mr1833460edb.13.1619729404817; 
 Thu, 29 Apr 2021 13:50:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210429090516.61085-1-jbrunet@baylibre.com>
In-Reply-To: <20210429090516.61085-1-jbrunet@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 29 Apr 2021 22:49:54 +0200
Message-ID: <CAFBinCCcKHqd7Mh3bV9NyyWzi=96pCWxzSZBOjg5Puy9wOuihQ@mail.gmail.com>
Subject: Re: [PATCH] clk: meson: axg-audio: do not print error on defer
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210429_135007_222711_7867BCF2 
X-CRM114-Status: GOOD (  14.46  )
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

Hi Jerome,

On Thu, Apr 29, 2021 at 11:06 AM Jerome Brunet <jbrunet@baylibre.com> wrote:
[...]
> diff --git a/drivers/clk/meson/axg-audio.c b/drivers/clk/meson/axg-audio.c
> index 7c8d02164443..5e501eff0840 100644
> --- a/drivers/clk/meson/axg-audio.c
> +++ b/drivers/clk/meson/axg-audio.c
> @@ -1811,7 +1811,8 @@ static int axg_audio_clkc_probe(struct platform_device *pdev)
>
>         ret = device_reset(dev);
>         if (ret) {
> -               dev_err(dev, "failed to reset device\n");
> +               if (ret != -EPROBE_DEFER)
> +                       dev_err(dev, "failed to reset device\n");
many drivers are switching to dev_err_probe nowadays
According to it's documentation:
  In case of -EPROBE_DEFER it sets also defer probe reason, which can be
  checked later by reading devices_deferred debugfs attribute.

so I think it makes sense to use dev_err_probe here as well


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
