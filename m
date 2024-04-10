Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5EECCD1296
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Apr 2024 08:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TGH8DNDivr/arzZjklsKKDvu1CxE2H3cxIcvh33J2tg=; b=20AUJ66lMRV5zY
	5ta/TKginyNY4RybwPCmEzuw6odDFjK+iD+/JIXlygvfet6C/fpvmCCc7A+/cuTsZ5CePAJtf2gbX
	8LANbYirhd3yEix2MrNYXpdBgMDUY2m3y64hVeCSwcthBq004wJFCMO/vu45v0z9OGsAJghDZjwoX
	GwFbo6VqQc3XIXSjeSmrAtAaS6xfLntTlhgOcfgYvJ34/5KitgyiDBxflyh6PAwFJL5cU8boTBrcE
	Md5Yrqg1KCpdSjks/2xIuoztyHdNihvUSLk5HuPpIrHd9k+9T04IEofnDCtnx9ULMNYu3KiCNbw3/
	DBzxDu8wrcD4n84EZ3Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruTZf-00000005wVB-1Nq9;
	Wed, 10 Apr 2024 08:44:55 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruTZU-00000005wLB-2fJD
	for linux-amlogic@lists.infradead.org;
	Wed, 10 Apr 2024 08:44:46 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-516d6e23253so5176297e87.1
        for <linux-amlogic@lists.infradead.org>; Wed, 10 Apr 2024 01:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712738676; x=1713343476; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tL/hejvPD3PbqYhLtjIKj09ojZVksO+lKOONb6rjF+Y=;
        b=qAAcVQifZKFvO6XBj/eP2z5c+C4uI5PqimnZwc/BsDATU/H/HYOECo/O2EzwSF4wes
         d3kzUAxTSStq47MDn8Qju4FfMoeAKg7FWWjJdvQ/RjaZ1dAg+dLmC7lWM4ojBJtWHZr8
         MCPTrgYAxLuAtbNnQavsMC+iywmDEkC0+Gay8wOA5YRdlYdJa6+3oljkNcScQVUayROZ
         auYksJ1G+vCXxfTQXKj9GEnVEjOS7QlEj+d7GOMu8xfdkOkqtIzfWm0FNFzo0AUD2fck
         Et498zMn8U/UxhuHdrqwlvslAg27/fct5391g1g8W2xERieJCYeYI9MplRYo+TsrHWux
         VE0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712738676; x=1713343476;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tL/hejvPD3PbqYhLtjIKj09ojZVksO+lKOONb6rjF+Y=;
        b=fVN8K1Mlb46Xx62xZZPCJbbivVP+lc7wB+sdrngaMYVncA35k7trEtFjRM36R2yxXQ
         9OdfpDKI3WwJZ/fvoUwfg1/VAK3prPywKtvKipBHmRjChq22AQV6AgyuSpskRXGot2bb
         1GhHEqeNkVq3jCSpaNdLLogqEQvygIWCEb7toVza0d9EntsjIXijgDt297+eIjQKxMb0
         XU57mlAxyGYDa97qFeqej5D1T2PlCmlq13Q9Ubqe1CoBods+ZX5ZTfW7oU7aiKbjOPs8
         xI4cVkL6swBAculN0tvCk7Tero1S/+4w2BEWkVVZxhzgXf96YXH6RGtbJsZPCFm9sNmU
         QNEw==
X-Gm-Message-State: AOJu0YwAlxUfQ+9pExPGulgxftV4IAO7uKB4YQ0pv5S7A3RM+SSitLHC
	a68my2uv9t8sSXnwsf5zqVobC0nHb4eH0b4bw1cmaIGtav9CyobRtj6dQMXOggE=
X-Google-Smtp-Source: AGHT+IF0JtJINjE07BONPobTqgkLaueGpS6HMGL8AwC9YGgwC7b9srjrGwJa1zSxM101ClsmVsldRA==
X-Received: by 2002:a19:751a:0:b0:513:c757:33d9 with SMTP id y26-20020a19751a000000b00513c75733d9mr1507262lfe.53.1712738676249;
        Wed, 10 Apr 2024 01:44:36 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:49de:129e:d25e:c803])
        by smtp.googlemail.com with ESMTPSA id t1-20020a05600c41c100b00416b5e6d75dsm2066078wmh.1.2024.04.10.01.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 01:44:35 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240408-amlogic-v6-9-upstream-fix-clk-module-license-v1-1-366ddc0f3db9@linaro.org>
References: <20240408-amlogic-v6-9-upstream-fix-clk-module-license-v1-1-366ddc0f3db9@linaro.org>
Subject: Re: [PATCH] clk: meson: fix module license to GPL only
Message-Id: <171273867547.2243434.4736877056369076935.b4-ty@baylibre.com>
Date: Wed, 10 Apr 2024 10:44:35 +0200
MIME-Version: 1.0
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_014444_851488_B39EC7FD 
X-CRM114-Status: UNSURE (   3.64  )
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

Applied to clk-meson (v6.10/drivers), thanks!

[1/1] clk: meson: fix module license to GPL only
      https://github.com/BayLibre/clk-meson/commit/e0892cb47351

Best regards,
--
Jerome


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
