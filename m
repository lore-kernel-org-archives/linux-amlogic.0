Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B3D0C25B76
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Jun 2024 13:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WI5d9gPAWWc09e7LAV2vi7tcLMBCF1xplA3KZ/7d5i0=; b=iFYypIUxxtqREv
	OzTfhQtBOYL+TIsO/S/Gd1MQ1Aqv3BlAleieExbSEXWf5/fT36yGMLkIQ1Bs1whPL4B8hhUNVuHdz
	zaL8cLxA2ziCuxVic3hULcJxlCElt8wQAMW386XpYETtpa5kshf8YjkIIEzlqoNWvl36FpidCSApy
	t0NeBtsWIe7yppM7RkhL7WbH0mZ9aTi3191ciE+7YiFfht3vN/IcOXC7ZpmMRgcQKucNfU5V3M+T4
	k4XpHquLYUfnGPW4eX9sASlxJRLhoE/xENG14asA6zq2sP8OTEJmWYJX0LXGGvD/FkWKLnR3ld1zQ
	amOvg2FpwS7rByLiBAlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE7gi-0000000GtMo-24mN;
	Mon, 03 Jun 2024 13:25:24 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE7ge-0000000GtLg-25e3
	for linux-amlogic@lists.infradead.org;
	Mon, 03 Jun 2024 13:25:23 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4212e341818so27163195e9.2
        for <linux-amlogic@lists.infradead.org>; Mon, 03 Jun 2024 06:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1717421117; x=1718025917; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2P2nwrZKdBj15mvgcJuR9vi5zzVRhf+Cue2wFYJyTjI=;
        b=1DQcWRK+W43liNjuA9a0g+HGKqbN3uPguVMJw2g4Aczvj6ESkGEgDgCt6nArp1Wz+p
         BM1QU/o28zI4p4flmgv0W0K6HYoxPJgMQ3Mw2loY2FPkRYdRvwSBWIuGiNI+brZAuyQC
         0NvTE9NMNZvOM4J99wWctSBAwfOmzXeMl3Q8GhdTKtAHjxbgjXhoxHb6uNsdebwx0KXQ
         IzYiEOdmTfCmwaU0E360kbV4rCZiz6W6m3nXLf8vSA7Jzrq0cR7cmZn2qj18xwGVsnKF
         CyqdUhoEYsMP/YqUJaqfco6EG+djF759THJcpIlGmY0QVdeJ6ayiFa2wRU46Kz+4uh6i
         yFfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717421117; x=1718025917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2P2nwrZKdBj15mvgcJuR9vi5zzVRhf+Cue2wFYJyTjI=;
        b=jS0tSU+Ydk5xnu0cr1ru9ViNayc7oPvRlQlnu/saQzLdONoOjh0AXFu2KrrirnbfMh
         MM5YxsCu90lOP/9G/7WA9tunO3IMqwdp354MTsXroKzEx9E2pg+gbqXEjlLYgEdlLvak
         /Bt0M8TS56YvBiGvv98e4fi6ovGOCnzzeasKo8iskGZ7E45t4t+kzgbxdM3N1f76NkE5
         2CIB9qvO5P7Hv57VZIOqnL72jqBjGanPippKklYkJUoPcfji5kW2gsc0FDlkbytukfqY
         jyHYpBtFjN4jrY6dl505oar0BGPXsYYNr0Z7yoL1RkvaIVQ7UegXSEvQFiWOHtaJAHIV
         dHig==
X-Forwarded-Encrypted: i=1; AJvYcCUv+9L03tO4c5BHylUKxYMm2S7zKQAZu3x7It5q+hjbltzC89p/F2tg+BvO3JJKSck75USN3VucTUHmE0LJAAcx7XR5HAz8MMh+LhTZ9FSMZpQ=
X-Gm-Message-State: AOJu0YxWCjfsmjP3BMl7lgTdSulU97vwe/lKSIBHHMmN9lEfte8BswNp
	zPjGtCL49KzYHkiaIYTsD5a7TKt7F4YM2MlPccjIQur4JwKmjza0IM09aLfGG/w=
X-Google-Smtp-Source: AGHT+IHCoCO6DEuGsOccYDm5/ZkSHsUmm7OTMtTgMzLzeaEljHePUFoXDVgzjeY4+rVjXEay5zGTQA==
X-Received: by 2002:a05:600c:4595:b0:41c:97e:2100 with SMTP id 5b1f17b1804b1-4212e045524mr72536285e9.3.1717421117078;
        Mon, 03 Jun 2024 06:25:17 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:638a:e591:7142:7b85])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4212b84de44sm117381195e9.11.2024.06.03.06.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 06:25:16 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Jan Dakinevich <jan.dakinevich@salutedevices.com>,
	Alexander Stein <alexander.stein@mailbox.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH v2] dt-bindings: clock: meson: Convert axg-audio-clkc to YAML format
Date: Mon,  3 Jun 2024 15:24:44 +0200
Message-ID: <171742077914.140081.9416853265361727678.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240513224552.800153-1-jan.dakinevich@salutedevices.com>
References: <20240513224552.800153-1-jan.dakinevich@salutedevices.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_062520_652317_0EFB8830 
X-CRM114-Status: UNSURE (   4.68  )
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

[1/1] dt-bindings: clock: meson: Convert axg-audio-clkc to YAML format
      https://github.com/BayLibre/clk-meson/commit/23dc5f7e181a

Best regards,
--
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
