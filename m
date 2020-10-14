Return-Path: <SRS0=UBLa=DV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CAABC433DF
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Oct 2020 00:44:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8323208B3
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Oct 2020 00:44:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="3H8mehxG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="jhW/FCgv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B8323208B3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:Date:To:From:Subject:References:
	In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=k/hFXLBLWSVUShiIpyaQ2JRPB9t8IY0uMPMHHuT20mw=; b=3H8mehxGFZ1suaw67o8w/H3jO
	sD2flDGng+GT9HBzgQVWE38Iks+45DMEKxYyVmZqqKq279iWeWpcrv2y5RvPOIV3mWECNsh44WMRR
	h+6lBul+NT7cwQMf60EqBdD7HOVeyUtwsH4gn0jU9eYiAaGUumLz/ZvFPUuLbkxFOHiuufTLj7ZWn
	JVs2mxRuIRub9Cn3xw+6TSHcuSWz/9kKCZ9SZxfW0Gn4ZKglhNYgEioCjqTEc5qHISOMPijpjl980
	sbOJmMm4Dzo9S50SrGjBKeVTrCsaHCbghya6zJFoXGHLcUPkF2zp3LQPUtEJCS2x0aRqah045Y6cX
	CWxfMdBaw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSUuQ-0001hO-Gn; Wed, 14 Oct 2020 00:44:50 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSUuO-0001gR-EC; Wed, 14 Oct 2020 00:44:49 +0000
Received: from kernel.org (unknown [104.132.1.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 95EF620EDD;
 Wed, 14 Oct 2020 00:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602636287;
 bh=mbZzU39csZNZQGLMxoWeP2Ekx+MNtrzNxans6AvrVdY=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=jhW/FCgvIajeikR6GDVTN//xRCRcaTWpDXU4yfTvhEfSeoYeWNjk1d7O9LmommC0a
 796lqKjycV6yBS04O/RMsL+QYeZUYFy8RBqFqkdBKfxgtUWqhv0diuEVh0QWyB5bPA
 5y71pQUyPE2+xVuE1WOeBEWU+mlQOYJlu6mEsw+k=
MIME-Version: 1.0
In-Reply-To: <1601233948-11629-11-git-send-email-Julia.Lawall@inria.fr>
References: <1601233948-11629-1-git-send-email-Julia.Lawall@inria.fr>
 <1601233948-11629-11-git-send-email-Julia.Lawall@inria.fr>
Subject: Re: [PATCH 10/18] clk: meson: use semicolons rather than commas to
 separate statements
From: Stephen Boyd <sboyd@kernel.org>
To: Julia Lawall <Julia.Lawall@inria.fr>,
 Neil Armstrong <narmstrong@baylibre.com>
Date: Tue, 13 Oct 2020 17:44:46 -0700
Message-ID: <160263628656.310579.10860580831866859265@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201013_204448_539882_4C72ECA6 
X-CRM114-Status: UNSURE (   9.14  )
X-CRM114-Notice: Please train this message.
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
Cc: Valdis =?utf-8?q?Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, Joe Perches <joe@perches.com>,
 linux-amlogic@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Quoting Julia Lawall (2020-09-27 12:12:20)
> Replace commas with semicolons.  What is done is essentially described by
> the following Coccinelle semantic patch (http://coccinelle.lip6.fr/):
> 
> // <smpl>
> @@ expression e1,e2; @@
> e1
> -,
> +;
> e2
> ... when any
> // </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
> 
> ---

Applied to clk-next

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
