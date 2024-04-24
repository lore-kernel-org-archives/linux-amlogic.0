Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EAF2C4345F
	for <linux-amlogic@archiver.kernel.org>; Wed, 24 Apr 2024 20:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0NhKm8JXWM9t1Zg4g9Qqnu0eq7ecvNAaafXEiSInSbY=; b=XHhobTlmlhoxEn
	L/uy0h14oShXZFa89DXXSABovm1FGEUuu9NoHfE2C+kCbehfVJC+QRbo2moN1XWzOMdUt2HZDmaeO
	GpXLW6zzz6/3HDjnxzOZAacahbnbfPKQUPXiS43qgfdjTzjJvd0GCAya/XERl3ea3S/UNsAfuqKbU
	4c3v6xS4zdzmDAhG8iZcDM783xT4pqOv0Mz5cUMnyYGD2ovObyOHxNF48DcHjOWPPd64JaTmmPiMP
	6MxDpeuc1aMPMM6/qoMHqtGAD29XC2eBrXQSmhPkY6MKoFDdz5INwW1bzuw3ivt8MRGojZEG+jRzJ
	RA4PlIvqnE7dF7lrZK5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzixm-00000005qhB-2D8o;
	Wed, 24 Apr 2024 20:11:30 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzixk-00000005qfb-0yWA;
	Wed, 24 Apr 2024 20:11:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D9EAECE1827;
	Wed, 24 Apr 2024 20:11:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D8FAC113CD;
	Wed, 24 Apr 2024 20:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713989485;
	bh=UBmpCETlbSLWoI/p9IWEP/1/pYi6ZGue5/z+HCap4QU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QFe3YnWch1mJ9v1kOTyFBQ1xO+wLK07zzjkw9l46Cajfcdf9QIf3PRysAPy9QZV5u
	 lpvKgLD59fa/hMueX9TmogapPewP2yLmJfc+GoMS72RwTh188+VsXPU7GxHoRPbW/B
	 j2SvZOhwmvZLI91klCpxXu/EfZiXhjb6zsHBJuI7zL7EhGdogm1XWkKfeXYnz0tMuK
	 M4kXn/cbLSBEVfQpEoatCz7UMlNHNha3TcWaQMwWj+9wprUolCJbo9wY/s/JjEGA+L
	 1nr1FE76t3rPb7WE8s8EB4E4dK+5sxHo3z6JGvd6gjNYhEiT2GH3geRioQ8KlBKzRH
	 nbic3lgvAXM5A==
Date: Wed, 24 Apr 2024 15:11:22 -0500
From: Rob Herring <robh@kernel.org>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org,
	Kevin Hilman <khilman@baylibre.com>,
	linux-arm-kernel@lists.infradead.org,
	Michael Turquette <mturquette@baylibre.com>,
	Chuan Liu <chuan.liu@amlogic.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH v7 3/5] dt-bindings: clock: add Amlogic C3 peripherals
 clock controller
Message-ID: <171398925862.427636.11006695483267074657.robh@kernel.org>
References: <20240424050928.1997820-1-xianwei.zhao@amlogic.com>
 <20240424050928.1997820-4-xianwei.zhao@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240424050928.1997820-4-xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_131128_472559_3121D85E 
X-CRM114-Status: UNSURE (   7.34  )
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


On Wed, 24 Apr 2024 13:09:26 +0800, Xianwei Zhao wrote:
> Add the peripherals clock controller dt-bindings for Amlogic C3 SoC family
> 
> Co-developed-by: Chuan Liu <chuan.liu@amlogic.com>
> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>  .../clock/amlogic,c3-peripherals-clkc.yaml    | 120 ++++++++++
>  .../clock/amlogic,c3-peripherals-clkc.h       | 212 ++++++++++++++++++
>  2 files changed, 332 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,c3-peripherals-clkc.yaml
>  create mode 100644 include/dt-bindings/clock/amlogic,c3-peripherals-clkc.h
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
