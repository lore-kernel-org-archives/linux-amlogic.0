Return-Path: <SRS0=jO5x=WZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 856C2C3A59F
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Aug 2019 18:11:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 585AD20828
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Aug 2019 18:11:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="A6txMwVN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="iwQAtdn0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 585AD20828
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mL9mCCA662L13PEP93Pr4udEoYZ7VPFKyscnSmgmJKE=; b=A6txMwVNQJkkkK
	xEsWhLuXn4DFBcNwIGSqjI9O2padqFYvELOIpKkTd62CoVu9YIi16Y2x7pU6z1uMzEzbG9eCEQnF1
	BLhKeAw15X5QMC8+JVZamC4vUPee5ue7BgLw8x0LNUqAT9BoiS9qpPvdf458tvhvyduqA8icYA92f
	23q88Q0RfUmzn48wCHg6AqucPNLeXmg5GR0w/h1AttQUNQpaEHY9XFm+0vppC4TH5kmvQaTUwqY/z
	Tb2hsabgIkdAZ9HD50qCthpjNCoGCCo6/LnVz5YuftwKzT6TUwrc8ymY0V/VCTyGS4WsHloMY0XRD
	LeMsjMLQ6eO8seRg1ViA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i3OtN-0004ba-MK; Thu, 29 Aug 2019 18:11:29 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i3OtK-0004an-5R
 for linux-amlogic@lists.infradead.org; Thu, 29 Aug 2019 18:11:27 +0000
Received: by mail-pf1-x441.google.com with SMTP id w26so2583998pfq.12
 for <linux-amlogic@lists.infradead.org>; Thu, 29 Aug 2019 11:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=e+3INXPNiPGahBMGphPuaip6g7f4Sj5chWG35E21A8w=;
 b=iwQAtdn0Pgg4ppCmOKPmZR1zkJZ5PnRRoZ/59vNo/xUCfIejblQOuHLXBVpsFtkfI7
 cZY8C8RVCvtpPEwbtCEDR1OpLAb7SXVSSaPGh4Phraovns0BeUa9s8s1gkifSeAncqhg
 nOg74DadjMQ412RlqxsQ4kZXGRcX9+XmPnE2b/Ucjox3MAbwb60B+l1rTP+MgeLn4m0a
 SrSIQrXWgDYgwAekBdDFtYdNsDCEFUffAli6sElnkeL87TrQVfhzFGXv8blM5MbFXx3g
 hv7oMJmXLO+4DiRGgHCb0JJX6LGAF5t3teAkk3Mh2ivXn3z4ZreJfAAknrud6v5ovIuH
 NJrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=e+3INXPNiPGahBMGphPuaip6g7f4Sj5chWG35E21A8w=;
 b=YqHWR1nSW82qQxyEkeqT6fUUyUAzxgP1S5qG2TaNJDiudb4zfoNOPVg7yboQFE3HWg
 1nwBG/rMMKWyUz5l4xFpU7MHdVJlHu2FTAYfb963BySjWuIRO7GyCNqVrO1UyxpWx+1S
 8CIyZ8exbiZ8LfdUa9hnMccctGB/Adanlqz5hDaixZzm6SBLGX/gvoaB/Bq1QXzi2pfx
 oUAuPkMIvN2bCVG4trHRGC9pkNdGw9TrRj0kqafaoGFGdvTcZcn2Ix3vrnYjG8DbGTkY
 y16iTyZj3DA+GBLRZWXkwC7T7hHM2hj+RKy8TzlQRQt23LVV6K7H8dsxfmEZW/x91LGn
 yJRg==
X-Gm-Message-State: APjAAAXe1uqLubT8IKuuncCyiNcfTXtYMkPEI8hvPNBQ/LZVCE6kk1PY
 RoOLwyIiGuhZZYa9O0uVtOqb/w==
X-Google-Smtp-Source: APXvYqxZQ8VABLBbUAtTnKaKWbHJ9iHhI7EFuuGAlwjXpOq2ev997V7pWKPm3y+P6athDTn2osxFIg==
X-Received: by 2002:aa7:8ac5:: with SMTP id b5mr12697023pfd.56.1567102285240; 
 Thu, 29 Aug 2019 11:11:25 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id u7sm2935161pgr.94.2019.08.29.11.11.24
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 29 Aug 2019 11:11:24 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: rui.zhang@intel.com, edubezval@gmail.com, daniel.lezcano@linaro.org
Subject: Re: [PATCH v4 2/6] thermal: amlogic: Add thermal driver to support
 G12 SoCs
In-Reply-To: <20190821222421.30242-3-glaroque@baylibre.com>
References: <20190821222421.30242-1-glaroque@baylibre.com>
 <20190821222421.30242-3-glaroque@baylibre.com>
Date: Thu, 29 Aug 2019 11:11:23 -0700
Message-ID: <7hy2zbrgdw.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190829_111126_234899_9079E4C9 
X-CRM114-Status: GOOD (  10.21  )
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
Cc: , devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Guillaume La Roque <glaroque@baylibre.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hello thermal maintainers,

Guillaume La Roque <glaroque@baylibre.com> writes:

> Amlogic G12A and G12B SoCs integrate two thermal sensors
> with the same design.
> One is located close to the DDR controller and the other one is
> located close to the PLLs (between the CPU and GPU).
>
> The calibration data for each of the thermal sensors instance is
> stored in a different location within the AO region.
>
> Implement reading the temperature from each thermal sensor.
>
> The IP block has more functionality, which may be added to this driver
> in the future:
> - chip reset when the temperature exceeds a configurable threshold
> - up to four interrupts when the temperature has risen above a
> configurable threshold
> - up to four interrupts when the temperature has fallen below a
> configurable threshold
>
> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>

Could we get a review/merge of this driver ( and hopefully queued up for
v5.4 ?)

This has been reviewed and tested by users on this platform and it's
working well.

Reviewed-by: Kevin Hilman <khilman@baylibre.com>
Tested-by: Kevin Hilman <khilman@baylibre.com>

Thanks,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
