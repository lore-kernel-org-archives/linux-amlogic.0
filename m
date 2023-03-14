Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D639C6FD1F
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 Mar 2023 17:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GieV9PIXVCyOq98wdSYEFJXN3oouUueakSUyVAd1iNs=; b=qnxDfmWTQK41js
	JObDfwuFTUPShnp5TGF5NM5czuqEBRuwxJXCyBQOTcE7TNPAUmyAj7tZGDFO8ZgANaoX4JQBqdn8+
	Uhdg8QXHzCNRdKQm6rrq14pUxnOeGPkvxgtEOdGcsAoq3WrzRLrTlGX9G061/DucIXGDJMNU+vEEg
	H/6z5LoBSKtBNGeZL6zlPjdmS6mbe8NpIs9+wu6xx5S2gIQr1CXBq/8nfKNZSfmCKFYJDulR0Q7Ut
	GtdySUWYoFadw4V/RW90d8EAUHuYzNWO1+SiSAHvO/7uLudd6DPjVerUnwuLhcx1mavpW+3/6bTYD
	FdBJdva7hwNLTVUhKD6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pc8ic-00B3R2-1K;
	Tue, 14 Mar 2023 17:45:50 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pc7Zw-00AqeL-1J
	for linux-amlogic@lists.infradead.org;
	Tue, 14 Mar 2023 16:32:50 +0000
Received: by mail-ed1-x52c.google.com with SMTP id h8so20643310ede.8
        for <linux-amlogic@lists.infradead.org>; Tue, 14 Mar 2023 09:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678811567;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hZMmUYtKJ8wmH3Y0b7DE4LXgBhnyqMdRf+GRKEQEn4c=;
        b=HOMoHJbvrS91PZJdsSoMVF4wEKhsJzukL0cbjFvfv9908EoWA62ipm8dzNSPoyH2Ha
         7OrEZpotzbre+nBpyPdyCuM1aR627eF/GX/nRY34d9dg7fNOraC8g8rZ62ciV9E0hR8V
         3Y+INXEIbwCT8XLueIXSFY2B6uLFjwOHG7cb+vpszvgBJ8GHEy/28Ic8maoK3PKBHVM9
         fRqEFDoV4KXJPzGJVeUJWwCV2m6Ea2UK+eEQksGSdmaedxi7sxEBkXLx9uGM7ZPzKnWY
         G09Xgt268QjmkKJ8+FXqyp0Z7H5o5pmGIIV/JtvItiyFAVHe5RytDR3FtLM7nk8CmKeL
         5/xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678811567;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hZMmUYtKJ8wmH3Y0b7DE4LXgBhnyqMdRf+GRKEQEn4c=;
        b=BuDtP1TiGH1uVhFLavPYNAMk7SY7JzRrRcdzjBj0Rj194GiW5Scw2wSUkzkkjaoYcl
         +BuLPFP10g6a57WgxBrywvWF19h5mBtuBJiznQInE5NuLdaZMSoSMI1yq7EKo4fqPhuZ
         2ZuBYvvC0mv98AZLAfXs3zZycwvsxk0gS5YhoQlhfUvbzwv537rzbA1wcpOAmFMboqyl
         iIB42QsOI9SxUy9zGqlQ3wjrVeViequeGRIPKAHeGFIbLjo1WZBdGmWWQ2M49qnbVwa3
         UOthueI+zdblh40Ja2ZdmJjhTr93B/1G/2XcEqg+2+/WUYU+Bl7qSDemfx2Y4JG+fXN8
         5Rkg==
X-Gm-Message-State: AO0yUKWq/ZtTqsjC299Z2Z+Pe0KGzHIg/EPMSxaLZ4jODohSjaoQHf8/
	sfF1FusH5RGQODHPzpIMoSHP/w==
X-Google-Smtp-Source: AK7set+myyCkcdJ6jQlFEHkzUZ2F1WAxX5BcejY0gf0Rd4/49aK9Lc6ALEebeykXKuMeNvyqb5FwSA==
X-Received: by 2002:a05:6402:74e:b0:4fd:23c9:11ed with SMTP id p14-20020a056402074e00b004fd23c911edmr5057745edy.17.1678811567132;
        Tue, 14 Mar 2023 09:32:47 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:59be:4b3f:994b:e78c? ([2a02:810d:15c0:828:59be:4b3f:994b:e78c])
        by smtp.gmail.com with ESMTPSA id cd3-20020a170906b34300b00921357fb28csm1341977ejb.123.2023.03.14.09.32.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Mar 2023 09:32:46 -0700 (PDT)
Message-ID: <bafa692c-f3a3-d317-278d-2dd3b5ff8af3@linaro.org>
Date: Tue, 14 Mar 2023 17:32:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 01/28] media: cec: ch7322: drop of_match_ptr for ID table
Content-Language: en-US
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Guenter Roeck <linux@roeck-us.net>
Cc: Joe Tessler <jrt@google.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Michael Tretter <m.tretter@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Rui Miguel Silva <rmfrfs@gmail.com>, Wenyou Yang
 <wenyou.yang@microchip.com>, Bin Liu <bin.liu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 Houlong Wei <houlong.wei@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Yong Deng <yong.deng@magewell.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Philipp Zabel <p.zabel@pengutronix.de>, Sean Young <sean@mess.org>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org
References: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
 <b83d6b81-c4ec-4fb8-b626-84af80d1c4a3@roeck-us.net>
 <74ae8afe-c537-1714-77ec-8a80d8ddad69@xs4all.nl>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <74ae8afe-c537-1714-77ec-8a80d8ddad69@xs4all.nl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_093248_555883_9758CE51 
X-CRM114-Status: GOOD (  13.17  )
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

T24gMTQvMDMvMjAyMyAwOTozNCwgSGFucyBWZXJrdWlsIHdyb3RlOgo+IE9uIDEzLzAzLzIwMjMg
MjM6MDEsIEd1ZW50ZXIgUm9lY2sgd3JvdGU6Cj4+IE9uIFN1biwgTWFyIDEyLCAyMDIzIGF0IDAy
OjEyOjUxUE0gKzAxMDAsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6Cj4+PiBUaGUgZHJpdmVy
IGNhbiBtYXRjaCBvbmx5IHZpYSB0aGUgRFQgdGFibGUgc28gdGhlIHRhYmxlIHNob3VsZCBiZSBh
bHdheXMKPj4+IHVzZWQgYW5kIHRoZSBvZl9tYXRjaF9wdHIgZG9lcyBub3QgaGF2ZSBhbnkgc2Vu
c2UgKHRoaXMgYWxzbyBhbGxvd3MgQUNQSQo+Pj4gbWF0Y2hpbmcgdmlhIFBSUDAwMDEsIGV2ZW4g
dGhvdWdoIGl0IG1pZ2h0IG5vdCBiZSByZWxldmFudCBoZXJlKS4KPj4+Cj4+PiAgIGRyaXZlcnMv
bWVkaWEvY2VjL2kyYy9jaDczMjIuYzo1ODM6MzQ6IGVycm9yOiDigJhjaDczMjJfb2ZfbWF0Y2ji
gJkgZGVmaW5lZCBidXQgbm90IHVzZWQgWy1XZXJyb3I9dW51c2VkLWNvbnN0LXZhcmlhYmxlPV0K
Pj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296
bG93c2tpQGxpbmFyby5vcmc+Cj4+Cj4+IFJldmlld2VkLWJ5OiBHdWVudGVyIFJvZWNrIDxsaW51
eEByb2Vjay11cy5uZXQ+Cj4+Cj4+IEZXSVc6IFRoZXJlIGlzIGFsc28KPj4gaHR0cHM6Ly9wYXRj
aGVzLmxpbmFyby5vcmcvcHJvamVjdC9saW51eC1tZWRpYS9wYXRjaC8yMDIzMDIxNTIxNDcyNC4z
Nzk4OTE3LTEtbGludXhAcm9lY2stdXMubmV0Lwo+IAo+IEkgc3VwZXJzZWRlZCB0aGF0IHBhdGNo
IGluIHBhdGNod29yayBpbiBmYXZvciBvZiB0aGlzIHBhdGNoIHNpbmNlIHRoaXMgaXMgcGFydCBv
Zgo+IGEgbGFyZ2VyIHNlcmllcy4KCkkgYW0gcGVyc29uYWxseSBmYW4gb2YgRklGTywgc28gR3Vl
bnRlcidzIHBhdGNoIHNob3VsZCBnbyBpbi4KCj4gCj4gS3J6eXN6dG9mLCBwbGVhc2UgbGV0IG1l
IGtub3cgaWYgeW91IHdpbGwgdGFrZSB0aGlzIHNlcmllcyB5b3Vyc2VsZiBvciB3YW50IG1lIHRv
Cj4gbWFrZSBhIFBSIGZvciBpdC4KCkkgcHJlZmVyIGlmIHlvdSB0YWtlIGVudGlyZSBwYXRjaHNl
dC4KCgpCZXN0IHJlZ2FyZHMsCktyenlzenRvZgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFt
bG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
