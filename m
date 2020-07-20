Return-Path: <SRS0=UgfX=A7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E24DC43457
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Jul 2020 22:24:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A58A206E9
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Jul 2020 22:24:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="H1d5GbSi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="rCeOpitt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A58A206E9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dE+JS4SgsBx2qDtl/hzr6qnDNWcF5jSaIjh48MpVrdM=; b=H1d5GbSiDrorIj9l6o9XZFshO
	icesXjgThZ44qRnkPsprpSe1Mz4N3htAn61VcSReVl9e6Q8SbCW0tgMN9TOtAziKLi6INT+gBTFwJ
	4H1IjVExdIaI3dIx4eYoZENmFaVIWsRqFSFDoOyygXitoHePbEyypVT7tRVufc41pkKhjWB6rlGTT
	/9fQcwr4ARb+6q68EO9mzYGlpRAc/3pW5MDqwVhdaQyGA3ANYudKFYNL9ah/90udMFwqgZIacPi5j
	kkaJ0yQVkxpEhdVptwZH/nYSRUP4gX6mXuLjaPVJpy3ERTE4gXc8h9VPW15lDWCEVSE050haHGXRw
	McDMxBGQw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxeCm-0002WX-Oi; Mon, 20 Jul 2020 22:24:16 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxeCd-0002Sy-Qw
 for linux-amlogic@lists.infradead.org; Mon, 20 Jul 2020 22:24:09 +0000
Received: by mail-wr1-x442.google.com with SMTP id b6so19288354wrs.11
 for <linux-amlogic@lists.infradead.org>; Mon, 20 Jul 2020 15:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=h/iiGE/hMDHwo1jMRtAjhSPPyBiqm3USAufgg0bvzlA=;
 b=rCeOpittQdYPYWCf6wlX+oHYRzPRTkTJhX1U6fWNKWkX4ANROneKyoy68EKrZIn4jX
 blMBSkuOmxef6fQhYQ99Kwrb9HSLILNxN7kI7N2nG90ibGgKs+ktVc2JhLCXhIsIIAyf
 ZuQE8JLHWZDvwfyuT279I6XGAqA5WbsXz62oxHHh0w3ntl9yCsmh5e/0Px4tNC6NLXx+
 4cvCgN/SDSR3x2o9NkttFcwYRmb9+P13kMSs7kjRIrfSuimk5+63ag7kvvfvizvAMmFF
 2VcVuEqgaGUt3wmrc6PxD0KaeABfdaamdDw+/oeu30je2546HZKLysQFjyaLrD7rhI+j
 ORvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=h/iiGE/hMDHwo1jMRtAjhSPPyBiqm3USAufgg0bvzlA=;
 b=dU3wxZDUv0hCgpjaOOVT4Ob+BxaCOypYNGBPsyDC19mG+Xpw3Va7eMNiEJJDvH6nnm
 m0h6WQu8HNlPy90daLoQEKTKut4hj7NpHVoyEpO2LaofopgT/+hHpgDH62Ylh7ThchAa
 h3rPbRiFayFXr8MFLcG6Woga9nLUkTUdU9n7RLUzHiEMtHqmPBFkTPu1AeLIk6TjZ9ug
 6PJrkFaYvE8HGwisCDcDB5iCuZ8aMp8NuzFWoKCm+jvETsxcbZxCiHMrLIM3Uc9PoOjF
 Q9Isf64AhZwNsukUzydfbHCX/EIH6xNtEsufz3cXMd5Z1Mug6Bxn6gNem9N0aeoPEbBN
 YWLQ==
X-Gm-Message-State: AOAM531LZTpS44LOpqbYxaT+8G6QY4+n8+JeQpw2JDYVy41+ZMdCeYDG
 ZoEPFBblClfHFraMkzESBsEpEA==
X-Google-Smtp-Source: ABdhPJxOqcn9joaabrwtIlsBoWejqjHNRkfkhbpEwfhZXef4rnzEUWmKjXGUKtqWnxuyo80g7c7+Nw==
X-Received: by 2002:a5d:6a8b:: with SMTP id s11mr2034828wru.222.1595283845126; 
 Mon, 20 Jul 2020 15:24:05 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id c194sm1129294wme.8.2020.07.20.15.24.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 15:24:04 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: meson: misc fixups for w400 dtsi
In-Reply-To: <20200718052950.3707-1-christianshewitt@gmail.com>
References: <20200718052950.3707-1-christianshewitt@gmail.com>
Date: Mon, 20 Jul 2020 15:24:01 -0700
Message-ID: <7hd04pakqm.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200720_182408_001872_80656725 
X-CRM114-Status: UNSURE (   7.09  )
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
Cc: Christian Hewitt <christianshewitt@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Christian Hewitt <christianshewitt@gmail.com> writes:

> Current devices using the W400 dtsi show mmc tuning errors:
>
> [12483.917391] mmc0: tuning execution failed: -5
> [30535.551221] mmc0: tuning execution failed: -5
> [35359.953671] mmc0: tuning execution failed: -5
> [35561.875332] mmc0: tuning execution failed: -5
> [61733.348709] mmc0: tuning execution failed: -5
>
> Removing "sd-uhs-sdr50" from the SDIO node prevents this. We also add
> keep-power-in-suspend to the SDIO node and fix an indentation.
>
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>

This could use a Fixes tag so it can be backported to stable

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
