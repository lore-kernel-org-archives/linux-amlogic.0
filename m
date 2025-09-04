Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CC33CA1013
	for <linux-amlogic@archiver.kernel.org>; Thu,  4 Sep 2025 20:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I6+KZq24WRMPS751OMRNVuc6P8LdaI4qLrIty+S6+m4=; b=QDP8WkA1Fm+Xnt
	5xXDLRwTmcOP9ZR6P59i9d73bHoAPmK5BzBYbje9hTdAiWzWtIGipxUWwELyzn7obFs0ycwR6VpqA
	eB4fL7GOmpMekCqZb0lDfv32zsxR6xXans7o7gIBxwkHtq+00C++4RtzoxGB1ff5It8s7kJ0oWvl5
	3RLErRRvAMKFrb3HbGqXUfmdPmuuX9kznJVQYe9mJQokykWC8eO3VJFP+x8+V0+q3PUM9UHihCeb6
	6P+JXPjSa9IXV3n23egzS9zOGN3t/eu7C8QHN96qDDFqVE0nbvz6YpSceg/BY9AvD9Z0F7+3GumCE
	gH4TJwa+0mBNK3Uyiohg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuG85-0000000E7UZ-45Ib;
	Thu, 04 Sep 2025 20:00:21 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuD6y-0000000D3GY-2Mpj
	for linux-amlogic@lists.infradead.org;
	Thu, 04 Sep 2025 16:47:02 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-45b79ec2fbeso9296565e9.3
        for <linux-amlogic@lists.infradead.org>; Thu, 04 Sep 2025 09:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1757004419; x=1757609219; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X/WLNsuxQtqsn76Kxw2dv+Lj7uczL3CnU17b0jUez3A=;
        b=V7mdILiq6MuTX9Z8iG/nbkzdlnDJWxiO4iT03g9i7IsQtIARDs7zx0/qvbc1Lrpb5e
         OuUULtR8y5WOlBE5kLpftmmS4GTDxMQ+nz5/vgW4ZNq7vRobnUH09P7wJn2LeLWn+TOq
         dMaRnnnMBPfOk9mczSpdmbyJB3y49HNY0uPjssKCR1mRLoJ4SaVMg56txdjLXQd3Jv8A
         6qPTVPqWgAL1AZKxR6FV7y0PxdwiU3ZCMk0fIfUzz+csq8kr0K2iKN4dePlGYY6CSuXe
         ffP6WIBRl3F4FV2KPgNkzT7uj26pPVPfy3Vl376+DAtVG1xgh+mBN10fvLfzkes1iqnz
         fLhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757004419; x=1757609219;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X/WLNsuxQtqsn76Kxw2dv+Lj7uczL3CnU17b0jUez3A=;
        b=hwx0Tl65VQCiFvC+BOseEA5dtcfMWRRzPkL30z9+qzuR/zmTL+hBGmt99M8jHGS16v
         kmaXhRX94ppTh2QAbqLV9AJUer8Y/yWfeQclu/xQ4KVvucxBNn8OZJA7dkOvS8XyNgOK
         0z7Sw1xToLtwtGzL9XivnllYQOvAI4IaOI7TnBnb0xFVbgQV5kARnORkmNCMn7hdAmdk
         VDyeDPjIeYq8mRcBgrB0fRFrcCj06LH4dYCwHP9JUhDZqFkk9LaEwl7k1sp6rSNjzNrS
         apq8SL2YjCRbNM7hTjNVa1egCdNkbAdS28563rbjMHqNz45QONAdForpFIWDrNprh7TA
         cfnQ==
X-Gm-Message-State: AOJu0Ywww9eMhagq/NDHdUn8m9cm4NKSmzykRRSUmY8biFdXMcmnsTG8
	ODZwZL4pZaUvzqZWKEHm0N3x8ry+eqKsYuQsS+8jJPG7uHKDO89yPVCUzHCSCsvi/yg=
X-Gm-Gg: ASbGncu4bvNMASR78bGZdyoolsYJcpRVse5l6tkZYqWudlkcwR/6N+raEczrW0WFvkx
	ewThUo6V/ohpwJaJoteJbgaA+P5uDArmAaWjTcpmwR8nYn+KEqpzJqh9cH1ZgikaO3PZkYN1jIf
	PBzawLS9z3Dp5eZDYAPT+i3H+fOIeerMsqe+hbDBmzhJNPotmqJj2fTOVkJ+CjAIu4EfhSwanlI
	FeaOCz6a//sGAXc0KfmT7wMNWS/QiMsfly+oJCBitCL1cQRMIvvz1xeMPormUxaxOzMNFJBCVTA
	EE3kOKWvoMVjq6SpqhVOVVOZbpslbg7/u2gk5FAxTSKnBYJQqRzcqjt/h6AmHBuh+wiLFg08Dru
	/09pxl4JAEv1G5V0jzvTwRLly7NFzrP7ev/WFLWNqXjlkrxzG5McygK+L5A==
X-Google-Smtp-Source: AGHT+IHQrf0VDJOnlLROwb3iKPchiTJtb5FWTd611Hy/KSG8kw1XqXuDzj8LP0/63OVGDYFX4XRwGA==
X-Received: by 2002:a05:600c:548a:b0:45c:b5f7:c6e4 with SMTP id 5b1f17b1804b1-45cb5f7c9fcmr59378955e9.35.1757004418578;
        Thu, 04 Sep 2025 09:46:58 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:f602:3644:5f38:7200])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-45b7e7f14bbsm299010215e9.8.2025.09.04.09.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 09:46:58 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <20250825-meson-clk-cleanup-24-v2-0-0f402f01e117@baylibre.com>
References: <20250825-meson-clk-cleanup-24-v2-0-0f402f01e117@baylibre.com>
Subject: Re: [PATCH v2 00/12] clk: amlogic: clock controllers clean-up and
 factorisation
Message-Id: <175700441776.3567508.13329203268479696099.b4-ty@baylibre.com>
Date: Thu, 04 Sep 2025 18:46:57 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_094700_607924_9FA0B44B 
X-CRM114-Status: UNSURE (   4.38  )
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

Applied to clk-meson (clk-meson-next), thanks!

[01/12] clk: amlogic: drop meson-clkcee
        https://github.com/BayLibre/clk-meson/commit/e256a6602aa0
[02/12] clk: amlogic: add probe helper for mmio based controllers
        https://github.com/BayLibre/clk-meson/commit/480197ceece7
[03/12] clk: amlogic: use probe helper in mmio based controllers
        https://github.com/BayLibre/clk-meson/commit/d7c001bd76b7
[04/12] clk: amlogic: aoclk: use clkc-utils syscon probe
        https://github.com/BayLibre/clk-meson/commit/2aeeb649ead2
[05/12] clk: amlogic: move PCLK definition to clkc-utils
        https://github.com/BayLibre/clk-meson/commit/32ee5475f7e3
[06/12] clk: amlogic: drop CLK_SET_RATE_PARENT from peripheral clocks
        https://github.com/BayLibre/clk-meson/commit/cf03071b7c3f
[07/12] clk: amlogic: pclk explicitly use CLK_IGNORE_UNUSED
        https://github.com/BayLibre/clk-meson/commit/c3f369363a13
[08/12] clk: amlogic: introduce a common pclk definition
        https://github.com/BayLibre/clk-meson/commit/aaee6f3bce3f
[09/12] clk: amlogic: use the common pclk definition
        https://github.com/BayLibre/clk-meson/commit/b7358d14f176
[10/12] clk: amlogic: add composite clock helpers
        https://github.com/BayLibre/clk-meson/commit/955e18baeb93
[11/12] clk: amlogic: align s4 and c3 pwm clock descriptions
        https://github.com/BayLibre/clk-meson/commit/9bada5ff4bf7
[12/12] clk: amlogic: c3-peripherals: use helper for basic composite clocks
        https://github.com/BayLibre/clk-meson/commit/01f3a6d1d59b

Best regards,
--
Jerome


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
