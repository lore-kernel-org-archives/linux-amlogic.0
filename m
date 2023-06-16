Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F369EB64D7
	for <linux-amlogic@archiver.kernel.org>; Fri, 16 Jun 2023 18:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RQIPJDgVy0qVnCrrkkqZoVoRXE6zXnv4vLKla3XYsVI=; b=dvxoX/xisNggYc
	ZdfPo9sk6AgfAJuGMPm/JqdKXgmKe7cOoC71UHhSQ62g8fuRDLNXTQV2R1vaGJqb4msNU7E4j4hvV
	9EAIsWuxWZmQE/KLDyWm7g/JC5QRDteipZI2DSX5eWYuuHsiucFSt615vDuZYgaop45uzbaQmRN1y
	nIbf6iRGHtmwKuh440kQEEer2ws7f0EgTNJ3vhIyWn2xv6oaI2XvjOrHswiTGhQ6UV5sH2w6EUAVW
	I//kt83QqCQ2tq3YLTC185U77mRUwvy4EjjDLJlprCa5ap/woeuH498NrRl3qhnMj10pfLYmvZ0w+
	2HUHIG/QN2Inpqru/VKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qAEHw-001RqX-0H;
	Fri, 16 Jun 2023 18:35:12 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qAEHt-001Rpx-3A
	for linux-amlogic@lists.infradead.org;
	Fri, 16 Jun 2023 18:35:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8005C62255;
	Fri, 16 Jun 2023 18:35:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5230C433C8;
	Fri, 16 Jun 2023 18:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686940508;
	bh=XhGznc+ckcK6geKVM5HRvsYol/5FbCOc9jOxs3bkwhA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=OZh2I3buW2ZCQvkIIyEKYn+JlXwziA+h2XD1nemUkzKL7nikQvJrzBA1KBZGS0Qy0
	 NlYuahgub5DZ3Dt64xX10gh2eFOG7zWinuAMABP2BlCCTfsSlGO9ZFFOyNMq56ZviZ
	 l4P68yr4YvAthSVT5ZZ8vW1d9ymCS8ZNtN4TuE7FbS0y9vTXUf/6j4SpH10UbhXk4j
	 kUEG3etGDdbbxumyijcq1vtpSR2QEVH5l+1F+F8446cDpBAjeoffXaHjyYybnPzMY6
	 lT7T6eOfHUbY2cs6acVuJ7i6jzOUU+CqWJdmdrP4KbcJioGHuc2tipRxd/t3kJlZtq
	 lEYJYaVuqgxIA==
Message-ID: <a96d2c1aad1e71918cef9f89ccab8ef4.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <1j352s39qe.fsf@starbuckisacylon.baylibre.com>
References: <1j352s39qe.fsf@starbuckisacylon.baylibre.com>
Subject: Re: [GIT PULL] clk: meson: 2nd round of amlogic updates for v6.5
From: Stephen Boyd <sboyd@kernel.org>
Cc: Kevin Hilman <khilman@baylibre.com>, linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org
To: Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 16 Jun 2023 11:35:06 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230616_113510_061361_5A8B575F 
X-CRM114-Status: UNSURE (   8.77  )
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

Quoting Jerome Brunet (2023-06-15 10:34:31)
> 
> Hi Stephen,
> 
> Here is a 2nd round of updates for the amlogic clocks.
> It fixes a few problems with a1 SoC support that was part of the first
> merge request.
> 
> Please pull.
> 
> Thx
> Cheers
> 
> The following changes since commit e13dd04a242cc8c064b9af8cde38b8e9a548cf81:
> 
>   clk: meson: a1: Staticize rtc clk (2023-06-12 14:29:24 -0700)
> 
> are available in the Git repository at:
> 
>   https://github.com/BayLibre/clk-meson.git tags/clk-meson-v6.5-2
> 
> for you to fetch changes up to 35944dc68e67ab0c105939b83d20a04bd16f4968:
> 
>   MAINTAINERS: repair pattern in ARM/Amlogic Meson SoC CLOCK FRAMEWORK (2023-06-15 12:31:48 +0200)
> 
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
