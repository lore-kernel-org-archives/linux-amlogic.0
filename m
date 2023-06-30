Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02FA6EB64D7
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Jun 2023 07:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KnwuLWqAgwITDY3LbdQzvRTjLdjzfa++zRbZK5JF2+E=; b=0FnUZnfwmJyl3Ot78PA0fDJJCn
	aDWSBNoBTbgU0fsN6ZvDmmFLKN8fS8m/yJyYzOII2uA+BhUSZ6aDk4CjEOTPG98ONe+EqHX0I+g3e
	AE+8CS2n1V/YlWzs36QvWxn71YLYcNEbAYfCa9+ZT+fV53JJ3hHKC73N4DTXTOaR752ydyZH0dNu5
	wqFCDZ2cCKGpfoNVPkj45/cYOVpGyMTI1S2lu7j6ZGl22zF+JZI8TdhlBou1BEdnIElPwtzFpwWxn
	Hi+9VPjLUy2BcSH5mGjBzYApsvoQJWSyuZRU6930JOe4F/vhRTFtCTkkiE1fmY16jPHJwi6MHnzxN
	4MXVt5Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qF8sa-0037i0-0n;
	Fri, 30 Jun 2023 07:49:20 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qF8sX-0037gb-1W
	for linux-amlogic@lists.infradead.org;
	Fri, 30 Jun 2023 07:49:18 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3fa8cd4a113so16448945e9.2
        for <linux-amlogic@lists.infradead.org>; Fri, 30 Jun 2023 00:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688111354; x=1690703354;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iRfw15ErOguqSIIHURRE0OTcz3LeKZcT69wox0vClec=;
        b=rAQuPJi+eT3Kp4arQzO8f3phEq6qoOBmRg4LqXwfiDnXjqDY9VQgugUHdfe0LY9TV3
         rXZG+xZUyDa0UBaHYBLV0Of805dJLLM35TOdYN1FrA264zoEW6U3wpyUNRonVxcOGOwj
         sbahwTGJ1R52N3cIfgInHGmnWjQBOcNEdoHGCbultdhjH3zE70djcfSvpJXzqbE6Pi00
         oHA5LCC0OSfZe3ZLN+sy5rz6dqY3oQqxSQz/Pne1GkycOpeyjSj8Igake2y++TOmq53l
         nwRiLzQiOecnNwSykOmOl+AzVjVArwakSe/FKwCRO5nzvTwXP2XlJg/iP78oU4LXh4SL
         x/bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688111354; x=1690703354;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iRfw15ErOguqSIIHURRE0OTcz3LeKZcT69wox0vClec=;
        b=kj6LtduRhnEiVfrOkvnhPsPJvGwbHgAg1Zb6wRh6+xS8agTEMECHgZPOW36vps1BI7
         +9UpdfYKcRmTNQ3d+eHHFtLhQ2PRxThnTSpUIcQHCFzy7srxy/giLZVTUZxAuSz78rkP
         8vyGabAkZEXvbVwax/5yfgSiwk3sAamXJ+7GI8JqmAhIEYYvO4Mbx5kC2DIXrTBG3DPm
         2MZHWkOaweLAPkhPpOYP+08ik3vtbDKUI9/kXMljJaoaKpZF+Zy3CY043W9HfvEurbCr
         LxBRIvmiU3PtuCnDciQOsyUQG9r2tBHtAUmxFCefaNyESb7mUX4Z7zdrLhNaZ16NvNQq
         E2FQ==
X-Gm-Message-State: AC+VfDx87z5bf7pkFuuNtgvsv8GoD3ut0qiDgU4RJDFdt1zkumBbNy1b
	vO0QR+D2mPiB/cNR95vmOU09Ow==
X-Google-Smtp-Source: ACHHUZ5+dcZk88UuWwQX5Q/Ft91E+rKmG0m3RzhwO6yEbNe8JfyChx+IvnHE+uGHdF7XI0LyDzntFA==
X-Received: by 2002:a05:600c:3649:b0:3f9:bf0f:1ceb with SMTP id y9-20020a05600c364900b003f9bf0f1cebmr1496183wmq.37.1688111353989;
        Fri, 30 Jun 2023 00:49:13 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:eac6:eb92:cae4:cfd2? ([2a01:e0a:982:cbb0:eac6:eb92:cae4:cfd2])
        by smtp.gmail.com with ESMTPSA id q10-20020adfdfca000000b003141e629cb6sm1834694wrn.101.2023.06.30.00.49.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jun 2023 00:49:13 -0700 (PDT)
Message-ID: <ba03946f-f0ed-0e62-0171-8dee256dce7a@linaro.org>
Date: Fri, 30 Jun 2023 09:49:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/3] PCI: meson: Remove cast between incompatible function
 type
Content-Language: en-US
To: =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kwilczynski@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>,
 Yue Wang <yue.wang@Amlogic.com>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Srikanth Thokala <srikanth.thokala@intel.com>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Conor Dooley <conor.dooley@microchip.com>, linux-pci@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-riscv@lists.infradead.org
References: <20230629165956.237832-1-kwilczynski@kernel.org>
Organization: Linaro Developer Services
In-Reply-To: <20230629165956.237832-1-kwilczynski@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230630_004917_581530_67C4D4EB 
X-CRM114-Status: GOOD (  11.43  )
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gMjkvMDYvMjAyMyAxODo1OSwgS3J6eXN6dG9mIFdpbGN6ecWEc2tpIHdyb3RlOgo+IFJhdGhl
ciB0aGFuIGNhc3Rpbmcgdm9pZCgqKShzdHJ1Y3QgY2xrICopIHRvIHZvaWQgKCopKHZvaWQgKiks
IHRoYXQKPiBmb3JjZXMgY29udmVyc2lvbiB0byBhbiBpbmNvbXBhdGlibGUgZnVuY3Rpb24gdHlw
ZSwgcmVwbGFjZSB0aGUgY2FzdAo+IHdpdGggYSBzbWFsbCBsb2NhbCBzdHViIGZ1bmN0aW9uIHdp
dGggYSBzaWduYXR1cmUgdGhhdCBtYXRjaGVzIHdoYXQKPiB0aGUgZGV2bV9hZGRfYWN0aW9uX29y
X3Jlc2V0KCkgZnVuY3Rpb24gZXhwZWN0cy4KPiAKPiBUaGUgc3ViIGZ1bmN0aW9uIHRha2VzIGEg
dm9pZCAqLCB0aGVuIHBhc3NlcyBpdCBkaXJlY3RseSB0bwo+IGNsa19kaXNhYmxlX3VucHJlcGFy
ZSgpLCB3aGljaCBoYW5kbGVzIHRoZSBtb3JlIHNwZWNpZmljIHR5cGUuCj4gCj4gUmVwb3J0ZWQg
YnkgY2xhbmcgd2hlbiBidWlsZGluZyB3aXRoIHdhcm5pbmdzIGVuYWJsZWQ6Cj4gCj4gICAgZHJp
dmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpLW1lc29uLmM6MTkxOjY6IHdhcm5pbmc6IGNhc3Qg
ZnJvbSAndm9pZCAoKikoc3RydWN0IGNsayAqKScgdG8gJ3ZvaWQgKCopKHZvaWQgKiknIGNvbnZl
cnRzIHRvIGluY29tcGF0aWJsZSBmdW5jdGlvbiB0eXBlIFstV2Nhc3QtZnVuY3Rpb24tdHlwZS1z
dHJpY3RdCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKHZvaWQgKCopICh2
b2lkICopKWNsa19kaXNhYmxlX3VucHJlcGFyZSwKPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+Cj4gTm8g
ZnVuY3Rpb25hbCBjaGFuZ2VzIGFyZSBpbnRlbmRlZC4KPiAKPiBGaXhlczogOWMwZWY2ZDM0ZmRi
ICgiUENJOiBhbWxvZ2ljOiBBZGQgdGhlIEFtbG9naWMgTWVzb24gUENJZSBjb250cm9sbGVyIGRy
aXZlciIpCj4gU2lnbmVkLW9mZi1ieTogS3J6eXN6dG9mIFdpbGN6ecWEc2tpIDxrd2lsY3p5bnNr
aUBrZXJuZWwub3JnPgo+IC0tLQo+ICAgZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpLW1l
c29uLmMgfCAxMSArKysrKysrKy0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygr
KSwgMyBkZWxldGlvbnMoLSkKPiAKCjxzbmlwPgoKClJldmlld2VkLWJ5OiBOZWlsIEFybXN0cm9u
ZyA8bmVpbC5hcm1zdHJvbmdAbGluYXJvLm9yZz4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFt
bG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
