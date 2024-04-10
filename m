Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42302CD1296
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Apr 2024 08:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uePvCBbLS2sy8nJYylaozaevK+if/HjgYd/ATGaW3nI=; b=oh7S2GpZFdv+S4
	q1Hx8PlOdXa4JJnzJRSkNJ+dWSct5Qqti8PInWW99GDDZ+MyeVPF6c+gL3o+LOY84FtH9n1NQwzUn
	gySnGypNOnNkKJQ7mETwroAtpqcp2vwLna+Vw1yL1AqvsMQfNn+d4VsG+lxbzJXpQS4KavxCagDqR
	yii1+FPMA3JaKwEBGwpi2EV7MBaMk6NiB7MD67krFoZar5G4cfubmb6JVP4yX8GV37k8+tB5FbKeN
	2OGmOYFWVwoBadEcoVbVGQtQ0RXRPJnvIcM4QBw7ttdZPGVZ38wK9SN4JkWy2QZV75Gx0OrmCtzqK
	1Ge6jHKKT1R99uSKXYpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruTZW-00000005wQs-14gr;
	Wed, 10 Apr 2024 08:44:46 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruTZP-00000005wKl-0jJb
	for linux-amlogic@lists.infradead.org;
	Wed, 10 Apr 2024 08:44:44 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-416c4767b07so4191395e9.0
        for <linux-amlogic@lists.infradead.org>; Wed, 10 Apr 2024 01:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712738675; x=1713343475; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OXrCNXWIgPaFh0QtuAJvo+rsWblvd0ADI99YH8byk0o=;
        b=sK8JjLFIBAJ2tO3mrVg9jNx7Pih7Y9ia/YxqZyCEey8d5rsBNk4aE0JLbCU2ewLuDz
         sTU3aEKC9xjn/m3UN54MQrkqC9zCUHOdSx4/3Nv/obTlKPWAfE6mcrbxAZaV/DzEx3rL
         a71Q4w3kZRROBqIozc912D8tvq+Gud2pCG9qncFMMw+9lUirxWu+06CKvA20NhDFsjdA
         9nvoPAOpsCVQ4hDolQPCYlKmk+z1E62G9bCy/wMKBkAZETck+zrUhKAEf+3eCddIYHAJ
         F+LG/VXego+sR5lDSX2paNFXYBCaI44lwZcrWpjycl9C2NqJWNxJ0oTlYEgWtA7WEqRq
         QoHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712738675; x=1713343475;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OXrCNXWIgPaFh0QtuAJvo+rsWblvd0ADI99YH8byk0o=;
        b=XOXLXmM+UzQLwuykBoQdQUiBxPKx7Sc7is0MbJZNFnmmLTSLa+fH6Mt8zkAh/7lUnM
         54AHUQ5C6MKti4+XBGvWWS18/b6cm65U/2Fjvoc8GJaCVhyEN/d9ZbksS1ddLFxMc75C
         ux8QSNbeGl+KDsGvOMBtujEPUfCUtnkd0+CyMnFM/FRyIoYUmpN3N/UvMtZcBtEXusKO
         vWwhwRTXf7hrWHrwKKeS3NVzup7yQeGHxXL3bUifnpYT/+V4baHCazpcbDk5u0aoWYN6
         GYT8uT/fPQJZ9wlGYyfUTA24cWIxZZNQ2na1ySqzAbgh4fphpEADOCx6nwLLIXg6evVL
         I9iw==
X-Forwarded-Encrypted: i=1; AJvYcCWQ6bnWjY/Nys0jDRIHITvJ8ytvhycyEGJr9zOH/jQw2FbqXg9sRwplpWk1DNTBPDFx3F22VQl148HfgUrUcBQyaIjiEBe/Dd6iMwcOpc4x4D8=
X-Gm-Message-State: AOJu0YyV5fWOAio8Fom6LanYagYnh9oYO4LuKXp3WLIaHTKcZsA6G71A
	t4mlRAxPp/prgRaUsSL/7koJdXIdK4XPCS2JeAOpfufhHQBZBdpWxeiKOd2s74E=
X-Google-Smtp-Source: AGHT+IHe2X0O7trL5Pg/N7aJNVS5U+dm4Rs/QIlLSTeBZVXFLzWtij6sQgRwdxIn0sbsxOB8JhZ8Vg==
X-Received: by 2002:a05:600c:1e0f:b0:415:8651:9bae with SMTP id ay15-20020a05600c1e0f00b0041586519baemr1464364wmb.41.1712738675386;
        Wed, 10 Apr 2024 01:44:35 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:49de:129e:d25e:c803])
        by smtp.googlemail.com with ESMTPSA id t1-20020a05600c41c100b00416b5e6d75dsm2066078wmh.1.2024.04.10.01.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 01:44:34 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Nicolas Belin <nbelin@baylibre.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Conor Dooley <conor.dooley@microchip.com>, 
 "Lukas F. Hartmann" <lukas@mntre.com>
In-Reply-To: <20240403-amlogic-v6-4-upstream-dsi-ccf-vim3-v12-0-99ecdfdc87fc@linaro.org>
References: <20240403-amlogic-v6-4-upstream-dsi-ccf-vim3-v12-0-99ecdfdc87fc@linaro.org>
Subject: Re: (subset) [PATCH v12 0/7] drm/meson: add support for MIPI DSI
 Display
Message-Id: <171273867421.2243434.5037326499046523723.b4-ty@baylibre.com>
Date: Wed, 10 Apr 2024 10:44:34 +0200
MIME-Version: 1.0
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_014439_374977_330B483D 
X-CRM114-Status: UNSURE (   4.73  )
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

[2/7] clk: meson: add vclk driver
      https://github.com/BayLibre/clk-meson/commit/bb5aa08572b5
[3/7] clk: meson: g12a: make VCLK2 and ENCL clock path configurable by CCF
      https://github.com/BayLibre/clk-meson/commit/b70cb1a21a54

Best regards,
--
Jerome


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
