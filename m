Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E57EAC001DF
	for <linux-amlogic@archiver.kernel.org>; Mon, 31 Jul 2023 09:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YeHLp43ULFBDfTtQ0EHuOJOC0xe/LMQhF7ifFNKSig4=; b=OlyJroR94s8Cxx
	lkCMOebT4pNwpWd17l4SxqNCtDvf6OCqFYrAYWgqtaWfTcikT3awdUsu8kUc4U2M4314M2rH1AUoT
	Ofyr7DBgyIDQlM3/0we4NsGSEOmPe5y7wKBUcIA1zoqffln0XILOc6knV1LB75JXzIraPl1668ECR
	B+/28CYjk8OJM0DUQOIvT6e+safQj3X3YXF7v9tgfD69Mk917B6ieKnT4IsVRSIdIcp7B9cMMVh+7
	e8iB74Mt48wLPRbi9Kp2ulRs5srbMeST6p1eH8qEROK6ochP1EC5RA7iex0njVXQmonLd7UyCgVM1
	rntwbmcf2OS081Y6+EKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQPeP-00Etzp-2o;
	Mon, 31 Jul 2023 09:57:17 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQPeM-00EtnT-2g
	for linux-amlogic@lists.infradead.org;
	Mon, 31 Jul 2023 09:57:16 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-31751d7d96eso3575266f8f.1
        for <linux-amlogic@lists.infradead.org>; Mon, 31 Jul 2023 02:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690797431; x=1691402231;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NzAUT/ZDau86t8TFCapt9e4TK2GEcNG0/asajNbvhAY=;
        b=erfQOYF/A3fjkJkXyUaO1epcPX2oVaro2+DPnPMOKL5pWklugRjasqvnVdZ+bCY/Xm
         l9AnlBv/HYFrYMznWluqDH2YO7+2gGiyDQ2Om1NhlHwUqWF0za2bMMxyoX9JhCAc/mcN
         AnqNrZcdA422DZR3rX66O8hAp/wbe7XIH2cDCyqSGElxWc4X+etS1dmJHjqbJF0Ylf4k
         c0IjGLqtIojuimzukEi+Cnhz/2p6u6SDgH0VoP8i3NaEuCBEGTceY8DdMoObzhjC8CPF
         grI6B0Kzo8bZQ1uLTx85urj8p72yAjXNIJwmYWM/0aUzct49w7Y5zdEMLwk43iPiRDLA
         eFpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690797431; x=1691402231;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NzAUT/ZDau86t8TFCapt9e4TK2GEcNG0/asajNbvhAY=;
        b=DcSLOISGBlfot6AtIGzoSHcmh+he3PKJqUwPNM0+vfZsJd0InElYqvX4ruHJ0Q/A5x
         I55yKaiHIEYdRd0/wk/Vg2V8PTBtSwBwJi+z91ci1r/T0yHedJcnZr3SqmC2ThwzjCXD
         XEw0nMpClwdrsxvQkAWW1GE3XlBohgT1sJx/XsJXDgkCbuxXWROy8DD3KOu6FMU3OHyu
         CK4+txFEEDLE+UUyPWh9EX2Etbf1J2BHnyTQHeGrn7Atko8F5MolLfTtcqX/gJNCNUJq
         Xd/AGax3x0wTOERY575+KombQh0tafmuSCkC67y7vs96Lvr7y/E65N+mB9BW7ceVHHKr
         AQuQ==
X-Gm-Message-State: ABy/qLaV60NbXuYjaaXr+Qftq/yK1bXCVB5GE5na9tjPGls1zceai3WI
	nSq0YRvqG4nEkMtaE3bah0bTUdcMb4R7+M7YEVxFS0S+
X-Google-Smtp-Source: APBJJlGZSmVvYv3ec6G3JAUBNm4NksXaZ+h1NntarAk2oAYLTlrujbke1RIMcvjHGtocXLeP8Hwjnw==
X-Received: by 2002:a5d:5101:0:b0:317:5af3:caa4 with SMTP id s1-20020a5d5101000000b003175af3caa4mr6521173wrt.38.1690797431128;
        Mon, 31 Jul 2023 02:57:11 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id s7-20020adff807000000b00313e2abfb8dsm12506312wrp.92.2023.07.31.02.57.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 02:57:10 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20230714175124.4066972-1-robh@kernel.org>
References: <20230714175124.4066972-1-robh@kernel.org>
Subject: Re: [PATCH] soc: amlogic: Explicitly include correct DT includes
Message-Id: <169079743023.199115.14539344901147605814.b4-ty@linaro.org>
Date: Mon, 31 Jul 2023 11:57:10 +0200
MIME-Version: 1.0
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_025714_869956_E1250C97 
X-CRM114-Status: GOOD (  11.55  )
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

Hi,

On Fri, 14 Jul 2023 11:51:23 -0600, Rob Herring wrote:
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.6/drivers)

[1/1] soc: amlogic: Explicitly include correct DT includes
      https://git.kernel.org/amlogic/c/83147971318a3adeb48e75a61722b0f2a60a4b9a

These changes has been applied on the intermediate git tree [1].

The v6.6/drivers branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
