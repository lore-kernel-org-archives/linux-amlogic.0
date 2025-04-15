Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28EF8C369B8
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Apr 2025 07:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HmLUO/D/i6f4r50aham2Fk0k+lKyBspAUDf68EkciHU=; b=M6+szscwhvsgmV
	CksA6ybZOASMEUMpYBkytqsHh3wBvzOH7qOE3rfPo+EmJ/cfvaNJ8ht7BAmbcnK8zB4xp6qZ9lenT
	TKAu2U2HAwyKmY6IMuYH0zm2svMLnPBYE5Yljc9an0sY+K/UGSUm4l88Z6f6VU5MaOp2ebva03WDX
	AFU9KwNuD2av/BoNCDJz/OVdbkC0+v5lQ7ncQUS8c63l8MWq6oOgLE5ZKLebC1/tpWTC3toHsgu7x
	ZEu3dSOjP9C55XmQIwdpU16rlGrJGtcqFfvhSIi+yJgZ/t2DgDv9l1FOkYnsoquHXlodCrzWtWrf8
	ntb219BHCAc4X8iwsXog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4b8z-00000004tQp-1PNq;
	Tue, 15 Apr 2025 07:55:45 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4auG-00000004q3r-0DGz
	for linux-amlogic@lists.infradead.org;
	Tue, 15 Apr 2025 07:40:33 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-30dd5a93b49so45361761fa.0
        for <linux-amlogic@lists.infradead.org>; Tue, 15 Apr 2025 00:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744702830; x=1745307630; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bPPsVA86aRMmKsehM2IabqFVi4bzGyyaypZ1MvkVduM=;
        b=qJAc7EztUIIBe7cgH6F0q8w8tDS20MtbobN7QYaTiYSP87iQlb2cVDFh9AfAWIGLZC
         8VxEdhJjegCBzRer31iKvEGjuggbLBHok8egtSWeXSi1SnrOHtr77ZtcyFZSFnx6qGP3
         uVq9kl9xAbjIXqtaOAzUPsXliLXqdLSVmZ51Vku6ckTnggItyic1O3PP8yWbcCWM1zRx
         h1H51Ba0q4Y+ponVDjR5p++c+hQhNIFVyhGySXUkvRj6ZAJutE+Xu67ehZ4twxZTcfF3
         YUzxy13eGOxAnqCJz1R9ifWAhmQwIX85uKn2SnntbAitFfZDwWblMK8Px/nUWpOlcDxe
         hgyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744702830; x=1745307630;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bPPsVA86aRMmKsehM2IabqFVi4bzGyyaypZ1MvkVduM=;
        b=PP4T+PYuw/1n9hAHWnyMerFQjbZ/wKmH+awhFbbBKJjj+DELppEZw1E9fJWWl2WgHf
         nJxZGF/AANOGEJ26ON2OvHoiF0qjzj99NtybB5XvqTkTuvnIAlII3cby3BcVMpU9uipZ
         /s+6yctKfzLeJs5LrkUTsxfzzF2kDFvHkB8oYeYeLPTv+T26mQ2cF5QH0YaySynD+SBk
         JvuBXGqjeTvtvF+Wrkxe8qFLvmtLr3kwFmi601bXYN0deIy3qwYuAT2BhwKEu3zCWXX6
         xeZnYg7SqYK2fkZs0L4XtsV9T2OorM0N12CJ6WVSceqHu+FybYHObe50DYom2803UeuT
         1XaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjMiazAF6xyTevygmtHUBHkZhM0A+zoG5xw7WyTfIwswGEZsM6M95l/fXdnYUIktqOZ6F9WJ5gYvH9YopU@lists.infradead.org
X-Gm-Message-State: AOJu0YyQGPmv5spLOLoW2K33CchADhdF+kIBOIFtOsV91gOBPA1HHq0r
	9/AU+WYsIMqqyVpH/n2xBhiGOeAsGC+YP/BpC/SefwGFVEKUXIX4qHRtZ8o45Q5xBcCB1vv04D1
	l0+iDGFcDrL6OuN4vSmiY1AMeQ6IIkrZ3g+djFA==
X-Gm-Gg: ASbGnctLKQBTUaD2FrB70IpCCFsh+2fd/bJKO6PznlzyukCDsMCO0Bf/cqJb8FvZVqF
	cG2rB3gpGI+bZrq0u9PjJvZAdxjnsknmhXouIybjYh5HqIKG9O2cNXMzDh/f9L76OPitYEvwpdz
	0VFKtw3M/kCF5AXLKN0Qm+AXr0TjIpugux
X-Google-Smtp-Source: AGHT+IFWYF5PBFz8bdBMKs/hFSmP9qdyePV80JdSmzpOU6YbNPT0plMuK8UpwqvumIMhMZzLrddrNlq7JqXr9GLcwmY=
X-Received: by 2002:a2e:9214:0:b0:30c:3099:13d0 with SMTP id
 38308e7fff4ca-31049a01919mr40215891fa.21.1744702830214; Tue, 15 Apr 2025
 00:40:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250403-a5-pinctrl-v3-0-a8c067e22295@amlogic.com> <20250403-a5-pinctrl-v3-1-a8c067e22295@amlogic.com>
In-Reply-To: <20250403-a5-pinctrl-v3-1-a8c067e22295@amlogic.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 09:40:18 +0200
X-Gm-Features: ATxdqUGH5zAtbvjbTyVv3OZBDQWbnPFIqXVT2OLZ9OTJTUgQ_9-qW1g1gPLhhII
Message-ID: <CACRpkdZATVbE8nrk7_B2jE7MOqqeruV25mRdZaXdGNJ_kh1S1w@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: pinctl: amlogic,pinctrl-a4: Add
 compatible string for A5
To: xianwei.zhao@amlogic.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_004032_092171_004B64AF 
X-CRM114-Status: UNSURE (   7.62  )
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

SGkgWGlhbndlaSwKCk9uIFRodSwgQXByIDMsIDIwMjUgYXQgMTA6MzPigK9BTSBYaWFud2VpIFpo
YW8gdmlhIEI0IFJlbGF5CjxkZXZudWxsK3hpYW53ZWkuemhhby5hbWxvZ2ljLmNvbUBrZXJuZWwu
b3JnPiB3cm90ZToKCj4gRnJvbTogWGlhbndlaSBaaGFvIDx4aWFud2VpLnpoYW9AYW1sb2dpYy5j
b20+Cj4KPiBBbWxvZ2ljIEE1IFNvQ3MgdXNlcyB0aGUgc2FtZSBwaW50cmwgY29udHJvbGxlciBh
cyBBNCBTb0NzLiBUaGVyZSBpcwo+IG5vIG5lZWQgZm9yIGFuIGV4dHJhIGNvbXBhdGlibGUgbGlu
ZSBpbiB0aGUgZHJpdmVyLCBidXQgYWRkIEE1Cj4gY29tcGF0aWJsZSBsaW5lIGZvciBkb2N1bWVu
dGF0aW9uLgo+Cj4gQWNrZWQtYnk6IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hp
cC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogWGlhbndlaSBaaGFvIDx4aWFud2VpLnpoYW9AYW1sb2dp
Yy5jb20+CgpQYXRjaCBhcHBsaWVkIQoKUGxlYXNlIGZ1bm5lbCAyLzIgdGhyb3VnaCB0aGUgU29D
IHRyZWUuCgpZb3VycywKTGludXMgV2FsbGVpagoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1s
b2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
