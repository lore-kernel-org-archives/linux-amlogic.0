Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA4D1C54E41
	for <linux-amlogic@archiver.kernel.org>; Sat, 24 Feb 2024 22:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qGgdm2KPzupT+tnJ0Dad6sCjTlPLPzuizJxy9mvTOdg=; b=ULCJ7/6EvCDxAm
	r1KJK0FDiQ7Y5Ud4spww7kN8cHtZNV0v71stk+1Vlv5S8xf4LrVJCnQ6BV3mWDXdCm+wWD+WEKow6
	eM9K6OKNZ8J7qfuiyxSZqwMbx0vSHP2VUCYsEUl0hWqK48WOwlWfWQjtAqwnPuKnbU7TXbhD4pEXB
	854Reav6qdz3Rhrskd+l8Y6s6T3Rvc/GQaz7N/2X/vuWdX3MTAFPKsX/ZBj9KdRRHwoXzrkdEJgz9
	XSBrmlcjCjKNbOMEDFl1XVh+7asgy8Eju+uv06Rm55MWYMKnDZRYUsaydxEfK3goCeqoIQN4nwOUP
	9JepEMj5W/wG26IAGyuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1re0He-0000000DlLY-1Lcn;
	Sat, 24 Feb 2024 22:14:14 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1re0Ha-0000000DlKq-3NZr;
	Sat, 24 Feb 2024 22:14:12 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1d93edfa76dso16514625ad.1;
        Sat, 24 Feb 2024 14:14:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1708812849; x=1709417649; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HKKftM11Q8FUPYjtMVMlWVKIv3n23lTpjxtRvPGFQBY=;
        b=DjqV3VIXOWa+8r4yU7+ua7XdtVycHlsnSf/w6fF4VHPeWyWtnKA9w8E3Oatqr9iDf+
         6XhvjctYnW8S/UxVP9VFFmbOhk2Ko6WxfVUMCeTD3rfEjDUtzOXEdCxkoqvhhZqJw11n
         lfNeM5L+ZQvHP74ElEU80rOGLM51cFCsdQDPdGkDM8/3X+nYF/1NdW2S2Xr4CNXwqaqE
         2zFUy0bkeEvBMmm2gq/A/OwYTS8z5MBuD8OmX+cWXxUrVQS5LY6fvpXl/Li3VgBkHOia
         6TSlcvr85OvtBJu5D1/o4l1MCpGt7dbpuMcZejylhBCkd+2KaKbfter+pb7MVjG+6ajP
         Wrmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708812849; x=1709417649;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HKKftM11Q8FUPYjtMVMlWVKIv3n23lTpjxtRvPGFQBY=;
        b=Ifu/1e1ZhZMTkJfQ+6yry2Q3GHGojbkJ2mO7A3idNq7bR/iCeXH2Sk22n+aNIUH8rT
         JVN5t3k7MQjquNv8X7nH3XXY0SO3321TaVXlAKICbG04BjR5zVoJYyr+VtX0QX+Ab7Yp
         B2jHZYPv2wpONZZk5Auf4QeUz2WltFGyDYiDm2KEctKUfoQoMX1HW0qjkynkHYUfBKFz
         zuOCaEakYjvtIe8QmuOK5SFAfc0gYSY20rV/JXJZ8ESHvEUSAvPnZ51OHWFQcnWswkYx
         MBuANOanKq/f3vrObkfGcLXlgzm7J1qSUw5+colWqPaxlQG0ExIvQfU5wdy9qxlT9TYK
         MhRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEMMDwNWF6gJIl3Pw/DmW5UcvQBueOhmbt8Kqm91PfuP4Qq0oCr0cIRRZQPTh1GxQCSkvk5fQ02e1z+PAqavrJiGd7qNXpAxNClGfmA7rkHSy/7P13Xh6SpRb5bK5PNOcTW7fH65HaGrJ3VlfcBkXdgYHkWorciQ==
X-Gm-Message-State: AOJu0Yw3vA6Ewkkc5zoV13y5xyXixQYWlMXIBT/w+3li7+tZIY58AIMY
	Gzo9XoeTrpQewLAEkgvuEGNn2WEmnLIMYE/flnNMFTPX5jyN5ycLMVOljnbS+RF3dO6lZw1KBRJ
	WeXC+iZh+3w4nEGmOdL35ekUVKJQ9A2C2bUg=
X-Google-Smtp-Source: AGHT+IEvm2XnjVvxcMKZldLM/QJ0hxIyCRdFdTmLuEgheCKTUmseUf1M9RKdujtLxbSu3kjdskuGi0vxj0PVFvmJWLY=
X-Received: by 2002:a17:903:2291:b0:1dc:6754:52ce with SMTP id
 b17-20020a170903229100b001dc675452cemr4501493plh.60.1708812849554; Sat, 24
 Feb 2024 14:14:09 -0800 (PST)
MIME-Version: 1.0
References: <20240224213529.2601333-1-martin.blumenstingl@googlemail.com> <eb54b791-05d7-4eee-825d-373cc78df689@linaro.org>
In-Reply-To: <eb54b791-05d7-4eee-825d-373cc78df689@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 24 Feb 2024 23:13:58 +0100
Message-ID: <CAFBinCB6+=PThAUz+BdfeD+DqCpscw3pSwrK2pue+J07vhPh_A@mail.gmail.com>
Subject: Re: [PATCH v2] clocksource/drivers/arm_global_timer: Simplify
 prescaler register access
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, patrice.chotard@foss.st.com, 
	linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240224_141410_897798_34AA9AAA 
X-CRM114-Status: GOOD (  12.80  )
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

T24gU2F0LCBGZWIgMjQsIDIwMjQgYXQgMTA6NTXigK9QTSBEYW5pZWwgTGV6Y2Fubwo8ZGFuaWVs
LmxlemNhbm9AbGluYXJvLm9yZz4gd3JvdGU6ClsuLi5dCj4gPiBAQCAtMzAxLDcgKzI5OCw3IEBA
IHN0YXRpYyBpbnQgZ3RfY2xrX3JhdGVfY2hhbmdlX2NiKHN0cnVjdCBub3RpZmllcl9ibG9jayAq
bmIsCj4gPiAgICAgICAgICAgICAgIHBzdi0tOwo+ID4KPiA+ICAgICAgICAgICAgICAgLyogcHJl
c2NhbGVyIHdpdGhpbiBsZWdhbCByYW5nZT8gKi8KPiA+IC0gICAgICAgICAgICAgaWYgKHBzdiA8
IDAgfHwgcHN2ID4gR1RfQ09OVFJPTF9QUkVTQ0FMRVJfTUFYKQo+ID4gKyAgICAgICAgICAgICBp
ZiAocHN2IDwgMCB8fCAhRklFTERfRklUKEdUX0NPTlRST0xfUFJFU0NBTEVSX01BU0ssIHBzdikp
Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIE5PVElGWV9CQUQ7Cj4KPiBXb24ndCBG
SUVMRF9GSVQgY292ZXIgcHN2IDwgMCBhbHNvID8KSG1tLCBJIHdhbnRlZCB0byByZXBseSB0aGF0
IGl0IGRvZXNuJ3QgYmVjYXVzZSBpbnRlcm5hbGx5IEZJRUxEX0ZJVCgpCnVzZXMgYSBjYXN0Ogoo
KHR5cGVvZihfbWFzaykpKF92YWwpIDw8IF9fYmZfc2hmKF9tYXNrKSkgJiAoX21hc2spCk15IG9y
aWdpbmFsIHRob3VnaHQgd2FzIHRoYXQgdGhlIGNhc3Qgd291bGQgY2xlYXIgdGhlIHNpZ24gYml0
IHdoZW4gaW4KZmFjdCAoSSB0aGluaykgaXQgd2lsbCBub3QgLSBpdCB3aWxsIHJlc3VsdCBpbiB0
aGUgc2lnbmVkIG51bWJlciBhbmQKQklUKDMxKSBzZXQuClNvIEkgdGhpbmsgeW91J3JlIHJpZ2h0
LCBGSUVMRF9GSVQoKSBkb2VzIGNvdmVyIGl0LgoKSG93ZXZlciwgdGhlcmUncyBzb21ldGhpbmcg
ZWxzZSBvZGQgd2l0aCB0aGlzIGNvZGU6CldlJ3JlIGRpdmlkaW5nIHR3byBmcmVxdWVuY2llcyAo
dXNpbmcgRElWX1JPVU5EX0NMT1NFU1QpIHdoaWNoIGFyZSB0d28KdW5zaWduZWQgdmFsdWVzLiBT
byB0aGUgcmVzdWx0IG9mIHRoZSBkaXZpc2lvbiBjYW4gbmV2ZXIgYmUgbmVnYXRpdmU6CiAgcHN2
ID0gRElWX1JPVU5EX0NMT1NFU1QobmRhdGEtPm5ld19yYXRlLCBndF90YXJnZXRfcmF0ZSk7Ckhv
d2V2ZXIsIHdlJ3JlIGFkZGl0aW9uYWxseSBkZWNyZW1lbnRpbmcgcHN2IGJ5IG9uZToKICBwc3Yt
LTsKU28gaW4gcmVhbGl0eSBpdCBjYW4gb25seSBldmVyIGJlIG5lZ2F0aXZlIGlmIHRoZSByZXN1
bHQgb2YgdGhlCmRpdmlzaW9uIHdhcyB6ZXJvIChmb3IgZXhhbXBsZSBpZiBuZXdfcmF0ZSBpcyBz
bWFsbGVyIHRoYW4KZ3RfdGFyZ2V0X3JhdGUpLgpIb3dldmVyLCBpbiB0aGF0IGNhc2Ugd2Ugd291
bGQgaGF2ZSBjcmFzaGVkIC0gd2l0aCBhIGRpdmlzaW9uIGJ5IHplcm8KLSBpbiB0aGUgc3RhdGVt
ZW50IHJpZ2h0IGluIHRoZSBtaWRkbGUgb2YgdGhlIHR3byBtZW50aW9uZWQgYWJvdmU6CiAgaWYg
KGFicyhndF90YXJnZXRfcmF0ZSAtIChuZGF0YS0+bmV3X3JhdGUgLyBwc3YpKSA+IE1BWF9GX0VS
UikKClNvIEkgdGhpbmsgd2UgbmVlZCBhbm90aGVyIHBhdGNoIChpdCdzIGJlc3QgdG8gb3JkZXIg
dGhhdCBiZWZvcmUgdGhpcwpvbmUpOiBtYWtlIHBzdiBhbiB1bnNpZ25lZCBpbnQgYW5kIGVycm9y
IG91dCBiZWZvcmUgdHJ5aW5nIHRvIGRpdmlkZQpieSB6ZXJvLgpJZiB5b3UgaGF2ZSBhbnkgb2Jq
ZWN0aW9uczogbGV0IG1lIGtub3csIG90aGVyd2lzZSBJJ2xsIHByZXBhcmUgYQpwYXRjaCB0b21v
cnJvdy4KCgpCZXN0IHJlZ2FyZHMsCk1hcnRpbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1s
b2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
