Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EC25C3ABC0
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 May 2025 23:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=RFylG92ssNbX5uLxshUGej42Vm7zRzL+kOBcjgAINaM=; b=oGZjZMqWWUiRZORrzrX4tmD/Gi
	8ark1/m7WvuuF+wqkaB0O6sB7aMbvKQFABpepX32iEcnLeDn+b5SNE6AC5JHZKsa2zwtgl0VMCG4J
	AGbBJujasuMS+Pu1TqKQQDlv2Bc8UcApVZuiDwfTB8C7cXmJWmk2nz5iPRL7oylykF6/bq2giqhWk
	QEIM7HvMWpeSOk7NlN5J7U7c0EYUCNfApPmtVWYRDKQ0aXAkvCt9niJRdi327ACIwF+YyPOhEjnQI
	YAKOaJnwcq35oLuRF7t59OSyZMfyxhzZCn7mLVdkpLqqHD423L1ja1WsU8wA2PWsjAFSEC6ieUkrb
	AJcxCu9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCnr9-0000000Gv9w-1Vk2;
	Wed, 07 May 2025 23:07:15 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCnr6-0000000Gv9E-27LY
	for linux-amlogic@lists.infradead.org;
	Wed, 07 May 2025 23:07:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 645BAA4BE67;
	Wed,  7 May 2025 23:07:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEC7BC4CEE2;
	Wed,  7 May 2025 23:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746659230;
	bh=kowzluapG3MSh9AZGkanLQ0O4GtMg+6T1JAjxCMbNls=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=eKp+AcOhgSWxjgv9mFidR+urP+yGFCMhatyj7ZCInpUNJoblKelkwKObkqUowX+eM
	 UlvwxMFGDKiQXxnSFihcOagaNKvxTtbcAuK2YVvFIQVVF/mI/IWkrvbemIGGAUDgFc
	 l1Mz0+dM5jNZ1wQ0376XLn9riuMKrsVIE1qrjBvw0a9Bh9guWyd/nEji3CwzNVy66w
	 +k04OImsNzWKhtpAr1EH/QoIAR6ynDV1e6ShzmhTxRYuCyr9fbnSrDYV/wBhboHZD4
	 ZmcStZ9MRzIMiKPEwRFIZ+Aej+x89pxRGnDkdf1remWILZymXd/kmm2A5tGeXcJoTG
	 FJiiNpA+PjVKw==
Date: Wed, 07 May 2025 18:07:09 -0500
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-gpio@vger.kernel.org
To: "Rob Herring (Arm)" <robh@kernel.org>
In-Reply-To: <20250507215852.2748420-1-robh@kernel.org>
References: <20250507215852.2748420-1-robh@kernel.org>
Message-Id: <174665922697.2893748.11935723086658329970.robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: pinctrl: amlogic,pinctrl-a4: Add missing
 constraint on allowed 'group' node properties
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_160712_612860_DC67DCC3 
X-CRM114-Status: UNSURE (   9.87  )
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


On Wed, 07 May 2025 16:58:51 -0500, Rob Herring (Arm) wrote:
> The "^group-[0-9a-z-]+$" nodes schema doesn't constrain the allowed
> properties as the referenced common schemas don't have constraints.
> Add the missing "unevaluatedProperties" constraint.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml          | 1 +
>  1 file changed, 1 insertion(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250507215852.2748420-1-robh@kernel.org

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
