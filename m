Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14BB0C0015E
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Jul 2023 22:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SWFQm43zWUpSiRx3mU6bRN1dghbmm0qUFUuxB6994Pc=; b=gI0oo6cqnDgGGF
	I2rIrHC4gd/HULAl+tFNU189XfwHJN7xSe+8WiBLlk98b0uD+Yf5RysodFJCq9ccSMxurBYTQsj9c
	xgKgq1rI4tSoSlca+t0w6jacjE8xIYIT94v8xybdOGOdAbSFPcaEet/f3JJZ9Cx3Ko7jj/Gtn669s
	E1oawtwKvdwbTAnMdoDux9hkXPvkttJiGzbKP1CrSE2Ocp/Yn3Mwbo8ZLuWvE3QwFL4MYq+jm5Q+4
	IGjO+9xjMT+NobgRG4hkelWGkpPTnIDCu/fibun3D3Iy3dEmykwJFya01Gj8fEoCFMZQbZPCaLcfo
	sll0edxx09zL9zGx5iUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMFGK-0092oO-0T;
	Wed, 19 Jul 2023 22:03:12 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMFGH-0092nR-1T;
	Wed, 19 Jul 2023 22:03:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B571361856;
	Wed, 19 Jul 2023 22:03:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10E64C433C7;
	Wed, 19 Jul 2023 22:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689804188;
	bh=KOgi8CERrMjLLXKLLThWHTz3IzE2ZDRnAYr0l6w1cV8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C5uU/zL7eSWJFP59qyxLOGErAG6fABHjC27seiVbBucmowy96x29ttLvQ1Aq9/lMO
	 7eowFv+vX4unF90J6kXi7m31vtp0gnCJcr8t8JZ9JFl3yR6ycpoyA8xu/ySVOiIwl1
	 susjhI5r3G5uDTqb5+9zSfjld1V3S9Sp8d6zUbBtUTAcbUHz/PLY4FCZuYsadZmToc
	 rcJ/v+pGTkH0251T8w0CyPl87uqZESdVhpYR4Q0rtE5NL2bPiSh9T9/K2VDOSRsF3w
	 iwZfDA0Z3psDRoPNcMIt6yC/GO9x136HMBIt+8I9YyHmW034+E3/DtdTR5vG/Jl4jg
	 MM4MVLjZqFyFQ==
Received: (nullmailer pid 859465 invoked by uid 1000);
	Wed, 19 Jul 2023 22:03:06 -0000
Date: Wed, 19 Jul 2023 16:03:06 -0600
From: Rob Herring <robh@kernel.org>
To: zelong dong <zelong.dong@amlogic.com>
Cc: Rob Herring <robh+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-kernel@lists.infradead.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, kelvin.zhang@amlogic.com, devicetree@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>, Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v2 1/3] dt-bindings: reset: Add compatible and DT
 bindings for Meson-C3 Reset Controller
Message-ID: <168980418539.859406.10286895243062279504.robh@kernel.org>
References: <20230718123550.13712-1-zelong.dong@amlogic.com>
 <20230718123550.13712-2-zelong.dong@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230718123550.13712-2-zelong.dong@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_150309_544738_61BEF28B 
X-CRM114-Status: GOOD (  11.15  )
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


On Tue, 18 Jul 2023 20:35:48 +0800, zelong dong wrote:
> From: Zelong Dong <zelong.dong@amlogic.com>
> 
> Add new compatible and DT bindings for Amlogic's Meson-C3 Reset Controller
> 
> Signed-off-by: Zelong Dong <zelong.dong@amlogic.com>
> ---
>  .../bindings/reset/amlogic,meson-reset.yaml   |   1 +
>  .../reset/amlogic,meson-c3-reset.h            | 119 ++++++++++++++++++
>  2 files changed, 120 insertions(+)
>  create mode 100644 include/dt-bindings/reset/amlogic,meson-c3-reset.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
