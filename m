Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51FC2C433EF
	for <linux-amlogic@archiver.kernel.org>; Mon, 22 Nov 2021 09:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/3ucPBRAJyINCTn1xVxD3aRDrU5ZtZcxuWj0r0aWvnM=; b=GKrm5hVkqNttVH
	I6ypRnV6m1H3ieg3qhTiZakTwXpasbZI6+IAllXQz392Z8zJyc8m1ZW1JBr1tVIyku9OjixMkcT/L
	fcQLjthLtMWF0xXWJnQhFT2Fxt8OOHFEz4QozfIJmOusPG2ytbDxjeZUJDMh42K6AJV8bwDpSwAIx
	hu59RGmxdrb+nWeYKM/mU8A69aK6BndRDntAVGilybMYCNX6q3CopmICfloRrZ5CrB7w2YvnVRDHp
	/D/YzTmlMCjoFx1snFNcenBrIFVINoufWKarCjznjDRg+/uQAiHnR7Dv+eDUT6GZLF2Ksvz+8K9T+
	fLDkMakDFWabRPLw8CZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mp5Ho-00FTwK-Hi; Mon, 22 Nov 2021 09:06:52 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mp5Ff-00FTJA-Cr
 for linux-amlogic@lists.infradead.org; Mon, 22 Nov 2021 09:04:40 +0000
Received: by mail-ed1-x534.google.com with SMTP id g14so73652779edb.8
 for <linux-amlogic@lists.infradead.org>; Mon, 22 Nov 2021 01:04:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/n2Vm5z8nFGK+sbMSre7nkEQgLie2yLLJputlZIF0rw=;
 b=MGM9gXKyZV26D2lbgtxuuQwoJ9UQxDrIdr1g22N9dWWKStYfmVIfWgKcAeTAU2qFoh
 lkDXU/77a7NYdBZLLfansRByZ6LiJkpl+E6fasDgmtEYZjVwEL8PNuaAZQTBnzXsQxqR
 LnOX4xT/gYYayGwbXFAQyJoJszrL0txDfx6Xa+XZ0MSlsTYCzt/XHRBckPtKyA24sWCd
 90UPzxQx/YgyPDPoN5OzKUB5pbkHDVxtTBc6IDV6g/oYocP7F7j3vWm/D0/a9opZnnR6
 2NfLOThgtZslMgvYFBJEW53hlyu4OC6pDPXaeyA/fghOpmyvsMZ0ofu2q4FDbIqjZWAv
 PhDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/n2Vm5z8nFGK+sbMSre7nkEQgLie2yLLJputlZIF0rw=;
 b=SJud0AIuVcwETwzVww17Wi2IJPwPpgLfWnr4472SzYFrcJGnFuyvZI+H9txNST10DB
 lhT0o9h8A938VTmCdUc3zTky0dG2WtCyXY0KXCkRPceOsqAhj9jtgBF5fnDYvdnzGGob
 k931w+4WJWbAXRNx0V8yP4Tls6S7JBluIe/OPWkQA96lLDQGPI70KEKF29BA5Syp5aPV
 cuvZWF/OpWDK6DGAs5TPrfknaw4e1euM4H2t9dYEGUbavlFcxSmvOoQp/xuITgitR/Im
 0VWoCfztEBrT0ycBNyTwqUUCg0TzNnLMowrtvngLLH6WkBMtuFOBI+euaTlooz7cGitW
 HSAw==
X-Gm-Message-State: AOAM532XxqwetXPe56sa5qhVvlvMXjrERVlFslr9KW2db1FTwp+Es9Xu
 rUzrypEwAPd/dSbYTXq+oyJNfyQ5uXEAwZAjVi+kUfIXk1Y=
X-Google-Smtp-Source: ABdhPJw1Y/E8hlBCt4M0ZxIE/6dl4jAqFgcMD+6FREtOB29ObDhN9iSjRxOlsQ2zIkKb4HicLv91Qy5jg7lWpWCJE4U=
X-Received: by 2002:aa7:dbc1:: with SMTP id v1mr62739440edt.49.1637571876741; 
 Mon, 22 Nov 2021 01:04:36 -0800 (PST)
MIME-Version: 1.0
References: <20211112162827.128319-1-aouledameur@baylibre.com>
 <20211112162827.128319-3-aouledameur@baylibre.com>
 <CAFBinCDNMCT4KZjw8HnYer9NJBx09yF=KpguGm8Q4vKw8eBr9A@mail.gmail.com>
In-Reply-To: <CAFBinCDNMCT4KZjw8HnYer9NJBx09yF=KpguGm8Q4vKw8eBr9A@mail.gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Mon, 22 Nov 2021 14:34:26 +0530
Message-ID: <CANAwSgRoBCao2fh1jgBwb-7r+ng3LabNbH8i4G=kn668uhCasg@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] usb: dwc3: meson-g12a: fix shared reset control use
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Amjad Ouled-Ameur <aouledameur@baylibre.com>,
 Felipe Balbi <balbi@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org, 
 Linux Kernel <linux-kernel@vger.kernel.org>, 
 Linux USB Mailing List <linux-usb@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211122_010439_478413_C6EF4CE5 
X-CRM114-Status: GOOD (  16.39  )
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

Hi Amjad

On Sun, 21 Nov 2021 at 05:21, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Hi Amjad,
>
> +Cc Anand who was also investigating the original issue one year ago
>
Thanks.
> On Fri, Nov 12, 2021 at 5:33 PM Amjad Ouled-Ameur
> <aouledameur@baylibre.com> wrote:
> >
> >
> it seems that there's an extraneous blank line here
>
> > reset_control_(de)assert() calls are called on a shared reset line when
> > reset_control_reset has been used. This is not allowed by the reset
> > framework.
> >
> > Use reset_control_rearm() call in suspend() and remove() as a way to state
> > that the resource is no longer used, hence the shared reset line
> > may be triggered again by other devices. Use reset_control_rearm() also in
> > case probe fails after reset() has been called.
> >
> > reset_control_rearm() keeps use of triggered_count sane in the reset
> > framework, use of reset_control_reset() on shared reset line should be
> > balanced with reset_control_rearm().
> >
> > Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
> > Reported-by: Jerome Brunet <jbrunet@baylibre.com>
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Changes fix the warning messages on my odroid n2 during suspend / resume.
Please add my
Tested-by: Anand Moon <linux.amoon@gmail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
