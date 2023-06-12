Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C87A1C7EE2F
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Jun 2023 18:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QC0Xm77syqZoiec5YRQw3z7+hLW+zu2eBVOFEtyPCpg=; b=0prQZV3JD11NxE
	AmQmr+0XUVwOQ2pz9q3QaRIx7IHLxA8VCHrcH92T2aBwrDDzZVKG8CQ8t0AkqnZMtImoi8IlneYD+
	bzT2FBcVEMsR3I0Oe6aD+f6gEAzB+taeNmvCGAvlQbUPLXo7RHM+Sx2SIhhyWj2tM+FtmWYHSjns7
	BmVj4qsbl74Id806fBg4FLwEgZ3n1BnJZ/L+V8zaB3OpVx6kW3RJoGTf0o3vftOjq1MQNb4fhXGof
	G+8/3KgpceMYJUeA0hJHCdu2QzuKbngsXdWBLVk/Nzy38/RCSLTgIw6QGA11/rbc2/SD5MRYY9mKA
	Y/JAV1tvLz69XWTbxQXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8mC7-004vLv-2E;
	Mon, 12 Jun 2023 18:23:11 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8mC4-004vJr-1U
	for linux-amlogic@lists.infradead.org;
	Mon, 12 Jun 2023 18:23:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0AE256232A;
	Mon, 12 Jun 2023 18:23:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64005C4339E;
	Mon, 12 Jun 2023 18:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686594186;
	bh=WyvhCdaTbuSl+hj8YxIif3NWK70yovwmlYcBoHz6jNc=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=ExeIaOqg7ko8a2XqHAudSRpTI1/nXrGu/iBGKg88j9AGEoNvuOIAUkPfc5y8sMlt1
	 0h06+QuIY4nMmMBxtBXpkLRj4+gtVWoDTH7B56GWzUmbfJ6X34kfXoqxPjaKzPxSKH
	 4io3wwz7oRen5Uuw1/2pZsEmaNtP0jz94hkZqBJRE2SfLh2ZZwo7ufxyqA2iIWm52s
	 TOY5fldy9sMEYfRuUlVOJqDSGhZkYtSnXOk9o+dFS0m/NOwLc+U0OykdoWJL6VQcbN
	 lLne28FCD4BBZ6p2/YT4dEm1oYR/V749xJ2A9LMPI1jDVMkwt5TNcjTjWgoQaXjeZI
	 fg3szMZGxBw2A==
Message-ID: <9a3239dc68473e8f7145e6036e3a4298.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <1j1qik7lrg.fsf@starbuckisacylon.baylibre.com>
References: <1j1qik7lrg.fsf@starbuckisacylon.baylibre.com>
Subject: Re: [GIT PULL]: clk: meson: amlogic updates for v6.5
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, AML <linux-amlogic@lists.infradead.org>, Kevin Hilman <khilman@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 12 Jun 2023 11:23:04 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230612_112308_569433_095C5834 
X-CRM114-Status: UNSURE (   8.75  )
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

Quoting Jerome Brunet (2023-06-09 07:25:30)
> Hi Stephen,
> 
> Here are the amlogic clock updates for v6.5
> Please pull
> 
> Cheers
> Jerome
> 
> The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:
> 
>   Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)
> 
> are available in the Git repository at:
> 
>   https://github.com/BayLibre/clk-meson.git tags/clk-meson-v6.5-1
> 
> for you to fetch changes up to 84af914404dbc01f388c440cac72428784b8a161:
> 
>   clk: meson: a1: add Amlogic A1 Peripherals clock controller driver (2023-05-30 17:53:09 +0200)
> 
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
