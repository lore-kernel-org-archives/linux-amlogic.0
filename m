Return-Path: <SRS0=Jj0Y=VW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0CA3C7618B
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Jul 2019 14:50:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA66D2190F
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Jul 2019 14:50:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="l2HDeLog";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="CYZF+ist"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA66D2190F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z+8+BJL2w67raildyyithX8WFQO64SglTn1JkjyJi+s=; b=l2HDeLogXBAnb5
	01EqdBtwFmkvytUBo1raWrAJMl6L9cUcIrLwbRfNom0+8ZQ5FF8yDX+N2rVKrfTtdWDk4y7SomjDM
	NjstybNfbWUTQN+Ysy2p+UGEo5D3EkAQq6K69JVjncukJj7P/U43kGyEqF3M8fEhaOjIpP7MHGnlQ
	1JiFIYNsAuQAcyVAvHgPs2Kt20H3otHqgxnbkxIvA8bv8haypUcLD+SQZel7MU/ht2nI/tCw99I54
	irF8luTA5BRndKlMVtAXTgr/Wy2i6KCYMimPvj1/QjdEi3Du47N1v19o49EzQxFurMDOrtgPAM2sV
	U1YjRAM9tMLFsl0kWjSw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hqf48-0007b6-LZ; Thu, 25 Jul 2019 14:49:56 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hqf46-0007aO-M4
 for linux-amlogic@lists.infradead.org; Thu, 25 Jul 2019 14:49:55 +0000
Received: by mail-wm1-x341.google.com with SMTP id v19so45037429wmj.5
 for <linux-amlogic@lists.infradead.org>; Thu, 25 Jul 2019 07:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=3b3X8WfBqIW5LOW4V5TVp6ae4N5qP2OGB1HYZV9x7QM=;
 b=CYZF+istrGEAPBiAE0ogP75C5buboZkGqyOM5L/9I/3bnu/dHopK+cjGrEHepiV3O1
 dUVGk1Yy7Q9qNheRnqVKn48/a2KXDZytITvRzcqEuMieITUMWSIgvdJRQfn6gLPcgzS0
 13hYrFFuvaFvCRF+jdMAMNQ4/z8lZ5Yc7n5FRgMzaGaytfwK5AuN5YrwW0PmR+Wtxayj
 j47u0RHnSXMnk6ULmKR1KI1l1WQ94QMefCU+hXR8wr0f67iSfE3AYSCzjwXARHQFacIS
 bHbwD5rxoMiymF86Mg2rubifTzBXk3vUicbHfk81Gg1anQrVWpmTJsYpRtTIWX1NvUi5
 CGnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=3b3X8WfBqIW5LOW4V5TVp6ae4N5qP2OGB1HYZV9x7QM=;
 b=YlG72+5Do78zhrP6NLmMnYLucAVnsbaSIDr3lJqTmnRPp5+7m1x77Givxl6+z7wiIj
 dPNq6CmL4oQ1KZo02lYXdf3HMsFkXLTBwViufX6Reo8P4g+sFCjTeC5s1VcWlJOmKwac
 5Q6QJmukbboHlIexlR90pmAKlMAw7BpyX4wk1CvlTVdoq8mzi/NR1Gn2hecb7WGVZu+2
 Pv1eI60N4x5YescmXCjQ7A8D1yRDe/gWsyhM7ueOyKOUTwDyMxsZdV9s1VRX14UrQoLt
 cWBP2H8gO0S49cfu5MSjIepfeaJVqK4tJJGrfWrCL9gcFmrYrZC49BQTRVjLDGD65nSN
 wgCQ==
X-Gm-Message-State: APjAAAXETDIVNz+UEbtImuEGnEitxL34E6LD7p2gSdcVz79ux7SQ8TfS
 DNxkJSGkiTZQbCPIuW8awaWKFQ==
X-Google-Smtp-Source: APXvYqzIwsQJYuxzT5dWpKHmTvybHpnoxkfBrMYfdmTdr8KgCK9iYKnYda5Yubj39ML7jNr8yVrQ1A==
X-Received: by 2002:a05:600c:da:: with SMTP id
 u26mr77769552wmm.108.1564066193002; 
 Thu, 25 Jul 2019 07:49:53 -0700 (PDT)
Received: from localhost (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id c11sm85376061wrq.45.2019.07.25.07.49.52
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 25 Jul 2019 07:49:52 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Alexandre Mergnat <amergnat@baylibre.com>
Subject: Re: [PATCH 3/8] clk: meson: gxbb: migrate to the new parent
 description method
In-Reply-To: <20190722095425.14193-4-amergnat@baylibre.com>
References: <20190722095425.14193-1-amergnat@baylibre.com>
 <20190722095425.14193-4-amergnat@baylibre.com>
Date: Thu, 25 Jul 2019 16:49:51 +0200
Message-ID: <1j5znqxj74.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190725_074954_719916_9A3999CB 
X-CRM114-Status: UNSURE (   7.85  )
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
Cc: narmstrong@baylibre.com, sboyd@kernel.org, khilman@baylibre.com,
 Alexandre Mergnat <amergnat@baylibre.com>, linux-kernel@vger.kernel.org,
 baylibre-upstreaming@groups.io, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon 22 Jul 2019 at 11:54, Alexandre Mergnat <amergnat@baylibre.com> wrote:


> @@ -1592,13 +1737,29 @@ static struct clk_regmap gxbb_vid_pll_div = {
>  	.hw.init = &(struct clk_init_data) {
>  		.name = "vid_pll_div",
>  		.ops = &meson_vid_pll_div_ro_ops,
> -		.parent_names = (const char *[]){ "hdmi_pll" },
> +		.parent_data = &(const struct clk_parent_data) {
> +			/*
> +			 * This clock is declared here for GXL and GXBB SoC, so
> +			 * we must use string name to set this parent to avoid
> +			 * pointer issue.
> +			 */

I don't really get the issue with this comment.

How about:

/*
 * Note:
 * gxl and gxbb have different hdmi_plls (with different struct clk_hw).
 * We fallback to the global naming string mechanism so vid_pll_div picks
 * up the appropriate one.
 */

> +			.name = "hdmi_pll",
> +			.index = -1,
> +		},
>  		.num_parents = 1,
>  		.flags = CLK_SET_RATE_PARENT | CLK_GET_RATE_NOCACHE,
>  	},
>  };

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
