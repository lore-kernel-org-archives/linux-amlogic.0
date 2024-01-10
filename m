Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F94FC4707B
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Jan 2024 21:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=szUAtny8oIWFpZVxlyTQ+6iWkoDWtz/0i3FwEkASoRo=; b=tsphUgwPXCkbWt
	TpUNE+VMLtla3KPuuWk/0hkJZJUdnWghTpHzavazz2oL5fKd965xF1k04F28vhA9Y37c5/RzJBtGI
	CFZoqe1VVaeXirnv5S+6dRupF5vSlVYRK7xWz8bkNxqysxchdUS35Vdtk+YCvP1moiubcrU4XiUiU
	gxhCXEhbUFdvkIFMt0/2JLeJFPZAl8gF+Gz/cCl4FU7pfz+A/aDOq+eD7PFlw/CEbn6UH6IUaOS5H
	wo9oMguV3leOn4o9r7/IouOE2Iai6Vp7ec3nIiHzQOaqTqoQ1lGJ8PIxPOLtH7YfOlNYb1XRL5ChY
	QWJbC/YI6FiyHSAFlKrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNg4z-00EFjN-1C;
	Wed, 10 Jan 2024 21:25:41 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNg4w-00EFhg-1J;
	Wed, 10 Jan 2024 21:25:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id B5479B81EA2;
	Wed, 10 Jan 2024 21:25:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C01ECC43390;
	Wed, 10 Jan 2024 21:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704921934;
	bh=Ax58DmDjPNW74NGwRvhHHGsYqpwIGIZxv4FkZoGcxV4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=WV/+YMoOvCEyWpaRpYZfa87kc6mbQ0JnVBbDnIG5yf/huJPTEyQwx8cXxan8KxinN
	 6sNBXfQFoVBxzqwDGumSVysnHcLmYq9nvcNjV5hKJ7VVI/muQ0GlHvgx+x3+niVmq9
	 RuxS7Zd6MOXiXUhr0aTG2YCs+G4j0caWW01HTd+aL1Hy5Lw/lJ9cj/lZOsySBKvQWB
	 er+OO8VqSbL3cviSAhyf8p2dZWVLVPhS4OLTE6iChmLPRf4MhEPa0XRlj+JhQFQ55u
	 m/xZtqRUdeC3VwXCXxl9xZQ9TjdHsXZYksEUz4gTQpIoWVCmyU/4A+oymlcDeOrDbP
	 DQq9jAA3AdwNQ==
Received: (nullmailer pid 2648568 invoked by uid 1000);
	Wed, 10 Jan 2024 21:25:28 -0000
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Alexey Romanov <avromanov@salutedevices.com>
Cc: kernel@salutedevices.com, herbert@gondor.apana.org.au, davem@davemloft.net, neil.armstrong@linaro.org, linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org, khilman@baylibre.com, robh+dt@kernel.org, linux-amlogic@lists.infradead.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, narmstrong@baylibre.com, clabbe@baylibre.com, jbrunet@baylibre.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, artin.blumenstingl@googlemail.com
In-Reply-To: <20240110201216.18016-17-avromanov@salutedevices.com>
References: <20240110201216.18016-1-avromanov@salutedevices.com>
 <20240110201216.18016-17-avromanov@salutedevices.com>
Message-Id: <170492192887.2648505.6187306596898979418.robh@kernel.org>
Subject: Re: [PATCH v1 16/24] dt-bindings: crypto: meson: add new
 compatibles
Date: Wed, 10 Jan 2024 15:25:28 -0600
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240110_132538_607991_8C64015A 
X-CRM114-Status: GOOD (  10.61  )
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


On Wed, 10 Jan 2024 23:11:32 +0300, Alexey Romanov wrote:
> Now we can use crypto driver at G12A/G12B/S4/A1/SM1/AXG.
> 
> Signed-off-by: Alexey Romanov <avromanov@salutedevices.com>
> ---
>  .../devicetree/bindings/crypto/amlogic,gxl-crypto.yaml          | 2 ++
>  1 file changed, 2 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.example.dtb: crypto-engine@c883e000: compatible: ['amlogic,gxl-crypto'] is too short
	from schema $id: http://devicetree.org/schemas/crypto/amlogic,gxl-crypto.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240110201216.18016-17-avromanov@salutedevices.com

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
