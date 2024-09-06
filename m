Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C903ACE7AB8
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Sep 2024 07:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G9hdl2+ro3jKIxHKhHfLMsmxgUZkZc6lKM+Dnvr8TLw=; b=EWl23BknN78og2
	b4/xON9p54ZwxYDnpTbVfCzCKY1C3VTNQ5fmGT+KQdzZbLD5SQs9+LRn+9sTZnGQ7G7xBKHocs+i6
	qztzP+p19atkL04+2N6rfIpXJ3hY42eKn377YfQyieEjL13vPqPzxjzDLP53YlTD3nZF0GOQwLvWg
	ChI60hGtxgk88wkuJU1R8PabzWXBDodYTy9wRfVS5UQ9SFUVsEuIyBWhs+9BKmG5L0DWBwHPcLdrj
	rtuNFvpA5jIszVJa8/mua01XUAP2YBmzdVwCj41usBVFdtLFDAHE1TWOZqk6+gqJsjtDOwFYWCsgU
	Z5MPfVd9cJB/7X2/2FxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smTP8-0000000B5BC-0FN0;
	Fri, 06 Sep 2024 07:29:14 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smT7l-0000000B2Bm-1tk8
	for linux-amlogic@lists.infradead.org;
	Fri, 06 Sep 2024 07:11:19 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-42bb8cf8abeso12506955e9.2
        for <linux-amlogic@lists.infradead.org>; Fri, 06 Sep 2024 00:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725606676; x=1726211476; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mBb1m70RMv6UJKegzoNSHZhoQzpn0mL5Ktd2C9pGgiA=;
        b=yGFFwFXtCjCILp1JCo7IiA4wnRV54rIZ2w1gBd1ugUrso2XFwlXl2qgCJta747OzwC
         JRKvAx1k9w1Xtgnc9lcPiGd/rOXMrtL//w8xdbM2Tqw5aRx44B5xGWX1+AH5zjRmWJIJ
         9FGaaMyG5U3Q0vVhFOs61cbhKT55O5f24XgzK9L3mmG1VECHJ9eLEqtjMmMEIH1TpF60
         N0DzkFWMmsGv7ADM+iC6Jx1yI1FRNyfCXMVYKTsHr6KYaufRxKDVnX8rN5EuAmBa+o8w
         CGx8LNOpPdYCD7JCEU3fniFCxoJgczadTe3X65NIpTf7Tfj6GUfTVDrjDv6nu9/XYFXv
         lCiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725606676; x=1726211476;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mBb1m70RMv6UJKegzoNSHZhoQzpn0mL5Ktd2C9pGgiA=;
        b=PquwTg4xaSmGz6wWFrcgzOnPNhV9pppawnYiGp5pdV3OR7yHksyzRed9hIraFKNABY
         ztW6XJc8UkmXrO/lgGZdmPuVCnTeleg9loUxJ1LkkOmsbOURZqXhxids4243O6TltWbQ
         FuiiA1scJt2y7XFzpgdY8Nc7yVC1dy0LXq3A59LM2gYzyeK22ORC/WwaT0vLoAiJBmq8
         +GnTwMjHrYvSa5Hd0uC1onhLprVxPu66iu2YcSsgcDQoI5itzevJZ4FRnaUtbP9FZqxv
         FMoiutCZ2bAqWgW2HXut/zCmg400+EQRZPnurkvVsQ+uzyA5AMNxOf5GgQNPTJDp1P3A
         m+ew==
X-Gm-Message-State: AOJu0Ywp92X20zb4xZzcGkTgkwCWlrHzQsD/liMLB0kfBa+mQse7ZiEi
	XevfI2Tlzh4It43FX003v3IhQOtgm8XetPnjByDnzzt4kFbY+FBVaQ6Ye7DKbP8=
X-Google-Smtp-Source: AGHT+IEqdAHSLSbZ7AHGnt96PMoqalKMoCEpht5Cea7Y/2LmhbcK43F8Fn45vpBv/QCzJQC9a1kDYw==
X-Received: by 2002:a05:600c:154c:b0:426:5416:67de with SMTP id 5b1f17b1804b1-42c9f9d7059mr9170495e9.30.1725606675422;
        Fri, 06 Sep 2024 00:11:15 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:4e33:801c:cee0:ee57])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-374ca94e002sm12596485f8f.72.2024.09.06.00.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2024 00:11:15 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Chuan Liu <chuan.liu@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240906-fix_clk-v1-0-2977ef0d72e7@amlogic.com>
References: <20240906-fix_clk-v1-0-2977ef0d72e7@amlogic.com>
Subject: Re: (subset) [PATCH 0/4] clk: meson: Fix an issue with inaccurate
 hifi_pll frequency
Message-Id: <172560667467.2965402.16362697378487101558.b4-ty@baylibre.com>
Date: Fri, 06 Sep 2024 09:11:14 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_001117_562128_BD14ACE8 
X-CRM114-Status: UNSURE (   3.95  )
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

[3/4] clk: meson: s4: pll: hifi_pll support fractional multiplier
      https://github.com/BayLibre/clk-meson/commit/80344f4c1a1e

Best regards,
--
Jerome


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
