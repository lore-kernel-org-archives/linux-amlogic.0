Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0927CC47BF2
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Jan 2026 14:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ow66FSHLUq488ueJI/B12NXFANcbPD/Ga8bovFhyOQg=; b=sv0fKQGudQlILp
	oLQKiemdaBFd6fYm3jMbQBDeuWyYY0C1L1nuXQWgSuaebWaiItfBQ/XTFKhaHkBSi/LV6DPiMLLu7
	fcL5HszotlPcaoKXKpUEhNzNlKYa45z8Euhk3LORfdjF4BSZr2YByep/VFMlv1KRHubVoQSl6iso+
	GInXxis6UfLbV+EP/a07V7EtC3npsohVMFEoaQiWuRZ2nXXuzqS2D2AKocnGhPiPEIMP/Qq1MqGQR
	EVdmRvVoYoXtjejPNzObAiVvlM14qqLD5Y7TYqMSZwd3esNa+i+4uUHo7FVuBYUuajIvvSLXpEPN/
	khKCjGkNkkjhokow66hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd7tX-0000000DGhq-1Ir9;
	Tue, 06 Jan 2026 14:18:47 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd7tT-0000000DGgI-2UaM
	for linux-amlogic@lists.infradead.org;
	Tue, 06 Jan 2026 14:18:46 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-477a2ab455fso9642525e9.3
        for <linux-amlogic@lists.infradead.org>; Tue, 06 Jan 2026 06:18:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1767709120; x=1768313920; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PDyomPMwSX0nUznUeSpIGPTPKXqo/Pa069JTwjCcRpo=;
        b=Is7VFiU++Zf3zYDfgqdwVVlkFZkNDf3SmgTn69oKBstcrsrQ8bLzBI4dfsqJCCTOR7
         dUFFGajW9NVC2QNjnktM/kWbvt/iAhAUN9eNGr9zmlQ0lAOnaE3AhUCCrB+f3kvrv16a
         +F8QCXl6MFmBPlxNrX+N7yp17UdOPh+54/pX5MGmO88CtQkQzz9HzE1slOaI7GdHma/E
         DODiwt2SWKGGrkzJ02MvwqQtFn6xARZL4LaGDee/BcG1O5jLR9QcOpQYEE2cK1M8yyDK
         +IwA7sSfOUrKHMXrvCFtsAH+eWZsYfMqkWlDjQYu7sQwPLSbxw7vIJI5ILD615ftz6bl
         M8BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767709120; x=1768313920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PDyomPMwSX0nUznUeSpIGPTPKXqo/Pa069JTwjCcRpo=;
        b=nBlggakktY6Iv4PdcCsp/5GWErrm3FXYCuJnfzNGAZH+uiIhdSnYF6hDlAYlmgeXSL
         fLwbBEaT7lkjVJAbB4H4Rg7CXRcwDVzDfv6ZbrPfac0rhmSp/X3ige+/tLvee3xzzFJw
         89QphDHxfNN4qdm8TQDRp21Ros4q2HbI5aDuJUtnTpOUJeuTlN3hF+UJjTuoKQBeRdDj
         ag0dpCLbNNtdMSAEHv3Z5GqDY7cxnjrQUyG10BouXIxg3YpVmCCdcGKtQpfSRERUSH18
         Bqz1eW7LKl9jO+jkXfgCtRsb5pjJv+ZkICBgQiwD5BjrT4hzPaZH1BsC/axgX426UsQi
         +muw==
X-Gm-Message-State: AOJu0YwX9jUMe4zw07a+r3wMD9TDK7TIXNtUXw5CDX5w/Gwwvoc7WUYg
	/UpqIrn/hrswkjKj4Uv4q/Ro+NuTnIiPfgT8N0oFhgIqJDFCf1xVG/VxkIwa92/KMnLngzdowyF
	WMdAW
X-Gm-Gg: AY/fxX79iJ/HAeJZLmI6JxLQN1oEh+88JVbvfNYGvLFGodI4IK7P0XVUDWPS8HRz9U1
	p8mNhTEWC19lg5KP5Qc88I7pH4cQubqqOHzDwBsefddNMUiKQPf0/1sx3AzjslXO+4HPSm5j9fo
	kk5nm1P4xvfLydzOjrr2OvhsS1g63YtzPijxx36PyrWddQvPK/9ZJscMrwuTWUSspbr14cT8GIM
	j1u4YlpT0GjRx5oirYMGOOWz4daGqFTwvQabf47dYhzpvkbTQJqJShdCrgvMNx+3rX91/op7m6r
	Nqgef6UWctnqgdM91Fl7YtG5h/xVdzA09ZPBHnwx2KNNpKiQiNPXkLWOym9Kog+W/I9KYjUfaI/
	IMRLDJBdGSuf7rd1aV+jfzxkciDuT56weOinnuH9da8AXBYHJIOVA9C1tylar5vEeOVfkpn3Olv
	i4TIp/dn9n3sMX5Vqo4qkq
X-Google-Smtp-Source: AGHT+IG4RoI4YqTRfLqMtHqERY+dKFavuI8R+zT2rhNFCJf6Ipd0EyH0ZjVfMEfxdwK/NE7/Y+RH/w==
X-Received: by 2002:a05:600c:1d8c:b0:46e:4b79:551 with SMTP id 5b1f17b1804b1-47d7f0a324emr36773525e9.31.1767709120058;
        Tue, 06 Jan 2026 06:18:40 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:e488:b673:7409:68d0])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-47d7f7035f2sm43558785e9.12.2026.01.06.06.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 06:18:39 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: linux-amlogic@lists.infradead.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jian.hu@amlogic.com
Subject: Re: [PATCH v1 0/3] clk: meson: small fixes for HDMI PLL OD
Date: Tue,  6 Jan 2026 15:18:23 +0100
Message-ID: <176770907988.1004563.13571465521875416136.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260105204710.447779-1-martin.blumenstingl@googlemail.com>
References: <20260105204710.447779-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_061843_882391_AF6549FF 
X-CRM114-Status: UNSURE (   5.43  )
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

[1/3] clk: meson: gxbb: Limit the HDMI PLL OD to /4 on GXL/GXM SoCs
      https://github.com/BayLibre/clk-meson/commit/5b1a43950fd3
[2/3] clk: meson: g12a: Limit the HDMI PLL OD to /4
      https://github.com/BayLibre/clk-meson/commit/7aa6c24697ef
[3/3] clk: meson: gxbb: use the existing HHI_HDMI_PLL_CNTL3 macro
      https://github.com/BayLibre/clk-meson/commit/2fe1ef40b58c

Best regards,
--
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
