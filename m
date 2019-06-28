Return-Path: <SRS0=LO2h=U3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB846C4321A
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Jun 2019 18:41:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C69D8214DA
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Jun 2019 18:41:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hY9kqxGx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="QY3rhsLu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C69D8214DA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E0VLuKvYOhxduNifEVYGagOw9yFDyiqV7lhcV73fRT8=; b=hY9kqxGxsRAdhJ
	9ePmLSab+DGWhzufjwDf4D7IgD63pUizEoHG4PeCW95OlE5jkPDPoKGwJJj+7eH6TP4ocLFzFqWU3
	54PcTKnC4tkUE0zq7PTwt2bTPK0du+s3CrZ7E7+dpWEXkMBy+GJ2AErIus8EcZyaayevSfnuwqdA9
	06gpHqDCN2B6y9IZzJR4BdDTg+qNQ8hcidI0ZYMmM6aWZBiRZZ4SJHErN4KDAd2PaPfQcDSFfEDGA
	DtiPnIuFZ8HGg2SjqAqJlrGS80ggG1QFskunkwGY9rWD8++fM85vaNH5MPaplL1d5l6X5XL2JO87E
	cbrmsBRKIZWfc9GkcAMA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hgvoL-0007cI-Bt; Fri, 28 Jun 2019 18:41:25 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hgvo5-0007Of-EB
 for linux-amlogic@lists.infradead.org; Fri, 28 Jun 2019 18:41:12 +0000
Received: by mail-pl1-x642.google.com with SMTP id e5so3690067pls.13
 for <linux-amlogic@lists.infradead.org>; Fri, 28 Jun 2019 11:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=fQE3yjXSmEBBK7nvjeoLovQEjasyqjJ5dyMYD6mC7O8=;
 b=QY3rhsLuoD6pfWkXWngj/KQZLMCZ6yKpGYJkF8Udg5G/NGlFdbnzzTaxM/GRBX+11c
 AnNNBc/vjnaGlBRfRxmVRJoln28jtZgEKcNVIEXES54GLsmjjJVEjQGOwQx3duZv8EFD
 bg778Ycp1xeyCJe7RSwG5IXqT5y/7DDJtHpUMuqo1T0kome3xAVG4DxMia5CUsq+d4VD
 8f4NSX1ZdBgmdmwL/W+JZt8Sq6C3jNm2Iyyz70u/HmpqhhcQUZ+L/yrkulUFpykYYq3Y
 RijRHD7GKT4cLc9K1EZckwtGCnlSApICLOCkfIClG7XztQWsSpDyHnltBacBvaUmhgzs
 oaaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=fQE3yjXSmEBBK7nvjeoLovQEjasyqjJ5dyMYD6mC7O8=;
 b=ilCVrMaoTRjjnpbBozEXeypFEcCe5k+hCDxEIr3hPs3spCF2BjHPXNqaOgG9/TDLX6
 IZXVquTS6CJMTiKdDZcLp8+v0okX/WPlt5gxwyOk7XzTQR7mHdqMVA0KIDjbHa1W8cQM
 BMmAAAZJ9q5HmgkCGfufC0tfpEevGAU/cFpeT54UMPrSuLUz88TltvdR9SwxvNPZvl6C
 eIm62YgArCADymD/8/lBn0b/sRr+l8t7JFwF5KgIYo1znJeZ/l/xv7Cn5OaucZgQP/US
 6/+MQ1FlpzRtFsDwPwr0c0fHT7FGNNybAuXxKcsZIR6rW/Suk0iO+KTymVkSYVe6S5jV
 Id9A==
X-Gm-Message-State: APjAAAUaA7Jdghw0q+qyYPcccJVGl3QE4iKHv2UPwzhjGZtqxAGRNqnQ
 34zOQ1LLVLK7OyqKJuO20n2Kcw==
X-Google-Smtp-Source: APXvYqzByc/4yIWQSC44smY+Wmaei7vfmV5iHq9ECor2e7zK+iHHiRISkR4djb2VDtszsmN6vH8dvw==
X-Received: by 2002:a17:902:7687:: with SMTP id
 m7mr13517930pll.310.1561747268178; 
 Fri, 28 Jun 2019 11:41:08 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152]) by smtp.googlemail.com with ESMTPSA id
 q144sm4238550pfc.103.2019.06.28.11.41.07
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 28 Jun 2019 11:41:07 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH] arm64: dts: meson-g12a: add missing dwc2 phy-names
In-Reply-To: <20190625123647.26117-1-narmstrong@baylibre.com>
References: <20190625123647.26117-1-narmstrong@baylibre.com>
Date: Fri, 28 Jun 2019 11:41:04 -0700
Message-ID: <7h8stlr1rz.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190628_114109_539353_EE637A1A 
X-CRM114-Status: UNSURE (   8.61  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> The G12A USB2 OTG capable PHY uses a 8bit large UTMI bus, and the OTG
> controller gets the PHY but width by probing the associated phy.
>
> By default it will use 16bit wide settings if a phy is not specified,
> in our case we specified the phy, but not the phy-names.
>
> The dwc2 bindings specifies that if phys is present, phy-names shall be
> "usb2-phy".
>
> Adding phy-names = "usb2-phy" solves the OTG PHY bus configuration.
>
> Fixes: 9baf7d6be730 ("arm64: dts: meson: g12a: Add G12A USB nodes")
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Queuing for v5.3-rc,

Thanks,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
