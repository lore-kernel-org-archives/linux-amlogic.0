Return-Path: <SRS0=zLcP=25=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A94DCC282DD
	for <linux-amlogic@archiver.kernel.org>; Wed,  8 Jan 2020 18:53:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8119120678
	for <linux-amlogic@archiver.kernel.org>; Wed,  8 Jan 2020 18:53:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vCuAqm1K";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="hpES8SdR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8119120678
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xxDcGsBmYp9sWSNR1pZ9IRquREEKTUS+efkYjWxvCbs=; b=vCuAqm1KuIf3X1
	K4fUbU8wS6rZl8wTI/TN5R+ZzWcV0PaYRSskppZsEqyyAP5fUf0PjpBRjJd1kE39vK/vQTrV3TF70
	YAGrvj4ppMxhhWXF+ykYR/4nKSOsW32jirtUXYPvApS3ezXzOwK4BgAoBlnGygi3ZTxo1pn3HATl3
	DPpKyREbIhEtsI4FyDPYGdRLKnXAbTJ+7DxloDvhCaVVtclpO45tBxjaDMNcM82+LnMgpd6Gwitrz
	OMe5Ps/yY0QqCvVIXbwyBA0sFMeae7M/GLa1o7rTQ1EiHvS6knTPVp4XchqR+VRe9FcvDlyYKXJ4b
	ksJdJJIKFDbfslgOcpNQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipGRw-0004to-Fb; Wed, 08 Jan 2020 18:53:00 +0000
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipGRt-0004sL-GD
 for linux-amlogic@lists.infradead.org; Wed, 08 Jan 2020 18:52:59 +0000
Received: by mail-pj1-x1042.google.com with SMTP id n59so12475pjb.1
 for <linux-amlogic@lists.infradead.org>; Wed, 08 Jan 2020 10:52:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=hCOCHoRkkp5UhkO13eAqohn7PL1ou6ER+9SiJJ5LA7k=;
 b=hpES8SdR9Uct+j5WAd8zNLCHlHLI0Dpp7FDalu+Q8dq7QprTl2szIsh+6DBrWb4NNz
 xRrBGudrw+X/Ehs59ly2N8d8DSql+Fw7Ppwdjr4XpX75C+4sgM5xKFuqbIkO+z3QChEl
 iQYQ0JNOqgh+OuuWj0mFms7QubXPP6Q/OqvExcsyRbIwKARY9jgHP2914Gc3gDTgacjJ
 CR7FlFxLhEsgcA9/zQ4FxzryADWNeNR+68ozE/oMrV3BXa3+q5U8PWFc9AiE31Wd81R0
 25Cgh1ITcxRibM6EOVZlV9vd99Nz5cGzZQ82KxKqCxpzlKEY6ZSH/lut8bdb5+a1U84z
 Zw8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=hCOCHoRkkp5UhkO13eAqohn7PL1ou6ER+9SiJJ5LA7k=;
 b=N+i2qH2VAytYSEGFxnljk19XXmgdCbXtllA69JmEjAZXXPjENf4vZUoKShiRo36g3I
 NYUK9XMKU1pjvLLUgb/ZxV67MhUyZCkazwLPgZQv+pNu129qJXQqZWqCj3yalKr0WWTt
 JiLcQJIO4wzdi7bQfpWnZV9liel/LhiHCc8IDGKsiS34hVPBX+wu4pMwWMMje3MvO9au
 jVmNIbCveTNhqspv/3V3HkZQFjyJiMg6ynm14lA5roL7ottIG6b9WXITrkqeT45pkb60
 C7KLlNsxBwHqiy6/f3MtDL4YSwSwfpizaNIuHLqKC6FVlTJ5w45HwGk59w4GL1HFIEWq
 rjXg==
X-Gm-Message-State: APjAAAXt0f73EZXZHoykYA8wXrrSvCZlRIBUGxF5gm93PxQy+Db8X5uu
 3nnRJCIn8aW6p1xP+8fOV2++uA==
X-Google-Smtp-Source: APXvYqyaHwgFqHkdB1vUFNMuHsw49pWnr1JXRS+Ome1dK+LyPoCS43sUUsv8UcMPR7AbUHvBPCKp0g==
X-Received: by 2002:a17:902:34a:: with SMTP id
 68mr6646218pld.250.1578509576062; 
 Wed, 08 Jan 2020 10:52:56 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id m3sm4429923pfh.116.2020.01.08.10.52.55
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 08 Jan 2020 10:52:55 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH] arm64: dts: meson: add audio fifo depths
In-Reply-To: <20191218202452.1288378-1-jbrunet@baylibre.com>
References: <20191218202452.1288378-1-jbrunet@baylibre.com>
Date: Wed, 08 Jan 2020 10:52:54 -0800
Message-ID: <7himllg4qh.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200108_105257_573989_F68DA49D 
X-CRM114-Status: UNSURE (   6.64  )
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
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> Add the property describing the depth of the audio fifo on the axg, g12a
> and sm1 SoC family
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  Hi Kevin,
>
>  The binding documentation for this new property will be merged through Mark's ASoC tree [0]
> [0]: https://lkml.kernel.org/r/applied-20191218172420.1199117-3-jbrunet@baylibre.com

Queued for v5.6,

Thanks,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
