Return-Path: <SRS0=5e44=GO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49389C433DB
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Jan 2021 22:23:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7ADF22D07
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Jan 2021 22:23:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C7ADF22D07
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=v2ux7JkNJO9S/Q2I0mrhLMGWqIN3CBL3zRfSlz9AyBk=; b=VhAK1dVPydV4R0bOHsAijYYSs
	28GC5O4iHsF7ncgGG+zDbrMM1dYPKCZnYOHje+ID60jg7m0YJtAK9mvdIdj6NM9QdlKhzafUA2Zw4
	HHpJ8a3Bxfao9Xk4IPSA88IFcgX9uWxRuOc5C+VO1NZmvLCdG8qN+LM4hGGmqUvXg8mJzXfWh6ehg
	SfyYnmAPg8CfbD432quEzoAEZDD2isdmdEMadSMYBOyh+qFbuKjQiaySO8GhfrPSySRFpqf/PvBWI
	wF80fMppvMI1e4prag2Eute6HFHixBCnegBGB/Lxa7Cts5qeyh9XvAmdTJbPXn5yJ5NEw/CywEKW4
	OYsv6IR1A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kz5b9-0004pI-0b; Mon, 11 Jan 2021 22:23:39 +0000
Received: from mail-oi1-f171.google.com ([209.85.167.171])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kz5b0-0004mN-DH; Mon, 11 Jan 2021 22:23:31 +0000
Received: by mail-oi1-f171.google.com with SMTP id d189so244683oig.11;
 Mon, 11 Jan 2021 14:23:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WiyNKAaKhfGeo/+im//G5bEXWZdmZHXGJONjdyxAJB8=;
 b=CUcPZdNgAJOKUldG53LMfEKEKSSY0vC7SJErRdmPyH9VmRTelsxhG7InlUw69qE64Z
 5tqwTKClhAWYWj6zjsGxDbvYj0eV0VWQRAQ9bUnzcoM9cp6v3ZtIW3bFSYtD7J7bf6N/
 eWzcQQI9ot2lkaVoG4d+yxRnjQvnkvigAJdx/cYzE6aRSdca0NZjgCjB2RNrfYFjJRqD
 yIMTHOCI0yW3pot3OQXL4ejMmhdXFwNM6k34fBqDCyM4/NzCkXWIbVFQoMT6fTdsqwCN
 nIjeQnPZINu36lKLD66UpIYpwMXQ3/X2cmHMNrcbpyX49lXdbGAb8oFpGA0b4Q5r5HMi
 de6A==
X-Gm-Message-State: AOAM533i5lpQ2HWhTmmOncGGhlVU0uKgy+NptvUrIlkcs1WQniaTJW0R
 afEXzzYksCYOEEGj//1g/w==
X-Google-Smtp-Source: ABdhPJzdWiylcXBZoVpmAKCsvmzMnBvu5rY8IizYPMJ/K8wgEjBiauX0Gov3buq48p/d+q9iykuJqQ==
X-Received: by 2002:aca:4b16:: with SMTP id y22mr590514oia.148.1610403808918; 
 Mon, 11 Jan 2021 14:23:28 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id i24sm182121oot.42.2021.01.11.14.23.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 14:23:28 -0800 (PST)
Received: (nullmailer pid 3165463 invoked by uid 1000);
 Mon, 11 Jan 2021 22:23:26 -0000
Date: Mon, 11 Jan 2021 16:23:26 -0600
From: Rob Herring <robh@kernel.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: sram: Add compatible strings for the
 Meson AO ARC SRAM
Message-ID: <20210111222326.GA3165417@robh.at.kernel.org>
References: <20210102205904.2691120-1-martin.blumenstingl@googlemail.com>
 <20210102205904.2691120-2-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210102205904.2691120-2-martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210111_172330_537775_716FCD63 
X-CRM114-Status: GOOD (  11.27  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sat, 02 Jan 2021 21:59:00 +0100, Martin Blumenstingl wrote:
> Amlogic Meson8, Meson8b and Meson8m2 SoCs embed an ARC EM4 core
> typically used for managing system suspend. A section of the SoCs SRAM
> is mapped as memory for this ARC core. Add new compatible strings for
> the SRAM section for the ARC core memory.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  Documentation/devicetree/bindings/sram/sram.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
