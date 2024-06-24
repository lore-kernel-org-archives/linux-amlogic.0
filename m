Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8BD5C2BD05
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Jun 2024 06:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1aSQWO5sxti+cvgNcpKoDf/4MCPPLI0t5wOE40bhvqU=; b=ipxPJcTX4UBjNX
	css6PZ7lRwHcBVJw7UDBNqKtNNaTGVStj35+Jfl+X/k3q3EeG0UDoKAPvVY0Ws1fSbpw4GnwsWHZZ
	rUrLathWKUKheaXIY/fpuQ5ASVvc6h6ew2+gbWoz2O2peuLTwxsSTJgiNaNzW0Sswvaii5feJjE62
	sdCErJJrwke58p1nOmkA7rOqBfKFx2H4zrORfeNb2MnzOZYLqRsmTZ3Zx1/21cihnVvnbll24Nc0/
	G41FtrJTUHhOJYQl1Hgq66+T+ZwI7PmcijNcgJLtOP69hfZfMO5xo9xPpbUOI9n/74kmNJg4zLAJx
	GDSktMVvZpu1UcCiyv6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLdet-0000000FnZQ-167J;
	Mon, 24 Jun 2024 06:58:35 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLdem-0000000FnXK-3mgS
	for linux-amlogic@lists.infradead.org;
	Mon, 24 Jun 2024 06:58:31 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-421a1b834acso32054675e9.3
        for <linux-amlogic@lists.infradead.org>; Sun, 23 Jun 2024 23:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719212302; x=1719817102; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=dd51Bi7B4iho9WSUK2ybNhdPYH2AijwKAorDmLuXRzY=;
        b=rwCMiWvMOYp73nUIgjnM1R61AEdv4824DwslGwBQApMqQcxd43MHww6Qsx80p6/tLi
         MHNuX1g3QSW19F0WocHtpsq9dqyvmbnYiWlGZ7t33PSEXLEs6y0bRXTsfyyrbddxXJiC
         PbHYyA4JFm0HL+ddUQuY+XFZwTUAnHrjPUJJxGjME+48hS8KePVA4cms4K/+1IfjX4YH
         xg+xOlvwHcCwPrIIYeXvhg1iZ0+OaRCVc3i1SMtxDNJFayuaeWJwSd0YOlklzDUVrz0Q
         +oURM6Pf5N2n2dkhO6EIY77GrblHTe8b64/WNEFk2saCbTZAV5le+qzo1HiMkUZ2hwhH
         rsow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719212302; x=1719817102;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dd51Bi7B4iho9WSUK2ybNhdPYH2AijwKAorDmLuXRzY=;
        b=Xky+I8rjTP6nyZEtA76wSYqcvxh0XykhWdYBqA5DHINIdf+E4jAdXoW9xkcHm41C6u
         rcGbbX/D+J+EEa4E6odA63P0rHKKJwKJhSlyv4gc2zhbHoUWOrWSqhbhjsgdnrC6kABI
         EegO9KT2wwdlThGkrFTw5U7T/sgSC+FvHpEw4RlVDKo2FwsM9T8w7mAFLstGViV8spHo
         If0/p/b5YFahjMIahq3JuHBE915BRIOlJuffWx1qv/3O3oM9AvrIfe854kN/fr//F8xV
         QjiWytLTRxr5nr7+EX9+WTPm66rG45CX1kLmOCnIwf6ajlx1g/VAp/6upzNT+tpEqA+O
         lQrg==
X-Forwarded-Encrypted: i=1; AJvYcCVRwz3P6BmfQ/iBPxB+CTbEdf1xhRSGwyGtDKWoVQs0q/lOmtxYeBp5AEogfRBgy05XidhlTTKjDvpDPQEYP5+InaDRApB2vBLf1Fs78VlAvdI=
X-Gm-Message-State: AOJu0Yxd+EgmrHs+OnxbO2Azz0WajiaJ9XwXT9lsHmGiCpshwj+1A49M
	YNipv33Kh/BZxz//X38/qeWFJ3CY3FvyrZN/3Gy9/sSRN1XxONrlXxIzm3cnLMk=
X-Google-Smtp-Source: AGHT+IHzL3aUhtHKe/3Bjjj3+ND74b1Fr865qc1MmeRI2nhE716S8dlrF9T1bXooOlRfy9IW4F9mRg==
X-Received: by 2002:a05:6000:459a:b0:363:7bbf:efcc with SMTP id ffacd0b85a97d-366e96bef86mr2104770f8f.62.1719212301575;
        Sun, 23 Jun 2024 23:58:21 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:67a:d41c:43dd:a67f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4247d0be818sm161647475e9.15.2024.06.23.23.58.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jun 2024 23:58:21 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,  Kevin Hilman
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,
  linux-arm-kernel@lists.infradead.org,  linux-amlogic@lists.infradead.org,
  linux-kernel@vger.kernel.org,  kernel@pengutronix.de
Subject: Re: [PATCH] reset: meson-audio-arb: Use devm_clk_get_enabled()
In-Reply-To: <20240621-reset-devm-clk-get-enabled-v1-1-8408c7962b6c@pengutronix.de>
	(Philipp Zabel's message of "Fri, 21 Jun 2024 17:28:12 +0200")
References: <20240621-reset-devm-clk-get-enabled-v1-1-8408c7962b6c@pengutronix.de>
Date: Mon, 24 Jun 2024 08:58:20 +0200
Message-ID: <1jfrt2esj7.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240623_235829_162444_47D55AED 
X-CRM114-Status: UNSURE (   5.72  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri 21 Jun 2024 at 17:28, Philipp Zabel <p.zabel@pengutronix.de> wrote:

> Use devm_clk_get_enabled() to reduce a bit of boilerplate and to
> disable the clock in case devm_reset_controller_register() fails.
>
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
