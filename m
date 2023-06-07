Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D815CC7EE2E
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Jun 2023 20:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FEAEoF/5bdC52Viz5OJXDCLQV0jeyOJFgVt2EoYuZ3I=; b=0qcoiY7QEU34Co
	R1j7Zp6eAkpLnQR65IlmsmtEF6qpzUDybR5mPLJqSqhbyqPTP5PKKo9sEzzIL9vu3xK4dCopIURpa
	pBuXeCUXCpOhfTq3PROk6Hvbv5Hy3t/8PjyTFhE2sob6DDTVGrGP+M9aD09PYIBfra/ByrpsZPG3H
	gm1FblT0qixF053yPj0B0m6e8FHaUqcvqHVLuq1GfU698labeJcRvH/32P8KBePyic6OcmerQjrSz
	JttDVd0rNEMTuaRm+MTXHnbxgfPXaOWkTlv2z64Zncm1kg8cjTN1Y2+j72KzdgLgszoWroWINPW9r
	NVr9iIxbRhfEqKvHJQ8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6zuO-0079Wz-05;
	Wed, 07 Jun 2023 20:37:32 +0000
Received: from mail-io1-f46.google.com ([209.85.166.46])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6zuL-0079W1-0K;
	Wed, 07 Jun 2023 20:37:30 +0000
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-77a1cad6532so125011939f.1;
        Wed, 07 Jun 2023 13:37:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686170247; x=1688762247;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+zgUfZbj8UgwFs6zorpXckRZL+p/Z8v5AChyDByc05I=;
        b=b73Z2GsZoG2NbP3x4dBHcSI4L6EhdXDqo/yJqg9DdPE08GobOHQFGy7hllGcGT5pXc
         lNa113Z9Abr8VXAYJ6YSBzqsqR4sxCB7AwdJT4xVeEHvxTn3M2b6YbLYcNRW9a4S72fR
         NvoupxdmXTW3YQXsSlagxB6Slc4rgU1f8EWpp5++XQecSJNXLJXgDMn3gwtiL5pKfLNN
         dpgolXRwHqc4ZbSTDo9sVsQ4sEyN+//BKyrO0esLS+hWT3xnmgUzROSR1Z/fEGwwjDXk
         TNIB3IqE88HiJX3u/f6DNESGBmzz8AhqAKs5bua3O4FLW2YpQzpxlvz9of43XHMUSjSE
         owGA==
X-Gm-Message-State: AC+VfDz7ldH0xJ1LhqyERdwuq3OO1roZwZtbINkSZZRNWiANMc4rpyZS
	uVojXE/eVjdqRYQazaM7Wg==
X-Google-Smtp-Source: ACHHUZ4Gh0jUQjI7Mx3OVJyPWIKhQiVbqlhuwxeWKu1Od7VcNnyvF5RraLcM3DWUt/PYxm6w3oVW+g==
X-Received: by 2002:a6b:dd13:0:b0:76c:898c:9b10 with SMTP id f19-20020a6bdd13000000b0076c898c9b10mr8694413ioc.0.1686170246861;
        Wed, 07 Jun 2023 13:37:26 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id w7-20020a02cf87000000b00420c5d10c38sm611082jar.74.2023.06.07.13.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 13:37:25 -0700 (PDT)
Received: (nullmailer pid 3979185 invoked by uid 1000);
	Wed, 07 Jun 2023 20:37:23 -0000
Date: Wed, 7 Jun 2023 14:37:23 -0600
From: Rob Herring <robh@kernel.org>
To: Dmitry Rokosov <ddrokosov@sberdevices.ru>
Cc: khilman@baylibre.com, jian.hu@amlogic.com, krzysztof.kozlowski+dt@linaro.org, sboyd@kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, martin.blumenstingl@googlemail.com, jbrunet@baylibre.com, linux-clk@vger.kernel.org, robh+dt@kernel.org, neil.armstrong@linaro.org, kernel@sberdevices.ru, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, rockosov@gmail.com, mturquette@baylibre.com
Subject: Re: [PATCH v16 5/6] dt-bindings: clock: meson: add A1 Peripherals
 clock controller bindings
Message-ID: <168617024273.3979125.14701905013273806999.robh@kernel.org>
References: <20230523135351.19133-1-ddrokosov@sberdevices.ru>
 <20230523135351.19133-6-ddrokosov@sberdevices.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230523135351.19133-6-ddrokosov@sberdevices.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_133729_160504_8E4B778E 
X-CRM114-Status: GOOD (  10.03  )
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


On Tue, 23 May 2023 16:53:50 +0300, Dmitry Rokosov wrote:
> Add documentation and dt bindings for the Amlogic A1 Peripherals clock
> controller.
> A1 PLL clock controller has references to A1 Peripherals clock
> controller objects, so reflect them in the schema.
> 
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
> ---
>  .../clock/amlogic,a1-peripherals-clkc.yaml    |  73 +++++++++++
>  .../bindings/clock/amlogic,a1-pll-clkc.yaml   |   5 +-
>  .../clock/amlogic,a1-peripherals-clkc.h       | 115 ++++++++++++++++++
>  3 files changed, 191 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,a1-peripherals-clkc.yaml
>  create mode 100644 include/dt-bindings/clock/amlogic,a1-peripherals-clkc.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
