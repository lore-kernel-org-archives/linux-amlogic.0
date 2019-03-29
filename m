Return-Path: <SRS0=wRYZ=SA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBBFEC43381
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Mar 2019 22:44:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9E3D217F5
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Mar 2019 22:44:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BKmbx/VX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="CYiLZffA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A9E3D217F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:To:Subject:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vfcgTWqX+rXvfy/dXLxy70Ihv5FEILSCLxsSxoYT/eE=; b=BKmbx/VX+9Tppx
	O/otj9vxRJkA6BQhvxrIfk0WEjccIUwHCQwJ6UW0WTK8oTXlw+x/1P9aQ6ygAVROsXcoinT+ORqGR
	jrbIj3YueVZNuF+JvXF3NMS3bwR6zx7/Q7Y7b6eaL4QFd9hbVigftiggErkIm9UOL6GZEMtQjLmvx
	xXreYwmvlsLolw56FPa8Ns7aqt2RsG+VHhrs84PBqPDcMFpL5CDitqWe6ZuTxxfAcPSH/Y/xJZU/e
	8lGJ7FK5BrnJu6Cspe6Lbxjsdtb8xE3WoBOqWGigUqJwuyzvWHnzI1LUXbN8o94lQNt6tyDIclWCa
	D3EWXLky9TcZ9pdxdOSg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hA0Ez-0006NX-FR; Fri, 29 Mar 2019 22:44:49 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hA0Ew-0006NG-P7
 for linux-amlogic@lists.infradead.org; Fri, 29 Mar 2019 22:44:47 +0000
Received: from localhost (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 21F8E217F5;
 Fri, 29 Mar 2019 22:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1553899486;
 bh=BYv/zL2J7g4n3oAFeloCkQo1HtprwDhDhvxPLIAa02E=;
 h=In-Reply-To:References:From:Subject:Cc:To:Date:From;
 b=CYiLZffA80afx371M7mZxL8chGutlkobzIoBaRMj83ahbDdInMooQ5cZ3bSlbnpIc
 Wgh8spvwmlohbmIp6H0hJ60hr9lKxaNWw9rIO9kVi2VAFjwrB2OnQLZwfPBd1GcDhn
 3xdATUtfN+H7x/Njus8qFHateNG9BGkwxxHENW+g=
MIME-Version: 1.0
In-Reply-To: <d47276b2-73fe-3046-84d1-84d7a08b248b@baylibre.com>
References: <d47276b2-73fe-3046-84d1-84d7a08b248b@baylibre.com>
From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [GIT PULL] clk: meson: fixes for v5.1, second round
To: Michael Turquette <mturquette@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Message-ID: <155389948536.20095.9385568409537349896@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date: Fri, 29 Mar 2019 15:44:45 -0700
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190329_154446_835651_789A96D5 
X-CRM114-Status: UNSURE (   4.78  )
X-CRM114-Notice: Please train this message.
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
Cc: Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 linux-clk <linux-clk@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Quoting Neil Armstrong (2019-03-29 02:14:07)
> Dear clock maintainers,
> 
> Below is a second request to pull amlogic clock fixes for v5.1
> These changes fixes meson8b booting where a wrong PLL frequency is selected
> when updated by cpufreq, and removes an annoying warning and invalid return on
> an unconfigured vid-pll-div recalc_rate.

Thanks. Pulled into clk-fixes.


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
