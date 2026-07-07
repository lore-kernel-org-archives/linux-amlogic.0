Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D38BC43458
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Jul 2026 19:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9stihVB7UsVF0OQYEtVQWmsgQnlz/3QncfMNTlWjXOo=; b=eM2UUpXLGYTRCc
	tKw57tJ2+Hzzb5RfW/wCyaEtKQV1a6KqxrPvMWm2IwGhgYmlx8Zk046bmEbkGmKPHxS362wz6Ea31
	OeK7DapVMCH/1M0QTh7N5Trjj7V6qc7OmOuNMyczPbaenNCeVM6128+yXtVBpm47Ja+pN+PnhES3b
	I4z5x/mllRl2D6qZo8Qaz8ihPVdduXYQycIXZCL0JXOBRDoPq1gYV0zyXc3E3D6UsgQBr0LvrPJ3O
	fQvs1gq23tlNkx+SHIlK8WQQJZdSjMlI8DRNnDrf9o8U3xxm5OYIz+4/2GHa6A+HpbpWZitQZPwZ6
	vNzjAV6yzZPtJHBIuYKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whBhP-0000000FnAr-28Lg;
	Tue, 07 Jul 2026 19:43:19 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whBhM-0000000Fn9w-0dSX
	for linux-amlogic@lists.infradead.org;
	Tue, 07 Jul 2026 19:43:18 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-381b831d535so5270324a91.0
        for <linux-amlogic@lists.infradead.org>; Tue, 07 Jul 2026 12:43:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783453395; cv=none;
        d=google.com; s=arc-20260327;
        b=Pme/Z+HAaAhRLrSe0vGDVzhdN5eqn7d0sqpvkCf//D5erKKetsObXa/IehAkdIBCkJ
         5ozYk4bJRL+WwVT1dTb/OyLbY9lFOWgOieBPag4SH96geCDvQT+IAUKck6R5CsN9IJ/8
         XpOni3kh5I/9bx2BcFPDT/l+b+OrXZg3AyLqlPn/2luZ/V4/pHIp7UuWgFXl/4DeTNQK
         EjkGEZ1Pt+uSH/XCyTtJoZdFX+KWYcEWTomITfCxt7lGkG5oTplAvupjTaXc7jIVly5y
         nmeJhz1MAoVBlfSNHrrkLZJRsCKAuBhURnhimueeiZeTtseqgRUJjhEE6GRbpIIB3QtE
         dUgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QfT1yL0KZE9kc3QIXQAHQN2bdjQ2tBY3krHPlSith7k=;
        fh=19js+ij5eSe44Ut3+fVzgUlD8wd8xgU8o58Y2dXtdT4=;
        b=lvM9KA/32kfTgEQrb7F50jRgk7IblxIWfFNtm6NH0W2Q0CyFrXOD11B07SUoEgGlV1
         revu5XCFOq2xMJVxERFojvf+gAYkv7EncHIaxP7djbajzZ+NUjN+7E/YS4r4ZODM0uVg
         vJTWXkcgSGir3rQFGGle4DDtS9ya6AzcR34hJJYFzPYtz0XgpOF28uShCLRb6BGUrRrF
         faULIMvfrbUC/5mEbxGU+tguQYvQXg2OmGD4/T8pk1wlBuoQKEzbJBcY7vEpH52Po4ay
         VuK+vNkO4WtWdlRoioJ47vdlxQ51XrpQKsYMYCrVZ4hFMMcLpUy87q7kkseYZu7nkDV7
         VMwg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1783453395; x=1784058195; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QfT1yL0KZE9kc3QIXQAHQN2bdjQ2tBY3krHPlSith7k=;
        b=DGXwAn2Sf9PTsGVyvrZIp8aVyH4kzYPWMmc3v8XNtQgG/ffEV98Oh8MsdtfPS0mbKf
         czwG7cC+6nM/UzZv5CZNEh/U0u9HNjqhj/M61uhGhORCwH8Yj1hf9AkJYeA780qsYXQa
         qYSMmi2nUJ5MJ/JWHiG92kyUNullM3Nq36AIlG2r8gJFqdeWZB+x+L5BmK+K2mG1aKaB
         PDd6UcniNtL23Z7Q5j7LRayjNk5L56Dsq5Ab5CN9VE3s10kO0qaYcb3YkkGs0nhQEG4E
         WaDBsI/Y1hAw4P3RTDcQ/MT979gqc1rTodTeqO3APb0s/PTvUlvoiZ7foWjqstVs/Go3
         69kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783453395; x=1784058195;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QfT1yL0KZE9kc3QIXQAHQN2bdjQ2tBY3krHPlSith7k=;
        b=OM7IT8875YHjvZ3sSCFXYbdzYFoya2ecwmgtpDViVEhBdvaccoiju05jF8RxiADBqp
         zaiIrTH1G4fXBrIVcOTzVQT7V3IvIDsSqxxF61As/qKxQrlVYrzkrTZrJkhX/UZPc5YZ
         FvcKJn6ZTXKVFAOsJCdqAWfTg4vWNdQ4wNlraegEXjmXRvefySsevAV5WLjKQVTTzyUc
         rnyF5kGMEbbg401Cn3fddtl4Lkd5/CoOQj2d6XcPEDueMdoXBzuoCGiMTKBkm/8EDZaU
         wCU4L8VTzYUriM1JP6mHKpD3d0bTyzXgKu7XWHju70Bu0izTA8RvAxcy0PizuH1nf7LV
         EVuw==
X-Forwarded-Encrypted: i=1; AHgh+RrCvw0QWHF2QfKwUiv8pTh8WgDrQqGlHIbvMXgvJR0ONUa1/pnZB129A8vXM2tHNmrEFi8g152eQF32Qmcy@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2iZpSbSmhM7dWgyk745NUzJ5rv91JPoXb957dA9Sw5Oo9yD3w
	ypr5uUM0LC/x02ThhSiWRE22pOzRe+Xqj9f2j4VPtmICBdpg43bxd4s4Nxq1pm59CbBtQ2TC9Dp
	CcpGdi6hID9EaKpYaWEtlSBh057pamgw=
X-Gm-Gg: AfdE7cnId8N5Bqsag+qIWPwo5kdr2VU7AleWWAHHsV6aaD4qIRfDbfY4j7Ag6+Oijwt
	fu2i0EWVjqAVgmAxf+mOrsFThiMo8vlIF/mZ7kdpaVTLNjpOL24CwlVh7QdZ05l87Hipl1SmOoB
	Vl7MelBRoAnwXNxHeZA+vVBb1uYDS+kOQ1XNT18xfOtLPBlb+ozz0q9xydF3ho8Q0qdr92S7cUB
	/TbwQsSCwRhEvMN2fsw25ZHMbmSsVMhurKBl7y7DB0+coBww8abPY0/lQdkGQXgjoaCbKDj7uTL
	9fYvt+Cl3gG9kV7XmswBqGylRw==
X-Received: by 2002:a17:90b:538e:b0:381:792d:f993 with SMTP id
 98e67ed59e1d1-387581641f9mr6285677a91.17.1783453395185; Tue, 07 Jul 2026
 12:43:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260702-add-mcu-fan-khadas-vim4-v8-0-244feee91a36@aliel.fr> <20260702-add-mcu-fan-khadas-vim4-v8-7-244feee91a36@aliel.fr>
In-Reply-To: <20260702-add-mcu-fan-khadas-vim4-v8-7-244feee91a36@aliel.fr>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 7 Jul 2026 21:43:03 +0200
X-Gm-Features: AVVi8Cedwny1fGm0XunQLag-buYK9YXt9UTwEp4HfqUu3ncRpwQYM0HDkqsD-q4
Message-ID: <CAFBinCAejsnBhUy6TZwjgNzuVp8Pa-vTB88NBgzNVcDSAyyenw@mail.gmail.com>
Subject: Re: [PATCH v8 7/8] arm64: dts: amlogic: t7: Add i2c controller node
To: linux-kernel-dev@aliel.fr
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Beniamino Galvani <b.galvani@gmail.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_124316_210096_BC9220DD 
X-CRM114-Status: UNSURE (   8.67  )
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

T24gVGh1LCBKdWwgMiwgMjAyNiBhdCAxMTo1N+KAr0FNIFJvbmFsZCBDbGF2ZWF1IHZpYSBCNCBS
ZWxheQo8ZGV2bnVsbCtsaW51eC1rZXJuZWwtZGV2LmFsaWVsLmZyQGtlcm5lbC5vcmc+IHdyb3Rl
Ogo+Cj4gRnJvbTogUm9uYWxkIENsYXZlYXUgPGxpbnV4LWtlcm5lbC1kZXZAYWxpZWwuZnI+Cj4K
PiBBZGQgdGhlIFQ3IGkyYyBjb250cm9sbGVyIG5vZGUgdXNlZCBieSB0aGUgS2hhZGFzIFZJTTQK
PiBmb3IgTUNVIGNvbW11bmljYXRpb24uCj4KPiBVc2UgYW1sb2dpYyxtZXNvbi1heGctaTJjIGFz
IGZhbGxiYWNrIGNvbXBhdGlibGUuCj4KPiBSZXZpZXdlZC1ieTogTmVpbCBBcm1zdHJvbmcgPG5l
aWwuYXJtc3Ryb25nQGxpbmFyby5vcmc+Cj4gU2lnbmVkLW9mZi1ieTogUm9uYWxkIENsYXZlYXUg
PGxpbnV4LWtlcm5lbC1kZXZAYWxpZWwuZnI+ClJldmlld2VkLWJ5OiBNYXJ0aW4gQmx1bWVuc3Rp
bmdsIDxtYXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxp
c3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
