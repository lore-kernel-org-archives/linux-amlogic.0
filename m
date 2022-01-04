Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D53E6C433F5
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Jan 2022 08:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7PGlFxiH/NTuY1s8DcMQ7MvXeWJHZhQAwLdAJaxFEho=; b=Oe+grqSsL7gcZb
	kcz48vB9Gt8EanJLODkAd+TB5Myf1vt8zHEvr2ajZjwJlFX5RJQyXfx23gi9uh0Gu/FLK92WDWWy9
	+nIRaDME8iLV0NLIdQFVehCvPBZGDtTVrnwgjsqfi6stc3cI2hem6+wm0wA1oR/NIah3fDt5ffLy5
	4bDzN3beS24w9lbVbbc6k4hSRRFYQVESGd8RRLrNm6ihWf4G3pVxEKnTejXHGRk08XVy7+IHZ2B1g
	SzRnkx8Ky3DZJ6geF8R5PXRuIHzNjsfttoshKqY33nEbG3ZILib6aLp5BvlioY1o5dnicvUDVjGys
	OfNYJg5wSuY+NleV6S6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4f3t-00Aiah-34; Tue, 04 Jan 2022 08:20:53 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4f3h-00AiWq-9K; Tue, 04 Jan 2022 08:20:42 +0000
Received: from [10.18.29.173] (10.18.29.173) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Tue, 4 Jan
 2022 16:20:33 +0800
Message-ID: <1f16f430-677e-d1f0-1a7f-bf1d1a7c3c47@amlogic.com>
Date: Tue, 4 Jan 2022 16:20:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH V3 4/6] tty: serial: meson: The UART baud rate calculation
 is described using the common clock code. Also added S4 chip uart
 Compatible.
Content-Language: en-US
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC: <linux-serial@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jirislaby@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, Vyacheslav
 <adeep@lexina.in>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet
 <jbrunet@baylibre.com>
References: <20211230102110.3861-1-yu.tu@amlogic.com>
 <20211230102110.3861-5-yu.tu@amlogic.com>
 <CAFBinCCL-QaeSRCLzfyNXcRQZ7YC1D85rP2y4OGkAjCmQEqGgQ@mail.gmail.com>
 <3e1e40aa-7865-0f7a-5772-e2ad96c8141d@amlogic.com>
 <CAFBinCB2nF0TwRE1uJ4UTB_avcqRBfOHR1CDSe29dB1o-YjEHQ@mail.gmail.com>
 <7278bace-a2b9-0cfc-55b3-c19311e3352e@amlogic.com>
 <CAFBinCCwE1DbP+Y49o3WxNdeE11ZK=HcGbXa0Sq52tch+eNhrQ@mail.gmail.com>
From: Yu Tu <yu.tu@amlogic.com>
In-Reply-To: <CAFBinCCwE1DbP+Y49o3WxNdeE11ZK=HcGbXa0Sq52tch+eNhrQ@mail.gmail.com>
X-Originating-IP: [10.18.29.173]
X-ClientProxiedBy: mail-sh.amlogic.com (10.18.11.5) To mail-sh.amlogic.com
 (10.18.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220104_002041_379547_2AC89389 
X-CRM114-Status: GOOD (  16.19  )
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

SGkgTWFydGluLAoJVGhhbmsgeW91IHZlcnkgbXVjaCBmb3IgeW91ciByZXBseS4KT24gMjAyMi8x
LzMgMzozNiwgTWFydGluIEJsdW1lbnN0aW5nbCB3cm90ZToKPiBbIEVYVEVSTkFMIEVNQUlMIF0K
PiAKPiBIaSwKPiAKPiBPbiBTYXQsIEphbiAxLCAyMDIyIGF0IDI6MzAgUE0gWXUgVHUgPHl1LnR1
QGFtbG9naWMuY29tPiB3cm90ZToKPiBbLi4uXQo+Pj4gSW50ZXJlc3RpbmcsIHRoYW5rcyBmb3Ig
c2hhcmluZyB0aGF0IHUtYm9vdCB0dXJucyB0aGVzZSBjbG9ja3Mgb24uCj4+PiBMZXQncyBzYXkg
c29tZW9uZSB3YW50ZWQgdG8gbWFrZSB1LWJvb3Qgc2F2ZSBwb3dlciBhbmQgdHVybiBvZmYgYWxs
Cj4+PiBVQVJUIGNsb2NrcyBleGNlcHQgdGhlIG9uZSBmb3IgdWFydF9BTyAod2hlcmUgd2UgdHlw
aWNhbGx5IGNvbm5lY3QgdGhlCj4+PiBzZXJpYWwgY29uc29sZSkuCj4+PiBJbiB0aGF0IGNhc2Ug
dGhlIHBjbGsgb2YgdWFydF9DIChqdXN0IHRvIGNob29zZSBhbiBleGFtcGxlIGhlcmUpIGlzCj4+
PiB0dXJuZWQgb2ZmLiBXb3VsZCB0aGVyZSBiZSBhIHByb2JsZW0gdGhlbiBhY2Nlc3NpbmcgdGhl
IHJlZ2lzdGVycyBvZgo+Pj4gdWFydF9DIGJlZm9yZSBjbGtfcHJlcGFyZV9lbmFibGUgaXMgY2Fs
bGVkPwo+PiBUaGUgd2F5IHlvdSBkZXNjcmliZSBpdCwgaXQgZG9lcyBoYW5nLiBUaGlzIHdvdWxk
IG5vdCBiZSByZWNvbW1lbmRlZCBvbgo+PiBhY3R1YWwgcHJvamVjdHMuCj4+Cj4+IEF0IHByZXNl
bnQsIEFtTG9naWMgY2hpcHMgYXJlIG9sZGVyIHRoYW4gUzQgU29jLCBhbmQgd2UgaGF2ZSBubyB3
YXkgdG8KPj4gZGVhbCB3aXRoIHRoaXMgcHJvYmxlbS4gV2UgaGF2ZSB0byB0ZWxsIGN1c3RvbWVy
cyBub3QgdG8gdXNlIGl0IGluIHRoaXMKPj4gd2F544CCQ3VzdG9tZXJzIHJhcmVseSB1c2UgaXQg
aW4gcmVhbCBwcm9qZWN0cy5PbiB0aGUgUzQgU09DIHdlIHdpbGwgdXNlCj4+IGEgY2xvY2sgbGlr
ZSB0aGUgVUFSVCBwY2xrIHRvIGNvbnRyb2wgdGhlIHNodXRkb3duIHVzaW5nIHR3byByZWdpc3Rl
cnMsCj4+IG9uZSBzYWZlIChuZWVkIHRvIG9wZXJhdGUgaW4gRUwzKSBhbmQgb25lIG5vcm1hbCAo
RUwxKS4gSXQgd2lsbCBvbmx5IGJlCj4+IGNsb3NlZCBpZiBib3RoIHJlZ2lzdGVycyBhcmUgY2xv
c2VkLiBUaGlzIG1haW5seSBwcmV2ZW50cyBtaXNvcGVyYXRpb24uCj4gb2gsIGludGVyZXN0aW5n
IHRoYXQgdGhlcmUncyBzb21lIHVwZGF0ZXMgc3BlY2lmaWNhbGx5IHdpdGggdGhlIFM0IFNvQ3Mg
Oi0pCj4gCj4+IFdpdGggeW91ciBleHBlcmllbmNlLCBJJ2QgbGlrZSB0byBrbm93IGhvdyB5b3Ug
ZGVhbCB3aXRoIHRoaXMga2luZCBvZgo+PiBwcm9ibGVtLgo+IEJlZm9yZSB0aGlzIHBhdGNoIHRo
ZSBkcml2ZXIgc2ltcGx5IHR1cm5zIG9uIHRoZSBjbG9jayBmcm9tIHdpdGhpbgo+IG1lc29uX3Vh
cnRfcHJvYmUoKSAoc3BlY2lmaWNhbGx5IGl0IGRvZXMgc28gaW4KPiBtZXNvbl91YXJ0X3Byb2Jl
X2Nsb2NrKCkpLgo+IEkgdGhpbmsgdGhlcmUncyBhZHZhbmNlZCBwb3dlci1zYXZpbmcgdGVjaG5p
cXVlcy4gTWF5YmUgZm9yIG5vdyB3ZQo+IGtlZXAgaXQgc2ltcGxlIGFuZCBqdXN0IGVuYWJsZSB0
aGUgY2xvY2socykgYXQgcHJvYmUgdGltZSBhbmQgZGlzYWJsZQo+IHRoZW0gYXQgZHJpdmVyIHJl
bW92ZSB0aW1lLiBXaGF0IGRvIHlvdSB0aGluaz8KPiAKSSBhZ3JlZSB3aXRoIHlvdS4KPiAKPiBC
ZXN0IHJlZ2FyZHMsCj4gTWFydGluCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2lj
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1hbWxvZ2ljCg==
