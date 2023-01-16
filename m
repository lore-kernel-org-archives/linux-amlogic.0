Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09BCCC678D4
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Jan 2023 16:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E3ApWhKWTLb6j/0hUchbo2J9rDQ+y3yheYQJSI6cK14=; b=VJ9nuTjTvSMXal
	FinZqxX/weUwrxPGGiwba+tzXhpQ+wnBRqhzCo++5+SHhhlss5zbDX1j1kGoQuIEvnLXrluNbVXHI
	A8yQFFll28OOOA3iEUw2NfVRJfo7dOjuCZM8i+P1H5yVMZ5PE7MGjVz34rKdZ5RVgNARasajX2QJl
	MePbQMVnB1UOAqRQV4VBc8PhsrEvazBkND/oNlrury/9vmLO0nkrjV03KN3xJcWsz1VyL0gBtT5UP
	QpWsIv4oKqkVtaYUf5Z2ZpK+Qp89nMPgHd79AmobogVosDnhat3wUSkwPlXLLbEKxn4e8NIXzJget
	66ZN/DSjOJfvEZNauVzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHSTQ-00BOql-7g; Mon, 16 Jan 2023 16:36:40 +0000
Received: from mail-oa1-f50.google.com ([209.85.160.50])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHST4-00BOig-Uf; Mon, 16 Jan 2023 16:36:20 +0000
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-15eec491b40so8394214fac.12;
        Mon, 16 Jan 2023 08:36:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1RrHwWKYfkgAWCmUrBIFJh6tv8lG1nhX54ZLrdcxVA8=;
        b=c1UHJBT9M5+L0OmmlrV6dYoZozFQHXngZ9nV+MUiyET3vaDrknJ2ANcKgE5GnOKWGE
         +wrlO3mBe6iWYo5GGeUt/kSlOEbPsd0lcJ+K33cxb1GHyJ7MhIvdABefXKUY5c4mFic7
         xgr90mbhiIOdEjsEbISmoxt7C7iw1AU8FJ+aDVlzY8kwdtCYJ6luEA27yLJ1Gugzv+6P
         pyg+nfzrsOt1LMOtGH4PtxzGi1HeV2hVOoKObbVzIB+sKG3QAFA9lSE/QhMzF+bEk8sn
         19XfjxsbnVqmZjr5aLt4313efgwR7LvDTP2I570iHwaCIIbagB1j2xkuAOXq5GWkiip1
         bfKA==
X-Gm-Message-State: AFqh2krOZIXZfI7ig5D32KT5ERohpnx6qzSXjGZq6qRq53DXbnCNxC0G
	O5wrvjXcvdnn+uvLHl0Bfm+xR7woLw==
X-Google-Smtp-Source: AMrXdXuc2YR5XFDh+BjrSj9yCrSVAIET0KBbsCaLktdP4migZ/Nls+xg84R7aLjh9w7bkzh9R1hoTw==
X-Received: by 2002:a05:6870:348f:b0:15f:2854:3c69 with SMTP id n15-20020a056870348f00b0015f28543c69mr268945oah.29.1673886976626;
        Mon, 16 Jan 2023 08:36:16 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id r18-20020a05687080d200b0012763819bcasm14590181oab.50.2023.01.16.08.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jan 2023 08:36:16 -0800 (PST)
Received: (nullmailer pid 606182 invoked by uid 1000);
	Mon, 16 Jan 2023 16:36:12 -0000
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Rob Herring <robh+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
In-Reply-To: <8f1b2db3-f17d-f192-c28e-cb34dfcaf63d@gmail.com>
References: <8f1b2db3-f17d-f192-c28e-cb34dfcaf63d@gmail.com>
Message-Id: <167388663742.594124.9073960952096608319.robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: phy: g12a-usb3-pcie-phy: fix compatible
 string documentation
Date: Mon, 16 Jan 2023 10:36:12 -0600
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230116_083619_004199_7E08ECC3 
X-CRM114-Status: GOOD (  13.13  )
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


On Sun, 15 Jan 2023 15:24:12 +0100, Heiner Kallweit wrote:
> The compatible string in the driver doesn't have the meson prefix.
> Fix this in the documentation and rename the file accordingly.
> 
> Fixes: 87a55485f2fc ("dt-bindings: phy: meson-g12a-usb3-pcie-phy: convert to yaml")
> Cc: stable@vger.kernel.org
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  ...12a-usb3-pcie-phy.yaml => amlogic,g12a-usb3-pcie-phy.yaml} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename Documentation/devicetree/bindings/phy/{amlogic,meson-g12a-usb3-pcie-phy.yaml => amlogic,g12a-usb3-pcie-phy.yaml} (90%)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/phy/amlogic,g12a-usb3-pcie-phy.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/phy/amlogic,g12a-usb3-pcie-phy.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/8f1b2db3-f17d-f192-c28e-cb34dfcaf63d@gmail.com

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
