Return-Path: <SRS0=ToB4=FP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB191C433FE
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Dec 2020 19:06:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A15D24052
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Dec 2020 19:06:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A15D24052
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tRXwBCl72Jx+GIc6KfjYdXjfCBDxklLkJBiYesU9z5o=; b=lgSsivBHYFj0sgOf2FM9PdAnn
	APOD/Xi7MppD1a0mqC+uek28ukAd7Kiq+zkmIA8P6SRFxwzfml7yzMQUzocGDlIfcj9AMhvgYYX38
	jvd7THM1JOukGmPItadQAyVWyAKPZxZUnNgXuJgK3fVayTxebkq8+iUr1jHGjG55DvhUmo/CpdapY
	hsiUSSApWqRxm1t1wPHRkYc49TJcjY09sx03afDkoySe9KXrcwaOTrOVCVz5dzoEM03DZq1RbNo1J
	TiZh/NGgVT3AXzzHjI4fURCMm2KdTKDAPHRKgH2YDCEUQ3jLERKdD2+Im0FI0n4ruhnVf0F63j6fE
	oVVISXLDw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knnk1-0004Gg-Dc; Fri, 11 Dec 2020 19:06:09 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knnjx-0004Fp-Dj
 for linux-amlogic@lists.infradead.org; Fri, 11 Dec 2020 19:06:08 +0000
Received: by mail-wr1-x443.google.com with SMTP id c5so6465626wrp.6
 for <linux-amlogic@lists.infradead.org>; Fri, 11 Dec 2020 11:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=fpPPTe1BQ4FWmxzhApqvIpf5cdvBk6k3Kx2tkhrQqYk=;
 b=znhCohWhGtvDiWVsybr8Pd8ygtlGPgI0TAkqeYHwam3x8bcHEsmf7MfbVhRg6V5AIh
 mPdtUG702qAKTX4JOiS47R9Es8sjd9ecW9EMAdBAFzfztalM/flT2dJ2Zq9FLB8RFRUQ
 yzNJsp8WXxb7b75O1Re5F+Z1v1SZQveAO/OWA2dT+SFwQ0IoXkrvLSjboY/UPlXKrBLe
 h4t2R3ZecrpvLxh0qgx/2EgbGktbKXQPb2bYh5uaPLkxj5FWKMja5DJ/0U8PhRrbTGzd
 MMQ8XQi5MQCt/acJq7ym5ndp1+Orl2iJqndfg05ZjqIa7uuNYO+uXIb4ln1hh35gg7Er
 m4Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=fpPPTe1BQ4FWmxzhApqvIpf5cdvBk6k3Kx2tkhrQqYk=;
 b=VW6+u9DuvYt7HGz6O8k+hD2luQFbwTLyN5oU5ZBfMtPdLkXGMaGMtoERjbwmWt7WiU
 eeBm3ArMYeoLvGxKoLYrAkx3g965QuHAoewfGM/0IrpunRQVmPtAVjjo4Jtbi8AOV8bE
 jrCStIbIumRp+Ss42ROxT4n1cMevfsnsW8xAYK4wb/SNmH8HgNSFokes8sYcJ12W2sGX
 b61fDy0wCYZTPRqZJG9CCdAlxAPqIcbLiGeHxyTKO2Cjfn+8SbbOxIS7yrCEt8pJ3gyL
 0osJaIvXGhY/t+VKZhGyDY04oBW1dQcSjIBxvV4s2W0GS70Aq6abX7wb/sm9SNDZnQnG
 jRkQ==
X-Gm-Message-State: AOAM533m99e54wHmNrT76bAvPoCUcTxycDgwJCWDTlcLefMMa/7bg7tr
 Won5wgTtGtKQq8hbCFfuJki4Tg==
X-Google-Smtp-Source: ABdhPJzrLKRJuKz6cmy+IlNBBNLpdXXMdAzHfGQGJJ0Se7kTtOYYHiKc5EuHAyQoRdk1GYaNM3didg==
X-Received: by 2002:adf:fa05:: with SMTP id m5mr15759389wrr.26.1607713564256; 
 Fri, 11 Dec 2020 11:06:04 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id q4sm15673046wmc.2.2020.12.11.11.06.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Dec 2020 11:06:03 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 Felipe Balbi <balbi@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v4 02/10] arm64: dts: amlogic: meson-g12: Set FL-adj
 property value
In-Reply-To: <20201210091756.18057-3-Sergey.Semin@baikalelectronics.ru>
References: <20201210091756.18057-1-Sergey.Semin@baikalelectronics.ru>
 <20201210091756.18057-3-Sergey.Semin@baikalelectronics.ru>
Date: Fri, 11 Dec 2020 11:06:00 -0800
Message-ID: <7hpn3g9n8n.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201211_140605_641006_B989DC9B 
X-CRM114-Status: UNSURE (   8.86  )
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
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Serge Semin <Sergey.Semin@baikalelectronics.ru> writes:

> In accordance with the DWC USB3 bindings the property is supposed to have
> uint32 type. It's erroneous from the DT schema and driver points of view
> to declare it as boolean. As Neil suggested set it to 0x20 so not break
> the platform and to make the dtbs checker happy.
>
> Link: https://lore.kernel.org/linux-usb/20201010224121.12672-16-Sergey.Semin@baikalelectronics.ru/
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Queuing for fixes after adding:

Fixes: 9baf7d6be730 ("arm64: dts: meson: g12a: Add G12A USB nodes")

Thanks,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
