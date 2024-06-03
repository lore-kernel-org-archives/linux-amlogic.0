Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12E1FC25B76
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Jun 2024 13:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zlTExIntOqxQ1WO7cTOOZCXaOQ3HUYAsFDTQq14gNUI=; b=AGYtO6srv4/fRD
	SJYOz5XeNohhXYV7BOfcIHyi09zpCZryC4x9kDXx8Pv0xgA3KO5KET/Ual6OXAubgZL1x0KkWsYTo
	xGV527TjYUiHodOK/Y4CMpuTATWCBtX4N2QWxdFdVD6IRqCIJ0+rGTSf/9GBBGPR93hF++EZSfb04
	abfYxc278dysMKCjaWlWxL8yVvhyAnTLX0x46f51RQezCRDidqe6+j2ZTvASbKWRheuGk/iBVtE4e
	OHdupfucEWA0pbNS9WorwSmiXBS8hbj3dQ3ZmLas6OUEaaQ3mAWvgpl1bd0vaWrVmj3ZS3FPoL7PL
	6nNBBRnmHNMBPlAWy0yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE7gp-0000000GtPl-0iw6;
	Mon, 03 Jun 2024 13:25:31 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE7gl-0000000GtNL-48tf
	for linux-amlogic@lists.infradead.org;
	Mon, 03 Jun 2024 13:25:29 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-42122ac2f38so24941425e9.1
        for <linux-amlogic@lists.infradead.org>; Mon, 03 Jun 2024 06:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1717421125; x=1718025925; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GRe54a93ahgd4EPoCHEhwLJzVTEQQXrct73Kw8IiENQ=;
        b=jzfUA6Xn8DhOEDXY2vHnOoV2iOYCVLhy2rK+uLOevUr8KLlMScMfQ4CCmyLxh1F5IT
         wccBplenfwa5TJn9cZ1qJquJ9b7Z8XmUPyfGZD9sckDhLOG/V86KvKzKrbaK03iaMSi5
         4CVJTIOViMM8TuL4m9fw0OAbzbNIonpuoETFvWB5ZWZSxuYVTmYpOpE4S2sfL6+j9rdf
         y1UQE9RngVezEfCCQccVWHiRpE8ro1v2ZVP10Iqmm1q4BwcPzaoO6boi3ugxGut5okis
         E37tZKuP2QgEkhNpfZSyonkOucvFuSM6/Ipj7fHb04OKbTNwF54E4TBdezmxxkuG4jt8
         KwMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717421125; x=1718025925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GRe54a93ahgd4EPoCHEhwLJzVTEQQXrct73Kw8IiENQ=;
        b=ckO/C/YrO0n6h4VbutI9PRKMSscmAgV8Ya4D6fFS1NpKYy17EqvejCDTzuBRU96MWB
         3aCoRxEpz0Xcbt5J34pl9MpUKtLMN+p7bnoJGe8+t/4EmdC6X7F4CA92ishiJGiuzd5Z
         fVKbJbKaGaa3U7CTVPedNoEgMnRLq5OZjknlnbqUiW08ANeXa6N82MWXxtaFq1n/nclR
         kvQwfK5G7q/dfT1uVVhBVM3uamc0Ui3D/LqeTGAUfQfPk95QXNib6NRF8NDUnGGLC8wS
         xa6WDdfBwqiZoVbgsy4V+Xa0Iu+7ivPCcvMcNp1tbkOh80F19z6SR/N1BoZTWv53AuBC
         etkg==
X-Forwarded-Encrypted: i=1; AJvYcCVKLoAgU6LtgOmM/C3iPnOAfOC3SFXy0Wo/mwizadB4wN2Uwii9qE2Th8T0aZg1Qpwwd35DNp7c19er5T4Z4mrmNeGZFAQuZ6a2wLa7e0HZSTs=
X-Gm-Message-State: AOJu0Yzb3WX3fu8SmhvfCMe8XCFyu8HHvZrPKPzqq5XQnRmBm/Zou1Og
	4xMkIo45Sfr0fG1BE96Pg901Y2XIS779e0D4m3uf8/WafI7l0+uSiS3ofsh7pHc=
X-Google-Smtp-Source: AGHT+IFLEN7Kw3Ie8Yzd2cCLNqlgMqANvOY0ptXyI3CXaA1r2wfTKpMAgXZ0QIY3SdFesSqXOePBOg==
X-Received: by 2002:a05:600c:1c03:b0:421:2b2b:c4c7 with SMTP id 5b1f17b1804b1-4212ddbc8c6mr73327305e9.19.1717421125591;
        Mon, 03 Jun 2024 06:25:25 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:638a:e591:7142:7b85])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4212b84de44sm117381195e9.11.2024.06.03.06.25.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 06:25:25 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Yu Tu <yu.tu@amlogic.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: meson: s4: fix fixed_pll_dco clock
Date: Mon,  3 Jun 2024 15:24:45 +0200
Message-ID: <171742077913.140081.14785575209725989169.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240603-s4_fixedpll-v1-1-2b2a98630841@amlogic.com>
References: <20240603-s4_fixedpll-v1-1-2b2a98630841@amlogic.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_062528_056848_68B964A8 
X-CRM114-Status: UNSURE (   4.87  )
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

Applied to clk-meson (v6.11/drivers), thanks!

[1/1] clk: meson: s4: fix fixed_pll_dco clock
      https://github.com/BayLibre/clk-meson/commit/c1380adf2e86

Best regards,
--
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
