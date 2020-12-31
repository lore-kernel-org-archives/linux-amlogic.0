Return-Path: <SRS0=R/Kg=GD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B8C6C433E0
	for <linux-amlogic@archiver.kernel.org>; Thu, 31 Dec 2020 00:21:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93DAD207AB
	for <linux-amlogic@archiver.kernel.org>; Thu, 31 Dec 2020 00:21:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 93DAD207AB
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kQDZyjPFMqUIz43sHuvIVkeZnOvXVknF9yZVMEHjMqI=; b=kV8E4U1IGqiOiAr8E6A8qZDtu
	3V3nP9tysX5R+yiL6rz93pXaYR4Qu2kyiKba5bWW99wfhxOEZC730X6Sw53rwIvVCER+01Q9Ubwyg
	KnAmq4H/dVdf8Z1V91w4b6pP3E6mW8x8mf8zDnMLfk+XM2uTN/Y+tcSBdYLvcvVJIy4h3Pm/Gj+Qg
	n/VdMRlXIAVn+QR5CY5cjFFKzh9+udmxmMfMHRD5dmY8r3GFbpbulEOkfawTZys31/9vGfkpp/90F
	WAz0vp0/2iOzaEJPCgEHePTN9DrNASY/IUFosiIlNoNVii0gdlluW5EDvtdRjYaLRhoC21Lk3MzIa
	rcF7bPVNA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kuliG-0004EF-Cb; Thu, 31 Dec 2020 00:21:08 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kuliC-0004Dc-Ez; Thu, 31 Dec 2020 00:21:05 +0000
Received: by mail-ej1-x62f.google.com with SMTP id ga15so23782820ejb.4;
 Wed, 30 Dec 2020 16:21:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BUPikVF2YhEEKQI5Y2qiZcki+hY/VRakhQdbEx50LzY=;
 b=eCfTfvnTSoETeoHWDtlPFBxXiFMqw5JyKtkKrysmrUVQZ/z6d6a68qEeVM2gJ0d2Ec
 E3ekMZFUmWM9e0d3vypsF7LsLbyLNfkoDpYpRXqwUjjPY03cZH/OwBOLC29GW/p2PlGR
 DJPTyHZsd3WO/5b7R4nYGizIEiOFN6QHIbRJfaWV/bj7vUw/lYmQnnEr8WSUyfyuwxRR
 xqEVvKb78sd0cU+m7jGAJ4s0EukY1JzsYhNWbJzXqGdujJzYG5fprZOvWVfcBuMZbLXT
 tGGH6jGEKpetHjLt4Xw27vG5dsOiF8/z7U/VSUkcpV0HAR0vxDbXxsFRNVAC8Z3jSk0S
 /7Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BUPikVF2YhEEKQI5Y2qiZcki+hY/VRakhQdbEx50LzY=;
 b=pgwGD+fXICJti3Z7D7iKzRoxj4qpCJuvpnlMfKd4Z2Q++gRL8pfHzxNmWm31m40d0/
 O+eZMt5s4ZnUYoOv/uhmUWNW5YvhvtTdGhsq9+Jy3bVLmQqPfTUchOtDdDh8LptIJoBq
 mHXuZTUl8QxddNO6y1Dlnuj78JA1NXe89srKaGpS/1dTJHwu5YecxQzWrylGJb82eRei
 ht/BYIEBvCSqNsDe+RQPWoLlTluo9ePJiisGEv3NKM7wARNndquC7JKK+cdhrjj37wL/
 fFaGslFuNoHxVfmEYcif9m1+jOCwl+CQvwY6gybzG6kov4/CmsiFsMZPWP6vdxE0iTN/
 GOqQ==
X-Gm-Message-State: AOAM531vzZ4JSZtZDTILQ9O9mbnMWZSz4SkUnffVzIG0+0DNXCQgg6p2
 /vEmfTxYaSdPO4kDVHIh46r1AZMxPEDfILivwiM=
X-Google-Smtp-Source: ABdhPJwPCA51yecoVh1NsrourKwLdniqdG8nHLj2lo69ygPJMIxAVscbGV6Z8ZEgziKSsvpIRq8AzfyWFG5HoYvhEG8=
X-Received: by 2002:a17:906:4050:: with SMTP id
 y16mr49858880ejj.537.1609374062329; 
 Wed, 30 Dec 2020 16:21:02 -0800 (PST)
MIME-Version: 1.0
References: <20201230103729.2272-1-christianshewitt@gmail.com>
 <20201230103729.2272-2-christianshewitt@gmail.com>
In-Reply-To: <20201230103729.2272-2-christianshewitt@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 31 Dec 2020 01:20:51 +0100
Message-ID: <CAFBinCA91_wZ9r9v2HyvU0sX2smYdsijECim94WjRwpqu1qP4A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: amlogic: add support for the
 Beelink GS-King-X
To: Christian Hewitt <christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201230_192104_521861_AD953D25 
X-CRM114-Status: UNSURE (   9.78  )
X-CRM114-Notice: Please train this message.
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

On Wed, Dec 30, 2020 at 11:38 AM Christian Hewitt
<christianshewitt@gmail.com> wrote:
>
> The Shenzen AZW (Beelink) GS-King-X is based on the Amlogic W400 reference
> board with an S922X-H chip.
>
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
