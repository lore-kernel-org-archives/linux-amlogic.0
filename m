Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07C2FEEB565
	for <linux-amlogic@archiver.kernel.org>; Thu, 12 Sep 2024 09:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aYGg1iJlY++3ZcKkza7Pw8cIA73inKg7qycG3/f07vY=; b=YuocUm9xzWXNPf
	b67fZKPMyI2xHTk5w7UeMmc1KsvQ0+UREv18VVwwiX/NmPsIM3PXvHaM/W1ksjX+YO4Wl2MyMLIAM
	HNWR9DSKzBKh5C1fx+5/NYw871eVO+7EzYD/qT+Cy/cjuQYNu0OjW6FRL8fp1OrCV2dNgayNgmUe8
	EUWgX3PdLThnOuUyuzCdzZLIFqYoARQlSNRjJUlRwxy+S7Nyh2LIDjCpALrfdSOsiidRZ18Ta7vnS
	iZueXUWjCxfWnobVeLptV0GOTWdZQEjS3rX1S1MK65zu6a3ueFXvH2S7hAll5aK6X8grD7hH352Rs
	EVghfDTV/k8PjaGaniwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sofsY-0000000CUDa-3Uo9;
	Thu, 12 Sep 2024 09:12:42 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sofre-0000000CTze-3p2N
	for linux-amlogic@lists.infradead.org;
	Thu, 12 Sep 2024 09:11:48 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-42cb5b3c57eso6392185e9.2
        for <linux-amlogic@lists.infradead.org>; Thu, 12 Sep 2024 02:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1726132305; x=1726737105; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lzjqhs8y7WhTKRO+ysq0TRz4Ei1eT10sjX1ohSFJoGM=;
        b=yqfd7sdfOvZhYgl3WK9jJ23wcR7uZmBqVfYjXfo5YJY0XUhnrJ0WZGFD2dDr2LGQ7T
         gKvu20oEsUQCr1cBUDKAE2pYSm2CUMq8oYgLeTTpl7bHkSA/Apme88ZMVINWCLTThjGT
         IZxRNdoazLh8b7em0MCC2lZnjhVrpXd4PAesNo35Tn8KkO1hKtdcu/SoD9IbIp7701x8
         rpskixNGAML2X4L7mxKTJgckMAgEnFHDASl1cWZ1Jmm1UfNIDuRmXf6sJ+bXJi+d/XLh
         akmaZ+FN5jagQ60qXdchvHPrGTBIwjAqPBthvyMgvE04dAcGDWwotAat69zQ4cz6n8Uu
         uymw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726132305; x=1726737105;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lzjqhs8y7WhTKRO+ysq0TRz4Ei1eT10sjX1ohSFJoGM=;
        b=Ah2iskhQgh+Gt2ur6DaLH7u5TZNeaJlu8A9m/D7+D3fDNB/ohfBu6NLphcDyz3kR93
         zGWsihQJKwsEjp73PUicBGCyEKSmSx6b7cnBz5OIP1e+QS8aoxd/u5o8f04NIdX0+L5o
         bj2wNZzqdZS4zxXs3Svj3lqUOZTsYO5+PMhcIIRCB+hB2h0lEYPVJzo5flBg4n2VCRwc
         7Cinxe/rZG2i/INucjI1MkqgNVfIzlkd7J093TauHkKWzc1xMhe4xCEssaF8eJcWA+JJ
         HVYsRMmkTMusr6HO0ZD4E6b0KrOi3eBGGJyVJv9GmFYDvbq02XUDvTT0I1/UC5FFxXXG
         LC9w==
X-Gm-Message-State: AOJu0YyJRfMT1E2myQ5f5Yvxg2gsGx5Xt876cEy8GuyW8uEXu4q1XZMV
	QspCdjoqd2ARfNOYLYEwLFU/UvyQ3kLz9C5moegrQxMZNkoxrQXYbTQoqGUUk68=
X-Google-Smtp-Source: AGHT+IEuHhjhV4y8vkeinoRMStEHFH4N9AdU6uuWOfgf54EkhTBqvH37tP/rjH+rnOtOdA+OzPDNHw==
X-Received: by 2002:a05:600c:35c1:b0:42c:bfb1:766e with SMTP id 5b1f17b1804b1-42cdb55006fmr16625665e9.21.1726132304147;
        Thu, 12 Sep 2024 02:11:44 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:fd24:8a54:e95f:a4e9])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-42caeb81611sm168631065e9.32.2024.09.12.02.11.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 02:11:43 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Chuan Liu <chuan.liu@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240909-fix_clk-v3-0-a6d8f6333c04@amlogic.com>
References: <20240909-fix_clk-v3-0-a6d8f6333c04@amlogic.com>
Subject: Re: [PATCH v3 0/3] clk: meson: Fix an issue with inaccurate
 hifi_pll frequency
Message-Id: <172613230299.80574.607879947069442060.b4-ty@baylibre.com>
Date: Thu, 12 Sep 2024 11:11:42 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_021146_963298_4B3FFC43 
X-CRM114-Status: UNSURE (   4.78  )
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

[1/3] clk: meson: Support PLL with fixed fractional denominators
      https://github.com/BayLibre/clk-meson/commit/1287bdc8c6db
[2/3] clk: meson: c3: pll: fix frac maximum value for hifi_pll
      https://github.com/BayLibre/clk-meson/commit/d4bc8851da59
[3/3] clk: meson: s4: pll: fix frac maximum value for hifi_pll
      https://github.com/BayLibre/clk-meson/commit/0ef513560b53

Best regards,
--
Jerome


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
