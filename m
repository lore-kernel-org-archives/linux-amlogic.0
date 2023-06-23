Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76CBCEB64DD
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 Jun 2023 14:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cbvIuGAzOY+5U2B2CbFEjcp7tvNVf69nOVgIz6xsqw4=; b=lH9h/c0HWQzmz7
	Qmgj2SCiDc9pkoLyoTcz/nxMaTf1vS6Cd+a1r7R6vpbI/CIhOEGQy8vTlhbX4pq1U2ROvq+tNgfbx
	YbYWZHam7RY3qpwmGXFZCW71JbC1RdEd45PevLBWlKOoqXnSV5pjRdONCmhVKZLQ41p9rYCRWd5OL
	LKiSW/rBucHlnraGjgh5rPG8NxDIGtnDH5wLWtdrq9pN5bJfszrm9ubh2WNCV0kwM7/zeO6d4smXp
	wqxzYoGJwNWvsjJ1cFyLj7ovgg7WFvsWVWRmDJOnaBuMi4DHnPqWgtxsQsfPEDP1SNpRFZGa7K+ES
	fZfr+464udBZmuomwHcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCi8v-003qAB-1P;
	Fri, 23 Jun 2023 14:52:09 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCi8s-003q38-0d;
	Fri, 23 Jun 2023 14:52:07 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-3fa71db4208so8360165e9.0;
        Fri, 23 Jun 2023 07:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687531912; x=1690123912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ViquPjhH1N3je1UsslpC1YcsHiBgdV94QpP/Uq4EN6c=;
        b=VeOIvv1VwHaZZ7rz8gSvtHIrD3X83U1HPXSZG4BYORVUG9R6zCqv+K5EPd+LyHsTvp
         zug8rDJvuoMupQF3HAAVnTtdI/UOlJ3PIjjoMGJ39N11NlfjerD+zaCic0CrLuAEcT4f
         n+bU1sstAwtKwlYaqfNpuPCmurFC/yM3yi1PNwGeFGrky1TvPSo+IE5fQ/DLn1PCbhc4
         qmLvUaGzajRNcSbBRsGPvfE550FLpvspDSh057b3kBBv7twpxwSgCYPdeA4+vODx86sk
         G2lF9PPzkodf0x9QbV81CZRI7+rCxboubERmEpgy+LZphAR/j6c5tz4co54cD/OLpAeR
         fwpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687531912; x=1690123912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ViquPjhH1N3je1UsslpC1YcsHiBgdV94QpP/Uq4EN6c=;
        b=AvY/HOHl5b44jjehCNDU8gxM8PvXJqQhEyyDiYOmTSJIiARoFLrR2c0dlLlKK1ZCjp
         iwR47ceTRBekZx2lSCV0lFaRJPUAeIm6gEQyh9auMO8fJVEy7qbSiqNijLR+NbbPTGqR
         NMdkJdyHPi7YsJZ34DKIBPNILW5uwl3xbRKtIjOEgCGCQ46i8Pcizd0p3HI2IAdVrEgI
         /Ys6NY2c9vte0fQw7kG+J+RLlHPw/i8TMpCQssAb7wHgkDPzc9NI49MI6Ax6hVpCvuCq
         eK8uhl2KY1wAMa0whmwuOXQDf9n1RzgSneIL4mkF8UE8f5b4LgfNlLlPVCEjInvr6FCe
         a2kQ==
X-Gm-Message-State: AC+VfDyVSd8/DXytvHG7crBS55MixCKLWW7qir7igVntbP1e5NL+Pc1X
	DRYYoTLPLEpkBLVOnYvFtVo=
X-Google-Smtp-Source: ACHHUZ6f+5xuDTZEg0/tJxV9Y848iMRoZYg1E35qIhp671SIzvA/yhVHgpmJdLO8t73zzy/hxs6Auw==
X-Received: by 2002:a1c:f718:0:b0:3f5:1728:bde9 with SMTP id v24-20020a1cf718000000b003f51728bde9mr4357732wmh.2.1687531912115;
        Fri, 23 Jun 2023 07:51:52 -0700 (PDT)
Received: from localhost (p200300e41f305300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f30:5300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id m21-20020a7bca55000000b003f4248dcfcbsm2552540wml.30.2023.06.23.07.51.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 07:51:51 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Kevin Hilman <khilman@baylibre.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
	linux-pwm@vger.kernel.org,
	Dmitry Rokosov <ddrokosov@sberdevices.ru>
Subject: Re: [PATCH v5 0/6] pwm: meson: make full use of common clock framework
Date: Fri, 23 Jun 2023 16:51:35 +0200
Message-ID: <168753171964.1191890.9331410157279790777.b4-ty@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <aa498590-261c-4ada-63ff-8d7aaeec0932@gmail.com>
References: <aa498590-261c-4ada-63ff-8d7aaeec0932@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230623_075206_234443_5756C963 
X-CRM114-Status: UNSURE (   9.92  )
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


On Wed, 24 May 2023 21:45:55 +0200, Heiner Kallweit wrote:
> Newer versions of the PWM block use a core clock with external mux,
> divider, and gate. These components either don't exist any longer in
> the PWM block, or they are bypassed.
> To minimize needed changes for supporting the new version, the internal
> divider and gate should be handled by CCF too.
> 
> I didn't see a good way to split the patch, therefore it's somewhat
> bigger. What it does:
> 
> [...]

Applied, thanks!

[1/6] pwm: meson: modify and simplify calculation in meson_pwm_get_state
      commit: 6b9352f3f8a1a35faf0efc1ad1807ee303467796
[2/6] pwm: meson: fix handling of period/duty if greater than UINT_MAX
      commit: 87a2cbf02d7701255f9fcca7e5bd864a7bb397cf
[3/6] pwm: meson: remove not needed check in meson_pwm_calc
      commit: bafa23b6c07caac63a9637e83a605c26771b43ee
[4/6] pwm: meson: switch to using struct clk_parent_data for mux parents
      commit: ed73300326ec67d2a0c35fb7f911314cc6d7d918
[5/6] pwm: meson: don't use hdmi/video clock as mux parent
      commit: 3bddf73285d578a1798189e0eed2e7f82ebf0e11
[6/6] pwm: meson: make full use of common clock framework
      commit: 329db102a26da0ba876974dbe04308d08acfad94

Best regards,
-- 
Thierry Reding <thierry.reding@gmail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
