Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5520AC47DD9
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Feb 2024 21:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V7lNWpfWTRm1N1ngfTINPvV6vzUmJLnMVUFdS7wkmpU=; b=hV05MHgX0Lc8Xo
	b1LTiyRHieDh3LWP81O7OtUFGzvPXLoJ6nIRlxInLa0AjQiPEmvia1Vc0KyrMS1Bop6JtAba6/7y7
	jiSKwbddWj/DTgH7jTjqKNPKWyCxrdv3F1ztezzSsy8vRQYtsdtXe9D0my81Jsw9BfQGin1a07bCJ
	JyP9gobcBctCnn9/PT76J5VdrMOsC2n2IXOBP5Xo9reOEMInFyn5/u4KekpvWlChYsCGv/vFgnhLV
	7jf1TvQiCdvalWwRo/1DIrzmEbSMas+iexhB1WPZt9ZH4TwxYnUsMq0lEheb0dIWZwq6+ecal2RRh
	iYALRaGOBJEJPWdMSWBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdH4N-00000006ks4-2aCH;
	Thu, 22 Feb 2024 21:57:31 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdH4H-00000006kmj-3xs6;
	Thu, 22 Feb 2024 21:57:28 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1dc29f1956cso1102715ad.0;
        Thu, 22 Feb 2024 13:57:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1708639033; x=1709243833; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pgirAjgozx3q0jtmvrwCmz40wwbJnIl2DI5Cq05LY48=;
        b=GNqolXsuiiE1OFKgX+4LU8Ee9acTayDHpp4MBc7bhn4YBhWiqyFDFeYwkjO3IKhlyD
         clop5fNph6s632MMEZHhRuUd03+9QpXxg9IHt22UqO1F7Rv7NTIljsquBRBcxtZVpqZG
         qABgm3YoXEELV+lGs73WkxXO/Oe2yoc9I65rYN/77RYATKFxP94mF08kNwQH3G1NKDPR
         xov4yEe4nObz6Ja770JzZAkaA741rkqeIvq2iHsE6xOoBit4DYIPQEqyJcRllO0Al7gK
         gmOiEhTL3RADF0h8U7iFnMp8rFy0gvvF5qWwc1k+IBSCiWGjNhs+FLXAWDq2+dqvTwhx
         AC/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708639033; x=1709243833;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pgirAjgozx3q0jtmvrwCmz40wwbJnIl2DI5Cq05LY48=;
        b=WONOjo1ShAxL9msqDBCc6cpKJ/TCjowLZ3PsJJOM7go/FVYNcldj5oUM+lghpCPfdU
         cOjhaSOlCuCrM90B7QkZgsyDfZ/Lt3RLnsUdX7LUZT7F1llyvm2XKDPBumZz41VsHLd+
         cBxYwEFLwz3PQcil3GSVllTGX9vTVv+GgiaV86U/oz9VtiOiBGn39o+S1x6EfiwSqylX
         fdQ2/G5V69QLMd4CVhB/bAqP/NlrPJy/hcCjcFXXBu+yHt2aHO8aIwpasHL7b8obnW0g
         B1K5hyMSGP2tPCaPImsHQYHKjBmxMKw5aJjPQSsvUfqd/tvaKPoJlwdbSGzzT4cDkqGT
         dQig==
X-Forwarded-Encrypted: i=1; AJvYcCXGKJFhjWRkYd/xcX/U5k11FAnJ0lXoB6mZwWKPZKB22kOAwGpSnxa9mA/CAzFRftmhr+oDAKE9yhQGk7CaQYJHG/3zk5tCz6VMwfNiw72ndLiYPT0a2wpprKay88EelTkclAYMiRoOVNB3RVpfqtbxtzE5E2Mwjg==
X-Gm-Message-State: AOJu0Yynq7ODhACRglo8yjpTIvz2e9zcjQ1S6piZIl0puKbZhdm/N1Ck
	yKFTypj+grW00DsAjsUEF2tOQHCZ6K71b7lDaGtIxG8QaQIHfvez3B4vp4eimGFY+FxK9z572ND
	bRI4ljRbz06E8SnIYP3qDufTV1/4=
X-Google-Smtp-Source: AGHT+IEm9B/mvpiEx8gGi1zFhrDKulngHY9tDJY0E+4OGsUujBGeO9/jRJU1a2bx5xoWs3aQ2Sb0vnEuUwfnp+zi7v0=
X-Received: by 2002:a17:902:d2c2:b0:1d8:b51c:6b79 with SMTP id
 n2-20020a170902d2c200b001d8b51c6b79mr191038plc.7.1708639033599; Thu, 22 Feb
 2024 13:57:13 -0800 (PST)
MIME-Version: 1.0
References: <20240221214348.2299636-1-martin.blumenstingl@googlemail.com> <a4f8fa60-7c03-4946-a135-a405d53f361b@linaro.org>
In-Reply-To: <a4f8fa60-7c03-4946-a135-a405d53f361b@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 22 Feb 2024 22:57:02 +0100
Message-ID: <CAFBinCA3ho9fAb-iJhUEVw-=_Jbgd6UU8_9WEyvpt-+CL_V6ew@mail.gmail.com>
Subject: Re: [PATCH v1] clocksource/drivers/arm_global_timer: Simplify
 prescaler register access
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, patrice.chotard@foss.st.com, 
	linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_135726_037611_53D9A20A 
X-CRM114-Status: UNSURE (   8.26  )
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

SGkgRGFuaWVsLAoKT24gVGh1LCBGZWIgMjIsIDIwMjQgYXQgMTE6MDLigK9BTSBEYW5pZWwgTGV6
Y2Fubwo8ZGFuaWVsLmxlemNhbm9AbGluYXJvLm9yZz4gd3JvdGU6ClsgLi4uIF0KPgo+ID4gICAg
ICAgICAgICAgICAvKiBwcmVzY2FsZXIgd2l0aGluIGxlZ2FsIHJhbmdlPyAqLwo+ID4gLSAgICAg
ICAgICAgICBpZiAocHN2IDwgMCB8fCBwc3YgPiBHVF9DT05UUk9MX1BSRVNDQUxFUl9NQVgpCj4g
PiArICAgICAgICAgICAgIGlmIChwc3YgPCAwIHx8IHBzdiA+IEZJRUxEX0dFVChHVF9DT05UUk9M
X1BSRVNDQUxFUl9NQVNLLCB+MCkpCj4KPiAgICAgICAgICAgICAgICAgRklFTERfTUFYKCkgPwpP
aCwgSSB3YXMgbm90IGF3YXJlIG9mIEZJRUxEX01BWCgpIC0gdGhhbmsgeW91IQpXaGlsZSByZXNl
YXJjaGluZyB0aGF0IEkgZm91bmQgdGhhdCB0aGVyZSdzIGFsc28gRklFTERfRklUKCkgd2hpY2gg
SQp0aGluayBpcyBwZXJmZWN0IGhlcmUuIFdoYXQgZG8geW91IHRoaW5rPwoKCkJlc3QgcmVnYXJk
cywKTWFydGluCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1h
bWxvZ2ljCg==
