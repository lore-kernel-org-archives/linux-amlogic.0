Return-Path: <SRS0=N67E=WS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C30CC3A5A1
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Aug 2019 22:26:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D440C205ED
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Aug 2019 22:26:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DMRsRZjR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="L02p7MTZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D440C205ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vbHbfZx+a621rLMjopFyS+LUa8V6p/NaRPKdOcyZOYI=; b=DMRsRZjRTkAJa5
	4WV4kGHFuHFcoS28Q94/vV0b4P/JfH8XSSgKclAH4By8qrRSqahfW2Tzg/Q18O7O92vUYWVanMrVp
	L0HYWZb4b016zlkbCvjIyXCkEwb/eEFz35FhZ/B3ydHYW/1E6fMLTLUIU2IttvQCnXYrgGf6fx38F
	K095+dS/e1cirzRrEIuDNp8tKHEV6K4l49/0Vh04bPlXNBw/DyVDIsKsxrw1f4eSxBv6/Rt30FpRi
	ME0BA52PpU1EzlSX/5UQ2wYjDehcDNaLHCj5zo4/hV0LT8TeyIEkc7CNxLrKgtG6za1lJ9LTBISNK
	GnHQf08Umku5wdl021Cg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i0vXR-0001Gg-LL; Thu, 22 Aug 2019 22:26:37 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i0vXH-00017M-1L
 for linux-amlogic@lists.infradead.org; Thu, 22 Aug 2019 22:26:29 +0000
Received: by mail-pf1-x443.google.com with SMTP id i30so4918387pfk.9
 for <linux-amlogic@lists.infradead.org>; Thu, 22 Aug 2019 15:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=t4hXv9cggrlxKrmBWOfxBfWb9+XY7JPaFG3ZSJTCrY4=;
 b=L02p7MTZgJSiLnO5xtArax8M52FA4xo/lKe0Dc38mB2q1uJl2C1xNZJTSRufArXftm
 bGVtFcHDRfmEdMNyxpxyX6sAxuPAlRtvhcR1wrcvkdVNhP2hmuL3Yg3WkfzV3UuCiHpE
 qBdCZPjxT4jKeeLRp7vIfFYVvzouMA2SEyWES5czqFEzZMXBHywEztChIjLDMAB1V7fI
 bcI4zWblknUhZlnFdTAJX8+r5O8kJ4jBv9JF1ifzhV0z0Fq/JtXD7kkOCa1cwuEM3v9H
 8oCGPEeJT/iLPQ6HMXGrFK+w7sj0kORhV3asiA4zet/AHDWuTeVyQKMG7SGGinBLH/ii
 sMCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=t4hXv9cggrlxKrmBWOfxBfWb9+XY7JPaFG3ZSJTCrY4=;
 b=DvXIf8STN+3LeKBWTbCFaEp4c9lZWm/r3o4jRVykdzbh+js+9iOLTGb7L3ou5rWhkH
 PKlCf/y3iQs3d/Y4Th3vy9pEVhqhXLzPUb8qGmCJ2bJcp0n7QXX7TIK5gA2FKU0iZkLm
 +xj7Ho/nCWUbAcdY0TKZLF3MViBkmmoMo7omufDh2JrZwr3dLbgZRExs5Dg76B5NyTJu
 LHlpYk80MTirAim89hdN2iuZhQXx6nLLimdq5zdgVCOugpTNmpUQ2yPtoykgNeKaFht+
 QnQEZjCO2oI85RnBqRSLWlXdJxuzG2h0szlgdXTt/HHApGfXt2uJFcexIItlhY8tMxsd
 INkw==
X-Gm-Message-State: APjAAAVwZA0+UkSsws/qnqq0P1hyDUO35vY4WsV14KsWdJUSLpK5xQ67
 F8a4QipsWsepAK0vI6RlOCGnhg==
X-Google-Smtp-Source: APXvYqz7feSiqp0VVtPbpzkC0q2Llqu7JNkCqqYZ963rXLnIewSU4VusDt5Oga9DB5bP6eTW3VjLdg==
X-Received: by 2002:a65:62cd:: with SMTP id m13mr1209603pgv.437.1566512785980; 
 Thu, 22 Aug 2019 15:26:25 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:89d4:68d1:fc04:721])
 by smtp.gmail.com with ESMTPSA id v145sm412995pfc.31.2019.08.22.15.26.25
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 22 Aug 2019 15:26:25 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v2 00/14] arm64: dts: meson: fixes following YAML bindings
 schemas conversion
In-Reply-To: <20190821142043.14649-1-narmstrong@baylibre.com>
References: <20190821142043.14649-1-narmstrong@baylibre.com>
Date: Thu, 22 Aug 2019 15:26:24 -0700
Message-ID: <7h36hs3khb.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190822_152627_225902_248E25A8 
X-CRM114-Status: UNSURE (   7.46  )
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
Cc: linux-amlogic@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> This is the first set of DT fixes following the first YAML bindings conversion
> at [1], [2] and [3].
>
> After this set of fixes, the remaining errors are :
> meson-axg-s400.dt.yaml: sound: 'clocks' is a dependency of 'assigned-clocks'
> meson-g12a-sei510.dt.yaml: sound: 'clocks' is a dependency of 'assigned-clocks'
> meson-g12b-odroid-n2.dt.yaml: usb-hub: gpios:0:0: 20 is not valid under any of the given schemas
> meson-g12b-odroid-n2.dt.yaml: sound: 'clocks' is a dependency of 'assigned-clocks'
> meson-g12a-x96-max.dt.yaml: sound: 'clocks' is a dependency of 'assigned-clocks'
>
> These are only cosmetic changes, and should not break drivers implementation
> following the bindings.

Any chance you can rebase this on top of my v5.4/dt64 branch?

Thanks,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
