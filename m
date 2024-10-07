Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BE47CFB448
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Oct 2024 16:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=dFS0qzpIJT6rOVGG1YNlXEXMm1wDA4mFM0k3d/zaDoI=; b=QEP+KJxWL/z6cL4HjsMBF7YeZh
	JgPm3p7emvGmwwaVP69nOcQd/WrXonAJn+HJa51wGovZ1fgb6h1+E+bZDP7rFtDKs8QzfTM98mYH1
	eGqWd8Jew9LiGYQOLiMn/+v+GHc2NprtSJlGndOhwcsg01z8+SMLebdotGht9TymHTv+VdUK/yprI
	Qh9UgjcqQkTjePqxBSDS4dpncHcYSTYhKl+klmjM7bD11aHhCoLPvuYphqh0Gjk7U87mgiugY9s72
	B33o0C82lX+i/Jhit6LcUWEKj8gQFVHdRaBsfLVQ6wpOIYQCL7aZfg77BemxbHb4T0c7LEsTX20ZH
	p7DiroCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxqDW-000000034ps-2A56;
	Mon, 07 Oct 2024 16:04:14 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxqBl-000000034Za-2c8K;
	Mon, 07 Oct 2024 16:02:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B656A5C5C9A;
	Mon,  7 Oct 2024 16:02:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACF93C4CECC;
	Mon,  7 Oct 2024 16:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728316944;
	bh=Q4PsbsVHT/o1CZ8EWpNOAe3Ox6YRWovXBHM9oFa8aR4=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=ZhLdJsPAu6oaApYdnnxdnGgnBFHJDRCEmMzed5EEnQVaTIZxZ+FqQX7u7l7e7OXEU
	 l52MlkeAHqXSgFemKixvZf6EsmPPHBvvt/18kSnP5uUxLDdoa7kId8W548V/XL9SB6
	 1yW8krRX6UL4id+bP4xofIi0TCBNZ36TrS3oxP41XmK5LwyUNkn/srgJrT0mLYoYkl
	 v3BRAV4h5PMHHEO5t+TXVZdpe7J68GX5dioDtR9OUu/iLUKJl9LNjjbShEC8rytu9+
	 71aU6hgiTIptNBgdasrjt7GV6dXOEIH4mqvsxa/9vco9IbCQTu2G6z3UVRrv/ODYWL
	 KSqivgsgKdybQ==
Date: Mon, 07 Oct 2024 11:02:24 -0500
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-kernel@vger.kernel.org, Heiner Kallweit <hkallweit1@gmail.com>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-amlogic@lists.infradead.org, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20241007-topic-amlogic-arm32-upstream-bindings-fixes-meson8-pinctrl-v1-2-d3d838540033@linaro.org>
References: <20241007-topic-amlogic-arm32-upstream-bindings-fixes-meson8-pinctrl-v1-0-d3d838540033@linaro.org>
 <20241007-topic-amlogic-arm32-upstream-bindings-fixes-meson8-pinctrl-v1-2-d3d838540033@linaro.org>
Message-Id: <172831694330.937353.14650435678577353929.robh@kernel.org>
Subject: Re: [PATCH 2/2] dt-bindings: pinctrl: amlogic,meson8-pinctrl-cbus:
 add reg for cbus pinctrl nodes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_090225_728949_969B6017 
X-CRM114-Status: GOOD (  10.62  )
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


On Mon, 07 Oct 2024 16:16:26 +0200, Neil Armstrong wrote:
> While converting the Amlogic Meson pinctrl binding to dt-schema, the mandatory
> reg property for Meson8/b cbus pinctrl node was ommited, fix this to finally
> pass all bindings checks.
> 
> Fixes: 94df03a45276 ("dt-bindings: pinctrl: Convert Amlogic Meson pinctrl binding")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../pinctrl/amlogic,meson8-pinctrl-cbus.yaml       | 22 +++++++++++++++++++---
>  1 file changed, 19 insertions(+), 3 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-cbus.example.dtb: pinctrl: 'reg' is a required property
	from schema $id: http://devicetree.org/schemas/pinctrl/amlogic,meson8-pinctrl-cbus.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241007-topic-amlogic-arm32-upstream-bindings-fixes-meson8-pinctrl-v1-2-d3d838540033@linaro.org

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
