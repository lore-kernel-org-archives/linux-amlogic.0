Return-Path: <SRS0=zLcP=25=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24E6EC282DD
	for <linux-amlogic@archiver.kernel.org>; Wed,  8 Jan 2020 19:02:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB3EA20705
	for <linux-amlogic@archiver.kernel.org>; Wed,  8 Jan 2020 19:02:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mIfkIb82";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="daAxOYfB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB3EA20705
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jgjez+AdBBJwVBN30lbM81pSNPjcQ6vz3zXzuLgp/vc=; b=mIfkIb82o8KJrX
	fFpGZSKxcn5afVpzVUgDths7MGIl/cR5tMhETy4EvJqTjzgYOps9PtlpWe4R04uXrpqo1XhuTfGlp
	W/rAZjjkOgJ1vUsm+DMbrvUSoDEeW81yX0zO8WMCGDoIJlbFSwETrekQdp1G+zoRFFHmzg8CxVpgY
	imJQ2UQrCSFfGJNsIxSZW0elyvmQgS10A1N8NrGMkxs+jJvHFmBKOOo9WTwfOiXRp0puw82HAn+Yg
	dQ9jIMvztnoIBocL2xV3SbJei1sUM3f0YOFGOR/ofqrFPX47IXVY98zBCf7rDynSQ5vCFop6TUlIX
	taxXFkEMYc3T6osvS2qQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipGaq-00052H-KM; Wed, 08 Jan 2020 19:02:12 +0000
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipGa8-0004O5-Tw
 for linux-amlogic@lists.infradead.org; Wed, 08 Jan 2020 19:01:32 +0000
Received: by mail-pj1-x1044.google.com with SMTP id s7so23159pjc.0
 for <linux-amlogic@lists.infradead.org>; Wed, 08 Jan 2020 11:01:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=+JYKs8IBCn+dDMZJfNg8HbS7zBGKMw04iMj1o0iHpZw=;
 b=daAxOYfB/C6ZvBYmYDxatyUSCRJpDXZuC6cvFHZXVHZR+k2InB/TQF45/MbsM8t+RZ
 jAoffKmaXBtl/sonYDuNalnkTfvVzW/P0s3K4ldjdajpRlKaufKaOW78Duq7Pji4/+Gl
 bGOWnS+27/G55F1bvWNfnqgPX5C1D2222ojSeMI1C3fPYZ68Wq970gu86tFI4mcEjc9R
 mHzd45AnODBO1ZqeToWiLcAD3MpGV1hYBNVKCbVOd2yZWNYJdsM7jl95UFwdolN1BIto
 vfGKAQ9j7COtPMODwCbCI6GBHTHW8OfTeogKLBu3vHTo3hr4S2RvF+aZzcbCAgJQXzph
 Ukcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=+JYKs8IBCn+dDMZJfNg8HbS7zBGKMw04iMj1o0iHpZw=;
 b=YDAT1VhP514MlwkDZlivzVtPZyDDpRCnJ3L8t2w0mBefAB70q2cbWJiN2bdCDY94vY
 ffoqihcZtmRLwOpRvadNxipPjNKgSekwgV5MS1SDYswLfGdotKfWNE+0VscPbWjxaQFB
 ByTlXN6AYMEHDARCMrYgUEQ05Cxv8CLmhwLMB176E4omI9M3ZB7hr23cdeQiXHMDtBD/
 3Dg+L6+CYZCLENJy+A29AGS0nwfvD1P9ZxwosBFhemjQULj3wlO166/PkEgzvKlHlVnQ
 4wc7aNdZH8VKPisED/ujaOVU5WxvVDM/dsjt+zHtRPmQYCn6dHCQ9rqg1uPSwGj1l8IF
 STXg==
X-Gm-Message-State: APjAAAW3NI5nJoybVbcbsMNZ/knhWTWsijM/yNoVWJ4OWAq4ZoyNgHF3
 uU8HRreMNLRwe+gwIgwCzc9imA==
X-Google-Smtp-Source: APXvYqytkmEwJ7nWAkafKbqKMtVMYlkDminYrsnNeeN6pSN+L09PCE1fv+E4wVe0/cBFSbqYklIegQ==
X-Received: by 2002:a17:90b:3011:: with SMTP id
 hg17mr87829pjb.90.1578510087816; 
 Wed, 08 Jan 2020 11:01:27 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id j10sm26200pjb.14.2020.01.08.11.01.27
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 08 Jan 2020 11:01:27 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 0/3] ARM: dts: meson: fixes for GPU DVFS
In-Reply-To: <20191225010607.1504239-1-martin.blumenstingl@googlemail.com>
References: <20191225010607.1504239-1-martin.blumenstingl@googlemail.com>
Date: Wed, 08 Jan 2020 11:01:26 -0800
Message-ID: <7hftgpg4c9.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200108_110129_006675_3F2AD9C1 
X-CRM114-Status: GOOD (  10.86  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:

> While testing my patch to add DVFS support to the lima driver [0] I
> found one bug and two inconveniences with the GPU clocks in the
> Meson8 and Meson8b .dts:
> - the first patch is an actual fix so the two mali GPU clock trees can
>   actually be used on Meson8b
> - patch two and three are to prevent confusion when comparing the
>   frequencies from the .dts with the actual ones on the system
>
> Neither of these patches are critical, so I based them on top of
> v5.6/dt (meaning they target Linux 5.6, not v5.5/fixes).

Queued for v5.6,

Thanks,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
