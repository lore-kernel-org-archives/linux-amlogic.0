Return-Path: <SRS0=nSb1=BA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F111C433DF
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Jul 2020 21:21:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D20A820729
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Jul 2020 21:21:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XS96cfM7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="hF/wP2Wh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D20A820729
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:Message-Id:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9FpA+WYFjoVhEk7mlHqzQGo7OC2ULK2ytE5B3gmNsjE=; b=XS96cfM7GWThfNnpXCiXXZHeo
	KluEPeOveP1BT3q2jEtGx0OPxX38jZIxXpL5BHrG3OEih4mScMDHartnT1pNP1vRXoYpb3L65iyxh
	0umZ+0gshSkx2RV841SjJvY+4QM/2UJJovDfTpsbUM7rp2LbrZmZzy6PDL5W35IhyZ8ECnZvITCE2
	v0MyTsirza/okc02sYzWuAAI0rH03JIsnQsI0jEBinlSdLOVfCbmLQi9eqkSvmNXLKSFaPZw5nZ3/
	gUR5l05hpA317SviTkPKzdqb2LVW4mnfpITFlFsABBDUMuY1sFDl69NZp5NT75w1U5G6y9D1Y0Y/e
	GiCMwXYJg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxzha-0004QJ-AP; Tue, 21 Jul 2020 21:21:30 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxzhW-0004OY-4T
 for linux-amlogic@lists.infradead.org; Tue, 21 Jul 2020 21:21:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595366485;
 bh=aOW7np1RXiqkccGVCCNm+POYtqbNm3/VXSjVs702sPM=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:Cc:From;
 b=hF/wP2WheaygASMc3NvHXsCVqu54wUkvOIPyYxShVjC9CVGRCSGBNzBgPRWhoN3bC
 4OTk2+H+tYpxZz2B9RJYfkY/0UGaosmRgXzMo3abltT01RptDv2QyrXY7VyqvmX18X
 FCnnpWmO8+/UQ3GOHw/V0UyQk6CQXksxeA26bkKU=
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/3] GPU DVFS for Meson GXBB/GXL/GXM/G12A/G12B/SM1
From: patchwork-bot+linux-amlogic@kernel.org
Message-Id: <159536648505.12155.17662311421546124867.git-patchwork-notify@kernel.org>
Date: Tue, 21 Jul 2020 21:21:25 +0000
References: <20200719173213.639540-1-martin.blumenstingl@googlemail.com>
In-Reply-To: <20200719173213.639540-1-martin.blumenstingl@googlemail.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_172126_285790_6A016B8A 
X-CRM114-Status: UNSURE (   6.24  )
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
Cc: linux-amlogic@lists.infradead.org, khilman@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hello:

This series was applied to khilman/linux-amlogic.git (refs/heads/for-next).

On Sun, 19 Jul 2020 19:32:10 +0200 you wrote:
> Now that we have GPU DVFS support in lima [0] (in Linux 5.7) and
> panfrost we can make it work on Amlogic SoCs.
> 
> I decided to remove code duplication for the Mali-450 GPU on GXBB and
> GXL so it will be easier to maintain this. This refactoring is part of
> patch #1. Patches #2 (GXM) and #3 (G12A, G12B, SM1) are straight
> forward; it replaces the hardcoded clock settings with the the GPU OPP
> table.
> 
> [...]


Here is a summary with links:
  - [v2,1/3] arm64: dts: amlogic: meson-gx: add the Mali-450 OPP table and use DVFS
    https://git.kernel.org/khilman/linux-amlogic/c/46ffadc7e658277d7559899d7f641f14a3cfae8c
  - [v2,2/3] arm64: dts: amlogic: meson-gxm: add the Mali OPP table and use DVFS
    https://git.kernel.org/khilman/linux-amlogic/c/8f16cfabbc0a6c52b114eca2ff8e95bb07949741
  - [v2,3/3] arm64: dts: amlogic: meson-g12: add the Mali OPP table and use DVFS
    https://git.kernel.org/khilman/linux-amlogic/c/916a0edc43f03f86b13fbc9943e5dc936671ea6e

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
