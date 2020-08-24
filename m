Return-Path: <SRS0=4XcC=CC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A1B0C433E1
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Aug 2020 21:15:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38BEB20656
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Aug 2020 21:15:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fc0qZ0rt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="iaY8oodz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 38BEB20656
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ajTVunzZIfPOx1Gcw1BC9hNGxLgZ4e9g/uGdzy/sADQ=; b=fc0qZ0rtZrLdmDbK1LCHhp9OT
	mvlz8Ncg0nz/Zc0qJxNv/MIgcLn7mukr4MhNQSUPnE7yLOPuFGG0MymnB36cixCImrU6ty+e9a4xZ
	LrXPJcgyRF9AjejiE+1O4D2/hQ+00ULjuKhum0EUCORpeVdwNQcu/NtbTIVA4kKapvpDiZ/6hWtf0
	yCV+Rbhz4nUzpvOz4i3f1996WdMh9Ocjgwyr0ypRV8eCPvPlYG0CMTl8TVImj3GuTAeoEI3A89mTA
	6PzH9ZM4w3T9QTQYGxSGqMbHbdd62h4F4ahzXykGu7qASjS/AIxUdHeIF7qI9lh+ZeNqfAfkYP7BJ
	aikNgWHMw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAJoK-0003J9-Bp; Mon, 24 Aug 2020 21:15:24 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAJoF-0003Ht-H0
 for linux-amlogic@lists.infradead.org; Mon, 24 Aug 2020 21:15:20 +0000
Received: by mail-pf1-x441.google.com with SMTP id d22so5610158pfn.5
 for <linux-amlogic@lists.infradead.org>; Mon, 24 Aug 2020 14:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=MJ8XfWNGGP7wiDdGWRcPF7YeSYjIipUSnFlPxS9I+QI=;
 b=iaY8oodzVk638aaEvZq4/GPPWWhIMSiVq1vxdx7MrV0QYpzha2W9GN88Ye9LZJiQzZ
 7TGVH0AcUf91WylTcbJJgzO5/hiz60LIrawOw0q25XUhN+TXnrccNNLPPgokXalw9Nu3
 XEIrFZi0CnD0ucQgzvoqa6VPn68U6xU9V6VdyYXxNMAnwMxOtGMYNC8xD+l6zAUkPo7p
 wi/9tU0cmDURf8xYpKv90DJgfdNSdA36AhjNVZPr6A5vzxj8uFPJwxX43QtRdDuN8Eof
 bIpcleHXQuYO3ulhdLJuN5+eSddDgtEJsGyI3+e77KuwCANWcwIAS/wyvqvBO0xKGU39
 9b2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=MJ8XfWNGGP7wiDdGWRcPF7YeSYjIipUSnFlPxS9I+QI=;
 b=ptPX+S276hC1CEBRTg8BWvFQF5xkVIYe4XSWuGsH5w7QRpO2xk0RzBlZyqBiHPwwbb
 tZUe0WcIELgePx14DsSb107Rak70B/PX8LYhzieOJa8NV0aqB06/E24gN9y3CyHcalAF
 22URRwWykkC59IftlJl8tZoCIXNSuixJZA18nNL2nUbHOtyZzd4p2eQO4LYbikYX/iUQ
 EFR5dP2f2bqTv2adtBrUbKkon9qmXPAfV8xBD3phIwxGlY/U6j9bfkLOQsOLu1T3SBYU
 tb/BIH0C71YF0X+vUCUK54pzLR2H4PlU5sruRBmodhfeMuDZGzR5qQ2n8NdIbYFLi97E
 Z7lg==
X-Gm-Message-State: AOAM531nHmerd4uZTkf/zOCYZqWQbJ78DagXlgLXz5RiqJ9/ZYmRwJg0
 B+F63hCwn1uY4JStd8AQAB4Bwg==
X-Google-Smtp-Source: ABdhPJwZHuR5OTtw9TTATDnf6mUcMkl8mrdaaHq9gdoGIJi4IGzp/W3a4vARzXQH6bAbPvfGVX1g5g==
X-Received: by 2002:a17:902:61:: with SMTP id 88mr5018879pla.151.1598303717277; 
 Mon, 24 Aug 2020 14:15:17 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id v2sm5569888pfn.116.2020.08.24.14.15.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 14:15:16 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org
Subject: Re: [PATCH] ARM: dts: meson: move the L2 cache-controller inside the
 SoC node
In-Reply-To: <20200815182223.408965-1-martin.blumenstingl@googlemail.com>
References: <20200815182223.408965-1-martin.blumenstingl@googlemail.com>
Date: Mon, 24 Aug 2020 14:15:15 -0700
Message-ID: <7hft8bu4nw.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200824_171519_731234_542AE3A2 
X-CRM114-Status: UNSURE (   7.37  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:

> All IO mapped SoC peripherals should be within the "soc" node. Move the
> L2 cache-controller there as well since it's the only one not following
> this pattern.
>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Boot tested on meson8b-odroidc1

Tested-by: Kevin Hilman <khilman@baylibre.com>

Queuing for v5.10.

Thanks,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
