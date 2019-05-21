Return-Path: <SRS0=vjLk=TV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCA85C04E87
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 May 2019 15:36:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ACCFA2173C
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 May 2019 15:36:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="G56sBj3r";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="YdvDQmpl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ACCFA2173C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wUV9BNcfqvd13p9xi6z5OXRk41Ffi/O8RzzXNZoeL7w=; b=G56sBj3rX8zBcU
	x88h7IfsUbAXD53XA1KhmeSlp7MpzDfSRvCzcfRMyzLe/pLM+terY0GibLt/Rrg2lyhP2WryuxBkI
	ct2CKZTTbaDZ2wopdajWkRRzhdVRF4wvVMRPqCfe46Xa6xzdgU+gWfaYQ6kqBD78PuTK2C44Amyrq
	6HPxZM8xDS7bamGLUvtsiB3sYv16uxrbottRrx4QGHfACzDnqDaQSBFpYFlIq5+TfjKm3nD7acMG5
	z8tDvNr0YK4sY6OHUkJmAoMUz50sw4z1TK0l5lOeoKqIZkJaud3Jg80g7+zxE20Sy41y1LRia23az
	EGY/Y9V1Di62OPXynNeQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hT6o2-0004eR-G0; Tue, 21 May 2019 15:35:58 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hT6ny-0004dH-HP
 for linux-amlogic@lists.infradead.org; Tue, 21 May 2019 15:35:56 +0000
Received: by mail-wm1-x341.google.com with SMTP id 15so3359841wmg.5
 for <linux-amlogic@lists.infradead.org>; Tue, 21 May 2019 08:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=0uik/HMoz37j2coMurAJJ2JSRGBbGbninuq4WxTSmzk=;
 b=YdvDQmplGwYrrQtRoix7kegU3RDr7LFfBOaAAJJgLK6wQHPTL+PyvT39LNUpvGAhR5
 kTEpm6EeyVOszu7t8m/gELtsglkW+M6UzfzSmcfqRR775Wd3JpXLQAPI7Yf0cADqiv2o
 TKqlONz5O2H8NbaWINI0tNJRQXveZ2/W01MJCgH/y4NOr9YIuOJAxS8qCX8CQzeL/VT1
 oI6Ve4yEqWBoCr1caKUjM6BnlY5B9W5gEaNH49lCIC2RBG+Nz/Gd1jQhuNTJ1/dCDPnX
 wlkz1sXfIGUqeUO3dHFrMmygoQh9yYXkHC9WMAtgGBln1LJs0i+QmXGuPsbxGX+zAQd1
 Y0hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=0uik/HMoz37j2coMurAJJ2JSRGBbGbninuq4WxTSmzk=;
 b=ojfhFpfO8DDTPVtwaJ7T3n8WVE+h5fa/+3Q3or3tIk9ATEFj1dvtGhgojae61M4ey6
 mCUPrnPJ38vrk3oVHLAsFwpooqgCEEeiEuEFqw3Q2gVcskqhfpEGMILjsBQR6CPLZWad
 wiXv5Ia+c71svbUPz6WOYfcbMLSb8RmwgoPBRbjYRNxOd+FuEzb1pbG0pwxzieLim+w1
 bPotKkPwdx5fAqdcL9+sxecvUevtxlWp7B4EFo9AoBOUbbGEiPK1NBzHQu+H5t56e9N0
 mrnJQemoUtwL0fN4BNMsEs7RrSz5LXKkmOjdMsgTiKlX2HSaohhCnX56z6XZT0+ZFgu3
 rDfw==
X-Gm-Message-State: APjAAAW/3V+u++HSyCsGbLdKFg4qROVdy1PxHlqskWmZUSmVr1IVtuBA
 0uNusv62vZaOj5MJKDUhkoElFA==
X-Google-Smtp-Source: APXvYqzp5XGeS8omRNy+ysC8swVAt9RDTiOAhNzBwblewdgtd2l9gOiPJ9lYetBBdt1eIvDzUWgk7A==
X-Received: by 2002:a1c:4843:: with SMTP id v64mr4040780wma.73.1558452952229; 
 Tue, 21 May 2019 08:35:52 -0700 (PDT)
Received: from boomer.baylibre.com
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id j123sm280848wmb.32.2019.05.21.08.35.51
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 21 May 2019 08:35:51 -0700 (PDT)
Message-ID: <e6b7c6f8073bedcf6cc9d4810518c95b651c401b.camel@baylibre.com>
Subject: Re: [PATCH 0/3] clk: meson: add support for Amlogic G12A
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>
Date: Tue, 21 May 2019 17:35:50 +0200
In-Reply-To: <2fd7816a-de5e-c42f-a825-9552d8e79d34@baylibre.com>
References: <20190521150130.31684-1-narmstrong@baylibre.com>
 <2fd7816a-de5e-c42f-a825-9552d8e79d34@baylibre.com>
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190521_083554_819443_FE7B2D3B 
X-CRM114-Status: GOOD (  16.48  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, 2019-05-21 at 17:21 +0200, Neil Armstrong wrote:
> On 21/05/2019 17:01, Neil Armstrong wrote:
> > The Amlogic G12B SoC is very similar with the G12A SoC, sharing
> > most of the features and architecture.
> > G12B clock tree is very close, the main differences are :
> > - SYS_PLL is used for the second cluster (otherwise used fir the first on G12a)
> > - SYS_PLL1 is used for the first cluster (instead of SYS_PLL on G12a)
> > - A duplicate CPU tree is added for the second cluster
> > - G12A has additional clocks like for CSI an other components, not handled yet
> > 
> > Dependencies :
> > - Patch 1, 3 : None
> > - Patch 2 : Depends on Guillaume's Temperature sensor Clock patches at [1]
> > 
> > This patchset is a spinoff of the v2 Odroid-N2 megapatchset at [2]
> > 
> > Changes since original pathset :
> > - Added missing sys1_pll div16, cpub div16 and cpub atb/axi/ahb/trace clocks
> > - Rewrote "This patch .." in commit messages
> > 
> > [1] https://lkml.kernel.org/r/20190412100221.26740-1-glaroque@baylibre.com
> > [2] https://lkml.kernel.org/r/20190423091503.10847-1-narmstrong@baylibre.com
> > 
> > Neil Armstrong (3):
> >   dt-bindings: clk: meson: add g12b periph clock controller bindings
> >   clk: meson: g12a: Add support for G12B CPUB clocks
> >   clk: meson: g12a: mark fclk_div3 as critical
> > 
> >  .../bindings/clock/amlogic,gxbb-clkc.txt      |   1 +
> >  drivers/clk/meson/g12a.c                      | 659 ++++++++++++++++++
> >  drivers/clk/meson/g12a.h                      |  33 +-
> >  3 files changed, 692 insertions(+), 1 deletion(-)
> > 
> 
> And I forgot Martins reviews...
> It should still apply to patch 1, patch 2 has changed with new clocks.

You probably want to change the series title as well, s/G12A/G12B maybe ?

> 
> Neil



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
