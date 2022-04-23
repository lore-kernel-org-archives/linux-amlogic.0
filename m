Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55872C433FE
	for <linux-amlogic@archiver.kernel.org>; Sat, 23 Apr 2022 02:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1BDR6cqkURee1Rs+CgNyutsGoLFbt+3TdJJ3J7pKWqI=; b=3sLeYBS2uh+rS6
	jpM82b74b6ceAMfRG/uKYjt2EHxtQDZ9l33SRJ+tLdpT3Jfwe6hi4VjRDZxjrONLGXiOQjbPAuloA
	uQ2vKRcm2Oux9YpGg76q9SlPzobqIzu6O5IVptbq/wtvX7HtbD5Pmce5ix+4iFxHkmtioMT+dB3lw
	/Xm3VufjnbKuXZCYTZ1r0KvoDRVp7dlj7wHvLyuU3PojIiMYUGMkPX05/1FCT2+pMl1a37knBrmoJ
	ZVbHPU0ww66HLiglFe6U9LYn/unh4Pk9NWeYISIqvE2ADYTqZcUafqUxpXBmWtKC+99YEeBKXsiSt
	7MubFGz0L+LHa/ZJ1eFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ni5T2-003HIQ-13; Sat, 23 Apr 2022 02:25:48 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ni5Sy-003HGy-Mm; Sat, 23 Apr 2022 02:25:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EB16FB8321B;
 Sat, 23 Apr 2022 02:25:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B12F3C385A0;
 Sat, 23 Apr 2022 02:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650680741;
 bh=ArGHhgbdlHjKWbPeB+8c0u0ViOzzzUuy497doDzrEaY=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=jK/9zgIeTIm8RlKZGOcSF3oBPkR0dPTvs2UzoFurZ6y5CJzEdnKdDn0OvZeaKFWA4
 8E5XNdUQihWTCTb5bMAxnpCK3Yat0a6tGWidLP1sWdROsbDYcQ+CVj9Rf5tZrOjH2e
 3Fq9j8+RYVzuDem9X3JF/Zr6rNSyOicK4trYxpj4S7Ft+8JCB7P2phfidfFGtQsfPf
 AwNl3beD1qNAb/U+k26wOsBxl3isvQK51gs6h3ADwRpxfDJOhiVNaRnGmI8c/EVXiN
 38mCkSFHmkHnLN7qi0GaggpucOBiLnJMAl8aWY9Eh541KX8b79zR0hUbEoATnkV7a4
 /9viIpBT/lM/A==
MIME-Version: 1.0
In-Reply-To: <CAFBinCC=Dp4bXT9sbmT=ZTiVfC1Mj=oRVxeDXfKbDczq45iekQ@mail.gmail.com>
References: <tencent_FE734C50BC851F2AB5FE1380F833A7E67A0A@qq.com>
 <CAFBinCC=Dp4bXT9sbmT=ZTiVfC1Mj=oRVxeDXfKbDczq45iekQ@mail.gmail.com>
Subject: Re: [PATCH] clk: meson: meson8b: fix a memory leak in
 meson8b_clkc_init_common()
From: Stephen Boyd <sboyd@kernel.org>
Cc: Neil Armstrong <narmstrong@baylibre.com>, jbrunet@baylibre.com,
 mturquette@baylibre.com, khilman@baylibre.com, p.zabel@pengutronix.de,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 xkernel.wang@foxmail.com
Date: Fri, 22 Apr 2022 19:25:39 -0700
User-Agent: alot/0.10
Message-Id: <20220423022541.B12F3C385A0@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_192544_922686_1EB90B4F 
X-CRM114-Status: GOOD (  17.86  )
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

Quoting Martin Blumenstingl (2022-04-18 09:39:57)
> Hello,
> 
> first of all: thank you for this patch!
> 
> On Thu, Apr 7, 2022 at 11:28 AM <xkernel.wang@foxmail.com> wrote:
> >
> > From: Xiaoke Wang <xkernel.wang@foxmail.com>
> >
> > `rstc` is allocated by kzalloc() for resetting the controller register,
> > however, if reset_controller_register() fails, `rstc` is not properly
> > released before returning, which can lead to memory leak.
> > Therefore, this patch adds kfree(rstc) on the above error path.
> In general I am fine with this approach. There's some more "return"
> statements below. Should these be covered as well?

Probably!

> 
> Also a note about meson8b_clkc_init_common() itself: failures in that
> function will result in a non-working system.
> If we can't register the reset controller then most devices won't
> probe and CPU SMP cannot work.
> If registering any clock or the clock controller doesn't work then the
> system also won't work as clocks are not available to other drivers.
> So freeing memory in case of an error is good to have, but the end
> result is still the same: the system won't work.
> 

Can we get far enough to record this fact into either a pstore ramoops
location or the serial console? That would be ideal to make debugging
early problems easier.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
