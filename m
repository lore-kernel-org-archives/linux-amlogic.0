Return-Path: <SRS0=ol0a=EQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56BDDC2D0A3
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Nov 2020 02:52:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA9BE206ED
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Nov 2020 02:52:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="H/waKqN6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA9BE206ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rUmaDqZzYkWJuDfQUnPb76qt9C8p6hgkyuEPEN8ULns=; b=H/waKqN6hmMJihModLDfo+aek
	dNf8CoTyWgdhS3OYwUzsbHYkqEO43ZDK8DyJvBqB1/IxyE9BLZSRbBgYK1dw3BLyLDmSs41T5utu8
	XcLbKJ1h/HwXT+E4WwxON2VFkGo9PKPQRu6vSZEqO0QgT5WSXLPH17xlNDX8vnroafBzVWlqXjWQ7
	A6wNuKpTMKwAyvGFoO1DMBZg0376ovMbKxQ7ScuVTU8hlar7tyblCUdtPItMXUaQDT72aT4OZhHoE
	htMCfhaxk1Ewi91jh24KqIWTYoTWpcSEOQmrTmglYN5lOIf888dGoMd90zO9oxezP5KSsRAVfxkQy
	Jws9ayEYg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcJld-0002ef-BC; Tue, 10 Nov 2020 02:52:21 +0000
Received: from smtprelay0101.hostedemail.com ([216.40.44.101]
 helo=smtprelay.hostedemail.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcJla-0002du-VE; Tue, 10 Nov 2020 02:52:19 +0000
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay02.hostedemail.com (Postfix) with ESMTP id F008012CB;
 Tue, 10 Nov 2020 02:52:13 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: ink22_1714ef1272f1
X-Filterd-Recvd-Size: 2439
Received: from [192.168.0.160] (cpe-72-134-80-165.natsow.res.rr.com
 [72.134.80.165]) (Authenticated sender: joe@perches.com)
 by omf07.hostedemail.com (Postfix) with ESMTPA;
 Tue, 10 Nov 2020 02:52:09 +0000 (UTC)
Message-ID: <3c39c363690d0b46069afddc3ad09213011e5cd4.camel@perches.com>
Subject: Re: Subject: [RFC] clang tooling cleanups
From: Joe Perches <joe@perches.com>
To: trix@redhat.com, linux-kernel@vger.kernel.org, 
 clang-built-linux@googlegroups.com, cocci <cocci@systeme.lip6.fr>
Date: Mon, 09 Nov 2020 18:52:08 -0800
In-Reply-To: <20201027164255.1573301-1-trix@redhat.com>
References: <20201027164255.1573301-1-trix@redhat.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_215219_066706_069BB8BC 
X-CRM114-Status: UNSURE (   9.85  )
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
Cc: alsa-devel@alsa-project.org, linux-aspeed@lists.ozlabs.org,
 linux-iio@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-rtc@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-rdma@vger.kernel.org, qat-linux@intel.com, amd-gfx@lists.freedesktop.org,
 linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, linux-mmc@vger.kernel.org,
 tipc-discussion@lists.sourceforge.net, linux-crypto@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, 2020-10-27 at 09:42 -0700, trix@redhat.com wrote:
> This rfc will describe
> An upcoming treewide cleanup.
> How clang tooling was used to programatically do the clean up.
> Solicit opinions on how to generally use clang tooling.
> =

> The clang warning -Wextra-semi-stmt produces about 10k warnings.
> Reviewing these, a subset of semicolon after a switch looks safe to
> fix all the time.  An example problem
> =

> void foo(int a) {
> =A0=A0=A0=A0=A0switch(a) {
> =A0=A0=A0=A0=A0	       case 1:
> 	       ...
> =A0=A0=A0=A0=A0}; <--- extra semicolon
> }
> =

> Treewide, there are about 100 problems in 50 files for x86_64 allyesconfi=
g.
> These fixes will be the upcoming cleanup.

coccinelle already does some of these.

For instance: scripts/coccinelle/misc/semicolon.cocci

Perhaps some tool coordination can be done here as
coccinelle/checkpatch/clang/Lindent call all be used
to do some facet or another of these cleanup issues.




_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
