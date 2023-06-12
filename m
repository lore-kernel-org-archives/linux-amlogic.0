Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DF46C7EE2E
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Jun 2023 12:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T+mv5XXBccW6tQQ6WE9XDFR24EPLNVha57EjNYgirsI=; b=K5dDHsoUhnrw0I
	wGvdKpm+nkUfcujQ9kZMxvECryiFBrMVWCQLvaZ7C9/e92rjI1NYPAoixpSOXX/fo+ijsfWqlDxqR
	tXPn3qG85h1ohjMGnS3Qd5qxO/m3zuE2St51RbBjj16FtM+Sa6kELisPUef/jefsh/dzru6PVTgyf
	aL/qGweWfkXztZiYwmUx9oawx6pDq8E7G8QWTTUGqfUKpIY0mm3gqSqBIU6ULUEWl7sIVqkbeVYHj
	mrdE5K9aEncFG0G/oP1Tm+irsGk0k6Skb7QZP38GHjQGKKmVpDAYLDIJSgZr4ADbLmlE1FlJG135I
	h5Z2qasHheAG21Gb7ZIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8gl4-0042N0-0y;
	Mon, 12 Jun 2023 12:34:54 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8gl0-0042M3-2R
	for linux-amlogic@lists.infradead.org;
	Mon, 12 Jun 2023 12:34:52 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-30c2bd52f82so4223555f8f.3
        for <linux-amlogic@lists.infradead.org>; Mon, 12 Jun 2023 05:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686573288; x=1689165288;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6uiOLkZCzE29dDMS8mbkCPIlcaOZI15UFOlxO0jpkY0=;
        b=JYJMhhXD8GoG+wc74RJldJAzuKQdW5UgEr8HC/hxk5ii+viJh1euNwOtRj6jrtEr9D
         eKsE7A1zLZ9fquw51Ws5VAmaivwyRKD55QY/xGZAqCiinlxX1Jdzx9tOTCJn+NDvL4LE
         43CF5SKDlnhFYmsKU8hi9p7jameNYTuAxhga1JKs+5wGQdsKNc2ORHjjfVan6SUBzvPF
         Cum1N4QPjLWxIOz/x4riLsJGfoYSj4+NCPUe76VotTMJjFsZEkN695pRkPH6/4Grdh3U
         CeF62WVyKOpn90DoTkepG18xIfyH0J7ilRE8gUju2DhmdymLp6wWLL5je2zBHdKK0ksg
         Fthg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686573288; x=1689165288;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6uiOLkZCzE29dDMS8mbkCPIlcaOZI15UFOlxO0jpkY0=;
        b=N/5dqZnAd9ItPDHkm3BRWQzR4xVkwfvUZz26cM1ABbgeO9pOTN8PN+gCXWyEIa5Ivm
         gyCT5h24/o7EQbuUIjJlEt3bg6w4Wn2fe5WskZ8rPvMmlVwPpbUpvq2cis04kuorG4Sv
         Mbz2VgktYYO4G7TyFIFbIbJLdv+SBh2LkokOVLGe6mZ+zkatxS89lryccaUTPjboLZfd
         I+ZOAgCDbySNYd8JxUigzplLGCqXywmHRwCCAYE5dTI7b57koScPegIJYfb3ZdPKlahZ
         n4Lb1ENWmNndVJGdtGDOj2DRYeurhiZeB5V8HIAKiPDGwLv+/0kDIf13X4WT6DgXj/ls
         nw8w==
X-Gm-Message-State: AC+VfDzgXKoVoZp76tGVq00q1W0NYyqyaOAs1TfQ1vHB6JIqkH2QV5tG
	nuOdl0Vh1zXVwavzW+zyM2tulQ==
X-Google-Smtp-Source: ACHHUZ7bM0IBJoONrYs6kRhNBRDlS6Go2aTCDQ3PwEcXf0zi87gZWymuDit2csnnPeqTy+MuzxcdFA==
X-Received: by 2002:adf:fd0a:0:b0:30a:f2a0:64fa with SMTP id e10-20020adffd0a000000b0030af2a064famr4548732wrr.10.1686573287730;
        Mon, 12 Jun 2023 05:34:47 -0700 (PDT)
Received: from [192.168.7.189] (679773502.box.freepro.com. [212.114.21.58])
        by smtp.gmail.com with ESMTPSA id x2-20020adfec02000000b002ffbf2213d4sm12485151wrn.75.2023.06.12.05.34.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jun 2023 05:34:47 -0700 (PDT)
Message-ID: <47c1cd91-7871-5df6-871b-6a53c94f5f86@linaro.org>
Date: Mon, 12 Jun 2023 14:34:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v2 0/3] Add additional YUV420 bus format check for
 dw-meson's bridge enable
Content-Language: en-US
To: =?UTF-8?Q?Adri=c3=a1n_Larumbe?= <adrian.larumbe@collabora.com>,
 khilman@baylibre.com, linux-amlogic@lists.infradead.org,
 dri-devel@lists.freedesktop.org, rfoss@kernel.org, andrzej.hajda@intel.com
Cc: kernel@collabora.com
References: <20230612112354.4034489-1-adrian.larumbe@collabora.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230612112354.4034489-1-adrian.larumbe@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230612_053450_826450_B41D453E 
X-CRM114-Status: GOOD (  10.91  )
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

SGksCgpPbiAxMi8wNi8yMDIzIDEzOjIzLCBBZHJpw6FuIExhcnVtYmUgd3JvdGU6Cj4gVGhpcyBp
cyB2MiBvZjoKPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9kcmktZGV2ZWwvMjAyMzA1MjgxNDAw
MDEuMTA1NzA4NC0xLWFkcmlhbi5sYXJ1bWJlQGNvbGxhYm9yYS5jb20vCj4gCj4gVGhlIG9ubHkg
ZGlmZmVyZW5jZSBpcyBoYXZpbmcgYWRkZWQgYW4gYWN0dWFsIGNvbW1pdCBtZXNzYWdlIHRvIHBh
dGNoCj4gbnVtYmVyIDMgaW4gdGhlIHNlcmllcy4KClNlZW1zIHlvdSBkaWRuJ3Qga2VlcCBteSBB
Y2tlZC1ieS9SZXZpZXdlZC1ieSBhbmQgeW91IHVzZWQgbXkgb2xkIG5hcm1zdHJvbmdAYmF5bGli
cmUuY29tCmVtYWlsIGFkZHJlc3MuLi4uIGFuZCB5b3Ugb25seSBzZWxlY3RlZCB0aGUgTWVzb24g
JiBCcmlkZ2UgbWFpbnRhaW5lcnMgYW5kIG5vdCB0aGUgcmV2aWV3ZXJzLgoKPiAKPiBBZHJpw6Fu
IExhcnVtYmUgKDMpOgo+ICAgIGRybS9tZXNvbjogZHctaGRtaTogY2hhbmdlIFlVVjQyMCBzZWxl
Y3Rpb24gbG9naWMgYXQgY2xvY2sgc2V0dXAKPiAgICBkdy1oZG1pOiB0cnVseSBlbmZvcmNlIDQy
MC1vbmx5IGZvcm1hdHMgd2hlbiBkcm0gbW9kZSBkZW1hbmRzIGl0CgpUaGUgc3ViamVjdCBzaG91
bGQgYmU6ICJkcm0vYnJpZGdlOiBkdy1oZG1pOiAuLi4iCgo+ICAgIGR3LWhkbWk6IHJlbW92ZSBk
ZWFkIGNvZGUgYW5kIGZpeCBpbmRlbnRhdGlvbgoKRGl0dG8KCj4gCj4gICBkcml2ZXJzL2dwdS9k
cm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYyB8IDM1ICsrKysrKysrKy0tLS0tLS0tLS0tLS0t
Cj4gICBkcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fZHdfaGRtaS5jICAgICB8ICA0ICstLQo+
ICAgaW5jbHVkZS9kcm0vYnJpZGdlL2R3X2hkbWkuaCAgICAgICAgICAgICAgfCAgMiArKwo+ICAg
MyBmaWxlcyBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCAyMyBkZWxldGlvbnMoLSkKPiAKClBs
ZWFzZSByZXNlbmQgYSB2MyB3aXRoIGFsbCB0aG9zZSBjaGFuZ2VzLApUaGFua3MKCk5laWwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9n
aWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
