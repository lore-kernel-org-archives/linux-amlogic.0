Return-Path: <SRS0=wFsb=UL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99942C31E46
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Jun 2019 23:02:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D0EA20896
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Jun 2019 23:02:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aAkxkrxb";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="NWGxbm9O"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D0EA20896
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:From:To:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sqaB9qSIwXBK7/Zr2BHq806JutpmspOYndnvGzjguX0=; b=aAkxkrxbTyd/OV
	wJrUokPehSaWWAZ8v9gIZOE0VvOq17xhy78ZLo+Q5ArnRenYNUlpwwhCjY7kjzbLFdf600Tb14EZe
	NLcDUdxAxgaZ7ocWqGNWuGYcacl5uN1UET/R2lLqvJlIoqQcqke6zwg3Iznd9GXO1lqcQUMPGLEaz
	sPG2nE9sd6kKGIUglCxBgvqY9NV8A2yyAYzENjURxN6qDzWCHaLUyOoBEecVl3g98ssgUwm9AbNXD
	fLKN608aqG20QNLrzuFNDKDTnnqXmW+1AGJtA6FaK4ON3aExNNBJlu2EkeoswR4eZr21GlH3jZcxy
	JnH2DostX4gfrPnykgIw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hbCFo-00006m-7O; Wed, 12 Jun 2019 23:02:04 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hbCFm-00006Q-Aa
 for linux-amlogic@lists.infradead.org; Wed, 12 Jun 2019 23:02:03 +0000
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3692F20896;
 Wed, 12 Jun 2019 23:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560380521;
 bh=+tsGRqVHjeMRxsoBEL+dBhG2hHJk5zEZ/qrS5yPoAuc=;
 h=In-Reply-To:References:To:From:Cc:Subject:Date:From;
 b=NWGxbm9OnP2Jw3us2CHmadnvpCXRaGa3/QohdvbyGHjdaV8G8tSOlnesslaFSK2Zo
 8gpdUppUf16bSiZPYswEgH6kSoImMPPQZ6jxzxLsSLgs/fGgzwj6sodPHq/x6L+y/A
 aqiW2dPzdE1elJI/Bo0mP9EJHRl0p7O+ltL0uw1A=
MIME-Version: 1.0
In-Reply-To: <a834836da8de689ec541093f3226a853af001fe4.camel@baylibre.com>
References: <a834836da8de689ec541093f3226a853af001fe4.camel@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>
From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [GIT PULL] clk: meson: fixes for v5.2
User-Agent: alot/0.8.1
Date: Wed, 12 Jun 2019 16:02:00 -0700
Message-Id: <20190612230201.3692F20896@mail.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190612_160202_389690_063A4EB7 
X-CRM114-Status: UNSURE (   8.99  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, linux-clk <linux-clk@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Quoting Jerome Brunet (2019-06-11 05:23:33)
> Dear clock maintainers,
> 
> Below is a request to pull a couple of fixes on Amlogic clocks for v5.2
> These are typos in recently added clocks, the most annoying one being in
> the DT binding identifier on the MPLL50M which is used by the network PLL.
> 
> Regards
> 
> The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:
> 
>   Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)
> 
> are available in the Git repository at:
> 
>   git://github.com/BayLibre/clk-meson.git tags/clk-meson-5.2-1-fixes
> 
> for you to fetch changes up to 3ff46efbcd90d3d469de8eddaf03d12293aaa50c:
> 
>   clk: meson: meson8b: fix a typo in the VPU parent names array variable (2019-05-20 12:11:08 +0200)
> 
> ----------------------------------------------------------------

Thanks. Pulled into clk-next.


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
