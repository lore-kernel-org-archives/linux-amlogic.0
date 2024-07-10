Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26C40C3DA42
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Jul 2024 19:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=avr/lPj9nvsIgPeC1KwW5mQsbVQtcpiknHbOWGQX96Y=; b=ypMVadaHltgus4
	VIIII74WjztQhxZDQxGMaj9DbJMjfp6NRhmsehe88yIgk97W2MKzz7jPbW9Kp7Ixcbk4EjtN8KPvY
	GSk2iFgcTBfUUlp6MifvW1XDYYFCwCPcgtHwDPD4y4dRPq7thjKY2fn4SdPxS6TG5BcMMDkAsCq7k
	/jexuv5E5uHVro04FWYdYD8CESl2T74DueF6DsNoAFVqg3EJcAtONC6n7J5VR34c53u46O2OvV43t
	mO5EdAhmQBqwQ2MgFi9UlYVW+eCHmGYI8svw9Oy/2S/vkeJEFk5rsUGM6EQ0f6Ah1tPmKIsrgzZNx
	pWuYAMiMB1gwmFGFCu9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRdI8-0000000BZjn-1jGe;
	Wed, 10 Jul 2024 19:47:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRdI5-0000000BZjE-3Igo;
	Wed, 10 Jul 2024 19:47:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E02E761A47;
	Wed, 10 Jul 2024 19:47:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F70EC32781;
	Wed, 10 Jul 2024 19:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720640868;
	bh=UuJMlch6WraU5bI9HL7iYn7FKqFuRq32/WSvkM0/YRU=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=kRrlAxsg/ofRQNnJkliK4cbH50GLBLqqkzChA0cmrQglOc2GBRPVh9DhWtAbiFIjR
	 svKrNUmyoVeyuHeOxl2FvxVMkGfkojVL5El+Kj3HCaELlZZxCBvrUApB++1iA9sagy
	 SdqVbDTvCXM7bRb58V4IikN0rGjVZnP70IvFOiKQVOSBwCcORWU94A/mEdxyOiGPYn
	 3EQZx7DrCTp/MrWn7fx2V7qTqOKU4VNkbxyNXvcoFmH0lVAq9z7fmm2aYYPCFZXPPw
	 TXWONDFVZwpkeU0y7l0Lz7TMFtDbu/fvjnDaJ8xDIBHCWzXUndFqnNykZNlTf4crAN
	 flcWmNkmoDNHA==
Message-ID: <cc91609f78905a8c5d5bf28590a1a23b.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240703-clk-const-regmap-v1-9-7d15a0671d6f@gmail.com>
References: <20240703-clk-const-regmap-v1-0-7d15a0671d6f@gmail.com> <20240703-clk-const-regmap-v1-9-7d15a0671d6f@gmail.com>
Subject: Re: [PATCH 09/10] clk: sunxi-ng r40: Constify struct regmap_config
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-sunxi@lists.linux.dev, Javier Carrasco <javier.carrasco.cruz@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Javier Carrasco <javier.carrasco.cruz@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Michael Turquette <mturquette@baylibre.com>, Michal Simek <michal.simek@amd.com>, Neil Armstrong <neil.armstrong@linaro.org>, Samuel Holland <samuel@sholland.org>, Vladimir Zapolskiy <vz@mleia.com>
Date: Wed, 10 Jul 2024 12:47:46 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_124749_915411_130D2197 
X-CRM114-Status: UNSURE (   6.41  )
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

Quoting Javier Carrasco (2024-07-03 02:50:22)
> `sun8i_r40_ccu_regmap_config` is not modified and can be declared as
> const to move its data to a read-only section.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> ---

Applied to clk-next

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
