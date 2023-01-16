Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D778FC677F1
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Jan 2023 16:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iP2DMbRe239H3bEXEHSBdiNcjhWrER/n+//2IGt7u6I=; b=BFDNEGagPC+Kn+
	KX2ra4EaDuYF+oo8dNF164LqEYWn9zStzpd2ijW/nQOtmGn3VnfLhKoqiEtZTQCnM87ydxw3CguFA
	iwaNCAvkgrKGt/5x8zKmKSnQj9UdT6W+GwiLgs/FFh5uxgO/HT67GFk+nC5WXScye9hf8czy4rKGg
	4CetZZ2mSpgSDJAhqHD++SHTaB/Wb0PsUzp8ip/MHtxntSJzzIRg2aNpqRU+/TmqKsOkw5XNesTdN
	tp1jVSfYvOtY6I9BKIQGSqZQ5+5kBj+dFthk1AdFdRV6qWZ4/E+NCMkOkhRg0EirfPVfUsO/CvAfB
	/yCFTL/2dJIV8ytZ7CUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHST7-00BOjv-5W; Mon, 16 Jan 2023 16:36:21 +0000
Received: from mail-oi1-f175.google.com ([209.85.167.175])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHST4-00BOhm-1l; Mon, 16 Jan 2023 16:36:19 +0000
Received: by mail-oi1-f175.google.com with SMTP id i5so5582519oih.11;
        Mon, 16 Jan 2023 08:36:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0hnUZ60mVRJhXUg94NvWH4Vacuvk8BAE/8ADy6vgTsQ=;
        b=1/S9IdzQwATZ4y5YW9xLka5ZqpuqycWFE/OMcJhGxyMhP4eOewTvfkl8UfM9NODPVM
         oYkRQtptYf1KkjQT/RcwQxceB619rxK057sT8TdwTs4QPEcb3mbrwrsU6OlG4Azy14nj
         Vop5uM/nafx+BpRAdUxawIVmg9/Znok60KWX4Htk0tfFB4UWuArLJWp61J2Z3021QYB4
         dDdo5GDFQSDfMSjBInyWPctBYSq3AtvGtuAR7/xg9a5fWU1N9nKm/18zwZgpLpgaINlB
         eyiwYlT4Sm3UOR27SVNlzKUbLNxPPXVsqWQ2IcSUSPPyN+6T6WmupHkp6/AfxO/7NW8F
         VxRw==
X-Gm-Message-State: AFqh2kojsinpRvvIvjH7q1hPvGxBYD44NiGWTuEcBsXCIK9K5hdm14gP
	OA1gLGWOTrKm6a4mUC4L3L7EHyqdMQ==
X-Google-Smtp-Source: AMrXdXuK0z8g2M52j0b3QBVJOrcC5GBevcSNZ828P23dAscXDIb9r3LrG8OccvrQIzRmTnN3zLnsAQ==
X-Received: by 2002:a05:6808:ec6:b0:35e:df32:64b1 with SMTP id q6-20020a0568080ec600b0035edf3264b1mr12091899oiv.21.1673886973800;
        Mon, 16 Jan 2023 08:36:13 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id e26-20020a0568301f3a00b006770e855c61sm5535920oth.31.2023.01.16.08.36.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jan 2023 08:36:13 -0800 (PST)
Received: (nullmailer pid 606179 invoked by uid 1000);
	Mon, 16 Jan 2023 16:36:12 -0000
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, Kevin Hilman <khilman@baylibre.com>, linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Kishon Vijay Abraham I <kishon@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
In-Reply-To: <fae86fd4-40f0-ce6f-f3ab-d5e0cff019c4@gmail.com>
References: <fae86fd4-40f0-ce6f-f3ab-d5e0cff019c4@gmail.com>
Message-Id: <167388663660.594049.3734030156353623535.robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: phy: g12a-usb2-phy: fix compatible string
 documentation
Date: Mon, 16 Jan 2023 10:36:12 -0600
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230116_083618_110404_04606EA3 
X-CRM114-Status: GOOD (  13.34  )
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


On Sun, 15 Jan 2023 15:19:31 +0100, Heiner Kallweit wrote:
> The compatible strings in the driver don't have the meson prefix.
> Fix this in the documentation and rename the file accordingly.
> 
> Fixes: da86d286cce8 ("dt-bindings: phy: meson-g12a-usb2-phy: convert to yaml")
> Cc: stable@vger.kernel.org
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  ...,meson-g12a-usb2-phy.yaml => amlogic,g12a-usb2-phy.yaml} | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename Documentation/devicetree/bindings/phy/{amlogic,meson-g12a-usb2-phy.yaml => amlogic,g12a-usb2-phy.yaml} (91%)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/phy/amlogic,g12a-usb2-phy.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/phy/amlogic,g12a-usb2-phy.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/fae86fd4-40f0-ce6f-f3ab-d5e0cff019c4@gmail.com

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
