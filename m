Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2968EC54788
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Feb 2024 22:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x1BjlUXQ+X9pFi7QwN+LfURQtp2egzr0vn9WRFEnzdM=; b=DNBsvDY7hopRms
	sw1uhTFptRVrOwb60Jepd2i3L8ctAmSJ8ETawR0/2IveB94IhJ6RYpP+pGmjQbW8hLhZJkJTtHOe2
	FMCWIS1UU4OfwdOUi0rf3mlv5hCxFFGLNEnDW+dHdZpHoB9ZObAAqKegzsv44ROTauYtOzFhcuqBw
	lLAm2fYpUfrOFhNNZovICXhr5rtnwLV4JKt8ZrB98sFmsNYPxx38oXvfWVcTikHE095+IFQDMD/hr
	S+kap78Sx3LbU0HcD0l2Juk19wE6gRZ+cRcMPiTMQi/wjz6KoeNwdqGwMzOsRNLrDfAoV8DGVa6DU
	w8+2kR2U303x3WEMiP/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcukb-00000002kgF-1fO2;
	Wed, 21 Feb 2024 22:07:37 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcukZ-00000002kdP-1c2g
	for linux-amlogic@lists.infradead.org;
	Wed, 21 Feb 2024 22:07:36 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-6083dc087b3so37634947b3.0
        for <linux-amlogic@lists.infradead.org>; Wed, 21 Feb 2024 14:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708553242; x=1709158042; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1cIdAj9Rc9YrdEZf80SuI9gbBcjMeYE4blz3NlBPNkk=;
        b=ShOH+i9VvWiBCSwGmXJeYdc5HZfdesLRn2b0k0Uoj97VM6W+UiCL66SpGAsvUVjrqL
         0km+RQlmz4tBAR/fg9iQ7s7qv8j7GcQuPMFbddZ1M5i9dLnrp/BONo7nkzE1UeERqMKh
         EZkKJbHiD6jYZf2vEObKn2FZhlCjXSZIet1MLLqlbNoeo9yE5rqCNrfPhTQ5mzAQ4DBp
         Yv5KM7vY03yKJ+4TbMy2Fu4U1tAQOlAuL7w4GbcBAwZ3SbTVMJJbK+a5KQoHk4QJCE5M
         tPg3l30FnwTWZHC5F83/R1INaiQamCbgVqVCN15hvKxT6Y8cYZ/8h5/PSoHCoH8HUpGF
         5Kzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708553242; x=1709158042;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1cIdAj9Rc9YrdEZf80SuI9gbBcjMeYE4blz3NlBPNkk=;
        b=G+CEz8qHI7uciCxRPsTTPozz3shBLloElQyYf6dYc9xcpGV4q3N8MwPLwAvCovnM7v
         PtcOYUN8SEwCVGtwv36aIjJDNO+lBK/zCjN0kYy9j/Tqe/x4OmyPJvl/BdC9JCzuKotH
         XAILf3DB//bhRE2CphDW7HFbh9qW3SKmZSCFQD52tXCPzsiJ/ZVte8o8V5DF2P3g4oRr
         XDei9obKyA5/WEGHrC1+jYI4ZM3eq/kKHvzbigkYgFbIw//elMkXaQTDSUEJ4FEpJ9QY
         cxhHWnt51kJp9XaYbXv6cVEA/EdYOgx3Fxl0EiGneYdxVLEgg3mZgG6Dgm8zCO8aDUER
         MeCg==
X-Forwarded-Encrypted: i=1; AJvYcCXOgqrIO1gW1dpV7d5/CTq6Na451THd6D3WbarEljKn0PoYoC7O9RwA8lImyr4pKkbEkscspKWXTqshQTkvqWHsV61FUAdBaOr8RslouviFerM=
X-Gm-Message-State: AOJu0YyYHMWGAaVgSznO3eFZlRjUeKJKXP6jB6NJ+r3/243jm+Qwsgnj
	WuWoZRiTcXGdWi0nb3FrdPcP+0rjDdUvMYWIQZNPzPx0cUZdg6eV6/ABzP7wb9Y27rfbLdnNxnO
	t6g7mkbaIZZ13czN5F0X9ciNhC0WmYAIql8MG5g==
X-Google-Smtp-Source: AGHT+IHcXCkZHHGUkDm2xvIgiK6VurrE3eAJdP/r6uC/vcQd0YLTd8DmYtHQlaiiKrj98oMZezfQEBryKYUS8JEchGY=
X-Received: by 2002:a05:690c:86:b0:607:d9f7:e884 with SMTP id
 be6-20020a05690c008600b00607d9f7e884mr20419761ywb.4.1708553242109; Wed, 21
 Feb 2024 14:07:22 -0800 (PST)
MIME-Version: 1.0
References: <20240217093937.58234-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240217093937.58234-1-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 21 Feb 2024 23:07:11 +0100
Message-ID: <CACRpkdajVH4Y2K5W+o5XAoiEr57ObVbaR+9QdFV=Cp765B+dfQ@mail.gmail.com>
Subject: Re: [PATCH] phy: constify of_phandle_args in xlate
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-phy@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	netdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_140735_453848_B45A9F37 
X-CRM114-Status: UNSURE (   7.07  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gU2F0LCBGZWIgMTcsIDIwMjQgYXQgMTA6MznigK9BTSBLcnp5c3p0b2YgS296bG93c2tpCjxr
cnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+IHdyb3RlOgoKPiBUaGUgeGxhdGUgY2FsbGJh
Y2tzIGFyZSBzdXBwb3NlZCB0byB0cmFuc2xhdGUgb2ZfcGhhbmRsZV9hcmdzIHRvIHByb3Blcgo+
IHByb3ZpZGVyIHdpdGhvdXQgbW9kaWZ5aW5nIHRoZSBvZl9waGFuZGxlX2FyZ3MuICBNYWtlIHRo
ZSBhcmd1bWVudAo+IHBvaW50ZXIgdG8gY29uc3QgZm9yIGNvZGUgc2FmZXR5IGFuZCByZWFkYWJp
bGl0eS4KPgo+IFNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5r
b3psb3dza2lAbGluYXJvLm9yZz4KKC4uLikKPiAgZHJpdmVycy9waW5jdHJsL3RlZ3JhL3BpbmN0
cmwtdGVncmEteHVzYi5jICAgICAgICAgfCAgMiArLQoKQWNrZWQtYnk6IExpbnVzIFdhbGxlaWog
PGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KCllvdXJzLApMaW51cyBXYWxsZWlqCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1h
aWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
