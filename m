Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A027CD11DD
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Mar 2024 11:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Oks0wMiEibwSB5KrkoJTVYK0Gmkw97xcakrjfzsCl8Q=; b=k3a68JIk7fWndR
	fVZWaMnrGa4ouJu0CzFfW8oNPy9V8Fokbj3E7yGdrJdzAYAepErUtex75yEADr4GwpW5SXRHAl3Sk
	yIrz+Q84Jj/N4PJNal8dgORkEXLbNL1wO4QLhjw02ZCmugw3tr7Z/5yjsVB34ZTEAzqvxbu+m94fi
	BOD9iO/f+QJg8Ft1QYVhCp4AeG9sGBeWIukEfRk3R3xDqPzwcAPs3pZlbR9EvhRxsfMHrHhiVcUtw
	N3TpvmO691Nhnk0wzp4/T0I7YdWwg8abvvMY5om0sSgBqu2pxyqDJPMctBgDl/EeB4zM7AFvzihjS
	z1lDw2x/V61kkDJ58afw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqADP-000000009wQ-2MAn;
	Fri, 29 Mar 2024 11:16:07 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqADJ-000000009v8-3Gdx
	for linux-amlogic@lists.infradead.org;
	Fri, 29 Mar 2024 11:16:06 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3416df43cabso1306254f8f.3
        for <linux-amlogic@lists.infradead.org>; Fri, 29 Mar 2024 04:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1711710959; x=1712315759; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6cSRTNdeJ0rKAdmni1uoS6PPPrRP+OSa+PK1yc6fqCg=;
        b=wUZoP3MH2sTIsyBDhll9qPNtoJHLIwrM03hcMBT15U9uDwDS2FFl07S/yyRa6m75gQ
         t+JQaJyBv4sIpSWaFX2+7rIQjc7W3cSV0JiVOdhUQd63CZ4qlED2UIWV0KYoPI36NPy/
         z5seRjWddcK1U6oZ5+rGtd9ZG904jxqMfmcV4bqrv92HQEPX7+hkF2XYKfSNNDBBWQPA
         yeEiHT9HeLFEdQjRD4sKM/Zo6D5Fzlrm34pfGEZPOaNjLPSfbq5nXf0Zd13A+KtDzHnI
         ek4eWlkO7F9vtn02olLnBMNnHauM0HYdI8V9k8+dbj9G5cPsmay7emTk9qs40Rf6piA7
         PCpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711710959; x=1712315759;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6cSRTNdeJ0rKAdmni1uoS6PPPrRP+OSa+PK1yc6fqCg=;
        b=Qw+1XLbZPXlU7reaxNatD7Nrd+5q9Ec2kavN3vQeXGfwbDp12wYLuUVzHWjO8e11ta
         MNIexcAA6XSuhRnNDK46pieRWv6+brZL0clExBpv6ghPUZTjKQSZGa21u7XtoMN64TLC
         HQzc0+1ZiBPD4uPIU41nQyLyjgYpLuZ7vPDMMwc4qFA0gYjHj6saW7gUSCEN1VOCasLE
         KWAktKFpyU98zHqDDaja1wRw8X9O5+8sTtcilq7dExnckg5WUYbJzzi5ncFuBuaFOuj0
         o345lpTQkoR1edXnYnJj1TnUBLoLcTjKCgjJLMj9lp9Vt4k8q79W0Om43/1FvogfGpzh
         /E2Q==
X-Forwarded-Encrypted: i=1; AJvYcCU9McUs9jFWieVP7dZavSzsXVj/kl1REZLCYate6s1oxnC0xRV4oHpeic3ZEUDZz5emTYqTDnskM0+/AnYLpV77Y65hhrHc4iy2Y6mk9KmDVqM=
X-Gm-Message-State: AOJu0YxK6QmFVT5QhNz7whNFb1d2Uf+Vvi3oDZZ2tMcCWElbUCV+XlNY
	3gMyY/dfd7yDQ+HhRj5vEMMUuGTqFxrN/EMff+V+dkcb++OOod6hQ3xNcEK4yRI=
X-Google-Smtp-Source: AGHT+IEQJ3nF483DRIx3ovQYuMQsN/YY2JEmHM4jst0i0/VT097BhrM9JqARNl4Cnfbc36mkEMPz7w==
X-Received: by 2002:adf:e011:0:b0:33e:7896:a9d7 with SMTP id s17-20020adfe011000000b0033e7896a9d7mr1233872wrh.67.1711710959408;
        Fri, 29 Mar 2024 04:15:59 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:f8f5:63d4:de5b:e4de])
        by smtp.googlemail.com with ESMTPSA id l14-20020adfa38e000000b0033e93e00f68sm3985741wrb.61.2024.03.29.04.15.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 04:15:58 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: neil.armstrong@linaro.org, mturquette@baylibre.com, 
 khilman@baylibre.com, martin.blumenstingl@googlemail.com, sboyd@kernel.org, 
 Dmitry Rokosov <ddrokosov@salutedevices.com>
Cc: kernel@salutedevices.com, rockosov@gmail.com, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20240320155512.3544-1-ddrokosov@salutedevices.com>
References: <20240320155512.3544-1-ddrokosov@salutedevices.com>
Subject: Re: [PATCH v1 0/4] clk: meson: treewide: define maximum register
 in regmap config
Message-Id: <171171095856.1276233.8031713051223267564.b4-ty@baylibre.com>
Date: Fri, 29 Mar 2024 12:15:58 +0100
MIME-Version: 1.0
X-Mailer: b4 0.12.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_041602_084978_64DCB9F3 
X-CRM114-Status: UNSURE (   3.70  )
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

Applied to clk-meson (v6.10/drivers), thanks!

[1/4] clk: meson: a1: peripherals: determine maximum register in regmap config
      https://github.com/BayLibre/clk-meson/commit/b6e2c6548074
[2/4] clk: meson: a1: pll: determine maximum register in regmap config
      https://github.com/BayLibre/clk-meson/commit/acc628adc363
[3/4] clk: meson: s4: peripherals: determine maximum register in regmap config
      https://github.com/BayLibre/clk-meson/commit/32fba1c16576
[4/4] clk: meson: s4: pll: determine maximum register in regmap config
      https://github.com/BayLibre/clk-meson/commit/5995a2f26f83

Best regards,
--
Jerome


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
