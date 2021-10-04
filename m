Return-Path: <SRS0=miVd=OY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00AC6C433EF
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Oct 2021 20:48:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF2FD611C8
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Oct 2021 20:48:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AF2FD611C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u8ElDnQiUZ8rEc8htRvhPwvnfTI8hQ4/xYUEmMSpN6E=; b=0Ds4Ws3Nul9vg8
	fJDh1G8MebQOzK0obzVqEpljGdiFwz9PZLqmC3MHVfJlWs4q1rA1qzUaTeUWgm7M3iuJExnEisk9P
	+ha+P7yey+qI4DqBvL35qYAIAe52IVAPxCNzKSV6FFe6+pWSMV67KI1QPyyS9ydA/gAzL0/MqUIgq
	HcBH5Vq4V6+K7y1Mvy+UOl/g8Gj5sRH10OHj+/bumVzrTZ7iw2G1Ilyh97zfh97leJhxf7GvF2uPu
	zXCp/bj7555VPr3pGrRb2eF1xiZg7JEhVNzX5UDevyGvAvPvCsJaFIS48xu1LFrNwuBIir91TjCdY
	Ee06CYVklJzJc9gEENvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXUsb-0083Wq-Tv; Mon, 04 Oct 2021 20:48:09 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXUsG-0083VL-PM; Mon, 04 Oct 2021 20:47:50 +0000
Received: by mail-ed1-x535.google.com with SMTP id f9so7345773edx.4;
 Mon, 04 Oct 2021 13:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PZROPLbkgGkkjkMADvnO2kcNu6rrLVkHkBnoU7UsJGg=;
 b=eJusRH+fhZ47Ow4sRjAPQOFvfITwMYrS483XVEFDHUFZYyigwo8RjNUy58Jfw/MGJx
 N90yOkgE13VC8/tz0i8RrniNEiPAh36DMNKy0LBZz5oZNQjnmnhLZVu3LZ8Dum8h9xp2
 8RZAz5+M1gPevZGsqLKm0r09UkoZpcerFbLgkKCkNatEdb7D3l+tb9KTUDdTj9HoZyNG
 8X5aroSJ7luiQG8K6uuKCq/v0Z1wGUe3oA3AaRD9IHl/beAjPj6D9oqFblRN8cHciJ2k
 ZWal90uaATGAUutwauosvq5tIi7nJbow/so85PZHSgeqHFmd+qjgmDIjflksKvXwViSg
 YR5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PZROPLbkgGkkjkMADvnO2kcNu6rrLVkHkBnoU7UsJGg=;
 b=ZPkapAtCMkcHgnZQ9gQDUCS1/tY7mjCR/fZ8YpN15zKEqrbVTfuQEFJdoTfeFQfwyH
 LFQeTpF3NAoyE87pdU7HqLJIle1j08Bhr2xEnM3b8xJ1APTsWl7gG7cS22sfCclDOyl6
 KIv4iywJZZBxibdnBSFJGylSBMWB0gx1d78zBzrbvXMIULi9RqSA8XXWjMhu/7kqbAYB
 p8PrFvW+REqpCzh6T8BCe1tWy2gQa+mx4I3OybL5vsOn4FL5u+uxJJtONZwddD/FZPfq
 wcdiLbRwIdmWO2R9uOgYWQxP+LCn1uNuhyuvpUlF22dUQ5eskJt7eHw1O5+Q2stf5xqs
 Gd6w==
X-Gm-Message-State: AOAM531Nv2t+jrjNpFG+UTjRC3KOD/Y5bg4tcxhlr0yc61ug5F0eC5u0
 yLS4Il9eVRS0mViEVt/5YEh0Z3w/xfRd1jbJOeo=
X-Google-Smtp-Source: ABdhPJyHseqJsLA+Xd5nzZlA+nH89bmxZ8SBNdzs2relZVLGbPv6O+T0M/pHhE/Z1dFczNHQ+3t6OX3JGEVBkWVG9yI=
X-Received: by 2002:a17:906:f92:: with SMTP id
 q18mr19469483ejj.353.1633380466100; 
 Mon, 04 Oct 2021 13:47:46 -0700 (PDT)
MIME-Version: 1.0
References: <20211004105257.GA27301@kili>
In-Reply-To: <20211004105257.GA27301@kili>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 4 Oct 2021 22:47:35 +0200
Message-ID: <CAFBinCAB5rvAS27Q-TXdp8d6qAyNFooKE1v3XRPFsBvm+9_kOQ@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: meson-mx-ao-arc: fix a bit test
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, kernel-janitors@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211004_134748_858229_92FE1D45 
X-CRM114-Status: GOOD (  11.93  )
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

Hi Dan,

thank you for this patch!

On Mon, Oct 4, 2021 at 12:53 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> The MESON_AO_RPROC_SRAM_USABLE_BITS macro is used like this:
>
>         if (priv->sram_pa & ~MESON_AO_RPROC_SRAM_USABLE_BITS) {
>                 dev_err(dev, "SRAM address contains unusable bits\n");
>
> The problem is that "->sram_pa" is type phys_addr_t which is potentially
> 64 bits.  That means the MESON_AO_RPROC_SRAM_USABLE_BITS macro needs to
> be a 64 bit type as well to ensure that high 32 bits are cleared.
>
> Fixes: 6cb58ea897dd ("remoteproc: meson-mx-ao-arc: Add a driver for the AO ARC remote procesor")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
even though it's already applied, here's my:
Tested-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
