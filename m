Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B78BEC6FD1C
	for <linux-amlogic@archiver.kernel.org>; Sat, 11 Mar 2023 21:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sDmsaZN6ttcJou5pijDzSyCXNPwmXi4gdljQm0mOqjs=; b=PDPoYVONc2NF4+
	MPTpsh54qkOqErNFG+ISAMh3YoP5kMiiFky1NBWhevl+EL7xjbqGaqzyXqJA4QnwkH2KLWTjYx2O7
	BuR705we5OVYIiOyGpvmJ5AEKbWKMRdBaaqhHCD7JQwixQcbRIIYkvwfdOUl6kCT579221sQgu9wj
	vmDhN9o95yb+FXbAHLjtj4mYe+WVqqNaYKdsMXp2Ie12iDmIadkIFV/V1+t7wjTu0NV3kp02UZxmP
	f12JAVMu3zxQjir9hLaUslNSwvQDvao+jgUtuOhv5YqS1lZtA4ILvUthJvOhnm30rGJkEXnW8FRUg
	L87yXUNjrPhcDqcsGDOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pb6Ls-001F0x-0p; Sat, 11 Mar 2023 21:02:04 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pb6Li-001EyU-JC; Sat, 11 Mar 2023 21:01:55 +0000
Received: by mail-ed1-x533.google.com with SMTP id g10so5322526eda.1;
        Sat, 11 Mar 2023 13:01:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112; t=1678568511;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mqLiLsZSZqkghPgueB9X9yY17FbUEdbpIwT7a5FTGHQ=;
        b=ahu2SILpBVmjIN/fyu8SXMNhCl85Y6wEUwLo8mfsBvX2hPGiJilmcEdlX3yWE2Moyp
         N9muMb0BsILbEQxbvGT8dTcTEgqzHAkVH8SMDB7hKDDadT7tQyfWZV+6AllBg7R1ljhR
         A7HlWu4jQkj9Q8u/3KH8GMpc4ooxjlzde38Jj5faLL1o0ufoRIkLZOzBzbeHTvbg55x3
         PjZrt+MYSDWIyd90r5ppRdDc9vGvCVL1VfixYgFFj9WvRHywzmqtqB2swIFxdF7Tod/d
         WSRQAiwVU7yP3oAv7YqJDrfZgKj5ZAoPKVdO9JtqTBdtzfkMUA0fxmtAC/wbqBTN9MXW
         nPHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678568511;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mqLiLsZSZqkghPgueB9X9yY17FbUEdbpIwT7a5FTGHQ=;
        b=Z6BhPxb0wAcDqARa+azar4HrJrRIy3gzOiqeeAndPEwv6CNZ1pzIa7L3l/Hx9D3RWZ
         K9aRbkx0Ed3kaMTkqiYq35OdH4J60inlMPmnomt8sCH4SjKgaZCPejAUSS9XaHrlgqEL
         D6M5Q/WCj8Bho0dVf8KRdjiQNbgE/I2aUA6tmHJ62qeLXOVjcQqZYopbAY2nEB3gGvaL
         9YLjSkG4dxYkbNgR8ZXUPkN9dNAzOwr9JZqU4PPp8i6C2LUMXMViV+zZbYyhz8UQ/U/1
         I22/8DkWdHSH4LlYSKCkG/qSojBo4QQc6goEKqkGmlyVwwsJVo+Apn/6WiXOoY0FCAqE
         zDmA==
X-Gm-Message-State: AO0yUKU2WuUt7wIzmo41mBu6nkf1vYsDTdLc0Qzs3XnOgjWHe35mGE1g
	NoubHQbp5bJQpWl0HJUCsLyqR6fxz0z+phXGcTdp3QK6ltM=
X-Google-Smtp-Source: AK7set9T7FoO2Nq2LlElL4QVevBogC3v/8RbnuqWg65zLah33pZl2isqrJhvphk/gfAO/Pw7SKdcFzIHpctQPPCAVjI=
X-Received: by 2002:a17:906:a3c2:b0:8b1:78b7:6803 with SMTP id
 ca2-20020a170906a3c200b008b178b76803mr15132394ejb.4.1678568511360; Sat, 11
 Mar 2023 13:01:51 -0800 (PST)
MIME-Version: 1.0
References: <20230311111423.251383-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230311111423.251383-1-krzysztof.kozlowski@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 11 Mar 2023 22:01:40 +0100
Message-ID: <CAFBinCC3eWMdS5fH=HBLt1ET5r5jXhc51FVfXjGa62z+FjyJ-Q@mail.gmail.com>
Subject: Re: [PATCH] irqchip: meson-gpio: mark OF related data as maybe unused
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230311_130154_668120_87A4D110 
X-CRM114-Status: UNSURE (   7.34  )
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

T24gU2F0LCBNYXIgMTEsIDIwMjMgYXQgMTI6MTTigK9QTSBLcnp5c3p0b2YgS296bG93c2tpCjxr
cnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+IHdyb3RlOgo+Cj4gVGhlIGRyaXZlciBjYW4g
YmUgY29tcGlsZSB0ZXN0ZWQgd2l0aCAhQ09ORklHX09GIG1ha2luZyBjZXJ0YWluIGRhdGEKPiB1
bnVzZWQ6Cj4KPiAgIGRyaXZlcnMvaXJxY2hpcC9pcnEtbWVzb24tZ3Bpby5jOjE1MzozNDogZXJy
b3I6IOKAmG1lc29uX2lycV9ncGlvX21hdGNoZXPigJkgZGVmaW5lZCBidXQgbm90IHVzZWQgWy1X
ZXJyb3I9dW51c2VkLWNvbnN0LXZhcmlhYmxlPV0KPgo+IFNpZ25lZC1vZmYtYnk6IEtyenlzenRv
ZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4KQWNrZWQtYnk6IE1h
cnRpbiBCbHVtZW5zdGluZ2wgPG1hcnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxv
Z2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
