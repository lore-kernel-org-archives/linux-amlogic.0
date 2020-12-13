Return-Path: <SRS0=abhm=FR=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3DF6C433FE
	for <linux-amlogic@archiver.kernel.org>; Sun, 13 Dec 2020 18:46:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8CD520723
	for <linux-amlogic@archiver.kernel.org>; Sun, 13 Dec 2020 18:46:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B8CD520723
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RgNe+f1F26r6BhkdnhlxPhJFRuzYXBvIYS/HVvtlHY8=; b=J2Tr7LscdALQLq9zaZd0iSe5m
	u3okQH6sscI53eqf5cqG5YrNXvf8LyBlCIsGcBtYb9RRVyh7T2TNFe3aw+RIFpPcazYOBmgNUJSl6
	mCJr5mm+8thG3KQkdxYJdHCK3+HOmYyNgMoT7PGKc849rdjV9skiJZIZoLcmLmOCOgPQU7SsVtdRf
	hKk34KW6NgyDNlgjlTMEeqv0eqcLmcSH0A4p1NTEveE8523jfdt5/y+LOOA4J8sN7qJoIQXVdMcQi
	AGtcNBvDvz1ASSkrgy8voGn5xmcFoS1EGZwQC7KVmh8nLg9aaFzX8A6vRFp/7j6u/6Mc+h0VVyfbp
	yiS+Up97w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1koWOH-0002Bc-IB; Sun, 13 Dec 2020 18:46:41 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1koWOG-0002BH-0U
 for linux-amlogic@lists.infradead.org; Sun, 13 Dec 2020 18:46:40 +0000
Received: by mail-ej1-x633.google.com with SMTP id n26so19506416eju.6
 for <linux-amlogic@lists.infradead.org>; Sun, 13 Dec 2020 10:46:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vBaDtwXZY4tbMaYeRLsT1+1rhD3o56cmncJfOLsHOAw=;
 b=CfTc3Oru96iMe3dsAT0XCCCJsb4KIlepfdk/mDykyRHFy2X14qZQHRQrqqmEfINJLd
 +NKoCpgyc5Pz2HUt9BxVKcB/2tGlO5c8LLltGaCzf5aWPupous2ODdNp3Fid2if8pme4
 cgp9GtGmVj65Z6PuX22xDOQ7GqEnLNygn6L2ZgrYAlCRi85ufeIpJiHSgace/pFJgabr
 w9g9msgWJyY3K3CsAe6QbqETwbjSLfqDSI3rsjpf9FtS0FWBxbqvP+m45gNguWr97XTL
 B5z6FSkqGU419+KqiWQPiCvwcsBF5UjbNmrjlLCPyC88MNWJLrvA8cjS7Fn+viRS1PCs
 mf0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vBaDtwXZY4tbMaYeRLsT1+1rhD3o56cmncJfOLsHOAw=;
 b=NlI0pOGx2FV22SdaE3FxuexoI6uBVj1YbqwJDcjEbd/pr9OlJydZHer8AZ892CYr19
 h4bTh8bC5ediGG2FqH2+J65ylDzxeaA/i6sKlIw9EQ7lFMQBnfXG+ETrpMNaUmZ4ruGV
 D4FfMBKhot+CQxWXYwPsOPJOqNewrPlHoIk2eaiWpswff3JN1WOK/4pNFzvcqKtG9GcC
 h9OgOWULn4zmOo1q6UaB+v3cbaZfODtwk/LmCRqQVl56Rfolt/7MRVnRii+LwUthx3q8
 a9ZmZjxrX7NBiGfCFHRsLGPb1iG2hBloOZkDH3EqaMRuZvJ12PZ05mFrFcfhyoJN1cWD
 oe+Q==
X-Gm-Message-State: AOAM531eSwTA3VZRkedhmTF65GlLhR7p7GojzTJh+gVRL7gU6AcJkUKG
 HbWsvW8qViV/UiHmn2HYQK3egh3fH+hbGl5jhTs=
X-Google-Smtp-Source: ABdhPJwYecYnluB/VJtcgw2dOexl3/8kPiIx3H/82J7bFRDhGIGSmoORENvLrh5SHEjsXvETRvrco+z5xnRF0JaVJtY=
X-Received: by 2002:a17:906:6c8b:: with SMTP id
 s11mr19553249ejr.187.1607885198740; 
 Sun, 13 Dec 2020 10:46:38 -0800 (PST)
MIME-Version: 1.0
References: <c2dc3507-67a7-3c18-374f-050295bc1d59@gmx.net>
 <CAFBinCDrMj4GP2cy4dBSt_isGXf4CuhmDz=uAs+gZwUGQc=o6A@mail.gmail.com>
 <8afb2adb-4581-a847-e7e0-db1e915e9247@gmx.net>
 <CAFBinCD6aqna6YYvXgO5iKWa9N3yvqehhB+SAirLaUu3xScy2Q@mail.gmail.com>
 <bd9d96d2-8b66-db93-a855-5e179adca8c9@gmx.net>
 <0d05671d-b5f4-55e4-f5bd-58410cc92d08@baylibre.com>
 <dd160e55-55e9-1c41-afcb-22990a05a86b@gmx.net>
In-Reply-To: <dd160e55-55e9-1c41-afcb-22990a05a86b@gmx.net>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 13 Dec 2020 19:46:27 +0100
Message-ID: <CAFBinCDv+TgEgf1g7xBTknr-aJMhC3K1wOW87-06YG4sQ9wUAg@mail.gmail.com>
Subject: Re: [BUG]odroid-c2 does not hotplug usb-devices
To: Otto Meier <gf435@gmx.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201213_134640_102508_8F287AFF 
X-CRM114-Status: GOOD (  10.60  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: U-Boot Mailing List <u-boot@lists.denx.de>,
 linux-amlogic@lists.infradead.org, u-boot-amlogic@groups.io,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Otto,

On Mon, Dec 7, 2020 at 1:43 PM Otto Meier <gf435@gmx.net> wrote:
[...]
> >> So with the latest u-boot and the kernel from https://github.com/chewitt/linux/tree/amlogic-5.10.y
> >> commit 725fc8df7898102f9031ba2075f763884ffa3ee8 everything is working again.
> >> USB does hotplugging as expected.
> >
> > So, this fixes USB under Linux ?? It's not clear
if you have time it would be great if you could figure out which of
the patches from Christian's tree fixes USB hotplugging for you.
Or is it fixed in Linux 5.10-rcX even without any patches?


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
