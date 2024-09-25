Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BAF4CF9C79
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Sep 2024 14:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IIIU66cX3KCpI7Pt2PykuVNEkHrG4L3DYM4Z3hiWNIQ=; b=HQxH7EjdDP+ivt
	0pFbI4JilPysVi2mkfZ7wsjPyuCNjBIUcq8uYeCNKRPLnRY4W/PGH0vlQNmLNSZa8cYoEcj+m5Ak6
	9yIGOvRgfGtiwTgYFyx9v2+dRSHxNpZYc126KizL4n2stV7GRQgJNpoCTSKYWeZ9tZVIA9/xiZpPH
	bUa5gHrEdxPmdrKoLSEsJCeOClNfVv3OEfYrNp1X9n7r9e0rNJXoZKCLeXBj9n/sTKNHjnlBQvz2F
	JfN09bgiw1Q9UD1qNKeMkcn26Bjiy2vlhCG3kOaTuJJKWYfLJtCHMttN4bBmYxdkfD9F/xFJ5oSwb
	g8Gd6gP3O9y0GCFVIkCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stTEn-00000005h0p-3C59;
	Wed, 25 Sep 2024 14:43:29 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stTDI-00000005gg6-3Cyq
	for linux-amlogic@lists.infradead.org;
	Wed, 25 Sep 2024 14:42:20 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-42cb8dac900so66997515e9.3
        for <linux-amlogic@lists.infradead.org>; Wed, 25 Sep 2024 07:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1727275315; x=1727880115; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I6YxIAdzjayyAJ7SPnjQzAFuzcgXCfaGhFkXioDlFtQ=;
        b=S5haP1vIcTsZZh38FAQXdf4fb9xmupSCPKzOvkzyLOyxeVGDVW0nC7aGyT148zF+Mm
         G4DlsE7y2v+HSoZHvQjiKspKqshZ3maRgP30Mpor0sYBc+aNj5nPpI29uSZ5hxWlW0ib
         1nIOZf8c+KvhN4S0Kt2hKyKtwaQ0blnMd+A/7DKsJfIpvMiK6FOzgnLRHpkTaXcHjPfi
         Vueuw/1LkDCG15lx/gAGHp1RB1ni+k23v+/+jzLbPi7sF//tCnqBt0YvQjuTEiiWiDf3
         VzmlPjgI43D2BrNgNaLHLKib6oEkN/dnjMXqTp64Z0HVL5Y0HN7rs+jKLkP2Lqs/cOGy
         njPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727275315; x=1727880115;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I6YxIAdzjayyAJ7SPnjQzAFuzcgXCfaGhFkXioDlFtQ=;
        b=OQ5v/1ZK5Bd6xEGg2q4paR/jyv6J7/cDFKEg/eUeujZBlv6EvBnFVWCE3Pwx+SCV/g
         ldiZ46/Xt+vX7fHJLSe8WC6PoRiLDCeSpjeFES3h55IcYTywAbAX2rgq2ZuUo1QmhDaC
         Z4SL1CuBkTeC4irjv/ESIeHBxnlec60Zk24/UVUCr2zmt0bEu2VtjmibAuCvgNnxXH2w
         tk7T4ugEh2FLw9E3HxunCbdyDqFIh/3uhwABX73ZRUXO09+9QMFPkEIPtuRjuYjKZ+3/
         s6Y+3gi1hGrkXA+/l5WCfyCoYttEjCJ6bAJa8Gdg7o0Z/hk4zM2pFkds/kTrugW7e50I
         lp+A==
X-Gm-Message-State: AOJu0YwkztQDYrWcenTnixlFGXxwrtLath3eYOfOg+G+GWhEmYL+C0AR
	2V6vMJeW2HydmDqJVfrOfE2vjbnWPLgiyuF/rMSY/RJujXwreZuuOsDXeyLkuAo=
X-Google-Smtp-Source: AGHT+IHAfHUuxoeTZOXnlSb00AtCPxIw644azB+Jwg19bMpf06tWeqhuqjRnBMg/w0GGwp9dIbB4gw==
X-Received: by 2002:a05:600c:1e27:b0:42c:b45d:4a7b with SMTP id 5b1f17b1804b1-42e961465c2mr20376755e9.25.1727275314706;
        Wed, 25 Sep 2024 07:41:54 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:857b:1996:7ede:6ce4])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-42e969fb894sm20822045e9.16.2024.09.25.07.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 07:41:54 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Chuan Liu <chuan.liu@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240925-mpll_spinlock-v2-1-8f9b73588ec1@amlogic.com>
References: <20240925-mpll_spinlock-v2-1-8f9b73588ec1@amlogic.com>
Subject: Re: [PATCH v2] clk: meson: mpll: Delete a useless spinlock from
 the MPLL
Message-Id: <172727531377.78586.12477940902502018099.b4-ty@baylibre.com>
Date: Wed, 25 Sep 2024 16:41:53 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_074156_812360_E0969F90 
X-CRM114-Status: UNSURE (   3.92  )
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

[1/1] clk: meson: mpll: Delete a useless spinlock from the MPLL
      https://github.com/BayLibre/clk-meson/commit/14b8d1d8b2c6

Best regards,
--
Jerome


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
