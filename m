Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F43DC74A5B
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Mar 2023 07:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fWSmBiQ3Qqp0+O+ERETB4o/v47fko9c9hH84eSaCwck=; b=ZebWCH8+GJVwfi
	LYlxrz/IhMU6sH2JeHgmAbwZFdyP2iQqOVLMihucAAiJk/LGaZVSqEH57ZTUfh5MkxpUUR67z/05D
	kac7X5LuYbkRQT+0rCuhw7IVEnhN1MzpwkUCbFScOsVJwZY7b2JyfQu4qlJtJTTole8dcxW5dv7oA
	j1G1FdkqW86PXK/VA66OlReBjvpRlihUtFThDpfFgO7xiYcWwN29h13v7DdcZEK9RCxPDY+mgfWX7
	Tzk81eOQXkO0tM90bvNLSpwPxIsZ6pUmPxG/aK1aBYta780CP0kzLg8voHAJK9fHID2smY9bSj0Bn
	HfWBxA2NQ5qCzx6UfxPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phPzn-00GseZ-2W;
	Wed, 29 Mar 2023 07:13:23 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phPzj-00Gsca-1O
	for linux-amlogic@lists.infradead.org;
	Wed, 29 Mar 2023 07:13:21 +0000
Received: by mail-lj1-x230.google.com with SMTP id q14so15049112ljm.11
        for <linux-amlogic@lists.infradead.org>; Wed, 29 Mar 2023 00:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680073997;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tjz4YY6475MDr5O8cC77sTPGv7vBqMb5/BBOLn/SVfo=;
        b=MRtmY6Sh0Urs9hIQEFX25PAVvlSXcMe+uCuWyT0FSHfRII2WE6jEemrt3H/G97TI8g
         UaO0l6ZMoo4Dw0W8Bu2wDUhT68ebAGzQn5ud84/RJC26Q5aHkW443xy9ifd/mJ22N7Ex
         vkRgCmSLtUp+BKq/Jo78BLRkrH2a77RS4aD/NOWUkBeAQ6RXWQTWqxIoJewmPI8+mjuo
         B07ke0nHNqkz99Lw+Z5uVD2NkIxAH8CgjxW21q3pDMuXgofb9yox5n5IkvSHPTUvqdzO
         T4ypTATDANkBPDFLxe0SzFMnsOOrl/ZEp0Ud0aiJGqas5o3aHapXgjglf5kpIn2/Ex+o
         YI7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680073997;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tjz4YY6475MDr5O8cC77sTPGv7vBqMb5/BBOLn/SVfo=;
        b=jcjIAc0V7HoPUo+EOASMpKUKLDoQpVAn7gSMVuDZeHI66OpP9uWIlxuDicJV5tYJ2W
         klqqPqdB7S3o0le4ObxeF06RZmaFuA5I0aeH/0CYLvC03C6ZQyyAkzFPGAC6UFd6BU8e
         s9dl1U+1QHhPf0P5Y0kh/27mh0LzwkgcS+MNeYFETqyR0VJFeuHsIMpNYTZJFXI0oXN2
         5KdHlddT9YY5A9ZAP9HhwPm82/QeBqPEdFAMH3Fu2Eiz+JlpAUtGaSUNN5y+z/S5dR/P
         /p+8s9fjO2/P16N181UvEaEG4S/4ahqNGYCSzq49tPtSgscJFbEmEy6ye6vtX736D97X
         PbLA==
X-Gm-Message-State: AAQBX9eaKPKQazr6CeumgKMAcbhPOywymWshFpMan87zfUX423d4Vkxp
	XMIOmlmPS/qQ9dObD5DOlRcinw==
X-Google-Smtp-Source: AKy350Z3U5ebYnTlRO47AoMVt8i3K/fuetG/Bfiu2U0Js/vspmuVMfQmnKLBM1VvfiYcYbjVFKhcKw==
X-Received: by 2002:a2e:9d0c:0:b0:29e:4fa5:1708 with SMTP id t12-20020a2e9d0c000000b0029e4fa51708mr5731177lji.3.1680073996921;
        Wed, 29 Mar 2023 00:13:16 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id x26-20020a2e9dda000000b0029bd4365c95sm4697519ljj.87.2023.03.29.00.13.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Mar 2023 00:13:16 -0700 (PDT)
Message-ID: <6e1f4885-e8b9-8031-c25f-a9b18c187e56@linaro.org>
Date: Wed, 29 Mar 2023 09:13:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 02/16] spi: mtk-pmif: Drop of_match_ptr for ID table
To: Stephen Boyd <sboyd@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Andi Shyti <andi@etezian.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Daniel Mack <daniel@zonque.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
 Jerome Brunet <jbrunet@baylibre.com>, Kamal Dasu <kdasu.kdev@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, Mark Brown <broonie@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Jarzmik <robert.jarzmik@free.fr>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-spi@vger.kernel.org
References: <20230310222857.315629-1-krzysztof.kozlowski@linaro.org>
 <20230310222857.315629-2-krzysztof.kozlowski@linaro.org>
 <7e58e5c86bd602932b762f9364209e31.sboyd@kernel.org>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <7e58e5c86bd602932b762f9364209e31.sboyd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_001319_466585_6723CDD6 
X-CRM114-Status: GOOD (  11.26  )
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

T24gMjkvMDMvMjAyMyAwNjoxNywgU3RlcGhlbiBCb3lkIHdyb3RlOgo+IFF1b3RpbmcgS3J6eXN6
dG9mIEtvemxvd3NraSAoMjAyMy0wMy0xMCAxNDoyODo0MykKPj4gVGhlIGRyaXZlciBjYW4gbWF0
Y2ggb25seSB2aWEgdGhlIERUIHRhYmxlIHNvIHRoZSB0YWJsZSBzaG91bGQgYmUgYWx3YXlzCj4+
IHVzZWQgYW5kIHRoZSBvZl9tYXRjaF9wdHIgZG9lcyBub3QgaGF2ZSBhbnkgc2Vuc2UgKHRoaXMg
YWxzbyBhbGxvd3MgQUNQSQo+PiBtYXRjaGluZyB2aWEgUFJQMDAwMSwgZXZlbiB0aG91Z2ggaXQg
aXMgbm90IHJlbGV2YW50IGhlcmUpLgo+Pgo+PiAgIGRyaXZlcnMvc3BtaS9zcG1pLW10ay1wbWlm
LmM6NTE3OjM0OiBlcnJvcjog4oCYbXRrX3NwbWlfbWF0Y2hfdGFibGXigJkgZGVmaW5lZCBidXQg
bm90IHVzZWQgWy1XZXJyb3I9dW51c2VkLWNvbnN0LXZhcmlhYmxlPV0KPj4KPj4gU2lnbmVkLW9m
Zi1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3Jn
Pgo+PiAtLS0KPiAKPiBJJ2xsIGZpeCB0aGUgc3ViamVjdC4KPiAKPiBBcHBsaWVkIHRvIHNwbWkt
bmV4dAoKVGhhbmtzLiBBcG9sb2dpZXMgZm9yIHRoZSB0eXBvIGluIHRoZSBzdWJqZWN0LgoKQmVz
dCByZWdhcmRzLApLcnp5c3p0b2YKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1hbWxvZ2ljCg==
