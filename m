Return-Path: <SRS0=ol0a=EQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2A44C388F7
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Nov 2020 15:05:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0FDA206B2
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Nov 2020 15:05:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JTzJUjA/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="dFrJt5SY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D0FDA206B2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:In-reply-to:Subject:To:
	From:References:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qgSvNKNxLZqv+eCfDIAZj66VIeOllatiwsnThPny6uU=; b=JTzJUjA/O6nksxAfVyS+CNBHn
	Cm2i7tTmERBuEioo6gbqTUxD0rmPUHWvuKG+kFu1f0ympDThO343IVs+zsz3A3cPYyMkCkistfFfP
	kxd197k3FX57W3dosIakKTmv8vyUrYTNohFT3EZv64L9ECOkzP4n+LmFpUreiilEikZ30E+FlCpZq
	WCnroGzXOj7PxC153IwWgeKEUAhZEPZp3P5NSMOBBv+iInFbEIVe2hptLhLb0LFvA0jXZ0/lb32pV
	UgebA2knRYnn45/DExHglOYejoJtBbGoS0peW2z4t17TXMHMuUlDilHH2961IVcsNInwzWpmTHB3v
	szoqZxZEQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcVCl-0007YZ-Or; Tue, 10 Nov 2020 15:05:07 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcVCg-0007Xg-5n
 for linux-amlogic@lists.infradead.org; Tue, 10 Nov 2020 15:05:04 +0000
Received: by mail-wm1-x342.google.com with SMTP id 19so1766838wmf.1
 for <linux-amlogic@lists.infradead.org>; Tue, 10 Nov 2020 07:05:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:message-id
 :date:mime-version;
 bh=mnaZygEEW1L0eKNF/s9ZSCOZcbczK0jgd2fEk5wQNyQ=;
 b=dFrJt5SYmJLmd7L4u3fAU9JCBeewE2bpolNKNt6xGHVlTdyJBdODzAIPF3IkGIidJv
 Ps3vPKmpq+99RI48jh9h3oSLMFt08WOe+BHrfmvce/OJ3Fz1jgk7PzKlrzzZ7czqeZjf
 rYfFk2e/04fh5iKdrYJb/wgQPSDxRxHseX8Hn5tdDza5KusU7sHQoN2/aoy4IFsGqM9s
 yljSFjtW/A8PpIz2XFN0OMaoBrrXotbHnwnm+XWT7bP7YNMcyc/jdGV5sd5cJfMT2jG6
 PjEtuZXfIEHNUetIOtJSUTHsg889CrZDqCuqV2NavrW4uYgbE2MUc3J9MqbvL4uwDeXC
 tsjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:message-id:date:mime-version;
 bh=mnaZygEEW1L0eKNF/s9ZSCOZcbczK0jgd2fEk5wQNyQ=;
 b=hVM3KesIEp5P1AxfrrYy5xoMUhy6hq23tfA/Am7MDd6iYCTgbCMccl5Bf450ZcrVZb
 1usvU5aCAKUiFlFfwiPM7lXGVoO+Mr4L0qW1/51yp2GvGABioA1sUF425HSIBZbfQSZ9
 hgALfKYoQTiwjcj7aec6yq1671DEw1TttYPBW/Tp7vsPGQxcIkPdMZmVU+4tPtncBPq1
 KXc0XEkl5YOuMJcvDLV2RFjCLMW7IEVUHj82mvEgWzoVrzIfqxQCfoAPM3EIUR3NVB31
 aiyjUY9m1fEZmEdWeL5e7609SsZueesbecYyNpS0SXAE6b1I/nD9Wjpcqas6j6fgfZ3C
 5Jqg==
X-Gm-Message-State: AOAM533annsybZy9m6CY+fb/tjj7vLcpmYLj8Ajn+37Qh8G3VMBYQM25
 4hQh7ebciPE5EG/hnu+T0kSnmA==
X-Google-Smtp-Source: ABdhPJzUBuNa3CBkQzOs1OJPVLefwvgQPpcWsF5MW6vdx8EKZK2HrPJkUvozcAucIrRAmP5DrGcUrQ==
X-Received: by 2002:a1c:2803:: with SMTP id o3mr68858wmo.97.1605020699866;
 Tue, 10 Nov 2020 07:04:59 -0800 (PST)
Received: from localhost (253.35.17.109.rev.sfr.net. [109.17.35.253])
 by smtp.gmail.com with ESMTPSA id d3sm18037975wrg.16.2020.11.10.07.04.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 07:04:58 -0800 (PST)
References: <e4e6cc45-bc18-40ec-035e-fdb45b9a8f46@gmail.com>
 <87o8lf74j5.fsf@nanos.tec.linutronix.de>
 <CAPDyKFosR2wd=jqADBF_dNd3kCMbM4oDAHyxiYC-5RF=SZ_E5A@mail.gmail.com>
User-agent: mu4e 1.4.10; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH] mmc: meson-gx: remove IRQF_ONESHOT
In-reply-to: <CAPDyKFosR2wd=jqADBF_dNd3kCMbM4oDAHyxiYC-5RF=SZ_E5A@mail.gmail.com>
Message-ID: <1jzh3p9rs6.fsf@starbuckisacylon.baylibre.com>
Date: Tue, 10 Nov 2020 16:04:57 +0100
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201110_100502_308902_E2201A5B 
X-CRM114-Status: GOOD (  12.03  )
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
Cc: Kevin Hilman <khilman@baylibre.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Marc Zyngier <maz@kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Brad Harper <bjharper@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Thu 08 Oct 2020 at 11:08, Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
> Thomas, thanks a lot for helping out and looking at this!
>
> It looks like the testing of the patch below went well. Are you
> intending to queue up the patch via your tip tree?
>
> If you need any help, just tell us!
>
> Kind regards
> Uffe
>

Hi everyone,

Do we have a plan for this issue ?
I've had Thomas's change in my tree for a month, so far, so good.

Cheers
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
