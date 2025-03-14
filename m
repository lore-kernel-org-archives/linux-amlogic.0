Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48829C282EC
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Mar 2025 15:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pxM0EPupRA70EIG8GNGQf710M3lW/erfNQAiyoeHwxM=; b=fPCfu2b0SCr0Mo
	ZCooivB9KsMh3j3BEVZgG+lrlf0IaMwmhYv9ttif3tQ2+pKlLdFV8PNKRFuQFw7nZzBBNge6BQi+E
	9xhO1zVPK/vm/FXH9h3E6jAXaLxRFXYRy7fd+8KCOSLjGhZCyMjuOmNO3wWIoniKfkfRKhkaFJLXv
	fn3QYla1kRe5qVtUQpbEWPNfnrbsDbIxKp4dczpML0vhF+pX7qbFA1DCzalPCKfeEsXNwjMHrCo7A
	4AifEbZUc5Iac7huNG6HzmJ764Jemxlud41Xqan1FC74dlrZuQ8eEpW6kHu/OmYGd+XKmXE0ekAvZ
	JrMxyGoH+iyrsOwylLDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt730-0000000Ea9A-11DM;
	Fri, 14 Mar 2025 15:34:06 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt71I-0000000EZpu-1cRM
	for linux-amlogic@lists.infradead.org;
	Fri, 14 Mar 2025 15:32:22 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-39133f709f5so1395191f8f.0
        for <linux-amlogic@lists.infradead.org>; Fri, 14 Mar 2025 08:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1741966338; x=1742571138; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9N6fTM6SFDsTbt/1MZG+/5cRZlKHEghdhbe8yHn1vL0=;
        b=1AKm+Z5aJasGYG17CLovCEPit4wSEh0mDsa6SgtnqoLdPkAqRN6+4fvMV9bMoNCLTI
         zJ0j/CQgjgDPKN19w+ykZggR1HkExu6dbg657g/1r5LgiF/tTE9uMwHyUMvPrEnQuOWT
         6qTs/45d0Nji7HtH0T757TqA9ouOE5aU5yurE3gdjz6gCNJjXYskGB3wFLbcXRZ7SLE3
         Z3mMvTCzyeWyX5Uto4LCNB3FvCFdJAnqX6KrVz9MnMGJHep2HKQXh60v9mC/YtH4BTPQ
         F2NUEElgXBte/CBvfabuM+hiJDpbtojcQeszkIywjbUVZUBp4f7qfIPjxwCpuvFLUbT2
         AyDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741966338; x=1742571138;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9N6fTM6SFDsTbt/1MZG+/5cRZlKHEghdhbe8yHn1vL0=;
        b=YFXO7MK44elDxSNa4dOOx4R9YLs+nt7TIGYEawGX+kTv+/lCV7UjrSmla1FT2j8FcO
         jWVQ31CIah6IRF1hghQXgkHDiR8GwDvCR0mFrqPut22ULiFw4CJJHb5Qe+KVVjb5Chfm
         wf7TrsxyudHyX909gonF0O7FYWMT5KqUahSWVwQW2EbuEBbe1rEqpCasbQmEen9gBzpV
         1Vw7BPB4F79SNOMOLyXq/M5iGJseGNHdaV20TeJ85Mc+AeSuSwSoto6mT7A0HnbO6Ae6
         lqj/5ouFEiooai9GkNEpNOm1K6GBLa8uNG1/H6l+Iq2/Q2yVCC/UbGW+BFSBzUW4ZHib
         F9ig==
X-Forwarded-Encrypted: i=1; AJvYcCV4X3DC1xe17okYNXaM5wL1KQWqfBG/mBe++vbD3GnyP1DzFQ7DkMZuSNDLZut0rbd0ayh71eZWtZsmiTy8@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7qFWFBkbzeajVvj/0bx7pghmfYtooOeDOfO57sHp5xi5ALWZz
	xQtmPPPBzd0w/CUcGbwyTJ8QNVqXNdE5LmGzBp3B9LOc8FfhANQVM2XCvSIFSmA=
X-Gm-Gg: ASbGncsL+dEoSb1+yGQi6hQG9z3JOmfdovUnDvfcVlu1CyHvPNDVXPM+jyL1/lK2+Kg
	CrGZjD6ry5Dw/m9mafPZW16M4LoWsk5h4yEUyAIYMYhhKJMPs4RRSsr++a+QmfplUlQMNLn5CiL
	oYLK7VPz673JZp6PRPkHcKv+tQsVgo+ZMOdd1DSfyUdTLbw2j3/N/WSt3/kR7piwrUAMvC8E9D1
	GdZPbLg1kwtyWuhW5ITfW7vyYmusNpJN4ynEhS7pXHkOSl6G2/It5QRAUprNEFfD8KsjHunEIHh
	+MNczyguUNOf7FZ+IZyPoHMRnJJxHku3OXr5j/CbYMtCc3Ju0Z8S9BoKUlY4fDiscRha5Q==
X-Google-Smtp-Source: AGHT+IElbbi8SqUshMCl/+GUOzbAuMlg/4w/X9x5Rezrz6ar2Vdo2Qvg6tqIZ2ip3uemwQDmNf/X3g==
X-Received: by 2002:a5d:64e3:0:b0:391:2f2f:836 with SMTP id ffacd0b85a97d-3971d336b00mr3512774f8f.17.1741966338308;
        Fri, 14 Mar 2025 08:32:18 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:6eea:2dc0:eafb:9b35])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-395cb318acfsm6036005f8f.70.2025.03.14.08.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 08:32:17 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu <chuan.liu@amlogic.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Dmitry Rokosov <ddrokosov@sberdevices.ru>, Jian Hu <jian.hu@amlogic.com>
Cc: linux-clk <linux-clk@vger.kernel.org>, 
 linux-amlogic <linux-amlogic@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
In-Reply-To: <20241231062552.2982266-1-jian.hu@amlogic.com>
References: <20241231062552.2982266-1-jian.hu@amlogic.com>
Subject: Re: [PATCH] clk: amlogic: a1: fix a typo
Message-Id: <174196633722.1526311.3272915728848116488.b4-ty@baylibre.com>
Date: Fri, 14 Mar 2025 16:32:17 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_083220_427655_7B53B4C4 
X-CRM114-Status: UNSURE (   3.25  )
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

[1/1] clk: amlogic: a1: fix a typo
      https://github.com/BayLibre/clk-meson/commit/b3c221e752c4

Best regards,
--
Jerome


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
