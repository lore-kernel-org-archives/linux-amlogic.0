Return-Path: <SRS0=lPQy=S4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05070C43218
	for <linux-amlogic@archiver.kernel.org>; Fri, 26 Apr 2019 17:59:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD99020656
	for <linux-amlogic@archiver.kernel.org>; Fri, 26 Apr 2019 17:59:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KtVsHK6b";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mcnijnug"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD99020656
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:To:Subject:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SUvGHIvxyzF/d2bUhcbv0+CQar+F1M+x8rU53yJOChM=; b=KtVsHK6bIhhsYN
	j2HCxTRYcqZBmOrQ6HvTPOVbR4nJtpDSzjB3UoqWE15mXHd51fZHTEk66bPd95ScoGZ/2bfZFqf5+
	Xl6sjIwasTYr5IKRxwXcxH0i1P7QsmfoDYANTc/A3Is7UhYw6VWIjPtqG+ONVQOoUjCK8tsOkg7Ds
	U169nse1pi8Ci6qrGymZjbL7hRWGbdNssdpa4yRoh2g5iGRKToz3/+JN+adi4eFfcx9iAbAp61Ltp
	g5nPdlM3lF4w82f98KjwsXLB2KbxZwr0PvnCtVNkVMxh2tsuSQ/R9w6I2yY6H4TXdmt5JjKcmUP1G
	KchFUj3eMcaaOr5vVdiA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hK588-00061X-Qa; Fri, 26 Apr 2019 17:59:24 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hK586-0005wE-Oy
 for linux-amlogic@lists.infradead.org; Fri, 26 Apr 2019 17:59:24 +0000
Received: from localhost (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2EB5820656;
 Fri, 26 Apr 2019 17:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556301562;
 bh=WPqUM+UaEShzVMvhHbJHT5wITvv+kGG1zCztVTcp71c=;
 h=In-Reply-To:References:Cc:From:Subject:To:Date:From;
 b=Mcnijnug/BwvI1i9G2TKtWIIwUacj/hSComeEk18dJXoPKk+xjuQH/ILvEChs5/hi
 /DR6GeUpD3jy5i0WiRBSat7hKkvBCKh6eYqKgtS9K7OFbYqImhGk2WZcob+NaN0K04
 PuHK4NvSe2GLZ/ijOpXbDws9jaWOdvGtsRS0RD7w=
MIME-Version: 1.0
In-Reply-To: <20190426152626.GD19559@ulmo>
References: <20190425181447.60726-1-sboyd@kernel.org>
 <20190426152626.GD19559@ulmo>
From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] clk: Remove CLK_IS_BASIC clk flag
To: Thierry Reding <thierry.reding@gmail.com>
Message-ID: <155630156131.15276.5014003885761074101@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date: Fri, 26 Apr 2019 10:59:21 -0700
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190426_105922_829930_3FA33C8A 
X-CRM114-Status: GOOD (  14.96  )
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
Cc: linux-pwm@vger.kernel.org, James Hogan <jhogan@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, linux-mips@vger.kernel.org,
 Tero Kristo <t-kristo@ti.com>, Paul Burton <paul.burton@mips.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Quoting Thierry Reding (2019-04-26 08:26:26)
> On Thu, Apr 25, 2019 at 11:14:47AM -0700, Stephen Boyd wrote:
> [...]
> > base-commit: 9e98c678c2d6ae3a17cb2de55d17f69dddaa231b
> > prerequisite-patch-id: 6196ca807a15f9f4a67d5e6b8668b4f13442ac15
> > prerequisite-patch-id: 9532946d1be40c2b20af0591ac4636a4cf3b14dd
> > prerequisite-patch-id: 4e4a9591f5a4ac0d5a72e694da8fdae8c8dda352
> > prerequisite-patch-id: bcd75306e64ff866989a978127f6b16f7575d0d3
> 
> Just curious: what are these? I mean, I have a pretty good guess what
> these are, but how do you use them?
> 

I'm generating patches with git format-patch --base=<commit>. This chain
shows that the base commit is v5.1-rc1, i.e. 9e98c678c2d6 ("Linux
5.1-rc1") and then that there are four patches applied on top of that
commit that have these patch ids. If you were to pass the patches from
the mailing list through 'git patch-id' you would see these patch ids.
Or if I had pushed the patches out to linux-next I suppose I could have
generated with a --base argument pointing to the tip of a 'clk-ti'
branch.

For example, the first patch-id is essentially
https://lkml.kernel.org/r/1554365467-1325-2-git-send-email-t-kristo@ti.com
piped to 'git patch-id'. When I do that I get 

6196ca807a15f9f4a67d5e6b8668b4f13442ac15 0000000000000000000000000000000000000000

and when I do that to the patch I've applied locally I get:

$ git show b88b5b7182b0 | git patch-id
6196ca807a15f9f4a67d5e6b8668b4f13442ac15 b88b5b7182b07ebdc1ab692b4fc6a10abfff208d

I think there may be a typo in the docs or a bug in git though, because
when I pass that same patch to 'git patch-id --stable' it produces
another patch-id.

4cf9f89ca61d8002df1494b48fac618c66f6220d 0000000000000000000000000000000000000000

Caption: Something is wrong...

Either way, I'm not really using this so far but I figure it's useful if
robots want to pick up on this and have a patch-id database for changes
they've downloaded and tested from the list to figure out where to apply
patches. I'd like to use it to do something similar so I can properly
apply patches from the list onto the correct base commit and merge it
all up. That's a little ways off though because I've yet to start
working on a tool to do full on patch management via mailing lists.
Also, I haven't seen anyone else using this git feature yet. Maybe I
should add some hints in submitting-patches?


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
