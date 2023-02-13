Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F7FEC636D4
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Feb 2023 09:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lAqu/gZffu64aXq+p6K3sp7Zk2UOdRexAlqmPTtJV1c=; b=3Jv+PBrCppalM5
	tJHrUqPbEnCO8QxG+sw+eqGupqE0BehcnZuY2WnH6HqmZeIp2qQiEXMZtDHet0s5hUcDFxKINtr/R
	sFEKY7sdsnWkj3thBYjl/iFt2xvjYcK7mgVbD2RJRmCCBTybmiQYN4a0rMqdyy/i+gGc1/FU8FWus
	Olkuq5aJefqHg9a1hDLmCBOy5IWwcX7dEi+Sg0tlLHHXMsI4WTIbkssxqXUkcrQRWDFlRcmP/fYEK
	Z0Pmy6JdldCldIy+fQmkMokz4qioVGl0/wyfEv9st3ustPB2j+q0dbQhH1kAw/seJOrWwsQB2WFq6
	e8qNRyTuLOteSEBnY+kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRUw4-00Dm68-7L; Mon, 13 Feb 2023 09:15:44 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRUw0-00Dm4I-51
	for linux-amlogic@lists.infradead.org; Mon, 13 Feb 2023 09:15:42 +0000
Received: by mail-il1-x136.google.com with SMTP id w13so4933858ilv.3
        for <linux-amlogic@lists.infradead.org>; Mon, 13 Feb 2023 01:15:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pKOvhHJRhphSbPBn3so0B0jvZpigwezTNOs/N/XEZ5E=;
        b=NpOzWZNs52fgyDSK1zxl40/0Dx5n4NeCWXkovOvBUzksGQJuoq6r+M0XwUjPUjuDCp
         qWok95Yjwl+m/Az8N2txe+NGa8UJQ6w1D6ZUcOP4ToksLnuXERCRpsxGDlakBAYJgh6s
         Rp0BvUGfcnhQRb2j1HZf4p2P+Tc9Tyj2zYD8AF0KHCWuG4UTkJZvIrnK8l0t7ReoHwxe
         gMnovtxvi8PQmQGD+//6EPW8YdgUNjFdr7vDNlcPbgQzvPQsmrjqn8yHZDpr8z9JPCCT
         piLyeX8Z32ssmSc7mGqQMUdIvdh2+8LlEAOh+/IbJa8x2mxYyZRF2KJ1LQgWht5qXNGF
         6h9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pKOvhHJRhphSbPBn3so0B0jvZpigwezTNOs/N/XEZ5E=;
        b=cxFzDBTWU7dvnBj8Rm62YS1FOUoFr64r1/cBSZLqCzlAeOCf7afHeSTQw0bwkVdY9Y
         smI7PR4PQVYckoe4VjsJyPLFCRU4wdanktQG08Rx93ia59f3399M4kbgg8lsZfrF16qn
         RpsMohl8N8JuhQKorzKYWMmgfI4BoI/GL5zdsvtm4PJP1h6S56yA0t6EquClOD2Wsoyz
         qNdKagMocDtRgk27vpwbG333R+8XYWqc4p7Lp2w3Y/ja36qGBXMN4NVxJOLuRJ6QLetk
         l3+Z1tuzw6f5CeUlnxMVv/ZLxsFU3QCJ9jqAvPWGSWcvRInnZA+Nvt8SpWmFQINHYd16
         6e3A==
X-Gm-Message-State: AO0yUKW05zh1yyFg+KkGtm+JNdo1Dz0kk4HjfQVVlygdBFdoDHUphkQ/
	FBy9TGJ1GcmiEzBy5669X6tRTQ==
X-Google-Smtp-Source: AK7set8THxgVNnrm5T7fH0oGDH5+xMK5o9ph9mqDpQvxPFgROHNMVHH7uqtLR54GHK9o5hhn791ktQ==
X-Received: by 2002:a05:6e02:156b:b0:315:2a3f:5a1d with SMTP id k11-20020a056e02156b00b003152a3f5a1dmr10081627ilu.30.1676279738433;
        Mon, 13 Feb 2023 01:15:38 -0800 (PST)
Received: from ?IPV6:2a0e:41a:894f:0:2487:f87c:fb5b:9046? ([2a0e:41a:894f:0:2487:f87c:fb5b:9046])
        by smtp.gmail.com with ESMTPSA id q11-20020a92050b000000b0030c68d38255sm3639612ile.38.2023.02.13.01.15.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 01:15:37 -0800 (PST)
Message-ID: <447fa1c7-4992-838f-b5cd-91245deae188@baylibre.com>
Date: Mon, 13 Feb 2023 10:15:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH] drm/meson/meson_venc: Relax the supported mode checks
Content-Language: en-US
To: Da Xue <da@lessconfused.com>
Cc: Kevin Hilman <khilman@baylibre.com>, Jerome Brunet
 <jbrunet@baylibre.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Neil Armstrong <neil.armstrong@linaro.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-kernel@lists.infradead.org,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 dri-devel@lists.freedesktop.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20230210-relax_dmt_limits-v1-0-a1474624d530@baylibre.com>
 <CACdvmAgKrRMdX+R0nScGwazq7C=f=B_k-2w-ONk_iCyM_XAnSA@mail.gmail.com>
From: Carlo Caione <ccaione@baylibre.com>
In-Reply-To: <CACdvmAgKrRMdX+R0nScGwazq7C=f=B_k-2w-ONk_iCyM_XAnSA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_011540_430720_A4503E11 
X-CRM114-Status: UNSURE (   7.22  )
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

T24gMTMvMDIvMjAyMyAwODowOSwgRGEgWHVlIHdyb3RlOgoKPiAgICAgLcKgIMKgIMKgIMKgaWYg
KG1vZGUtPmhkaXNwbGF5IDwgNjQwIHx8IG1vZGUtPmhkaXNwbGF5ID4gMTkyMCkKPiAgICAgK8Kg
IMKgIMKgIMKgaWYgKG1vZGUtPmhkaXNwbGF5IDwgNDgwIHx8IG1vZGUtPmhkaXNwbGF5ID4gMTky
MCkKPiAgICAgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHJldHVybiBNT0RFX0JBRF9IVkFMVUU7
Cj4gCj4gICAgIC3CoCDCoCDCoCDCoGlmIChtb2RlLT52ZGlzcGxheSA8IDQ4MCB8fCBtb2RlLT52
ZGlzcGxheSA+IDEyMDApCj4gICAgICvCoCDCoCDCoCDCoGlmIChtb2RlLT52ZGlzcGxheSA8IDQ4
MCB8fCBtb2RlLT52ZGlzcGxheSA+IDE5MjApCj4gICAgICDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCByZXR1cm4gTU9ERV9CQURfVlZBTFVFOwo+IAo+IFNob3VsZCB0aGVzZSBiZSBsb3dlcmVkIHRv
IDQwMCBpbnN0ZWFkIG9mIDQ4MD8KCklmIHlvdSB3YW50IHRvIHN1cHBvcnQgNDAweDEyODAgdGhl
biB3ZSBuZWVkIHRvIHR3ZWFrIG1vZGUtPmhkaXNwbGF5IGFzIAp3ZWxsLgoKSSdsbCBwdXNoIGEg
djIuCgotLSAKQ2FybG8gQ2Fpb25lCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtYW1sb2dpYwo=
