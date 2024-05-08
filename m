Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA555C04FFE
	for <linux-amlogic@archiver.kernel.org>; Wed,  8 May 2024 16:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=tWiiBBBOL6p11QtMfNorAnj/8z8XW2TxNhNImdjAl98=; b=dyoNC4y4naBdNPto6976VQgMMb
	jMjiG3OKRvAROXPJrpfvMprQPaPgYMOSGdqFF9yzfy4LqCjTjI0kDQWkLMgbbzmCJenDA9vo+ViKA
	48HVksqE0jDhFAqLy1edOcSk6Nm1yr1mX3giUoQUEEJtskd0wxsaBp/md8wnEMoxjdodg8ZgNBD4A
	LNGnK3VSPBOUNEexxFbtUVzzZuVNnj748eAsSRXQddokoTrnzcrX0KfSpdK8CMCSlwlNfWeix5zw6
	YWSWKuij44huytt6vNCTycw3vrGROuCqntJBHvceYEd2PHCp5HtmT4FQDDxx/UKOcte2UQTlKdkvh
	V4KCeljQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4k1m-0000000G9nI-0mfH;
	Wed, 08 May 2024 16:20:22 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4k1j-0000000G9mZ-12Ne;
	Wed, 08 May 2024 16:20:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7C22961CAA;
	Wed,  8 May 2024 16:20:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9E39C113CC;
	Wed,  8 May 2024 16:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715185218;
	bh=7Bcs9egzutasXmQ3GODsdhVNrBN1zsWCrT3shblN2JM=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=HdK4UBEeqasVn1Z9Gn+ouAO3JvJmVmtdl++v4Hzvmibx+MGABOUUfOwptnu2av+eO
	 /Mpj+/zadxpDUBDMuTiYbJ+CdfFNdftsoqN+mrw6FbW3jdXLaLSGcw1pcYY4A+sGkK
	 Hq2WZkkoVZCwCwqtgM46GE0hBmXcWXkq3K2zzzi+9DXmylBY+QtELrshQWlPDDagem
	 k3UJN75Vif1TOkRW+WmD+INlP7qFLGOfOIBMbULDsOh99gXZmy+EXb1GpC/TC+IG5J
	 UMGMnD5c7+lIeV1FmocU45NIUCod+sSWhgJ9TyclaSvLrWpLc3If9mCik8XY57KXoe
	 91iPEBxTpbNEg==
Date: Wed, 08 May 2024 11:20:16 -0500
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>
Cc: Michael Turquette <mturquette@baylibre.com>, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh+dt@kernel.org>, linux-amlogic@lists.infradead.org, 
 Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <20240508144259.191843-4-jan.dakinevich@salutedevices.com>
References: <20240508144259.191843-1-jan.dakinevich@salutedevices.com>
 <20240508144259.191843-4-jan.dakinevich@salutedevices.com>
Message-Id: <171518521621.2161709.4756483901685009302.robh@kernel.org>
Subject: Re: [APPROACH 2 2/2] dt-bindings: clock: meson: Convert
 axg-audio-clkc to YAML format
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_092019_352293_337DE269 
X-CRM114-Status: GOOD (  10.31  )
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


On Wed, 08 May 2024 17:42:59 +0300, Jan Dakinevich wrote:
> Convert Amlogic AXG Audio Clock Controller binding to yaml.
> 
> Signed-off-by: Alexander Stein <alexander.stein@mailbox.org>
> Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
> ---
>  .../bindings/clock/amlogic,axg-audio-clkc.txt |  59 ------
>  .../clock/amlogic,axg-audio-clkc.yaml         | 181 ++++++++++++++++++
>  2 files changed, 181 insertions(+), 59 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.txt
>  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.example.dtb: clock-controller@0: clocks: [[4294967295, 35], [4294967295, 11], [4294967295, 12], [4294967295, 13], [4294967295, 14], [4294967295, 69], [4294967295, 3], [4294967295, 4], [4294967295, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]] is too short
	from schema $id: http://devicetree.org/schemas/clock/amlogic,axg-audio-clkc.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240508144259.191843-4-jan.dakinevich@salutedevices.com

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
