Return-Path: <SRS0=R/Kg=GD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5DB0C433DB
	for <linux-amlogic@archiver.kernel.org>; Thu, 31 Dec 2020 15:35:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9734420798
	for <linux-amlogic@archiver.kernel.org>; Thu, 31 Dec 2020 15:35:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9734420798
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:References:In-Reply-To:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DwgLRudMsxnQjRdztR/6RfX0nXgsG7IOj3bRszdd1Ow=; b=unG628KTxi5EPwN5bXKsmWBtc8
	Z3SHaPjCpuj7DpckEbTBv7YT4gv0eVEFTJ2UY3wjiizPtkBoW9tMUYtghIT6tmOKF1OxsxGx3r1VY
	fA6fIEt9HWPmugKj7wIaEsbjw37QgeRxKMENDtr5yfpUYLAkX4SwizHosQhSknYaUTR57//4QSp+s
	NZgHZuTOoRzl6x1jZypatJNxupMXCSgnIBgks4UnOHQl41/qliQfDxo6qHgcY+24mtJb3n6zWt2rY
	OoYTAKdI1L+lMZvIpFW5Yx5CNzE5d4hJtNJMLXMS4x5iUp8YcYZGR3gFLdV2JzB+OX1l+7yP1yJij
	YFCwMYeQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kuzym-0000La-WB; Thu, 31 Dec 2020 15:35:09 +0000
Received: from mail-ot1-f53.google.com ([209.85.210.53])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kuzyi-0000Ks-Le; Thu, 31 Dec 2020 15:35:05 +0000
Received: by mail-ot1-f53.google.com with SMTP id x13so18244562oto.8;
 Thu, 31 Dec 2020 07:35:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=MXM5wnzSSoRxNoAr4MlvHobyUhxKc2TuluVu9Oqp3J8=;
 b=KC1v+oDgDhHsyH40lGjh68eX2IOYAVCz3+GAUEo+UcIQLZkQ99xzI0HFVeIy1hgWMn
 KdZiBG4HSTUX/OTUsD7FfWQwpNYjJ5tagSz/Ok0myoG5bFJDYrLuwth+WJFvVLw+CcZV
 iQll47lxAj+un37nNAdInFW0LB0VQI9XCTJZHKC+8uJYinHmT11u6Pa8/uoL+25HULdD
 7qLDSPRL/RBx/G3SS2IPqjnVoFc8rMj/NWuodLHpVnTqVzUig7pot4jsgeYKqFsr2AJ2
 g7xHHuBHwIPRZ20ncxQG4o1XIR61xzNw3Ym4JN2qAB04bZUcDJftoAHG6FbTMCTYls4b
 1GTw==
X-Gm-Message-State: AOAM530u6Pg02ho0yAJ4Yfy/HOy9Zb0G3JBSp2mIVRUhTQKaAZjKrwFP
 Fo6V+d5jUK0cmppFAXLODg==
X-Google-Smtp-Source: ABdhPJw9nMyGpYq1U6APb1OBYayfFcOMpbeJiuknRQSDU+f84jr6ltJvYGsCBL1BLVLandI7LxcYNg==
X-Received: by 2002:a05:6830:1551:: with SMTP id
 l17mr43541058otp.309.1609428903438; 
 Thu, 31 Dec 2020 07:35:03 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id e10sm11215889otl.38.2020.12.31.07.35.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Dec 2020 07:35:02 -0800 (PST)
Received: (nullmailer pid 1828655 invoked by uid 1000);
 Thu, 31 Dec 2020 15:34:48 -0000
From: Rob Herring <robh@kernel.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
In-Reply-To: <20201230012724.1326156-4-martin.blumenstingl@googlemail.com>
References: <20201230012724.1326156-1-martin.blumenstingl@googlemail.com>
 <20201230012724.1326156-4-martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 3/5] dt-bindings: remoteproc: Add the documentation for
 Meson AO ARC rproc
Date: Thu, 31 Dec 2020 08:34:48 -0700
Message-Id: <1609428888.822121.1828654.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201231_103505_006234_32F869C5 
X-CRM114-Status: GOOD (  10.57  )
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

On Wed, 30 Dec 2020 02:27:22 +0100, Martin Blumenstingl wrote:
> Amlogic Meson6, Meson8, Meson8b and Meson8m2 SoCs embed an ARC EM4
> controller for always-on operations, typically used for managing system
> suspend.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  .../remoteproc/amlogic,meson-mx-ao-arc.yaml   | 87 +++++++++++++++++++
>  1 file changed, 87 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/amlogic,meson-mx-ao-arc.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/remoteproc/amlogic,meson-mx-ao-arc.yaml:23:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
./Documentation/devicetree/bindings/remoteproc/amlogic,meson-mx-ao-arc.yaml:45:6: [warning] wrong indentation: expected 4 but found 5 (indentation)

dtschema/dtc warnings/errors:

See https://patchwork.ozlabs.org/patch/1421301

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
