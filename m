Return-Path: <SRS0=PGU9=CY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2E97C43461
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Sep 2020 15:34:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75F3320770
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Sep 2020 15:34:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kGo4jNrC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 75F3320770
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LYzXd/sfzzgNY49XJpcTWacihsCO5jIjzWyYb5ltvhY=; b=kGo4jNrCY9a++1nEMazFsrrlU
	Va/STJxSAn7nZeIlD0n3idWBtNQMLOHpGy3FOR39domP1IbSmxlGkGXi1I5kalU5Jg5SCtJBG6KE3
	zmp7BPMwJmFwPOTJFcY0KdglclwB4TL8e+NmW4VcNyexD7cp3zWZ2NQOYE89i51lBTWk89iPMOPT5
	FvGGsZhj0l/zWzg6mA0Lq84F2/2lfUnkA61SZSUuwUcXX+eHSC1PXUldZeJ91lzX1p2Jn9ulq4Gvt
	utuT2T5ZWDj+4Z1bXdjLef4lGs8srRkhpY50AxJDfkDYfCAYKQglIr23VouTrrDWe1mDh/mNbuRve
	Zda3+ajSg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kICyJ-0002wh-6F; Tue, 15 Sep 2020 15:34:19 +0000
Received: from mail-il1-f195.google.com ([209.85.166.195])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kICyF-0002vF-ER
 for linux-amlogic@lists.infradead.org; Tue, 15 Sep 2020 15:34:17 +0000
Received: by mail-il1-f195.google.com with SMTP id t12so3424056ilh.3
 for <linux-amlogic@lists.infradead.org>; Tue, 15 Sep 2020 08:34:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1fyZNgMatRtDRm5F6K1pH9IP38hhZV0WXalrPxYTXEE=;
 b=bdlbEEazJwXJopVTjkkHPBTcKe68UM+2rGoUBpunn6376sR41dY6a68adyIt1ZlJ1b
 wj2SBSRjlfdVXa8BuJFY+Rpbcn54XEMatWXgIqjL2nylCmc9V8vH9g8LbKduG/Q/v1oX
 7rkXz8nPF5VJWO9pL5EYiaRRAHD3FZ3RY1UUMkqIzO/7EemrFV5eXN9p6M0s/tfv+oPx
 ffM8h8p5aAEYYnUoPkjR+PxhqXziXWSyEV8QjwohDnY2GYFzqLkzcUhLu9HhOihY3oZ5
 g6JI8BVXw6J/zPFwVupWUeLSasPOppvUVRx6krIV3ckHytGJqjBZjcGL38TSzSoIIDyC
 n9Ew==
X-Gm-Message-State: AOAM532zjaGopSod9WS0Kbk4QZOdP/5nMTDodnhfL0LfAe1WVB+rua9+
 XDVQPFlQ41TMSdZRMSyL9w==
X-Google-Smtp-Source: ABdhPJxblB60qGKbpa/uRK4I1ZRiB+vOa9NARrpUQLiQeXrWQ1UDd3ksQ1EdqPx06vtV1foov4egLg==
X-Received: by 2002:a92:8509:: with SMTP id f9mr14662065ilh.253.1600184054677; 
 Tue, 15 Sep 2020 08:34:14 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id m87sm9266352ilb.58.2020.09.15.08.34.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2020 08:34:13 -0700 (PDT)
Received: (nullmailer pid 1988443 invoked by uid 1000);
 Tue, 15 Sep 2020 15:34:13 -0000
Date: Tue, 15 Sep 2020 09:34:13 -0600
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 1/6] dt-bindings: display: amlogic,meson-vpu: add
 bindings for VPU found in AXG SoCs
Message-ID: <20200915153413.GA1982161@bogus>
References: <20200907081825.1654-1-narmstrong@baylibre.com>
 <20200907081825.1654-2-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200907081825.1654-2-narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200915_113416_721089_CC411502 
X-CRM114-Status: GOOD (  14.38  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Sep 07, 2020 at 10:18:20AM +0200, Neil Armstrong wrote:
> The Amlogic AXG SoC family has a downgraded VPU supporting only MIPI-DSI output
> after it's ENCL DPI encoder output.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  .../bindings/display/amlogic,meson-vpu.yaml   | 36 +++++++++++++++++--
>  1 file changed, 33 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml b/Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml
> index a8d202c9d004..e2e7d99d8ace 100644
> --- a/Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml
> +++ b/Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml
> @@ -31,8 +31,10 @@ description: |
>  
>    The Video Input Unit is in charge of the pixel scanout from the DDR memory.
>    It fetches the frames addresses, stride and parameters from the "Canvas" memory.
> +  On the AXG family, the Video Input Unit direclty reads from DDR memory.
>    This part is also in charge of the CSC (Colorspace Conversion).
>    It can handle 2 OSD Planes and 2 Video Planes.
> +  On the AXG family, only a single OSD plane without scalins is supported.

s/scalins/scaling/ ?

Otherwise,

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
