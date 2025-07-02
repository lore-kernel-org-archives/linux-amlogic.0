Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF415C83F0B
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Jul 2025 17:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gzBDPWQfZbqH2E5MPfTJCQenPQezelOji95B5neHSew=; b=Kzv/NEXurexbm0
	kYrvklV5HnxuNW2kEfWVcIlq0p8tAP/3xjebA20lVUhm8qYQN6O+s4TqpCh7/TbEn/71u2+R3xg70
	nucS5BHlw9GaNf9oG+ekZsAgYePjqkzdUmJVAvc6pNbkEc0p+6R6nWFvpLI9bP+P9NqmZbsC2WX3c
	u4S6ayhRwRfB0amJvrFaqhlQdTYiRfDALkiESLCUJgrYG2RZ3Vws59PIygs07hwU7QXh4Mq2WrV8d
	1Tb/SDAnNWcABQjhPyjSK/0VBTxphW13Sc6YAOhzizwtAEr06bwo63PjZ0fZF0VmW8PYtivPdrChU
	7k44hLs+zpWZnuWVabag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX1ZH-00000009AK2-1aL1;
	Wed, 02 Jul 2025 17:48:23 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX0vg-00000009479-0K9L
	for linux-amlogic@lists.infradead.org;
	Wed, 02 Jul 2025 17:07:30 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-453643020bdso62292065e9.1
        for <linux-amlogic@lists.infradead.org>; Wed, 02 Jul 2025 10:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751476046; x=1752080846; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M+vISXamBlP3ozifS/SwZ99717v8q0Kc6KegIFog+sA=;
        b=GnLYb+d6q0QU35zCouwoaP430JED9omkZkIrZbQgtTVKx0+5JcRxJUPvadygRcMGBZ
         9qkipHci1QaoBUGZANL5EpBjpcPeNZ9ODRoZys6MTBWiXS1mqt70677Th4gAob0WcKVT
         IPI02FSaF+DfPXjTZhxyEXdiAjHmwBfkv3D4msuD2YooxiYP3Od1bz3NjoCIlcaAuIZh
         KTqh9g+CFtiSjd7d6SL4crU8F/2MKmdBCVVJGWxwwExeYy2A0CV8VfeJlRgs2of36aek
         1cKMt0tT4dMN1RfZS47VHgfBwYMsVk9MnWsn67nJw7DTwwrsKlquZJfZP0BArvo3iAC6
         7jRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751476046; x=1752080846;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M+vISXamBlP3ozifS/SwZ99717v8q0Kc6KegIFog+sA=;
        b=jJBLYGoOQah8xn4G2vEQ9gk5JYZ2EPmnBux1Yfxfa8bJUc75RZfJ0w70qU8VllxvTc
         2rhgb/taa0/gWcIOOf/viTcPGGv/t7CN0RO/5LDIW+PkTLhH7iNZaKAHCw90K/zRx/UA
         8YgvQCB/dKoK3wmQnExgtNXZgban4H077m8WGnGuozPyS5SY2vxQVhhMk9UcKqtr+CLl
         cEGClMgi2dbVNrfrRAzNjh0IWlFM1+8nUYWRxUwUq72044mMQVzWEfZ6vaJVlWQmFmIT
         Ax6mkts4k5oub2sBFYUR+OS6hNjkorVQPMFXg5p3SA830tjLKVzqJtgcPpU7EA6Wx6/5
         Q1mw==
X-Forwarded-Encrypted: i=1; AJvYcCUoNEugCA+DrM9aS90KEq/UlUvs0uYdbWXVFkDBb5QGaapoKD9S1FQukX881+Pl2zSOc4o9ouPbrdxXvw3E@lists.infradead.org
X-Gm-Message-State: AOJu0YzlU8Ykq8/kY8+gl4C/dV9bTuDntgC+34/MIHNtAK3wnA4FVqFf
	t4NJh8XQU0ot5hdEcQUC0Crq7Dnl9dFFEE2hMBH51v2aI6zlG+FRNHukOpCxz2RaVKo=
X-Gm-Gg: ASbGnctHlFUrgH7LGy4nkbVuxkQ9JSoel+Z6D71i+SFwe4l2f3PzSI9x3PoWAMFwd2W
	hK6CIh773vNfmNbeRHO6f9bkzcFd74sphNn/DZVnkQMUcxkiM5MWT2nyIKfRjrdXTMulra9hZ/B
	YLP3YCrWIvd5pwDFrhlAcqgq/hn1uNLb7M56hLi+BnTsoeTkzt2zRPaOCJmUr1qBN4UF/lXjECE
	/85DvVpkgL1v3jYNkv0wl2sA0Zli7l2xXEz91Zl5ZA/IGLviLBEuoDRmIezMNEQ2mEvhgaov3Jm
	9e28XrV6erZ0UiJV6G40AatebmCjq/hfHfNFPVBMov4+Z8EtiusqT3Wz/HUWxXGeaCvOR2Wb
X-Google-Smtp-Source: AGHT+IGsc5GDljzmbKBoFeO/zgtvwlzCDxGi06+LsKgR6vPGC7cmyTyt4ATYLRK/0lVoCqPQXxkzvA==
X-Received: by 2002:a05:600c:3b07:b0:450:d00d:d0 with SMTP id 5b1f17b1804b1-454a37083b6mr36766495e9.19.1751476046563;
        Wed, 02 Jul 2025 10:07:26 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:5542:4bad:e07b:9489])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-454a9bced0esm3171085e9.22.2025.07.02.10.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 10:07:26 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Anand Moon <linux.amoon@gmail.com>,  Da Xue <da@libre.computer>,  Ulf
 Hansson <ulf.hansson@linaro.org>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Kevin Hilman <khilman@baylibre.com>,
  linux-mmc@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-amlogic@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [RFC] mmc: meson-gx-mmc: add delay during poweroff
In-Reply-To: <CAFBinCBwTkVwcBTWOzS+G13+rRM2eftMXZ3GHzW+F+BY0bBBzg@mail.gmail.com>
	(Martin Blumenstingl's message of "Wed, 2 Jul 2025 18:27:55 +0200")
References: <20250628015328.249637-1-da@libre.computer>
	<CANAwSgTH67T9SBQSFQgFjvyrxNCbtfd9ZaCDZFACWA=ZQ-PYtQ@mail.gmail.com>
	<CAFBinCBwTkVwcBTWOzS+G13+rRM2eftMXZ3GHzW+F+BY0bBBzg@mail.gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 02 Jul 2025 19:07:25 +0200
Message-ID: <1j4ivued2q.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_100728_351323_3D7490C6 
X-CRM114-Status: GOOD (  24.41  )
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

T24gV2VkIDAyIEp1bCAyMDI1IGF0IDE4OjI3LCBNYXJ0aW4gQmx1bWVuc3RpbmdsIDxtYXJ0aW4u
Ymx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPiB3cm90ZToKCj4gSGkgQW5hbmQsCj4KPiBPbiBU
dWUsIEp1bCAxLCAyMDI1IGF0IDEyOjAw4oCvUE0gQW5hbmQgTW9vbiA8bGludXguYW1vb25AZ21h
aWwuY29tPiB3cm90ZToKPj4KPj4gSGkgRGEsCj4+Cj4+IE9uIFNhdCwgMjggSnVuIDIwMjUgYXQg
MDk6MTUsIERhIFh1ZSA8ZGFAbGlicmUuY29tcHV0ZXI+IHdyb3RlOgo+PiA+Cj4+ID4gUmVndWxh
dG9ycyBjb250cm9sbGluZyB0aGUgU0QgY2FyZCBwb3dlciBuZWVkIHNvbWUgc2V0dGxpbmcgdGlt
ZSBmb3IgU0QKPj4gPiBjYXJkcyB0byBmdWxseSByZXNldCBmcm9tIFVIUyBtb2Rlcy4gVGhlIHJl
Z3VsYXRvciBmcmFtZXdvcmsgc2VlbXMgdG8KPj4gPiBpZ25vcmUgZmFsbGluZyB0aW1lcyBzZXQg
aW4gdGhlIGRldmljZSB0cmVlIGNhdXNpbmcgYSBmZXcgYm9hcmRzIHdpdGggdGhlCj4+ID4gc2Ft
ZSBoYXJkd2FyZSBpbXBsZW1lbnRhdGlvbiB0byBoYW5nIG9uIHJlYm9vdCBiZWNhdXNlIHRoZSBT
RCBjYXJkIHN0aWxsCj4+ID4gaGFkIHNvbWUgdm9sdGFnZSBhbmQgZGlkIG5vdCByZXNldCBwcm9w
ZXJseSB0byBiZSBpbml0aWFsaXplZCBhZ2Fpbi4KPj4gPgo+PiA+IEFkZCBhIGRlbGF5IHN1ZmZp
Y2llbnRseSBsb25nIGZvciB0aGUgdm9sdGFnZSB0byBkcm9wIHNvIHRoYXQgdGhlIFNEIGNhcmQK
Pj4gPiBjYW4gcmVzZXQgcHJvcGVybHkuIE90aGVyd2lzZSB0aGUgcmVib290IHdpbGwgaGFuZyBh
dCBtaXNzaW5nIFNEIGNhcmQKPj4gPiBlc3BlY2lhbGx5IHdpdGggU2Ftc3VuZyBjYXJkcy4KPj4g
Pgo+PiBBbHRob3VnaCB0aGUgZHJpdmVyIGRlZmluZXMgcmVzZXQgaWRlbnRpZmllcnMgc3VjaCBh
cwo+PiBSRVNFVF9TRF9FTU1DX0EsIFJFU0VUX1NEX0VNTUNfQiwgYW5kIFJFU0VUX1NEX0VNTUNf
QywKPj4gSXQgZG9lcyBub3QgaW1wbGVtZW50IHByb3BlciByZXNldCBjb250cm9sbGVyIGZ1bmN0
aW9uYWxpdHksCj4+IHNwZWNpZmljYWxseSBsYWNraW5nIHN1cHBvcnQKPj4gZm9yIHJlc2V0X2Nv
bnRyb2xfYXNzZXJ0KCkgYW5kIHJlc2V0X2NvbnRyb2xfZGVhc3NlcnQoKSBvcGVyYXRpb25zLgo+
IEkgdGhpbmsgdGhlcmUncyBhIG1pc3VuZGVyc3RhbmRpbmc6Cj4gVGhlIG1lc29uLWd4LW1tYyBk
cml2ZXIgY2FsbHMgZGV2aWNlX3Jlc2V0X29wdGlvbmFsKCkgZHVyaW5nIC5wcm9iZQo+IHdoaWNo
IHdpbGwgaW50ZXJuYWxseSBjYWxsIHJlc2V0X2NvbnRyb2xfcmVzZXQoKS4KPiBTbyBJIGRvbid0
IHNlZSBhIHByb2JsZW0gaGVyZS4KPgo+IFRoZSBwYXRjaCBzZWVtcyBtb3JlIGFib3V0IHBvd2Vy
IHNlcXVlbmNpbmcsIHdoZXJlIGVpdGhlciB0aGUgU0QgY2FyZAo+IG9yIHJlZ3VsYXRvciB1c2Vk
IHRvIHBvd2VyIHRoZSBTRCBjYXJkIHJlcXVpcmVzIGEgY2VydGFpbiBhbW91bnQgb2YKPiB0aW1l
IChkZWxheSkgd2hlbiBzd2l0Y2hpbmcgZnJvbSBPTiAtPiBPRkYgLT4gT04gKG15IHVuZGVyc3Rh
bmRpbmcgaXM6Cj4gd2l0aG91dCB0aGlzIGRlbGF5IHRoZSBjYXJkIHNlZXMgT04gLT4gT04gd2hp
Y2ggZmFpbHMgdG8gdXBkYXRlIHNvbWUKPiBzdGF0ZSBpbnRlcm5hbGx5KS4KPgo+IFRvIG1lIGl0
J3Mgbm90IGNsZWFyIGlmIHRoaXMgaXMgYSBwcm9wZXJ0eSBvZiB0aGUgU0Qgc3BlYyBvciByYXRo
ZXIKPiB0aGUgcmVndWxhdG9yLgo+IFVsZiwgSmVyb21lIC0gYW55IGlkZWFzIC8gaW5wdXRzIGZy
b20geW91PwoKSWYsIGFzIHRoZSBkZXNjcmlwdGlvbiBzdWdnZXN0LCB0aGUgcmVndWxhdG9yIGZy
YW1ld29yayBzb21laG93IGlnbm9yZQp0aGUgdGltaW5nIHNldCBpbiBEVCwgbWF5YmUgdGhpcyBp
cyB3aGF0IG5lZWRzIHRvIGJlIGNoZWNrZWQgPwoKVEJIIEkgd291bGQgc3VzcGVjdCB0aGUgZGVs
YXlzIGJlZm9yZSB0aGUgcmVndWxhdG9yIGZyYW1ld29yayBpdHNlbGYuCgpUaG9zZSBhc3NlcnQv
ZGUtYXNzZXJ0IGRlbGF5cyB0ZW5kIHRvIGJlIGp1c3QgY29waWVkIGZyb20gYm9hcmRzIHRvCmJv
YXJkcy4gTWF5YmUgc29tZSBib2FyZHMgbmVlZCBkaWZmZXJlbnQgZGVsYXlzLiBJZiB0aG9zZSBh
cmUgdG9vIHNob3J0CmZvciB0aGUgYWN0dWFsIEhXLCBhbiBPTiAtPiBPRkYgLT4gT04gY291bGQg
cmVzdWx0IGluIGEgTk9QLgoKPgo+Cj4gQmVzdCByZWdhcmRzLAo+IE1hcnRpbgoKLS0gCkplcm9t
ZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
YW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
