Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C607C83038
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Jul 2025 19:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gXr764S6Nf3tzxGV+d5m2nWUb580r69vpAAxUeKU0ws=; b=UJh42Qe3zQBpOA
	3HN3nl/io5US2wpM7X3lWra8ZiReX3iYXYz1tHTenhjZaBqAyxgb2SaeT5EiGcLTERhPwKV1BayRM
	12smlkndGE4UOxEr99CSo6cT+Ur0OdZCyO2RqxZU/FgB/A9jY9SjPPGqST4iufXo6skn3jt+gVnAB
	i2lu7BrrCLfCGcV1/ipc2bpfCDy7K53uf6GkmtZK6uXt+43EIBuRplCAKULuB5yTGk5BcComwRL+j
	qmp7vXOR4J1/FS9Dg/pWXSbHvHcULKCaeZRD8qx3j8LI0bXT1J/Jjf79Xi0D3LLokbO1Q18HVb0qZ
	kBNHu/428WURnFdhO+Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX2uy-00000009NSW-2LMN;
	Wed, 02 Jul 2025 19:14:52 +0000
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX2oD-00000009MnF-2zz9
	for linux-amlogic@lists.infradead.org;
	Wed, 02 Jul 2025 19:07:55 +0000
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-710fe491842so68831207b3.0
        for <linux-amlogic@lists.infradead.org>; Wed, 02 Jul 2025 12:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=libre.computer; s=google; t=1751483273; x=1752088073; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rvdW++MqUNAT9e7oRWP0qIFHszXC+6mKXAM1qsUsnHA=;
        b=GgPmdEgio9YTHGXXdTcn/oi8U1gzTtpSpE6I/nejEKk4MbNNMXfRhT0wCjU+/AnDRi
         7eiBahPaRx1wJDbO5j9wSrjn8o/82EVMjEwsAdnqbsx8nvBIdNk1kl5sKGjUr2GxF1ii
         UlTPkI3efr/J1Pc3WZUm9CQGPSCV8lvz4hj3J477tmUYjWWewyiKeT1qipXHqzsIUbNL
         rGkmCq1DZYsJ6Oz/ED4VDsD/WJEgtOaKaDr4E46l3FtR+8ScbhAYy4/J+bwHzciKSatk
         VfdKkvur28arfJKs/FY97B1k+KkcC7TlnI9T2Bx7EoArFTrdS2/jfaXjV8+oy5nn69fx
         nqrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751483273; x=1752088073;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rvdW++MqUNAT9e7oRWP0qIFHszXC+6mKXAM1qsUsnHA=;
        b=BnIshD69tZiLFwJrfJWSX0MxaBFS4Zrt/X+ZC4tb+sk3Gcz+XdNfBugaZB+HZtySxv
         n+rkq7HJBA1n8Go2hnACy86kzkxeN6TSE3ldmg+Pp+jmODQiy2fZV9eIz7Ssw8X69KrI
         yuNRWw4nn70rvVYkF4ndjXaZx5IfjjBTEiGkzNAT2VPYfpEVijSM/Zb4MLOPRx6Bmtop
         e7wqu35BLLJNE/yWN0mzIpJ9r/S/W2hqWTgm1V01C1UFRKH+114+qN4XuKaaIJ5BLecr
         SpWdDXMsta/R9QPHcWOMYLqW1UfNnNpAwCducq6VkBBGd8f9yxw5ZqzryMkzEWCEivNL
         SJRw==
X-Forwarded-Encrypted: i=1; AJvYcCWaneyImDZzGvwHVPv84CDYnimGKthTPngE9es/fenNg600ZGFtJRNBF2hpThsDZumXDogjZQTqX3Ue1WTG@lists.infradead.org
X-Gm-Message-State: AOJu0YzimrT/aKcXStyagpMWgNkRUanzyXwS5uVKFCL6i0NYCRnNYQlC
	KxRVbbwhsTXNdNtKO1LLHAr3duIYUPY5xhQIPvbJEWwCyxFNkJJtxtGQoHToYrjv0AhLzhB4qfL
	AlxzKLH/nUhkeRcrXLUzoHYxH3/N/ccsltX40GitE
X-Gm-Gg: ASbGncslCdEnzzz8vzCfvxx9tKks1wliYylOSoFDywZ/R+yXCLlftRAILkv0AeA8pCA
	7Cub39h93dedIUXE+5wlXxjAQRjRIllGBpfz6Beij8mc63/VERKmXHBWdMKzEmF0+E6/GV1FcuA
	/Lbqb+QIvs76NbJ9FU2qx/9sqtu1yrj9tlGSTm2t9IdStF2Zou64MJaiod5GNBlAGXfSlUDzDnf
	EBU
X-Google-Smtp-Source: AGHT+IGHElWqxIych5glg28+DrcUG1t7PUSfK4vTb3oHxY8WbSGSMjUbaCvnzu+2LABndjMybYrTqRZBHCrBQIwHt/8=
X-Received: by 2002:a05:690c:64c7:b0:715:1696:aafc with SMTP id
 00721157ae682-7165a3380f6mr3176317b3.12.1751483272654; Wed, 02 Jul 2025
 12:07:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250628015328.249637-1-da@libre.computer> <CANAwSgTH67T9SBQSFQgFjvyrxNCbtfd9ZaCDZFACWA=ZQ-PYtQ@mail.gmail.com>
 <CAFBinCBwTkVwcBTWOzS+G13+rRM2eftMXZ3GHzW+F+BY0bBBzg@mail.gmail.com>
 <1j4ivued2q.fsf@starbuckisacylon.baylibre.com> <CACqvRUa8EqMbCd2x=di-a6jbMWW8CMo4kgLH=0qnsqHdO16kxA@mail.gmail.com>
 <CAFBinCAkW+G9oV+SOJdac50oLezQnbc358dBgs56-RfjPd-zgA@mail.gmail.com>
In-Reply-To: <CAFBinCAkW+G9oV+SOJdac50oLezQnbc358dBgs56-RfjPd-zgA@mail.gmail.com>
From: Da Xue <da@libre.computer>
Date: Wed, 2 Jul 2025 15:07:42 -0400
X-Gm-Features: Ac12FXx0jufvdl6aujys7rH-wYZHUiDrrOxM3msmfy3FnqnGlyUndPFaQqBHPFQ
Message-ID: <CACqvRUYwwgRqid8AbLJ7bp+gTyHw2c=o-pj435Z0PDriJcnnKQ@mail.gmail.com>
Subject: Re: [RFC] mmc: meson-gx-mmc: add delay during poweroff
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Da Xue <da@libre.computer>, Jerome Brunet <jbrunet@baylibre.com>, 
	Anand Moon <linux.amoon@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_120753_862110_EDE1F793 
X-CRM114-Status: GOOD (  17.84  )
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

T24gV2VkLCBKdWwgMiwgMjAyNSBhdCAyOjQw4oCvUE0gTWFydGluIEJsdW1lbnN0aW5nbAo8bWFy
dGluLmJsdW1lbnN0aW5nbEBnb29nbGVtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBXZWQsIEp1bCAy
LCAyMDI1IGF0IDc6MjLigK9QTSBEYSBYdWUgPGRhQGxpYnJlLmNvbXB1dGVyPiB3cm90ZToKPiA+
Cj4gPiBPbiBXZWQsIEp1bCAyLCAyMDI1IGF0IDE6MDfigK9QTSBKZXJvbWUgQnJ1bmV0IDxqYnJ1
bmV0QGJheWxpYnJlLmNvbT4gd3JvdGU6Cj4gPiAuLi4KPiA+ID4gSWYsIGFzIHRoZSBkZXNjcmlw
dGlvbiBzdWdnZXN0LCB0aGUgcmVndWxhdG9yIGZyYW1ld29yayBzb21laG93IGlnbm9yZQo+ID4g
PiB0aGUgdGltaW5nIHNldCBpbiBEVCwgbWF5YmUgdGhpcyBpcyB3aGF0IG5lZWRzIHRvIGJlIGNo
ZWNrZWQgPwo+ID4KPiA+IFRoZSByZWd1bGF0b3IgZnJhbWV3b3JrIG9ubHkgY2FyZXMgYWJvdXQg
dGltaW5nIGZvciByZWd1bGF0b3Igb24uCj4gPiBSZWd1bGF0b3Igb2ZmIGp1c3QgdHVybnMgb2Zm
IHRoZSByZWd1bGF0b3IgYW5kIHJldHVybnMgd2l0aG91dCBkZWxheS4KPiBUaGVyZSdzIGFuIGV4
Y2VwdGlvbiB0byB0aGlzOiBncGlvLXJlZ3VsYXRvcnMgd2l0aG91dCBhbiBlbmFibGUtZ3Bpb3MK
PiBwcm9wZXJ0eS4gTXkgdW5kZXJzdGFuZGluZyBpcyB0aGF0IHJlZ3VsYXRvcl9kaXNhYmxlKCkg
aXMgYSBuby1vcCBpbgo+IHRoYXQgY2FzZSAobWVzb25fbW1jX3NldF9pb3MoKSBldmVuIGhhcyBh
IGNvbW1lbnQgYWJvdmUgdGhlCj4gc3dpdGNoL2Nhc2Ugc3RhdGVtZW50KSwgc2VlIFswXS4KPgo+
ID4gVGhlIGNvZGUgbWFrZXMgaW5jb3JyZWN0IGFzc3VtcHRpb25zLiBUaGVuIHRoZSBrZXJuZWwg
cmVzZXRzIHRoZSBib2FyZAo+ID4gd2l0aG91dCBoYXZpbmcgZW5vdWdoIHRpbWUuCj4gQ2FuIHlv
dSBwbGVhc2UgbmFtZSB0aGUgYm9hcmQgeW91J3JlIHRlc3Rpbmc/IEknbSB3b3JyaWVkIHRoYXQg
SSdsbCBiZQo+IGxvb2tpbmcgYXQgb25lIC5kdHMgYnV0IHlvdSdyZSBsb29raW5nIGF0IGFub3Ro
ZXIgb25lLgoKaHR0cHM6Ly9naXRodWIuY29tL2xpYnJlLWNvbXB1dGVyLXByb2plY3QvbGlicmV0
ZWNoLWxpbnV4L2Jsb2IvbWFzdGVyL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1s
aWJyZXRlY2gtY290dG9ud29vZC5kdHNpI0w0ODEKCnZjY19jYXJkIGlzIGEgZ3BpbyByZWd1bGF0
b3IgdGhhdCBnZXRzIHRvZ2dsZWQgb24tPm9mZi0+b24uCgpJIHRyYWNlZCB0aGUgcmVndWxhdG9y
IGZyYW1ld29yayBhIGZldyB3ZWVrcyBhZ28gYW5kIGZvcmdvdCB0aGUgZmluYWwKcmVndWxhdG9y
IGRpc2FibGUgZnVuY3Rpb24gY2FsbCwgYnV0IHRoYXQgY2FsbCBiYXNpY2FsbHkgcmV0dXJuZWQK
aW1tZWRpYXRlbHkgd2hpbGUgdGhlIHJlZ3VsYXRvci1lbmFibGUgZnVuY3Rpb24gY29tcGxlbWVu
dCBoYWQgZGVsYXlzCmltcGxlbWVudGVkLgoKPgo+Cj4gQmVzdCByZWdhcmRzLAo+IE1hcnRpbgo+
Cj4KPiBbMF0gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjYuMTUvc291cmNlL2Ry
aXZlcnMvcmVndWxhdG9yL2NvcmUuYyNMMjk4MAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1s
b2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
