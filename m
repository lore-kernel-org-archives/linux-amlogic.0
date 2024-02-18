Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 792EFC48BF6
	for <linux-amlogic@archiver.kernel.org>; Sun, 18 Feb 2024 23:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Um8p15RIkAoU6SCkjqrYaEfjUesqOiHU/gXDTvLKlfo=; b=H+fpQHtK0sVsjR
	hMAwCafvd4IFmPrgF+2h/Hx0ZY/URXP6C7GcQeYHywq60aFmRs16xw4VbjaINvCH09caj1LyR49LG
	HtQwHxQOMjela1yyZ2GT/NCzoZw2HDMUbS/lDjiWQc/Imi+gkgPreHzZz0HU0flOCZFwlVlS556pU
	hCvWlpgf7UY4MoyUVRP2w6xSN4HmAULvxegh2Mo+9L6fcIDWgaiedJqr04kz3q+huu929flKkVB7y
	3w755P/dNeyTGmHWaeTeG7IkG5Wp4lIz9q9gzOFCjm7K0Ev84MH4rttwmxrdpRJ7+m5kOdKZBJhFb
	oRUf3prbKnDmc9mdbr2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbqRK-00000008c7c-2Nl0;
	Sun, 18 Feb 2024 23:19:18 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbqRF-00000008c4X-2UOF;
	Sun, 18 Feb 2024 23:19:15 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-29041136f73so2624768a91.0;
        Sun, 18 Feb 2024 15:19:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1708298346; x=1708903146; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=khrQCQyYrMhwWZqymcpDctJEiCRTGl4cp9AfajJt7bg=;
        b=mxzf7ino6rr5ALwLE6mnKADLs0FTbB4SDMoxb1iAG2jp8hZvz6LqkFd3Hkhpgi8mHD
         Tc0Gt/Wtnr2caiFcLllxDWmBOrJXoTaEZy9pTCwNDwFEGUa87EZk93kR6YPTzC+w7wOo
         cYu7C0Y0iToo78TQ2RyLghg2h6IKh3euX2qksfqmbtVVKxUFj97hmJKEH2pMbEWiv/pr
         0BA1byVb8Ez2vqxgn8MT4s9T1r9AhNdbSsr+9/ytXY3Wn/0ppkkfQ2YjGP6O+WsKm6H+
         2MuBZrSBE25FRtU1+EAgftWkLpTQjY/RgBGena+L8FtCIKXscbA/MUPSERyiO30ewjGv
         MggA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708298346; x=1708903146;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=khrQCQyYrMhwWZqymcpDctJEiCRTGl4cp9AfajJt7bg=;
        b=IQvWEPSyeK4WotW/zUbN3WBWjQxkbNntq4JV2LjS9Yc0QM7vjQSTkTdzVWKGb+G23Q
         LUVW2T2lJLnaKdvD+khL3yz9axZaTVcgKr8ogVeIS0+60bUJin4KiUIzFLaO/yYH4iUT
         LycpaLQvciIk7ZN8VHKkNd6eRk2sOprmWBL7PfZ9nxt2PmLCEGyBzjOHwpjUO38J9aiP
         yhrTxNF4xPJLRKwdUlNb0gKiEARhq9SCnDPUnoN+oBZYJ/NNPVwU70DMKG3MhIOOroPO
         LmutSoUElYbFFK1dD0P78XsWlWIV3hCSI4pZ2NcqRuCvHJc1pNzvcq9htbfDidGosLEG
         vEdA==
X-Forwarded-Encrypted: i=1; AJvYcCWBJNBsTZxoBx6hx0ZmqNEhKXXzm21Q/pbQpukrHjAEL2gkX/Crfo5Ucha2mOd0Y6Dv44x2GINjFAdDJ76qHNKABq124E0H2tkPOTrAmBNCrxjJK/FRw0C9iBNoXH2ncY5kDR94fLsP15kD6IRCycMgxgNVEJziuw==
X-Gm-Message-State: AOJu0YwifX40YRWH7DsH+7GWKC1IIgqT3rFd5/yU/tpWVRIb0L/INCg5
	ADkiRiEqoWiQ7a2v6YT938DSYHdbZDLRmVKC24Dhcy64LsJ7YlO3qpbvhfhTrcFLLfKNOzuQn10
	LUKMlZR5bjwObdwUwBVCWROFEv7M=
X-Google-Smtp-Source: AGHT+IG9hxyO5Po/xMncBWm3PvD2MYQZinYkMZ9g9ZM46oBcM/mfmqUXTjmVwwIUaT1GGENi8eKzZPOEFfUrnds8VEs=
X-Received: by 2002:a17:903:110d:b0:1d8:b51c:6b79 with SMTP id
 n13-20020a170903110d00b001d8b51c6b79mr12411783plh.7.1708298345011; Sun, 18
 Feb 2024 15:19:05 -0800 (PST)
MIME-Version: 1.0
References: <20240218174138.1942418-1-martin.blumenstingl@googlemail.com>
 <20240218174138.1942418-2-martin.blumenstingl@googlemail.com> <ec0b3dfb-3ce2-43f2-9cd4-042c3aca4cf7@linaro.org>
In-Reply-To: <ec0b3dfb-3ce2-43f2-9cd4-042c3aca4cf7@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 19 Feb 2024 00:18:53 +0100
Message-ID: <CAFBinCC0BbahEMeW9CYC+hKk0CBQ9a+CqNrOv3c92D8hDtQHdQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] clocksource/drivers/arm_global_timer: Fix maximum
 prescaler value
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: tglx@linutronix.de, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, andrea.merello@gmail.com, 
	patrice.chotard@foss.st.com, linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240218_151913_676705_B9815529 
X-CRM114-Status: GOOD (  13.34  )
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

SGkgRGFuaWVsLAoKT24gU3VuLCBGZWIgMTgsIDIwMjQgYXQgMTE6NTnigK9QTSBEYW5pZWwgTGV6
Y2Fubwo8ZGFuaWVsLmxlemNhbm9AbGluYXJvLm9yZz4gd3JvdGU6ClsuLi5dCj4gPiAgICNkZWZp
bmUgR1RfQ09OVFJPTF9QUkVTQ0FMRVJfU0hJRlQgICAgICA4Cj4gPiAtI2RlZmluZSBHVF9DT05U
Uk9MX1BSRVNDQUxFUl9NQVggICAgICAgIDB4Rgo+ID4gKyNkZWZpbmUgR1RfQ09OVFJPTF9QUkVT
Q0FMRVJfTUFYICAgICAgICAweEZGCj4gPiAgICNkZWZpbmUgR1RfQ09OVFJPTF9QUkVTQ0FMRVJf
TUFTSyAgICAgICAoR1RfQ09OVFJPTF9QUkVTQ0FMRVJfTUFYIDw8IFwKPiA+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIEdUX0NPTlRST0xfUFJFU0NBTEVSX1NISUZUCj4K
PiBHb29kIGNhdGNoIQo+Cj4gSU1PIHRoZSBpbml0aWFsIGNvbmZ1c2lvbiBpcyBjb21pbmcgZnJv
bSB0aGUgc2hpZnQgYW5kIHRoZSBtYXNrIHNpemUuCj4KPiBCdXQgc2hvdWxkIEdUX0NPTlRST0xf
UFJFU0NBTEVSX01BWCBiZSAyNTYgPyBzbyAoMHhGRiArIDEpCkl0IGRlcGVuZHMgb24gd2hhdCB3
ZSBjb25zaWRlciAibWF4IiB0byBiZToKLSB0aGUgcmVnaXN0ZXIgdmFsdWUKLSB0aGUgYWN0dWFs
IG51bWJlciB0aGF0J3MgdXNlZCBpbiB0aGUgY2FsY3VsYXRpb24gZm9ybXVsYQoKSWYgd2UgaWdu
b3JlIHRoZSB1c2FnZSBvZiBHVF9DT05UUk9MX1BSRVNDQUxFUl9NQVggd2l0aGluCkdUX0NPTlRS
T0xfUFJFU0NBTEVSX01BU0sgdGhlbiB0aGVyZSdzIG9ubHkgb25lIG9jY3VycmVuY2UgbGVmdCwg
d2hpY2gKZGVjcmVtZW50cyB0aGUgY2FsY3VsYXRlZCB2YWx1ZSByaWdodCBiZWZvcmUgY29tcGFy
aW5nIGl0IGFnYWluc3QKR1RfQ09OVFJPTF9QUkVTQ0FMRVJfTUFYLgpUaGlzIG1lYW5zOiB0aGUg
cmVtYWluaW5nIGRyaXZlciBjdXJyZW50bHkgY29uc2lkZXJzCkdUX0NPTlRST0xfUFJFU0NBTEVS
X01BWCB0byBiZSB0aGUgbWF4aW11bSB2YWx1ZSB0aGF0IGNhbiBiZSB3cml0dGVuCnRvIHRoZSBy
ZWdpc3RlciwgaGF2aW5nIGNvbnZlcnRlZCB0aGUgdmFsdWUgZnJvbSB0aGUgY2FsY3VsYXRpb24K
Zm9ybXVsYSB0byByZWdpc3RlciB2YWx1ZSBiZWZvcmVoYW5kLgoKPiBUaGUgZm9sbG93aW5nIG1h
eSBiZSBsZXNzIGNvbmZ1c2luZzoKPgo+ICNkZWZpbmUgR1RfQ09OVFJPTF9QUkVTQ0FMRVJfU0hJ
RlQgICAgICA4Cj4gI2RlZmluZSBHVF9DT05UUk9MX1BSRVNDQUxFUl9NQVNLICAgICAgIEdFTk1B
U0soMTUsOCkKPiAjZGVmaW5lIEdUX0NPTlRST0xfUFJFU0NBTEVSX01BWCAgICAgICAgKEdUX0NP
TlRST0xfUFJFU0NBTEVSX01BU0sgPj4gXAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgR1RfQ09OVFJPTF9QUkVTQ0FMRVJfU0hJRlQpICsgMQpJZiB5b3UncmUgaW50
ZXJlc3RlZCB0aGVuIEknbGwgd29yayBvbiBhIGZvbGxvdy11cCBwYXRjaCB0byBjbGVhbiB1cAp0
aGUgcHJlc2NhbGVyIG1hY3JvcyAodXNpbmcgRklFTERfUFJFUCwgRklFTERfR0VUIGFuZCBHRU5N
QVNLIHdvdWxkCnNpbXBsaWZ5IHRoaW5ncyBJTU8pLgpJIHRoaW5rIHRoYXQgdGhpcyBwYXRjaCBp
cyBzdGlsbCBnb29kIGFzLWlzIHNpbmNlIGl0J3Mgc21hbGwgYW5kIGNhbgpiZSBiYWNrcG9ydGVk
IGVhc2lseSAoaWYgc29tZW9uZSB3YW50cyB0byBkbyB0aGF0KS4KCgpCZXN0IHJlZ2FyZHMsCk1h
cnRpbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dp
Ywo=
