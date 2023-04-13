Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C11AAC77B61
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Apr 2023 09:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a5MhENKcm1QymVGgbVmM9C3hCBDZy3BFNoh+EXY5jBs=; b=u6M8IqChlk+sTT
	5yfzknLH6KsL/WWs7/h4T5BOJd1E5JrmBk5LJNHNnmHITSan6TnazH36ucDmK7V9OQWN1w0NgQExp
	SWoY7fE9tt9ld0uF3QAOPSZGLk+lS/wTcW5QRe1IwTQRyZ4EHRbd8lKD/jwcAZ4XkwqIfooen2RYC
	ACcUE3eg+4RPXFf09QoGAAL0f4PTv9SzOdDXzVoHoc9883m4mTj6Dfno9bccJkt2kQFcKDRU/YoOi
	Rx6ZbMV+xYbY8axlS38tBzWU4JIPwI3tUMOCeBjWaBWK3OAGEx/UBK5B0aLuqRTF/K/y6NY10NpTt
	AdZWoV3KutDl3jBwWdvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmtCz-005c4Q-3D;
	Thu, 13 Apr 2023 09:25:38 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmtCx-005c2m-2C;
	Thu, 13 Apr 2023 09:25:36 +0000
Received: by mail-wm1-x329.google.com with SMTP id v14-20020a05600c470e00b003f06520825fso13160518wmo.0;
        Thu, 13 Apr 2023 02:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681377931; x=1683969931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SmM2Iumz0wCty9ffU6sJazDTRuVNx11Hj/8rUPFg/VM=;
        b=rvDLnCyCtCM69vYo9/NJ+axluCUjrwXbd0x6w6yn8+QSHhoQdODZ8V55IcC3u7KqM7
         bxoHBwhI+/DHEjf6SLKDvCCKZSiTdc2VJHo5zBl4krXuoMLRVFtG2y/4MyYXVhKu/i74
         oL+6JnQyDrqG2TUHoFPsHPsUcYbFEdFnSfU5yNguULo1zCqfvp1Fa3nN+SsE6/MxvtDu
         0FuV48NWdUnyYaXjYRL88MNiEhAdPzFMIgOFK0tNY+9O0Ou6vMhKYGmhglAzMSmFeRFK
         6aZICtK9gQ8j8ibaBaPu5B011aKR1mFhFVjrWO5q3KV6raX1ux4oi1yDxRyqm8wsECla
         0pBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681377931; x=1683969931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SmM2Iumz0wCty9ffU6sJazDTRuVNx11Hj/8rUPFg/VM=;
        b=ImSnWZWPCF31yOACZJ/Bm+mTgawYOR5aBe0tHUsbK/MaiE1C/VT6cgNpkBLE7gmRDN
         kW9krW7yteJeP6TI50OF9OMpKySRqKClEVMvzLrE/8r/lDDx5xFVz7K8sm6smnzusRg0
         /XrDzgfNSQurbXAYTX9idnlBJOP0H46bXqIK8Xuun0n9h4ep/4eooboHUpLwEtPsmAKr
         gGsnQc6nsAQr8NRjDxyEnJmDg+VqbLlKfyrFs1BUAIO9MNJvJlAIAIhoDhX3xmJO8U5J
         /ngvQUKCNLtsX69g4A9pEtlZAEcSlRt9BBXQdxE8bvGiyy59f2YNROmI258gKmcxdbbY
         4Quw==
X-Gm-Message-State: AAQBX9ccLx+c7tWuN9H8/JHh3CU1JZra8Ba6tS16SPw6D5hE6Wr7zLI5
	h3deSwE0IKf2y7NOl0ndVcY=
X-Google-Smtp-Source: AKy350bSedNi5QuhggJdNoxRcLrb4wiyesVKP7d3sWXVkEafZm+s5Ri0+xIF7kqYbPQb81iiI3rxEw==
X-Received: by 2002:a05:600c:d9:b0:3ee:6d88:774a with SMTP id u25-20020a05600c00d900b003ee6d88774amr841701wmm.14.1681377931180;
        Thu, 13 Apr 2023 02:25:31 -0700 (PDT)
Received: from localhost (p200300e41f1c0800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id u7-20020a7bcb07000000b003ee70225ed2sm1316522wmj.15.2023.04.13.02.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Apr 2023 02:25:30 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: linux-pwm@vger.kernel.org,
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
	linux-arm-kernel@lists.infradead.org,
	Jian Hu <jian.hu@amlogic.com>
Subject: Re: [PATCH] pwm: meson: fix g12a ao clk81 name
Date: Thu, 13 Apr 2023 11:25:30 +0200
Message-Id: <168137792161.301968.13202173892797133220.b4-ty@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <b53af028-28df-105a-eb50-21a1ed4e15b5@gmail.com>
References: <b53af028-28df-105a-eb50-21a1ed4e15b5@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230413_022535_727770_2624AB31 
X-CRM114-Status: UNSURE (   7.57  )
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

On Tue, 11 Apr 2023 07:34:11 +0200, Heiner Kallweit wrote:
> Fix the name of the aoclk81 clock. Apparently name aoclk81 as used by
> the vendor driver was changed when mainlining the g12a clock driver.
> 
> 

Applied, thanks!

[1/1] pwm: meson: fix g12a ao clk81 name
      commit: d02037e2297dcb0e705bfbd6c11278b48e330f97

Best regards,
-- 
Thierry Reding <thierry.reding@gmail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
