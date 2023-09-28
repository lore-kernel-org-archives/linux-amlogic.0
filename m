Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE194E732DF
	for <linux-amlogic@archiver.kernel.org>; Thu, 28 Sep 2023 14:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BNp8WYZFhLutFzDpNoEOw9sB8ehu9P3nMj8hARr5Y1A=; b=kvD2AUxd8RG88G
	MVbXhhZGKz3Yq17kzhRkiuzI25F+i0GN2WYn+N7WPnpprt9LyfJo9kbh67KOVbtr+Brz8ewfNnUzo
	bn2/sxtUB1bcuE6rcGbi6Vc5QTSE9Anc+yCnmctfeojLS5Ejzyd4jXMWDy7zgyVt7l8ufHwhXaxF2
	qYy/7B8KTG9+YAuMDTPz4FP3SwZt7pJECFd6Lt4nMqyZPmTeizQHOICwZXdN+VGZx73cY36T84T6u
	cwjFKr8xzcrcZ7EroaYgfoCgkn4dxpREYaVNKPjZVFQl+5zgDpHeZ+sWmvkOMzkqqlTH2LBJ5nYSH
	liwD3dmRu6ZINaEpQv+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlsIj-0052g5-0L;
	Thu, 28 Sep 2023 14:47:37 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlsIZ-0052WJ-1k;
	Thu, 28 Sep 2023 14:47:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 176B7B81CC8;
	Thu, 28 Sep 2023 14:47:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ACCFC433C9;
	Thu, 28 Sep 2023 14:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695912445;
	bh=9utg3AtOlgvU+dD8ZuBn4ETN3zDDvdFefT2/CLiMqY0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=m4T6xNag9RC/mJ1OD13Oj50LYwU3n6aBKwCnuhNNTpPQSss2vLM9acUfbPis8iaDI
	 FpGBH6K777L59GMJChlYWsH2xRuX5Rqga2tRacTKDfNljyCmNKP/6vYgSDMKah+tV4
	 qxezf4CQ9cGIL4Epg/BehIeD2iGzi95y7NhkCJtnp1e1RHKo9qOp2HTMxrfUSqbcyT
	 hpyY4FhzSiwQZ9rMxQqpzAt5h/PezxqhJI3YOsWKiSPeo2srooRCCSy/Dx5wYAn339
	 pVY6YPj9zpK43ZGe0c5wBkjInn5o60ULsAGpv3rHbUVsno1G8HNajpSSk0Uit1K3s0
	 M6QQ90TfI7gWA==
Received: (nullmailer pid 408732 invoked by uid 1000);
	Thu, 28 Sep 2023 14:47:11 -0000
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, linux-clk@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, linux-arm-kernel@lists.infradead.org, Michael Turquette <mturquette@baylibre.com>, linux-amlogic@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
In-Reply-To: <20230928063448.3544464-2-xianwei.zhao@amlogic.com>
References: <20230928063448.3544464-1-xianwei.zhao@amlogic.com>
 <20230928063448.3544464-2-xianwei.zhao@amlogic.com>
Message-Id: <169591240751.408219.17789737380283170194.robh@kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: clock: add Amlogic C3 PLL clock
 controller bindings
Date: Thu, 28 Sep 2023 09:47:11 -0500
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_074727_904543_6EBA1B3D 
X-CRM114-Status: GOOD (  11.12  )
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


On Thu, 28 Sep 2023 14:34:45 +0800, Xianwei Zhao wrote:
> Add the C3 PLL clock controller dt-bindings for Amlogic C3 SoC family
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>  .../bindings/clock/amlogic,c3-pll-clkc.yaml   | 53 +++++++++++++++++++
>  .../dt-bindings/clock/amlogic,c3-pll-clkc.h   | 42 +++++++++++++++
>  2 files changed, 95 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,c3-pll-clkc.yaml
>  create mode 100644 include/dt-bindings/clock/amlogic,c3-pll-clkc.h
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/clock/amlogic,c3-pll-clkc.yaml:2:1: [error] missing document start "---" (document-start)
./Documentation/devicetree/bindings/clock/amlogic,c3-pll-clkc.yaml:50:1: [error] syntax error: found character '\t' that cannot start any token (syntax)

dtschema/dtc warnings/errors:
make[2]: *** Deleting file 'Documentation/devicetree/bindings/clock/amlogic,c3-pll-clkc.example.dts'
Documentation/devicetree/bindings/clock/amlogic,c3-pll-clkc.yaml:4:1: but found another document
make[2]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/clock/amlogic,c3-pll-clkc.example.dts] Error 1
make[2]: *** Waiting for unfinished jobs....
./Documentation/devicetree/bindings/clock/amlogic,c3-pll-clkc.yaml:4:1: but found another document
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/amlogic,c3-pll-clkc.yaml: ignoring, error parsing file
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1427: dt_binding_check] Error 2
make: *** [Makefile:234: __sub-make] Error 2

doc reference errors (make refcheckdocs):
Documentation/devicetree/bindings/clock/amlogic,c3-pll-clkc.yaml: Documentation/devicetree/bindings/clock/amlogic,s4-pll-clkc.yaml

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230928063448.3544464-2-xianwei.zhao@amlogic.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
