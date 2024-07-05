Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75F83C3271E
	for <linux-amlogic@archiver.kernel.org>; Fri,  5 Jul 2024 15:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dLqknyM0iRIycMHxL6eszUP5ovqYTXWrGwqQG/fyNLY=; b=TXx1Kx1tZtdqkk
	JGBnVQ88dZB2J8wB4l3Sw+K2+wV0vBeeCetmnaU44h+nNSj8nnwZI3mdqtiqas/a+/k9hHTsEIGm3
	GAT9u3yS6BmZjaTJraHiYyq3BqsGKXY0u6Nt64UuputjJB0NKKVdj2zKCYSS5kmsTBJhyyxLj+AWi
	vZhtrv/947DAEmD+3v0XeMqUeuszFbJ9zsI8UqOIu6wv2jfnBZ0uESZeiZlJ3oEPikHvqFgmqepp2
	G5Ix4MIyUliA2GDnlTeCpKTBImqVut9aGca88Z6/2TXXQZmw4PFC3fzXnuM/RQbvFCsH8oKzKGGl8
	gSH+G8wPYk+2a3SvszuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPl2m-0000000GM86-1H1p;
	Fri, 05 Jul 2024 15:40:16 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPl2h-0000000GM5n-456P
	for linux-amlogic@lists.infradead.org;
	Fri, 05 Jul 2024 15:40:15 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-36786081ac8so1069952f8f.0
        for <linux-amlogic@lists.infradead.org>; Fri, 05 Jul 2024 08:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720194010; x=1720798810; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rWJsmVbnxMDiuFLY+fOlqn//TXBBmUogobIIxAviZlc=;
        b=aS8ABTULYwHTp4Mx/YdsUgJPrfACpf4eKInAyEaQO9kOQvObCXp6E4pfPIujrvORb1
         axd6qrFj/BJx5mK766tGJuIy0urciIZHidMoVwrxZLlHfgM3YZCpwHxvq8WfeAROKPN3
         h8Z+l1oti7U9cib8aq1n5q02ZvnIOvsTjvv3vtKw+F+ZeI2wSc4dUJk2Ib1NzUZp5OL6
         Da20+FfNHkk0Ysdj3KEGG3CaklepnX5IYWBh/+2vHeqtlMeatY9xBoi7RX7HfDSo5QEm
         2+pj0kx7978VOiYHhYpuUTZuH30CSC3mLH5u/Rgv3wxELpT8iClMwl16R2D0q+RhFT8l
         8jVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720194010; x=1720798810;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rWJsmVbnxMDiuFLY+fOlqn//TXBBmUogobIIxAviZlc=;
        b=kFox3NTiVUZpknl8ykawylZDZwl8mcgd90iniwuJspmDtuCo1ezflQ/dZelk3LID6O
         SmVI95zOh3aBZ4IiLV4Glrx/lsXayTI16H95DPMMndw013YiYE1dWEcXsMzNiOiSWGD9
         kehilTIQmCxom0fqXx16ktm73ycxqwV0OMiUwe94c0Ls6wodQQXDhUWbiUuDF5A4WM+w
         egWSh/7UUCvp3BsEVkEY2d4F4dsyDWy2xsTwAOI7sAjgUZHBguvgEzF/oHIJ0WkMzHX4
         tBN8I1PBKFfG25aTwVTjjWwwRavJLaklNdFm2qqBUQWqb1fqtkHoKVrL67QyYMiNxBkV
         sKPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYip94nJB6wAp/3Jjix7li/RdMyElg8CgFNNUuOhUNprBHYsb02S2QVG/YG3WEp7fqYColffzVWtuOjHhnk/0zk4VNnPgAM4iuYdhxrlDtQ+0=
X-Gm-Message-State: AOJu0YzweX9LWjYUjk08m2VH5skWgr6Q+5db4V3kydHISkr4DbfsRXSY
	HRmbbDhPPsa/1koGNMFHpbguTK1Q1Dithxh40b+d5Xuzw//WNnivZdkiQPec/4k=
X-Google-Smtp-Source: AGHT+IFZ5tZcHjh9afQQV6N+UDpsdiCgwUbQuOPcHUbDQTq2FuqnU3hsZXAXDh/UpS3fDJuMgQV8qw==
X-Received: by 2002:adf:a18f:0:b0:366:f469:a8d with SMTP id ffacd0b85a97d-3679dd35e71mr3543623f8f.35.1720194009828;
        Fri, 05 Jul 2024 08:40:09 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:c49e:e1a5:3210:b8c0? ([2a05:6e02:1041:c10:c49e:e1a5:3210:b8c0])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-36795d1fc9csm6559538f8f.83.2024.07.05.08.40.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jul 2024 08:40:09 -0700 (PDT)
Message-ID: <c7c78d7d-c920-415f-b97b-c3b7c61eb9fe@linaro.org>
Date: Fri, 5 Jul 2024 17:40:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 00/22] dt-bindings: thermal: few cleanups
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Zhang Rui <rui.zhang@intel.com>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Guillaume La Roque <glaroque@baylibre.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Fabio Estevam <festevam@gmail.com>
Cc: linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-sunxi@lists.linux.dev, imx@lists.linux.dev,
 linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Florian Fainelli <f.fainelli@gmail.com>,
 linux-rpi-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Conor Dooley <conor.dooley@microchip.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Amit Kucheria <amitk@kernel.org>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Heiko Stuebner <heiko@sntech.de>, Biju Das <biju.das.jz@bp.renesas.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20240705-dt-bindings-thermal-allof-v1-0-554061b52fbc@linaro.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20240705-dt-bindings-thermal-allof-v1-0-554061b52fbc@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240705_084012_047853_ED5AED16 
X-CRM114-Status: UNSURE (   5.84  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gMDUvMDcvMjAyNCAxMTo1MSwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiBIaSwKPiAK
PiBSZXNlbmRpbmcgKHdpdGggYWRkZWQgdGFncykgYmVjYXVzZSBwYXRjaHNldCB3YXMgc3RpbGwg
bm90IGFwcGxpZWQuCj4gRGFuaWVsLCBjYW4geW91IHBpY2sgaXQgdXA/CgpBcHBsaWVkLCB0aGFu
a3MKCgotLSAKPGh0dHA6Ly93d3cubGluYXJvLm9yZy8+IExpbmFyby5vcmcg4pSCIE9wZW4gc291
cmNlIHNvZnR3YXJlIGZvciBBUk0gU29DcwoKRm9sbG93IExpbmFybzogIDxodHRwOi8vd3d3LmZh
Y2Vib29rLmNvbS9wYWdlcy9MaW5hcm8+IEZhY2Vib29rIHwKPGh0dHA6Ly90d2l0dGVyLmNvbS8j
IS9saW5hcm9vcmc+IFR3aXR0ZXIgfAo8aHR0cDovL3d3dy5saW5hcm8ub3JnL2xpbmFyby1ibG9n
Lz4gQmxvZwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFt
bG9naWMK
