Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8687ECDD543
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Sep 2024 16:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xyXhmbC27ZuHSB7XBdZ/TlsjgVWwaThIi/jpu0Nij2Y=; b=TRdcO5I8M1G5cK
	ul6ZU5gWKVNtH36DC5oF4HyHcJsgQ19erG2mxCh6aLO2M6ScznyfiuU1pgVwpLnIGJ46b6LhfiOiv
	ObpB87YcQ2TjZSl7K43ln7CpTgan7B/1Cru2XXIDo0YPYdPghubXT9ml+vDJHFjGZ+0bRCTcObpsB
	XKP131eZUYxxzwLhiYQ8UNfGBn5XwL2lh0TIwTasFtNd7mlIFf72JY5nhl1rTIX6kbizMt4ey3Lky
	i00hKDAvZPpJ9jjvgbTEYxqAd3a2L53+7Foa5VPepsGefPGZgUhyhVtFLUV/IXhC2GsP4haQ+gMRT
	QivXiDFuicshAB2dlw+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqxDC-00000008aob-29QD;
	Wed, 18 Sep 2024 16:07:26 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqxD3-00000008anX-0hE4;
	Wed, 18 Sep 2024 16:07:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 70A2E5C595F;
	Wed, 18 Sep 2024 16:07:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99D3EC4CEC2;
	Wed, 18 Sep 2024 16:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726675635;
	bh=f4GGnRdF68L6ryhZKCljE5mNtRsT0dHV0PkgUPjTeKI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aUPaBZlYelVyq062EpMOR/O+y5WvAqc4z3lBeIzk++rw2Zl+IHBKFCRgMr2ZM0sTc
	 N41H1jXm9TiNGkwx28MXN2Zcmcxx5a3XqDrbEdRtWLfcUnBnAHeo3G1NXq5WiAsk3x
	 kUzgWF1yDXcU17Pe5tG5TykRtLxpLKZl9Ctcnij1gcwE0Ego9RlPJwPqFlYOGzo/Dw
	 a68AU2N8Ijyqgb569P1H7uQby9WSHP/+EQurUqVtZ3SrpW/urjkEQ0uEqVERnDuuk9
	 gLqXWFhHB7K0SgeWz+YR+uDutsw6IC/Hws+5VYzC/tQTzaUuFvkDW7PxEBPBDzdYHJ
	 lKIenJK1NpZLg==
Date: Wed, 18 Sep 2024 11:07:14 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-clk@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Chuan Liu <chuan.liu@amlogic.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] dt-bindings: clock: add Amlogic A5 SCMI clock
 controller support
Message-ID: <172667563318.1699620.6883728767588499798.robh@kernel.org>
References: <20240914-a5-clk-v1-0-5ee2c4f1b08c@amlogic.com>
 <20240914-a5-clk-v1-2-5ee2c4f1b08c@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240914-a5-clk-v1-2-5ee2c4f1b08c@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240918_090717_268697_D815F39E 
X-CRM114-Status: UNSURE (   8.24  )
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


On Sat, 14 Sep 2024 13:25:24 +0800, Xianwei Zhao wrote:
> From: Chuan Liu <chuan.liu@amlogic.com>
> 
> Add the SCMI clock controller dt-bindings for Amlogic A5 SoC family.
> 
> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>  include/dt-bindings/clock/amlogic,a5-scmi-clkc.h | 37 ++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
