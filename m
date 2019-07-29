Return-Path: <SRS0=fUxg=V2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3545CC433FF
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Jul 2019 10:53:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 036252070D
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Jul 2019 10:53:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TGETdkno";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="nlRmEDq3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 036252070D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/PAuv8J1hzwo8BmSvscWFLwBI/Y5f8aDf04gtn7aUf8=; b=TGETdknotr3RiA
	01kzqKQJiNHrhU1knSIHh/py3vnqPVhTYrlq0EhIlxfY5PBjhHuxltTbloqzPCqyXMTyMUdKQeTHU
	AzkiVio02oEK0Uh1GgLAF8SvHx3ysuuwoHOkkz3hjltDtf08VmLJFbhX4mgSxQZiF87xH49HxFa6J
	95d93NYXLuKavJFb/zK0cfmCLRKnNQTCYzSgmTxc+m8XDTtQZAMDk8D3MoPcCkuufEz7dGtagu4UG
	KPz3jLMx8GKdHk2XgwGB/KmfIMH4z3N8uJTY4tQNlD79bOkZDeGNME5RCVwUvnB4cQlPne2LZOyqH
	NT1oQ0ublpxjunskbO+w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hs3H8-0008Iv-3u; Mon, 29 Jul 2019 10:53:06 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hs3H4-0008Hm-Fb
 for linux-amlogic@lists.infradead.org; Mon, 29 Jul 2019 10:53:04 +0000
Received: by mail-wm1-x334.google.com with SMTP id s3so53380605wms.2
 for <linux-amlogic@lists.infradead.org>; Mon, 29 Jul 2019 03:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=AOLYj7vZFitbpFqErn7oWDZ99uADKiNehnmJGd1HBMQ=;
 b=nlRmEDq3Y+gorIJyMNrwNEssz/SMKtx/EbGSW+70sSXgCdPUXRRW4QFGNQHsrRjUHK
 yk5EhfB9I+l3OqcXJ6syW9AqVN+LZcjMiL0wfMXJmeaJwBw8oejQiKMoTz7TEw6O6FBD
 QBDIPtIRvfl6dXouSOlZuNHp9CEWKAJHrvL6tM/zsmkD+A/NkxTM9t5Ik/oe8pMn5I4F
 nIRTm4pXheok5sJZ3rwV/T5Xxx3GrySMKIK+d5JioDOucs7EFRHgGfXxJHzNiM/QmAv4
 xNR8HXqUjXERpIK8lMphDvUvO+f9oPuOdmpsj44RdUjxYrLGYHAN83FzDj0an1ZCSyUR
 L8Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=AOLYj7vZFitbpFqErn7oWDZ99uADKiNehnmJGd1HBMQ=;
 b=B/4Q1Ce1hMR7OPUOswwVWYcod7MCbUi5a20pN3oE3lmoWT8sjelAUXZq5u32idb3gf
 mNFW4TC/y1/XYDqlOvWW33q0xK1wGEqXV4x5UKT/F8lHfMi+QYDtNXo6axkHey+Xhn0V
 lIYSF3NQ3Pc1Wtp9+VKgjrgCBBsNCFkAuBvNasdj+Diw8+5KbzU+3cQlWT33KhrsqccY
 U0a8kJZvW58BDpkjosIP+ZhTgV9fDfbAtpac5ShMiSgjuboc7+v/vYZud0IndKz+UI/f
 LdfW/bRC7xyEm+YEW7cqY/xHB28+1dH0HyZP0650Jwy+BD8gRQO6PC/bVArKjphMb5HA
 E96A==
X-Gm-Message-State: APjAAAVgqBRmPC6hJ1ieeJeY3r2bokM1eaV20f/ZpznKwRe7Tw5LWFMT
 Zu8ksIR5ZZIHG0XRwsm/Vd+32g==
X-Google-Smtp-Source: APXvYqxxAq1qeCj6RzXzLrMQuzQ7BjjgL2TJJi51jQeFJRGXJ36dozWZyeLAR3r9r7D1DIVGG85i8A==
X-Received: by 2002:a05:600c:23d2:: with SMTP id
 p18mr93454869wmb.160.1564397580031; 
 Mon, 29 Jul 2019 03:53:00 -0700 (PDT)
Received: from localhost ([2a01:e34:eeb6:4690:ecfa:1144:aa53:4a82])
 by smtp.gmail.com with ESMTPSA id d10sm50464699wrx.34.2019.07.29.03.52.59
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 29 Jul 2019 03:52:59 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Alexandre Mergnat <amergnat@baylibre.com>
Subject: Re: [PATCH v2] clk: meson: axg-audio: migrate to the new parent
 description method
In-Reply-To: <20190725164023.27855-1-amergnat@baylibre.com>
References: <20190725164023.27855-1-amergnat@baylibre.com>
Date: Mon, 29 Jul 2019 12:52:58 +0200
Message-ID: <1j5znl9kol.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190729_035302_658636_2CE144DE 
X-CRM114-Status: UNSURE (   5.95  )
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
Cc: narmstrong@baylibre.com, sboyd@kernel.org, khilman@baylibre.com,
 Alexandre Mergnat <amergnat@baylibre.com>, linux-kernel@vger.kernel.org,
 baylibre-upstreaming@groups.io, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu 25 Jul 2019 at 18:40, Alexandre Mergnat <amergnat@baylibre.com> wrote:
 
>  /* Audio Master Clocks */
> -static const char * const mst_mux_parent_names[] = {
> -	"aud_mst_in0", "aud_mst_in1", "aud_mst_in2", "aud_mst_in3",
> -	"aud_mst_in4", "aud_mst_in5", "aud_mst_in6", "aud_mst_in7",
> +static const struct clk_parent_data mst_mux_parent_data[] = {
> +	{ .fw_name = "mst_in0", },
> +	{ .fw_name = "mst_in1", },
> +	{ .fw_name = "mst_in2", },
> +	{ .fw_name = "mst_in3", },
> +	{ .fw_name = "mst_in4", },
> +	{ .fw_name = "mst_in5", },
> +	{ .fw_name = "mst_in6", },
> +	{ .fw_name = "mst_in7", },
>  };
>  
>  #define AUD_MST_MUX(_name, _reg, _flag)				\
>  	AUD_MUX(_name##_sel, _reg, 0x7, 24, _flag,		\
> -		mst_mux_parent_names, CLK_SET_RATE_PARENT)
> +		mst_mux_parent_data, CLK_SET_RATE_PARENT)

Actually, you should have dropped the CLK_SET_RATE_PARENT above.

Before, the rate propagation was stopped by the input clock but now,
there no such thing so the rate propagation must be stopped here.

It was almost impossible to know without testing audio, so fixed it
when applying the change.

Thanks for this rework !


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
