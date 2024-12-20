Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 687A2E77188
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Dec 2024 14:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dPym4y8+KyjmCibxGaqADOFC7rfww5M+bnKsap2cr+s=; b=QHu2wVV/37qwn1
	kjZMe4+LLZob6wzO+9FKAzw3o6MU6p1YuWQS5UbUZ0uHZsTInbxBeGqx45v8rc3a68SaOWr9gdZXo
	NmqcSmc1lOxJ4sgAGlQVCnaQgRyFmaqBjYQVOiOEQYAZfSd0a3gH/WyLEXv3G/jMiQc/jYnAOMZ7Z
	b4zLnk05YsI4wecukqHx45PavKWx0XkiRxHx2hxchvnz02114iWU31OckaZoeOHJ6ttflDCCAkrT0
	1nbobiG0X9xaS1Tve6CXnhWBFLR9NhlzRIRVkrPc6JCNOy1x38RMK85oRDLr9Rj2idDKJBT1aqmHo
	O2NYSmXrJE2HAMgjPwxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOdly-0000000572G-0taX;
	Fri, 20 Dec 2024 14:14:34 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOdg2-0000000565y-4B9N
	for linux-amlogic@lists.infradead.org;
	Fri, 20 Dec 2024 14:08:29 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-386329da1d9so982253f8f.1
        for <linux-amlogic@lists.infradead.org>; Fri, 20 Dec 2024 06:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1734703705; x=1735308505; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p2OQDSxlIjkv6IYB32QqjLNdXWxA9l5+c++JHu/xF9o=;
        b=du1OCQZ7axvr0Kb/Yfvm4p0b6PRBsLzGJytInemtca96IA6e01L85h9rUHzPICSeaq
         lwZiwhjjdcIcqq7r66wjjnwPDPss04ZTW5i3vawfxr1C3mZsPVGO6G1qTWGhsGkr3I2a
         01vicqfWVOobjY5eia2W/AwXDHHBg6MkiTlp6jRPxsUtvEw6pcu0ZTNdkcwyHSKLqgde
         JQekyBk8QVaL3zvxo+nDIkHyo3Wycaqm4qB34yKJeH8fGjKKIb+kYxxf05n19K6toKSG
         /PhD7BGhOdfToSH2IYIB2wtsfAomraDWqrqgfjL0sYBGyYMfj9/XUTtSNFkTc4p7a5Jo
         2Xng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734703705; x=1735308505;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p2OQDSxlIjkv6IYB32QqjLNdXWxA9l5+c++JHu/xF9o=;
        b=OxnT2j9P5JNSZfHFDbyvOeNWtlyCsj7a1kzJArUIFJwHhwzYD99P5+wv90eHfH8jkc
         weYbNcpdpIfVVmJBAFpGJmsTQ65T/b6vDRwmZ8PEAy43z0d5fewbxOA1sjIKKtMxMTpL
         r3jl//uNOgsaC65yY2FOV1mphOKYSDbzIuCqBwrQn9qE2oHBeBMyR2bf34BLAWVZaDGk
         BhMLFimYBXG2Q7vB6l+OxcDRogvCiZZU9dg6IREK3IjaOtUM8nxFNP6zf+zP79oTF6Dy
         w7mAfjqVHU1JJFzUSyfz6PA0Ygxa3JBtgvHNRkwuPNK2ScRjYYqrMhtFcMXrcOv5wTTX
         yUZA==
X-Gm-Message-State: AOJu0YyXGiyVc42/nDQoI31Hn63HcYWgx4VQCK+b9bjhDTOAY5pCI0IM
	OTixEXCyP7smQEzWJ8xIdoM0WFBuM4zLd2IPH9Q6VEck7R0b+xGo+JM4xkntZLA=
X-Gm-Gg: ASbGncuolaEhlr6qWuXQlGq720wSwuPLrmM6+vI3lZc7u9B51hoDvh97dlQomwnk4Fa
	QEdMq1vKKvMAd/3xw926nYeNIgQe7Ec3qrGREQ9GBpaIRFiwXUcE5z0WrGHCuKPz4Q9FKceTS6L
	ruEKa9KH0HubOLK1R+YII4oKpi/4LFl1mlg5RhEDN22Fy43BWfSyNg+GKrYU1Y8slRBjCNlzh5d
	Fqvu1vJSyM3gtTACn032aeJ/KRTOfSaf9ZYKqcay+dxLSbTqrGVUm4Xuym85xgb2zl+/OE=
X-Google-Smtp-Source: AGHT+IHaVoo3sOmtyWzw4UW+4I/j953uzAjZoTRNej1wZU+3u9kyNjoPkTcRqItKHRuM4B6rwHxI9A==
X-Received: by 2002:a05:6000:1fa5:b0:385:ed16:c91 with SMTP id ffacd0b85a97d-38a221faf85mr2931306f8f.24.1734703704952;
        Fri, 20 Dec 2024 06:08:24 -0800 (PST)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:c000:46df:1e3e:983f])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38a1c84722dsm4148880f8f.53.2024.12.20.06.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 06:08:24 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20241220-amlogic-clk-gxbb-32k-fixes-v1-0-baca56ecf2db@baylibre.com>
References: <20241220-amlogic-clk-gxbb-32k-fixes-v1-0-baca56ecf2db@baylibre.com>
Subject: Re: [PATCH 0/2] clk: amlogic: gxbb: 32k clock fixes
Message-Id: <173470370410.3067219.1883604095856278984.b4-ty@baylibre.com>
Date: Fri, 20 Dec 2024 15:08:24 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_060827_256171_6539FA44 
X-CRM114-Status: UNSURE (   3.11  )
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

[1/2] clk: amlogic: gxbb: drop incorrect flag on 32k clock
      https://github.com/BayLibre/clk-meson/commit/66eff51d972c
[2/2] clk: amlogic: gxbb: drop non existing 32k clock parent
      https://github.com/BayLibre/clk-meson/commit/1e1fd26ed4ca

Best regards,
--
Jerome


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
