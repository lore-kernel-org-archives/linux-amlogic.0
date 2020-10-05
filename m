Return-Path: <SRS0=hoO3=DM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80516C4363A
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Oct 2020 13:54:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DC6D20774
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Oct 2020 13:54:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gOlK9Z0F"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2DC6D20774
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hLBbmHxdI2wBlwLcYtfkaOmSx2Oazk1vHqMw6SbfPbM=; b=gOlK9Z0FTh3xaxWMsUOu77KJH
	Y7B39+OQ+RMS5eLRj4sNWzNkRXJKkYH2qnI5rjJ2X5Yd4Kpoy5+r3/fn4HJcDEHI8dx6KzI9g+9Nm
	zU1WnMH4NMGLgOnMffUhZAcyFtVmXiF9Zn/TZOuEmaLJ6/0C1BwQbUF/GCTwlVw/ZfKRwtLxWD1QP
	O777LirrfJ4pWuKJh2oUddyZJ7zV4lASjgo3l0cXkJcIpbL2YbmlGs5hNs00lZM4hHE/EeHIAfCk4
	wHbyEnGk5vL70SDB2EM70aAnGSXR+ovU5KFPjyzVgs+ttIP9/AqNIyxoId6pPmf6y0z/GU41fAnyM
	GrFev1PEw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPQwr-0005KC-3Z; Mon, 05 Oct 2020 13:54:41 +0000
Received: from mail-ot1-f65.google.com ([209.85.210.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPQwn-0005Jd-Sm; Mon, 05 Oct 2020 13:54:39 +0000
Received: by mail-ot1-f65.google.com with SMTP id f10so125028otb.6;
 Mon, 05 Oct 2020 06:54:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ywT1ID75hKID+KWrvt8jbDCqAy1lsMMxjENEdx2Y1RY=;
 b=hOnBxeTtJk02xzAvG4zSeutqqeqY4nvnLci8Ic/kdRyjLlZy8TiUnn2tIF47x81Va5
 9J0T8HSxlHkNIJIfn8JEGUIc+6dlPKwvP5l5YxoJePT/4FeWh2RdKm/0F2jwpbo1ARGk
 U+UsIHNFseyQdyy6FL28EeF0iSGvCCH0FrS9a25fkAcjt691oDw267PkXynHZRpHdYH3
 UsBKbk/HFg11cNLpfVcag22m5AsiOqy7+FWI6K1RP+duyxt581M1kAlEh3aWc4IZzMkQ
 NKF8yOUb4Zzk7by0l1Xq2VFFUvERWQSEAyqNt0WhAQoNWd/K6tEYtJfuxILUWG1+TSoW
 No0Q==
X-Gm-Message-State: AOAM5333mx26l398l8yxXl4EK+ngh3zvpIOiYfVnl95ZVGrfuCIkZisW
 AXJWcASUQG92zMVjyk+WhQ==
X-Google-Smtp-Source: ABdhPJy27lxmlMYfHdDW0sQLWWCljDxFmokHsIy9JCpxiH5FWa61WQb3hBS728MrEMCDCS4Vzx1c2A==
X-Received: by 2002:a05:6830:30a8:: with SMTP id
 g8mr10929780ots.370.1601906077165; 
 Mon, 05 Oct 2020 06:54:37 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id x18sm1477902otq.61.2020.10.05.06.54.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Oct 2020 06:54:36 -0700 (PDT)
Received: (nullmailer pid 86477 invoked by uid 1000);
 Mon, 05 Oct 2020 13:54:35 -0000
Date: Mon, 5 Oct 2020 08:54:35 -0500
From: Rob Herring <robh@kernel.org>
To: Alexander Dahl <post@lespocky.de>
Subject: Re: [PATCH v6 2/7] dt-bindings: leds: Convert pwm to yaml
Message-ID: <20201005135435.GA86443@bogus>
References: <20200930234637.7573-1-post@lespocky.de>
 <20200930234637.7573-3-post@lespocky.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200930234637.7573-3-post@lespocky.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201005_095437_938026_1CB7E1CA 
X-CRM114-Status: GOOD (  15.87  )
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, Alexander Dahl <ada@thorsis.com>,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Rob Herring <robh+dt@kernel.org>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-leds@vger.kernel.org,
 Dan Murphy <dmurphy@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, 01 Oct 2020 01:46:32 +0200, Alexander Dahl wrote:
> The example was adapted in the following ways:
> 
> - make use of the now supported 'function' and 'color' properties
> - remove pwm nodes, those are documented elsewhere
> - tweake node names to be matched by new dtschema rules
> 
> License was discussed with the original author.
> 
> Suggested-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Signed-off-by: Alexander Dahl <post@lespocky.de>
> Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
> ---
> 
> Notes:
>     v5 -> v6:
>       * removed pwm nodes from example (Rob)
>       * renamed led-controller node in example (Rob)
> 
>     v4 -> v5:
>       * updated based on feedback by Rob Herring
>       * removed Acked-by
> 
>     v3 -> v4:
>       * added Cc to original author of the binding
> 
>     v2 -> v3:
>       * changed license identifier to recommended one
>       * added Acked-by
> 
>     v2:
>       * added this patch to series (Suggested-by: Jacek Anaszewski)
> 
>  .../devicetree/bindings/leds/leds-pwm.txt     | 50 -------------
>  .../devicetree/bindings/leds/leds-pwm.yaml    | 70 +++++++++++++++++++
>  2 files changed, 70 insertions(+), 50 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/leds/leds-pwm.txt
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-pwm.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
