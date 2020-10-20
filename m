Return-Path: <SRS0=scox=D3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8DA5C388F2
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Oct 2020 19:39:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 545762225D
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Oct 2020 19:39:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RqQ8Byq3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="RAVu96uC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 545762225D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8Q7gYCyNrB75zHgFaTKNGAb6WBZA8GuZ+Z3cvD04Yas=; b=RqQ8Byq3H40in3AHzL/fSj/cS
	+pDLkhGlRn84TtIp1kzcLoPfKiXUGsAFGTqHmrloI5Co3JD5sVerZEAqUmmYVeQQRWOUQcPnOevJE
	0c7Qn2fXW5Cv3INGT+L9MplzqUzR2wNDXT63ncmOebSkH0a5vSfbkdM+VRz8kYKp9p4MZrfj+7obM
	65g6pcxgxnjupWHOycbFyJSycx6YNIXsRht/emu4rBm0yOlflubYofyFuohaCwjnxgep2j+vPRi91
	aCPXOlBlycrrw2yC0dZlFwESL/eUASfnmwjqAS8gdAJPvuAt8/NzUmD2QZKKIx8/DVc+kls4Xc0gK
	wx1lWwUvw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUxT6-0000uK-R5; Tue, 20 Oct 2020 19:38:48 +0000
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUxT4-0000tj-IL; Tue, 20 Oct 2020 19:38:47 +0000
Received: by mail-ej1-x641.google.com with SMTP id u8so4498495ejg.1;
 Tue, 20 Oct 2020 12:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0t/6lxdfJB1VtvUS8CRTLcR9vrrpuLwBQkRpQbczdss=;
 b=RAVu96uCHOLD8Tm3mF3Ij513xTplm/3WaVxFJRsxQvH6/Ma53nSbEdwB37DX7YGqA3
 L3NU6hwBoZ0ZNWrfwDp7TB9I0udOnhp88Et20D3oz4Vo7eSjhLdPDOYr7aIqKoBB0zTP
 lRm3G89BwGWyNuY1CXYr3BtGY19YCKwdpuJpkArD6L0V7qCeezDGRsaexYzEYI11NEnz
 PlscX/yOkz6nEeddfgo/lQKlOgUxOL0ouEsOTLlf0RMlgVmAozJmPNpRP0lOazvlm4ah
 0pVh4ICDQ8GAbks9xr39sZwYwasCGt1rhzMcF7LO5MgtOGdM/AtO8Fm8ShPNWMDFoE0/
 Q/4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0t/6lxdfJB1VtvUS8CRTLcR9vrrpuLwBQkRpQbczdss=;
 b=IRam89pzQQxx4SMBQrN74kcIJi/UC+9lNLEOqNL0ba07efh8BXHgA6x4+D1Jn//ebU
 CNYdkOhuruPBefUut/zuID4g9EQ3Hn0ghx8rGS804ccWW8DNoutjfIodeZTXBkI0Gp8P
 gRLvAAESw+3zwzHNWWMzXtRyyKb95uk4QVY2VYlE/d9fnUMR/ckS12qoIV3YLn3HBjZ8
 ItVTqAm1Yyd4LCpOkX22DYtReX9SgnWHA+rz4pyHeLq5x2CB6MPvpaQlAJLpUxW8wktt
 JE4c9iq7FQHIAexYsBUEZoYx/Jf2aojalhNPi6iuwSNz3GjEY45+oH69A23OSXBgducp
 328Q==
X-Gm-Message-State: AOAM531afF8r2RylqdRy2Zepa/7y4rrRoJELJ7/6wTVi93VgPrmiEGIA
 MIW2ITZGyaXQi69nFDp1/LXGyiFg2TLNdbn+fSs=
X-Google-Smtp-Source: ABdhPJzm0r+f90HVNAeb0yNZulVGpiqUvDFPFj8PANlV6Dz9Cf6ehgYOH7h2wBTMI8K/6QlolIQY2DPRGjQiWXWFH6s=
X-Received: by 2002:a17:906:cc0d:: with SMTP id
 ml13mr4826136ejb.2.1603222725387; 
 Tue, 20 Oct 2020 12:38:45 -0700 (PDT)
MIME-Version: 1.0
References: <20201019144809.943608-1-narmstrong@baylibre.com>
In-Reply-To: <20201019144809.943608-1-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 20 Oct 2020 21:38:34 +0200
Message-ID: <CAFBinCBxSdhutZQz2LFkoZwQT35gW-T2W3KX6-M5mp-XfZy2vg@mail.gmail.com>
Subject: Re: [PATCH v2] reset: meson: make it possible to build as a module
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201020_153846_621844_546249DE 
X-CRM114-Status: GOOD (  11.00  )
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
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, p.zabel@pengutronix.de,
 Kevin Hilman <khilman@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Oct 19, 2020 at 4:49 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> In order to reduce the kernel Image size on multi-platform distributions,
> make it possible to build the reset controller driver as a module.
>
> This partially reverts 8290924e ("reset: meson: make it explicitly non-modular")
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> Reviewed-by: Kevin Hilman <khilman@baylibre.com>
> Tested-by: Kevin Hilman <khilman@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
