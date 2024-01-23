Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5C73C47258
	for <linux-amlogic@archiver.kernel.org>; Tue, 23 Jan 2024 18:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=P+zcHXdMGwKzLZFg2F2R6x7XcxduekEPU/u8Cnfe8yE=; b=Px8aVxNvzNCEAL2RvfsxGGGI82
	TNOo1+RhqSXN0GwWAepuaZXQTXCwBWQewPqKDv4CgCQGOpwJimXBV4KvOEOlXKaf85NqabBwZDnGU
	4d6yAxI2DoXBeet0vvYQDRv4AZ7m5aGS7I09gyPwc9z6J5dbMMtD13cgKSTajMdin/RxHOdA3liCF
	W3PWlVbffS81qG/nctGRvV3md+2o9tAKNaZzXmWWb4jnKFGSEOHfje8orsOuIaXkL67BzqYtVLcqP
	XmbbB8VoTUapaxDay3Pg90ACi0oXEaafDVhIqkYFK+VjLbdK8/XRJr0/qwCSytx+NXNSL01t52l/o
	5fSYV4hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSLeW-0006RA-0l;
	Tue, 23 Jan 2024 18:37:40 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSLeS-0006Pq-1Q;
	Tue, 23 Jan 2024 18:37:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E2060CE2FC5;
	Tue, 23 Jan 2024 18:37:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7861C433C7;
	Tue, 23 Jan 2024 18:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706035053;
	bh=43X4Ckx7mjbikvmv9Y1ubNYOub49RqEzKd4SNTW3MJQ=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=vGDOh7Y764Fs/5GJoP32TnLS+PIAT/zHtQ2otJ4NkEqYbVvS3IabOIMFwn14UnlDu
	 UfrBvTs0c6M80SPMmTR59aUBocMxdz8IxbdwRBPWjc2rR/sLWYpFxglaSps9BwDA30
	 NUvatVAIJLAgNbAVObNJJ8ZQx2M8lxeiF0m5tvVLTt/hFaB8RlWn7a2tCPl14cg3jD
	 0wf56rM8JLx2ye/zD7IpmFI0ZXiNJ3uqY4AWJiCoG2KJDEBikN9MTJrzA6u6mqoI0I
	 iRCaH5rysgXgJCU9np1MrS+5cHtXfRyrkSzvzPIjhzx4YGKcja+RULE3q/AuzGPIFs
	 8pNRhBs1M7dvA==
Date: Tue, 23 Jan 2024 12:37:31 -0600
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Alexey Romanov <avromanov@salutedevices.com>
Cc: neil.armstrong@linaro.org, clabbe@baylibre.com, khilman@baylibre.com, 
 davem@davemloft.net, linux-crypto@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@salutedevices.com, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, conor+dt@kernel.org, 
 herbert@gondor.apana.org.au, jbrunet@baylibre.com, 
 martin.blumenstingl@googlemail.com, krzysztof.kozlowski+dt@linaro.org, 
 robh+dt@kernel.org
In-Reply-To: <20240123165831.970023-17-avromanov@salutedevices.com>
References: <20240123165831.970023-1-avromanov@salutedevices.com>
 <20240123165831.970023-17-avromanov@salutedevices.com>
Message-Id: <170603505021.1430814.1860868774735102384.robh@kernel.org>
Subject: Re: [PATCH v2 16/20] dt-bindings: crypto: meson: add new
 compatibles
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_103736_671612_5381D776 
X-CRM114-Status: GOOD (  10.58  )
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


On Tue, 23 Jan 2024 19:58:27 +0300, Alexey Romanov wrote:
> Now we can use crypto driver at G12A/G12B/S4/A1/SM1/AXG.
> 
> Signed-off-by: Alexey Romanov <avromanov@salutedevices.com>
> ---
>  .../bindings/crypto/amlogic,gxl-crypto.yaml   | 31 ++++++++++++++++---
>  1 file changed, 27 insertions(+), 4 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.example.dtb: crypto-engine@c883e000: compatible: 'oneOf' conditional failed, one must be fixed:
	['amlogic,gxl-crypto'] is too short
	'amlogic,gxl-crypto' is not one of ['amlogic,g12a-crypto', 'amlogic,s4-crypto', 'amlogic,a1-crypto']
	from schema $id: http://devicetree.org/schemas/crypto/amlogic,gxl-crypto.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240123165831.970023-17-avromanov@salutedevices.com

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
