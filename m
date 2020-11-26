Return-Path: <SRS0=dEj7=FA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B331DC56202
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Nov 2020 16:42:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 29D6020B80
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Nov 2020 16:42:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="duYWvm86";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="WjDINmeA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 29D6020B80
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:In-reply-to:Subject:To:
	From:References:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2uuYIABOp2PTY0FQy7y7FARxfxd862bkA2kuQ9DrKeg=; b=duYWvm86b/ohw7znSwuJyLJsY
	l7mMqS7acbAnDmI5do/E9ilHjaTtM04evM1khf0JLRHXxJL4qmw0szgTJwp7YdzoNEIm2/jIIfPEI
	n5prGG5hAyuNCPQnqlk//MzhD6f2HDyLZ/h0yEEA+lP6EvGbdD9g0YuPUhux3SU0pstZtn9lUuuT7
	B9Ds7e4KptSbL1bU6eBH5Txx/b28nKdomH/AYufcDVgLyShxXXLOOQSPgkL9PFRHL91mDXRkU6bb4
	6PzC/DPMMZ9uo6CZiGPisfhiirOkI80Pg+VsA0ePJmyCt1rZEumuKsOx+nuZBTx2xvXD7wwIr+zjw
	gwPXP+wOA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiKLN-0001nD-IG; Thu, 26 Nov 2020 16:42:05 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiKLJ-0001mD-Sg
 for linux-amlogic@lists.infradead.org; Thu, 26 Nov 2020 16:42:03 +0000
Received: by mail-wm1-x342.google.com with SMTP id w24so3024523wmi.0
 for <linux-amlogic@lists.infradead.org>; Thu, 26 Nov 2020 08:42:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:message-id
 :date:mime-version;
 bh=v5wyIhDUOH2agq/x4cg8x2Wwtde7ho+Gjeh3QXf9gbE=;
 b=WjDINmeAfuyLwhVMnUMkS63eEhCvuYmnexSvPb4HPPNCvT20gVuwNTlIooBUfimO0X
 DsC9VQn/Y2ppGj7a5WEco41limooaxAdrRHNy1q4wP201MMP64/GByUXXIK7qbVmmkeN
 YCAR5K/ToDAJ3ofKUysI5lo4zXywfAUr5n0tIf/l8iofsySPLzCmrXG7y6T+CDrt0r6H
 tusi/vo2AVKY3m6g66HQmWdCB3Lzi1RhYSCyrWBIKGSnI7nr8Wl5s8rbWpVrzFIM2CEf
 TYtc/9v7nNpI/S3xem7HSvh3Au7ejkLb7r7CSYlchdb9x12JPFOTyiF03a3dPfSCkKCY
 oLAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:message-id:date:mime-version;
 bh=v5wyIhDUOH2agq/x4cg8x2Wwtde7ho+Gjeh3QXf9gbE=;
 b=AeGDwkPXg5tqKK0WM3CaUChBwEvzwaiciPA0AAyO5gqwiAuDExHeLwlI6ClEWsJVED
 YLTdfznZQ9e+M/n0VT/8fsJe0W3/EgSeown2gLkKaRcc7wBrFv9/GFEfW59uWoqjaJ58
 5EtUOPzeWNGnwL+lwDiB0ssu0f9c2Jlb5UZX+5d4AumaFFRdOmXFd3rHjY5rvpBCfzQ4
 LB4dnQEOuKCcj3Q86RGiPM1egJilkR53YH6FxCPc9E4rpK2K07kzYBEC8o9g0XmMgX3A
 HzKAgrkMDRoPlwctQliPfKmLkxzRI9yQNkmH+GYSNnYsuNcPS6FnO2nlJaX/f9riopG6
 L6NQ==
X-Gm-Message-State: AOAM531Tk8oRFfB2aSYXG2BXrVhoOx211cSI1k5ltxpgYcZxuqfzRt3b
 SmPz+aT5XBX9pxqjFbT0bu0mSw==
X-Google-Smtp-Source: ABdhPJzrDpc/4cZPXo1+i+uc6IDMIE98gACt8UkwYjpI0h+ejw9io3H5nFPd20XxRiMX9KO8y+04sQ==
X-Received: by 2002:a1c:b402:: with SMTP id d2mr4345453wmf.38.1606408920466;
 Thu, 26 Nov 2020 08:42:00 -0800 (PST)
Received: from localhost (253.35.17.109.rev.sfr.net. [109.17.35.253])
 by smtp.gmail.com with ESMTPSA id a14sm9596885wmj.40.2020.11.26.08.41.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2020 08:41:59 -0800 (PST)
References: <20201126141600.2084586-1-narmstrong@baylibre.com>
User-agent: mu4e 1.4.10; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v2 0/2] clk: meson: g12a: add MIPI DSI Host Pixel Clock
In-reply-to: <20201126141600.2084586-1-narmstrong@baylibre.com>
Message-ID: <1j5z5sysrt.fsf@starbuckisacylon.baylibre.com>
Date: Thu, 26 Nov 2020 17:41:58 +0100
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201126_114202_075832_CED6F4F1 
X-CRM114-Status: GOOD (  11.50  )
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
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Thu 26 Nov 2020 at 15:15, Neil Armstrong <narmstrong@baylibre.com> wrote:

> This serie adss the MIPI DSI Host Pixel Clock used to feed the DSI pixel
> clock to the DSI Host controller.
>
> Unlike the AXG SoC, the DSI Pixel Clock has a supplementary mux, divider and gate
> stage before feeding the pixel clock to the MIPI DSI Host controller.
>
> Changes since v1 at [1]:
> - switch g12a_mipi_dsi_pxclk_sel flags to CLK_SET_RATE_NO_REPARENT
> - fix aligment of g12a_mipi_dsi_pxclk_div & g12a_mipi_dsi_pxclk parent_hws
>
> [1] https://lore.kernel.org/r/20201123163811.353444-1-narmstrong@baylibre.com
>
> Neil Armstrong (2):
>   dt-bindings: clk: g12a-clkc: add DSI Pixel clock bindings
>   clk: meson: g12a: add MIPI DSI Host Pixel Clock
>
>  drivers/clk/meson/g12a.c              | 74 +++++++++++++++++++++++++++
>  drivers/clk/meson/g12a.h              |  3 +-
>  include/dt-bindings/clock/g12a-clkc.h |  2 +
>  3 files changed, 78 insertions(+), 1 deletion(-)

Applied, Thx

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
