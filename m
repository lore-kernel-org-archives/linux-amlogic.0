Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B28BEB64DC
	for <linux-amlogic@archiver.kernel.org>; Sun, 25 Jun 2023 21:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UeqBW37u/dlai06CAA6YZanzpKTdbflPsjiN7RYEEU4=; b=0BrQvLuGiJRwvj
	duJB0fn1f+T7S92siSSlIvH6cDXIndZBZ7de+W93T5DE9QRY2SqZcr1ZNsZhBl/iRYSUy0/40iSJO
	vp0UVxTveZbZ8Bw/vqa4Xk/GhbwnGzab5P1l4nEqmUm9KXbu/vmYe1EKY4NJzpSkUi2cA0VtgTXKm
	x4gYMuG83eEH+arvlPL7rJuPiePdAJ3L/pXeQABG3hpNmCtp06Agqs4a7X4Uh76oz9m5KZLazWJkx
	9cCrfDiOaHCMXrWtgzu73uqg4yaNbXHsb+UT1ChhZMKsGtGHHGyYw8Ll/daoOJEutTOCMXPWFv0Nj
	ilEfgFo7RD+pbNE3a24w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDWtW-008iOo-25;
	Sun, 25 Jun 2023 21:03:38 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDWtT-008iNc-2f;
	Sun, 25 Jun 2023 21:03:37 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-98e0c1d5289so161230066b.2;
        Sun, 25 Jun 2023 14:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1687727013; x=1690319013;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x1qUTVRqtuFOc3JgBHsj7jo773emKPd31TbXJig8SrE=;
        b=enNyxZrird41eKiFx69ef5eIqFRoukLWnR0269/bqLsyjnLcwGCwX8wy5cSdUpFoja
         ai9j5Keis1OLCIRhST1zZKzlHQuNR/cyQrFgPjdl6fKuwkNnW6/gxYBm1AvFovRI7FCS
         Tw2mrjI2hYZty6Uo2KVgZBAX0Xyt2jze+uvw92T/w6rZzro9m8i3OpPM0Fcfqgl+raYL
         xJ/SYJiK4XSmI/l5iOJjnHh1g8vPosyoyZty0tMYEvMeLo89oTyI8L8zFPiNUBF20G3+
         2nVvo0OwcjfRqRg1psQ9+jMST8WAWQGh4tTwINm/3DpwTublP68zgOPS4SslPwosWa6m
         Vbag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687727013; x=1690319013;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x1qUTVRqtuFOc3JgBHsj7jo773emKPd31TbXJig8SrE=;
        b=WechI1tguJiv8lBivqAYjbBH7oO5MvljE3OpoHFLAFlory4fAwMkF2r6yNpUEAUOUp
         whTUrrBri7qjNHMiugqK/1iA2uFqVh6NSLljL/DZpBA71oB5x4v2rlgab2D/pSdMkmoM
         ejEw+pTbn02T6aRdWMwRuN58F7nhzwYdazpHth1MTQo4VxnK6WnwVq9v4Vs70YhnebXp
         pzJfONlGdQijibnq0NMVjF8EFLjsvCyJH1TsVyQR17mBV7OUC9GAHfgpTm+wHjltrXcg
         PIaFhNKeqgsMubH/Q2Fh/Om9bvhWbaxXfcAqDi/wiXzVh5SKpuUFy64VfWZY+4JiCRUJ
         Pqnw==
X-Gm-Message-State: AC+VfDwB5+mLiZxjuszzjHN8tXFnTxFy691YbL4repnR5MHv5abatLE0
	0REaG9yIAz74VYmFBXFR1U745ZMMraf4+xmo0Yk=
X-Google-Smtp-Source: ACHHUZ5alJ2fuFFkTHozOioXL0nwU19Y1j3nLviNjxIaxbzwKLlUz+UVYHCa9X08SsIVGK1SgSlwsJ1tVn0bCXuWrr8=
X-Received: by 2002:a17:907:9623:b0:988:6bd2:b0ab with SMTP id
 gb35-20020a170907962300b009886bd2b0abmr21427420ejc.6.1687727012508; Sun, 25
 Jun 2023 14:03:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230607201641.20982-1-ddrokosov@sberdevices.ru> <20230607201641.20982-5-ddrokosov@sberdevices.ru>
In-Reply-To: <20230607201641.20982-5-ddrokosov@sberdevices.ru>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 25 Jun 2023 23:03:21 +0200
Message-ID: <CAFBinCAGLerkDrz98WbpyVAV3jukkPXqDGSV0vOWY0jNiKaJvQ@mail.gmail.com>
Subject: Re: [PATCH v1 4/6] arm64: dts: meson: a1: introduce SPI Flash Controller
To: Dmitry Rokosov <ddrokosov@sberdevices.ru>
Cc: neil.armstrong@linaro.org, jbrunet@baylibre.com, mturquette@baylibre.com, 
	sboyd@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	khilman@baylibre.com, conor+dt@kernel.org, kernel@sberdevices.ru, 
	sdfw_system_team@sberdevices.ru, rockosov@gmail.com, 
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Martin Kurbanov <mmkurbanov@sberdevices.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230625_140335_887111_24E1B24F 
X-CRM114-Status: GOOD (  13.37  )
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

T24gV2VkLCBKdW4gNywgMjAyMyBhdCAxMDoxNuKAr1BNIERtaXRyeSBSb2tvc292IDxkZHJva29z
b3ZAc2JlcmRldmljZXMucnU+IHdyb3RlOgo+Cj4gRnJvbTogTWFydGluIEt1cmJhbm92IDxtbWt1
cmJhbm92QHNiZXJkZXZpY2VzLnJ1Pgo+Cj4gVGhpcyBjb250cm9sbGVyIGNhbiBiZSB1c2VkIGZv
ciBzcGluYW5kIGZsYXNoIGNvbm5lY3Rpb24uCj4KPiBTaWduZWQtb2ZmLWJ5OiBNYXJ0aW4gS3Vy
YmFub3YgPG1ta3VyYmFub3ZAc2JlcmRldmljZXMucnU+Cj4gU2lnbmVkLW9mZi1ieTogRG1pdHJ5
IFJva29zb3YgPGRkcm9rb3NvdkBzYmVyZGV2aWNlcy5ydT4KPiAtLS0KPiAgYXJjaC9hcm02NC9i
b290L2R0cy9hbWxvZ2ljL21lc29uLWExLmR0c2kgfCAxMCArKysrKysrKysrCj4gIDEgZmlsZSBj
aGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290
L2R0cy9hbWxvZ2ljL21lc29uLWExLmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMv
bWVzb24tYTEuZHRzaQo+IGluZGV4IDYzZmFjY2ZjMTEzNC4uMGVmZDkyMmNhN2UxIDEwMDY0NAo+
IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1hMS5kdHNpCj4gKysrIGIv
YXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWExLmR0c2kKPiBAQCAtMTk5LDYgKzE5
OSwxNiBAQCBnaWM6IGludGVycnVwdC1jb250cm9sbGVyQGZmOTAxMDAwIHsKPiAgICAgICAgICAg
ICAgICAgICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwwPjsKPiAgICAgICAgICAgICAgICAgfTsK
Pgo+ICsgICAgICAgICAgICAgICBzcGlmYzogc3BpQGZkMDAwNDAwIHsKcGxlYXNlIGFsc28gc29y
dCB0aGlzIG51bWVyaWNhbGx5LCBzbyBpdCBzaG91bGQgYXBwZWFyIGJlZm9yZSAmYXBiCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2lj
IG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
