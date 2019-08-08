Return-Path: <SRS0=t7Bi=WE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD346C41514
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Aug 2019 04:43:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82D1A21873
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Aug 2019 04:43:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dhaBZW85";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kc4ZDf1J"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 82D1A21873
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mPztfC7iFRcPrFrPkLueetIbAG3uc197NVMlXp04vuI=; b=dhaBZW85R2ZJ72
	H5HBe0HfsRj4X8DtrBPowYeEM5QJm754q2Awd9vOjG5brGDJnINvnVunahd2ea7tcYnErm9vmHuoF
	1ldtldYMzWUHOmuGvVz9g8Y3lQgeuElN5/uIxfEjsBQxwOUs3gBBZBOse//unkWz3Xo1OG+SSJ0ke
	ku4ShuZ3X/gdlCI3d8GM/AuvIAHigZWIerxI0fc16XA7kke3vXO0h3PfeYWWGoCYqRQ+CGf2M08ft
	ylE7MGg3+yDiP0fnDBxF4RYffxVUE2TxxfBN63cQuJoSTtcI/k0S350neKmxiGAOcFiz7u/2X3XQm
	Qft5s5aOb/vWOl1dpVtw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hvaGr-0004GK-OX; Thu, 08 Aug 2019 04:43:26 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hvaGo-0004FV-Qp; Thu, 08 Aug 2019 04:43:24 +0000
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 30FC0217D7;
 Thu,  8 Aug 2019 04:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565239402;
 bh=epeHa/FiHLUJX+Won1KcmqufCoWzRRNhnCbnjs+xtOE=;
 h=In-Reply-To:References:From:Cc:To:Subject:Date:From;
 b=Kc4ZDf1JK1gy2Li/0XaN/PMxsQBAC2yqwdZULhUg9zLN0rTqC7NgtlhrIJMBkquFc
 iK9xz36G2sSfMlUOCD935ehbb+Qn7/5j+eZGn5LG9vtuPOa1/KhSmBlDP+HFZae1BC
 orQ+lrzDQ69ksPmQpDlQAzkk325NAKjV5BniViIU=
MIME-Version: 1.0
In-Reply-To: <CAFBinCAnKeGYkyCmEMugWuQaSxgBp4DqtHN3b0rLJY6jwOF0QA@mail.gmail.com>
References: <20190701091258.3870-1-narmstrong@baylibre.com>
 <20190701091258.3870-8-narmstrong@baylibre.com>
 <CAFBinCAnKeGYkyCmEMugWuQaSxgBp4DqtHN3b0rLJY6jwOF0QA@mail.gmail.com>
From: Stephen Boyd <sboyd@kernel.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, dbasehore@chromium.org
Subject: Re: [RFC/RFT v3 07/14] clk: meson: g12a: add notifiers to handle cpu
 clock change
User-Agent: alot/0.8.1
Date: Wed, 07 Aug 2019 21:43:21 -0700
Message-Id: <20190808044322.30FC0217D7@mail.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190807_214322_931404_66178BCD 
X-CRM114-Status: GOOD (  13.15  )
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
Cc: khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Quoting Martin Blumenstingl (2019-07-02 16:28:55)
> Hi Stephen, Hi Neil,
> 
> On Mon, Jul 1, 2019 at 11:13 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
> >
> > In order to implement clock switching for the CLKID_CPU_CLK and
> > CLKID_CPUB_CLK, notifiers are added on specific points of the
> > clock tree :
> >
> > cpu_clk / cpub_clk
> > |   \- cpu_clk_dyn
> > |      |  \- cpu_clk_premux0
> > |      |        |- cpu_clk_postmux0
> > |      |        |    |- cpu_clk_dyn0_div
> > |      |        |    \- xtal/fclk_div2/fclk_div3
> > |      |        \- xtal/fclk_div2/fclk_div3
> > |      \- cpu_clk_premux1
> > |            |- cpu_clk_postmux1
> > |            |    |- cpu_clk_dyn1_div
> > |            |    \- xtal/fclk_div2/fclk_div3
> > |            \- xtal/fclk_div2/fclk_div3
> > \ sys_pll / sys1_pll
> >
> > This for each cluster, a single one for G12A, two for G12B.
> >
> > Each cpu_clk_premux1 tree is marked as read-only and CLK_SET_RATE_NO_REPARENT,
> > to be used as "parking" clock in a safe clock frequency.
> it seems that this is one case where the "coordinated clocks" feature
> would come handy: [0]
> Stephen, do you know if those patches stopped in March or if there's
> still some ongoing effort to get them ready?
> 

Derek told me yesterday he wants to work on it again, but I don't know
his timeline. If Derek doesn't reply here then maybe it can be picked up
by someone else.


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
