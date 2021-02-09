Return-Path: <SRS0=j33G=HL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04ECCC433E6
	for <linux-amlogic@archiver.kernel.org>; Tue,  9 Feb 2021 20:58:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60E5164E5A
	for <linux-amlogic@archiver.kernel.org>; Tue,  9 Feb 2021 20:58:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 60E5164E5A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3qMxcbdNj0RTvIXm4owORIdQnWQ+mRnwcACDZujHnNg=; b=Y1BjXtjQU7bASoVdUyRcKefjj
	+Y+34qr9798mK3F5SE4SPVf6wjKOD8ChfdT+2DNb1O/66+FlH0J1BrS2oLNfmCk/d10qENBjE4d4Q
	WICmsFqYwT3Avw2Ghacoq7lJcT4NvE4v3eCAwPSnw5T5QcGu502/vu9RwCPAFth/hAHEhq0PuxWG/
	zhPe6AzdFWR/gbyRnJHS85VEPWTuamgCJAaoZYJ+LCg4xu8ysBc/b901g1dD5WwuTYD4LTm7zFpT1
	EV/2wcWqnrAwF2KKtEqCzoLy7GoL4gC2Tp8OLVJL1IxVuuusq5x5hbOUCntQ0ps/IYopkOM2Q7Bk6
	XO5RS9I8w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9a53-0007eh-Ms; Tue, 09 Feb 2021 20:57:53 +0000
Received: from mail-ot1-f51.google.com ([209.85.210.51])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9a4y-0007e2-V0; Tue, 09 Feb 2021 20:57:49 +0000
Received: by mail-ot1-f51.google.com with SMTP id i20so18803317otl.7;
 Tue, 09 Feb 2021 12:57:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rRfkDWuhdRzZoOribuVD2PezXOJHDbSyE2BVdAF+5Vw=;
 b=NHXi6d9ufs7aWM0Tz08S2JEs9z3ACdJJT11B/Fh376D2f3HF7jXhZJlO0wlk3jbPUR
 K6/vE0LmBM+s4Rxz5vyWJdPvWpjz3De6Dy/5hz07piuxow3t6JXX4URdRul9qzMmFvdp
 UqebSysXBOz2ff2YmWM+ylHlq3bOXSLPWzRS1qwvykPvfGqcXMNMP+qsfmZa+2e6gDTo
 9PqzczHqEG/03KQ+qSNyYbB9Vv2kNvruC63o5RSn+VKVeA1/pQdjUdmNPpqeLAHZ4+GP
 Z7ALbUi0k2eFxZ/h9tqeg2qqrYtAfHoXt9gGbWOmCGh3aTJuSg3fjsGaA6BTax7kjGv0
 SyqQ==
X-Gm-Message-State: AOAM531CO6ek1PiBpZILmS/Tsr9qdo3A36bmkbosUalCH3sKjYrRe6vt
 0Bg3Hwrye+QFa0DSpiosJg==
X-Google-Smtp-Source: ABdhPJwYi62y19ckUjwSs1SUPVJAmhbSWiMZlMABR5E1y6iKKlzqdx86uZroADjTsQo3imS9ZrWaHg==
X-Received: by 2002:a05:6830:1153:: with SMTP id
 x19mr7173363otq.14.1612904268181; 
 Tue, 09 Feb 2021 12:57:48 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id w134sm1513227oia.56.2021.02.09.12.57.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 12:57:46 -0800 (PST)
Received: (nullmailer pid 168561 invoked by uid 1000);
 Tue, 09 Feb 2021 20:57:45 -0000
Date: Tue, 9 Feb 2021 14:57:45 -0600
From: Rob Herring <robh@kernel.org>
To: Christian Hewitt <christianshewitt@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: arm: amlogic: add support for the Minix
 NEO U9-H
Message-ID: <20210209205745.GA168506@robh.at.kernel.org>
References: <20210201210508.1528-1-christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210201210508.1528-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_155749_021081_3D97F62A 
X-CRM114-Status: GOOD (  11.90  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, 01 Feb 2021 21:05:07 +0000, Christian Hewitt wrote:
> The Minix NEO U9-H is a small form-factor Android STB based on the
> Amlogic Q200 reference board with an S912-H chip.
> 
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
