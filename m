Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 350D4C87FC9
	for <linux-amlogic@archiver.kernel.org>; Sat,  2 Aug 2025 10:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i5ECRuG1MEtSLb313ffu5SlXdc8vaVy+sO2m1ZOWfCo=; b=hwFI2dxR00vtNX
	b4gA+dLeWCVcF+GTN0GqW6udss/d/ysEWKtSae8dEnTyUUIbLkK9oxvyyGWD7zwz//m0EVq4bp9kq
	CeVP0D1L9PH13Iw74PJSJPkN2c3xAEz3/SV5aeNvkkUo4qaQgpA/dcxuADiCpQVGLw+E4En+8lX9s
	CpGmSojro4YydSHoUKpHDTA0SvT8tQ4ZqVMtzUMXD7H3WpjnLzPdv7i65gNKrlSJIK14WywFclATl
	xwwiYHgX8yPHW+u19Ib4NgGWXnlGqZhTNTFJyPhPTbIXLdKEmNUwnSG2SLEJKGiplPhHqTrgy7hmF
	373dNejnP1GLjA1Vli7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ui94H-00000007WUs-0Wlo;
	Sat, 02 Aug 2025 10:02:21 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ui94E-00000007WUY-22dI
	for linux-amlogic@lists.infradead.org;
	Sat, 02 Aug 2025 10:02:19 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-23fc5aedaf0so19468575ad.2
        for <linux-amlogic@lists.infradead.org>; Sat, 02 Aug 2025 03:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1754128937; x=1754733737; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SunfwaMKGIuht1NXta7qE72eMa+DmpHbef3GOE9+HT0=;
        b=nHIPfRGkGXKpLBe0E+HbbVl55MdFbkDtTqdRWWXo8mZSboDTn85Vy7ziqsT+0GP/zW
         trA1u+szpSjxiU8B2MUTkA6F6n50GCF0w/SkqMVNn7d5/WwcfPOcv8stKBKVW2HLV5Sy
         i9LZdwUL/bz1NPTepFTFirf4n4eerkEcN5/SVt0p6Erkg4FEkLVa06MSOI4I6njPHCJI
         aFA+lx6iiKlbuzwJpDa5jm0IoZywxxaaYv2sdRcncuKoTHNSGNaQ3yzLQgJaoD3FTpg6
         kcWiX4rGuCVR5SCHq4UVMiGfxivXoSEUSN3XCH/g1MmD8e+9+x2p6MvbUhf3LBjrE1TL
         BEcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754128937; x=1754733737;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SunfwaMKGIuht1NXta7qE72eMa+DmpHbef3GOE9+HT0=;
        b=HJwFHuGmTiiVgtoy3e+QoadfbfdVMcDbwg6/FfV16vSQervuKMraR0xEb33O4Fzkp/
         7jweAqtkxh71qGsHDuLn8WjNt/eHaujCmGebo/FqLm+P8YSCEOq3gnsAYoXQXAMprHD2
         KiyFEJJxETQmsQX8jeIAxyxEE4ZiPCoQnoh0w9Ll15tvWfno7o+PGkg3Qef13wKPTGfH
         jsyzlyaS002aJi/oSyoS+x6NPZ+4gTbhJTfL6Fv1CmAYvqxj4HYojIMn4htSSAX5MgC+
         Me11r8GLNf7F4nHmgiA1nLuja86ogLlOHOT3tJCliQOO4VPGVCwa1QMswLXr7iiaf3NM
         sqcw==
X-Forwarded-Encrypted: i=1; AJvYcCWKdP0T/UHfGX4S48kZKxB685jGcN2bDqjo+uiat03WBbyx56cQ+QeQgZsd76guDr34Ld4Yn8J0+Z9YcfD4@lists.infradead.org
X-Gm-Message-State: AOJu0YwUMRLuMRt0kf0c/v8nMVB61HDnDwt0ouJXwqNMKZZYNwfN6NGW
	w9WgNS3jPu6o1/uxMmHC5+0gsEUuEpNM13ETla/bgZaS4w9CJd55WS7MB/Aiby5+LQZG/8/xDJm
	0yuqdKO73kJYppbXM1ME7Oj3cNFTc47MsqMkr
X-Gm-Gg: ASbGnct6k8Tf9GVSv9Z0/Z8+F+6iNykbXLHS8mQqygvPeJFVoLD09J5UhdYXcTA9dYd
	atqBEpUkAOR9ojEF6qANU/NaappWfK5l6oPo04cb6i3gDJ3eZFfpKifFySVMQFDLIIp26bzaXZd
	8fezmAqfYLPaAjrTWtkY6MwfjLGZldl8lFdz6+o88RhN4ohswuvCU3jwB68473f6WXhXaG3LkkN
	Ugg0k92+pGWUnI1vVvIB+bARKdWQDC79EfMHfl7Aq1Ihd/yNV4=
X-Google-Smtp-Source: AGHT+IGOt/4l4J9IhYkjHTK2Oetd+MLMwWR2adcwj8NjCk/EXB2Sr+1dYWJ3QAEsHw4NizPwdZrM+iGTE7dwlj2oHms=
X-Received: by 2002:a17:902:e810:b0:240:11be:4dd3 with SMTP id
 d9443c01a7336-24246f46073mr31260365ad.3.1754128937389; Sat, 02 Aug 2025
 03:02:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250725074019.8765-1-johan@kernel.org>
In-Reply-To: <20250725074019.8765-1-johan@kernel.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 2 Aug 2025 12:02:05 +0200
X-Gm-Features: Ac12FXwURosII2dlcOALSUn1if13dVdtjG5hnIKv2HjEhOB0uY5AXgIZbdV4pwY
Message-ID: <CAFBinCALsUdn3fGh2e9qys4KKKT=mDnx5vtkyEz-ZGRmgvNs0A@mail.gmail.com>
Subject: Re: [PATCH] firmware: meson_sm: fix device leak at probe
To: Johan Hovold <johan@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Carlo Caione <ccaione@baylibre.com>, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250802_030218_545887_FD6BF4C6 
X-CRM114-Status: UNSURE (   8.98  )
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

T24gRnJpLCBKdWwgMjUsIDIwMjUgYXQgOTo0MeKAr0FNIEpvaGFuIEhvdm9sZCA8am9oYW5Aa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBNYWtlIHN1cmUgdG8gZHJvcCB0aGUgcmVmZXJlbmNlIHRvIHRo
ZSBzZWN1cmUgbW9uaXRvciBkZXZpY2UgdGFrZW4gYnkKPiBvZl9maW5kX2RldmljZV9ieV9ub2Rl
KCkgd2hlbiBsb29raW5nIHVwIGl0cyBkcml2ZXIgZGF0YSBvbiBiZWhhbGYgb2YKPiBvdGhlciBk
cml2ZXJzIChlLmcuIGR1cmluZyBwcm9iZSkuCj4KPiBOb3RlIHRoYXQgaG9sZGluZyBhIHJlZmVy
ZW5jZSB0byB0aGUgcGxhdGZvcm0gZGV2aWNlIGRvZXMgbm90IHByZXZlbnQKPiBpdHMgZHJpdmVy
IGRhdGEgZnJvbSBnb2luZyBhd2F5IHNvIHRoZXJlIGlzIG5vIHBvaW50IGluIGtlZXBpbmcgdGhl
Cj4gcmVmZXJlbmNlIGFmdGVyIHRoZSBoZWxwZXIgcmV0dXJucy4KPgo+IEZpeGVzOiA4Y2RlM2My
MTUzZTggKCJmaXJtd2FyZTogbWVzb25fc206IFJld29yayBkcml2ZXIgYXMgYSBwcm9wZXIgcGxh
dGZvcm0gZHJpdmVyIikKPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZyAgICAgICMgNS41Cj4g
Q2M6IENhcmxvIENhaW9uZSA8Y2NhaW9uZUBiYXlsaWJyZS5jb20+Cj4gU2lnbmVkLW9mZi1ieTog
Sm9oYW4gSG92b2xkIDxqb2hhbkBrZXJuZWwub3JnPgpBY2tlZC1ieTogTWFydGluIEJsdW1lbnN0
aW5nbCA8bWFydGluLmJsdW1lbnN0aW5nbEBnb29nbGVtYWlsLmNvbT4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBs
aXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
