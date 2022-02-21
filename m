Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78375C433FE
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Feb 2022 02:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:Message-Id:Date:Subject:References:In-Reply-To:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t0NqRlvtARTiLV+gdC1pET9FzJkMC48GU1GrAN3oHOs=; b=nlC8eeFJ59Xg+04h0hfPup4vHy
	ogAzu4G4IAzIXWpd8NnnheI1eqy4ekOzNCsl3fAge0WOJlurzyrA83CfNZcivK28EayHS/tGyNR2A
	BjOkpKZTawpLHaifB1GbnA5OQQmTvk6lcwOXrULD4lh95OVqnKf2Y3adyuwezX/LIrexYJBYNLvre
	N9UaVop2/M+T3pk8HlMn7zrnO8Mlf8qfIj8mbgoos7RNjAFdOT7C/wQdz/cf183/NMDaEYwpOrfgO
	yX/bKQhIXNVKdQRh/Ut1Idb9vY1YO5DynW1RIBCoLN+s5quHGYFMvqA3oBiGeSKaPVTr+czDHElFi
	17FWGz0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nLyYw-0033ij-2X; Mon, 21 Feb 2022 02:36:30 +0000
Received: from mail-io1-f52.google.com ([209.85.166.52])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nLyYi-0033d6-Ha; Mon, 21 Feb 2022 02:36:18 +0000
Received: by mail-io1-f52.google.com with SMTP id q8so14417847iod.2;
 Sun, 20 Feb 2022 18:36:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=2mmcZ0qMjEAikcQvpd5iCmfuIKx/lTLKOc0r1rxTap0=;
 b=UJ9OTwc4AiSGjjAhk8lnETmqp/3fv8gKzOKzcGEkTQ5BX8rGaSPDcd0xYo6F4q77L7
 nl0SUxwJlvRYT29dG6/s4GK8ffBIaZaHxzl+12kZyBhvHnBKqybT7BFdQdnwRHt30jrZ
 ohdza1y7Spsd8GDLivVyh/ecRT1vcF5tXx/fh/KsR/F7FVgfHjQKCOdoTe/pPCNjnpAd
 8mzvFuf28NIvV+qjCldFHrRZLKKWnH5DdWZwbKjPO214NQ8sbnYYO+eGfppKDjsfYj5u
 7U8f9BoHsKQ1pMGhTFUp57yFEg1lOCdQaZLQCsol8yxbCmb9JZndZmsWK0ocFIBPLHGs
 xwTQ==
X-Gm-Message-State: AOAM532cU0CvVCS5lNGRJ5kwVDLz2gxzNMIA7yAQqLXcAD2/m7sn59by
 sh7m+HAfzCeLmP4W/17hBQ==
X-Google-Smtp-Source: ABdhPJypQDHWIJkGf/quhqIersUuQk4DFD1V7BeSFJIZUMfyu9Yn9GnRxz+LJKy432+3svAi+vLRjQ==
X-Received: by 2002:a02:c98b:0:b0:310:f631:dcf8 with SMTP id
 b11-20020a02c98b000000b00310f631dcf8mr13779004jap.125.1645410974796; 
 Sun, 20 Feb 2022 18:36:14 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id s15sm1654358ilq.66.2022.02.20.18.36.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Feb 2022 18:36:14 -0800 (PST)
Received: (nullmailer pid 2041545 invoked by uid 1000);
 Mon, 21 Feb 2022 02:36:09 -0000
From: Rob Herring <robh@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Miguel Ojeda <ojeda@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Mark Brown <broonie@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>
In-Reply-To: <d8fff247-d3ce-79f0-6d0b-dcce44457681@gmail.com>
References: <4172e59f-b9d5-d87d-9dbd-a6f683a2173c@gmail.com>
 <d8fff247-d3ce-79f0-6d0b-dcce44457681@gmail.com>
Subject: Re: [PATCH 3/6] dt-bindings: auxdisplay: Add Titan Micro Electronics
 TM1628
Date: Sun, 20 Feb 2022 20:36:09 -0600
Message-Id: <1645410969.379359.2041544.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220220_183616_604326_80E8828B 
X-CRM114-Status: GOOD (  13.01  )
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7043105988535557050=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

--===============7043105988535557050==
Content-Type: text/plain

On Sat, 19 Feb 2022 14:17:54 +0100, Heiner Kallweit wrote:
> Add a YAML schema binding for TM1628 auxdisplay
> (7/11-segment LED) controller.
> 
> This patch is partially based on previous RFC work from
> Andreas Färber <afaerber@suse.de>.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  .../bindings/auxdisplay/titanmec,tm1628.yaml  | 82 +++++++++++++++++++
>  1 file changed, 82 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/auxdisplay/titanmec,tm1628.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/auxdisplay/titanmec,tm1628.yaml:12:5: [warning] wrong indentation: expected 6 but found 4 (indentation)

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/auxdisplay/titanmec,tm1628.yaml: 'maintainers' is a required property
	hint: Metaschema for devicetree binding documentation
	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/auxdisplay/titanmec,tm1628.yaml: 'additionalProperties' is a required property
	hint: A schema without a "$ref" to another schema must define all properties and use "additionalProperties"
	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
./Documentation/devicetree/bindings/auxdisplay/titanmec,tm1628.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/auxdisplay/titanmec,tm1628.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/auxdisplay/titanmec,tm1628.yaml: ignoring, error in schema: 
Documentation/devicetree/bindings/auxdisplay/titanmec,tm1628.example.dt.yaml:0:0: /example-0/spi/led-controller@0: failed to match any schema with compatible: ['titanmec,tm1628']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1595016

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.



--===============7043105988535557050==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============7043105988535557050==--
