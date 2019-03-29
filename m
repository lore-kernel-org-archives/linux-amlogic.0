Return-Path: <SRS0=wRYZ=SA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5266AC43381
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Mar 2019 23:08:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21F8B218A2
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Mar 2019 23:08:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="b6W2hM5Y";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="l0JaSuV0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 21F8B218A2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l0PGjtMFcj51mp7Q9xK4dB8YlQOG5NCeOlROwSig7pY=; b=b6W2hM5Y0dEiel
	EtLRGDz1l6JAu81rwd+Aidfp0zy5Sa7a3L6pFrZ8R0oLiHPdxUzJQixyyeNw3s8E+d9tayYnQ+UwK
	p6r4GA+usz0E9bal4LszYuTKNxzFfYxKu6N8jBTj+ScG9bHspqWPtsOx+5C50QDtu/SJd2GsZGERk
	vM888+dJXc65T5zWQpO7uNZLKUbW/NjDN4o3qdPor3OJ2g0CTew91DG+ZkPPidtyiSOI/+UKOeFIY
	LtHJJL8bLbsY0m8CVx1zNRjpHk2ErpE8qBw80nyBQTgiegp2EFk72pQV091xvFXoFjwdfwPIUB/YI
	sayr4D29+DInROzcvE2w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hA0bQ-0006OV-DO; Fri, 29 Mar 2019 23:08:00 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hA0bN-0006O6-Ha
 for linux-amlogic@lists.infradead.org; Fri, 29 Mar 2019 23:07:59 +0000
Received: by mail-wm1-x341.google.com with SMTP id c1so2931615wml.4
 for <linux-amlogic@lists.infradead.org>; Fri, 29 Mar 2019 16:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=X4WzdP2nQiMGjUzeIIS1XDNpuU8ZsZnm39niZjc4DUg=;
 b=l0JaSuV0w/PCUENbmYzE5FTbbDOwumvyyTq3Ua7Xx6VHtPxsR5sxSHDPy5So6b4/rf
 MUWKDhO/cL375Lqp7BToC9tvVmfe2aFAsYsBz4hAq3EU5ZPCTZpQt9780R+tWyatGbIK
 J6vX2XZFtcAHXvsv+d8JTtAMhpkZkC3tRiQPIqmsX1qUnIm+Fl22L7yY2vXRmnydFuYT
 ibnRiNdv7D9WOecp8XghGz9L0ZNtBLsF8sPT/3vTSmlW5k0pSaaRB39vuNCjaRrFYiPx
 GLv8xx9fwPoqLti0eL15I6VBYZ9R+nlcFbYNjW+lyU/ljrsRjqSwy9hWaUqHD5EolKOo
 mUTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=X4WzdP2nQiMGjUzeIIS1XDNpuU8ZsZnm39niZjc4DUg=;
 b=dDAnc3nwSW37uwTAXpQ8RevWL1Ck/7mLZeYKNVts/FaahqoLHWukOsdcIPQSsEAZ21
 TKVpPnNBir/GjYvwo8+KoOY2qmPWNzdzKzh9k+UzUpdwq1v/OjrnPewttwAVqyyplQ7C
 3mKFC/KnnB7toG0n+a3BNPOGsHQvcxphLD15iVFgcF5vlOLVfz0uvsv9xvFUY3Rw4Thn
 ziEjJ+O/iOoB7MpfTlHJMn6k4kMMCYn0IE0oycm6O7HbzMrgn+NSnahZsLryC50UnKef
 ej4aSaTzBG7DKqQr2FJGQLMSlnD/ZwmYnsIqWf1JnqpgJ2qtPXTBQCFX3LpWXsbp/pyu
 jb3g==
X-Gm-Message-State: APjAAAX0wayKLhKdirVIqAOCkhwfjzx6XBS5pWcFhBpC+g39d/PRZE8Z
 PgDh8JhlC7EnBdr6PsP2DMLzk0B4r0Q=
X-Google-Smtp-Source: APXvYqwQ8yPsEvN9BsHL6fs8bVGHRAZAnJMewzitTxvw/imFpZ/mWe5MdRSiM+QuoxU7QVhffjGOFw==
X-Received: by 2002:a1c:ce:: with SMTP id 197mr4956859wma.105.1553900875884;
 Fri, 29 Mar 2019 16:07:55 -0700 (PDT)
Received: from boomer.baylibre.com (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.gmail.com with ESMTPSA id u19sm4487071wmc.7.2019.03.29.16.07.54
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 29 Mar 2019 16:07:55 -0700 (PDT)
Message-ID: <3bef1bb26e9eff0cfc20cd4bb78a5d7cea4c5076.camel@baylibre.com>
Subject: Re: [PATCH 1/3] clk: meson: mpll: properly handle spread spectrum
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 30 Mar 2019 00:07:53 +0100
In-Reply-To: <CAFBinCDnoY41ZcoHqsngR4WTeczkmOu93R=2G_JOXbdUmHSjMw@mail.gmail.com>
References: <20190329153325.23869-1-jbrunet@baylibre.com>
 <20190329153325.23869-2-jbrunet@baylibre.com>
 <CAFBinCDnoY41ZcoHqsngR4WTeczkmOu93R=2G_JOXbdUmHSjMw@mail.gmail.com>
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190329_160757_583684_A474667C 
X-CRM114-Status: GOOD (  22.64  )
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
 linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, 2019-03-29 at 20:39 +0100, Martin Blumenstingl wrote:
> Hi Jerome,
> 
> On Fri, Mar 29, 2019 at 4:34 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
> > The bit 'SSEN' available on some MPLL DSS outputs is not related to the
> > fractional part of the divider but to the function called
> > 'Spread Spectrum'.
> > 
> > This function might be used to solve EM issues by adding a jitter on
> > clock signal. This widens the signal spectrum and weakens the peaks in it.
> > 
> > While spread spectrum might be useful for some application, it is
> > problematic for others, such as audio.
> > 
> > This patch introduce a new flag to the MPLL driver to enable (or not) the
> > spread spectrum function.
> > 
> > Fixes: 1f737ffa13ef ("clk: meson: mpll: fix mpll0 fractional part ignored")
> > Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> > ---
> >  drivers/clk/meson/clk-mpll.c | 9 ++++++---
> >  drivers/clk/meson/clk-mpll.h | 1 +
> >  2 files changed, 7 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/clk/meson/clk-mpll.c b/drivers/clk/meson/clk-mpll.c
> > index 64d31c8ba3d0..2d39a8bc367c 100644
> > --- a/drivers/clk/meson/clk-mpll.c
> > +++ b/drivers/clk/meson/clk-mpll.c
> > @@ -141,9 +141,12 @@ static void mpll_init(struct clk_hw *hw)
> >         /* Enable the fractional part */
> >         meson_parm_write(clk->map, &mpll->sdm_en, 1);
> > 
> > -       /* Set additional fractional part enable if required */
> > -       if (MESON_PARM_APPLICABLE(&mpll->ssen))
> > -               meson_parm_write(clk->map, &mpll->ssen, 1);
> > +       /* Set spread spectrum if possible */
> > +       if (MESON_PARM_APPLICABLE(&mpll->ssen)) {
> > +               unsigned int ss =
> > +                       mpll->flags & CLK_MESON_MPLL_SPREAD_SPECTRUM ? 1 : 0;
> > +               meson_parm_write(clk->map, &mpll->ssen, ss);
> > +       }
> this changes the "ssen" flag on all supported clocks from 1 (before
> this patch) to 0 (after this patch).
> is this on purpose and how does it affect existing clocks?

Yes, none of our application require spread spectrum

The fact is that only 2 MPLL had this bit, mpll0 on gx (without effect) and
mpll0 on axg: actually spread spectrum impacts mpll2, making it unusable, as
explained in the related patch

> 
> based on the original commit 1f737ffa13ef ("clk: meson: mpll: fix
> mpll0 fractional part ignored") it seems that
> CLK_MESON_MPLL_SPREAD_SPECTRUM should be set for mpll0 (at least on
> GXBB and Meson8b)
> 

There a patch specifically targeting gxbb.
I have checked on GXL and this bit had no effect (fractional part still on, no
spread spectrum)

So either we fixed something since then or I messed up when doing the patch
initially.

Feel free to cross check

> 
> Martin



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
