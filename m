Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51E3CC54E5D
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 Mar 2024 17:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6FUNXfF+l0t2F/ZwB1sspz0dav4EkP70fpsXCJ6o48o=; b=z54+0P4koJYMkB
	Fyqv8XOs9UHp0HU5GfMA8lGJ2SCdxk9XPPBFEhTceS5K7Et34kelcA3j15tRcZozRpULsqrwtX+qm
	wTjJzz1GhrLTwlS7OgsTogYc78zcjHK1pLQMin2RCjLWf0eWKH7rmUS97puVMK6qiJChTXC6Oetj3
	YSO9nZIizdPlFgDxYgpzMVHNZotyf8fTFzoMiaygx3P10m/a5nlDCKPh597Si13PdYnqUkQjnNB+p
	TTS/UEmzT7yrEtzs467xTZL/3E4SjEMIvgwkh2+Nh/+zMXFcSCu2Z5BsSXcPLFYaLMuZ7u1yknhTI
	0+pKGEVfey6zBReUaExw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk5x8-00000006rMb-1kSc;
	Tue, 12 Mar 2024 17:30:14 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk5x4-00000006rLU-3kT7;
	Tue, 12 Mar 2024 17:30:12 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-5d42e7ab8a9so3931040a12.3;
        Tue, 12 Mar 2024 10:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1710264609; x=1710869409; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GbJFRNdUX+AAn/XFov6URlQKxEMKvLoXoY0Vun2l91U=;
        b=iY9tWdHCAn/tWwd2pnK+CnmwcIGESaI5T0TmC6sl+wlMVsgFYN31PAVqPtlrzbc01f
         vTblD+RT8DlgQ/GFDzCf4fHsCPMTjS9rVF919KpUVrdHBQcuEmf4eQjR390QSVpT5tel
         RAEgekm8e7zFGDaTWvasIVXaHh9VO5Jgh1PcyPcvW0mjdVmJFyevdDz4I8X7SEzbDI3P
         nj5FqZ7qhQy5ijIOvSivPklXNxaO0Rg2GY/GuVmQQoYa/yw/SK5OTN1BZR8jo4ru4feU
         9YiOtmsEvPRoTkNYkx1azdJlk590ASRpe7VLO32F2NUnkUtB4MLQTsKMUSHnabHpUMYH
         +4uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710264609; x=1710869409;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GbJFRNdUX+AAn/XFov6URlQKxEMKvLoXoY0Vun2l91U=;
        b=OEXKd2AO72PCocQ1sSCq4slyjRO6P64mebgy90xMysPOvzMa2NQQA2j+dfD+hBf+ug
         l3CedoWksy9lduhQNV0QGpbAlcpYdLhfsXTB74/fkrGLPMvlJiPIQ2F/qmDoydJd5F6L
         ewrhnMiMBG/jz0C01gKsUcnkJernVci/GGV9HzE7XAMcqge4H9j0L0BT/vA2vD1/OUB/
         /4oqCxLk0zINCmTb7uuwYuA6zN9LwdAtn9ZsqqCH0NBgTWx/rQMJ2kCwrC7CVwfcxmLi
         JIrPoT5jJUCFHtzNTwCWwXrSyY2f5vL1v3rdfbuL2qG0nPmhEF/gHN3ZdAR6tHBZUd0B
         jcaw==
X-Forwarded-Encrypted: i=1; AJvYcCUjcycrHtpG3teyFcAr14whI3or1T49hOy5YHnmCjUZCGHaoyDaMUO9i/Yn1/3vleNLH9X0ELHRPbz6+L6e/ZiEzdlpiapHi220vXqD4arGwjstheJpsSjb4LVNOzFNM5kks4r5ZnxJA/OwOeIGyb3pOnRF1+/3tA==
X-Gm-Message-State: AOJu0Yw9YF3WBT2CzpQeb7CrZuenZPonfX1bsJy59g4HbfsU64a4jci2
	sdTkXatqGjThNDhFJcr12/hV6VQXP6YkxDU48AVxs08U4VALvRoZ5CW3E4bqbgfkNh8I6Z1YzEQ
	2XzOz5vxbH8n74kocL2t8gCaEHXg=
X-Google-Smtp-Source: AGHT+IEHlHIqKOnI30N6kEVdQF0v/F2N8qpv8I46MIfHZh1wIGIrafjKKa9W6hn0s2Ee0QJLBfQkS+qfb6XgN0IPhOw=
X-Received: by 2002:a17:902:d491:b0:1dd:b728:b890 with SMTP id
 c17-20020a170902d49100b001ddb728b890mr3078233plg.18.1710264609530; Tue, 12
 Mar 2024 10:30:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240312-basic_dt-v1-0-7f11df3a0896@amlogic.com> <20240312-basic_dt-v1-3-7f11df3a0896@amlogic.com>
In-Reply-To: <20240312-basic_dt-v1-3-7f11df3a0896@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 12 Mar 2024 18:29:58 +0100
Message-ID: <CAFBinCAvT6-gfZQH--AVJAxiVM9bv5=agYzJ-u3NZUGFvp2vZA@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: add support for A4 based Amlogic BA400
To: xianwei.zhao@amlogic.com
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, 
	Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_103010_952940_A052CC0D 
X-CRM114-Status: GOOD (  10.69  )
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

T24gVHVlLCBNYXIgMTIsIDIwMjQgYXQgMTA6MTnigK9BTSBYaWFud2VpIFpoYW8gdmlhIEI0IFJl
bGF5CjxkZXZudWxsK3hpYW53ZWkuemhhby5hbWxvZ2ljLmNvbUBrZXJuZWwub3JnPiB3cm90ZToK
Wy4uLl0KPiArICAgICAgICAgICAgICAgYXBiQGZlMDAwMDAwIHsKTm9kZSBuYW1lcyBuZWVkIHRv
IGJlIGdlbmVyaWMgLSBzaW5jZSB0aGlzIGlzIGEgYnVnIGl0IG5lZWRzIHRvIGJlOgogIGJ1c0Bm
ZTAwMDAwMCB7Ck9yIGlmIHlvdSB3YW50IHRvIG1ha2UgaXQgY2xlYXIgaG93IHRoaXMgYnVzIGlz
IGNhbGxlZCB0aGVuIHlvdSBjYW4gdXNlOgogIGFwYjogYnVzQGZlMDAwMDAwIHsKClRoZSBzYW1l
IGNvbW1lbnQgYXBwbGllcyB0byB0aGUgYW1sb2dpYy1hNS5kdHNpIHBhdGNoICg0LzQpLgpBbmQg
d2hpbGUgaGVyZSwgSSBmdWxseSBhZ3JlZSB3aXRoIEplcm9tZTogaGF2aW5nIGEgYml0IG1vcmUg
ZGV0YWlscwp3b3VsZCBiZSBncmVhdCBzbyB3ZSBjYW4ganVkZ2Ugb24gd2hldGhlciBhIGNvbW1v
biAuZHRzaSBtYWtlcyBzZW5zZS4KRm9yIHRoaXMgaXQgd291bGQgYmUgaGVscGZ1bCB0byBrbm93
IGhvdyBtYW55IElQIGJsb2NrcyB0aG9zZSB0d28gU29DcwpoYXZlIGluIGNvbW1vbiBhbmQgaG93
IG1hbnkgYXJlIGRpZmZlcmVudC4KCgpCZXN0IHJlZ2FyZHMsCk1hcnRpbgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5n
IGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
