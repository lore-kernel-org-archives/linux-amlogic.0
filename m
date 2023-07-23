Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 403EFC001DC
	for <linux-amlogic@archiver.kernel.org>; Sun, 23 Jul 2023 19:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UdnZhhTJ2234Nkps31rVdvwZUtUIF2ZZdBcPFAuSSRo=; b=iyiwP3g0oA6dgi
	zGVR2p4ja8o7+dMWQxMfdFTGFrsA1diobQaDXuaqDcwG2MclJCL3dGQiJSaRNy0+UtTFUtNDcghXm
	3d1oA05kX1O1liAP+jvegcc7yhkBnceqHPfVwmUjmS1ev8widRMPwt9ETmafUv75XkbfAldcpiSYb
	hZHFZstbBJdG0ieRcdwqo87kgnIr0A4ZjBfjC4XtXFRUyRX8oERxU353OLMWzZEXy+FtXNKYQNymO
	mZ/3Qrvw2wHfAFxCugBkGx9JEBseI/zpe9jFonJdZBhMEhuxLm4EifVnzqr0WKTXfbpeAuXVWq+Lz
	ybPM5R5JtCdg1kBwkLYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNehX-001hBA-1n;
	Sun, 23 Jul 2023 19:25:07 +0000
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNehU-001h9L-2M
	for linux-amlogic@lists.infradead.org;
	Sun, 23 Jul 2023 19:25:06 +0000
Received: by mail-yb1-xb2a.google.com with SMTP id 3f1490d57ef6-ccc462deca6so4172515276.0
        for <linux-amlogic@lists.infradead.org>; Sun, 23 Jul 2023 12:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690140301; x=1690745101;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yl6HR544A3gxyqOWex4QhTxlPIhZO2gf7gaKJSLJd6o=;
        b=BljtUEH2/rh7Z9S+j8h8FwWtFrayDWC6LJ3H71w64lpsjdJx4R+kedh4bDnQKF/8uI
         e4+ljdATczEp82AZJb7MsvjUrB1pcO4LqhGMIIbEgfJ37pg344CauEMK3PN2Df3hIb2E
         RuZIJr4ctT9qNOx0fpulSl/LEF4cnzw45inDGISq0dUc649hHBDKqqlAPyYKtwuPb5Cu
         qlhU/u3RV1kum7qZnMFU9X3F67WamOjP8Ocs37+/5xH022YXCSqSlNXq+4HAOr8XdZmX
         l/KvTVgL3r4BIA6TqwaAxRT0cFo/9aFecBj5Nmxt7Lzcs8xUkluR4QQ7RZ58BjK91Z8S
         2ckQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690140301; x=1690745101;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yl6HR544A3gxyqOWex4QhTxlPIhZO2gf7gaKJSLJd6o=;
        b=PbPhvxCrdPBU77bnNZciVSgeq7a4R/cWewgStFs20iyfusa6cQsshBh7AIv1/n+pil
         O+nrJZ6BrJp3OJKY5z89xZPO9SHIrz87FSSjKTppZ+WjIq/1KPyJ1Bl/ihzyqICT/HNW
         xqdehAq4azfH84Nibko4thNkPrDnoLNKW4e4hGBycMZvqXGpQYctKVGCWiGKNy8PHsTq
         H+c+e6UQwjVaGdKerJyHtwjJOsUNfjul3iWhP8MLbmZd87UcydVRUU/DDYq8Pi+CSxrT
         dqlMvd2noJgI64lJuvJCBw28ZDLJxuxaE892duz6Q9UNJoTm6y9aEJMGm+vwq/Cv3yq/
         6Pgw==
X-Gm-Message-State: ABy/qLY6H/rtkb3vg0xHLcn2cZGH/Go09sK62Cks7ew15FQEAc0mKQ0/
	teR+DdeORxZ60KQawv2n7zk8rKJBKEyUSTudlB6cOw==
X-Google-Smtp-Source: APBJJlGDlegKPBYoGwW5osdb4ar+lLvJb0T8w52ymwKt8ifdKBRQzuQ8F+h4GTuQZehdTh+oc/WP6tGbLuAfrobDpEk=
X-Received: by 2002:a05:6902:1351:b0:d07:f1cc:c152 with SMTP id
 g17-20020a056902135100b00d07f1ccc152mr5236326ybu.36.1690140301620; Sun, 23
 Jul 2023 12:25:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230714122441.3098337-1-huqiang.qin@amlogic.com> <20230714122441.3098337-3-huqiang.qin@amlogic.com>
In-Reply-To: <20230714122441.3098337-3-huqiang.qin@amlogic.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 23 Jul 2023 21:24:49 +0200
Message-ID: <CACRpkda8yg2b=Li3CdLTnVA_9QnGDHjY2rva=NjVHnyvKPJMTA@mail.gmail.com>
Subject: Re: [PATCH V3 2/2] pinctrl: Add driver support for Amlogic C3 SoCs
To: Huqiang Qin <huqiang.qin@amlogic.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, 
	martin.blumenstingl@googlemail.com, brgl@bgdev.pl, andy@kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230723_122504_769386_4624EB04 
X-CRM114-Status: UNSURE (   8.33  )
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

T24gRnJpLCBKdWwgMTQsIDIwMjMgYXQgMjoyNeKAr1BNIEh1cWlhbmcgUWluIDxodXFpYW5nLnFp
bkBhbWxvZ2ljLmNvbT4gd3JvdGU6Cgo+IEFkZCBhIG5ldyBwaW5jdHJsIGRyaXZlciBmb3IgQW1s
b2dpYyBDMyBTb0NzIHdoaWNoIHNoYXJlCj4gdGhlIHNhbWUgcmVnaXN0ZXIgbGF5b3V0IGFzIHRo
ZSBwcmV2aW91cyBBbWxvaWdjIFM0Lgo+Cj4gU2lnbmVkLW9mZi1ieTogSHVxaWFuZyBRaW4gPGh1
cWlhbmcucWluQGFtbG9naWMuY29tPgoKUGF0Y2ggYXBwbGllZCwgSSBhbHNvIGZpeGVkIHVwIHRo
ZSBjb21taXQgbWVzc2FnZSwKbm8gbmVlZCB0byByZXNlbmQuCgpZb3VycywKTGludXMgV2FsbGVp
agoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
YW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
