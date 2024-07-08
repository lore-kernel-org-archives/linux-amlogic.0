Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61022C3271E
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Jul 2024 20:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h1f7YynpuEllrOHG3w3QT2A+amR4Sp9WPDHz1M+uPig=; b=Asf8N15bAO6tul
	tqZkLPzDbwkuiul78JZ3IFPlk0OQ9MQoXIYGi1HSKRBHLM12ZXyrKSNWW2b0AkJ+r50sG9iala1xM
	t1nWjaNcJoROB1+YRFg62wnigrwSBvEqk6Qg6goUheE6EHqZnODRA1LDIFDVijt6rGAfE2mX1F3eB
	pADt4szuZB+y9EadheyXOcWkyq8OVn3Rs5OJ6wCVYolaZ92/TA3DfJ46BgUyIDanVPpZZqoWOT9q8
	2iplgRKJ/qitP4OzUoRwMTFB8C/0/GN8uG1CoBJYTFp4pe4Zw2Wus0CMoTHSbspsg7EV3XabgpK5G
	JQr7SDmB9SdwG5iS7NlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQv2i-00000004yao-0qst;
	Mon, 08 Jul 2024 20:33:00 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQv2e-00000004yYp-1PJB;
	Mon, 08 Jul 2024 20:32:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C760CCE0B7A;
	Mon,  8 Jul 2024 20:32:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07CCFC116B1;
	Mon,  8 Jul 2024 20:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720470774;
	bh=6+dCUea6mQ/szR3n13tThGhbyNduM++Q1F0ysCdACjk=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=DMQaNt/b3lm6XqOqOzFvmzXMi0QE2NMzNX74unf5v1Rwzkz+wNGdz9rO5KlivDtBM
	 aS0YDhlNI1NvK1muhfK5+9K1XAEsmc3CdiBexhynOTBzDslmu/2Hd2rCZClB6QCF6u
	 9nLGL131B1HLm7j6ie1OQC0OBqE+3qgytUZw//D71Cd1nQvRf1cGbF4QYb+MYwJfuB
	 Q9YEBuB40Pe9RHIrq32eyvSIy6m0xp03KBVOLwfTCh8NtKwks5aT1LKWzClEQ0f3SO
	 H6wPSAqo9SRHpHNDcNMr7vFkvMFZZ6iYvGkVR4afcJAfVusTAnRl6iewO2w0OBVBL1
	 0QZDGvm7Ru/aw==
Message-ID: <ee7380278b81195fbaac652c99c29936.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240703-clk-const-regmap-v1-7-7d15a0671d6f@gmail.com>
References: <20240703-clk-const-regmap-v1-0-7d15a0671d6f@gmail.com> <20240703-clk-const-regmap-v1-7-7d15a0671d6f@gmail.com>
Subject: Re: [PATCH 07/10] clk: lpc32xx: Constify struct regmap_config
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-sunxi@lists.linux.dev, Javier Carrasco <javier.carrasco.cruz@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Javier Carrasco <javier.carrasco.cruz@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Michael Turquette <mturquette@baylibre.com>, Michal Simek <michal.simek@amd.com>, Neil Armstrong <neil.armstrong@linaro.org>, Samuel Holland <samuel@sholland.org>, Vladimir Zapolskiy <vz@mleia.com>
Date: Mon, 08 Jul 2024 13:32:51 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240708_133256_678262_0BD789C8 
X-CRM114-Status: UNSURE (   6.52  )
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

Quoting Javier Carrasco (2024-07-03 02:50:20)
> `lpc32xx_scb_regmap_config` is not modified and can be declared as const
> to move its data to a read-only section.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> ---

Applied to clk-next

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
