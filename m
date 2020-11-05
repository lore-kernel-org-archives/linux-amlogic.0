Return-Path: <SRS0=vaug=EL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E11FDC4741F
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Nov 2020 19:32:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62A1B20728
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Nov 2020 19:32:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iJldBFJP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="PjLYFotW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 62A1B20728
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Aa9oD0XEcnZZSeg2Rs5c9WUC/gUWuRG40YxQftHY8Ok=; b=iJldBFJPmlCZCG4UBbHKxyt+CY
	cNF9Su/GwmuXl4+jtUJqwMg/1DiteDSbyu/M/n5RCkRLIwXMEL2QR0OA/dVbtlqK/OqqOYDMh0+LE
	8GEHXr7CZ0dPa2F4Vji84cTbwLyP9dMKY5JoOaIji2/jrxZRc4/dAsWomVzA2cvJ80JM+SXpVP8pC
	N4FUwKhEPUxvJwArkQtLxN/eskEGOpjmrsHBaKs5dZCb5iAXUbBvN7vEamxXCwGFIXynX7yvyL8OE
	Ye9pDzIo7mP531Ifsezpva/loWGuW2B0InzcjrZhAjLJ3HF94A+59MQd+y0RSgD0h7P8LSXBt31VL
	3TO68qPw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kakzR-0008Kb-AW; Thu, 05 Nov 2020 19:32:09 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kakzO-0008IW-0Q
 for linux-amlogic@lists.infradead.org; Thu, 05 Nov 2020 19:32:07 +0000
Received: by mail-pg1-x52c.google.com with SMTP id r10so2015247pgb.10
 for <linux-amlogic@lists.infradead.org>; Thu, 05 Nov 2020 11:32:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=0G0IXhBucv2N2cTx5Rb2GRJ7etitMG0FuNpN+t25+nc=;
 b=PjLYFotW85Hzzn/mygYTIri8c1tkd/uOrFnfzqsqSVUuWoe3HDI1iYRWT0eOtkDQ+K
 cRblOP2VwhS4JfrXpjcECI4IHFxsQOq5aMJ7hy+IE8Qk+ekDhHGDumhfpkweNhFoi1gN
 cTPs5ZEJt+kKRY1pcEi1TLwj+/dww9T//9bri1uG+Msd2x1VB1ZuZ0RiJftXrbIQyT3t
 MP+40b1yOHArf+N6wTT7JIsMAjOrPrKZDr0+HFf7IqVeHhFJAH8SqPMG4YggeGy6Fefq
 wMPXtBzbDf6Q6wuZoCdekN/8h2r/5eSrm4bev26zT3WPcngpnfD1o0T2sDyqTnVX52ZA
 hrvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0G0IXhBucv2N2cTx5Rb2GRJ7etitMG0FuNpN+t25+nc=;
 b=FVadEwH38FsfQxmHgU6n4/7has0GA4WbhQ92sX42hp7iAUFyHVZoiALys4NKCcc5h8
 eY5zOfq6zGy1ffBs2mOTjTDhTgzsezzOFHO4zXNhy3HlSVsoh9I5hk+jzQryCo5BR8t6
 pS7Mftp70cAJDeR+001fwI039lwbx5ossIoHcCAZpx+4FV40Ed2wHJ3f0FkyHZ3LlpoN
 x3Zsto/q1waYZ7zGD48GmDHEYpHYR0nsxrjcVTICkn2eJRyLBqWfP85jxXLn+8ninuNR
 5k77LBqHtyodoQBuxGL6tkroh5XquXMuoyeOj0s7jD9+RmIoIgsM+JZRWhaVU+y4jrlz
 AxLQ==
X-Gm-Message-State: AOAM530UHHZqJhotzao8QQ8pekp7QuUfVfy4tTR339rR+IbYjsf2SVIa
 p7ZLu83mxDR3Sy7kamJtxBG0Bg==
X-Google-Smtp-Source: ABdhPJwLk25IEr/KbTgbdMV/O/td4Dl2rI/TQyX7dBwcjQ+1lsF952T2of4J8FxwGc57oT+u+sGeeA==
X-Received: by 2002:a17:90a:7303:: with SMTP id
 m3mr4167317pjk.190.1604604723708; 
 Thu, 05 Nov 2020 11:32:03 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id z17sm3184518pga.85.2020.11.05.11.32.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 11:32:03 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Christian Hewitt <christianshewitt@gmail.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 Mark Rutland <mark.rutland@arm.com>, linux-amlogic@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: meson: add watchdog to g12-common dtsi
Date: Thu,  5 Nov 2020 11:32:01 -0800
Message-Id: <160460471585.10458.582735384564499478.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201101021012.24519-1-christianshewitt@gmail.com>
References: <20201101021012.24519-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201105_143206_177825_DD7F83D9 
X-CRM114-Status: UNSURE (   9.77  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sun, 1 Nov 2020 02:10:12 +0000, Christian Hewitt wrote:
> G12 vendor kernels show the watchdog on the same address as AXG
> so add the node to meson-g12-common.dtsi. GX boards inherit the
> same from meson-gx.dtsi.
> 
> v2 fix typo in node name (s/wtd/wdt)

Applied, thanks!

[1/1] arm64: dts: meson: add watchdog to g12-common dtsi
      commit: 7bd5175918eb4b294c0979c75056f20fd90a50bf

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
