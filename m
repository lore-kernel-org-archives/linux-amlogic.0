Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 835C9C61DF4
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 Nov 2023 16:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YUgk5XC+tqR0Tl47jPLVaCkTieemAalhebII3IXQkAo=; b=IC/FX8TfzbgpOc
	OFAwTJssRKpzsFSRjAxkBfhYqo90m8jr+m3KH2X8aPzufprp9n872PlhY1QgqQflpSIibv0E988WW
	oPKPtGkJrH0VE2pw91aW5QE0TM1dxqEqaY4IELl+Ukb9n3v8V1qHIJuVseKKUnlAKMp8CHg80GxDl
	IN+AVFIBjFlCgW9smsSDsNjoXdmBpdxb4p3O8NUYgYSO2xMu4e6Mt9iukmf0hKpG8ErbO4N3M22Ou
	Eb4qD0qoIpFYMYG/ekxaYghnqRc1KlqTvfgnlI4jGlAiXhqKD6Xg3o1tOK6+uWV3smgSTl+o77tRf
	VOx1xi+gsp9gPAUgBd8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6ZGV-007iOG-3D;
	Fri, 24 Nov 2023 16:42:52 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6ZGS-007iLw-0l
	for linux-amlogic@lists.infradead.org;
	Fri, 24 Nov 2023 16:42:49 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4083f613275so15594995e9.2
        for <linux-amlogic@lists.infradead.org>; Fri, 24 Nov 2023 08:42:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1700844166; x=1701448966; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nY57yW8jqPx4DCjz4gafCo99TqRgCQishv/BZqsXq+M=;
        b=PkW2yagqXe/SeZyabeSlJBeiLADrA+hfyb9d7Mkww1eD1mrUCXnGj0FLZsommzTmor
         mZkvmqXkXMgqF/Bh8XPkEuvmPKL3uaEmxoMISIdjuEKtX9DK2XG69l0Pk3W7AisxzfIE
         D/TUFap3mqCzex0IeRdXCjS0qd/l9DpehrecRfBn2Ukfq4kXUkt15Rv0WcEuRumRLz3J
         wllDyEFUD6Z4ZyNF2vmoNWkXYf0LXLBN1Cd59tfOsivZ9kUGgL6Iu77wbzW8z4EmthXK
         DLEcAy511zXtoN3bNVbKstSVO3o9ZJFMnUggj6G3WTwk5eF71AV9iC85sQ3T9Wf3YwoT
         2GrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700844166; x=1701448966;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nY57yW8jqPx4DCjz4gafCo99TqRgCQishv/BZqsXq+M=;
        b=ru6I6tcCLOl91Z+9sIuM66nyVAknf4Zudk3V6w5NamFbPwLUdsqKYJN0m59oYb3Dx+
         mYu8YVpsW55aJcqFHHpg9p5QtuRcXG5ZbIilmXFJugrPU65MNilNTPB/wTPyJK88Ne08
         7GhtN+qHiZcRhWLApWGDPkpe3MfM17ABCFGpGeS54xqdwfM5hYtxx8i77CyyW2Chw16e
         cdpPB2+wv8M0lF/fQbtV/fdB7OT98Bs+mNz1Oh4yFdeviBLGwG1MCYM//8asLs4+LDlr
         xxxEGA3o6YkTs8ZVbEj3/0Czn6oa2seGjHhAHQxi8KDFBCUX0QFFU2iRQthG/wagswbp
         kvFw==
X-Gm-Message-State: AOJu0YzXUZrnTRv9OprgYJaGvZoEjUgDkGKd6b5aP5/om9H72n06eBw9
	UvlIMhkOkT4Y8aMDyuoMQ+zlSA==
X-Google-Smtp-Source: AGHT+IF0qtFjt0i/sxwkQJ9BDFSUDAmlZ1vNck5maPD+WnShRNQ0koLnOjpHlDBfcr97NsaHGHftKA==
X-Received: by 2002:a05:600c:1f93:b0:401:2ee0:7558 with SMTP id je19-20020a05600c1f9300b004012ee07558mr3057188wmb.32.1700844165899;
        Fri, 24 Nov 2023 08:42:45 -0800 (PST)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:1243:6910:fe68:2de5])
        by smtp.googlemail.com with ESMTPSA id r4-20020a05600c458400b0040648217f4fsm6159082wmo.39.2023.11.24.08.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 08:42:45 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Nicolas Belin <nbelin@baylibre.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Remi Pommarel <repk@triplefau.lt>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 linux-phy@lists.infradead.org, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 "Lukas F. Hartmann" <lukas@mntre.com>
In-Reply-To: <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-0-95256ed139e6@linaro.org>
References: <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-0-95256ed139e6@linaro.org>
Subject: Re: (subset) [PATCH v9 00/12] drm/meson: add support for MIPI DSI
 Display
Message-Id: <170084416459.2546450.3587219733392523958.b4-ty@baylibre.com>
Date: Fri, 24 Nov 2023 17:42:44 +0100
MIME-Version: 1.0
X-Mailer: b4 0.12.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231124_084248_273282_D5ED40E2 
X-CRM114-Status: UNSURE (   4.23  )
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

Applied to clk-meson (v6.8/drivers), thanks!

[01/12] dt-bindings: clk: g12a-clkc: add CTS_ENCL clock ids
        https://github.com/BayLibre/clk-meson/commit/bd5ef3f21d17
[06/12] clk: meson: g12a: add CTS_ENCL & CTS_ENCL_SEL clocks
        https://github.com/BayLibre/clk-meson/commit/5de4e8353e32

Best regards,
--
Jerome


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
