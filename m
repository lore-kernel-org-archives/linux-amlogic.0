Return-Path: <SRS0=O3JJ=Z7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D07FBC43603
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Dec 2019 22:09:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1E6C206D5
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Dec 2019 22:09:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Mci1auD7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="yqoI3Wed"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1E6C206D5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1m3RFFZUaB9LGyYl7vnDAl6aqnHn9J7stpIZl3C9Y9w=; b=Mci1auD7cCHtJj
	ZP1Rq7i51fi0nZjz9Cak7brL/xMpEV6U2kqOmIMe7EVPSbBcpDNUV4olfJ7hUEbe3pXMbzd9d9rDm
	5dTGobClV1o2bYvaq7w89OFGBXnBurWGrlvBQDzDRs8HWNg5dnIXK4a+1lLxP4WMEL6D4HAK3ygII
	io+LbkuL5HS6L0Y4/+jGixaLHiUETnV1HwFdDtZGXjj0dO9wwAuup5JDlrI41FeuiNv0ZrGdwbQEa
	Dyb8ytQibbrwllkJ7BDNSgtExVLuTdQ+k0LxEqIQlqL1jtJtmhUDaw4A2BUFOrm6jtZRNbiFu+tHy
	OE8Bxll3yhVzmbqzSZjg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ieRDo-0005HE-Iz; Mon, 09 Dec 2019 22:09:40 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ieRDf-00058o-SO
 for linux-amlogic@lists.infradead.org; Mon, 09 Dec 2019 22:09:33 +0000
Received: by mail-pf1-x444.google.com with SMTP id y206so7947331pfb.0
 for <linux-amlogic@lists.infradead.org>; Mon, 09 Dec 2019 14:09:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=aH72KfB+jd8LoZ9WTIWQOhLHCco482dBV+3OetYANfk=;
 b=yqoI3WedmSPPH5+3eZ7ga+cYHKCC4gNQ3D5kXpyDlprI0f6kbGLO4sdxrvrd0bN8k6
 H9qxWAzCI63pOPBlXKaTLeqU5rDqkz+dDqurJLkSfXa5POqq7j7/3RCRlj3SWjbYfYlj
 V6fgcjE05Z6hk/oqlEos0KLQXDYHS5i8jbMMcwI/6LZbiYj8f/bEqhulSs28L8lYz78u
 3palGsGJGhkY3UHlFO+5WmaNEN26K/BQ+1wS+TOLDS0qIjD9erVYn15kMlV+PhJjo/Kw
 lJFkuo6zDnOlNNAD8C9OmuvUXdiBHsPiRwOonBcrcwrbyUwcuozDGVu4y0jM8K4xGXOf
 1ekA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=aH72KfB+jd8LoZ9WTIWQOhLHCco482dBV+3OetYANfk=;
 b=CILxC9aIbMrtgOPoYdzwWLPbXmCIFUCb5VbCRMa3pxgCv45S8zpFJT0PT/Ze+T/SHP
 bagf96v5hHeyiGB62CJtuc8pCgaSuG7AqhhEemFn8ZOUXZdCDDny5Y5hHU+fYsSPwxAb
 OqHaDGvIT0LZc9lOKD3VupSlDTFHfyWpjEIDyX1eUsIT8sqrArMu1aKjGkVPlI1cV3RL
 97AdG52VRuhTIt0wOwWMe1hFxMP3FoHqsa35wZD1XVRf8NHn5OfKlwGdS/4H5QJ1l50y
 2px4dY3LcEcb/WwCLV8fwj2ohCWkWDNNZHgbXRzaQgw7SrTR45d6Q/bXgftf+t78qY/w
 zJ9A==
X-Gm-Message-State: APjAAAUOAy61itPb1Tggy1HmxKnBKND4E9qerSvnTpJ7yvuin+InP3Nd
 GpQwBSIZcAVM9mZcvA+IcbmS3Q==
X-Google-Smtp-Source: APXvYqw9VHnx8+RwX5no7IWuPVs1FzEgFK1TIEbb0vRSourFalI7XV39vudP3wtb+25GxinvpiQYEw==
X-Received: by 2002:a62:8456:: with SMTP id k83mr17928443pfd.29.1575929371147; 
 Mon, 09 Dec 2019 14:09:31 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id j14sm501754pgs.57.2019.12.09.14.09.30
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 09 Dec 2019 14:09:30 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 0/9] drm/meson: add AFBC support
In-Reply-To: <20191021091509.3864-1-narmstrong@baylibre.com>
References: <20191021091509.3864-1-narmstrong@baylibre.com>
Date: Mon, 09 Dec 2019 14:09:30 -0800
Message-ID: <7hk175rw11.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191209_140931_918706_C4687496 
X-CRM114-Status: GOOD (  15.68  )
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
Cc: linux-amlogic@lists.infradead.org, ayan.halder@arm.com,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> This adds support for the ARM Framebuffer Compression decoders found
> in the Amlogic GXM and G12A SoCs.
>
> This patchset is a merge of v2 "drm/meson: add AFBC support" at [3] and v2
> "drm/meson: implement RDMA for AFBC reset on vsync" at [4].

Oops, replied to the wrong series earlier...

> The VPU embeds a "Register DMA" that can write a sequence of registers
> on the VPU AHB bus, either manually or triggered by an internal IRQ
> event like VSYNC or a line input counter.
>
> The Amlogic GXM and G12A AFBC decoder are totally different, the GXM only
> handling only the AFBC v1.0 modes and the G12A decoder handling the
> AFBC v1.2 modes.
>
> The G12A AFBC decoder is an external IP integrated in the video pipeline,
> and the GXM AFBC decoder seems to the an Amlogic custom decoder more
> tighly integrated in the video pipeline.
>
> The GXM AFBC decoder can handle only one AFBC plane for 2 available
> OSD planes available in HW, and the G12A AFBC decoder can handle up
> to 4 AFBC planes for up to 3 OSD planes available in HW.
>
> The Amlogic GXM supports 16x16 SPARSE and 16x16 SPLIT AFBC buffers up
> to 4k.
>
> On the other side, for G12A SPLIT is mandatory in 16x16 block mode, but
> for 4k modes 32x8+SPLIT AFBC buffers is manadatory for performances reasons.
>
> The Amlogic GXM and G12A AFBC decoders are integrated very differently.
>
> The Amlogic GXM has a direct output path to the OSD1 VIU pixel input,
> because the GXM AFBC decoder seem to be a custom IP developed by Amlogic.
>
> On the other side, the Amlogic G12A AFBC decoder seems to be an external
> IP that emit pixels on an AXI master hooked to a "Mali Unpack" block
> feeding the OSD1 VIU pixel input.
> This uses a weird "0x1000000" internal HW physical address on both
> sides to transfer the pixels.
>
> For Amlogic GXM, the supported pixel formats are the same as the normal
> linear OSD1 mode.
>
> On the other side, Amlogic added support for all AFBC v1.2 formats for
> the G12A AFBC integration.
>
> The initial RDMA implementation handles a single channel (over 8), triggered
> by the VSYNC irq and does not handle the RDMA irq.
>
> The RDMA will be usefull to reset and program the AFBC decoder unit
> on each vsync without involving the interrupt handler that can
> be masked for a long period of time, producing display glitches.
>
> For this we use the meson_rdma_writel_sync() which adds the register
> write tuple (VPU register offset and register value) to the RDMA buffer
> and write the value to the HW.
>
> When enabled, the RDMA is enabled to rewritte the same sequence at the
> next VSYNC event, until a new buffer is committed to the OSD plane.
>
> For testing, the only available AFBC buffer generation is the Android
> Yukawa Dvalin Android Mali blobs found at [1].
>
> Both SoCs has been tested using buffers generated under AOSP, but only
> G12A was tested using a runtime stream of AFBC buffers, GXM was only
> tested using static buffers loaded from files.

Reviewed-by: Kevin Hilman <khilman@baylibre.com>

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
