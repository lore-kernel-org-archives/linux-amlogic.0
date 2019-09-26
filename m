Return-Path: <SRS0=DMeG=XV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C20D4C4360C
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Sep 2019 18:34:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 957BE21D56
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Sep 2019 18:34:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sD8tDgY5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="UgV7Uh+B"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 957BE21D56
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X8RsxAunaxjMNljgzmmFCPDthrT+iyCQzaL8LjWQisc=; b=sD8tDgY5mH7CUh
	fdqATSVELvrYMN0X7JzyHB0HcwhDnPsFVefK4RXZ06DriF0XBV3TD+bjeaPSTKgoE548eoAaw8EtS
	dB+RNtNrjjZH/OZ6K7cB7Vd7KXJTsv4goVod/ttGnUhLeuhg9ykE59/dLmJ3nqKuBYgflMks479LB
	hGIFXc9laswueeRwSb9W2GUymv/ZFKnlWA0VY/2XEN6RD0ZnFKvMHV7fxDxAjV/i8LsUXZWNkYENS
	UHOKbRsbYhr5mg5+xE0PZMcgG7zd/+QDiNaVOkoxnu3M0da1HvPu1OXPGr9MbTcsN325ABXxij9K7
	8SZnFE12vLm1PG9gaTWQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iDYbH-0000Ks-BQ; Thu, 26 Sep 2019 18:34:47 +0000
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iDYbE-0000Jw-Ph; Thu, 26 Sep 2019 18:34:46 +0000
Received: by mail-oi1-x243.google.com with SMTP id e18so3023086oii.0;
 Thu, 26 Sep 2019 11:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NGmse8tCqZQZ4pc5Rd9nycCZrtTO2C0KKH3W2gH74ZQ=;
 b=UgV7Uh+BjMLCWW04clvdJpCdRfDq+LPqUWtOYblF8YWz4YKYeXATM5GBrymb/Sk+uQ
 S81PNoDJWIh2MnYlFgrJJyqp4nJIPSEnWcQcU9diyD7BzDBQk15Xq03a2s9hdNP2x0Gv
 LycDh6FqujeKrx/3oAaZ1qrF9pDZklAuacpqB1EbUABmeQEyCF3XqGsYD7ya6ukjJAek
 DEZHtXpSpDRBRERpBikNPBMDwlpHgQgE9z6uGXS/Ge9WNOrjEdT4a86+wC0dfksXnAB5
 6wACcrdJIdl5YFIKME8vJ7Blt1qGTY/vzSMBgtbkwKLvPS3zxgplPCWYOS0jKRSfbq/p
 diGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NGmse8tCqZQZ4pc5Rd9nycCZrtTO2C0KKH3W2gH74ZQ=;
 b=JyDq4zWFIAFJgcKTULeNm611Jngtn6rJRyYSHqyY474FLL6zdpvIsgQqxkIybcFeQA
 Wt4Ms91iVTf73dmrebUaKmm4/DRcs+59QJVRjFdD/QWgzy7yanqHhEyBn3jtbxAh50q5
 3RBKCC8OO1fH5wG4020rXyBvMuwYMIW+TnIJ0Xx54L4IvDwlIhbCVhzlqlf0XL3ZfHU9
 vmk+chYKksWG7pl5YhiaZ93U0Tt9442Dd38pJX5ozi2BV5oGJ9/h/1jvka+Nzq4zMnSa
 wjHOPLhyeE/UwX2IH6q6yW+8zlgZj18hsm4ptEnsCXbfg2qEWhow/KtNSYJBwuH46aEk
 U55Q==
X-Gm-Message-State: APjAAAXPb9SjOvZoTmJPm9gRAqNaEd5xIW9MoMKCOGtASpJngOLS5fX5
 wTjxA75/XDda452cK5eXYMtQ1Lbm+/Y/Za0xNjg=
X-Google-Smtp-Source: APXvYqxuPwoB6TKSeyJqIwODjZis0k+ZmHBg9WFAB8/8pKYdueaEYWwk2+HM7MX9vjrMpv/LByMTiav/h+fuf+x5A5g=
X-Received: by 2002:aca:4d08:: with SMTP id a8mr3946038oib.39.1569522879867;
 Thu, 26 Sep 2019 11:34:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190921151223.768842-1-martin.blumenstingl@googlemail.com>
 <1jzhivs6n6.fsf@starbuckisacylon.baylibre.com>
 <CAFBinCA0NaCJEDfNEg+LRfW3wxfNFGbXmGS+z7D5792TsupVAA@mail.gmail.com>
 <7h7e5wt2m1.fsf@baylibre.com>
In-Reply-To: <7h7e5wt2m1.fsf@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 26 Sep 2019 20:34:28 +0200
Message-ID: <CAFBinCAv=_3vWSanQg1S5EXBVzdgTu2Ub3Hyad_ajF3v6PcbGQ@mail.gmail.com>
Subject: Re: [PATCH 0/5] provide the XTAL clock via OF on Meson8/8b/8m2
To: Kevin Hilman <khilman@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190926_113444_838299_DA8666FC 
X-CRM114-Status: GOOD (  26.10  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Kevin,

On Thu, Sep 26, 2019 at 12:47 AM Kevin Hilman <khilman@baylibre.com> wrote:
>
> Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:
>
> > Hi Jerome,
> >
> > On Mon, Sep 23, 2019 at 11:29 AM Jerome Brunet <jbrunet@baylibre.com> wrote:
> >>
> >> On Sat 21 Sep 2019 at 17:12, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:
> >>
> >> > So far the HHI clock controller has been providing the XTAL clock on
> >> > Amlogic Meson8/Meson8b/Meson8m2 SoCs.
> >> > This is not correct because the XTAL is actually a crystal on the
> >> > boards and the SoC has a dedicated input for it.
> >> >
> >> > This updates the dt-bindings of the HHI clock controller and defines
> >> > a fixed-clock in meson.dtsi (along with switching everything over to
> >> > use this clock).
> >> > The clock driver needs three updates to use this:
> >> > - patch #2 uses clk_hw_set_parent in the CPU clock notifier. This drops
> >> >   the explicit reference to CLKID_XTAL while at the same time making
> >> >   the code much easier (thanks to Neil for providing this new method
> >> >   as part of the G12A CPU clock bringup!)
> >> > - patch #3 ensures that the clock driver doesn't rely on it's internal
> >> >   XTAL clock while not losing support for older .dtbs that don't have
> >> >   the XTAL clock input yet
> >> > - with patch #4 the clock controller's own XTAL clock is not registered
> >> >   anymore when a clock input is provided via OF
> >> >
> >> > This series is a functional no-op. It's main goal is to better represent
> >> > how the actual hardware looks like.
> >>
> >> I'm a bit unsure about this series.
> >>
> >> On one hand, I totally agree with you ... having the xtal in DT is the
> >> right way to do it ... when done from the start
> > yep
> >
> >> On the other hand, things have been this way for years, they are working
> >> and going for xtal in DT does not solve any pending issue. Doing this
> >> means adding complexity in the driver to support both methods. It is
> >> also quite a significant change in DT :/
> > my two main motivations were:
> > - keeping the 32-bit SoCs as similar as possible to the 64-bit ones in
> > terms of "how are the [clock] drivers implemented"
> > - with the DDR clock controller the .dts looked weird: &ddr_clkc took
> > CLKID_XTAL from &clkc as input and &clkc took DDR_CLKID_DDR_PLL as
> > input from &ddr_clkc
> >
> > RE complexity in the driver to support both:
> > I still have a cleanup of the meson8b.c init code on my TODO-list
> > because we're still supporting .dtbs without parent syscon
> > my plan is to drop that code-path along with the newly added fallback
> > for "skip CLKID_XTAL" (assuming this is accepted) together for v5.6 or
> > v5.7
>
> TBH, I'm big(ish) "functional no-op" changes like this are not things I
> get super exicted about, especially for SoCs that have been working well
> for awhile, and are do not have a large (upstream) userbase.
>
> OTOH, since Martin is doing most of the heavy lifting for keeping this
> platform working upstream, I'm happy to take the changes, as long as
> Martin is willing to deal with any fallout.
I agree: it has to work and if it doesn't then I will have to fix it so it is
so I will be taking care of any fallout


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
