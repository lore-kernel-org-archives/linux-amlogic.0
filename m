Return-Path: <SRS0=mclM=3L=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1F40C32771
	for <linux-amlogic@archiver.kernel.org>; Wed, 22 Jan 2020 07:34:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B5032253D
	for <linux-amlogic@archiver.kernel.org>; Wed, 22 Jan 2020 07:34:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KC+yDBMI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6B5032253D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T3aeshws4z9PyvKnSd2TDGrjP0h//iaynOAHbLBJEwY=; b=KC+yDBMIJHXAqR
	zZKl6re5fd7N7PrYovB+qRGa3ldLJuGJqdShhrtT8kgmcuutvps+OoaxfJt5Jbv4lkhvexUsnXUhj
	EbG9mD9cnuloA9JsjA0wEvsEyUnUlIe6M8B7wLns7GzaQpgGD+uPdWW3voyU8K8KNs1m7omEwUTsi
	JcSbZ/UVyiEsULR3E2spW7MjhSFEZDWFs5jtCMkyFnT7DzyNbVZFBOe8gtOzlm9j0xwYUD+l8sS9E
	WeodkHKBk7z7jYWiZNMxSF2t0KEkL613Exd8CqxmysDlNnE7b5az9BFHUjJNxw2o6F4YK9VV28HWt
	VA5TVdtUyiTCltsxaAZQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iuAWn-0003wq-Fk; Wed, 22 Jan 2020 07:34:17 +0000
Received: from mail-oi1-f194.google.com ([209.85.167.194])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iuAWb-0003nm-Jn; Wed, 22 Jan 2020 07:34:06 +0000
Received: by mail-oi1-f194.google.com with SMTP id q81so5257355oig.0;
 Tue, 21 Jan 2020 23:34:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=R6dA8IVd2HWeSBvzpV4MKOYtjngHbr3aE8kcYPeC+Iw=;
 b=eISv6lqo4Xk4CnCN7ot3ov5SEi9ySvWd9HLL+8w4/F3YAgJT+nRnKgim0iPuPe9WRr
 BiHYM2oUzc6jy5VJV08z2d/K5rO3B2AcFdHgN1mtoFXc5e0R+gZE9j/PrBu+/6DNn8l4
 wKEKQDuoSDUbAF93FjFDcHT6Zyf58kQjWAH/Y/CrkkgstlZIHgjlyQi8WL271RMGakVm
 e5wc1BtbzuaYOAMKSa/gkpGElIGs3KqyHgx13q2OVlG9W1IEKbPzH4JxTMwK+3x77+kl
 xXpKY7aTRTQODVFrk3tAMm1KGUTtSM92JRxw9gcWFmvmNfwgnpZerYTh4k71YU9uz7at
 9WnQ==
X-Gm-Message-State: APjAAAWjvK8TRaL0SEl9JxxXbizAAFLLpYucZpMbrJih6fKerg1NVIoq
 eSN2ybP3QQ1HY+GGKSnJ7fe1lnA35Is8HZqjMPQ=
X-Google-Smtp-Source: APXvYqzz9BRTgYbAttBsw72QwxdjFgTrmN154sWt4NXPuBUO2JwBwUb++MoNJraCo3FfeIs23pEkyRFPnQFId4CPRrg=
X-Received: by 2002:a05:6808:292:: with SMTP id
 z18mr5614749oic.131.1579678444390; 
 Tue, 21 Jan 2020 23:34:04 -0800 (PST)
MIME-Version: 1.0
References: <20200121103413.1337-1-geert+renesas@glider.be>
 <20200121103722.1781-1-geert+renesas@glider.be>
 <20200121103722.1781-12-geert+renesas@glider.be>
 <CAFBinCD=LTAT-HQ+wSSmLQux+W5Y6vBju6RQDwf_1t1FhZoXgw@mail.gmail.com>
In-Reply-To: <CAFBinCD=LTAT-HQ+wSSmLQux+W5Y6vBju6RQDwf_1t1FhZoXgw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 Jan 2020 08:33:53 +0100
Message-ID: <CAMuHMdW5x7H5gwja098XVMB+iX-eQ1u_85BHu+0=dtAU9iNuKg@mail.gmail.com>
Subject: Re: [PATCH 12/20] ARM: meson: Drop unneeded select of COMMON_CLK
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200121_233405_646154_4A2CCEE3 
X-CRM114-Status: GOOD (  11.60  )
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Arnd Bergmann <arnd@arndb.de>,
 Kevin Hilman <khilman@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Olof Johansson <olof@lixom.net>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Martin,

On Tue, Jan 21, 2020 at 11:11 PM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
> On Tue, Jan 21, 2020 at 12:47 PM Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
> > Support for Amlogic Meson SoCs depends on ARCH_MULTI_V7, and thus on
> > ARCH_MULTIPLATFORM.
> > As the latter selects COMMON_CLK, there is no need for ARCH_MESON to
> > select COMMON_CLK.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Thanks!

> > Cc: Kevin Hilman <khilman@baylibre.com>
> > Cc: linux-amlogic@lists.infradead.org
> I assume that Kevin should take this through the linux-amlogic tree
> (instead of someone else applying the whole series directly to the
> arm-soc tree)?

Yes, that's the way to reduce the risk of conflicts.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
