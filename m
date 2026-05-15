Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B99ACD4851
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 May 2026 08:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fmyPR3Sq34076+vaazjKQKEM2wQqAv3vot0l53FWWNo=; b=Nc4pRmIgpakQA7
	SSa9lOjqpHxt7WansFx2xVFW6nF0kQa5b8mBq6r5uRfQQva8FxCHRSCP/LoOaTDj+6qeRJGclrdkz
	UpmBnUA8lPyszV0IhS+CAPjidMGV9BMHBVywAe0MYPanbtsVxqW7XzZJmQ6O0xlh0R7gA0ZvlF1hN
	UUSZR2i7neyPZ8JpLGjXJrlbAJbxhiPuyBJmFzBbKyirt4URkjKYqnp5F6cKY+3oNysFKzb8ELFFu
	Lts6WrhD+2/HFIhaLFZYMKI/M0aCe4qX+sLcQkN/vgO66d13fiZbUFtRZOH4i3Jwskuon/K5PuMsM
	HNPbwuqQsyl+L5jF0xoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNndR-00000007his-0Xir;
	Fri, 15 May 2026 08:11:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNndO-00000007hiJ-3ys5;
	Fri, 15 May 2026 08:11:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6868560008;
	Fri, 15 May 2026 08:11:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FC60C2BCB0;
	Fri, 15 May 2026 08:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778832662;
	bh=dY87oxcNd6Plp17E/7k3+AqTR4VAYLZgpmp+DlDQquc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Oi/UuL1LieUa7RCIK/099R2KfxRQxtNVVvuqv7V6a5QXlf4EpSLfD1Cq3yqekWzvV
	 MiCuerQyqg6H0oLcbHVMcWSy1EY7OyLnPk36DDtyosritaAITa2g60jAGanGoTZsnm
	 29ItWZFesltRiqZZVSq9a6yI1N53rkV2q+XaoH6qLbDoke9fMz4y6rCVH/R4eZnPF7
	 SVtyAkyCWBreWqIHKuhdVZbsnfZl1UfiPxj4Wd7CAJOBPK8mSFnosRKa2umf5FH2wo
	 eIuTcqaiaiXfb2xfDypx+R7RDt+XCDQ2sIRBzSWa3a6pFXQ9zJ6sRHnTKS3OaPzbpN
	 ou9iPZ8j3uohw==
Date: Fri, 15 May 2026 10:10:59 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jian Hu <jian.hu@amlogic.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, 
	Xianwei Zhao <xianwei.zhao@amlogic.com>, Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 04/10] dt-bindings: clock: Add Amlogic A9 AO clock
 controller
Message-ID: <20260515-resourceful-diligent-hound-b666e5@quoll>
References: <20260511-b4-a9_clk-v1-0-41cb4071b7c9@amlogic.com>
 <20260511-b4-a9_clk-v1-4-41cb4071b7c9@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260511-b4-a9_clk-v1-4-41cb4071b7c9@amlogic.com>
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

On Mon, May 11, 2026 at 08:47:26PM +0800, Jian Hu wrote:
> Add the Always-On clock controller dt-bindings for the Amlogic A9
> SoC family.
> 
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> ---
>  .../bindings/clock/amlogic,a9-aoclkc.yaml          | 76 ++++++++++++++++++++++
>  include/dt-bindings/clock/amlogic,a9-aoclkc.h      | 76 ++++++++++++++++++++++
>  2 files changed, 152 insertions(+)

All comments apply.

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
