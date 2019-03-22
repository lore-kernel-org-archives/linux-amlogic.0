Return-Path: <SRS0=ykIO=RZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDD4EC4360F
	for <linux-amlogic@archiver.kernel.org>; Fri, 22 Mar 2019 23:05:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9EC5D20870
	for <linux-amlogic@archiver.kernel.org>; Fri, 22 Mar 2019 23:05:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HwEATUFJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="p8v++S0f"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9EC5D20870
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q2/jCyGCPsX9al/cdEj1vl0BjIj8KXyPJsE8KxMfX2M=; b=HwEATUFJuUpgCw
	6ZTp/PoUa3L7MGBOyqJaOwumFqzWAXObMuemU7/bASGQsZbjN9J0aM4LKquh/jhXIrS/zH4F/okMa
	Mu+jjjMUABgmJ/3fjv37cI2E7TnGag4QAdKqqLLQGNZEjsEZWrt3Qc0N93nMRhMgWKZ/X+j1B17CY
	cwlLpI00DOaC0VD4ty+jwzH42BdY0PrEUyVe9Dno2vmXQ8lA5be/GaENvGDIknM3H1JK4lCSd7LhL
	NsmDgoMvdOq8fvz2GeCgwFrCqYl+9c2PdpMtZRoBowCO2ndoD+fAYRLfhGHAKTJT3L4kwrBcA6bQQ
	11LPdLECm+jzZH7jZayg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h7TE0-0001t1-Am; Fri, 22 Mar 2019 23:05:20 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h7TDw-0001s2-7Y
 for linux-amlogic@lists.infradead.org; Fri, 22 Mar 2019 23:05:17 +0000
Received: by mail-pg1-x542.google.com with SMTP id y3so2460143pgk.12
 for <linux-amlogic@lists.infradead.org>; Fri, 22 Mar 2019 16:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=ck8I9xVSPa49Ljs8ENnCytz2yv8MJ2DGkzCivr0kymM=;
 b=p8v++S0facyjzOMMYrhN+i7AsNdy+xhNS1rs/mq1LEkHB3+avX9IPpuFko+IvPb9lW
 TUvY9OVkFf3yAOdxpSCfzwHo2DuY0QUPov6jBySE090nB2mTOrBpjp/+qU1rEVR43DVO
 61Fmeu024fwyVOL1ATaE/DPFQE7InUxnU5za0DSYwN6MrdnWIFtRCfLT6JmUqWh0TlxV
 3OgGegVInD4ayS9bT0wRgxsq1jwtLi6dfVY+776PgtIequQIiFPNM03z8cjuwEvyStJX
 UL4BulipK21Df99QHrQLBT4LmAOgvsXHG3GHJ2PxGasZaKn7ZCW+rJy8trT9rvhkpa7t
 XB+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=ck8I9xVSPa49Ljs8ENnCytz2yv8MJ2DGkzCivr0kymM=;
 b=WuyRC3M+L7PRIfbKBMoD7fRjrDgIrQyEu8NOLJz5YPkM14nfYVblVL6fPZBA6m5Z6s
 Ys43xzTHTD57dQh34TBhjzn2z3aYpYPBh5G6Iy4iveNuESyosC/Cr15/RXJIVLO6Kgrf
 zuIaBMhseqPTwQjeV+14/0/QAqklnknSXksUbbdqVEj/Ds3+skkIWCrTfybGUMTf7UOp
 eUcvxvXiikuAfUs8T3KNDbBtkLQ9vShB94zBhmDsAJjp2ua3xPqjVZaVzhtCjM5PVJm4
 MdQh96blh3kybgkegD5kP7XXCnJZqTnxUin+KSWlLgMgVJ1ooKbgzf9Lc7hh1CgKT+yJ
 He7A==
X-Gm-Message-State: APjAAAXMe+1gWTQYsGCyD4ArzD9F1Zv0iEA5vWtufbrXcTIP0z91NGV4
 cIBuw0gxD7O/fSXrzYHZ3n8zgA==
X-Google-Smtp-Source: APXvYqxHBCrCVL4sZ2gjlPVXp8X9STJSVQ+0qugDdUjM68vAdY3tTWs+e12Lkl1UvlFlIyFxY1blRQ==
X-Received: by 2002:a65:6685:: with SMTP id b5mr11248328pgw.70.1553295914656; 
 Fri, 22 Mar 2019 16:05:14 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:6963:3508:5454:eecd])
 by smtp.googlemail.com with ESMTPSA id f65sm13514857pff.21.2019.03.22.16.05.13
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 22 Mar 2019 16:05:13 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v2 0/8] arm64: dts: g12a: Add peripherals
In-Reply-To: <20190318095851.4062-1-narmstrong@baylibre.com>
References: <20190318095851.4062-1-narmstrong@baylibre.com>
Date: Fri, 22 Mar 2019 16:05:13 -0700
Message-ID: <7h5zsa33yu.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190322_160516_294910_4242A677 
X-CRM114-Status: UNSURE (   9.47  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> Add following peripherals :
> - AO Clock + Reset Controller
> - Pinctrl
> - UARTs
> - SAR-ADC
> - USB
> - Mali GPU
>
> USB depends on the PCIE clock and missing Reset bindings.

I left this one out for now.

> SARADC bindings is merged.

And this one, as it depends on new clock IDs.  I need a stable tag for
those.

> USB bindings has been reviewed, but not merged yet.

Also depends on a reset patch for the IDs used.  This was just merged by
Phillip, but I need a stable tag before I can merg this.

> Mali GPU bindings are still in review.

I've left the Mali nodes out for now also.

IOW, I queued patches 1-5/8 (branch: v5.2/dt64), and will wait on the
others until their dependencies are cleared up and/or I have stable tags
to use.

In the future, please note all the out-of-tree dependencies for the
series.

Thanks,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
