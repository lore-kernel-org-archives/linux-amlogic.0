Return-Path: <SRS0=yQOf=LQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1356C2B9F4
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Jun 2021 21:17:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91214611CE
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Jun 2021 21:17:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 91214611CE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=teZb2VllRaAMQg24gGNhvQUX5u1GYamjWkSs6Imhr4M=; b=LCmFjuoKMGkBfl
	U1zGeLe/vX+sR0vs+x5mc0v7lS16kk3VW8w04m40eDt2RZNHW5tgKc7b3Itw41Q4Xvr1WPKEparkI
	qPzcJAI7oHFcjXbzBVKiSk9HqGGb+P7MwV0iPtrctaKCq4jtOP3tiYXI5ARTKVmD75BB/FJbtdZlQ
	Zp+hrnBvhp8Gs1Mx5ZUQcEurMexhSbBAnhYe0//ZZM7vgUq/uFCLQnxWGvUL9OhXkQGk2h+Cl12gP
	ftaZitfFEFfScbGjVQYuZuzdRcH9rYsLagASNXnM1A71l2cjIYhbVCDkQtNzVxGFZb8tK5wP2Rv02
	RAA1g3FZLIvlH0utHi4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvnmC-008SUa-DV; Tue, 22 Jun 2021 21:17:44 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvnm8-008STZ-US; Tue, 22 Jun 2021 21:17:42 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3EA186108E;
 Tue, 22 Jun 2021 21:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624396660;
 bh=4hqUaho/Ab0/b89LGZN2tYhoZu25lf6YRdYhZjsELBM=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=LjYDkXgEZA9X7z80M6zL0i+zZYfGkiNfZmr+qC4qsKsW0309YkVLC8WvOfRjo9u0j
 JwVA5e1hckatuWjsSV2P1WNlx1HRdD5Eq9Roa86w5sUmlL8oxhPAKAlMUqfeUa4304
 jb78aSUAo917vTEdemhQhUX8dMl4jbybkIsvZXYixfaJdKC63HI8Nsl5NxA2IrX+y/
 +vdf3vWKObq8mZPhxc1XgjypzDjCDPBkYW457ZA4PujIKph60LUNOD4wDnqaBj1f2T
 O/DdXGgXSKbIx1MHJ8kp4Gc+IjuMxhqGtwO7A/UqSnZ21AbAG109eePfNDPX8WYvI3
 xOL/C4R3LDFTA==
MIME-Version: 1.0
In-Reply-To: <CAFBinCBpkci-BeqLSN+BNbrcAE9sLKM8Hs0BB09AM1GKmtU9_g@mail.gmail.com>
References: <20210524103733.554878-1-martin.blumenstingl@googlemail.com>
 <CAFBinCDn_0TeyLG9b9uB+4-4PdeNXgja11wf2CGcQ99tUNjkyQ@mail.gmail.com>
 <1jr1heqhoy.fsf@starbuckisacylon.baylibre.com>
 <CAFBinCBpkci-BeqLSN+BNbrcAE9sLKM8Hs0BB09AM1GKmtU9_g@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] clk: meson: rounding for fast clocks on 32-bit SoCs
From: Stephen Boyd <sboyd@kernel.org>
Cc: Neil Armstrong <narmstrong@baylibre.com>, mturquette@baylibre.com,
 khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 22 Jun 2021 14:17:39 -0700
Message-ID: <162439665901.1026800.14766697980134538910@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210622_141741_057298_FCA0F1DF 
X-CRM114-Status: GOOD (  31.87  )
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

Quoting Martin Blumenstingl (2021-06-22 14:04:55)
> Hi Stephen,
> 
> On Mon, Jun 7, 2021 at 9:04 AM Jerome Brunet <jbrunet@baylibre.com> wrote:
> >
> >
> > On Fri 04 Jun 2021 at 19:18, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:
> >
> > > Hi Jerome, Hi Stephen,
> > >
> > > On Mon, May 24, 2021 at 12:37 PM Martin Blumenstingl
> > > <martin.blumenstingl@googlemail.com> wrote:
> > >>
> > >> On the 32-bit Amlogic Meson8/8b/8m2 SoCs we run into a problem with the
> > >> fast HDMI PLL and it's OD (post-dividers). This clock tree can run at
> > >> up to approx. 3GHz.
> > >> This however causes a problem, because these rates require BIT(31) to
> > >> be usable. Unfortunately this is not the case with clk_ops.round_rate
> > >> on 32-bit systems. BIT(31) is reserved for the sign (+ or -).
> > >>
> > >> clk_ops.determine_rate does not suffer from this limitation. It uses
> > >> an int to signal any errors and can then take all availble 32 bits for
> > >> the clock rate.
> > >>
> > >> Changes since v1 from [0]:
> > >> - reworked the first patch so the the existing
> > >>   divider_{ro_}round_rate_parent implementations are using the new
> > >>   divider_{ro_}determine_rate implementations to avoid code duplication
> > >>   (thanks Jerome for the suggestion)
> > >> - added a patch to switch the default clk_divider_{ro_}ops to use
> > >>   .determine_rate instead of .round_rate as suggested by Jerome
> > >>   (thanks)
> > >> - dropped a patch for the Meson PLL ops as these are independent from
> > >>   the divider patches and Jerome has applied that one directly (thanks)
> > >> - added Jerome's Reviewed-by to the meson clk-regmap patch (thanks!)
> > >> - dropped the RFC prefix
> > > please let me know what you think about this v2
> > > I am asking because clk-divider is widely used, so I'd appreciate if
> > > this gets some time in linux-next (so for example Kernel CI can test
> > > this and report issues if there are any).
> Do you have any comments on this series?
> I am fine with it skipping 5.14 as it's a change which affects
> multiple platforms.
> So I would like to use the time until the trees are opening for
> patches targeting 5.15 to iron out code-review comments.
> 
> > Looks good to me
> > Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
> Thanks Jerome - I'll add it to v3 once I send it (assuming nothing
> major changes)

Looks ok to me. Will you resend?

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
