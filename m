Return-Path: <SRS0=gNbl=CG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3011FC433E2
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Aug 2020 17:52:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 015D920776
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Aug 2020 17:52:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZkKA6QJ0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 015D920776
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dh3Jiy1fqb1i+q8k+22EGyEW0TkFMrIq4eL7bhNV500=; b=ZkKA6QJ0RyA1gHhxwqz3/3ZVU
	wnNeRGV+7aE8sDts6rtIxVYFvszgd5M1zL08TH3YDHaaFOewzt9QRwEG6Ae0oLPxKCPi6D+Da+DMm
	1MN6xC4udcVvbmdHydY4cV5GA4TbmkOzcOjnuVotjHxgvqzQ6m4X2nbw9KQ4NltQof1/WFgwApL8j
	NvSFAsDcfia3ChjHJ9LEViEvsu8nMOGmhtnV6dd78hlK+z/pkZbo7b0FA9ksTr6Grq1YBNe7WzGGu
	2lI/lnT40zNIeeqITFuPi7llEnuYpJrmUZ1mz70ceV5dunkAdnf4gt8STip6H+v/EbEBnD1N7tB24
	ExNnpsPVA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBiXk-0002Qk-Iq; Fri, 28 Aug 2020 17:52:04 +0000
Received: from smtprelay0239.hostedemail.com ([216.40.44.239]
 helo=smtprelay.hostedemail.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBiXi-0002Pq-7S; Fri, 28 Aug 2020 17:52:03 +0000
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay01.hostedemail.com (Postfix) with ESMTP id 9C5C8100E7B4C;
 Fri, 28 Aug 2020 17:52:00 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: edge90_0e065aa27077
X-Filterd-Recvd-Size: 3579
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf05.hostedemail.com (Postfix) with ESMTPA;
 Fri, 28 Aug 2020 17:51:56 +0000 (UTC)
Message-ID: <d8dce79d93363e19ea132ba8237a607a1ff28f09.camel@perches.com>
Subject: Re: [PATCH v2 09/18] iio: afe: iio-rescale: Simplify with
 dev_err_probe()
From: Joe Perches <joe@perches.com>
To: Peter Rosin <peda@axentia.se>, Krzysztof Kozlowski <krzk@kernel.org>
Date: Fri, 28 Aug 2020 10:51:55 -0700
In-Reply-To: <b7a5a441-cda1-ad02-b723-255231f2bd94@axentia.se>
References: <20200827192642.1725-1-krzk@kernel.org>
 <20200827192642.1725-9-krzk@kernel.org>
 <f4a5777e-fe85-9f3f-4818-f7539f223adc@axentia.se>
 <20200828062443.GA17343@pi3>
 <3a5cb59b-454e-2c3f-9f31-43147e843c66@axentia.se>
 <CAJKOXPcqNE5U82UThzBTPCvucCf2LsCVSfAHE1vnecJGCKCaig@mail.gmail.com>
 <b7a5a441-cda1-ad02-b723-255231f2bd94@axentia.se>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200828_135202_318725_B61FE658 
X-CRM114-Status: GOOD (  15.29  )
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
Cc: Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-iio@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>,
 Tomasz Duszynski <tomasz.duszynski@octakon.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Kevin Hilman <khilman@baylibre.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Kukjin Kim <kgene@kernel.org>,
 Beniamin Bia <beniamin.bia@analog.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Hartmut Knaack <knaack.h@gmx.de>,
 Jonathan Cameron <jic23@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, 2020-08-28 at 11:39 +0200, Peter Rosin wrote:
> On 2020-08-28 09:03, Krzysztof Kozlowski wrote:
> > > > If there is no consensus among discussing people, I find this 100 line
> > > > more readable, already got review, checkpatch accepts it so if subsystem
> > > > maintainer likes it, I prefer to leave it like this.
> > > 
> > > I'm not impressed by that argument. For the files I have mentioned, it
> > > does not matter very much to me if you and some random person think that
> > > 100 columns might *slightly* improve readability.
> > > 
> > > Quoting coding-style
> > > 
> > >   Statements longer than 80 columns should be broken into sensible chunks,
> > >   unless exceeding 80 columns significantly increases readability and does
> > >   not hide information.
> > > 
> > > Notice that word? *significantly*
> > 
> > Notice also checkpatch change...
> 
> How is that relevant? checkpatch has *never* had the final say and its
> heuristics can never be perfect. Meanwhile, coding style is talking about
> exactly the case under discussion, and agrees with me perfectly.

As the checkpatch maintainer, checkpatch is stupid.
Using it as a primary argument should never be acceptable.

But line lengths from 81 to 100 columns should be exceptions
rather than
standard use.

Any named maintainer of actual code determines the style for
that code.

Style consistency and use of kernel standard mechanisms
should be the primary goals here.



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
