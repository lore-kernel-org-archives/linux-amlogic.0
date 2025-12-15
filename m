Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6635CD41D74
	for <linux-amlogic@archiver.kernel.org>; Mon, 15 Dec 2025 10:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=57Qs61v/IKm1B2+ERfeEJOmN9oBtPcp6LncOVX4D9WU=; b=k0WVoB2E1tswYb
	UrnkybP7nQmDuUrYiJiJOU9WpVgrVd5XR6SW3otpjECcO+fsM+McKTqfNcfEA3A8qgnsbaoCP7ki5
	plVkYPfZVqPcKvTETTueSeJ1Aqsn9sgPzArIXCc9HV04Ii9dKqcLkiksZEBwHtpwIPQ88UH2CDYkz
	tYjyTPVEQrfmnpgynaGh9HpLLe12chKynKBYywSJVtq3aX0Js/THoDBu19HvLAMCk6JNnk4zPjmqZ
	cChmDzVXA8LWOGjHBdJeTjAP1i2nVtpAEyMYcnFFb4qtX/TNgmpoSGwvbSowgYqJARMFTn68rV1Mt
	2UhDMdasDq1GNEDJ6o0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV6Ac-00000003Tn0-0Gue;
	Mon, 15 Dec 2025 10:51:14 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV6AW-00000003TlN-41hV
	for linux-amlogic@lists.infradead.org;
	Mon, 15 Dec 2025 10:51:12 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4779aa4f928so41674025e9.1
        for <linux-amlogic@lists.infradead.org>; Mon, 15 Dec 2025 02:51:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1765795867; x=1766400667; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=df9nR8VZxWqdoDGlAC2gMzlQG9390TwrDoFTIv4go2s=;
        b=1YM/D9DdEav6KnJL5R+KculLsN+DNxREh+3US0tAYpFQ8BRRxmmKNZxvMgobmTetpk
         MGccZL9DLTHQj4Fougi4W12+M06V297gmpm9DZK6AAbHgMoP/VjN4kn+5kfSf4ZlO929
         Zfc8C2FNCDooq6LTW5CW/zkEedo9ZhNBALhmGOCdmaGYqNrHtd8TjRA7FKsMoDCzoLj7
         jxxV46V0+ZubAUtIljWc+E4CZFlMKrapNQgM+Y3z+JamByMw/s/6T4R9CKpd00Vzj/Os
         SE9rab16zk+pDMaud+sbAWiICY4O6pUb7uTIwrsGphWwLctkMhhuiLK7Eeh/D3IGnyUP
         2ZuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765795867; x=1766400667;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=df9nR8VZxWqdoDGlAC2gMzlQG9390TwrDoFTIv4go2s=;
        b=O3pnjW+w+loYWPzq87xRfCG/nouhRvW/6b8OsMKRe7IicjNVXPdoP7HNgl4hvRdMKl
         MhYqNk4SUB+l5R+vlrpaypB0HSp6Z4f+OETU+jbYJhULqk+wBuGBXJU15p+NHrnw/rWP
         pUaxU0fiROLvpji0gcJxh2ooN6qzPvvr6ijghoSG7zTEcy/uFl4kbm+ervTbxAcCwK9O
         xqVD4qZ4B96s7FRsPWJS0UBbY1hZ12KDFA34Icn2zYqSQMiSUsPV5HbLXUaYYNLTc0XG
         De3OaO1XeVVPcyY/DrQRDT3cNhVMDBMklk9glnocCNNCl2/u3Spu3MVQ8pK9mz3/tzKW
         FqIw==
X-Forwarded-Encrypted: i=1; AJvYcCXFACc0+A5U+uwMUHLk2PFSB1Q03ytQCaIQsZB3x/Zw2PNFk/9EgxQOP2jOKVLdc9rNzwB8WtHP9E/piKFc@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7n3K6NjQXyfE5mhc1+6mdcjyY2DXguUis/CPFqVd5byXeBFuD
	fO/p7+wF25b+tzdkuVa+lX5fdtk4i9u1v1x7J/Kr948KBaDJc3L+9PgwnJHbtdzjdkE=
X-Gm-Gg: AY/fxX7lWJXyT7zCTAVeC1GaYYZ74gB2TokkiFWG/xxWxNfZccZIUSc4POXvYZzr5ni
	/QQuh1sXFQb95SqQ8KVKf4N8lFvBSS20jUG3VYGbGC8kAG4OuXMLA0TdTPJaYqHJNyQ12SPqcJ3
	JJFMI9KxQa7S+6WEUwP8rSXak3wI6GyPXeGGJk4TPgRowvYi0dX0lpE+QXzKTtXXOO8wor87tAQ
	BPbKzlMfJj5auATPPmWtPVap6yxWMq1oa4vJcjgp5dGBPlwFwN3jKalfxqSwyzpZNtksDE9Ilpn
	2R3kRH1vz8w4R5E9u19kGXApO2ra1jcoP811zCVE0KE8txgO0oKo2K/t+y24OUGZ2eFRR2EzpOS
	17Z1Fjr7KBxhhaiGSMc3sqfcvmkT+LGzNKHJULTaM9j0HptgVBfxITHxs+1UNPzZKr7DmQuO92m
	fHWEdao66qrUNPWDSPAwHiuzNP
X-Google-Smtp-Source: AGHT+IGQkDPSiIqBU16hW6pkKLW9N/W+yMzLNnRQRqaDZA+xNXh4rMLXjgTTwvCUQbRtUa5UMQD+Sw==
X-Received: by 2002:a05:600c:8b6d:b0:479:3a87:2093 with SMTP id 5b1f17b1804b1-47a8f914528mr96491215e9.37.1765795866989;
        Mon, 15 Dec 2025 02:51:06 -0800 (PST)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:3f77:1837:bfee:f255])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-430fb078e56sm7695439f8f.21.2025.12.15.02.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 02:51:06 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Chuan Liu <chuan.liu@amlogic.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20250919-add_video_clk-v6-0-fe223161fb3f@amlogic.com>
References: <20250919-add_video_clk-v6-0-fe223161fb3f@amlogic.com>
Subject: Re: [PATCH v6 0/3] clk: amlogic: add video-related clocks for S4
 SoC
Message-Id: <176579586619.1510096.14461375977036233686.b4-ty@baylibre.com>
Date: Mon, 15 Dec 2025 11:51:06 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_025109_032648_57AFD770 
X-CRM114-Status: UNSURE (   4.57  )
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

[1/3] dt-bindings: clock: add video clock indices for Amlogic S4 SoC
      https://github.com/BayLibre/clk-meson/commit/29c4f32095d0
[2/3] clk: amlogic: add video-related clocks for S4 SoC
      https://github.com/BayLibre/clk-meson/commit/c78c9dbe2bb9
[3/3] clk: amlogic: remove potentially unsafe flags from S4 video clocks
      https://github.com/BayLibre/clk-meson/commit/4aca7e92023c

Best regards,
--
Jerome


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
