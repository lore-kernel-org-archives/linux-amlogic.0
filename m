Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEF76CD1292
	for <linux-amlogic@archiver.kernel.org>; Tue,  9 Apr 2024 01:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=lMlGPeshw+/vzW8RVkQz0uZ7vZawdE+0af+UL6HnnN4=; b=yRtPu2EEOJVmHCtEs7+76tfpxe
	MV94k/y3ZBh8b9z3/udr9f0fQgflv7tAsjvehaCo1Kmcj+2VDcaVCXqBBMkBE3qSikQlHGDwbz3YD
	qtwxrbSImm0ibOvPLP7oGPkrq9+wvk8/GWvmNIfjoOvEfSjN6IZf7yaGCBhbwZQRxWDM4XcnfFmdq
	iFxq0limrEeMkZM5C3LnAcSVDKaS5P/vvKW9gEcFZkCzmPJbmPRjQN9rEO+fzet6DQ+moMGuGN+cr
	iAhLJK6Wp1ykibwfjoto1rrZIrR6rtmKPFfqU7D6/OBSmUIQXN7cCQhTFIX3CmacDIvFJf7VuL2A1
	RkmK7Ucg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru0IT-0000000HOF6-0X8v;
	Tue, 09 Apr 2024 01:29:13 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru0IO-0000000HODv-33xa;
	Tue, 09 Apr 2024 01:29:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0A852614C5;
	Tue,  9 Apr 2024 01:29:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A0F4C433C7;
	Tue,  9 Apr 2024 01:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712626146;
	bh=05Yu1Hwdufax+g3FUQAUbIZECXJPsnkFawR16oZeuXg=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=BWNQ+o8EKBDZ+M+YSjkCOzd2WzzmFR2Ni7Je2bm0Sle4oubjVJElKU227lBPd+Cbm
	 zuFEkyZiT5mE6d/NL7mxsTQHWDlJhk69ZA+kAxCm3UUmz8MdM1OwOy5pEJW5J9uVNW
	 4i6jOIqJn0ipfU7G4d9fCr1rXYjelUTUFC83R+ccyONfpLvTjxJtYa++aIMzXpH7hF
	 O+tYYejMkPh6wP6K5zVffDrHX1XqTUQrnkbuQVRsSByOrOe2y6bKELPkTDEAel4DQJ
	 p3HLnP84vjWddfxGSE85TJRMdosF2MPA4FE8ePgLnI51TgfOelEpr2sIvf3s40G5mj
	 xOjvs7OFIuosw==
Date: Mon, 08 Apr 2024 20:29:05 -0500
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Arseniy Krasnov <avkrasnov@salutedevices.com>
Cc: kernel@sberdevices.ru, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, oxffffaa@gmail.com, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 linux-arm-kernel@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>, 
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org, 
 Vignesh Raghavendra <vigneshr@ti.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 linux-amlogic@lists.infradead.org
In-Reply-To: <20240408085931.456337-2-avkrasnov@salutedevices.com>
References: <20240408085931.456337-1-avkrasnov@salutedevices.com>
 <20240408085931.456337-2-avkrasnov@salutedevices.com>
Message-Id: <171262614183.5405.15027515085421244232.robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: mtd: amlogic,meson-nand: support
 fields for boot ROM code
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_182908_845234_5A841D22 
X-CRM114-Status: GOOD (  13.77  )
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


On Mon, 08 Apr 2024 11:59:30 +0300, Arseniy Krasnov wrote:
> Boot ROM code on Meson requires that some pages on NAND must be written
> in special mode: "short" ECC mode where each block is 384 bytes and
> scrambling mode is on. Such pages located with the specified interval
> within specified offset. Both interval and offset are located in the
> device tree and used by driver if 'nand-is-boot-medium' is set for
> NAND chip.
> 
> Signed-off-by: Arseniy Krasnov <avkrasnov@salutedevices.com>
> ---
>  .../bindings/mtd/amlogic,meson-nand.yaml           | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml:84:61: [warning] too few spaces after comma (commas)
./Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml:85:61: [warning] too few spaces after comma (commas)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240408085931.456337-2-avkrasnov@salutedevices.com

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
