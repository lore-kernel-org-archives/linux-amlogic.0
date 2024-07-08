Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F1B8C3271E
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Jul 2024 21:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=BiFRwa5V1JulBk1ZqMo1wHRXcYZCWey/sqsrKNORpUs=; b=YCgW1moFfBmQZC9CH/lNBsh+A5
	mHqR6jzI3N98Vt4p4vdmu58wxBnFYSYndu4WDLHNhNmbVYlF65syOah9KCuV8HpnShWYinYEZx24L
	/oce82KRiXnmOjJ/bMA7NIXknz631uTIyoZ9zfpF4om4hx1RYRO/9IVlZ31Xlt2WHu5VR/YOzkGhY
	4wcggxSYrV1ONYFYfcodBXyhVl7H/JyiP2hcg6mNqZa7IkNU/z2PDnRLhACzPo9BATFe0FGNw0Ms2
	wXH7az4t6tS87zdU7L2m+ItDU1NyIlMJwt2fT3/GJr7AEgFAK21hlQBhYz5pajSlahV7piUsOkGq+
	IitHsppA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQwDd-0000000581T-0x6O;
	Mon, 08 Jul 2024 21:48:21 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQwDa-000000057zl-1Flo;
	Mon, 08 Jul 2024 21:48:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D1F6061171;
	Mon,  8 Jul 2024 21:48:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38DE5C116B1;
	Mon,  8 Jul 2024 21:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720475296;
	bh=58cUh743dQOrMkAUwZvw9ESyA3J+L2orhwmh8ALge1A=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=JaNN1c8OyAPkwuzPpGIQ/dJzBrA9gLBtTF4untiSSorTgPz52kCpG4m1ivgICujV2
	 zM1bzIa0L1B5/vJO4UaGIN752t4mvj+bPijrEp71z1L899ue+oLozt3jVnLwu87ae6
	 crxn9bmpoZ/4V0nlKCCuSQaAvwihC5vuPzQqdbRSaSynIxcwdZmTV7KH7jpgrOEr8h
	 w+6JbSqIaELHULuaW6s5VK8qS51sCawyWsHQk7c9x8ukTHoL/wDIkpl2yaaeu0R+Sx
	 +jLDMOjWI9wpI80zGP/dOyAr/6/Bv4W2Kf9M5720JBH1WGJKYcUbUO5KzyP81ku4eU
	 PEvjHwpjPiOdw==
Date: Mon, 08 Jul 2024 15:48:15 -0600
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: George Stark <gnstark@salutedevices.com>
Cc: rafael@kernel.org, krzk+dt@kernel.org, hkallweit1@gmail.com, 
 b.galvani@gmail.com, lukasz.luba@arm.com, conor+dt@kernel.org, 
 rui.zhang@intel.com, broonie@kernel.org, devicetree@vger.kernel.org, 
 linux-pm@vger.kernel.org, neil.armstrong@linaro.org, 
 daniel.lezcano@linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, khilman@baylibre.com, 
 mmkurbanov@sberdevices.ru, linux-spi@vger.kernel.org, 
 martin.blumenstingl@googlemail.com, linux-i2c@vger.kernel.org, 
 jbrunet@baylibre.com, glaroque@baylibre.com, 
 linux-amlogic@lists.infradead.org, kernel@salutedevices.com
In-Reply-To: <20240708194808.1819185-2-gnstark@salutedevices.com>
References: <20240708194808.1819185-1-gnstark@salutedevices.com>
 <20240708194808.1819185-2-gnstark@salutedevices.com>
Message-Id: <172047529524.3973694.1825285851935530574.robh@kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: spi: amlogic,a1-spifc: make
 power-domains required
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240708_144818_427775_76C73813 
X-CRM114-Status: UNSURE (   9.89  )
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


On Mon, 08 Jul 2024 22:48:05 +0300, George Stark wrote:
> SPI Flash Controller has dedicated power domain so make the
> corresponding property required.
> 
> Signed-off-by: George Stark <gnstark@salutedevices.com>
> ---
>  Documentation/devicetree/bindings/spi/amlogic,a1-spifc.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/spi/amlogic,a1-spifc.example.dtb: spi@fd000400: Unevaluated properties are not allowed ('power-domains' was unexpected)
	from schema $id: http://devicetree.org/schemas/spi/amlogic,a1-spifc.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240708194808.1819185-2-gnstark@salutedevices.com

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
