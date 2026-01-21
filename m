Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEE61D6CFB0
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 Jan 2026 01:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GDF5396DzltK/g9hdT/22UD8GGQOGBG1TuzBpJ2fflQ=; b=BOgnyuExiKuyZT
	1t/sE14momKioA4HSW2vPKRF8PD7s1eY6P0qQXzKQ8u6XRfQZkEATHzAroy+PvG7679I96Zm+4Am6
	xnBFJAlp/yBSj/swd4V/FkpNlORqPWSkBOsmeGX9TUdSzKg9WJXZj40cneUcqQis5sD5mmgjMnXeb
	2DsKqZuzdQwvHl4HbR4c5/D/FwlhvziR1qkvGkUvbkStyzkU2Li3cMEyf8egMLaajybOHg7W2JAXo
	B4tSLmySq9cVc2GUMDMFBpZe2+bIHE6Nvsl6MIfMHpNgoiFChyTLqar92guzsigdGGiGNB0gL7/ML
	sABXNrfFT3gU6udoh9Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj63A-00000007yFh-0d5G;
	Fri, 23 Jan 2026 01:33:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj638-00000007yFP-2pul
	for linux-amlogic@lists.infradead.org;
	Fri, 23 Jan 2026 01:33:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A910360018;
	Fri, 23 Jan 2026 01:33:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 542F3C116C6;
	Fri, 23 Jan 2026 01:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769132001;
	bh=PQQVLZrANJopNzNLiscot5WHRsHgjNjGnt5jA62cKYI=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=alnRdBMW+rbkID/guufqmZSo1PBMeC922pZz6BKyFGN0NBai9UCD+UqrE5d+MCLPW
	 wxroB1ns4iN9CiHZdnUGTZk7E1XWoVCiz+wFIGsqH/6WPLnVRNA1f2tsm63b0Yya7y
	 TjOxQ2f8Kb9BJdksaVKIVYLRkZz2PNHv4b24oEiK5SzfiZJHZTdn4vfzVSY69nMdwI
	 Gbz4oLa8Os/VwLuw16/UJyCgIhzIAALjUqivKhG1H1/Bo05bzA5xWZfiahSC0ANmbR
	 I1Nm0SeAatxLUyYhdfv9muw7Ufk2i6wBIVhr6r5AWjx2uvvWSSgWrhyM20xVAwcWWm
	 U8QnelgpierGQ==
MIME-Version: 1.0
In-Reply-To: <1jjyxdvq9k.fsf@starbuckisacylon.baylibre.com>
References: <1jjyxdvq9k.fsf@starbuckisacylon.baylibre.com>
Subject: Re: [GIT PULL] clk: meson: amlogic clock updates for v6.20
From: Stephen Boyd <sboyd@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, linux-clk <linux-clk@vger.kernel.org>, linux-amlogic@lists.infradead.org
To: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 21 Jan 2026 12:35:05 -0700
Message-ID: <176902410593.4027.8253899949727908188@localhost.localdomain>
User-Agent: alot/0.11
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

Quoting Jerome Brunet (2026-01-19 03:41:11)
> 
> Hi Stephen,
> 
> Here are the Amlogic clock updates for v6.20
> 
> Just fairly usual stuff this time around, a new clock controller SoC
> support, a few clocks added and some fixups. Business as usual.
> 
> Please pull
> Cheers
> 
> Jerome
> 
> The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:
> 
>   Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)
> 
> are available in the Git repository at:
> 
>   https://github.com/BayLibre/clk-meson.git tags/clk-meson-v6.20-1
> 
> for you to fetch changes up to 2fe1ef40b58c2256f4682594f48bfbd584501ec5:
> 
>   clk: meson: gxbb: use the existing HHI_HDMI_PLL_CNTL3 macro (2026-01-06 09:52:21 +0100)
> 
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
