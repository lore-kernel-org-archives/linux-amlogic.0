Return-Path: <SRS0=bSlY=PZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B361C43387
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jan 2019 19:56:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5ADC020851
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jan 2019 19:56:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LZ9nH7mm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="GhyNrPbV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5ADC020851
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ecorarLkaxrxn9x1Go+g2+/RvI7RXmZWVEH+dn+vB7A=; b=LZ9nH7mmR2tZMl
	8100vLrNtUrFKuW3OkNHEpoPJODrOHnd6xo6+EcnILgV+W+BrIEZgNmxe3pseG67JtdFth0iIr7Zr
	UPg2kZBpndnqpcZz/SyE3iXRx0evJkcydy5UOTC+709S3VQXwcI4z6ZZE2ZfiE4Y4SEarxy5PDbfT
	NxlmCC5J19RtOv0pd+FAupJwR5IyqSv7J/wThCVfmgRBlXANGiUtkfGnNi3/v+RQnfkEnm4uVNF9n
	f5ArwfybqTZHt6nXecHLXswXKsIs2o4kj+id/APIKhRX+RlbFrnfhc1EJhMpjmSvN1EdzJRK3TtvC
	tpyUtVlUQhD4PvsEAKPA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkDll-0003LG-JO; Thu, 17 Jan 2019 19:56:05 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkDle-0003D1-4O
 for linux-amlogic@lists.infradead.org; Thu, 17 Jan 2019 19:56:02 +0000
Received: by mail-pl1-x643.google.com with SMTP id e5so5216303plb.5
 for <linux-amlogic@lists.infradead.org>; Thu, 17 Jan 2019 11:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=csQggusV1GzapS3sXNMHO+HD7Rj7X0rB6/zfWAOTf3Y=;
 b=GhyNrPbVU9/8YNOylzm8TzhUpbBKOApsQiQUUDiEvRTkwgtdm52EnV7mOTP1rJX0Tf
 zGi2H7ZXKFxM3kD2gQtM8NWyFV/RxIUDoSuxFk93BkfDFquqWjnnE/z7Jk37Z+gxXi3W
 P+OCLfctWLvPCxd1KIPU2NcVFvNy/RcjPIbGiLwBCQpGkbLj8dKLELgzBKHjGD8n+Mog
 Dw1cEGZEh21f+GfREJAq8tKbmFHcprlw2dlVVIJNMr+qVOoNAUxu3pBzHK8pXEVEmNjw
 C+gIEEbHocKCViQ80gHin0raNJUGmznJZ8QNLG/l3l+URcfZNEeLtloTOaIB3OapdFrh
 5EAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=csQggusV1GzapS3sXNMHO+HD7Rj7X0rB6/zfWAOTf3Y=;
 b=HZVz4uKEuPj36hNe5otjJlOEJcaq2PJz7eSHI2vX6JszJOMopxllGASNTmorCc3+/s
 w47s+EAyVNq/2U4XJIsr7WQe5jveS4zVkgvRP6qkl9JEI8ejRK6Vg5KfWnBxdPApSHHn
 Wf/MKtcJkzGieRrAhox8nWa4ITQAgt7YzATox/pe0bkJ463NSSZJiSt9z9ms7Qwcxoff
 MH2vFbM0ymo/j0rbc2sy0P5jnmSuYYYe5NUAyQkYO8BwtxgiSY1yUdpak1lgYD86Z6Ur
 1LdxNzJ4OU3gyKs2N6tU6nZ+ejI/1SdoJwu12kRJFFFuEy0QcQjdLVGsaHpFujRl6LkO
 HGsA==
X-Gm-Message-State: AJcUukcG5hrcV8ERqXdMgD5PvphKdfwSA5laMVQdMWmDjDfV3W1e2laY
 ibWPJh2XoknX/KFIsnx493Lbsw==
X-Google-Smtp-Source: ALg8bN6WdiKwhYTb4tEhhFmDAoA18VVr7IjBKmiFO7DwHctLWsARsosOX96UkLz+xvxvhwzEVWP7GQ==
X-Received: by 2002:a17:902:24e7:: with SMTP id
 l36mr16323822plg.61.1547754957086; 
 Thu, 17 Jan 2019 11:55:57 -0800 (PST)
Received: from localhost ([2601:602:9200:a1a5:e076:9fe9:59e2:1e0b])
 by smtp.googlemail.com with ESMTPSA id a15sm3083799pgb.1.2019.01.17.11.55.56
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 17 Jan 2019 11:55:56 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH] arm64: dts: meson: fix g12a buses
In-Reply-To: <20190116165236.8330-1-jbrunet@baylibre.com>
References: <20190116165236.8330-1-jbrunet@baylibre.com>
Date: Thu, 17 Jan 2019 11:55:55 -0800
Message-ID: <7h36prcb3o.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190117_115558_864677_8F3544CD 
X-CRM114-Status: UNSURE (   5.48  )
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
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> periph and hiu bus addresses/size are wrong.
> cbus, aobus and apb just don't exist in the memory map so remove them.
>
> Fixes: 9c8c52f7cb4f ("arm64: dts: meson-g12a: add initial g12a s905d2 SoC DT support")
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Queuing as a fix for v5.0-rc,

Thanks,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
