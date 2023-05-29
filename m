Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD380C77B7E
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 May 2023 20:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hM0X4Eeb2autRMxExrZYZbU85IuIDNvPW3IEJibsWrM=; b=LtlwjfuPpphVkr
	u7G47+jmO6orX3XR9iqVBdFuUCrivNTHvnywWkbWANiBpXBgFRFctixihtT8surPg1gNOV1ybaoC8
	VI8s+owGresVEsaZvLtI3QSJ32oXIvjyaXdnIOr83vJmO+qAwzicr84Gg229uhSfYLDg4vA4+6+Xs
	wwP0hgszOL7nsUxX8CvVpauTUhTaqBd4Syn7s6ULmitPBxf559Kg+bu5RtHs+lqfFY/jVUPIwqkkr
	37Zach6k8hY6POBrR4r1erX7NQ0mMlplyXUKWHN/CKqnin0u2IClt3FoQwqNGN/nnJbU7EEhuYxlu
	jI6xOuKKZPrtDde+u+pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3jkT-00Bfd9-1H;
	Mon, 29 May 2023 20:45:49 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3jkQ-00BfcX-2F
	for linux-amlogic@lists.infradead.org;
	Mon, 29 May 2023 20:45:48 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-95fde138693so945950766b.0
        for <linux-amlogic@lists.infradead.org>; Mon, 29 May 2023 13:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1685393145; x=1687985145;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7R3FPKbTWJLY+7i6BBPmrgd9L+dL7TFTDyT61Ll30oE=;
        b=nj3zUNvkEFdZe5oaMlf0dKuc+PXsQ5ttMjDktar1yzmPig16fR9oWyTpF4mTftPooc
         Sr7SLd8DtJkOgcMiGIK/zA6y22/FMiijXcepgahANShG5rELnJEtsRpgDCJj7AAtDKGa
         XLwScgu/jrc8Ob4tAcFjEf6t1O45WX2QZAbK4gQAOXRiT38ncBuDGuODxA6TT/1KBZdf
         JNg0coLhkjvQMTcyCMxZ/4pUFk7GS9aSm49woUFVcCf+QX6tRjO/YomEmiIFhvtnghJr
         WZHyDu4qWMIaw+TbMx8PqDJuUoBuBGxYqx2hss+6uIcUwBztQuJxwBqkgAa5KOpAk/Kh
         FZOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685393145; x=1687985145;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7R3FPKbTWJLY+7i6BBPmrgd9L+dL7TFTDyT61Ll30oE=;
        b=clDXjImBCw6tOo9R1Ptqgon+kI2k9aQbX2m8wLVY8QSgbZZo4q/t3L6ZZKxtw6f+Ru
         GECNYGhfVXmtA9xWhtjI/HAp3D8r/HlLlHt1zjtTGfvz0UHqAkqHOQRhmUgl4r+APTRB
         6DDyTGQNPFbRH6NzbU5YjVqpdaO1EatP8k+XLWuyFkeBlbxwY4fJO5w510OdidHrSmTs
         vC4ea0pLWAmF0GbRWuONiu+KVU8ykbhaLEzY3Jx250hACYC5HMzTJLmIqCuf2DVRLkUc
         tMbss46q5nu9NeN7bRRvHfiVLV+X4dTyBFopXf+YWBug8/dcX5GKJXg8UHv29eNHkKzQ
         kOTw==
X-Gm-Message-State: AC+VfDxuIMFbV6Xpk84Quc1DuKQFNuWTIu4VdAUyOOGbkRP9KWcCPXpM
	OlwbWbnhJXDdsbvuRnOOOzfIbKcphovqpNOm0IM=
X-Google-Smtp-Source: ACHHUZ6dBQLVeTggS7BrQZIwH0USzlV+sl8utSAh2F33q38rxWXSjwkj09vNDIoE2Mf8GbkG0A/xUakYNm9lMIHvQis=
X-Received: by 2002:a17:906:58d1:b0:94a:653b:ba41 with SMTP id
 e17-20020a17090658d100b0094a653bba41mr291658ejs.15.1685393145061; Mon, 29 May
 2023 13:45:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230517115635.31565-1-zelong.dong@amlogic.com> <20230517115635.31565-4-zelong.dong@amlogic.com>
In-Reply-To: <20230517115635.31565-4-zelong.dong@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 29 May 2023 22:45:34 +0200
Message-ID: <CAFBinCCSGdKfgEpdF5FmAyjb-wOM2HtsriuBDnePokgyu4PkXw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] media: rc: meson-ir: support MMIO regmaps to
 access registers
To: zelong dong <zelong.dong@amlogic.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Sean Young <sean@mess.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, linux-media@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, Qianggui.Song@amlogic.com, 
	Yonghui.Yu@amlogic.com, kelvin.zhang@amlogic.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_134546_740871_49ADABC1 
X-CRM114-Status: UNSURE (   8.73  )
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

SGVsbG8sCgpPbiBXZWQsIE1heSAxNywgMjAyMyBhdCAxOjU24oCvUE0gemVsb25nIGRvbmcgPHpl
bG9uZy5kb25nQGFtbG9naWMuY29tPiB3cm90ZToKPgo+IEZyb206IFplbG9uZyBEb25nIDx6ZWxv
bmcuZG9uZ0BhbWxvZ2ljLmNvbT4KPgo+IFN1cHBvcnRzIE1NSU8gcmVnbWFwcyB0byBhY2Nlc3Mg
Y29udHJvbGxlciByZWdpc3RlcnMgaW4gTWVzb24gSVIgZHJpdmVyLgo+Cj4gU2lnbmVkLW9mZi1i
eTogWmVsb25nIERvbmcgPHplbG9uZy5kb25nQGFtbG9naWMuY29tPgo+IC0tLQo+ICBkcml2ZXJz
L21lZGlhL3JjL21lc29uLWlyLmMgfCA3MiArKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0t
LS0tLS0tCktjb25maWcgYWxzbyBoYXMgdG8gYmUgdXBkYXRlZCB3aXRoOgogIHNlbGVjdCBSRUdN
QVBfTU1JTwoKT3RoZXJ3aXNlIHlvdSBjYW4gZW5kIHVwIHdpdGggYSBjb21waWxlIGVycm9yOiB1
bmRlZmluZWQgcmVmZXJlbmNlIHRvCmBfX2Rldm1fcmVnbWFwX2luaXRfbW1pb19jbGtgClNlZSBh
IHJlY2VudCBwYXRjaCBvbiB0aGlzOiBbMF0KCgpCZXN0IHJlZ2FyZHMsCk1hcnRpbgoKClswXSBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMjMwMjI4MDQzNDIzLjE5MzM1LTEteHJ5MTEx
QHhyeTExMS5zaXRlLwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtYW1sb2dpYwo=
