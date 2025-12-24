Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22E17E776FA
	for <linux-amlogic@archiver.kernel.org>; Wed, 24 Dec 2025 23:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2VMhFlT+cVaLc1fTyrdoo+Rwpx28YMf6puIgkSKUTyI=; b=2fIpXRwoC5iCPI
	xj3/2Ii6BmrtWx8s0C3C6n8I9BnaqcY3FmQcXavQVXsOOdq6wD5fRLLC8RdLiYkVcjtsa2m6oCuEb
	2K7w3vfJ6QMcpAxZhnwPBuY/VMC+n4ux7HEHKljDb5RUePSzuSaok0yRCywj/atEBGtwyAIG0Sf7a
	xYW5HNQTO1k3TQ4DSuXafFTsSe1x/sL/Xdm4SZsFbQzsp7y2/DCR65xrU6yDwPNXnPuXcoXsF+dGj
	ZfzHVX/4Pm3X78omZXLoT5rv8bOBt9L57ulOzAMgSOe6RVpHpK0lKa0jwXMZETWWIlt1q+gMn+f6N
	GihX5cX0pT1BTSCIvtQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYYNS-0000000HUtK-1SjK;
	Wed, 24 Dec 2025 23:34:46 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYYNQ-0000000HUse-0VC9
	for linux-amlogic@lists.infradead.org;
	Wed, 24 Dec 2025 23:34:45 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2a0833b5aeeso84915675ad.1
        for <linux-amlogic@lists.infradead.org>; Wed, 24 Dec 2025 15:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1766619283; x=1767224083; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0HMFUcxRTaE7pGy8ulnNfmJ/TG2Zqwe3T4eukcCVv70=;
        b=KT7OdjGo+GvTzRDRyRjZ91IIrqRKnw80aa/Pim/J4cYqoBD6H1zNkxsTVTJAWessyN
         pP9B1nWOuqguwwuwsZuwuO09po7SbxfnauyX1kMP1vRV2kFiTKXlftaqdkojWOGJmmvJ
         UUTFYoFdJJpFw1BTu7Dhsatq9MdyTp/YvrjgtbbMdELdd/0eYDQQOTUZgTqlcDa01yVk
         VZdee5XcZfZN59Nmymz2pSqivnMmVmCgEk9wOpIAIAH7yPPAW07Ly+IqrG3sTasCDySp
         o6mBzYUMbwoEmkT+GP8R1B6cIqRssFd6bbBVGZ1oBkvJ66Opd+6W5PU32Bq/3dR1FMcj
         hn4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766619283; x=1767224083;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0HMFUcxRTaE7pGy8ulnNfmJ/TG2Zqwe3T4eukcCVv70=;
        b=qLpHNq4hg2E6Lu5rzi8s2TJmK4CFaPvK2xZTaxxuoxz9edeyKMytxAyTjAAvzTxFMh
         bo6CRY9Si1vMJ3f5D+I/VOFcGYfpd6NQRtRutt9aCYP1YY3Q8aaVNt7XIZEXgxZWrYjI
         K14I+ED2wa2mYBzekooolNNacGTRBwlzYyqhtJhu6g9VGHieNL/miTq/IykrEZPmH/Pb
         tCrrjm/lZiSdBSKqpRso8rif667G/hF4z3sgX6HWOsG0IO1PtddEpUskAJgqwwJ6+8OH
         GL8e8epTj7/r08/yoNBFalNE+j6G2rS0yuVyyIIacw1sILgmD5iK/IxsOY0OsLzdB/b3
         dbjw==
X-Forwarded-Encrypted: i=1; AJvYcCVM8g5F9U21JSo0yuY69FtYHrkO+8yF4tmGUw6Lo7qW0JywghFBUBAlwxskOqc9u2pxMswxPyJjFr2wxcyd@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4CLT3Rc5sGiTgEPRVv62j3wpseV18OsHzAShaAY4JTo9hr5y4
	w/VYTTPXvouQKAV7nJI9Pg9amtRpYmaBFPpFV5S0l+tdksyXio7C6aHqLA0WJSILDNpigMk5bBr
	bOrA8DjC4L/ThEWv5ilgfRRHJGfmoWFQ=
X-Gm-Gg: AY/fxX4+CpFfLcREJP2AjyUVX8V047aRaF/SMeyecLCeGE1obQTktVd+5qtnPC0oG4k
	lAg8XcHx7RmsmtGa/9G0cPLgvTh18pMPViO+KWyaLruOqRhepwYgbvzRFmnBIfrgVKPver2QGNK
	N/136mRDiVo7w0Mrf3meo/FMHA+eT0L1srQ5oBtEt4jE/X90KPDk8TPaM7M3LqbhFb3Af6BcRuW
	ru6mk7GQORG+f7gnqVc/tYcbzp00gukJtjYiMF2siGpBwixjbwvZNwrzx9oqe3G9jrc5M+f5MuU
	LNvgGSAr380neg5e7cNhZgnu3LmH
X-Google-Smtp-Source: AGHT+IEscuGb9wt0+CpZenO2NMSf5QW6JYBAQ7BYtVdw0Is0BW+2/6Y3bhJY7rYbgezF7I5nTgkhulSd7o8Hdzkc1us=
X-Received: by 2002:a17:902:da48:b0:2a0:d33d:a8f0 with SMTP id
 d9443c01a7336-2a2f2a4f5acmr153730285ad.50.1766619283133; Wed, 24 Dec 2025
 15:34:43 -0800 (PST)
MIME-Version: 1.0
References: <20251223-reset-s6-s7-s7d-v2-0-958f341449f1@amlogic.com> <20251223-reset-s6-s7-s7d-v2-4-958f341449f1@amlogic.com>
In-Reply-To: <20251223-reset-s6-s7-s7d-v2-4-958f341449f1@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 25 Dec 2025 00:34:32 +0100
X-Gm-Features: AQt7F2pbVgW1Xzj8p6pWnIHzWV5eNc9gVmLZCBJhyzjhG1GiyEAK3WM9YyEl5sc
Message-ID: <CAFBinCAwcdfaqf-23rj1xOMK9R7skPZKM2LrQLq92VwiMDOy_w@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] arm64: dts: amlogic: Add S7D Reset Controller
To: xianwei.zhao@amlogic.com
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_153444_187243_805A7169 
X-CRM114-Status: GOOD (  11.00  )
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

T24gVHVlLCBEZWMgMjMsIDIwMjUgYXQgNjozN+KAr0FNIFhpYW53ZWkgWmhhbyB2aWEgQjQgUmVs
YXkKPGRldm51bGwreGlhbndlaS56aGFvLmFtbG9naWMuY29tQGtlcm5lbC5vcmc+IHdyb3RlOgpb
Li4uXQo+ICsjZGVmaW5lIFJFU0VUX0JSR19BNTVfUElQRTAgICAgICAgICAgICAxNjYKRm9yIFM3
ICh3aXRob3V0IEQgc3VmZml4KSB0aGlzIGlzIGNhbGxlZCBSRVNFVF9CUkdfQTUzX1BJUEUwIC0g
d2hpY2gKb25lIGlzIGNvcnJlY3QgKGxvb2tpbmcgYXQgYW1sb2dpYy1zNy5kdHNpIGFuZCBhbWxv
Z2ljLXM3ZC5kdHNpCnBvc3NpYmx5IEE1NSBpcyBjb3JyZWN0KT8KdW5yZWxhdGVkIHNpZGUtbm90
ZSB3aGlsZSBJIHdhcyBjaGVja2luZyBhbWxvZ2ljLXM3LmR0c2kgYW5kCmFtbG9naWMtczdkLmR0
c2k6IHdoeSBkbyB3ZSBoYXZlIEQvSSBhbmQgTDIgY2FjaGVzIGRlZmluZWQgZm9yIG9uZSBidXQK
bm90IHRoZSBvdGhlcj8KClsuLi5dCj4gKyNkZWZpbmUgUkVTRVRfQlJHX05JQ19FTU1DICAgICAg
ICAgICAgIDE4Mwo+ICsvKiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAxNjQg
ICAgICovCnRoaXMgbmVlZHMgdG8gc3RhdGUgMTg0CgpPbiBhIHJlbGF0ZWQgc2lkZS1ub3RlOiB3
aGlsZSByZXZpZXdpbmcgdGhpcyBwYXRjaCBJJ20gd29uZGVyaW5nIGhvdwpTNyBkaWZmZXJzIGZy
b20gUzdELgpJcyBTNyBhIGN1dC1kb3duIHZlcnNpb24gb2YgdGhlIFM3RCBTb0MgKGUuZy4gc29t
ZSAtIHBvc3NpYmx5IGZhdWx0eSAtCklQIGJsb2NrcyBmdXNlZCBvZmYpLCBpcyBTN0QgYSBzbGln
aHRseSB1cGRhdGVkIHZlcnNpb24gKGxpa2UgcmV2IDIuMCkKb2YgUzcsIC4uLj8KV2hhdCBJJ20g
bWlzc2luZyBpcyBhICJiaWcgcGljdHVyZSIgKGZvciBvbGRlciBTb0NzIHdlIHR5cGljYWxseSBo
YWQKc29tZSBTQkMgdmVuZG9yIHB1Ymxpc2ggYSBkYXRhc2hlZXQgLSBmb3IgdGhlc2UgbmV3ZXIg
U29DcyB0aGVyZSdzIG5vCnB1YmxpYyBkYXRhc2hlZXRzKS4KClRoYXQgc2FpZCwgSSB0aGluayB0
aGUgYXBwcm9hY2ggY2hvc2VuIGZvciB0aGUgcmVzZXQgY29udHJvbGxlciAoY29weQomIHBhc3Rl
LCBleGNlcHQgMTMgcmVzZXQgbGluZXMpIGlzIGZpbmUgYmVjYXVzZSB0aGVyZSBzZWVtIHRvIGJl
CmFjdHVhbCBkaWZmZXJlbmNlcyBpbiB0aGUgcmVzZXQgbGluZXMuIEZvciBvdGhlcgpkcml2ZXJz
L2ltcGxlbWVudGF0aW9ucyB0aGlzIGFwcHJvYWNoIHdvdWxkIGxpa2VseSBnZXQgdmVyeSBoYXJk
IHRvCnJldmlldy9tYWludGFpbiAoZS5nLiBpZiB3ZSBlbmQgdXAgd2l0aCBhIDMwMDAgbGluZSBk
cml2ZXIgYW5kIHRoZXJlJ3MKb25seSAyNTAgbGluZXMgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSB0
d28gU29DcykuCgoKQmVzdCByZWdhcmRzLApNYXJ0aW4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4
LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
