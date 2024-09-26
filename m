Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE6EFCF9C69
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Sep 2024 12:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p3nTs5NJdTHhsQvEgW8XF1eqIl7G3nt4zGQszjmTARA=; b=bRyRg0OiSTvUTI
	sW+8WELa1kI+aK9/RlEXHpSjUQU44fO//WBbNX4X1HiavVe5buzlbYd6k7pDX5xGzYZc99ouB3Lau
	mYJepusuxGA/RhI7PGW9qyqzqiWSg00DyMCGYFz+nMZc5hewsXzmEekVibSVEFT7+pgx0esarYRFN
	kpmtYeaEid2Bb4U7eSoAN8zODZggqKqkkY6DswZyRhuGlW73X+BstnDY8cbpV0nfrZT5y9zxxjytg
	kM3Q+cSPbn0pXdROG8GxGnmUIwrQc5bgxSANcqwf3U+Shi3oW58dS5E4GK3Gz4wMNMAH1byuR9EYV
	+0rZlmNputg0/C6cHSLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stnnr-00000008Mjn-2aXl;
	Thu, 26 Sep 2024 12:41:03 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stnmd-00000008MYL-2egM
	for linux-amlogic@lists.infradead.org;
	Thu, 26 Sep 2024 12:39:49 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-42cb0f28bfbso7971825e9.1
        for <linux-amlogic@lists.infradead.org>; Thu, 26 Sep 2024 05:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1727354386; x=1727959186; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UQzQys66bp2Ld4WzPHqpjCSslimeJbMa4EBqGsAQRVw=;
        b=s9Xm/wfBWClRCK+syUERcbBCKWjILxva1eGe1wrfJMrd4EA3kt5Az4fZNDfkZ3W9LP
         i9RGUDltnHsNsMS0ebstlV4JLgx6mluQH2f0BjjG04BF/BT1JUaK95YK1QN7x0XDLVgV
         VU7iNQyvn6sDO7iWw4V6Dj2BaRniveTiMv1GsT5QYY9SLJoTHnLZq6NcpTg79e2MrvZk
         4rYOF2lcxyojTvIE6unDNR3V+WPmARVnuERC3DHLyZL0F9S642dHZid2UT83x/zThK2w
         NXadZkUfyQo1ciUxIDKmdX3PyKdccPIXeykbechlAHAv81f1XT4+CN97Ly1XxEF0N2SX
         Ap7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727354386; x=1727959186;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UQzQys66bp2Ld4WzPHqpjCSslimeJbMa4EBqGsAQRVw=;
        b=eWZzoscs+VU+AX2aGiFVrbug6POdaQDA7udLX5p5mk8lUtf40NZnFsvkgMSygBLhHm
         jtVP852N3vxc/EFvp8I63RTa/UPHNIv9++2Y7Arv/tpe0ZGQhVGRM2YpNj1Kp/7UyTS+
         gNP4hEjOMAb3MwsPl66VsP/cRXekW270J4EC4p6vXQIeCusRwdavdJNrjuRN5Iz/dMqW
         pmSUiIbDIONU1+Za77p6fSOn0KyxeEHG3czsFQbwHTL5PAFly2ls59WBZI3Jw2X1JXMN
         Y09NjwuUngaJlkQz3giOLRQZu9ngbVhZ1MB47gsC0XEp+PTRLW51OAGLERgcxEqw3fhr
         LtbQ==
X-Gm-Message-State: AOJu0Yx8I3tC8mpXq9uktGzBW1gxwqgziQs+3Pyyo1g+I1bF5qGiEtRG
	nJMlrtMODyv/GAtNC7wGbw09LVTQ2G53K9OQqwa+NqbD+y408Fga1u8SVbKrrbQ=
X-Google-Smtp-Source: AGHT+IF2ktbSn3Aj00xQyiv3ldfTlz4uwMS6dZVkDgJF576LsJ1mascH418BisllGC9fT21zJh/9dQ==
X-Received: by 2002:a05:600c:1d17:b0:42c:b309:8d18 with SMTP id 5b1f17b1804b1-42f50d550e3mr31033565e9.19.1727354385700;
        Thu, 26 Sep 2024 05:39:45 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:4a84:8f2f:8bdb:87])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-42e96a0d8eesm47177135e9.30.2024.09.26.05.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 05:39:44 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240925-clk-meson8b-spinlock-v1-1-50b7f2d02d7d@baylibre.com>
References: <20240925-clk-meson8b-spinlock-v1-1-50b7f2d02d7d@baylibre.com>
Subject: Re: [PATCH] clk: meson: meson8b: remove spinlock
Message-Id: <172735438430.200072.15149649780547409113.b4-ty@baylibre.com>
Date: Thu, 26 Sep 2024 14:39:44 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_053947_710892_CDBF621A 
X-CRM114-Status: UNSURE (   3.54  )
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

[1/1] clk: meson: meson8b: remove spinlock
      https://github.com/BayLibre/clk-meson/commit/e736da1956cf

Best regards,
--
Jerome


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
