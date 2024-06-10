Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B54B2C27C55
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Jun 2024 10:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dis9nUzsWkP6IC/F0DwPCC7TgwsNclqRMkPcOpgbbQs=; b=RQpN+Ca0qzOCb1
	qFDgYjk2bUpvVPYjYAJwtmqPSvGVsJXBSHgel9WIyPNEej4+3KwYHGcr/ZqscVmp9DAob4hnHyoyV
	RhUZbMs6MKLDMacbyiFywRejTV0crCl/5+3ygUk6y4+b+qxriANKAdEL9ttUBCZ78AdGJI+idp7Bv
	52Kxf5r6AcFnXAhzP5kszFsNLrAp1axdYlA81FVol2oA2pg1kG5couk1oXiIdgyTh/UPzBipeYgVz
	PYH7xlgH4FbKH6VlQD2Ga0K48j6WLJevsIkWjnbzx/BBQFwmbwCgfw16EYgZ1PdgLZ/Sem7dyGDaf
	LmQHi6K60MF1wJqXnG4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGcKP-00000004fRq-1zrE;
	Mon, 10 Jun 2024 10:32:41 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGcKL-00000004fQx-21lc
	for linux-amlogic@lists.infradead.org;
	Mon, 10 Jun 2024 10:32:40 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4218180a122so7228585e9.1
        for <linux-amlogic@lists.infradead.org>; Mon, 10 Jun 2024 03:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718015555; x=1718620355; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MXXg9qprKu/qiLNvKW8mzWq7DARUrTSzjJdZFxDwHKA=;
        b=nRglk6S1l798+JgaqConqOOXgnlxtgrL8Wl5KL+iKcwAfegJkxd2JH6JLhbqysa58W
         VYAGEQTSt/8IsjwEk58US2T0HGVq4Gs0Z2STPAhxDJW8NrZmbcmIriQdNob1G6UTO8dU
         P21Z30aPfbdPmLPizQdQ9j8lh/QLksp69Q04WJofy6ogI/CfFeIUZ2GB+vNa0PVah40r
         QmVyEIAc0BQWA3xLa922Sj7Mk0XpRdL+8GhaTaUYoKoMD1zWlV+GrqEu3ESWo1BkLO9N
         JwvRwBueBVFVCaCSofoiijQ5GJZfXkPxmUjnPewnlFMcmW64W/Q8ORdnRnf0a5AKh/yw
         kfBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718015555; x=1718620355;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MXXg9qprKu/qiLNvKW8mzWq7DARUrTSzjJdZFxDwHKA=;
        b=f5dFoHkhLFLkVi8umiX2uUxTTF9W0BEbs/DCZYXoUFp2ah8bCj5rX72BgT5iFZB28z
         gDO6oSJRRDarTtK+bjTAvIAWmiLLfBYwIv3yxfXDhektJ5cN0SGCO9zzIlyvcen6PPfD
         WrGosSnGAzBTCMaLNCvJDrdUQbfM0poh4ePQemeXkLEhcPzTysgDA1v+m7y+QpIS8iJs
         jPg+lC026kE7yN0pSs3uGHZ/T9u1Exdcqxv782bnSGeA0fEGRLpXfg9GS4+wVNpx6hiH
         gwkjRizGSN1ExZ1msdOUhOAb0eLGKfeZzFoPDem1Nm9Xc2fIBlccs9qIkztFw1LgAOMx
         bdtg==
X-Forwarded-Encrypted: i=1; AJvYcCWmj5EphfWWJSPVIt5IIgC3N0Iu2WC6I+D+VjTpkwyLrsx6mDcM0jkw/uW6mUY/qJj30HPtGRw9eofjETO48aJhuv3c5vhdJWRrh4f8xpjcY0o=
X-Gm-Message-State: AOJu0YwTUrC2KVjYISeX+fw39ckgXah1hH3nc+IbQCvlAOBRriTYR7pO
	CBKQbu2ptFLMMaYHaTCZGlfWJGe82upE13KNCrA47M4iBBBYe1qZEMGePUp1qfg=
X-Google-Smtp-Source: AGHT+IE+UMWspFxOkW0VMFhc6ufITIhWfVtf8wdrgpK/+aRYj657WAU4bd9S2VLhpwjXlkDwo9fr4w==
X-Received: by 2002:adf:fa4d:0:b0:35f:18be:227b with SMTP id ffacd0b85a97d-35f18be22e2mr4263828f8f.14.1718015555378;
        Mon, 10 Jun 2024 03:32:35 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:afd3:66ee:5486:4249])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-35f2774bb64sm1136213f8f.103.2024.06.10.03.32.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 03:32:35 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: neil.armstrong@linaro.org, mturquette@baylibre.com, sboyd@kernel.org, 
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, khilman@baylibre.com, 
 martin.blumenstingl@googlemail.com, 
 Dmitry Rokosov <ddrokosov@salutedevices.com>
Cc: jian.hu@amlogic.com, kernel@sberdevices.ru, rockosov@gmail.com, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20240515185103.20256-1-ddrokosov@salutedevices.com>
References: <20240515185103.20256-1-ddrokosov@salutedevices.com>
Subject: Re: (subset) [PATCH v3 0/7] clk: meson: introduce Amlogic A1 SoC
 Family CPU clock controller driver
Message-Id: <171801555454.91134.14151750531513287014.b4-ty@baylibre.com>
Date: Mon, 10 Jun 2024 12:32:34 +0200
MIME-Version: 1.0
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_033238_241764_E7E1CB70 
X-CRM114-Status: UNSURE (   4.45  )
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

[1/7] clk: meson: add 'NOINIT_ENABLED' flag to eliminate init for enabled PLL
      https://github.com/BayLibre/clk-meson/commit/d4c83ac16c65
[2/7] dt-bindings: clock: meson: a1: pll: introduce new syspll bindings
      https://github.com/BayLibre/clk-meson/commit/96f3b9787363
[4/7] dt-bindings: clock: meson: a1: peripherals: support sys_pll input
      https://github.com/BayLibre/clk-meson/commit/41056416ed53

Best regards,
--
Jerome


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
