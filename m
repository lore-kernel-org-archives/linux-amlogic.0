Return-Path: <SRS0=KQOD=CX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DCB4C433E2
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Sep 2020 17:57:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFD1220757
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Sep 2020 17:57:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="THNOUU+C";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="jwtToS9o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CFD1220757
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PDtU54SHKGbCj0g6seA6tLouu+V+U8OZ6SxCz3+TD6c=; b=THNOUU+C4zWpjGJDBAIYXEKEw
	u2+VPo0fDN9P2i8hjQ+ka1kDzum6fKt0d5N8cOBycwj+5aSOdWbg6LyexvesYXY11YDqh+LAJODKr
	ui01JgyaoN6IzA+i7iSZlZxOSTy7LrNM3kA4cul+zeC11nO2xtlFjW47e4jFwk0YdrYv+UlXpL2Gn
	IroFGQXuDtBrC9QH5nmtVKCEcDBxBxA7Nk23HdmH6KcG2UR+pJafOmeyYQQ4JJ5Tyh5OXnz23wk/q
	uXYvYezlUwV4EjbHTxZaGfoui7P8Hfc1NWa6/hqmyU6A5zEScDwvKSjZceLpK7hsFKETyWQeZ+oTW
	u2E9EKxjw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHsj2-0007dR-TV; Mon, 14 Sep 2020 17:57:12 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHsix-0007be-U2
 for linux-amlogic@lists.infradead.org; Mon, 14 Sep 2020 17:57:09 +0000
Received: by mail-wr1-x441.google.com with SMTP id x14so540769wrl.12
 for <linux-amlogic@lists.infradead.org>; Mon, 14 Sep 2020 10:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=UU4YK6KB8K/yy0/XwXQD3IB16jnJ9qXibO9pMdbOoRY=;
 b=jwtToS9oyke/snrB996EEguzitHvKg1MFr/NuNomJxr/JeDCSBQYtXgqiGrDWMyIBs
 WDS3GVeff43pAMOPmcCu5lEyPOaGEdBzfrGEEEeQRfH9CxgRRkBFrmJX2JSo/zb3mL9d
 vPcl+lpYmHruHXxO75CbY2y5HzUCvKb4Kqq0MjeybOZicYlKcHaMXmmeFqLO/BJAZb10
 Ljw2YIRyz80wONxWjFwDDwbvdPEG6MHaVEVZUKCAUJUNHCM4Txj9IdsbkWSiPSnc1ElT
 5mGh5/Io787xP744ad4MWvYjT+EWejKEcEdL8QRvoORbkI7kDI30IejEs/xWMe58tBQm
 1vIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=UU4YK6KB8K/yy0/XwXQD3IB16jnJ9qXibO9pMdbOoRY=;
 b=qQtSVQiQGjA9l7YIkQ9mOJ2otbq1boqnapuFC0ATcCkEPsCfb2E6DowZzZKdGry8wB
 PFYqvI2hHWiEdUKKgz+4sPHbBjOZLXEeWTObWjYZKQOgay/lHYiCEKVWBJaPBKq63mbk
 OEtwPVsYVGjTDHhvGm90g5U0Q5vsL9wuWr6rSgh3QKjHWsVjhG3r+VHjy5CWNrWDwySA
 MZmrr80Bi++TAgUx1s6KW9J3PCApbB7UvH1cmpsx3AKCxmmAMcHvBptzu2Ytv++r/75w
 JcIfGGxLkEVujYYbIXV1j9cO5iiBB8u8yl2/UNNHS4KfLyDFuaxyyXmfCDCCYYxXCKJE
 Ns8w==
X-Gm-Message-State: AOAM530UNT8K2//gNLfWx4UlkMVrgcVTc7NbUWTv1RzngGYuSZcuaxQm
 9U9F2oGJenGmqCjZzacr1EhmkA==
X-Google-Smtp-Source: ABdhPJwLbvA0bwNZUrY2/J2Jh4bpdu76XjGMxG6gbt+toWQz5yZ5slWLQdM7mvfzT3xeFaz6EtnIkQ==
X-Received: by 2002:adf:f203:: with SMTP id p3mr17433255wro.339.1600106225140; 
 Mon, 14 Sep 2020 10:57:05 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id m3sm22115050wrs.83.2020.09.14.10.57.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2020 10:57:04 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, kishon@ti.com, balbi@kernel.org,
 martin.blumenstingl@googlemail.com
Subject: Re: [PATCH 0/5] usb: dwc-meson-g12a: Add support for USB on S400 board
In-Reply-To: <20200909160409.8678-1-narmstrong@baylibre.com>
References: <20200909160409.8678-1-narmstrong@baylibre.com>
Date: Mon, 14 Sep 2020 10:57:01 -0700
Message-ID: <7hft7kw8b6.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200914_135708_022049_D84CBBDC 
X-CRM114-Status: GOOD (  13.42  )
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
Cc: linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> The Amlogic AXG is close from the GXL Glue but with a single OTG PHY.

minor grammar nit: s/close from/close to/  (also in patches 2 & 3).
Otherwise..

Reviewed-by: Kevin Hilman <khilman@baylibre.com>

Kevin



> It needs the same init sequence as GXL & GXM, but it seems it doesn't need
> the host disconnect bit.
>
> The Glue driver reuses the already implemented GXL & GXM work.
>
> The USB2 PHY driver needs a slight tweak to keep the OTG detection working.
>
> Neil Armstrong (5):
>   phy: amlogic: phy-meson-gxl-usb2: keep ID pull-up even in Host mode
>   dt-bindings: usb: amlogic,meson-g12a-usb-ctrl: add the Amlogic AXG
>     Families USB Glue Bindings
>   usb: dwc-meson-g12a: Add support for USB on AXG SoCs
>   arm64: dts: meson-axg: add USB nodes
>   arm64: dts: meson-axg-s400: enable USB OTG
>
>  .../usb/amlogic,meson-g12a-usb-ctrl.yaml      | 22 +++++++-
>  .../arm64/boot/dts/amlogic/meson-axg-s400.dts | 10 ++++
>  arch/arm64/boot/dts/amlogic/meson-axg.dtsi    | 51 +++++++++++++++++++
>  drivers/phy/amlogic/phy-meson-gxl-usb2.c      |  3 +-
>  drivers/usb/dwc3/dwc3-meson-g12a.c            | 17 +++++++
>  5 files changed, 101 insertions(+), 2 deletions(-)
>
> -- 
> 2.22.0

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
