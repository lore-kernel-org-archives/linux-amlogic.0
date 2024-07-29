Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47CB1C3DA4A
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Jul 2024 17:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bxm5TAEGpMPDduGJfX522Sy8rvZOXOzzStGCgSE7F9c=; b=EPZ7wVyV9gCLAa
	X/53REy3F0ayT3Oq+boEXEW//F0mpcghfqq0P8fHEv6iKSQPQO77fFWWqgOUVNBD/I3pzSULSQEh5
	aRrF3EbiRGlIOuRuQddOHcm41NvIXWp2J7kyzHfJfcFyBt/U8cw9fBhIfBfLPQVnXVQTLHv4Au+Fl
	XER31rA0UQkOfcq2u79Txx3QCbEEY8lPbyWDjpnyjt6TYulumxvSFWDfhgbHaPQNvF1nS+WfoArzB
	Xgn+XPq7/59Wja8eG+APvXO2fhcwuWYD8CG4X0rw+bLLHFa0k1gB3sTNrQkXjIl+k0P5iY0VXLDd5
	gDvYfYu+t6XcxEsfMsJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYTmH-0000000C9Yc-1Fdr;
	Mon, 29 Jul 2024 17:03:17 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYTmC-0000000C9WE-3HJK
	for linux-amlogic@lists.infradead.org;
	Mon, 29 Jul 2024 17:03:15 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-428163f7635so17318365e9.2
        for <linux-amlogic@lists.infradead.org>; Mon, 29 Jul 2024 10:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1722272591; x=1722877391; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NY5TOx2hRF+eF5XgzHezi9Eadz0rgXiadgCBpJMGjfc=;
        b=GZw7PRbnvFAm3aExjQ4tHwljXmEnwfmdLPix/2Up1ZRTa9YQpI1953zNOIJjk3MY2s
         44YOLgc78RT9caKIMM7BSgGN2OBpmP6AtL0wiqJ2DkGsHVXdVnfjck0tqwNx0AWqF6pa
         AWBwrVCsFj7y2A5UF+FdZVgKY3W9uh+yI5hk4aC9h26WBLtEahzZMcntFEtApP4mgQu3
         Bk7XO0JnOFSUyHk+jLKE1ofWD3CP+weg7x5Q4w1fOs3KR9q6i8heCqRoG28r6zBZ5n9D
         CWtiDbn8Nu14NcYJ15+VSQwCdiGLw8wBITXsmckQZIJMTGs3KOgGBMT48/UuXwZJ5Ihq
         qyVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722272591; x=1722877391;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NY5TOx2hRF+eF5XgzHezi9Eadz0rgXiadgCBpJMGjfc=;
        b=WiakaJgbwRStu1WxNJE7GoZLMp54czc5TAB4hSD9INvhryRV8lI+S3dpix+8IQh6m1
         eQalHE2ktoWPodrMArwpf97r80Edrevj+7iu62Naq3uGLCH1n0M0H9zs4egrTSh0cPs1
         /WVNxCMrtlqupBMvE+1ThitpfDfeAZ95mKuTkyZ5Y9NEIkx4qQu2WKHotrNWQ8YQ/We5
         tPNm7R9gbhzaUcg7dwHz/1xl83ye16cRLVt3Z1V/5ySWpS5rqQTwrE6AMpYl3WgElFA6
         1cF1ratn1BJDtoEyMED9sAu1neUY/1rLhjThRZkATnYzz+KUdwlSBvJKWGB1VTkNJ8ug
         jZtg==
X-Forwarded-Encrypted: i=1; AJvYcCWSnrgfhanTr5OFobIFqaCuvyld/ZwXf0UQzjJq8kIbr8y11AXVAdDF8oPt3a83ccTNoPf8TL566P4+xWgi8iMbcvPq+Yz6t9o7ensk3GE1rwc=
X-Gm-Message-State: AOJu0YzACUVpANg2nmYadcpc59MvBRBbpi/dw6VPUxK6gACdVFN9/U+1
	CNgchc7eD4DDBSuJlHH8l3t35H2Mtq1zGPfRIErezOoU98emXsGjHtSOuO14jGMdFUTfLXt3fN0
	PiIQ=
X-Google-Smtp-Source: AGHT+IGNPdzs0UIEPCwCmFyWraPBLzbyEZadx1Vll6KLs5CYVRk3p18pfByHR1j6BgOgSb7ZcteNXg==
X-Received: by 2002:a05:600c:154b:b0:428:1090:cfd4 with SMTP id 5b1f17b1804b1-42811df08a0mr56262375e9.33.1722272591104;
        Mon, 29 Jul 2024 10:03:11 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:abd3:cdc8:2363:54ef])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4281a26e1bcsm59809445e9.34.2024.07.29.10.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 10:03:10 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
In-Reply-To: <20240719093934.3985139-1-jbrunet@baylibre.com>
References: <20240719093934.3985139-1-jbrunet@baylibre.com>
Subject: Re: [PATCH 0/3] clk: meson: sm1: add earcrx clocks
Message-Id: <172227259008.348899.7822977439322261576.b4-ty@baylibre.com>
Date: Mon, 29 Jul 2024 19:03:10 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_100313_112551_0D541956 
X-CRM114-Status: UNSURE (   4.24  )
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

[1/3] dt-bindings: clock: axg-audio: add earcrx clock ids
      https://github.com/BayLibre/clk-meson/commit/02672e609fa9
[2/3] clk: meson: axg-audio: setup regmap max_register based on the SoC
      https://github.com/BayLibre/clk-meson/commit/dd8ab39a8b41
[3/3] clk: meson: axg-audio: add sm1 earcrx clocks
      https://github.com/BayLibre/clk-meson/commit/4cb834703c64

Best regards,
--
Jerome


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
