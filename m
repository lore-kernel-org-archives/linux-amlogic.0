Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05705CFB446
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Oct 2024 16:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=4K5CXV4vfdUowVmAkEm90YVKya1spUHnxNUJmbDAtkA=; b=GKRmXHMlYhZ4gIbG6nNrdj0cz3
	vlOqkBLN3eDVa9OkgLWOjb9cPvdmqukgRvsWPSlNZ+JstbgAgDzPOW+PpYAei/pZPUgYTnf1syLey
	68a6Jl+Anpn4ueVOONutPq9h6Mn68Xqe75iAmSp+JY2FGFoW6uqrX5DQN0CSwpsPahi3U1iboASB4
	ET/lYjKnNiFlaZF9GsZYJnkLm8GJ1sd3KSuOT4yBAxcc/iz7ifpPvT6U4a+GvgIZrJG5Uiclhv6Pq
	61O/rowGijFXM3foDrb7C2wOPHpZQYyeZBNBHbi2Sv/6WC9cCrlVp6BR3W6D/tNBEqV/r2AoqaFq4
	+kstk5ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxqCH-000000034gj-2OYU;
	Mon, 07 Oct 2024 16:02:57 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxqBl-000000034ZZ-0xDV;
	Mon, 07 Oct 2024 16:02:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C6CB6A419C8;
	Mon,  7 Oct 2024 16:02:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCA85C4CEC6;
	Mon,  7 Oct 2024 16:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728316944;
	bh=806jNc2mizzwBfHn3ArzLEx2D5C2yoYYUNpl5mYv32c=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=YgDlgFVtTQHHg6zNLABaPqJoFAFjy5vCsh4MroD1s28BtDc62nqXeVFEzeEvNolqK
	 x47/P9+MQZAtq5TTiGXWO91a7+8raFCETtLc35MAHaVqNHVpS0ReKIbCupN8260g2Y
	 YRDk0g3ZERDesTgSVZBfHs6hf1YY0RsiE750sfEcuYmEu8NSCzpW/6xIklp5tNJ1d1
	 I+DS+syfrQjJHBbai+3QkR4/QdQgPNs1zYeQpivqIHqQj8ZHmDsq8BZxEdTEuMRANf
	 8x6d26ytwi1FjPCelYvxWCiZ1uxCGJ959JVEXF057/T3US6YwkCeBwHrgR8HjRvVPl
	 2B8EXGt39SVWA==
Date: Mon, 07 Oct 2024 11:02:23 -0500
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Heiner Kallweit <hkallweit1@gmail.com>, Kevin Hilman <khilman@baylibre.com>, 
 linux-gpio@vger.kernel.org, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
In-Reply-To: <20241007-topic-amlogic-arm32-upstream-bindings-fixes-meson8-pinctrl-v1-1-d3d838540033@linaro.org>
References: <20241007-topic-amlogic-arm32-upstream-bindings-fixes-meson8-pinctrl-v1-0-d3d838540033@linaro.org>
 <20241007-topic-amlogic-arm32-upstream-bindings-fixes-meson8-pinctrl-v1-1-d3d838540033@linaro.org>
Message-Id: <172831694232.937294.6889037408108312834.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl:
 amlogic,meson8-pinctrl-aobus: add reg for aobus pinctrl nodes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_090225_352677_B32241EA 
X-CRM114-Status: GOOD (  10.63  )
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


On Mon, 07 Oct 2024 16:16:25 +0200, Neil Armstrong wrote:
> While converting the Amlogic Meson pinctrl binding to dt-schema, the mandatory
> reg property for Meson8/b aobus pinctrl node was ommited, fix this to finally
> pass all bindings checks.
> 
> Fixes: 94df03a45276 ("dt-bindings: pinctrl: Convert Amlogic Meson pinctrl binding")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../pinctrl/amlogic,meson8-pinctrl-aobus.yaml      | 22 +++++++++++++++++++---
>  1 file changed, 19 insertions(+), 3 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-aobus.example.dtb: pinctrl: 'reg' is a required property
	from schema $id: http://devicetree.org/schemas/pinctrl/amlogic,meson8-pinctrl-aobus.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241007-topic-amlogic-arm32-upstream-bindings-fixes-meson8-pinctrl-v1-1-d3d838540033@linaro.org

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
