Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF4B606A31A
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Oct 2026 09:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JlrYvLdT;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=FcPcKCDk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6ohIAarw9NttYN1Iq6BkBuurMVyXwUDwCVo4n6+PO7c=; b=JlrYvLdTYUbsRL7KRsM1xkBC11
	azjpVATOUXyADhjSkqgQeCe8sS+HVFMIV84CMPLN6+RijIbcEziPdzm9ICMdo9GDCinyC1kLjtefY
	/6XCN1l2ftGjiZQJvP4FB6emrgWHvt6UyQaBxVsrhkpXmdifNuspBF6sgJn1qPLnjVTeXf3xQnAko
	ZXlADC0uKyPVbBDgqTNMUR9Xb7Y+PuwmhLwqbVJCY0/o3kQNbfZAsYMAsIZYesrrKvBIUEUwAoweW
	B20SWs+jKT6oFJWzjEXfd4GDUrkpB0AQnYA6nw7cPCse41jpuJiHh+r04iWYt2Uw2OjcAVD5t2W8r
	QHStb83w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMiX2-0000000BC8f-3f8j;
	Fri, 30 Oct 2026 09:04:16 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMiWz-0000000BC7O-18Dh
	for linux-amlogic@lists.infradead.org;
	Fri, 30 Oct 2026 09:04:15 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-48e47347279so246464f8f.1
        for <linux-amlogic@lists.infradead.org>; Fri, 30 Oct 2026 02:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793351051; x=1793955851; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Lyeem7zbd9Dj2v4p81+wNT8qJ6Duf4aQ5ILsHn2QZOY=;
        b=FcPcKCDkBd7Vat7mnxF4kWJ6JvWLVd2mgUUFuO+viv8gcF2WqWX9op33QUICyLKqor
         O3LykCGHWdiSAtMYTooibcd05vXDR88u7x7X3CDK2C2D2KHO1ccAdblCOTwY5Zr3jxL+
         GA0cYrtRDeWdmUCUYXZoiMGS5Z8e81lAA6CLRjEJ0JuyQnPz/NZRCjAGO+/TGNb9aT33
         8hVItT1ocOWvKqJYvYN7tYjid2VTtZ0+KE26y10pS+F2lgr46hKgsrjPDIx7JapssXfB
         7FpA6tKN2V+a1+RRl1oLY2uHoY+DOb2zvtAgBy/iQYx4YVjQXtMSdC9ZRMBgRolzcEe4
         tKsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793351051; x=1793955851;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lyeem7zbd9Dj2v4p81+wNT8qJ6Duf4aQ5ILsHn2QZOY=;
        b=2YnUedVdsBfFothvRSjBugUDQqRgTZOjel9fiZTw3bmMuNXA2JU/FfDXj+/dz8++LL
         uRFqlvLZEdfAvnYNS2IMPVtDkVS/QIH7fHMuPQwAPQk6P3yes1jzWpfpcx8z8SETPLm7
         TWFMsbhMScLLvgULrabjz2jV1mE1GZTmgCDBajp6drCPgs2peV/19NIeBwWvWB0AFR91
         WyqSVC1O301dK7Y2fp5mb33pa9AP4EkFgoXUZLDzpT9z3mj6h/rF0f46ymJ7GGJf3sIi
         F0FYuKSSRLswXObYipqdZTYx5V+QF+/MDGqksjaIKyWkQbTYlLFLXHjlDBdSD+QbNvmb
         SJwA==
X-Forwarded-Encrypted: i=1; AKwUvBzERBMsAa2U/Z5dn55/3NCPfC2yxZJ5PjSdFWOC+cMPOVu0bhkHxyfacrMh4e0DHOZEoUwSkUxq/RLXaoEJ@lists.infradead.org
X-Gm-Message-State: AFq9FYIdLqPIw+GWihzto9A0wYNygjwmpsKDss1LAXMeWPlKzZGz2j6e
	FoqOOcBt6F50JqOc1DOIs9Q1eFmDHYqt78svy9hHJEj4++WQfex9GLfotaee9EJR1hg=
X-Gm-Gg: AYBFou0/4IMRGBEvsfHe9CLfWP3eXZALM84e4aWK1ZAU/Aydr9Dh4ehIU0cx2ZExYeC
	MED7zd4D4Nt3SMDMAMpwdzkKK4bQyXMyjiQxKzh+80wIFl+DcKNXHmuwaOOhGMMBJZNFDZpDCSe
	WNRo2aykPbPqJ+f3X+/K2peFOSdBMK1zr6wYg/C03raqhKJ/5tYc5zDcy/+FWzv+552wXKAu7QB
	t1QCzEQPNs62SWYLawpl8uJeR0gQLYB+SL2cgRHHMzgZ+Q7jqqzs2stafkNESvIMH38bOhmBOL8
	Y457v9FiN0M8qGv8pHZNY0MOH3vd6HEwO9x71sA5cN+YkrrGcWDGfhUxhHG1thVc2mI31rs0+6n
	EEjVzSDlg1U8w70e5X3ZriLhpbd1wc8ooL8sg606jXXnLHCdpyE5H/sE1v5086eIpnXY48Wh3Bq
	IQCujPfSuABhwxBaQRidzVTM7TsxCIYKezijVcwKKvNPWHkZ+OaS4RYgSk0JLV+gG0rklVk3M3N
	mlGKdn2jrFdPsjno6xGTYSldUoYZDBYjPmD7ki9E2B7TJBDip0fxKrKRfVDUE/TFe5j4mRuUdin
	FmA8xTJg4S6QSbP7rrYgc2RNMb7T6CsFKczKGrmrjyemo6OCAA==
X-Received: by 2002:a05:6000:29d3:b0:48e:5df2:a011 with SMTP id ffacd0b85a97d-48e6e2c14a0mr2402572f8f.5.1793351050905;
        Fri, 30 Oct 2026 02:04:10 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8bd8esm1977127f8f.42.2026.10.30.02.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 02:04:10 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] clk: meson: Fix PLL enable timing
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jian Hu <jian.hu@amlogic.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261028-fix_enable_timing-v1-1-70f060ec3f2a@amlogic.com>
References: <20261028-fix_enable_timing-v1-1-70f060ec3f2a@amlogic.com>
Date: Fri, 30 Oct 2026 10:04:05 +0100
Message-Id: <179335104535.2573818.8004160070280286355.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1514; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=Xx/eVbgodhm0RN6K7j9bFweBrB1LQw7pZ6RJPufC9Ko=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFlPYjsvLvb60dNYISrD82ePdkjGlu8bu59yTpnJIHckl
 d9Fel5hRykLgxgXg6yYIksNd7X4O0mtL7Om69yGmcPKBDKEgYtTACaiIcfwP+H5ve7nf765rXFe
 3Xhp8cE/jpN2ld5xm75PWd5+WuaClckM/zRXCy/+OTWaq/BGwcM/q6vN/z03MD/MvFqk3Sg99NV
 zCT4A
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_020413_337839_70F54A15 
X-CRM114-Status: GOOD (  12.90  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> The hardware requires a 50us delay after setting the PLL enable
> bit to meet its timing requirements.
> 
> Without this delay, GP0 and HIFI PLLs on Amlogic T7, SM1 and C3
> may fail to lock under stress testing.
> 
> For example, enabling the GP0 PLL at 1512MHz may lose lock and
> result in an output I/O error:
> 
> echo 1512000000 > /sys/kernel/debug/clk/gp0_pll/clk_rate
> echo 1 > /sys/kernel/debug/clk/gp0_pll/clk_prepare_enable
> sh: write error: I/O error

This is something for the cover letter or bellow the --- for a single change series.

> 
> Add the required 50us delay after enabling the PLL.
> 
> Testing on GXL shows that the PLL works correctly without the
> additional delay and continues to lock successfully after the
> 50us delay is added.
> 
> On A1, remove the redundant 10us delay before enabling the
> self-adaption current module, as the new PLL enable delay already
> covers this timing requirement.
> 
> Tested on: T7, C3, S4, AXG, GXL, SM1 and A1.
> 
> Fixes: e40c7e3cda07 ("clk: meson: clk-pll: add enable bit")

This is the commit which introduced the enable bit and it is not really
what you are fixing here

A more likely candidate is b6ec400aa153 which introduced the delay
sequence you are modifying here.

I've got this other patch addressing PLL delays in my queue:

https://lore.kernel.org/all/20251031-optimize_pll_driver-v3-2-92f3b2f36a83@amlogic.com/

Which one is it ? both ?

Please consolidate and resubmit.

-- 
Jerome


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
