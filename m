Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66BFEC2D0CD
	for <linux-amlogic@archiver.kernel.org>; Thu, 15 May 2025 13:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OUL9UYOKUMeOnB9gAnucl1pBNDxyiqFeWO45CaItch4=; b=W1pCa9H1bHFwmu
	ofYMiP6uFC1Wr2hgCBnce4z7hMUxnlK4GRKXJkATNYPAbkg4qBmQXBtI0dM8I7C8KVmMJzfcDrXnz
	cPbauqk8hiT3wBBEBdrIpNklaAQXl0blpAQ5H40qxYirOI7zG+cbb/INmgAXW2foR/jdxVyv1Wd2T
	XdOx+3aD6MWLvFfS+gHYxR7Pchit9n3ucAy6FvRTyrVHTVEz9iVgUvY7kZz8LKyYxuUU8UrqjH9tk
	5RxtrFpFViiNSqdsk+qOJcmtCHtflq2WAnlAx9gndLap7nXche3AWCpO5N0yl7lPS+wZzA3rYSAxw
	9jVEjbalGamz4axVxehg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFYHZ-00000000ftF-1m21;
	Thu, 15 May 2025 13:05:53 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFYB8-00000000ejw-0TYV
	for linux-amlogic@lists.infradead.org;
	Thu, 15 May 2025 12:59:16 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-43ce70f9afbso9684765e9.0
        for <linux-amlogic@lists.infradead.org>; Thu, 15 May 2025 05:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747313952; x=1747918752; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=93NSiG1e0zBMLdXcPRXVb1UoRXanauxq8sjT5bMUUhw=;
        b=XrI7VCWugmmaKkcZb5CQmiaSDxDNBFBxKUJZNKZvvd5z0/S1kAh9PLkdClBfl7nnOC
         lF+2f10lsyOofFvZLGMc27UIDPUTc/RDWuuOiZpq5BxyMFW2arC7xe4FT78/5Gtdla0m
         RPpJOmypprSMC235wgcYhnMfwjPircDF7y4pTN9VZiPYLSRBvCBFidq7hIivIcEWAezF
         GA9IgCOvL38ul0Irg9+BU+GZA9BM93JRm8dZX6b7d91cYzPiXgdxwo4wxCJIDfYe+d3p
         5yME2IOqNMi57FJj4F360ChQ5Vp0u0/sTCsMAIWhrJkZY2Ez0KQy5K0GA+Tp7I9UwJX1
         cXcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747313952; x=1747918752;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=93NSiG1e0zBMLdXcPRXVb1UoRXanauxq8sjT5bMUUhw=;
        b=In8MPJLmbdgYyvUGF31AJipzwmzhdvaKa0Tbv3ivcn5i8Jipb/CgDH5I4Kf73++N3G
         aebrurSN4E2SESK2iok4XDuZoUww/2h0xDVH6WwErwdaFRDtS2TE4F0wNU8Kak7v7RHW
         taw/6gIsATpgLn3rN+JaCDoPCxb8EUylGjq0TzDdcG9UBluo7pVxYIPRVSbzH8sHrGZ+
         LHJTI2+tFICD8yHcn61rjuxbZXpW49lS0H6oY4OjlgY52irnJhLwZPVVK7F1Ie2Ff3Me
         lJX9UnlNiC3QWlekYINCuGCLaUv8qaVydSodCWFHSe+1rBedUet0/A+mlnX7eujQUWww
         EqbA==
X-Forwarded-Encrypted: i=1; AJvYcCWhMiTvG7yqligrGMg7/0IWXpFj/2YcmvnXmRU1qz32DpKIW8iXLiiaPdHjHraktQ5Sqpjkk/gAO/OuiITE@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3qEj9teUShl7CkqU9W3eS/qZ/SUZIN9n2GxUlYlUU1AJDxhE2
	cOPV0pZvx/iP4IHwLJj/7ovSigdJoQQPkxY9+S/toYVs/ip83gxugDrDBZw+zBU=
X-Gm-Gg: ASbGnctFZkFezjGNxGDXgMn8LYXeZCUl7PtZxGClIvM9wyzMJNH0oiD9VikRq4RR8DQ
	cQ+6sk2ro5f8O8On89LxmOOeLZeLFXTJ1h8tf3Sq/Vo/CCzwsMcg0AcrmtN3/+p5xDJA9Pam7o1
	U50jdGg+aYavpaUCzNfdZyar6SBbInovdRsZ8Mqqr3qt5TEP82KEQsaj4wF9GQqk2eXM5W0Tphf
	QpneENKyf7oegVGTSuhJIKPsNJgnV4MQ4VVJHKteI2UsTneve01XvcTV6/VtuHT7C+uS8H5xcZH
	DUttpTFkr/9bq7b93ngV2eqc4IKP/Y5WpQqM1cjQmJFx68VpbZsjAKw164FGxaeyWg==
X-Google-Smtp-Source: AGHT+IHpy1rhqw987Tuz+RK9oDjiZ/Y3wtsR+06Hh2lLmeOPW+aVkSCgkOsbFAx/A5adDBQ/I/BpHA==
X-Received: by 2002:a05:600c:6612:b0:43d:878c:7c40 with SMTP id 5b1f17b1804b1-442f20e1abdmr92975295e9.10.1747313952121;
        Thu, 15 May 2025 05:59:12 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:82b8:c32f:4d8c:199e])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-442f39e8578sm71180475e9.29.2025.05.15.05.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 05:59:11 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Da Xue <da@libre.computer>
Cc: stable@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250512142617.2175291-1-da@libre.computer>
References: <20250512142617.2175291-1-da@libre.computer>
Subject: Re: [PATCH v3] clk: meson-g12a: add missing fclk_div2 to spicc
Message-Id: <174731395123.3761659.11544664862448009697.b4-ty@baylibre.com>
Date: Thu, 15 May 2025 14:59:11 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_055914_435160_1D44561B 
X-CRM114-Status: UNSURE (   3.70  )
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

[1/1] clk: meson-g12a: add missing fclk_div2 to spicc
      https://github.com/BayLibre/clk-meson/commit/daf004f87c35

Best regards,
--
Jerome


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
