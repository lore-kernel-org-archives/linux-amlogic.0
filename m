Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F788C4345F
	for <linux-amlogic@archiver.kernel.org>; Mon, 22 Apr 2024 16:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ff4+rMN9sCaef2cVMOF6t7fmn2v9r9tRpAdC5d7Nmcg=; b=RO3uEJ0eXqR5Cu
	fLK8hzSoM8njqNdlZ3XNSgkm/Da6RKNdHsPdoDsTPI3C1v0SZvKcVF7l8wb7MZDCDioeqh6xK83eK
	nhpyMtlgClCQxlwMeTRUTw37PZfkDA/nmyKMMjTqxIPhvdQ579YQ8M2yOTfK2zsOFQXT6F+50HwcY
	PYTiJ1nAjwUWzERQV1zdQQalusMwn2vdzU2On+JLcdNsaNctuZ8Br1UsiGfUoYMO6+n/y4zd1c/Mw
	YIwxoXoigrSRBLYZZaJ55WtSzdYE3tSNTbnWkCA/pDz3WC9OAMGux4fOfuD9G4YAMLbzJGHNLEuMs
	mZ6BTluQ1CJt+j9A5Ncg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rywzM-0000000EOUG-0kiG;
	Mon, 22 Apr 2024 16:57:56 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rywzI-0000000EOSX-1VQj
	for linux-amlogic@lists.infradead.org;
	Mon, 22 Apr 2024 16:57:53 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-34b029296f5so1359450f8f.2
        for <linux-amlogic@lists.infradead.org>; Mon, 22 Apr 2024 09:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713805070; x=1714409870; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XFejkMe0OVlEaHFS27AO4JIPaFi1PczIDcBY/+c6L4w=;
        b=DhVzwLdVGQq87VN1sMfOjJVDcyM+/XrilS2zZKZl0rr1uG9ovHMtMHCaw1yYgtOhmQ
         rGH8vsQH/cMgePmANDV55/SgcvljSWW6DonORPe5CnhfPejGDRNneknICVqQyMep9oDg
         JIJaEhgvymhUfyTTmjYY8p6FQMpQvgy1TYjlxgstXBAjpMCApBYToaps3dwW3GcHg02g
         MGjDW83P6TTsA4O+9IuDAePluVg64qaaxlqr6oj9ZOFPZ+qGy2TldFLV/OKnEgXqyjvU
         GSmxG1xk0T+pv9Fi8o1h4ZR75QKT3yoZtgrZK+6eiDi5BKBUqdREKwQ2uWJ2KdNAqejH
         sLwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713805070; x=1714409870;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XFejkMe0OVlEaHFS27AO4JIPaFi1PczIDcBY/+c6L4w=;
        b=GlwE7lOHBq75gdYVhmsIyh9tRYJKxTqlgrOm9aSd5jqRYqDL7bXqMrutvmb48tBpAb
         3FwBsznbobVSZ/LksksAKivTzcdFKVmISgXJ+HF7wrjAmtglB5MW/ewBjfDo+ArHhobB
         WzkaDqohvqCnVuYMDCxC666PObckVTO2W8UYLbUPIu2xoASOOvll8jWVJSpWAr3Nv1+X
         JowQ6BSxhsyMkiJaTzaBk4y6B0ck8ay22NTC8Hp/5lpwfMTISAU1d0z3aQo+CL39KBew
         I26fm1YkTrEl6dHjKKDvzjkMYXjsaAv/BCh8T1YlTUS00aBQKYfj4m6zPBHN5fpleapb
         BWHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqmDvsQDUBkXpvI8nGdklLgz79ZPocETmEUTPA40hmoUwHKcqgRti8758K0r0sFLWwdbEbVCgmGSCN0z48DtoFf6ITTLph7kdgfuVAZInHOcU=
X-Gm-Message-State: AOJu0YwpZviI/uOH4dQ6oFAip5JoX4f9yNzt75ZT82kA47H+Oy1TTyX6
	4cvuc4I8kyL302G5m054muxRiJpgzg3LEv8YG7ztbYU1osakmI+DEVuX7byJ7jjBz2yukfblWEh
	h4ZDnVA==
X-Google-Smtp-Source: AGHT+IFPgoNY7jL28vA9FqUBo9t0jArnUgL+gophkF/W85BBll+VXJnnlKToYJDSJz0chYDGNDGGmw==
X-Received: by 2002:a5d:4082:0:b0:34a:2c89:8517 with SMTP id o2-20020a5d4082000000b0034a2c898517mr7612659wrp.10.1713805070257;
        Mon, 22 Apr 2024 09:57:50 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id y7-20020a5d6207000000b00346f9071405sm12509330wru.21.2024.04.22.09.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 09:57:49 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
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
Message-Id: <171380506905.4152979.12753297685732463141.b4-ty@linaro.org>
Date: Mon, 22 Apr 2024 18:57:49 +0200
MIME-Version: 1.0
X-Mailer: b4 0.12.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_095752_439350_AA90815A 
X-CRM114-Status: UNSURE (   8.28  )
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

Hi,

On Wed, 03 Apr 2024 09:46:31 +0200, Neil Armstrong wrote:
> The Amlogic G12A, G12B & SM1 SoCs embeds a Synopsys DW-MIPI-DSI transceiver (ver 1.21a),
> with a custom glue managing the IP resets, clock and data input similar to the DW-HDMI
> glue on the same Amlogic SoCs.
> 
> This is a follow-up of v5 now the DRM patches are applied, the clk & DT changes
> remains for a full DSI support on G12A & SM1 platforms.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[4/7] drm/meson: gate px_clk when setting rate
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/5c9837374ecf55a1fa3b7622d365a0456960270f

-- 
Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
