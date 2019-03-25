Return-Path: <SRS0=Y5gA=R4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8E52C43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 17:08:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6E732087C
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 17:08:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="g3D3DT0o";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="pPlNc1xe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B6E732087C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CTD6NpVbFwc9+WfnZa0kfJPlDhPw05HLGgnzrordbM4=; b=g3D3DT0o2wHDmk
	qZFUngnh9wa3KPkQCtnv7UmXI/Z3Xk6rohITRzC6MSjAV36ljshqFP87YIYJYXjrCyc+Z3xdrmH6X
	PK5rdPwwPZZl7g/fRNE8WU49FDxlgS7EXPZSDb1yX2ltXgi9p4LTb377UdNzIYMlVw4O1hQVoB/Sj
	/mn2EoX+mjET5JI02Db8ErpVCixqcOrkNcfKYcB2sKvxOLIGnUhpaR/+fCojDBiOnRGpAjtUz8NMH
	+L/mjzr9ClfeKda4oJTsA06Gj1GC/w8oNhWv0kRlwxZI5SXO+kmG/mHuPj3FFTQAKrqv/psoartax
	i+RaX+wWlkSMQ9f0e77w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8T5D-0001Kn-IU; Mon, 25 Mar 2019 17:08:23 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8T4s-0000vF-7E
 for linux-amlogic@lists.infradead.org; Mon, 25 Mar 2019 17:08:04 +0000
Received: by mail-pf1-x442.google.com with SMTP id 10so6743933pfo.5
 for <linux-amlogic@lists.infradead.org>; Mon, 25 Mar 2019 10:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=5zVksnavI6IiS5+wxbgLfc+KV5q55Q9A0+dGhNHgcBk=;
 b=pPlNc1xeOFEmC9a8uUcLm6cMccMFayxZ0ZBLie9gfn7H9UaB0bOq/4sEHjSs6gcEJD
 Q/pa/d2iUT8TtqTuddzAUBJM2GTwiJngb0vUhyVEP0IUw0QcIGW4LHTG4MLpJJ5zZvaV
 td4XYxg+NHoSigZkN0J0cB8YNMEI2Of7LoAbZD/5FsHtNeT30ZFwF+TpsGY+HrZ26REC
 tXFVxTzFncaI4XcwagTt7VdVLRU2vIVmt4u0nI4Z2PFDXDmsfl5u/5mEL+YbsrtjMaP7
 Fm3tl9R0he4X6a9S978+vAByhCD+uZiy/I+0d2QhAkmTWNJM3Bieca5E6axUgCHbWfHi
 atEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=5zVksnavI6IiS5+wxbgLfc+KV5q55Q9A0+dGhNHgcBk=;
 b=UkilJKRFXGZWIOPmFqxtyXYtBtpjSLzJu7CsWAV8P+u9xFoZzOBDoaot7TxDqZasqh
 9Xns791dgW8KDCNtdoyZGv5LmFp6mNJhsqi7eftJKHI9LmYib3Htqw81ejMsLhq4Jr6L
 KU3EejzZrII+ujuW5uDfgMqL9EKyj1E3t52r/u4iKLCxdMdk+XtaDKoiGSlaowicMTMd
 4CxU/L8xsLZZe7ocGTM8ONtisjUcuacw3Cf9w6NnoaC2udXNd18/wEcFIMNME6FyObLl
 CMn9VGPe8D41iwDjR+onRw9JUpCfxJLafJgeXs8XmRS1rzPSAywvu6lLbdz/Ld/ruSC1
 mJhg==
X-Gm-Message-State: APjAAAUkv6KyGkeHhVGzmxZYI1sGUPqmWuhobbr0fkm5yUpRMiywq/F5
 //YDloIj5qMdGyIRF7Lqb1QAlg==
X-Google-Smtp-Source: APXvYqyBfs+BriKLNLVmpE6yEO8PeRHNyRdO8nQznAeDFWr05Lk/VXyKa0Z0z7z+eNNUPqehgvwTwg==
X-Received: by 2002:a65:4344:: with SMTP id k4mr23935918pgq.20.1553533680542; 
 Mon, 25 Mar 2019 10:08:00 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:314c:c810:897b:a1d4])
 by smtp.googlemail.com with ESMTPSA id d75sm34008122pga.66.2019.03.25.10.07.59
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 25 Mar 2019 10:07:59 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH] soc: amlogic: meson-gx-pwrc-vpu: Add support for G12A
In-Reply-To: <20190325145537.31697-1-narmstrong@baylibre.com>
References: <20190325145537.31697-1-narmstrong@baylibre.com>
Date: Mon, 25 Mar 2019 10:07:58 -0700
Message-ID: <7hva06q3v5.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190325_100802_263200_EC7732A5 
X-CRM114-Status: UNSURE (   9.16  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> The Amlogic G12A SoC has a very similar VPU Power Controller setup
> than the older GXBB, GXL & GXm SoCs.
>
> This patch adds the variant support for G12A.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

This patch not only adds support for G12A, but changes the functionality
for GX SoCs too, but that is not explained.

Based on what I see below, I would expect two patches:

1) improve/modify the GX functions (with descriptive changelog)
2) add G12A support

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
