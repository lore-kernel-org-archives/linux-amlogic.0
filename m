Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65031CDD543
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Sep 2024 16:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aB2+4g6mTc+zTSEBME9Cb8k/FLoR+bDzW/XNPeS8KJ8=; b=07D5fvWax2eU2b
	CqxGXILIPAULqUp/3xnDarUAoEfustz6fUHncSJ+okEW/98TdFpCm8dTya7zphpQJvdbytd9TmBaF
	FsmXNOhNEdSH7hhlo9tZdGGrjqp+slCnvNHmVzkXCTIfDpvQaT/lzUoRDeeRd10Fvj0L0JNfZTEFp
	zSMjFmNOy4D/JiGT7mzfLqyZgRItzu/psxA+gGlrmnkRwlswrgjawVivomit/MP/RHLd9gKymNRRW
	8gmCs/uxtFgeQJuqaHByNFW7zB+ZojxnCXO+i/PQcle5a27g69xnQ5IbrEDstVVXZGVmDpRt6HaxX
	WTlw4SVu1kPYw1D8aJTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqxIt-00000008bVL-2sLp;
	Wed, 18 Sep 2024 16:13:19 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqxIr-00000008bUN-2IOH;
	Wed, 18 Sep 2024 16:13:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AB29DA410E7;
	Wed, 18 Sep 2024 16:13:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 037A1C4CEC2;
	Wed, 18 Sep 2024 16:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726675996;
	bh=u1M8MKMhNRnijK3CL3rzuoog41ZY0dXAPy6BCeSJHuQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CXjuTYUhL39XIqyWFC6xLoXn/kV2acdLKv4EN70nhxn1/Tu8PVpFBkW1o0SrSjRD8
	 ssfGoU+P2JAJoNE381z+yBucS16enc6dSFRD4ScwfcQoSBNO0QWgxJvJxIYu0SiyvL
	 aPcXnilxSDV4Nvl1IDSjmNnJuTKK0Oxbfx8xMlIZkn4dStsIknMqASV4BOEE+lpZPb
	 G9tXWwgdtDeh9y3M55t/j8qq+2VfY6Ff7H3JHikb0Eds1XGK3kwDgV9UfNYJ93QlUR
	 lJJSED/eacD2nC1JiW3xdoOeqjDQsBzG675JbzuLHuyDdnYHkCimJ+icMYs2gYtRRc
	 rGEdCneZ8phXQ==
Date: Wed, 18 Sep 2024 11:13:14 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-clk@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-amlogic@lists.infradead.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, Chuan Liu <chuan.liu@amlogic.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 3/5] dt-bindings: clock: add Amlogic A5 peripherals clock
 controller
Message-ID: <172667599449.1714611.1180499286206997006.robh@kernel.org>
References: <20240914-a5-clk-v1-0-5ee2c4f1b08c@amlogic.com>
 <20240914-a5-clk-v1-3-5ee2c4f1b08c@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240914-a5-clk-v1-3-5ee2c4f1b08c@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240918_091317_667933_55E6B384 
X-CRM114-Status: UNSURE (   8.34  )
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


On Sat, 14 Sep 2024 13:25:25 +0800, Xianwei Zhao wrote:
> From: Chuan Liu <chuan.liu@amlogic.com>
> 
> Add the peripherals clock controller dt-bindings for Amlogic A5 SoC family.
> 
> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>  .../clock/amlogic,a5-peripherals-clkc.yaml         | 126 +++++++++++++++++++
>  .../clock/amlogic,a5-peripherals-clkc.h            | 139 +++++++++++++++++++++
>  2 files changed, 265 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
