Return-Path: <SRS0=y0rr=E2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02C87C2D0E4
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Nov 2020 15:34:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 663F3238E6
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Nov 2020 15:34:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Xui46mHD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="gt4ACTFq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 663F3238E6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=g+NLGOZTK7CJpDxkEx27pd2eA5dj4IWIjbMKvipofpQ=; b=Xui46mHDCcp3GS7flvhIMMiph
	acpNsGQDz6WbqsZ98IZ4Cjz2x/ROMgsyV1AmtQptNQbTDRn5DPNZcL+RtGXa3nS0WUCBopfZv+txR
	gE+36iuo9ONb4wo8opkSzn0H8tEM7yh04BlbArzYDXUFNvmqJMiGqSQGcroCbSW1F/itDnoRXtq/V
	kVafrL3vQX2a+wEENyEDostm8WSdfTl1HStxSw0VBeUJmdKuXd4B9um2NSJYi6DNZkie5rXYT8eli
	C2k9yOzpLF5of3VJf80/M6mxM4h3GR0Q0fEJRgqrNm4wMfH+ovLXjpsDtbSflPM3JIDEcvinLy6ZX
	vS7f3YPrg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kg8Qv-0000EI-CY; Fri, 20 Nov 2020 15:34:45 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kg8Qf-00005D-CF
 for linux-amlogic@lists.infradead.org; Fri, 20 Nov 2020 15:34:30 +0000
Received: by mail-wm1-x341.google.com with SMTP id s13so10161725wmh.4
 for <linux-amlogic@lists.infradead.org>; Fri, 20 Nov 2020 07:34:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/QSgfdo+6p8k0XM3lhzRbtDtWaSOahjXtbp9NJXBdHY=;
 b=gt4ACTFqIYuzZm26XLJEr8FySXvxOmVK9Rc563g0bPBhpCrpeiVOyZE/xdpC6eKfKS
 k8wh3XPraR+ZwoNCDWpFBeLdnrAlm7pcNb3ACkrjFeZ4GUA0Q/UwFEzsWkU3vcSvDvh+
 Q+3pipBynYJVjJldGula/KJqWdDxf/WUgYioa4x8o/XZRAit2Kkc0EuLgqmYUC56mVpe
 L94xucVXG1+Q/Drbx2QNc4TUHCNUcQ1Rqq7vbIZWcoQyqhURUtIabkQLwpAN3cTjfHhQ
 kdB9QNOFKZTFR9qbOfO1Y3npspsz4hs/Ax9DH2nvUPbEAS4ZK1MkDTMn5Lc6UodD7Rsi
 oTMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=/QSgfdo+6p8k0XM3lhzRbtDtWaSOahjXtbp9NJXBdHY=;
 b=C/zL3eLlagPw73vV2FImUbhHxK9VyIsof1xqrc5G390g8ZtTtIEYQbgBoEXrhEfNjX
 eQANrnXTNNOaP8dQZ6xNO4Ag3TK6yjiSO+Z7YocgWv6B+KvFQTEodLiHQmHR3s3sdobz
 UnWgYTjczgo4ASceNWxYpaUzo3bXxeUV6pHypzew0rdRZ/0rs7cmn88FUHA985Wz7t53
 YyPuoz3ngb78KkMz+H63M1ZTb3p8rX4mFpXnVRIgnBrJxmlFlhz6iyj1Wdqfdl6dfBcd
 BOrkvMEx+XTJCSj9yZrwZ51XI2zX8XV0HNGXYX9wtqVbKQhWvvsrZ9aidt5vMVOxkxqL
 EgNA==
X-Gm-Message-State: AOAM533tmCDH34ms8EgVy8KO0uV94bdn+RtxMNrHzCq/3UKjU09u07y9
 RhoHkePJ7JXMSedbqltw1TJeXCnI5bzIstxe
X-Google-Smtp-Source: ABdhPJxui/Lv5ncdt5fQ0+mEthMxXxtVldFFma6D+RGkCjsOzGlFZVSspnloiJE8EFElkEa3sOBRPg==
X-Received: by 2002:a1c:c2c6:: with SMTP id
 s189mr10519330wmf.101.1605886468130; 
 Fri, 20 Nov 2020 07:34:28 -0800 (PST)
Received: from ?IPv6:2a01:e35:2ec0:82b0:419f:dca4:d17a:66a7?
 ([2a01:e35:2ec0:82b0:419f:dca4:d17a:66a7])
 by smtp.gmail.com with ESMTPSA id w17sm5264437wru.82.2020.11.20.07.34.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Nov 2020 07:34:27 -0800 (PST)
Subject: Re: [PATCH 0/3] arm64: dts: meson-axg-s400: add support for MIPI-DSI
 Panel
To: khilman@baylibre.com
References: <20200907083300.14412-1-narmstrong@baylibre.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <da13a159-6009-831a-8686-b5220ec04507@baylibre.com>
Date: Fri, 20 Nov 2020 16:34:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200907083300.14412-1-narmstrong@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201120_103429_499290_9AC38E33 
X-CRM114-Status: GOOD (  14.06  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 07/09/2020 10:32, Neil Armstrong wrote:
> This adds the nodes to AXG and S400 board to enabled MIPI-DSI display support with
> the 1024*600 tl070wsh30 DSI panel.
> 
> Dependencies:
> - Patch 1: [1] & [2]
> - Patch 2: [1], [3] & [4]
> - Patch 3: [5]
> 
> [1] https://lore.kernel.org/r/20200907081825.1654-1-narmstrong@baylibre.com
> [2] https://lore.kernel.org/r/20200904161654.24141-1-narmstrong@baylibre.com
> [3] https://lore.kernel.org/r/20200907072708.26043-1-narmstrong@baylibre.com
> [4] https://lore.kernel.org/r/20200907073402.26674-1-narmstrong@baylibre.com
> [5] https://lore.kernel.org/r/20200904161504.23915-1-narmstrong@baylibre.com
> 
> Neil Armstrong (3):
>   arm64: dts: meson-axg: add VPU and PWRC nodes
>   arm64: dts: meson-axg: add MIPI DSI Nodes
>   arm64: dts: meson-axg-s400: add MIPI DSI panel nodes
> 
>  .../arm64/boot/dts/amlogic/meson-axg-s400.dts |  49 +++++++-
>  arch/arm64/boot/dts/amlogic/meson-axg.dtsi    | 118 ++++++++++++++++++
>  2 files changed, 166 insertions(+), 1 deletion(-)
> 

I extracted the PWRC & DSI PHY nodes into 20201120152131.3918814-1-narmstrong@baylibre.com

Will send the CPU & panel nodes when the DRM codes is merged.

Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
