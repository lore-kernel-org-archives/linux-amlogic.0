Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4DEDC54ED1
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 May 2025 22:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BFzHpGrQX8v3XOCrkq8ra2z2B88qD/HZ7YMMmAx2hUk=; b=wxfII9QRAbvxbB
	zn6fKQwSwNRJq2/2liG861Mfkj4D/2EGHKhFfw+qsZWccR+6C+s94LNFp5D1Jks4MvU1rGk4qKWI/
	2aWFDy29Q/M62dLugRwIdbzGKKR/VSEFTfQNHzqm6+Ek9uSOn01tRoUwhzRDzbcfehx4B2MygM2Ch
	8S6loelmoRmtXqgcowGSOIdAD6oSDUDkgF0KLT/MYCYQZlx4Uj8+LvIXq3SLTwyaPUL2LmBfXpTec
	+T/PMn4Zft80wPJa1aRZkNlPgFWtGJAdL6Z/2BEeRm6hJHaTAnl94a1fVpzMXJQV59rXwdeXS76N+
	6YB3m+AAGTQiiq3+B/6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIEhC-00000002Jz6-35qV;
	Thu, 22 May 2025 22:47:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIEhB-00000002Jz0-0gzI
	for linux-amlogic@lists.infradead.org;
	Thu, 22 May 2025 22:47:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5E9ED62A53;
	Thu, 22 May 2025 22:47:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00507C4CEE4;
	Thu, 22 May 2025 22:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747954044;
	bh=Nwm7dVrVcwQecgIp7pe2hz9KIDsJNlfePEB5EQevxY0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=iXfRMcLnf0+6WqivvZPkWndHBUeYYkXjWHNlkOnA+NcHtSrPKOegdJXby5DZEqYj1
	 OdvrkdJBwt1UBbBE/HYyUnse3WpRTAclaHHHFpdzXzLg2CBaYhLcS+VjXty0/KPfdD
	 5HoewbHjS7pJ+7f+Yl1bg2HO/EpiUwE7nPCEiKp75zELzIeVgr9ttxP3apMXMoE3o7
	 30urYOuG/B46c92vAPOaKM6CquImK4x4VPpOidTpfbRFseBVd/bhSBJ2TPY62PG5MH
	 uY2SB3xWS3QvIfrbSXKiFiroWu7dlOvdRyoWAl0K1IsLtaV0PrlkOtDDQTchlNQRQw
	 cnmyJ8WLOdASQ==
Message-ID: <d8301387c508bbcf3be03faf7d3fd777@kernel.org>
MIME-Version: 1.0
In-Reply-To: <1j4ixmxbse.fsf@starbuckisacylon.baylibre.com>
References: <1j4ixmxbse.fsf@starbuckisacylon.baylibre.com>
Subject: Re: [GIT PULL] clk: meson: amlogic updates for v6.16
From: Stephen Boyd <sboyd@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, linux-clk <linux-clk@vger.kernel.org>, linux-amlogic <linux-amlogic@lists.infradead.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 22 May 2025 15:47:21 -0700
User-Agent: alot/0.12.dev8+g17a99a841c4b
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

Quoting Jerome Brunet (2025-05-15 06:07:29)
> 
> Hi Stephen,
> 
> Here are the Amlogic clock updates for v6.16, just a couple of simple fixes.
> Please pull.
> 
> Cheers
> Jerome
> 
> The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:
> 
>   Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)
> 
> are available in the Git repository at:
> 
>   https://github.com/BayLibre/clk-meson.git tags/clk-meson-v6.16-1
> 
> for you to fetch changes up to 0afce85ed26c73860bb6e99a0657e1d90d533256:
> 
>   clk: meson: Do not enable by default during compile testing (2025-05-15 14:44:50 +0200)
> 
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
