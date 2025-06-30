Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93C98C7EE39
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Jun 2025 10:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f8v1AgWnBACN0jhNL7Mx4Y2S5loeVpjJzZ8NakxW7JM=; b=PLGTwxqIAnoDTt
	kooagou8y+ir8D4Ef/RqO9Qbl10T1wrZOHBpBraetmqNsIfdBWHOs95QFETSvePXbQ1gZGV//FLWw
	zulw0S11uQeufsfkGVsaQMJQTrnU/80dcgQ67VHONfm9aFUDng67UaQhuB/IoGEAsh9f8/cxxRPnz
	tv5Mrx+x53wrPOpgaoXHNJOcXrWYNAb6kZ2RU4hv4pPDxlcK92FfVHHjJT1coz//kQCq0T3R5oHuQ
	k0a8H6lxaGFqUaKI1EnXguEIa3O8LZljY73uM2bYYIRD32BWbAxpNQtphpcUzATxPTyuGnZY1cCvS
	tezUgswvn0N8PXJ83x5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWBSh-00000001qJx-0Du0;
	Mon, 30 Jun 2025 10:10:07 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWBJa-00000001oix-37iu
	for linux-amlogic@lists.infradead.org;
	Mon, 30 Jun 2025 10:00:44 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-453643020bdso37280335e9.1
        for <linux-amlogic@lists.infradead.org>; Mon, 30 Jun 2025 03:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751277639; x=1751882439; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XkT/Rstid8JISpjAt6SdqbTq9GQ5RgC+pCfbEEzIrEg=;
        b=kM+rooUo2zFvvDLKPr0e2CVkYAqFqqwo4uuLIb2EWYtPFyzR6D7mFGul+b1rBxwhG9
         ImViHKbbpE99fHpr9q8bP2DnCvGXFWk4KsdpMiPBI7pQHEkglL+gog+LcsKkYUKLarFm
         fuLf5l9vcvhIK+I4Qr9Fm63Uht6saqccRJcKhB/+HHsZKSRcP8pXg9dyzmA6Gk6t4jyt
         TJjGd+8rPliyewiT0BbhoGpr+EIi9EGU2qBfcm3exJYIfAQ+xerXmNj/ES7ekqW+LcDY
         He9GSMy+e1eFjwJA4hYg66pKW4bq4Vl3NPU9WP6OLwdLEWD3deg+upDZ9wfD2JBYgRSJ
         lqXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751277639; x=1751882439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XkT/Rstid8JISpjAt6SdqbTq9GQ5RgC+pCfbEEzIrEg=;
        b=dHJSKo9qdTT+rBpkj+TYTwZjyhjUqS+AKLfFIOEsi3wMlzm23bdaSJq5peuxsn4gdX
         0BjTioXw/2qcgLY6dHI6VtMfOhLqVO/tkAe0UxOKB2jWOgAUMV7+AwyrYM9DOT/dRxrC
         NCWeIIWjpTo96c1cH+wr76TP7FUPSUy9LB8sVYyq2SdIoMYDzve3a/awI11Qk5UP1813
         osrUdWtYwccZMEYCher5cEzAjyWUGIMjYqzUkivqeJXBOgQdLVybMF8AaLZn515prtg6
         0SFmKL3swRfrqFne9E6Mpc44rbBeytSsJRaUYveFaz+Ha2mTHOott3yNCnROIXP8eRrf
         CNAA==
X-Forwarded-Encrypted: i=1; AJvYcCV88vpsv82E3sezxDYlWf2jT9neEpF/2G8DgPu5xUTxWwuD26ii3fRuy22HyhyEDSrgK4zTtgM6P5vqDL9S@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8yJfBqLb9kRdN/rNy0XnwMzP76av2+VbhRaX/mMre0Zhh9Nxb
	LAsmGFf7dgMX53CSuZFZnW/neXvlwDN1BMs7oHpkXb0ZCXzV0pDqzJ7UHISIozzmlOM=
X-Gm-Gg: ASbGncsM+WGCK5xgDHq7+6k933O1Zy6yiuphXBM8wrz7o829cRE6ZdBrOoLzGcXg2hW
	5bdj0t3Leq8hijaNtYqR/cIrKUTAW50cbtaBXaj9/TmJO+ynAb+dKEa5kN+5Zrc2WnnA2cVg6I/
	TCHgHD9w6WpsrL7RBqngwwln4i7ODgjINT83FNuDMvI6Hq1iDR8xuRTt5CeRVSXrBS0eF3WwcZX
	I7b643cNqtsaIlTm77uyiJji2h4Dved4or+dB5TlqHqKwusmUH/nNBz/gGeN44WJNUa/lzZGXG8
	A38UFTdHtPh+HxSfrnmMF+yEjawS/y7EPcJhu7bhHbE2feThj/B67rag/2L87A==
X-Google-Smtp-Source: AGHT+IGr8kDpio/yTc2q7sbJPgt53a5XcrIQFYk6F8xhvZP/fdYVNcvrjEwO9kaxLpdzOyi51LJFFw==
X-Received: by 2002:a5d:584a:0:b0:3a4:e844:745d with SMTP id ffacd0b85a97d-3a90be8d151mr11063926f8f.56.1751277639515;
        Mon, 30 Jun 2025 03:00:39 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:279:fce:4bb7:6daa])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a892e52bbfsm10076002f8f.65.2025.06.30.03.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 03:00:38 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] clk: amlogic: remove unnecessary headers
Date: Mon, 30 Jun 2025 12:00:16 +0200
Message-ID: <175127759469.367173.10851786033226658116.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250623-clk-meson-no-headers-v1-1-468161a7279e@baylibre.com>
References: <20250623-clk-meson-no-headers-v1-1-468161a7279e@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_030042_779723_5B89D9F9 
X-CRM114-Status: UNSURE (   4.78  )
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

[1/1] clk: amlogic: remove unnecessary headers
      https://github.com/BayLibre/clk-meson/commit/328d4a7eb073

Best regards,
--
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
