Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F19ECDB47E
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Oct 2023 23:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aKW5mZO60D1YWAto2kjTFJeKaJwccAIpMFTQ64wsIFY=; b=K8srqbyOKHID2Q
	n/ysGkl3cYBmAfvzsskVF7AbYAw2nWHIYnuBtI2ozTIKy/Ts4upOdAVEQUXO/B8TUGo3XPGES3qcT
	/ONpkGzKjvjLxRo3GGBm1eOxnrspaaL2WmHuWP6BZvlku0Bm5H2BcgBCcCis2pkN+P1rIPWQ8r8so
	4tw1ccfpE5Y78Z0ISTYoaSUJu1w8x75BfZoRl1MCsKOnT4VyeaYZ8qkTED1ac5//lJ8Gv6vR8o/7X
	FE+ZHHQUzQyKoCMOVcEpXmWsDKaVqZHct9KqNFIaD9Re5mHEsC2mQ0jW+tZafptfTj8jkRb1j2enF
	SodvP+09tF8qPvluuEUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtGOY-00FyFW-2w;
	Wed, 18 Oct 2023 23:56:10 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtGOV-00FyF7-0w
	for linux-amlogic@lists.infradead.org;
	Wed, 18 Oct 2023 23:56:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 95079CE26AE;
	Wed, 18 Oct 2023 23:56:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF50AC433C7;
	Wed, 18 Oct 2023 23:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697673361;
	bh=chjIoI3/HmiaBDvhJLFWJeHklVVsHKeBC8ixad4G+40=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=ZYgnEHz6dgLYUWMMmYc7vF77k1IKzT7DuHHErwxhZTJ6bl+GKm347D1LAuT+KNcry
	 j5WocECxLtuRjBhVp3Sr5AqECHh4tneDuRS28Zt155Tgqx2mV6sjCrZ0O0sNd0ttwR
	 8kRU4Ne83oVmL5WVvAjt2uM+xC4FDucrMZFQ6m+xPZz6BJojAahSAVvQVzdKavaCXu
	 5o7hat+EoYO+6/a65mCJREiTBR0WQn8eCBaYfTY2bg2l2grFiu7NEFl5OzI/B4MRbn
	 N76ND2QaPdf2hUssflimdsoIkOSc/31qr6UxIelJAZ+K1TWPMCIeb0aRS6QsKVvQdy
	 +e15xR9kq3whQ==
Message-ID: <6ef51734c407d1bc5c91fa79e2f5207d.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <1j1qdux4rt.fsf@starbuckisacylon.baylibre.com>
References: <1j1qdux4rt.fsf@starbuckisacylon.baylibre.com>
Subject: Re: [GIT PULL]: clk: meson: amlogic clock updates for v6.7
From: Stephen Boyd <sboyd@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org
To: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 18 Oct 2023 16:55:59 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_165607_516155_A1CE7B1C 
X-CRM114-Status: UNSURE (   7.92  )
X-CRM114-Notice: Please train this message.
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

Quoting Jerome Brunet (2023-10-16 02:58:26)
> 
> Hi Stephen,
> 
> Here are the Amlogic clock updates for v6.7
> It is adding 2 clock controller drivers for the new s4 family SoC.
> 
> Cheers
> 
> Jerome
> 
> 
> The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:
> 
>   Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)
> 
> are available in the Git repository at:
> 
>   https://github.com/BayLibre/clk-meson.git tags/clk-meson-v6.7-1
> 
> for you to fetch changes up to 57b55c76aaf1ba50ecc6dcee5cd6843dc4d85239:
> 
>   clk: meson: S4: add support for Amlogic S4 SoC peripheral clock controller (2023-09-27 11:01:03 +0200)
> 
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
