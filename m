Return-Path: <SRS0=R8f+=PG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66627C433F5
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Oct 2021 11:44:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2785A60F9D
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Oct 2021 11:44:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2785A60F9D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nH2y/hSlk3LtMlYJYn1xaVJVLhy6stBExYr8qTCFYhg=; b=yI2zsTqjEk2V6n
	qk32omyniA/iTp9kBtnCol13vjxPQ7p142uMntmQpEMGwC/E0WbGcvR7jArHNdG6DK1uvaZLa2wfF
	Z5lF8+nybf8nGjkKtCW1P/v31zToRwwcYgMNUy95Xk+gU0rO6avBmruZlQSrsWMjIslns9X8X93v8
	U3Vz9RP+0szeyFgEp1DcF1qM106/naFbZxLcHaZszI6bhw4hLHXcE5RbsqE/QPV0lEkjtvHUJLyzO
	nCVEK7p1TceUYcH0FCoVAPwvKfF++Dz5Hc+1PRm1angW5QjAaQHDndk2UclZ7qfv7kDRrExIgms07
	t7GoO36DiUGhQGApj1bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcR4V-00FPtc-Fr; Mon, 18 Oct 2021 11:44:51 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcR4S-00FPqv-UV; Mon, 18 Oct 2021 11:44:50 +0000
Received: by mail-ed1-x531.google.com with SMTP id i20so69037547edj.10;
 Mon, 18 Oct 2021 04:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MEsxZ3O1mk7PChv7vz5Z0iqmE+aipOaKaFUC4ugt0HI=;
 b=PmN8QFKOKioU2foRHAA5okAAN5N4bMfte+owkgFjLKehpAIrYtSHCWcxS080oOE9I5
 5k/9tfxdRDiQEoBRjoG80KbZRaW4uPJ9yZzP4/Ym3DEYQWUGT1wM5DesLZW6lzavmHfR
 sa9H0B2Yum/I18d0n2PIZ04I6+jMbv99xi3YJN+LJv9uA/zbk8JtXu7hp2ymGPL5TPVm
 Q5MAE9zyjbPEQ4uNmECrpPewu5we/x5Syuo3xtCH2mgpCW0WEYYhyIp4k38QzjABPJ24
 jVRYK4bWlYXiWLwzAca1JLt6SRJITPQFS9YOgfYDviu0Boi83TJuv5ZfpVgYkKrmMCRh
 M3sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MEsxZ3O1mk7PChv7vz5Z0iqmE+aipOaKaFUC4ugt0HI=;
 b=DaP/KQ4WEUau7aGpYjXvWptptDC6coE5Cv/77RujkVFG/Z7mbflUFASb0c6H4E5CLY
 5f/o+QiQg0LKxOrJxp131rHa4le5fKBgq8DzlxSidQjC2ljjpOW67pgB3WeDwT4/Ij48
 sB8O0dv/O9ZmEqCdm6wzmw6/NfftrBQCaf3JpYKLm+Kb1uZluLqbchhu/0ioKs2I/WOa
 cqu9eyusxe5c9WzvIfzA0QfepBymjTnnCjPCVMlbopgig/87EsL9lSHK5t6axvd3w6oW
 PcerTjpAOvPg0hM2w27f+UNGh5TWq1Q1NPnNceCUNaWrvSSnWCOyQUr7NpMMhoO+ZvLp
 68lw==
X-Gm-Message-State: AOAM532HjJPbZZPLFhqXjOIycUsu4rW2yhlPA81j301pkcZJjdryQ/97
 iEmkp10LhEISU9Kq7WD8ZBRNJK5aUxXPDBKmAuU=
X-Google-Smtp-Source: ABdhPJw0zF+HiS1YmJukOua82SZK7pUVcvH3fPcFCdBlxV/8b282W9eA+SQY/dem5eqHXs3ukpIm4qt25lwuQpy1x3o=
X-Received: by 2002:a17:906:f2cd:: with SMTP id
 gz13mr28303283ejb.278.1634557486136; 
 Mon, 18 Oct 2021 04:44:46 -0700 (PDT)
MIME-Version: 1.0
References: <20211016145939.15643-1-martin.blumenstingl@googlemail.com>
 <1j5ytuvdmw.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1j5ytuvdmw.fsf@starbuckisacylon.baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 18 Oct 2021 13:44:35 +0200
Message-ID: <CAFBinCBGZi3MRqTRshyCkq8AAaqHi2NkZVV80ppZr4Lx=xWOWA@mail.gmail.com>
Subject: Re: [PATCH] clk: meson: gxbb: Add the spread spectrum bit for MPLL0
 on GXBB
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, 
 Neil Armstrong <narmstrong@baylibre.com>, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Christian Hewitt <christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211018_044449_031144_B555162F 
X-CRM114-Status: GOOD (  35.22  )
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

On Mon, Oct 18, 2021 at 12:19 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
>
> On Sat 16 Oct 2021 at 16:59, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:
>
> > Christian reports that 48kHz audio does not work on his WeTek Play 2
> > (which uses a GXBB SoC), while 44.1kHz audio works fine on the same
> > board. He also reports that 48kHz audio works on GXL and GXM SoCs,
> > which are using an (almost) identical AIU (audio controller).
>
> The above is a bit "personal" - it is not great fit for the commit
> description. Please rephrase or put it in comment section bellow
sure, I can rephrase that

[...]
> > Add the SSEN (spread spectrum enable) bit and add the
> > CLK_MESON_MPLL_SPREAD_SPECTRUM flag to enable this bit for MPLL0. Do
> > this for GXBB *only* since GXL doesn't seem to care if this bit is set
> > or not, meaning that meson-clk-msr always sees (approximately) the same
> > frequency as common clock framework.
>
>  1 - it is odd that we need to poke a bit in the register related to the
>  fixed PLL but ok ...
>  2 - 3.14 does yes, 4.9 does not soooo ... no real proof there
The fact that 4.9 doesn't do it is also no proof for anything either.
Amlogic hasn't ported forward GXBB support to their 4.9 kernel. Even
"mesongxbb.dtsi" is missing there [0]
So in my opinion the code from Amlogic's patched 4.9 kernel cannot be
used as reference for anything GXBB related. Only the 3.14 code can be
used as reference.

[...]
> So 2 things:
>  - If this bit really enables spread spectrum on MPLL0 (or worse, the
>  Fixed PLL) - checking clk measure is not enough. It is just a mean of
>  the rate seen by the SoC itself. You would not see the effect of the
>  spread spectrum here ... you need to capture the clock output with a
>  scope for that.
I suspect that a board with pin headers is needed to route the signal there?
Personally I don't have any GXBB board(s).

>  - Or the bit is incorrectly documented (or DDS0_SSEN does not mean
>  spread spectrum). If it is not a spread spectrum function, then this
>  patch seems to indicate it is and it is misleading.
>
> Either way, I'm not OK with it.
>
> To me, the rate drop that happens when you flip this bit looks more like
> the effect SDM_EN should have.
>
> Could you check the internal values (n2 and sdm) compare this to the
> output rate you actually get ? see if this leads to anything ? does
> SDM_EN really has an effect on this MPLL ? it is a combination of both ?
Christian has provided a dump of the HHI registers (via userspace,
regmap makes them accessible).
On GXBB WP2 HHI_MPLL_CNTL7 is set to 0x0006f208
On GXL Le Potato (which he used for comparison as it wasn't affected
by the MPLL0 issue) HHI_MPLL_CNTL7 is set to 0x0006b208

If you're interested in the full HHI register dump you can find it here: [1]
GXBB WP2 is on the left and GXL Le Potato is on the right.

The difference here is BIT(14). un-setting BIT(14) (documented as
EN_DDS0) did not change anything according to Christian's test.
That also means that SDM, SDM_EN and N2 have the expected values.
I manually did the maths:
(2000000000Hz * 16384) / ((16384 * 6) + 12808) = 294909640.7Hz
which matches what clk_summary sees:
294909641Hz

Just to clarify that I am not wasting Christian's time when I ask him
to test something:
next up we'll set SDM_EN to 0 (instead of 1) and see the reaction using clk-msr?


Best regards,
Martin


[0] https://github.com/hardkernel/linux/tree/db88db3864c5d6903fb11f6528874887d1c473ce/arch/arm64/boot/dts/amlogic
[1] https://pastebin.com/raw/1cjPFsfa

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
