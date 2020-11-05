Return-Path: <SRS0=vaug=EL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9FAFC00A89
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Nov 2020 10:32:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39C5A20A8B
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Nov 2020 10:32:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aoXAIR1K";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s5vqFz/R"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39C5A20A8B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2d6Sg/bJxSriIgAO7WXY4XqMY5/6m/puNi9ZmU8xH5I=; b=aoXAIR1KPmWjpm+HmznCfA7Ot
	9+KzeBq8vbDDWoUngO1qV0irs8a+Y/liiyoHmsTgTrqzjLelXDTRv+fs03W/hd4PJMu7R0Se6W0MA
	OADX2s/e2Nbv0L64Rnx3C1xpJfhHT6mJ73+TOjWG50jx7PstOn6hizsGr0V04jWNEMtO+4e5P7nA6
	nkWaEst3syKfjUnIm70YIRmkBTmErUxrri6pCz6XL2bT8bC0cih8AMjeLraEFkrv8mcwc7NpmszJC
	UI5vD85eknuai6nH7dliqJLWGzxi6InIrA7QpBwgwnuLmy3Q6eglrv7YZtGEE0nTsOTG9HUeEAWQ1
	kTB+TB7Gg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kacZK-0002fl-2I; Thu, 05 Nov 2020 10:32:38 +0000
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kacZF-0002ek-Uc
 for linux-amlogic@lists.infradead.org; Thu, 05 Nov 2020 10:32:35 +0000
Received: by mail-lf1-x143.google.com with SMTP id e27so1542851lfn.7
 for <linux-amlogic@lists.infradead.org>; Thu, 05 Nov 2020 02:32:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=U0lJSFXDiBRqIOu+t9WP8o1U+WU55V+7Be2Zx4IYYiY=;
 b=s5vqFz/R2X4Ca/b1npvwgCzzKTXN2Gu4ltyRMYgzRT8pFURbWAbCBUL6SOd9c6q/g9
 u3q7fevbD5FqhA7AuFqQNMx+/NzRZkSrAG0ijoGutGZCHe62AFZz75OPLue32Q6IKfvd
 zaY6VDarwxy45vJ1IyEVO4h9MSQUMtxu/hIMjSsSAM0pV6XGCQ0dl50yzMar1HlX8fQK
 XMZ7zoksLpYvwXf8pXdn2bkN4bIYlcAeDYncOxHNP1i8R8+PWUrDcYNfO2RuzfJQr6dO
 s/05eakvtd4CUqQXF73AC23kDB8PSzsEtsFR4qWz3Z8Fq6ZJXgGS3N+LVSjez0fnnT3+
 707A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U0lJSFXDiBRqIOu+t9WP8o1U+WU55V+7Be2Zx4IYYiY=;
 b=l788t57gB0ZAzuldYQJzD1I4GweXr+vB3Zk1B71lJ3bxVgD+DLNMsk2eRiWnfHXMS4
 e25rInlZbqecX2BqkxgYWoZxrgtlUHGDqXWmXVunATdTAl4XyaGuoMWSMxETAdHlRirQ
 CYBWUbAXjpLGUkuRFr6RZl9+ZXmGyRynfrO4cTok+D0vgOCO1SzDu/leCLpsDT8uq8nI
 KTp7ueD5VFtSyh8bLel7flJZmBri34S/0w7LlU9N+0Xy/5CjTvUDRUt1MU10buPMDY7H
 3ENiw62ZVDCbB1L4jOFyUCCl5RN6Z6R8qYb9Kz3OL9+xE4PLqIc7neWoWmGI8dP2kkBv
 Oaqg==
X-Gm-Message-State: AOAM532YFd4kl3W2zmnMPU1dfSPqxLTft+xVOcbkm//e6ZGGdP1qHfjB
 fUu5A5c76WTRfBFT52l+PWPtcuzx9AeUOM7bCivKVQ==
X-Google-Smtp-Source: ABdhPJya9PEa7G1OiJ7aVpDGOrcVVSb+asIw93q4jmnfi017WQVv6puj8OMzYORyzd9Ap62KI6gCMzjiaq0JKJizpoM=
X-Received: by 2002:a05:6512:322d:: with SMTP id
 f13mr667620lfe.571.1604572352140; 
 Thu, 05 Nov 2020 02:32:32 -0800 (PST)
MIME-Version: 1.0
References: <20201026183025.31768-1-khilman@baylibre.com>
In-Reply-To: <20201026183025.31768-1-khilman@baylibre.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 5 Nov 2020 11:32:21 +0100
Message-ID: <CACRpkdYwtvaxL8urR6tUgysM8Svwq48eEi=2eNDp5L084880Tg@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl/meson: enable building as modules
To: Kevin Hilman <khilman@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201105_053234_095020_62A7500D 
X-CRM114-Status: UNSURE (   9.44  )
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
Cc: "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Oct 26, 2020 at 7:30 PM Kevin Hilman <khilman@baylibre.com> wrote:

> Enable pinctrl drivers for 64-bit Amlogic SoCs to be built as modules.
>
> The default is still built-in, this only adds the option of building
> as modules.
>
> Signed-off-by: Kevin Hilman <khilman@baylibre.com>

Android GKI-inspired?

Patch applied!

Yours,
Linus Walleij

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
