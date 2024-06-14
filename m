Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CBF8C27C79
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Jun 2024 08:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f+YaQoYLXj4FOMQ6NTyl+jGdSjCbFHHhtY61b/RuHHU=; b=B8UthL/ca0kmvQ
	QFE62WHyVTp4wQ+LshhJCEpdP6uN5idyMZ+7KCBlglQD0jmQxx7kLZmZeuwa098iKaxhtpCqIDFlg
	DlD8htj/pVfmBUP4MWPszSjz9NuZ3pyjvdVcxH0MlcE/N3OpR7sbGjnynKVwhmqVKMNu6mXgjUjM6
	xrDEqydw3TiBk5zkjA6j7RACAnZ0ZN3VYU7oXbt6yEJGd+JkpevuNifDC4IXjUg5VxjBH3oMb4/sn
	pHuj19En7qqnpJAPgbhr2t5pqfmBDD9eVPT4o1ESzntgqZi5rhzJL1Rw3pPAFHE+8ZlFk6eAXbyQn
	GavUVodhIvN9bS8nLI+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI2lf-0000000264P-0HLt;
	Fri, 14 Jun 2024 08:58:43 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI2lb-0000000262p-0DBZ
	for linux-amlogic@lists.infradead.org;
	Fri, 14 Jun 2024 08:58:41 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-35dc1d8867eso1683158f8f.0
        for <linux-amlogic@lists.infradead.org>; Fri, 14 Jun 2024 01:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718355517; x=1718960317; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZdYyUMalkTDxkfe8DhCeZo415hoYlYCOiWfh55zkm74=;
        b=SzeldSr4kLRAXmyDQmEb39Nc6rP8tQImcJLT8X4+TwkMlfXNP9zhPRRt9DNXIyl5Du
         m0W/OwUasm4X5jScp0hMJcqMaICdWbV1MQbmu2GxBNua92Kj9vuKM952tioFtNRbJdIJ
         h4B1EqIlVAGdXQNrHBjKcFMwtQuei7edcOEgXKp5nsYUSIfqqbvc5uaJehkMousLCODP
         Ld/qKVvB/Y3YqRGpx+BK1z1jDT+A/0CAzC7R6H4KRCGDyyqFhpZVOT1wyHH7GTwt9SdP
         F7MmTnyGyL41JZkJFzsuSLGJ5O7hiaTKVSy5gIOUCbYxqmwkAITAt+BvjsAkVByKcNjC
         hfuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718355517; x=1718960317;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZdYyUMalkTDxkfe8DhCeZo415hoYlYCOiWfh55zkm74=;
        b=MUK45Or/Xe4xywQLurNvSTe23LAGaDtyRohWczvkfaK44yifcQfxxvQPDGu2r50nsD
         8hzcMdO2RLq/093gIxyslHm0ym/I1RVEl+Cd5pcbZYAmojcVP81/059O+qeGL5f9aMJo
         CiKasi3ba6Hj6qWv/Wjbdzrr3Dzt0evypCRnYdlXCBwqeEBxgROlh0z5eDnb1LBK5+6i
         5YC++fUMRJ5POkyd5LJ2+FM1bHqjfULMRGAUV3LdySxCdofWKu8Qim7Bn4ycKTdY4y7H
         /S2Lgewr7f0cWeZxg0kVCOyaQC3MZzSvJkVEX5xqek16YqabfdqPNvSWZmRF8KrQMSTD
         fREQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLgy54mOl1+4lWL94tRuoF3RzFXU/rM1VSMHjpqaj3q8ufRtA5q9CiXmYu468vbPFJ45F+DbVNiTFN2kvalWbMGHDSst7QHzOybwN4Mo3rznw=
X-Gm-Message-State: AOJu0YwuoWpEETaJ1s45T8c7tb5yOT2TdMqDk1EBK90UnYv658/FvhIp
	vqZE2YKzJABZB3DdFQM2+kzWySJ4ENeR2AMURjm0bECCahhf8JXlFRfCEsY08V8=
X-Google-Smtp-Source: AGHT+IGM9Wi7J+z+MS6fiYn0dNhK3jifJCaU6+orZ5nbibQS0YySF3uGnRU/B+esBgM56A84wA1law==
X-Received: by 2002:adf:dd8d:0:b0:35f:28fc:98eb with SMTP id ffacd0b85a97d-3607a764b54mr1322002f8f.18.1718355516988;
        Fri, 14 Jun 2024 01:58:36 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:d811:babc:4f8c:772b])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-36075c6fa4esm3632562f8f.67.2024.06.14.01.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 01:58:36 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240611133512.341817-1-jbrunet@baylibre.com>
References: <20240611133512.341817-1-jbrunet@baylibre.com>
Subject: Re: [PATCH] clk: meson: add missing MODULE_DESCRIPTION() macros
Message-Id: <171835551618.663007.10385411290888790860.b4-ty@baylibre.com>
Date: Fri, 14 Jun 2024 10:58:36 +0200
MIME-Version: 1.0
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240614_015839_123232_6BE229B2 
X-CRM114-Status: UNSURE (   3.16  )
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

[1/1] clk: meson: add missing MODULE_DESCRIPTION() macros
      https://github.com/BayLibre/clk-meson/commit/befe87380e21

Best regards,
--
Jerome


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
