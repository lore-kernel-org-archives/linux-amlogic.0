Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CB9DC3271E
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Jul 2024 20:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IIMjgI3/27D4O7Zo9ITxEkLtBe20RxBKjrWrP81jOSA=; b=Orj6tmAVM4hO0n
	2N1xN1U7yDvw40A78/N4kdrqZO44z6XJFbuOszwowoc7wFKphQ7HgSrR45n7CJM6bbyfMKXw0nKt+
	T4lamWqWe6JMia1y2G5qUH0qiHszYiiQprI1HAGRijXlCay1WHiarHPk19fz+i7JRIPb64AZsSdCr
	OU8cwKu0gPlirflRL93rf6BnpJ7y23ETcIFmeirBGqbLkeWUp0Ny47/HNvR2Hn0AA9WI25f2AgYMa
	eXnlYiBER+WWZMw2ummxV4vvNV/r4nec978apkaIx6dMbPjWaPw7BllFkj6agdc+gICPFzKEaZ6gg
	Xk2mBjMF5nXyKmJr19Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQv2J-00000004ySy-2z3U;
	Mon, 08 Jul 2024 20:32:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQv2G-00000004ySC-26hG;
	Mon, 08 Jul 2024 20:32:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A0E7B61072;
	Mon,  8 Jul 2024 20:32:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D495C116B1;
	Mon,  8 Jul 2024 20:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720470751;
	bh=o6bbEfjjZfn+HQSX2vDZxVVpP++ERSsjFMMXPHwb5bA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=eiKpcWLCEfGFJ6LRC5eoBLHbP2zqqmeWz/IfTsZtRAMLM2qvMWY2lP2qMIRQka5gC
	 wb3X2QF8fbnKauRurzMotlMOvU74hVGOb28RtDkzvio/Xjz959K3WacjHjy9WNBMFe
	 /GMMyGGc3Ao9qfkH8g55dJfIG1ePkUO10nT21Q8MBSK3wN3WOnKXra29Fx0u0w4nYZ
	 0XP8sO4ZVMXxxys0EBbaxcmDaOl2BXwpYCvicLL6VLaWf1jQFks0w3TfsZzfkWbnWO
	 xcDfTJoWjwPeMuNKoO59ITQzh78qOjnrD+nar/ffgySAfX3mqtCEHR2oRRcjjRi/34
	 EsrHnePZm6fRA==
Message-ID: <b0c2d9ac495de65039fdaa8494b7d0f5.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240703-clk-const-regmap-v1-10-7d15a0671d6f@gmail.com>
References: <20240703-clk-const-regmap-v1-0-7d15a0671d6f@gmail.com> <20240703-clk-const-regmap-v1-10-7d15a0671d6f@gmail.com>
Subject: Re: [PATCH 10/10] clk: xilinx: Constify struct regmap_config
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-sunxi@lists.linux.dev, Javier Carrasco <javier.carrasco.cruz@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Javier Carrasco <javier.carrasco.cruz@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Michael Turquette <mturquette@baylibre.com>, Michal Simek <michal.simek@amd.com>, Neil Armstrong <neil.armstrong@linaro.org>, Samuel Holland <samuel@sholland.org>, Vladimir Zapolskiy <vz@mleia.com>
Date: Mon, 08 Jul 2024 13:32:29 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240708_133232_610529_1D7D577C 
X-CRM114-Status: UNSURE (   6.60  )
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

Quoting Javier Carrasco (2024-07-03 02:50:23)
> `vcu_settings_regmap_config` is not modified and can be declared as
> const to move its data to a read-only section.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> ---

Applied to clk-next

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
