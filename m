Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 936B5C83F04
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Jul 2025 14:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f+7qe4BBgFoq6cKpOyuXnp2BlLIOkzWPvlp7VOFnXUE=; b=klDm3zuPYJBVtg
	lFt6xxsS9l9ukGmVt5A7JU2LBUzgmToBxzBC7MxNHDGgl+46PWSi9kj+3a5sRTCQjIaOKVBjAq8lU
	Ad4qd5TyJKEy9kjYlUD17BhTKvq8heOrKt5KbC1J4H6C72/0iqOhIoIBJsxEZcdN4sAfneqCy2LIW
	xB0fH4F5+xi4Ed+Xa+jcgEh3fjnDWD+JYdqpAC30iZKWaMf9KyyI499cgs9lMRaY+JHvJeQlFuMsI
	PW975cXQO+OD8tpziQcNod0/Gyxe3dXXQaZ77tJ+tuRS4WGOSGFwgJiBbWy4JuLx33Nhng8xdsqjC
	xh9o7WMtWhvZ6QDRbHgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWyou-00000008geV-1mE3;
	Wed, 02 Jul 2025 14:52:20 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWxqV-00000008WY1-0NhK
	for linux-amlogic@lists.infradead.org;
	Wed, 02 Jul 2025 13:49:58 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-451d6ade159so31675365e9.1
        for <linux-amlogic@lists.infradead.org>; Wed, 02 Jul 2025 06:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751464193; x=1752068993; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tp6qbi+ZUsoL8Zvytk6fdxJM4TvJdtmSvks0lRTguZA=;
        b=zG42uhKPb8av2ae0xGGfC6u8sRgRpJZKtYjY1IvsU5rPghZvPBuw8pBv7KvkwRQ0ch
         h5YVmmb+95V6fiP0FFK+nmc1UVfHCwWcPenZgnk9x5BUTCKiMatAyedwbkE9JT+FANtj
         1gZ14dxNKrll3MqGrBoNQ+FTS9nIuh3RDrwW+19mB3dBsq07AVJYaIkrIfQyXLFr8ubC
         4UG9LQ7ew5lQJs4+ZkX8Xotysm/D/mQabaMFknydqyVJvFJiGhUVgeQkU5jBWC58wyaa
         s5vTPbWV6G90152AkIYSHqDEk+R2lq+/rg0F7nhlxvnAglbYQHQSBatY9rVlVv2bvB9r
         0pFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751464193; x=1752068993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tp6qbi+ZUsoL8Zvytk6fdxJM4TvJdtmSvks0lRTguZA=;
        b=ppOkB1nmAU6GtNA8Lq/X5eGebsCF/Yxy2CkSoDkSqepZnCbaWxHWP7rZXRS/THMPgd
         dp5fM0+vxcUp6aRgt+8rtGohAoFyeb74fOndXNpMGJVpVJj62NhRelilSeghIiJj8nVz
         6o6cizyF6oGXRWz9mpaXWB8DpoEoThzu0RZosg/dfGUci6dfPmrO6VYvOPXyHE2jdyrn
         U3bmw4xj2S+JbR+VczwTS16P0cYwZQhJ2qWQgbtOEbGlkJKqbQACexgPv/HtB8dvg5ck
         CUbmxNb+w7wmG8mLUHko9LZg6UpjBGPPztU3u/8GTUWPTOaaGl59P31binBQMKPvBc1q
         XELA==
X-Forwarded-Encrypted: i=1; AJvYcCX38V+72S9A7DlUucAeI38GPSRIRTYHZJB7euPTah/zO/7+ltApvdFOLVSxmoLwxWxN4vegHgw0h8W5thor@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/PfgGypCJ8Mu6XrH8qNpO+ZrES4WRYei1wazpwmHPKEAc//oF
	C9Q7gBCgUA2iNF2iS94ZCGSAJT+v4jMIJMdc/ndKnO78g2hSmmH53vu3M9NjU+Xq38E=
X-Gm-Gg: ASbGncse/vhSmW5khemYRPSmH1UrznQHt1Mptbq3QqeOdV/5QMIxg9btAny/ZpGMpGd
	qEGHc0E/T80/hpk1gJi4Qoe6ZFrOPySVSQWKFBR8/IYk1vb/bYGJ3RYtZWxX8uiBhI40oVecJFT
	hAPIYYqCEw5MH56rSpDf9Po1BBFUZG9aGp02fDaei5IHrFwlHH5r2L44GqjQeaWK/d6MWvBw8OT
	L23AFCsyjW3wxsK4pcfoSdyRfqbHppfZ7TwP+/MeaMryfMwaDzK+L7S0ubdMQ2UaHpMme6K7ytW
	FVox59A6PD1I39iJ7HwZysgQBsIYavIsNuNB3kypUGMv6D6lflq9suhOyXR4DmgC
X-Google-Smtp-Source: AGHT+IE0aYFuuB17fOVm7tTLCtf+dmCjdxDuykMapL/v/tu9OvfMxXQZ2W+1BibdIhnsoHzg8jgH7g==
X-Received: by 2002:a05:600c:3b15:b0:453:66f:b96e with SMTP id 5b1f17b1804b1-454a36e59e5mr27310635e9.11.1751464192987;
        Wed, 02 Jul 2025 06:49:52 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:5542:4bad:e07b:9489])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4538234be76sm229611545e9.15.2025.07.02.06.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 06:49:52 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 0/3] clk: amlogic: drop clk_regmap tables
Date: Wed,  2 Jul 2025 15:49:47 +0200
Message-ID: <175146414026.853943.10828213278410339328.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250623-amlogic-clk-drop-clk-regmap-tables-v4-0-ff04918211cc@baylibre.com>
References: <20250623-amlogic-clk-drop-clk-regmap-tables-v4-0-ff04918211cc@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_064955_124428_82081A1F 
X-CRM114-Status: UNSURE (   6.58  )
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

[1/3] clk: amlogic: get regmap with clk_regmap_init
      https://github.com/BayLibre/clk-meson/commit/21ed19d11863
[2/3] clk: amlogic: drop clk_regmap tables
      https://github.com/BayLibre/clk-meson/commit/4cb53fff9db2
[3/3] clk: amlogic: s4: remove unused data
      https://github.com/BayLibre/clk-meson/commit/8a65268500b0

Best regards,
--
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
