Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D8D0C3DA61
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Jul 2024 19:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XgqPwi9GEcj3cHnwxu5EMFiT4LitBqE5lRMXuwRSHRk=; b=18LxDxdmJtSYPq
	EchNTUyINbnY9sM8xGWU4JXXnNTAf0vItT/px0zTqIBGeudM9U88yMtSjeB0Ky9KxL68pfXzgt6cG
	uYhu+1j9aPhR5DXmb0wpo2WEHDo47p5z2tTw1GIg1cBw8d6Zh97YyjqZko6xTCYjbun5ZaQyw09W9
	HhrKDkFvRMfKZT1TE5GRlW+fmho+NRXg4ZxA7StkRgUxyawvxYv48/iXU4IpK/lWdEu4Ygkd3+vKJ
	lLV6AuyXvDutjVWB4AOtZRHx5Whv3Ootl/66N+FYYBi6ssFuKgzNbcIjvEAk11LBhbkC3EMX19QY/
	XSyiBKvF59YA6k/6m/lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUWob-00000000Tre-38kF;
	Thu, 18 Jul 2024 19:29:21 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUWoY-00000000Tr7-1y5n
	for linux-amlogic@lists.infradead.org;
	Thu, 18 Jul 2024 19:29:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 99D05CE1A0F;
	Thu, 18 Jul 2024 19:29:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C779CC116B1;
	Thu, 18 Jul 2024 19:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721330955;
	bh=AY7KZUhJSS2xHnx5qvpmw6/QZr8U0eAGcyvPvqwirm0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=gNfAnuxCO/xcTX51RbCvM9gaik01hcr7jaMt4URGH8qYT87MbfFVVww42i3wK9gPB
	 1TtbK0ioS6GsDRe2CVCIzVz43FtBro51gkNaOwPDLTj/fjgIG5wfNdEk8PM5ymDkcG
	 uFNGaqxWupm6RtvNvFQUhAGM3YRyuNxZY0hv5jH8JGgIC9Zt/R296EZ6ujLIP7YvQi
	 7EimfjsVH+f+PU9zVVyXsbbXemEPWn9NYQDzjCzdUTRb6EBF1wOd7cH3FywH67vuU2
	 PP2E95GB/cKpio13+ekvIkGDRmIDiv7B3Mu3LS6mxYFezfoHPplhgSv6IXOPNz/kIo
	 r3UZd2gpwfmBg==
Message-ID: <11e8dd92e07674133d8a291cc016c314.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <f5bc9590-f37e-491e-9978-c1eab8914c30@salutedevices.com>
References: <20240710162526.2341399-1-jbrunet@baylibre.com> <20240710162526.2341399-2-jbrunet@baylibre.com> <b12ac6b2-cb46-4410-9846-86ed4c3aea1f@salutedevices.com> <1jv813makr.fsf@starbuckisacylon.baylibre.com> <f5bc9590-f37e-491e-9978-c1eab8914c30@salutedevices.com>
Subject: Re: [PATCH 1/8] reset: amlogic: convert driver to regmap
From: Stephen Boyd <sboyd@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>, Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 18 Jul 2024 12:29:13 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240718_122918_705071_32BE2D65 
X-CRM114-Status: GOOD (  17.45  )
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

Quoting Jan Dakinevich (2024-07-18 04:01:28)
> 
> 
> On 7/18/24 10:19, Jerome Brunet wrote:
> > On Thu 18 Jul 2024 at 05:39, Jan Dakinevich <jan.dakinevich@salutedevices.com> wrote:
> >> and using of regmap_write() (apparently) fixes it.
> > 
> > Nor does that conclusion.
> > > It is perfectly possible I have made mistake somewhere (I have already
> > fixed one in v2), but sending incomplete report like this, with
> > unargumented conclusion is just noise in the end.
> > 
> > No, there is no situation in which `regmap_write` would solve a problem
> > with `regmap_update_bits`.
> > 
> 
> What is the default regs' value of this reset controller? The doc that I
> have doesn't clearly specifies it, but it tells that "the reset will
> auto-cover to 0 by HW". However pr_info() say that there is 0xffffffff
> before write (I am talking about A1).
> 
> Also we know, that reset is triggered by writing 1 to specific bit. So,
> what will happen if 1 will be written where we did not intend to write it?
> 
> > Either send a full analysis of the problem you found, if you did one, or
> > at least send the full dump, explaining that you don't know what is
> > happening.
> > 
> 
> Full analysis is following:
> - using regmap_update_bits() instead of writel() is incorrect because
> this changes the behavior of the driver
> - regmap_update_bits() should not be used here because default value of
> regs isn't taken into account and (_apparently_, the doc is terse) these
> regs could be updated by hw itself.

Maybe use regmap_write_bits() instead.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
