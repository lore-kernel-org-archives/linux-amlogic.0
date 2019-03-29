Return-Path: <SRS0=wRYZ=SA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7328DC43381
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Mar 2019 08:39:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4200A2082F
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Mar 2019 08:39:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fOiV+l8c";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="FKXkKv4C"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4200A2082F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DOUKpoyQsspQUpUBOojDviq+bu1che51kpswjPTJX+Y=; b=fOiV+l8cDUt4RB
	9i1KFt8z7iSQ5CJXysWcp6GRYx3r/xjkeJTmA52pXfvto8Z2opxDaofOJjeWN9BBe+i2dzhlLo3f3
	j2AHniHrbDWEWWQ7qlm+uGdC1aww5JKCCcjewSBeiPLMBRoO1s4zeFbxbm80AzBLfyak0QDoLanie
	s84PeTYQ0G6X2pPzL4eDmCgnBM4xAx2emDwXZ6MTBIHn72NgW0JZj2kwfe/w1JdmisLTVfw1fXE0M
	Cq0w7Vf2pTahG4FH0bHqzuzO3u+Q87fKALnqSGvvDOBh1zCgnFF+SF6Qpd6scTeRdGOu5gFQt3G6D
	vsW0ZNeBAx4FkDrzLNnw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9n3G-0007Xw-9V; Fri, 29 Mar 2019 08:39:50 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9n36-0007Ns-4b
 for linux-amlogic@lists.infradead.org; Fri, 29 Mar 2019 08:39:42 +0000
Received: by mail-wm1-x343.google.com with SMTP id v14so1776009wmf.2
 for <linux-amlogic@lists.infradead.org>; Fri, 29 Mar 2019 01:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=oV9s7B6fOCEuHBo7NqIclE7KCi1bwoXzo8XlZY4r4hU=;
 b=FKXkKv4C4JhWKV6p6n9guP/PK1Y8XKgAooRp8BD9Lg5pLUJLrbgJVxioVBKg7lHhvQ
 qw5Ib+w8nWtcSVzPix02g6TLa8CRrCBUik1HkN4JGeldmfGYm5KcmbtGwNLf0N5HvK2s
 NDiOy6/cb8HGdLlGMIodsFAOg2PxiXBWKsVqjN0XRsJ+aSF+6Q0HGa7EFl5aN/iGxuXw
 cEzg70Zm7UrGN3xAesDL1a+evvWwCnQmFuSmCp8aDmyHDoeLEirZrORJIH8XARHG+HXA
 AiDUhwh6I6f9mLfQ0htpbAZOyagqQ1rGrzv2v3qPbcnoDDB+WdzH3WCWjY7rOM8mtqoH
 NgdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=oV9s7B6fOCEuHBo7NqIclE7KCi1bwoXzo8XlZY4r4hU=;
 b=bdA7Ih6+Px3J6iGvKd4rz2vyZNtAd4vFr+aMncbaucPgVehObe5E+WT63xyNhGUtN6
 7TIsKnUyHbyGzf/aFFn2wfGnvUMMz9/RAswpGUyfoJuppmJTovH0CLOrwCFOoWSEfiK3
 ssA6l2Le1NOOtmjpWRybDXEBOD3RWDBhPKMEX5L6cI08K9iby3Dih3TXZMy5cAwncr3Z
 jDNimq27q+suhuy/XH7Kf+1TzKUewE5sHD1FS6umiC3zRawZBiqukRN2Aj6Bun2WegNj
 WlGVs5p2yB4ZOJtjYVd7OuxtLLfTrfggPm13StPO/HvK5t9AaqKP5E7czJm/tvS7B0x+
 ndkw==
X-Gm-Message-State: APjAAAWq+lcWPeqINAZwaHXgSLfN9p6s/stnK4d7rq0oaB56M8+0mUi6
 K9vmg4aU8IzRer5icrPRe7ngcw==
X-Google-Smtp-Source: APXvYqyotLkWO5lGRRr4pxM4xWl0007akwWtBATfp/8oZNh8Xqd7ZJcbgLMj6TnkzEM3lNF35v91uA==
X-Received: by 2002:a1c:7008:: with SMTP id l8mr2632175wmc.63.1553848778160;
 Fri, 29 Mar 2019 01:39:38 -0700 (PDT)
Received: from boomer.baylibre.com ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.gmail.com with ESMTPSA id
 a17sm1422214wmg.40.2019.03.29.01.39.36
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 29 Mar 2019 01:39:37 -0700 (PDT)
Message-ID: <e8360360029a29296b98586f1d1a440996d89947.camel@baylibre.com>
Subject: Re: [PATCH] clk: meson: vid-pll-div: remove warning and return 0 on
 invalid config
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Date: Fri, 29 Mar 2019 09:39:35 +0100
In-Reply-To: <20190327151348.27402-1-narmstrong@baylibre.com>
References: <20190327151348.27402-1-narmstrong@baylibre.com>
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190329_013940_228065_6F28E993 
X-CRM114-Status: GOOD (  13.38  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
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

On Wed, 2019-03-27 at 16:13 +0100, Neil Armstrong wrote:
> The vid_pll_div is a programmable fractional divider, but vendor gives a
> limited of known configuration value and it's corresponding fraction.
> 
> Thus when at reset value (0) or unknown value, we cannot determine the
> result rate.
> 
> The initial behaviour was to print a warning, but the warning triggers
> at each boot and when the clock tree is refreshed.
> 
> This patch moves the print to debug and returns 0 instead of the
> parent rate.
> 
> Fixes: 72dbb8c94d0d ("clk: meson: Add vid_pll divider driver")
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  drivers/clk/meson/vid-pll-div.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
