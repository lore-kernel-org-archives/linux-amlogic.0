Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38422C61DA4
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Mar 2023 22:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2/aCqBmxpi2vDkQufs9/FOY0iME/S9OmQXpzLgk6bMo=; b=vHQofVV/Rqy1So
	JXq6Ll+aaNv1Wor3t6O0AjytM0PhDm/0TS8YvKLveUUslYApG9dq+UK+XZj9Hf8aAZwM88d7n7gEm
	acNa5tlQqmAQ5DR0FPXLTNpqbkuMa/IFeDoWtM8PvbdSxMZ2+EcF9w+UexMpg4qe14psPMpsdXQ+U
	+RV5VYOHzf8DW7YTrliUrDy+C6vJN1dik6YRYFYLqibetS/zB9DxVM2ZOGS7bGE9iCpB5LANEqj7C
	fl7FD2hqvp946S1rX5YhYKY7q1AQBMc8W+dmHNv+W/UwUYerYG/5JQ+epxMi5TDpAlf/mPE1mKXmg
	/TsG2A9r1RQJWGPozsGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZJ4L-00FD3i-Fi; Mon, 06 Mar 2023 22:12:33 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZJ49-00FCyS-CU; Mon, 06 Mar 2023 22:12:23 +0000
Received: by mail-ed1-x52d.google.com with SMTP id i34so44944727eda.7;
        Mon, 06 Mar 2023 14:12:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112; t=1678140738;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cQg0slzZg+8fAlDz5deuXBW8QY38rTBZok1Fnug76tI=;
        b=oBIMZQXiF4ysixV9IMgHG29ae7wwdzzZreoGcRedvoykXjsLn5p/BQ2jLfY4Y4ikHs
         g7x2GLwBLF0uGQxoz9oQHYyxYnc+Ry71+fSyeboWMsSohDfaiTx0qtj0mDPmXKcpDk0u
         LB6LgpO4FvEg6IkGLIEjK+S/wcOnnhGjv5W8y2YackL3GTtETyX7tBF1WV0EOv7tk8wZ
         /+3FpEMa87r83u5JUEqCy2L3hD3nU/AgS4VGl9z4cZNeHcbuuHT98cr3p9yYXIfsyamW
         NRC1KdegSEMsTEOHtZUn6EU0BN8uq/xB8kwZ+sMs306HzjZnZmyBx9/O11w+6j0Nqr8W
         HByg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678140738;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cQg0slzZg+8fAlDz5deuXBW8QY38rTBZok1Fnug76tI=;
        b=16DMV19U+8Ss8E7g0QZIAsYIKVJyiPi8XqKOsb27C1tapEf/uqZH3LG8SYlB6TUw3f
         ikoAqns9E5sfalIeZKr4nsYfGnRObUl6OzGugSSFJOZVLr8GUEmGau3SDMub5XDsgiRQ
         QeCtAU2xdKD+6I8dfJ8KV72Xq5Qem4qW8xxRhgewu3Ua0bzFrWaouCEvTfWGKxgRQpZR
         y8vhJVUdJ1g1zeW8xCD2eshym4MYFeKXDXZUhPKLSWKZRbKMiMJypKY0pgZOdgMyjW80
         xavpM0lJAtMKc9RThuQfIJ5MHL8J/kls3+pYnqIavH5uTZwyiMNZktIaH/EspzdaQUqp
         t6QQ==
X-Gm-Message-State: AO0yUKWLJ/dnn3t4E2R1lBZsv8q16qttozVqH8WZKKaQz+POU+fV+w7m
	BOMexPMk4rTUcLoOsTW3Mng45cryIo2oaiaydTA=
X-Google-Smtp-Source: AK7set/Z6nNofmxV6prGhaxbUj8U/Nwm48ysO8ukEy+mjSgVkQaQKaz6QyPCQf++hothXe4V0bezRPQRroVRwb/ckA8=
X-Received: by 2002:a05:6402:f81:b0:4ad:739c:b38e with SMTP id
 eh1-20020a0564020f8100b004ad739cb38emr8458921edb.1.1678140737963; Mon, 06 Mar
 2023 14:12:17 -0800 (PST)
MIME-Version: 1.0
References: <20230303-topic-amlogic-upstream-bpi-cm4-v2-0-2ecfde76fc4d@linaro.org>
 <20230303-topic-amlogic-upstream-bpi-cm4-v2-1-2ecfde76fc4d@linaro.org>
In-Reply-To: <20230303-topic-amlogic-upstream-bpi-cm4-v2-1-2ecfde76fc4d@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 6 Mar 2023 23:12:07 +0100
Message-ID: <CAFBinCBLqEwzgoyN50oksT_ZUEfuPi8GS3=45_OUCb_Dd92MdA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: amlogic: Document the boards
 with the BPI-CM4 connected
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_141221_702363_09A56091 
X-CRM114-Status: UNSURE (   7.91  )
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

T24gTW9uLCBNYXIgNiwgMjAyMyBhdCA5OjMx4oCvQU0gTmVpbCBBcm1zdHJvbmcgPG5laWwuYXJt
c3Ryb25nQGxpbmFyby5vcmc+IHdyb3RlOgo+Cj4gVGhlIEJQSS1DTTQgbW9kdWxlIHdpdGggYW4g
QW1sb2dpYyBBMzExRCBTb0MgaXMgYSBtb2R1bGUgY29tcGF0aWJsZQo+IHdpdGggdGhlIFJhc3Bi
ZXJyeSBQaSBDTTQgc3BlY2lmaWNhdGlvbnMuCj4KPiBEb2N1bWVudCB0aGUgYm9hcmRzIHVzaW5n
IHRoaXMgbW9kdWxlLCBieSBzcGVjaWZ5aW5nIHRoZSBCYW5hbmFQaSBDTTQKPiBjb21wYXRpYmxl
IGluIGFkZGl0aW9uIHRvIHRoZSBiYXNlYm9hcmQgY29tcGF0aWJsZS4KPgo+IEFja2VkLWJ5OiBL
cnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+Cj4gU2ln
bmVkLW9mZi1ieTogTmVpbCBBcm1zdHJvbmcgPG5laWwuYXJtc3Ryb25nQGxpbmFyby5vcmc+ClJl
dmlld2VkLWJ5OiBNYXJ0aW4gQmx1bWVuc3RpbmdsIDxtYXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2ds
ZW1haWwuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
YW1sb2dpYwo=
