Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FA14D41C17
	for <linux-amlogic@archiver.kernel.org>; Wed, 13 Nov 2024 08:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=jfuJaoD+epUCCqLZSzyWOATckEpIF00enrqx3CyObt0=; b=OKalKYMtRb7AfKg51KYiMfsQ16
	9f6lDM6N8XxBwJrhGeziKK21h1HmqJgDbyNzhO2kBto2C0b2kEyBHOQmrj+Ik3lEiDRLwHpF5bUjY
	yQR1bRQP01DpTY4B2WajLxSgqjtTUHWhF1NcnZlrEw7HuWef1qjlcUqJ8GVkw6r/wIWznYyC6sdYp
	uR/EEUC2y4/aDjgGCmGZ6K6R4zV+szBMHjH5FjAiIIFCpfiYKWkypNxnVTsIMOeyND/1b+s2HO2Li
	BpOXkCo7LIAlgznpkDcK47TieJKr8d6c8b8NqcGsRjRJgEmjTbEz5LL/I8JRfYE9AN2NTZB5rQhrI
	Kdd4zA0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tB8n2-000000066VW-2TuQ;
	Wed, 13 Nov 2024 08:31:52 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tB8mU-000000066Ob-1gbA;
	Wed, 13 Nov 2024 08:31:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8412AA403EC;
	Wed, 13 Nov 2024 08:29:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21A3CC4CECD;
	Wed, 13 Nov 2024 08:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731486677;
	bh=bM0X38UhkBzintoDYGOc67/pd8CabjjLBzBwfbjIAU8=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=V/ClBW7JwcDylSEPox1BqKSEFHkB+LEzuBaojbVOGIy5b+8a+S9VJV/1wKjvDGtV0
	 xIS+YSt/XmC/DGYp82maL5LSjKKKldeiQBG0tt1iO6CR2A8256Q9TW88RcWeKul782
	 2rPdxf9wR/C6F+3wSKfViRTW3D80A4BN+Xmiwdi7TYtidAqEGeQW02n7FEnXhfXZzu
	 zVSu/f5IXmlPvHY3FuiOgv4U4g9J1Vq1XWVdJGAXAJv4mciSkwQO8a79YowB403YBf
	 40kCVTCcm9QaMAS1UuzvQTfhy3XI9dXXXg/iUz+k/JJ5aEa3vZFLo5OLcu+aSP7sud
	 tjBAAe6yRErhw==
Date: Wed, 13 Nov 2024 02:31:15 -0600
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, 
 linux-arm-kernel@lists.infradead.org, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 linux-amlogic@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>, 
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <20241113-a4_pinctrl-v6-1-35ba2401ee35@amlogic.com>
References: <20241113-a4_pinctrl-v6-0-35ba2401ee35@amlogic.com>
 <20241113-a4_pinctrl-v6-1-35ba2401ee35@amlogic.com>
Message-Id: <173148667456.3371316.2229241108190941426.robh@kernel.org>
Subject: Re: [PATCH v6 1/5] dt-bindings: pinctrl: move gpio-cells property
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_003118_592922_6F5A7B0F 
X-CRM114-Status: UNSURE (   9.90  )
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


On Wed, 13 Nov 2024 15:29:39 +0800, Xianwei Zhao wrote:
> Move #gpio-cells property from common yaml file
> to lower-level yaml files.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>  .../devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml          | 3 +++
>  .../devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml      | 3 ---
>  .../devicetree/bindings/pinctrl/amlogic,meson-pinctrl-g12a-aobus.yaml  | 3 +++
>  .../bindings/pinctrl/amlogic,meson-pinctrl-g12a-periphs.yaml           | 3 +++
>  .../devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-aobus.yaml      | 3 +++
>  .../devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-cbus.yaml       | 3 +++
>  6 files changed, 15 insertions(+), 3 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-g12a-aobus.yaml: patternProperties:^bank@[0-9a-f]+$:properties: 'gpio-controller' is a dependency of '#gpio-cells'
	from schema $id: http://devicetree.org/meta-schemas/gpios.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-g12a-periphs.yaml: patternProperties:^bank@[0-9a-f]+$:properties: 'gpio-controller' is a dependency of '#gpio-cells'
	from schema $id: http://devicetree.org/meta-schemas/gpios.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-aobus.yaml: patternProperties:^bank@[0-9a-f]+$:properties: 'gpio-controller' is a dependency of '#gpio-cells'
	from schema $id: http://devicetree.org/meta-schemas/gpios.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml: patternProperties:^bank@[0-9a-f]+$:properties: 'gpio-controller' is a dependency of '#gpio-cells'
	from schema $id: http://devicetree.org/meta-schemas/gpios.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-cbus.yaml: patternProperties:^bank@[0-9a-f]+$:properties: 'gpio-controller' is a dependency of '#gpio-cells'
	from schema $id: http://devicetree.org/meta-schemas/gpios.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241113-a4_pinctrl-v6-1-35ba2401ee35@amlogic.com

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
