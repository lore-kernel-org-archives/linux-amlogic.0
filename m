Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07182C4167B
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 Dec 2022 17:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3SaoqvsDNRQCHa0t0T48nDvw4JzFhKcuSiOW1mp16N8=; b=gJx186mOFd62Bb
	Pg5Q2x8crJZPe4eP1799xxpe5dBlGTSq8wKB2fMB5Y5p6MWGZQ+4P/GUkGnbM4MVvhhjDC8n1FoW1
	IXEY1CDC1hoYc2XsS7NPRO/i50n8CTfNRngFDE3jhaE1YmqRuoHIf/3Y+YNge3AzzMVD9QyXJTQh3
	tK3IwFLIoaT3Tiz+yGKpHGXvQSAVmS7x6/Q4D2LeQ+7kBFdVVVZaSEuS0EtOSAc/MvgiulBEKhVTo
	yreV9NUqyQ9c/hNIkM4YX6C4NqTklbCCy+rGEqOVIi6yC/J5ynT/LNmxl5d8NCX5Tk7ycohPoFSa3
	c+L/4HrKykmj8JGKRONQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAa3J-006lCu-Iq; Wed, 28 Dec 2022 17:17:17 +0000
Received: from mail-il1-f174.google.com ([209.85.166.174])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAa2s-006kus-Iv
	for linux-amlogic@lists.infradead.org; Wed, 28 Dec 2022 17:16:52 +0000
Received: by mail-il1-f174.google.com with SMTP id u8so8437691ilq.13
        for <linux-amlogic@lists.infradead.org>; Wed, 28 Dec 2022 09:16:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GtsNziqtosk5fGA4iQynew9CXVas2xeRqJXm3p7E/xg=;
        b=AHlm0EiItryeDT1MCkHICaXx4H1oUqwdONacuILxthNY47NrjyJWk2w3PMuzhYCbiL
         hKGrxslaRyTVZ3RpW+loiwm6gcdIo4FtF5JmZVyuckLc3hp8aW/I4N3UdpYYdoyFzEXf
         H4tLk7OQagUcOaB78kNN8jiwRzUMj4elsCXaKEAvBgvLy2fHT0tnAJiPU/G6Onv+ZGLP
         v5IWiRi1rNIVuJT+hey3f/mV+/r9d1NiyWjHeNDK4ub26q87zISWsxPdUyoeh/GR1qgM
         RzyCrYtY0NzFXddKFxqourGxOIWMTwwQBlAgEFzgaSR+aoh4NtoaNqqISkxG1kHn7wsX
         Sb4w==
X-Gm-Message-State: AFqh2krV3CSc2KiL9sCJh0YpV9iMx0rjkTHi2XcRB8p1t5UOAlKjcLba
	l1xwR6/SNtfl62TfqTm+Bw==
X-Google-Smtp-Source: AMrXdXvqv/LDMIFwAHIsqBV/YKVKwU0ASsP/hpfrlmxnnqj/Tb1UjRUMXdmHtr2gPuHf0d0UPxuEhQ==
X-Received: by 2002:a05:6e02:218d:b0:30c:2266:cfca with SMTP id j13-20020a056e02218d00b0030c2266cfcamr1939780ila.9.1672247805656;
        Wed, 28 Dec 2022 09:16:45 -0800 (PST)
Received: from robh_at_kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id f27-20020a056638329b00b003758bcba4b5sm5184514jav.153.2022.12.28.09.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 09:16:45 -0800 (PST)
Received: (nullmailer pid 1928458 invoked by uid 1000);
	Wed, 28 Dec 2022 17:16:44 -0000
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Anand Moon <linux.amoon@gmail.com>
Cc: linux-usb@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org
In-Reply-To: <20221228100321.15949-9-linux.amoon@gmail.com>
References: <20221228100321.15949-1-linux.amoon@gmail.com>
 <20221228100321.15949-9-linux.amoon@gmail.com>
Message-Id: <167224753802.1921489.221143833426610237.robh@kernel.org>
Subject: Re: [PATCH v1 08/11] dt-bindings: usb: Add binding for Via lab
 VL817Q7 hub controller
Date: Wed, 28 Dec 2022 11:16:44 -0600
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221228_091650_696428_AD529730 
X-CRM114-Status: GOOD (  13.94  )
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


On Wed, 28 Dec 2022 10:03:17 +0000, Anand Moon wrote:
> The VIA Lab VL817-Q7 is a USB 3.1 Gen 1 4-Port hub controller that
> features 4 downstream ports, an internal 5V regulator and has
> external reset pin.
> 
> Add a device tree binding for its USB protocol part.
> The internal LDO is not covered by this and can just be modelled
> as a fixed regulator.
> 
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
>  .../bindings/usb/vialab,vl817q7.yaml          | 47 +++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/vialab,vl817q7.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/vialab,vl817q7.yaml: '$id' is a required property
	hint: Metaschema for devicetree binding documentation
	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
Error: Documentation/devicetree/bindings/usb/vialab,vl817q7.example.dts:26.17-18 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:434: Documentation/devicetree/bindings/usb/vialab,vl817q7.example.dtb] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1508: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20221228100321.15949-9-linux.amoon@gmail.com

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
