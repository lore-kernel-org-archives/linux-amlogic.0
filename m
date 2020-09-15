Return-Path: <SRS0=PGU9=CY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EDF2C43461
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Sep 2020 19:51:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA0D72078D
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Sep 2020 19:51:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cnmyxL3k";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="cxGAzRO0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA0D72078D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iIgZeKM2Y2xQYXIBT0Ddr9fGUjDKWhCKZdVGBICNG6g=; b=cnmyxL3koYyGUabqguEMoPHXF
	CIRPlKAlWYmNTndWDJUHOreSXFvB5EcZQ3XeS8DgTCS6u2bxo57fwelB0OpB5XmLBrd/sEbx/BloF
	6fjXc/U4lb/t4ofqn5FWI4WSYj/EcqnUrMmpQVLndUroZZwC5MJ8cIB5ca+Mob7+Stg1V8ZwoVVeT
	0ish1ZIsmJRZiG4XMOMErFXIxH12guPYlxY3ISyG2x6ta1quO6L/THazzhL6/aimbORxK681HWyTY
	yqMscDRPbAz5bZhavGHgw9N8tVHajQYR0yDHo24CWhxZ0v+KwUx1pWcpEDpXGVjGE7NVg3fOE16w2
	G03243GTA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIGyi-00056n-Bo; Tue, 15 Sep 2020 19:51:00 +0000
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIGyg-00055k-3l; Tue, 15 Sep 2020 19:50:59 +0000
Received: by mail-ed1-x543.google.com with SMTP id ay8so4227020edb.8;
 Tue, 15 Sep 2020 12:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wGypR57e44lnrn/T3MrhnXSKZVtdZe8Et+2S99K2mho=;
 b=cxGAzRO0fXvk44Yp1ZSLcjtw7DvQRdbzcoFUQHSRSG8x/SNcJjgp2DTlAK4kA38ssl
 9pRExJ0CY6jQ/o2RuHT5w3f0vwmyO6B7/bNk6qnOU0hI/CseNYJC962F3PdUuP/m37dw
 vkqpM5Bs6ut5quo5WXzwdacP13xa86SDd+XgrA2KqO0yV1P9HPfyqYpiHIBfQujsk36R
 a7lZVbk4c07FN4deSbfivRYppXrNCCsBp0Eci0WXzNzUrypUY2jGmKdkNsOVjflQZ/DB
 wrYglXbfhGzeWTCXYbGVNVc7T4yd93IWG3gnYEhY7SP9CxH0FijTLI/JVyGEkb7zE9Lc
 Vg+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wGypR57e44lnrn/T3MrhnXSKZVtdZe8Et+2S99K2mho=;
 b=uZC5L8xlsIL5sXR+Iw7wCc/Tj7SAzLMhRcbnSuG8KwUsMKExuj7KVH6FMfaDxPGRzT
 90U78gsJadnAjUdR96lS5z+wVyoqcXAJuai9B5K3aFfdJh1ev0mDwktIOpWgsdOgoLaz
 orK/eMR+8m/BOQt0X5/zVmKKIpDYUn2+wdx4v2GEjScMsXUERAC72+Px9gvbMyynLWS2
 mu2feKRRoejR2wnArcS/8cOu33SdBn5Cz9PDN+ErlwNi5N1al5RWPs8PzmPRtrfxuznV
 f4Slh+QJDniHGQHHMHPeixQwzw0Komhpn1CI3aXwkMGNyv48bN5PvWFUnbSy4FC+0bJc
 PBkA==
X-Gm-Message-State: AOAM53214VPoJaq+QQjzC5IB0C9dO51kQINHsXJJAUwQLEgpMvqepY66
 Jf/TYn1Cd/c1Tuj8B2aiQfq+iqR8nr0kQzYK5BWMJQaADio=
X-Google-Smtp-Source: ABdhPJzzRC2QC1wIF17cEAtKLsbw4RuhNY4uEwxeqac8HFjP8QzYvGhHRSXvbnqkYFgOISrNFHzQZPtg+Ao/rliAHfc=
X-Received: by 2002:aa7:c0d3:: with SMTP id j19mr24908441edp.40.1600199457020; 
 Tue, 15 Sep 2020 12:50:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200907083300.14412-1-narmstrong@baylibre.com>
 <20200907083300.14412-2-narmstrong@baylibre.com>
In-Reply-To: <20200907083300.14412-2-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 15 Sep 2020 21:50:46 +0200
Message-ID: <CAFBinCBz_wR7_PcNN7LYxz-Vw+p2HZWBPqQg6z_w5nN+v+tU=Q@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: meson-axg: add VPU and PWRC nodes
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200915_155058_166632_589385EC 
X-CRM114-Status: GOOD (  13.26  )
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
Cc: khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Neil,

On Mon, Sep 7, 2020 at 10:33 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> This add the display VPU node and the power controller PWRC node.
s/add/adds/

> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

[...]
> +               vpu: vpu@ff900000 {
> +                       compatible = "amlogic,meson-axg-vpu";
> +                       reg = <0x0 0xff900000 0x0 0x100000>,
> +                             <0x0 0xff63c000 0x0 0x1000>;
my plan is to replace the "hhi" binding with a reference to the HHI
syscon - but at the same time I'm not sure if it's a good idea (or
whether for example CVBS support should be split off into a sub-driver
which is then part of the HHI MFD syscon).
maybe we can align at some point about the next steps with the the DRM
driver (as I want to add support for the older gen SoCs still)
that's nothing for this patch though


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
