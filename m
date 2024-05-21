Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02F34C25B74
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 May 2024 19:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HBbynceSVmvYT1VyJj/GABuobNzC0VyvtpGiM9JFCqo=; b=TzHjw+8AvQGumN
	QhaZWyIuYemWgIIB53xWfYup2CrN9f81VMTeKMvG9hc08UjYx1Cd7rjw5LrvNbdZa2ZFQv5MxlasR
	UZZHFiB/O+H7iCB5zsHHrgJuzZH/Fp/gAQVrKURbKZxT2Zi7mx+r6BqEB8vV9Awwrvw9Ouyn3aV5k
	8NivP7DRK1UeA1IBAFrLqGzqzNKYlnQp0V7hgDpz2KRQnOV1bzg1vk6oRCdFfmHjGwvKy7lO1ITqo
	olTzAj7Tc6CWrduouLSopX75Aho8ruizFIWAJGztm0DtsFlPnno/tBSzYSq/l3LekphQt9gKNawDL
	tR7LVUpSmmUWejNFBpFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9VCC-00000000uen-2j3o;
	Tue, 21 May 2024 19:30:48 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9VCA-00000000udr-1Qgl
	for linux-amlogic@lists.infradead.org;
	Tue, 21 May 2024 19:30:48 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2e78fe9fc2bso13078581fa.3
        for <linux-amlogic@lists.infradead.org>; Tue, 21 May 2024 12:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=libre.computer; s=google; t=1716319843; x=1716924643; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mScw330//XjyClrpxvPSs6MjpV33vzEHLROrLRihprk=;
        b=PBFaayAT9lnkpBlsL3fg3E8uxQ3KW+MxH6oYv5XWP5atusXjolpzPjviOxsMlSeJ12
         CwWZ5JeTSDiZXv7NJ9U16Yi8OUo2SK3hpYKuYUNE18Qeg/sDBK1DjA1/qxVHvU02S3l+
         JDueqr4wCTwA2O9FvRqZSkOKbz6biS4jHcGBTaK4i3GMQ1ZtcNXX7MbgQpE5vAU7mv7n
         sSeUbWDeB/oKSr1HXhMSrjY5eHYlLo02y7lIseLmyXteKV9dYbacP8llhLlaX8lSNrTx
         TeEYdUHyGF/VdeuSzU5iqQxHNIjS/QP35oBTavnZzMqKtpXAkygH38DuprFQo0t/iC4e
         tpIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716319843; x=1716924643;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mScw330//XjyClrpxvPSs6MjpV33vzEHLROrLRihprk=;
        b=r/cKiJZEKHsSUeXuYrKd1dp91W+WzXeVY2Bd80W4LhHDuoYNEj1whb0jOKVdcAV+CZ
         UygzT6X2SyoEgkpK6eJ+YLEQQRsE+JNDZ1l/RRfWF3okZ3GzCo9rf8UR9wALMPlCdgf5
         NNYlzE9ZVgflnM5J7RsGI0RxL/jjK16jylGysQ9VpvbUNqWycGtcxQ8EJW79yiqp5GOc
         IPlCQjN0AxFqHDqAQKjgacBBbsK4b3+jVHuNN1lES0SUedIiguQNoFgpRKZS1EEwiA0W
         3g1kILPcntYCPXsX+F26SRbxFSYq9KFIBJu7WgMi6p+l0XiBXzoVgEulL/OlYZbDh5rz
         MfcA==
X-Forwarded-Encrypted: i=1; AJvYcCXcg8J2bg8mayBaZmvLv7tXtzQVjS4mBCLEAJt2yy9wOf6TmaJYvW0blf9eQtAjZdYu0paI1u2Q6DUd5EtUI2o41/yw8yscDGRhWOD3xmd+5r8=
X-Gm-Message-State: AOJu0YxtlfKDwKqcZM149eWQKDdsRGNfZsOXuW3vSy6p6W+EhxmF1gO6
	ljk1Z07EL7IbF3BFehNmoKVk/PQSPiq1ONo2L40rtLn/K7VGUc1kFPWtzM9benT/TaqnkDZvhZ3
	Xz2/GDVs0rTyA9GO05NdZ3WyzWHqnLvmlnHNk
X-Google-Smtp-Source: AGHT+IFN7IRJY5kiBiKBEGefkggLY3iU8MsJap6OuX1crsyCiwkXjeBbDTmfMBuiSArK98CecXCUx/Cf3hDAe9Yiprk=
X-Received: by 2002:a2e:3206:0:b0:2e0:c81c:25da with SMTP id
 38308e7fff4ca-2e51ff5fb1bmr232817751fa.30.1716319843220; Tue, 21 May 2024
 12:30:43 -0700 (PDT)
MIME-Version: 1.0
References: <CACqvRUbx-KsrMwCHYQS6eGXBohynD8Q1CQx=8=9VhqZi13BCQQ@mail.gmail.com>
 <Zkz1Au7njclh1r3g@shell.armlinux.org.uk>
In-Reply-To: <Zkz1Au7njclh1r3g@shell.armlinux.org.uk>
From: Da Xue <da@libre.computer>
Date: Tue, 21 May 2024 15:30:31 -0400
Message-ID: <CACqvRUYo+KJJjq+AtpLpZhS9WrTUoGuCJ0ZV-7=fy0zvD=xF7A@mail.gmail.com>
Subject: Re: [PATCH] net: mdio: meson-gxl set 28th bit in eth_reg2
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Da Xue <da@libre.computer>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, netdev@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-stable <stable@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_123046_475954_C0AA52D0 
X-CRM114-Status: GOOD (  14.85  )
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

T24gVHVlLCBNYXkgMjEsIDIwMjQgYXQgMzoyNOKAr1BNIFJ1c3NlbGwgS2luZyAoT3JhY2xlKQo8
bGludXhAYXJtbGludXgub3JnLnVrPiB3cm90ZToKPgo+IE9uIFR1ZSwgTWF5IDIxLCAyMDI0IGF0
IDAyOjU2OjQ1UE0gLTA0MDAsIERhIFh1ZSB3cm90ZToKPiA+IEBAIC02NSw3ICs2Niw3IEBAIHN0
YXRpYyB2b2lkIGd4bF9lbmFibGVfaW50ZXJuYWxfbWRpbyhzdHJ1Y3QKPiA+IGd4bF9tZGlvX211
eCAqcHJpdikKPiA+ICAgKiBUaGUgb25seSBjb25zdHJhaW50IGlzIHRoYXQgaXQgbXVzdCBtYXRj
aCB0aGUgb25lIGluCj4gPiAgICogZHJpdmVycy9uZXQvcGh5L21lc29uLWd4bC5jIHRvIHByb3Bl
cmx5IG1hdGNoIHRoZSBQSFkuCj4gPiAgICovCj4gPiAtIHdyaXRlbChGSUVMRF9QUkVQKFJFRzJf
UEhZSUQsIEVQSFlfR1hMX0lEKSwKPiA+ICsgd3JpdGVsKFJFRzJfUkVTRVJWRURfMjggfCBGSUVM
RF9QUkVQKFJFRzJfUEhZSUQsIEVQSFlfR1hMX0lEKSwKPiA+ICAgICAgICAgIHByaXYtPnJlZ3Mg
KyBFVEhfUkVHMik7Cj4gPgo+ID4gICAvKiBFbmFibGUgdGhlIGludGVybmFsIHBoeSAqLwo+Cj4g
SW4gYWRkaXRpb24gdG8gd2hhdCBBbmRyZXcgc2FpZCwgeW91IG5lZWQgdG8gbG9vayBhdCBob3cg
eW91J3JlIHNlbmRpbmcKPiBwYXRjaGVzIC0gdGhpcyBwYXRjaCBsb29rcyBsaWtlIGl0IGhhcyBi
ZWVuIHdoaXRlc3BhY2UgZGFtYWdlZCwgd2hpY2gKPiBtZWFucyBpdCBjYW4ndCBiZSBhcHBsaWVk
LgoKVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suIFRoZXJlJ3MgMiByZXNlcnZlZCByYW5nZXMgaW4g
dGhhdCByZWdpc3Rlcgp3aXRoIG5vIGZ1cnRoZXIgZGVzY3JpcHRpb25zIGF2YWlsYWJsZS4KSWYg
bmFtaW5nIHRoZSBiaXQgb2Zmc2V0IGFmdGVyIHRoZSBmaWVsZCByYW5nZSBpcyBPSywgSSB3aWxs
IG1ha2UgZWRpdAphbmQgc3VibWl0IGEgVjIgdGhvdWdoIHNlbmQtZW1haWwuCgo+Cj4gLS0KPiBS
TUsncyBQYXRjaCBzeXN0ZW06IGh0dHBzOi8vd3d3LmFybWxpbnV4Lm9yZy51ay9kZXZlbG9wZXIv
cGF0Y2hlcy8KPiBGVFRQIGlzIGhlcmUhIDgwTWJwcyBkb3duIDEwTWJwcyB1cC4gRGVjZW50IGNv
bm5lY3Rpdml0eSBhdCBsYXN0IQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtYW1sb2dpYwo=
