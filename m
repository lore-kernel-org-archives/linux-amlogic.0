Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C18D7C83F17
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Jul 2025 16:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BuGu56vxQtejmXTUCYM3qEyiyDk1/GVXybht4Hd8UgA=; b=fsEu6r2NveAFSY
	8PX3sAOTInupP8jr/9QEV7ATg9nObtUdfAWzqxBHhfTXVKGnHBAwt4wRUSuZlkRBtfnzvAViqCLGX
	dcLO5lLbrnZTpmbzijNAODKjXs8RMFLwbYqoTT02eSowFEm9MPeJeJqNG4NPQHiTAWR7DZnSBoXfE
	KwI0M6VkQ6uJ+KBi+kA5j+UpwjWILq5UuZRwY+LQHHNVpB5b6Xq4dUUuw3o/PVebyDmjqP2uub2tR
	Tpc/n00LQfXqfa5L1TU9h+ciYgp1RRcKXmjThYXzvoFWNvJv2MOhf5CIHoz/Md7vCZkGitNXiUziC
	KWAKlR2WASJ+202g9Hzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uecOT-00000005VRZ-14t8;
	Wed, 23 Jul 2025 16:32:37 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uecM1-00000005VBP-0x9y;
	Wed, 23 Jul 2025 16:30:06 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-b26f5f47ba1so129067a12.1;
        Wed, 23 Jul 2025 09:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753288204; x=1753893004; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2oLVQ+wEF7L0i9K+mBIHWmF3qtu8o6QfrkYubSnBjN0=;
        b=i1FDjT5CKzGiK9VlqxB9F6iR8vWFLT97xMaFjUJ3bb1UBEHK5BcMFt65XjMvNRHBFK
         yOgWPn6ivSxRrIbGu+nDhoPJSWwtOWPf/ZrxIU5e6i4n23y6nKPtsX7xC4FXHBjbfMmj
         hDT5cTE35MGhwNFnuA94JhQisSJ4nhj26xvn730reX3fIfkkml8kg6zZ0KAEFV5H/9kn
         duX7UQuIh8Uc4a7zIzOgNNnH08HC8/fG+YGIkBQ5UZHakkxi+vyA6SGpSBJT8Pylscd2
         47xFy52gosW6qQyjIWzcwRLYtjW8xk4Z2CsXl6gzcg9+wUjBOkM/WnXfxfOx5MKVGgMG
         T5dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753288204; x=1753893004;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2oLVQ+wEF7L0i9K+mBIHWmF3qtu8o6QfrkYubSnBjN0=;
        b=ZC/4MtHQ80UEal4Une3IXbZlBjFwXvuKTcvVVL/mytmYeNMQ3h19bhWDGPMkILXdWk
         y74b+mOcO27+4XPEL0Qy8j8Csg0+JeEJNQ+RxUxz9xmNIkrb/CSFT92a9JvoWC9MOsjM
         MjCfvRvPu1JBLH5aa0rtsqItkQXpJPtfulsXxGDfzulFcZFiWBXHSuy62sRxbq/S6hIa
         OarLGuuGi2Y8CBJkxZyCA/4BIHVPdUoh/7Lm2ACc2fH9S2EJDt6+4uRC1PBg0ymLVKkP
         HDhrKCOvDjS4hx42Bdurf8gBuo2Ef0AFDm0E3CdYBrNOIJi6aD25JGwXmqWUQgK4S6hg
         ehZg==
X-Forwarded-Encrypted: i=1; AJvYcCVOTbgVo67Xa23HtSSqP6MRHtsRrywqMiuHZwm1KzqSIvHQY/zZh+nqnlBWobxLRrWvvvKWt9nVoDbRy8sbDQlVzg==@lists.infradead.org, AJvYcCVbfc7rVB4kMDMtsM/RD1okfxDAKuJz14JEqwSpvYd5IUL71ABGw/FTUc76pbBxLTgP4CzKxU1YRAwJHhXq@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2PFEhSj9+y1wPyWsUyq9EUQpqgfZd4NuXgPtJWvk91NQ6RmjX
	6ym2hIntrScLCMZbQ8XzNJ1CHKRKBJbD6y5KvmeYol++58JSpGVStIUvUAMZ+R+GnWY=
X-Gm-Gg: ASbGnctd/FNerYcgWtcbeBCgNuPTQsiPXfuT3uPmgLN9o4/r4j/KrS7z7QqKyyXDlvb
	61HsQqzIR9uJ7HTM9siP1BSkM/kvKcBssiCv8v056NIGe4PYuKYsN4NPaXu2pjtM0Gja/XMyhL0
	9t5A5r2cpKmmh15BvwEB9fxHPPUGh+x0N1wKJTYls6x6c9M6cTMXuufIJj0h4hz1sBQTWcfkVHr
	qi1byoLYaxftncdVPJEvwVBucuV+OAFY83XmFhSgRBTPKZ6FZ6tXlnaSIBv5+rR+pslyHZSD0rf
	Zu15Y02zbi82kppl2ovIMxjaudVN2w4scgyU6bFOHqeBK9KcumD1rc5/PqAoJXKBL2na84kiV8f
	WY6CPhWD+GhK7ExSoKW9uO2dhbItUJHLx7amGojU=
X-Google-Smtp-Source: AGHT+IE8R/cLesETtxNTKi6GADIN03ysXQ0xFDkmBNduvgzLi3IKVKIBX5o6E4+QQ7bIBNKgOSkiiw==
X-Received: by 2002:a17:90b:3f8d:b0:311:e8cc:424c with SMTP id 98e67ed59e1d1-31e507cdcebmr5060289a91.25.1753288204285;
        Wed, 23 Jul 2025 09:30:04 -0700 (PDT)
Received: from [192.168.1.143] ([49.207.192.227])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e519b11d1sm2037415a91.5.2025.07.23.09.29.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jul 2025 09:30:03 -0700 (PDT)
Message-ID: <8e5e1d09-0706-42b3-8ae1-00a0e2f5139a@gmail.com>
Date: Wed, 23 Jul 2025 21:59:53 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] dt-bindings: cleanup: fix duplicated 'is is' in YAML
 docs
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-iio@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 ribalda@kernel.org, jic23@kernel.org, dlechner@baylibre.com,
 nuno.sa@analog.com, andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com
References: <20250722170513.5854-1-sanjaysuthar661996@gmail.com>
 <CAFBinCCmsw=XGPtrk1XbphOu=OwhxmAiZ+2h4x_M-_f64Vo-7A@mail.gmail.com>
Content-Language: en-US
From: Sanjay Suthar <sanjaysuthar661996@gmail.com>
In-Reply-To: <CAFBinCCmsw=XGPtrk1XbphOu=OwhxmAiZ+2h4x_M-_f64Vo-7A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_093005_268246_3F6ECD40 
X-CRM114-Status: GOOD (  13.05  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gMjMvMDcvMjUgMDE6MDgsIE1hcnRpbiBCbHVtZW5zdGluZ2wgd3JvdGU6Cgo+IE9uIFR1ZSwg
SnVsIDIyLCAyMDI1IGF0IDc6MDbigK9QTSBTYW5qYXkgU3V0aGFyCj4gPHNhbmpheXN1dGhhcjY2
MTk5NkBnbWFpbC5jb20+IHdyb3RlOgo+PiBGaXggbWlub3IgZ3JhbW1hdGljYWwgaXNzdWVzIGJ5
IHJlbW92aW5nIGR1cGxpY2F0ZWQgImlzIiBpbiB0d28gZGV2aWNldHJlZQo+PiBiaW5kaW5nIGRv
Y3VtZW50czoKPj4KPj4gLSBuZXQvYW1sb2dpYyxtZXNvbi1kd21hYy55YW1sCj4+IC0gaWlvL2Rh
Yy90aSxkYWM3NjEyLnlhbWwKPj4KPj4gU2lnbmVkLW9mZi1ieTogU2FuamF5IFN1dGhhciA8c2Fu
amF5c3V0aGFyNjYxOTk2QGdtYWlsLmNvbT4KPiBSZXZpZXdlZC1ieTogTWFydGluIEJsdW1lbnN0
aW5nbCA8bWFydGluLmJsdW1lbnN0aW5nbEBnb29nbGVtYWlsLmNvbT4KPgo+IFRoYW5rIHlvdSBm
b3Igc3BvdHRpbmcgYW5kIGZpeGluZyB0aGlzIQo+Cj4gVG8gbXkga25vd2xlZGdlIG5vYm9keSBl
bHNlIGlzIGN1cnJlbnRseSB3b3JraW5nIG9uIGFtbG9naWMsbWVzb24tZHdtYWMgY2hhbmdlcy4K
PiBNZWFuaW5nOiB3aXRoIGFuIEFDSyBmcm9tIHRoZSBuZXRkZXYgb3IgaWlvIG1haW50YWluZXJz
IHRoaXMgcGF0Y2ggY2FuCj4gZ28gdGhyb3VnaCBhbnkgdHJlZSAoaWlvLCBuZXRkZXYsIGRldmlj
ZXRyZWUpLgo+Cj4KPiBCZXN0IHJlZ2FyZHMsCj4gTWFydGluCgpUaGFua3MgZm9yIHJldmlld2lu
ZyB0aGUgcGF0Y2guIFNvIHlvdSBtZW50aW9uZWQsIG5vdyB0aGUgcGF0Y2ggY2FuIGdvIAp0aHJv
dWdoIGFueSBvZiBhYm92ZSBtZW50aW9uZWQgdHJlZSwgSXMgdGhlcmUgYW55IEFjdGlvbiBpdGVt
IGxlZnQgb24gbXkgCmVuZCByZWxhdGVkIHRvIHRoaXMgcGF0Y2g/IEFsc28gd2lsbCBJIGJlIG5v
dGlmaWVkIGFib3V0IHdoZW4gdGhlIHBhdGNoIAp3aWxsIGJlIGFwcHJvdmVkIGFuZCBtZXJnZWQg
YnkgdGhlIHJlc3BlY3RpdmUgb3duZXI/CgpCZXN0IHJlZ2FyZHMsCgpTYW5qYXkgU3V0aGFyCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1s
b2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
