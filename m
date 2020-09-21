Return-Path: <SRS0=01f4=C6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10CECC4727D
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Sep 2020 21:53:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3668C23A60
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Sep 2020 21:53:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iTCje3Q0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3668C23A60
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hvYRCycpzGyvU/FTo7wn00fLFEheM9PMUqFiIj4xyb4=; b=iTCje3Q0fEeT9kfaZ3iPR9WV1
	wNAOOAWHZZJa6pYjyNDlDaP5sRp/RP53gJldQj8nCq4IB9StVrloeH+P4k0wC1J8U5wUuvlqiEq9i
	LFQ+hHvnav4ujKAMJXC2C0GhrsIsDNQvL6KGP7oW7zeqYQltgGvUsOj98XfqJs3h8471Zk/Hv4fpO
	lXeagl2Rv8RU0EhrDJOQZqV+IhR9u2m1RoSRw4sDdKlwq8ZKHcWQ7Pt8MiDn17NqIvGBGZrB0OZSD
	5UetaROkgLdN5S+Y/4dZ+0N0M9vgy8ByPEFJCJcIwn29Tka3p6IJfjqjGho18VYXFQMKU81FbMskC
	qKlOieceQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKTkd-0005Z6-Sx; Mon, 21 Sep 2020 21:53:35 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKTkb-0005Y7-M2; Mon, 21 Sep 2020 21:53:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 99CAC147A;
 Mon, 21 Sep 2020 14:53:25 -0700 (PDT)
Received: from [10.57.50.108] (unknown [10.57.50.108])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CBDDA3F73B;
 Mon, 21 Sep 2020 14:53:23 -0700 (PDT)
Subject: Re: [PATCH 1/3] iommu/io-pgtable-arm: Support coherency for Mali LPAE
To: Will Deacon <will@kernel.org>
References: <cover.1600213517.git.robin.murphy@arm.com>
 <d2a3ddb17b3270e268e2f1adf7682ea938823941.1600213517.git.robin.murphy@arm.com>
 <20200921175717.GF3141@willie-the-truck>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <71cc6c53-7bd1-da1a-05fa-8172510b33d8@arm.com>
Date: Mon, 21 Sep 2020 22:53:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <20200921175717.GF3141@willie-the-truck>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200921_175334_114410_1CBE0B98 
X-CRM114-Status: GOOD (  19.06  )
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
Cc: robh@kernel.org, tomeu.vizoso@collabora.com, narmstrong@baylibre.com,
 khilman@baylibre.com, dri-devel@lists.freedesktop.org, steven.price@arm.com,
 iommu@lists.linux-foundation.org, alyssa.rosenzweig@collabora.com,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 jbrunet@baylibre.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 2020-09-21 18:57, Will Deacon wrote:
> On Wed, Sep 16, 2020 at 12:51:05AM +0100, Robin Murphy wrote:
>> Midgard GPUs have ACE-Lite master interfaces which allows systems to
>> integrate them in an I/O-coherent manner. It seems that from the GPU's
>> viewpoint, the rest of the system is its outer shareable domain, and so
>> even when snoop signals are wired up, they are only emitted for outer
>> shareable accesses. As such, setting the TTBR_SHARE_OUTER bit does
>> indeed get coherent pagetable walks working nicely for the coherent
>> T620 in the Arm Juno SoC.
> 
> I can't help but think some of this commentary deserves to be in the code
> as well.

Sure, if you want.

> Do you know if this sort of thing is done for other SoCs too, or is this
> just a Juno quirk?

Yup, this is a "Midgard working as designed" thing. Juno is the coherent 
example I have to hand, but off the top of my head I believe some of the 
Exynos SoCs can also use their GPUs coherently if a switch is flipped in 
the interconnect to change routing between the CCI and a direct-to-RAM 
path; I expect there are probably further Midgard examples that I'm not 
aware of. Then there are definitely coherent Bifrost GPUs like the 
Amlogic S922/A311 that prompted me to revive this patch, which we 
currently drive in "Legacy" mode and thus behave the same way as Midgard 
(Bifrost's "AArch64" mode realigns Ish and Osh with the rest of the 
system, and instead invents a new "Internal Shareable" value in between 
Nsh and Ish to represent the shareability between cores within the GPU 
for which Midgard hijacked Ish).

Robin.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
