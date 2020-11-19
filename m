Return-Path: <SRS0=1amn=EZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 727DFC2D0E4
	for <linux-amlogic@archiver.kernel.org>; Thu, 19 Nov 2020 10:21:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E825924698
	for <linux-amlogic@archiver.kernel.org>; Thu, 19 Nov 2020 10:20:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="M60nS/hm";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="aOcHDQup"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E825924698
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HCIC2yqjZOIqSQ5gOCzyvDckOELZE7R+Gq9Uw7HsGRc=; b=M60nS/hmlt397Khl4LtsejzG/
	xAdYZZPLxL94/O3z4KtnRzlW7WonThKYaVssg7WwHWMHahbXHWuTmQEjoTwrdY+lO/6kl5F1jgI28
	TBSvqxmUJ+SFivAOQbiqqPRAEEpck/+NixudqCouQYuFSdR34+zaFEWH3oJgQ+7WiKQ9AUm8gi8BJ
	f54tIwuJixF/KcNkf12fNpVXG6IzyWIklxBzC0frXi1QA8cUXJTGdNGabcUP9ltrhkSw6heofBotx
	HLP6DjhckizLENiEXM4ujvJCj7zooeeDT3btm/I6nKC5ylYvL4/hm+IvolForrvRl7Ujs1I3HUHks
	Mr+HNobUQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfh3c-000791-Of; Thu, 19 Nov 2020 10:20:52 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfh3Z-000782-Ma; Thu, 19 Nov 2020 10:20:50 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B457A24698;
 Thu, 19 Nov 2020 10:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605781246;
 bh=ehcYypQuHzkF5BBv0v8MHkj6WiebOTftlrc66yRCup8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=aOcHDQupECII/OPF1ZL97joCf5UAJW1nxgbLLnjhMpeewNP59EcUgNH31uCt5Jlbj
 R/BzklO4l86Zii9GwTGFGPFrapVYBlYHRrZuqvtN0Bw+she5+i7wkSAn+Fqeru4o35
 daNhqKAPZVA+pQddvIgsaNYfW29MhZHbi6+JZVcY=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94)
 (envelope-from <maz@kernel.org>)
 id 1kfh3P-00Bv0R-EZ; Thu, 19 Nov 2020 10:20:39 +0000
MIME-Version: 1.0
Date: Thu, 19 Nov 2020 10:20:39 +0000
From: Marc Zyngier <maz@kernel.org>
To: Guillaume Tucker <guillaume.tucker@collabora.com>, Neil Armstrong
 <narmstrong@baylibre.com>
Subject: Re: next/master bisection: baseline.dmesg.emerg on meson-gxbb-p200
In-Reply-To: <a0bec7c4-9bec-8858-4879-52f4688d9992@collabora.com>
References: <5fb5e094.1c69fb81.a2014.2e62@mx.google.com>
 <a0bec7c4-9bec-8858-4879-52f4688d9992@collabora.com>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <630e00e83cdd07ee5a0eaba9d3479554@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: guillaume.tucker@collabora.com, narmstrong@baylibre.com,
 kernelci-results@groups.io, khilman@baylibre.com, jbrunet@baylibre.com,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 martin.blumenstingl@googlemail.com, airlied@linux.ie, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_052049_926669_942C1223 
X-CRM114-Status: GOOD (  13.42  )
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
Cc: kernelci-results@groups.io,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 2020-11-19 08:50, Guillaume Tucker wrote:
> Please see the automated bisection report below about some kernel
> errors on meson-gxbb-p200.
> 
> Reports aren't automatically sent to the public while we're
> trialing new bisection features on kernelci.org, however this one
> looks valid.
> 
> The bisection started with next-20201118 but the errors are still
> present in next-20201119.  Details for this regression:
> 
>   https://kernelci.org/test/case/id/5fb6196bfd0127fd68d8d902/
> 
> The first error is:
> 
>   [   14.757489] Internal error: synchronous external abort: 96000210
> [#1] PREEMPT SMP

Looks like yet another clock ordering setup. I guess different Amlogic
platforms have slightly different ordering requirements.

Neil, do you have any idea of which platform requires which ordering?
The variability in DT and platforms is pretty difficult to follow (and
I don't think I have such board around).

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
