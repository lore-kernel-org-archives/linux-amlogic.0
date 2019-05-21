Return-Path: <SRS0=vjLk=TV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B370FC04AAF
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 May 2019 20:12:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8800A217F9
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 May 2019 20:12:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nNFLHN+E";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="UKYH7WLV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8800A217F9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AplS/27swjn/KcGMldjlI6CWG3k3SpbCeFlmF7o9AJU=; b=nNFLHN+EVFtJlb
	P2sWrGE+TH7Vkyo3DF3qOE64v/s3LuvAYIBSTzjEMi7nPWHDzlpaxL/INsaLhqJ7t0krq2NioMIqT
	fIHNUyE3G4mv4iYVskgS86mu9t0hvgUrMz+PO6ETHX2p8T9RZObK8KZCXOb2/SMC7/kc7m943JsdE
	W2gSIDriKBfJMZeYavnHOY+wszdSj8cd29Nn/lwLwbTJaCTUbuzyL5FBlziT76m8Zg0S+WkNRN2aV
	JsQWewzj8BpzRVeFiv2t1wbrDo+7asDTn37dKhffLGRRPSekjM9/wuRp5K73Xezxpr1e+W1WqBUXK
	jlXdfRcHE8r0U8WwNzqg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hTB7x-0003ms-0z; Tue, 21 May 2019 20:12:49 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hTB7n-0003ej-9B
 for linux-amlogic@lists.infradead.org; Tue, 21 May 2019 20:12:43 +0000
Received: by mail-pf1-x443.google.com with SMTP id s11so1530pfm.12
 for <linux-amlogic@lists.infradead.org>; Tue, 21 May 2019 13:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=nSMrBlQQCNOdHw6ym1MsOYq9Zt6fXAndfJkhXIkeTfY=;
 b=UKYH7WLV2ulLB4lxqEK1p6vKzcO/oYH0HKk0Uf1ngLMKlUIdsEZBeUP2RkJFviqTla
 /+Kpld/0OVy8Fuu4qrbvy5/us03iBvFcqM+dVkzCFWvmn1i4828WYorclEAU+0cKoB52
 qGBBHkjShpmLqeb/cdWbB2QEVLwISsfCNYX2LIybY7DgaXWrQ0lAqmRkpz8nqcAd/xcQ
 OjuH+kA3zAJwDCA79zLs2+71YrQzyveKWqS74wE5wEE4E+MrnQY4xFcQpWoRP1bbJdyB
 m9wKLfHxAUaCWwuXGeFGpkWoWgfmGxwC1oPGoROkVjiJk1u2GLFaFOWidJ4WiwFzUsGl
 CaDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=nSMrBlQQCNOdHw6ym1MsOYq9Zt6fXAndfJkhXIkeTfY=;
 b=gnBMnpHEJ7WTbhUrM8ipMhpEK7ONw2ZfQEE6QNblWhljKWl3Xr1/YbMuFIkSeyE4ub
 asNyiTsAmo/qS87ElpnUYfUJem7BATYKLto3T2bO89H55wDylWq5Cs38SAspQI47rXtb
 SP8YHAyZwkgdvc3l176OWEZ+4/5M0/FZOe2wfXQhXQVSE2TZQQH9Z5Sjg514D7E969WQ
 cW0tzMbOnjeGtV/eOFjGT6EAf3N2M18D00IlGCQTtgkk6Brh90MwwVYHT1KCNMfmfQQ9
 xjyGjoJeZMYeUSAiJcNblcJiecdj+E8wwQFbL0kMvSGDymQvBLNoYRQ3w+3Kcns+nv15
 2vQg==
X-Gm-Message-State: APjAAAVDHKsuWR51Y7wtKd8TjQU+p+sewx3ER2c5XCrEcj3J3lYWrOn/
 XP7sxzUTyGS1RsDC51UMkQXnJPySvFoPPw==
X-Google-Smtp-Source: APXvYqxVEPOLzIUAcEnvDwqtTQaoCBe/SQRAw+I1ByMAhdJAZkI38UAVWTgq+qFcuMrL99a0Mwl45A==
X-Received: by 2002:a62:4d03:: with SMTP id a3mr92113713pfb.2.1558469558426;
 Tue, 21 May 2019 13:12:38 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:b1ca:3800:3284:d770])
 by smtp.googlemail.com with ESMTPSA id r138sm29927872pfr.2.2019.05.21.13.12.37
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 21 May 2019 13:12:37 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, ulf.hansson@linaro.org
Subject: Re: [PATCH 1/2] mmc: meson-gx-mmc: update with SPDX Licence identifier
In-Reply-To: <20190520143647.2503-2-narmstrong@baylibre.com>
References: <20190520143647.2503-1-narmstrong@baylibre.com>
 <20190520143647.2503-2-narmstrong@baylibre.com>
Date: Tue, 21 May 2019 13:12:37 -0700
Message-ID: <7h5zq37eiy.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190521_131241_585013_142DD1E3 
X-CRM114-Status: UNSURE (   4.87  )
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
Cc: linux-amlogic@lists.infradead.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Acked-by: Kevin Hilman <khilman@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
