Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23BAEC433EF
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Apr 2022 07:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xq/q5sGMmP8W5sCtxWe7Bwb40Uxg5OXgTk2bLKdc24A=; b=pee4dLUHqxmc8o
	iiq4mPupwkoqUGTDJuvI4eK8gptRAIbQ8rIg1dYjLh70jmur5Y9hDJEPC1c4XNW3GliUl7ySHPoSh
	QGYyCdyPfRqrdIhv9f/QWuKbMvWP2wuoEdIl/X+zTsieUdcjy7pnEk3g/6eB4SP4tgsYfH+cli+x9
	DJ1wq8X5mthL4tk37IuIgcclgMewlhYx2eVIgocN0PmTyzIE+Ki9/VAiuDGJMaLN7DpM0sqBa2KZW
	BbYfKmt3Blxo0jIQS8wXHbHRjOLxFvuwAmOJwv9BwPteFSuFJ1FPnfaWsVv+SDRCp8lsVrpdaReiX
	A0W3720XS4ylKL56MVGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbH7Z-00DcUP-FJ; Mon, 04 Apr 2022 07:27:29 +0000
Received: from wout3-smtp.messagingengine.com ([64.147.123.19])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbH7V-00DcTe-OZ; Mon, 04 Apr 2022 07:27:28 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id BD08B3201F82;
 Mon,  4 Apr 2022 03:27:16 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 04 Apr 2022 03:27:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; bh=TDH98TyHYWyK2t
 EdUf0NoO/6nH3Q1TMk2EezkWhx3sQ=; b=dVMnZC6J7tmVc2SUnBa4VQJJqZ20bo
 6f54IrlyZ8tr75WoIHSLwBO6KSnEfdiuxUimbqbtpmF3Gr9RhlL2ZKSusEe+w1aO
 CI4McmjlBK5t1NSFFVUIp8y95sFNox+JBwrDbsHVRTydyk5+wcAtylD4lI9e+X7E
 n7gkgadc8ZMK7rn7cOl+79hP3fhNAogO9KrvuMpgHuPJ8NEhhPHkDOoZX6giePuM
 nIbHv3t7XmRYCkRcX9Saly/cUk+iDS3PsUuRkdpZ7fJa0kgj3hd0cocDgsSbpAkl
 AG0ObjjhPcY/qRGLBYQWgri0NbrsGC35+bgHQvGxEJaq9ZRrtnfB1+Ew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=TDH98TyHYWyK2tEdUf0NoO/6nH3Q1TMk2EezkWhx3
 sQ=; b=f4+WBWo2dbAGquUDEXVBczIWI4+fiiWvJ5XQvUSV8sgOzp+23gO8eYlqK
 h14y6fc/Fn27YhO7OFqxM501oQUvwLQL0Acr1bB70UtB2lE8ATX4NBToTbjPQASr
 yjlxXrj4uRaV+IL8n39XTTUZsNlNXl3PzAl+edblexvqSN3ZnF2hjHiA/MqoNfBx
 NAD8uzbrrGz28Ev05vRofgf9HKDyRZMqfFX7z3CPAsJksL3vmoepKzfZ6TyYmYWe
 M/2AWLsbw3/ulG6MGvSfVfsa9ZHPWgcDjDAiCo0tGyM8rZ2c0HrtbgVxtXu/eIqW
 yaVnWuXx4kFjIXGoRF2DOeOL3p+ng==
X-ME-Sender: <xms:0Z1KYo3s9JcjtgrOYW-NphGGx9CqgZvH0obO0_U2k9CHvQYZJpKNTg>
 <xme:0Z1KYjGCwV-gsqijF_O-cDhrACsXElxfsYNW-ukeDPJED2O4E2Dzh9W0MVzaQjvoC
 PGN4YE9_NDEFDZQCZ0>
X-ME-Received: <xmr:0Z1KYg7N6BpEzKu5kDvFlPvaLSGzFQUu06NkchrUJxXT1BJz9pbi-bFEeZU2Lp-6h8eqNM8aIc4HXekC6LK7SFt5Cj4JPVT0kjBKyrQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudejuddguddvudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggugfgjsehtqhertddttddvnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepkeeludfhledtieegfeelveetveegueeghfeitedttddvjefhgfevgfdt
 leegheehnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgv
 tghh
X-ME-Proxy: <xmx:0Z1KYh1PJQ9XoY6VXz8dX9SuNKKvTanIn9udheYOihk3n7IG2yrwtQ>
 <xmx:0Z1KYrGB9khYukboV_p4SRsPgIFXQzjoLpIiZ_vouVtsRdREPycQOA>
 <xmx:0Z1KYq_ajBfX_xzZ-dBSbSkg75I0RQKoykkNJ9K1I6_CB5nzTuMRUw>
 <xmx:1J1KYiBxUPmYfSNx2X6cPTlTzJJuCgwMrGunaWS9pyhZSH64ESjKCA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 4 Apr 2022 03:27:13 -0400 (EDT)
Date: Mon, 4 Apr 2022 09:27:12 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Tony Lindgren <tony@atomide.com>, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Mike Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 'Linux Samsung SOC' <linux-samsung-soc@vger.kernel.org>,
 linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org
Subject: Re: (EXT) Re: (EXT) Re: (EXT) Re: (EXT) Re: (EXT) Re: [PATCH v2 3/3]
 clk: Drop the rate range on clk_put
Message-ID: <20220404072712.bbsbkq3cpyx4xuzy@houat>
References: <20220325161144.1901695-1-maxime@cerno.tech>
 <14273141.O9o76ZdvQC@steina-w>
 <20220401145502.5hnilpku3qh77bvs@houat>
 <4391300.LvFx2qVVIh@steina-w>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4391300.LvFx2qVVIh@steina-w>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_002726_504061_3A876303 
X-CRM114-Status: GOOD (  17.80  )
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

On Mon, Apr 04, 2022 at 09:06:42AM +0200, Alexander Stein wrote:
> Here is the requested output:
> ---
> $ ./scripts/faddr2line build_arm64/vmlinux 
> 'clk_mux_determine_rate_flags+0x33c/0x380'
> clk_mux_determine_rate_flags+0x33c/0x380:
> clk_mux_determine_rate_flags at drivers/clk/clk.c:627
> ---
> From a first look it seems that 'best_parent' is just a NULL-pointer here.
> With this small fix
> --->8---
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 071857ef381a..45e081330fac 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -626,7 +626,7 @@ int clk_mux_determine_rate_flags(struct clk_hw *hw,
>  
>         pr_crit("%s: Best parent %s (%lu)\n",
>                 __func__,
> -               best_parent->name,
> +               best_parent? best_parent->name : "unknown",
>                 best);
>  
>         return 0;
> --->8---
> 
> The boot eventually get stuck, but at a later point.Which is probably why your 
> analysis found nothing strange. Due to the size of the output I put it on a 
> gist on github [1]. Please note that this is still based on a next-20220331 
> based tree without the revert.

I've looked into it over the weekend, and ran qemu on an imx6 to try to
see if it was any similar

I believe the issue comes from the fact that the core will forward rate
requests structure to the parent clock as is, and if the parent clock
changes the parent it wants, we end up trying to use that parent in the
initial clock which doesn't work really well.

I've fixed it in my branch here:
https://github.com/mripard/linux/commits/rpi/clk-improvements-more-fixes

Could you give it a try?
Maxime

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
