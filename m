Return-Path: <SRS0=R/Kg=GD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A33DC433E0
	for <linux-amlogic@archiver.kernel.org>; Thu, 31 Dec 2020 15:35:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A46120798
	for <linux-amlogic@archiver.kernel.org>; Thu, 31 Dec 2020 15:35:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A46120798
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:References:In-Reply-To:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8yONzhQuTem9b5CrDy2MrMvUufvPtoQw0E9eSgoiUvw=; b=CsPYZ36ps3Jr9N9t7zLIaZEoZM
	pOraznboSEPrELK+f9MTQvo6czl7PrztYh3wnV6TxEmijAybgVQYAtZfjcgl87DX4PdNp/YsjEeB1
	qTyXYBP+/mx/X6O3oeLqxMPvvLy80KrLM//4jT89655Bhz6nm5Cy78r1+RucsjK/1qHjFQk+q593E
	cca4H4vvNHYoa1+fgog/BzgEiWPIDSSUmiyIUiLbXfQKHJ3Zn6ZGlN2nZibnt0rIqNT9mhUeeRaTo
	C3tDpVDzEl+p04yIcuts58x4xEIVb0TNAz4kuPmwhnC9NcXlGt32u6k3R0vtcLINHgppHBwvcLrxV
	he9r2BHg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kuzyd-0000KS-W9; Thu, 31 Dec 2020 15:35:00 +0000
Received: from mail-ot1-f43.google.com ([209.85.210.43])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kuzyY-0000JY-CN; Thu, 31 Dec 2020 15:34:55 +0000
Received: by mail-ot1-f43.google.com with SMTP id a109so18261188otc.1;
 Thu, 31 Dec 2020 07:34:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=U5+TgRxBr8Fo4F24dxi/XK3rCsce2994tILTdIkxtms=;
 b=P6YfHFkMh+exTY7jsB9fAmrVWK8DhXIqNLHFTde40GZd7+/ahG5VU5zz8Syo9uH/Ps
 eVdN9g2DM2r6i7Bs/4B6/BQpB4Z2CawWDIh5CntrAoTuvquiWvjxiNau54JsAzgCpZGd
 29/4LZvm4O5CxilbOStwQ4B8B8CI/wZiyunCxd6El/6dcyjcTcSfSrMKbrThYLL9uys1
 Fk+D7Q65mZX7741mIlGV60mpVwANHTKuP6FAMdogJOWHrrJe63GUeEE4lC0ZDq/yx2tT
 Ttmt/dhw1vLOCwmIRWqFhm0ROaAUizvvAqP3VdLWRZq/KyphOPFOv+y6pWFxfp7+JVqi
 7D+A==
X-Gm-Message-State: AOAM532ePBaAa5MH6Hn0VCeomvtNwnwPJbmDWC9QepgvIfJxinr9MIAu
 B/MUn+kJTbJSX1hpSexCeg==
X-Google-Smtp-Source: ABdhPJwueo20TglGcEsIU4ebdW4CqO2h44on2UHrkgjVWDuMsGX+RxqetVDTW5S7wZkG+1Pb4x+4/w==
X-Received: by 2002:a9d:5d02:: with SMTP id b2mr41960733oti.148.1609428892020; 
 Thu, 31 Dec 2020 07:34:52 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id h30sm10449278ooi.12.2020.12.31.07.34.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Dec 2020 07:34:50 -0800 (PST)
Received: (nullmailer pid 1828652 invoked by uid 1000);
 Thu, 31 Dec 2020 15:34:48 -0000
From: Rob Herring <robh@kernel.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
In-Reply-To: <20201230012724.1326156-3-martin.blumenstingl@googlemail.com>
References: <20201230012724.1326156-1-martin.blumenstingl@googlemail.com>
 <20201230012724.1326156-3-martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 2/5] dt-bindings: Amlogic: add the documentation for the
 SECBUS2 registers
Date: Thu, 31 Dec 2020 08:34:48 -0700
Message-Id: <1609428888.809731.1828651.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201231_103454_436222_251D2B18 
X-CRM114-Status: GOOD (  14.04  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: ohad@wizery.com, devicetree@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 bjorn.andersson@linaro.org, robh+dt@kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, 30 Dec 2020 02:27:21 +0100, Martin Blumenstingl wrote:
> The Meson8/Meson8b/Meson8m2 SoCs have a register bank called SECBUS2 which
> contains registers for various IP blocks such as pin-controller bits for
> the BSD_EN and TEST_N GPIOs as well as some AO ARC core control bits.
> The registers can be accessed directly when not running in "secure mode".
> When "secure mode" is enabled then these registers have to be accessed
> through secure monitor calls.
> 
> So far these SoCs are always known to boot in "non-secure mode".
> Add a binding documentation using syscon (as these registers are shared
> across different IPs) for the SECBUS2 registers.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  .../arm/amlogic/amlogic,meson-mx-secbus2.yaml | 53 +++++++++++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-mx-secbus2.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-mx-secbus2.yaml:35:9: [warning] wrong indentation: expected 10 but found 8 (indentation)

dtschema/dtc warnings/errors:

See https://patchwork.ozlabs.org/patch/1421302

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
