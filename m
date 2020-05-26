Return-Path: <SRS0=ok2G=7I=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3E2EC433E1
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 May 2020 20:32:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E7A0208A7
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 May 2020 20:32:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uwlMjnVA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="IljquMpm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E7A0208A7
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o7G55/lQ2/jWsH0L1oPf7jyK7kY7JuVfGxZhkUUr6L0=; b=uwlMjnVA3VLR8V
	p9veDNIcle39WZoeiazU68ad7Szt5DYr9ao40AjnBF01rFYO/41dE0fCeqCWFMgw+zvX5XpGrDETx
	twvvqgRemIHlIE2DVKx5MFmuBNQKP5IWnV79hbCwTwD+KjtrO3KsVLQqIjEQ7qj6WABOFf0pgQfh/
	noiBwmcqiVZWN8P/Ffr5y9rqlJJdNf4FdLdfJZY7d2KfEl+9JkGLT0xoJA4L7nEkWkH8SiGAJX0cR
	27VXhdVE/Qm50DkRexx1yrpI+HuBnkn+KivLqPuz8Jyz2NKkwDOMNMmBrFUvN4kgQNvnp1cwLC6Ro
	qv9UCGTlEXwpZK6TqiIA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdgFg-0000Bs-Jd; Tue, 26 May 2020 20:32:44 +0000
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdgFS-0008S6-2C; Tue, 26 May 2020 20:32:31 +0000
Received: by mail-ej1-x644.google.com with SMTP id k11so57635ejr.9;
 Tue, 26 May 2020 13:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=frTCyEJytMIpMzPgqZ3lqF+pkdQxw1WSjI5Ry5UFq5I=;
 b=IljquMpmJNsQqTFtQAguaOxhoTCWTpYRniOr8MuJ3DoqbydFogfDP9VW+W87BQstsR
 OPBayw0RFE6iKQ/hTP4hyGHOywAU0FnWt++TBwFlvjadyrBZgNlYAOIQFxvplj6b6mtl
 wpORcH+FUq038v382wEk3G+YK2w/TABXGVqSFUVIeo5feLNG8RnB2QVgBDN1NK/V3Del
 2qzVbosAlK0HzoQzjA3jpz0z8VPpDWTJc2vKlNc8inJEwiIYHG4shAR1cFhgZHO2ge5a
 jtKi8rQN/9bUgKv+cz4lgfEl2nw/Ie6fq+1Gl6NyoQhEzmlrZ8rPb2rgw5+guPULhKqe
 fe3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=frTCyEJytMIpMzPgqZ3lqF+pkdQxw1WSjI5Ry5UFq5I=;
 b=kJSSaewCNEL2HLvWkGwtOYcJI92BUIioSDNsTQb3jGikfLXwdDuG4s/w+L+w169Ps0
 /ciPnyR/inE/QCKd1zwUgfuTyFEFukZmRsmrebmKrMA4OKIQGZH4p69HDqGUSC6ZpUUh
 LaWAdwHzBJCxKFQnBR4y6nTV/TTEEORJQzMmTthaAbb1ZE3LL5WoqMgkF2EJ0rhBBUyK
 QLRNPORvBvBu3drmF46t610DxgjDcfm3zL8n4kh08pHQeV4OLBEYTb0WMfHfGZTifcHK
 8ORzbtOO63k9dZE5am6Mh4YAXyJ7GHSvy+E9rMPT2Zv+gmWvyPHf9HlxwO677Q2HXrUU
 gyvg==
X-Gm-Message-State: AOAM531Jt9Zvmr85LFPVY/NM+oz9eZ4bAj3VIvgwDKhmFLqK4+cM5yLg
 mqiZX2p63rDEyrMZP5ICkSffnA7E4ns+IKcyA84=
X-Google-Smtp-Source: ABdhPJzFPlr2WGlGDBnhC7WsSJMXNzXAUl4NRIgZRMAQF7dmd4WuTEuCuUSuOKDlw1a8WDHUXwvb9/G+7EwF7/tuigY=
X-Received: by 2002:a17:906:7e17:: with SMTP id
 e23mr2664267ejr.172.1590525148457; 
 Tue, 26 May 2020 13:32:28 -0700 (PDT)
MIME-Version: 1.0
References: <5ec9617c.1c69fb81.b979a.bf47@mx.google.com>
 <ffe2c64c-62ed-9b59-3754-7ede0f0203be@collabora.com>
In-Reply-To: <ffe2c64c-62ed-9b59-3754-7ede0f0203be@collabora.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 26 May 2020 22:32:17 +0200
Message-ID: <CAFBinCC59r-LqSCkVpyjkEr_q+hLQLECDSSiAas+ZF+DoaiJLw@mail.gmail.com>
Subject: Re: next/master bisection: baseline.login on meson-sm1-sei610
To: Guillaume Tucker <guillaume.tucker@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200526_133230_103468_53AD65C8 
X-CRM114-Status: UNSURE (   8.81  )
X-CRM114-Notice: Please train this message.
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
Cc: Felipe Balbi <balbi@kernel.org>, kernelci-results@groups.io,
 Neil Armstrong <narmstrong@baylibre.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
 Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, May 25, 2020 at 10:39 AM Guillaume Tucker
<guillaume.tucker@collabora.com> wrote:
>
> Please see the bisection report below about a kernel Oops.
>
> Reports aren't automatically sent to the public while we're
> trialing new bisection features on kernelci.org but this one
> looks valid.
this one is valid indeed and I have sent a fix for it (plus an
unrelated fix): [0]

Also thank you for listening to feedback from a while ago.
This email reminded me to add the Reported-by tag :-)


Martin


[0] https://patchwork.kernel.org/cover/11571203/

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
