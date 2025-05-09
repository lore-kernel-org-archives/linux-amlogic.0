Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24C41C3ABC9
	for <linux-amlogic@archiver.kernel.org>; Fri,  9 May 2025 17:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i7T/KcWjD9i9FXvKW2eZGL0XCPdoLZaZTHILCeI6X48=; b=rNeCCvEXdrksR4
	0ZwT40FOBg/fiAsDMQfkxSGLz8brQeEbo5M7GR30MIRoMcJOikBaYGiLIcUmxZWrtlg3sX1jJTniG
	o5+ODY0LD0y6Qn7yT4vi+qUJVY7qgGsgFxpiO1kNvV9lSYNN3I2VqhlAUVJhLfv7vV6viMJ84RFRb
	zpj/S4jg3BKbZUzGJzoDIGl5TGmO1bMirlKX18UO2gF653DxyAbXbzIR+5FzCnXYZ7Y4s/h9bcoE/
	GV5IPTN3fYRrM1Ib0rAtWp6ICXEWI/XBnh/hTci8P0GCkfI33ZxgQlRQIdQM/V7fnrozQIEhguFwX
	7vz0GzttXOfdnKK4Pxgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDRlQ-00000004TBR-0vIY;
	Fri, 09 May 2025 17:44:00 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDPnq-000000047Fr-3Xs0
	for linux-amlogic@lists.infradead.org;
	Fri, 09 May 2025 15:38:24 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so23705425e9.1
        for <linux-amlogic@lists.infradead.org>; Fri, 09 May 2025 08:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746805101; x=1747409901; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TBLBH35fihBkmIGbw4EWVRYhi7XRZ3Q7hPPc7aK4Fu4=;
        b=lFS2yEV4YpwCiRUqIFSIfWS5ShBMvcneLJ63Ihuqq8/PPO0AaBsO0k9ruzvvxw0ks8
         hnlGU9AXjzC2RkL1jU+03QtqGl9hboVsCUod7W2fT6QKHefp6tYHBLwBSyuTK/K1/Tdn
         9hlifXkLIQgclB1+3uWRTYvbu5t/H7IfB8QL4duEwkdJGrAA8bkm8mB1qXXQfjIlRNag
         PrLfhg/Fj6qkgcsLFWPdjajSSL6dWambkFgnDdLM+9uiEDvPP6PKVmhoGc6wJZzSC+dE
         D80u3UNMg6ABNQpSHnnA8IvqfW4POcagh37rkRvc3kJXaPIUVFXPExPh/e4mwZsN8xW1
         0BcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746805101; x=1747409901;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TBLBH35fihBkmIGbw4EWVRYhi7XRZ3Q7hPPc7aK4Fu4=;
        b=XqJ7xHrKHu8JpLBOc7gYbaQrGKTgiiwmpXceB7fFovQLWdg5snnmq4YXgwl8zUcc/B
         wmMWEwnB9Ta8kRuQNuyO0DLuKIwsl/3KH0UxQGJOA9uD2M3gxHUHjEOlFKV1GIzseahz
         GC2VYUCuwFT2n7ahv0Ij4J/hh3HSxrohpYjrIQOngD2mHLghM3Xmkg3+GDbY8/BTF7Ia
         apfrQWDM9bSFnrZYKf+G2nRvufXCNtr366+nIfVCqYwCBAulhQN2VuTjMaHV0A/GCKpI
         fXDRPOYFxmKJu0m0klln2XHq1YAtf3XvbuV/gDWPSxwfbQE3iUvXeBgFVDukCmZR1uhW
         eDGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYHKq30dDOSMrSSahqoOMkP4BXGJXSjg1kRLYEDfjdfz+ztVANMVxEb7zxi6sX3fRKq89lYZsUfTJJ+b+W@lists.infradead.org
X-Gm-Message-State: AOJu0YxnvnfzNoB6jUMf00RuzY349F7LZCa3dDw7YHUT6SpjBsgA6CCT
	Yaw5Ton0n3iokHDz2UVL6LtUTAmPHAXckHK4fnoTZgu+ZspgMeL3vbBfT/jWy8M=
X-Gm-Gg: ASbGncsH/U66AEjMok7N06rIFcOZQpspzY8L7b7S80cj1N5hXa8rtTGl/AGYevq8LXq
	LSe4/NToiD2MksvgbIVY3GmUB+bFeqmm1tUzQFUPODJTO64PhiHhIEDbwR6jP7tgNUU2PLS9ak0
	zEhfDhJwa47QcdmI35G70PRoeEzyH/+WpZ/x1fBkg9PVrgNiCvjhWtAqFBTOArjn/yS4QDdTGj1
	d0KRGS5Nyl4PO3ssc35y9fMnUqgYaTeVFz7XqGbtQ9znmIHGaaTbxPlkMGJ361jiJVLnNBPYWHf
	Bcurnj/tAFjzwY7ghJkmXwG18hVVlrp/lyZDJXTd7/K7wOLhbQRi1ZMyiLBYw0PV5dO27TAp
X-Google-Smtp-Source: AGHT+IH4IMLRaSDitW8aRp2/HH30bVFdM1w5jTbdL4Xe/FdZrAqsFjuKiUSdh0mozDMKtmaE8Kz62A==
X-Received: by 2002:a05:600c:8205:b0:43b:c857:e9d7 with SMTP id 5b1f17b1804b1-442d6d98a88mr32790695e9.5.1746805101395;
        Fri, 09 May 2025 08:38:21 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58ebe4fsm3663912f8f.39.2025.05.09.08.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 08:38:21 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20250323-fernsehfee-v1-0-2621341cd37a@posteo.net>
References: <20250323-fernsehfee-v1-0-2621341cd37a@posteo.net>
Subject: Re: [PATCH 0/3] Board support for Fernsehfee 3.0
Message-Id: <174680510066.3108291.15538800849859736861.b4-ty@linaro.org>
Date: Fri, 09 May 2025 17:38:20 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_083822_888489_C1D4FA47 
X-CRM114-Status: GOOD (  11.90  )
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

SGksCgpPbiBTdW4sIDIzIE1hciAyMDI1IDEzOjM3OjQ5ICswMTAwLCBKLiBOZXVzY2jDpGZlciB3
cm90ZToKPiBGZXJuc2VoZmVlWzFdICgiVFYgZmFpcnkiKSBpcyBhIGZhbWlseSBvZiBzZXQtdG9w
IGJveGVzIG1hcmtldGVkIGFzCj4gYWQtYmxvY2tpbmcgYXBwbGlhbmNlcy4gVGhpcyBwYXRjaHNl
dCBhZGRzIGJvYXJkIHN1cHBvcnQgaW4gdGhlIGZvcm0gb2YKPiBhIGRldmljZSB0cmVlIGZvciB0
aGUgdGhpcmQgZ2VuZXJhdGlvbiwgRmVybnNlaGZlZSAzLjAuCj4gCj4gWzFdOiBodHRwczovL2Zl
cm5zZWhmZWUuZGUvIChHZXJtYW4pLCBodHRwczovL3d3dy50ZWxlZmFpcnkuY29tLyAoRW5nbGlz
aCkKPiAKPiAKPiBbLi4uXQoKVGhhbmtzLCBBcHBsaWVkIHRvIGh0dHBzOi8vZ2l0Lmtlcm5lbC5v
cmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2FtbG9naWMvbGludXguZ2l0ICh2Ni4xNi9hcm0t
ZHQpCgpbMS8zXSBkdC1iaW5kaW5nczogdmVuZG9yLXByZWZpeGVzOiBBZGQgVEMgVW50ZXJoYWx0
dW5nc2VsZWt0cm9uaWsgQUcKICAgICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9hbWxvZ2ljL2Mv
NDBmOTgzYWEyZDgwOWI0OTM0YTI2MGM3NmI4MmU5ZmYxOWMwOWE4OApbMi8zXSBkdC1iaW5kaW5n
czogYXJtOiBhbWxvZ2ljOiBBZGQgVENVIEZlcm5zZWhmZWUgMy4wIGJvYXJkCiAgICAgIGh0dHBz
Oi8vZ2l0Lmtlcm5lbC5vcmcvYW1sb2dpYy9jL2ViN2FmMTI2OGUwMDQyZTgzNjA3OTE4MjI5Y2Q2
MmMzNjY5Y2RjYjgKWzMvM10gQVJNOiBkdHM6IGFtbG9naWM6IEFkZCBUQ1UgRmVybnNlaGZlZSAz
LjAKICAgICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9hbWxvZ2ljL2MvZGFjOTI4NzU3OTI4YThl
YTA2ZWFmNTY5NGQ1ZGVhZTUzYTIxNjE2ZgoKVGhlc2UgY2hhbmdlcyBoYXMgYmVlbiBhcHBsaWVk
IG9uIHRoZSBpbnRlcm1lZGlhdGUgZ2l0IHRyZWUgWzFdLgoKVGhlIHY2LjE2L2FybS1kdCBicmFu
Y2ggd2lsbCB0aGVuIGJlIHNlbnQgdmlhIGEgZm9ybWFsIFB1bGwgUmVxdWVzdCB0byB0aGUgTGlu
dXggU29DIG1haW50YWluZXJzCmZvciBpbmNsdXNpb24gaW4gdGhlaXIgaW50ZXJtZWRpYXRlIGdp
dCBicmFuY2hlcyBpbiBvcmRlciB0byBiZSBzZW50IHRvIExpbnVzIGR1cmluZwp0aGUgbmV4dCBt
ZXJnZSB3aW5kb3csIG9yIHNvb25lciBpZiBpdCdzIGEgc2V0IG9mIGZpeGVzLgoKSW4gdGhlIGNh
c2VzIG9mIGZpeGVzLCB0aG9zZSB3aWxsIGJlIG1lcmdlZCBpbiB0aGUgY3VycmVudCByZWxlYXNl
IGNhbmRpZGF0ZQprZXJuZWwgYW5kIGFzIHNvb24gdGhleSBhcHBlYXIgb24gdGhlIExpbnV4IG1h
c3RlciBicmFuY2ggdGhleSB3aWxsIGJlCmJhY2twb3J0ZWQgdG8gdGhlIHByZXZpb3VzIFN0YWJs
ZSBhbmQgTG9uZy1TdGFibGUga2VybmVscyBbMl0uCgpUaGUgaW50ZXJtZWRpYXRlIGdpdCBicmFu
Y2hlcyBhcmUgbWVyZ2VkIGRhaWx5IGluIHRoZSBsaW51eC1uZXh0IHRyZWUgWzNdLApwZW9wbGUg
YXJlIGVuY291cmFnZWQgdGVzdGluZyB0aGVzZSBwcmUtcmVsZWFzZSBrZXJuZWxzIGFuZCByZXBv
cnQgaXNzdWVzIG9uIHRoZQpyZWxldmFudCBtYWlsaW5nLWxpc3RzLgoKSWYgcHJvYmxlbXMgYXJl
IGRpc2NvdmVyZWQgb24gdGhvc2UgY2hhbmdlcywgcGxlYXNlIHN1Ym1pdCBhIHNpZ25lZC1vZmYt
YnkgcmV2ZXJ0CnBhdGNoIGZvbGxvd2VkIGJ5IGEgY29ycmVjdGl2ZSBjaGFuZ2VzZXQuCgpbMV0g
aHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvYW1sb2dpYy9s
aW51eC5naXQKWzJdIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwv
Z2l0L3N0YWJsZS9saW51eC5naXQKWzNdIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9s
aW51eC9rZXJuZWwvZ2l0L25leHQvbGludXgtbmV4dC5naXQKCi0tIApOZWlsCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWls
aW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
