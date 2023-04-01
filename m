Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9198C6FD1D
	for <linux-amlogic@archiver.kernel.org>; Sat,  1 Apr 2023 19:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MFtbTgGSg2DNAgK+jr9LG6naQlNh9QVWSQ0jDaev/0k=; b=urn2ue6f+DQLIh
	eyjpYh/wzcFb+LL25+tkL9R8opJYeLl2Jmo/QKYCVsIu7g9Vu9rJHsS67pCqcGPWkVN8NXP6YvXHN
	3oopIkp6RI6kSnYLXVfeMRhD5SMkfL9vaVkrv9A+bj6oQby9aIKSRalkIb3UzReMa/asREbaAQxzG
	aG0J/iwzKT1ryF/fwqGO5ZzvEGz6e9/zSttbK3uNwS1osxwH5sporxmclpAbPFWMnYvvtmiMP/Dqa
	we/oU1BMmG/am7qaSMXfip1HfVCaQ5RW5rNS9bbfADqqTQoig8uG+uiUs0hZkFrIW4ivboOssVA9c
	NRDpXeRI/4NZS5Uld2jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pigme-00BC24-0p;
	Sat, 01 Apr 2023 19:21:04 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pigmY-00BC11-1D
	for linux-amlogic@lists.infradead.org;
	Sat, 01 Apr 2023 19:21:02 +0000
Received: by mail-wm1-x334.google.com with SMTP id d11-20020a05600c3acb00b003ef6e6754c5so11962766wms.5
        for <linux-amlogic@lists.infradead.org>; Sat, 01 Apr 2023 12:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680376856;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=plPDlN2Tr0cMrBksYqPMB4W1dFCVJlxtuYiCKzlM2kA=;
        b=N6vvvwWG1mKczUs527uyzx4sS1mfCeYM7WzUfumJeD4XxvsGUBAlw/aW7w2wfmjJ4S
         OGyk2kQDXfknoqu5Npe33VVhLFJGkMMKEEXg1nQ+PO02bWVIOUrmm6+I4iukkyT5auA2
         +fnCAM3UqLXnD2ukmZzHgnwbfIHtgCw6xgeli9RNXvQ2jl9ScXknb62I6Kp3nc0yY/m/
         2fN2jVISUssF8xCTn6uNSFhwFCe3IfJQ/PwbigyRHfaGmYQAxbwAGEIl/73VNLMLS6ug
         moACy/9G5Ai7hHnuYmcyfyi+0Y7odBtPz7HG4Hurlc4zfHlTIjUZ1r/YwJOiy+FuFRkf
         LqJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680376856;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=plPDlN2Tr0cMrBksYqPMB4W1dFCVJlxtuYiCKzlM2kA=;
        b=uuR/nc1joSOXW53ljVDwA1LpRemvzLgd3Os374lvCTUzVg9Oqdx0UAD92VqSU+3HBt
         hJthnRNWwUJtQmBKniu1mj1Zzi8jr8mu7MOeYrqcD+Fv+kCPs/jAPPCBjt5LBall4c+7
         WOgFgKR1POgx6P1beDyaS6tJ50y2ufU68F5OeVD8YhSB7ECPwYB96VLasO4CDK/tbWvD
         QmU1Ne+qR5aeyjU+94zbk4fSDlOYmVnyMIe3ag8DHzItNzEbFIOb16kT4+9qD74wPscG
         XgJTY40WO+plbk9DlDLkQuK5i8Op+jp35w1lhAi9j7rmCOKBZ5V42zt8VdYZFtNfUG59
         t4jg==
X-Gm-Message-State: AO0yUKWxDmmunoqDwtNAUhSV6JS/zLAOre8lVG8/E/TyHODpOhzZATzc
	rA2pWlDxlrPNVxHv9Mcmav/bgg==
X-Google-Smtp-Source: AK7set9n2bp1LQ5Oq1vYpwvsVHtNuSCeA80cHG3EPpiiO1khSV8FamfPvw/Dae78HiIAdi5xZH4U3A==
X-Received: by 2002:a05:600c:b55:b0:3ee:6d55:8b73 with SMTP id k21-20020a05600c0b5500b003ee6d558b73mr23092656wmr.29.1680376855933;
        Sat, 01 Apr 2023 12:20:55 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:b36a:1186:309c:1f9a? ([2a05:6e02:1041:c10:b36a:1186:309c:1f9a])
        by smtp.googlemail.com with ESMTPSA id n2-20020a05600c4f8200b003ef5e5f93f5sm14113747wmq.19.2023.04.01.12.20.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Apr 2023 12:20:55 -0700 (PDT)
Message-ID: <0c26074c-a0dc-e0e4-899d-c3f4f10922af@linaro.org>
Date: Sat, 1 Apr 2023 21:20:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] dt-bindings: thermal: Drop unneeded quotes
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Guillaume La Roque
 <glaroque@baylibre.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>
Cc: linux-pm@vger.kernel.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20230327170233.4109156-1-robh@kernel.org>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20230327170233.4109156-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230401_122058_430776_9952EEE3 
X-CRM114-Status: UNSURE (   7.54  )
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

T24gMjcvMDMvMjAyMyAxOTowMiwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gQ2xlYW51cCBiaW5kaW5n
cyBkcm9wcGluZyB1bm5lZWRlZCBxdW90ZXMuIE9uY2UgYWxsIHRoZXNlIGFyZSBmaXhlZCwKPiBj
aGVja2luZyBmb3IgdGhpcyBjYW4gYmUgZW5hYmxlZCBpbiB5YW1sbGludC4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgo+IC0tLQoKQXBwbGllZCwgdGhh
bmtzCgotLSAKPGh0dHA6Ly93d3cubGluYXJvLm9yZy8+IExpbmFyby5vcmcg4pSCIE9wZW4gc291
cmNlIHNvZnR3YXJlIGZvciBBUk0gU29DcwoKRm9sbG93IExpbmFybzogIDxodHRwOi8vd3d3LmZh
Y2Vib29rLmNvbS9wYWdlcy9MaW5hcm8+IEZhY2Vib29rIHwKPGh0dHA6Ly90d2l0dGVyLmNvbS8j
IS9saW5hcm9vcmc+IFR3aXR0ZXIgfAo8aHR0cDovL3d3dy5saW5hcm8ub3JnL2xpbmFyby1ibG9n
Lz4gQmxvZwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFt
bG9naWMK
