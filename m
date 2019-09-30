Return-Path: <SRS0=PIQu=XZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46652C32792
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Sep 2019 22:47:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13E2A2086A
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Sep 2019 22:47:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="H7MaTssV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 13E2A2086A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e05+Sk3fypIqABK035BTyeZ2N4Zb9jAP0hyn4XXe4pk=; b=H7MaTssVwX21Dq
	WKo4T4bLWpEPP6CwGp9Q6598JCGXuOeOUtnPXslwGNyL8gy4DgKvzaWIOWX9zRIP+f4WHcV9+ETbU
	hnn6KKDFigxaXBKiXDO74sK18nPw6qCRCd3yRufxa//Ats/6TFqQW5fxUbMywY+dNUB8B8cgByWl5
	fMBtEDxFdBHrBYPIH8jAh7x3/Dl+a/sTTgFx4v4wkftIal6Hf8tFj834Mu5UHKCl65b7DIUllX3iO
	ICR76Yni1/86ZOxM5jySUiphltFiXe+1u0ubSnMRS4cE/ZvHdRijVn3I99ScJUp6FeZmwoNh48SJ1
	1f0ei/i5R3CBj5lZLFTA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iF4S8-0006pu-Iv; Mon, 30 Sep 2019 22:47:36 +0000
Received: from mail-oi1-f196.google.com ([209.85.167.196])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iF4Ru-0006fV-5A; Mon, 30 Sep 2019 22:47:23 +0000
Received: by mail-oi1-f196.google.com with SMTP id o205so12636128oib.12;
 Mon, 30 Sep 2019 15:47:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=6QfYHOqCFke/B9nmo9C0f+3JabbnkVFCdcopO1uSlDs=;
 b=mdoDBQ5t6X15iqEhgYC6+Jl0CL8r3+CB26JpLpshtoRcWm1UvcMvruCCg5pcHDZ/z1
 e0IeGlycTtl0yLstpW3/0QVKYpA39GVyc0JeEb+3/Y1ZX8i0R6usvXO4VNkdXpxf/SIk
 VG/eqp+MRHU+JoVXUDYgShCGwghRsot1IF4nUH0zi2ynqf6n7pnglx5Lc7ppUmIKuwkG
 vgy40dkUcDGT+TJaDccRuW5k+U6JJPSzhpR9D+1iveSbeQWFMgEX1fmAMQdiK7xwOVg9
 pcC4KPi4+dyeA2YVijF9HU9dJGyRSalzTIm2dfw4bFD5/XWiP5oFEEglF56+zHJtL43L
 qEYA==
X-Gm-Message-State: APjAAAVHcuyhlRhM97ufLtGXN80fyFYoWe9ajjXT5rCq6IlIgbpOT4z3
 ThKyrYSPOKPJ7R8J21QeaQ==
X-Google-Smtp-Source: APXvYqz+3Izxqt7xvoQxGYq/m9r3fsWqTy00V2Zd2TZoeuaEbOZjGQBkBMnNbE31sjBCAiNnJfXlUw==
X-Received: by 2002:aca:c505:: with SMTP id v5mr1228689oif.79.1569883641379;
 Mon, 30 Sep 2019 15:47:21 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id u130sm4705832oib.56.2019.09.30.15.47.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Sep 2019 15:47:20 -0700 (PDT)
Date: Mon, 30 Sep 2019 17:47:20 -0500
From: Rob Herring <robh@kernel.org>
To: Qianggui Song <qianggui.song@amlogic.com>
Subject: Re: [PATCH 1/3] pinctrl: add compatible for Amlogic Meson A1 pin
 controller
Message-ID: <20190930224720.GA27280@bogus>
References: <1568700442-18540-1-git-send-email-qianggui.song@amlogic.com>
 <1568700442-18540-2-git-send-email-qianggui.song@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1568700442-18540-2-git-send-email-qianggui.song@amlogic.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190930_154722_195452_69635BA5 
X-CRM114-Status: UNSURE (   9.32  )
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
Cc: Qianggui Song <qianggui.song@amlogic.com>,
 Mark Rutland <mark.rutland@arm.com>, Hanjie Lin <hanjie.lin@amlogic.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, Xingyu Chen <xingyu.chen@amlogic.com>,
 Carlo Caione <carlo@caione.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, 17 Sep 2019 14:07:20 +0800, Qianggui Song wrote:
> Add new compatible name for Amlogic's Meson-A1 pin controller
> add a dt-binding header file which document the detail pin names.
> 
> Signed-off-by: Qianggui Song <qianggui.song@amlogic.com>
> Signed-off-by: Xingyu Chen <xingyu.chen@amlogic.com>
> Signed-off-by: Jianxin Pan <jianxin.pan@amlogic.com>
> ---
>  .../devicetree/bindings/pinctrl/meson,pinctrl.txt  |  1 +
>  include/dt-bindings/gpio/meson-a1-gpio.h           | 73 ++++++++++++++++++++++
>  2 files changed, 74 insertions(+)
>  create mode 100644 include/dt-bindings/gpio/meson-a1-gpio.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
