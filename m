Return-Path: <SRS0=a8bK=FL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E88E3C433FE
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Dec 2020 10:33:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58E5D23159
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Dec 2020 10:33:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 58E5D23159
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ANu+BEbRdYJGsl3MHkXtDetG18fpiPTeRVgh9X7BlzA=; b=EXOgvh/jr3/9mpmRF1HkB5cm8
	bf17B6gqlG4nu55tLOz3ZL80TQ2UfNIWbNRPVXl2VVG6zyOqGkLLk+5MT5zMocnozyUaLr4x/U4r4
	QLQOQlarxp2zOFFoumTnfBDQsVQ3oOeVSKuZ9qVvDTA4a7HWM+UUcXozmhEU0VzwDQAhQFzRPYU6v
	POQoleZgmzgdg2MmzKF1HY4MmTetafQbiaqcFLGj7/CgY6YNvuAyrFERjpV5KTDXJeHN8LFfdyR3x
	PRK8bw8Lx9FpV+EYDeBfDT+kdQod60zp4JEu4mjEgjllCiRoICNdNbSoYfBGI76yrMsm61v5c5IWw
	8lplOfrrA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmDpg-0006lt-Po; Mon, 07 Dec 2020 10:33:28 +0000
Received: from elvis.franken.de ([193.175.24.41])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmDpc-0006l8-Nb; Mon, 07 Dec 2020 10:33:25 +0000
Received: from uucp (helo=alpha)
 by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
 id 1kmDpT-00058D-00; Mon, 07 Dec 2020 11:33:15 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
 id A2790C02EA; Mon,  7 Dec 2020 11:32:21 +0100 (CET)
Date: Mon, 7 Dec 2020 11:32:21 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Alexander Dahl <post@lespocky.de>
Subject: Re: [PATCH v8 5/5] MIPS: DTS: img: Fix schema warnings for pwm-leds
Message-ID: <20201207103221.GA15686@alpha.franken.de>
References: <20201128215353.3991-1-post@lespocky.de>
 <20201128215353.3991-6-post@lespocky.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201128215353.3991-6-post@lespocky.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_053324_889172_832AEE40 
X-CRM114-Status: GOOD (  15.41  )
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
Cc: devicetree@vger.kernel.org, James Hartley <james.hartley@sondrel.com>,
 Alexander Dahl <ada@thorsis.com>, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Rahul Bedarkar <rahulbedarkar89@gmail.com>, linux-amlogic@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-leds@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sat, Nov 28, 2020 at 10:53:53PM +0100, Alexander Dahl wrote:
> The node names for devices using the pwm-leds driver follow a certain
> naming scheme (now).  Parent node name is not enforced, but recommended
> by DT project.
> 
> Signed-off-by: Alexander Dahl <post@lespocky.de>
> ---
> 
> Notes:
>     v7 -> v8:
>       * rebased on v5.10-rc1
>     
>     v6 -> v7:
>       * added another explaining sentence to commit message
>     
>     v6:
>       * added this patch to series
> 
>  arch/mips/boot/dts/img/pistachio_marduk.dts | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
