Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A645C433EF
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Jan 2022 13:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=APAE51IpQSgwNuvqxbpIeOUGXs9kc3bexKzkmRbMQ0Y=; b=UO6qcNcEo+nhF9
	qbVGVDvNowBq67SbFY3AedZapWlpbG4wSu17+PR8bD0Dr4lFvrU60l+XJs2pRRRKOaGH3qXIjpn5Q
	iLNHcpyxfVyWOXf6eXLzvfzHu5MCaLZIipqZ0IT9xTxFkt5tJcNtFRMvDnYX552uX47Z85AkCDOcm
	vpAcG/mBWv9RO1Hh9ib9R1DKOjaRmhXm2oEVlw43UeS/ITIamf7cQEUirUBqWWV2frcgK4d4/5vm3
	F747l7bkCBN8xdfawRm90+XhSMErMGtJo3xxCh8F4rES3ewdOHie6krgfsbHP2BuU3ao+sgpdaWYB
	nigZE7GKF7NR+CB16dQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4NqG-0098w0-Sf; Mon, 03 Jan 2022 13:57:40 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4NqC-0098ua-Qy
 for linux-amlogic@lists.infradead.org; Mon, 03 Jan 2022 13:57:39 +0000
Received: by mail-wr1-x42c.google.com with SMTP id s1so70066217wra.6
 for <linux-amlogic@lists.infradead.org>; Mon, 03 Jan 2022 05:57:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=s9ejwD9yhPYnVOGboXQSQzo2YN5XrVTHlsEd+M9MQHE=;
 b=wzBKbDAT5VRzexaEy8OyRR1b3uAcZJPFyF8c9jqe454LDDm16miT7mQScfNP/UTBQC
 xSztPVKdpGBwu5n0POlroE2LQFgpKKDQthfVRs1mlndwVnRGSSI8Zk/5zYPAw4ZwDwAC
 XZdSZzlOpk2vFwKj7e64oMMshnR99514Zn1b/vpmfDUx7nCkLcHICbZw+jfvPp86Vhd0
 hlnyoTlf8XjK41Lz5gXhvt4ogbsajxty3MlX2gOY6VKIeMStwKLOCQ4Vcd3zrBMrVEo6
 Q4NepwRPLWsoiu/F+c/jlSMJFRPW/yGNF67FchApLOQw4O22ad4NvW5LdL2N8YNjNIkx
 sNuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=s9ejwD9yhPYnVOGboXQSQzo2YN5XrVTHlsEd+M9MQHE=;
 b=UC6XFg7/zbsjkRy1ndXMnxJMMfhOcm9Ee4Qt7wt/Y+YlDKEJQgUdG+XR/FQN6CVYhy
 hwYQb8iLDFpcjkSubBxbFbtGjKH78PvzJnM3mUkfSk/zQJZvMvi+UlINAB1OW30IwFPA
 MBEHTIF1b9Mh+Y8LnPKG7fYxSVe3wx00p6g4gb4hBYAdMe+5roLet135agUyQ7rNj5I3
 h7HIf9ivooktPIT+tukCFyg1eivLOahr9mKF67JyRkTzb5WrgpQAKDMPtA9qh0iQ3Cvi
 jCxwHSsnJs4vBDGCfXJwiSUedGvfnhHPF/q2cYY2Ae6I5LJ62aCObNM4/3VxWqHUTj0E
 3Rtw==
X-Gm-Message-State: AOAM533MdxTp2kbk6fuvVwofwfH+ardV+0Pkm07o6MLOeveNk3vlpCHK
 dPjTPWNsktyYL2LV1rQqdjMrQQ==
X-Google-Smtp-Source: ABdhPJxghNu6jAsWSh6bWzVfWgWaf7nRMDXoUZYnhoeOqlJPnOE8PWM88b7d69tpC9s+zfplC2ZXqg==
X-Received: by 2002:adf:97c2:: with SMTP id t2mr39143444wrb.577.1641218253101; 
 Mon, 03 Jan 2022 05:57:33 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id y8sm38527606wrd.10.2022.01.03.05.57.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jan 2022 05:57:32 -0800 (PST)
References: <20211230102110.3861-1-yu.tu@amlogic.com>
 <20211230102110.3861-5-yu.tu@amlogic.com>
 <CAFBinCCL-QaeSRCLzfyNXcRQZ7YC1D85rP2y4OGkAjCmQEqGgQ@mail.gmail.com>
 <3e1e40aa-7865-0f7a-5772-e2ad96c8141d@amlogic.com>
 <CAFBinCB2nF0TwRE1uJ4UTB_avcqRBfOHR1CDSe29dB1o-YjEHQ@mail.gmail.com>
 <7278bace-a2b9-0cfc-55b3-c19311e3352e@amlogic.com>
User-agent: mu4e 1.6.10; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Yu Tu <yu.tu@amlogic.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>
Cc: linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jirislaby@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Vyacheslav <adeep@lexina.in>, Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH V3 4/6] tty: serial: meson: The UART baud rate
 calculation is described using the common clock code. Also added S4 chip
 uart Compatible.
Date: Mon, 03 Jan 2022 14:50:06 +0100
In-reply-to: <7278bace-a2b9-0cfc-55b3-c19311e3352e@amlogic.com>
Message-ID: <1jbl0s9b1w.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220103_055736_913737_089456C3 
X-CRM114-Status: GOOD (  31.15  )
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

Ck9uIFNhdCAwMSBKYW4gMjAyMiBhdCAyMTozMCwgWXUgVHUgPHl1LnR1QGFtbG9naWMuY29tPiB3
cm90ZToKCj4gSGkgTWFydGluLAo+ICAgICBUaGFuayB5b3UgdmVyeSBtdWNoIGZvciB5b3VyIHJl
cGx5Lgo+Cj4gT24gMjAyMS8xMi8zMSAyMzozMiwgTWFydGluIEJsdW1lbnN0aW5nbCB3cm90ZToK
Pj4gWyBFWFRFUk5BTCBFTUFJTCBdCj4+IE9uIEZyaSwgRGVjIDMxLCAyMDIxIGF0IDEyOjI0IFBN
IFl1IFR1IDx5dS50dUBhbWxvZ2ljLmNvbT4gd3JvdGU6Cj4+IFsuLi5dCj4+Pj4+ICAgIHN0YXRp
YyBpbnQgbWVzb25fdWFydF9yZXF1ZXN0X3BvcnQoc3RydWN0IHVhcnRfcG9ydCAqcG9ydCkKPj4+
Pj4gICAgewo+Pj4+PiArICAgICAgIHN0cnVjdCBtZXNvbl91YXJ0X2RhdGEgKnByaXZhdGVfZGF0
YSA9IHBvcnQtPnByaXZhdGVfZGF0YTsKPj4+Pj4gKyAgICAgICBpbnQgcmV0Owo+Pj4+PiArCj4+
Pj4+ICsgICAgICAgcmV0ID0gY2xrX3ByZXBhcmVfZW5hYmxlKHByaXZhdGVfZGF0YS0+cGNsayk7
Cj4+Pj4+ICsgICAgICAgaWYgKHJldCkKPj4+Pj4gKyAgICAgICAgICAgICAgIHJldHVybiByZXQ7
Cj4+Pj4+ICsKPj4+Pj4gKyAgICAgICByZXQgPSBjbGtfcHJlcGFyZV9lbmFibGUocHJpdmF0ZV9k
YXRhLT5iYXVkX2Nsayk7Cj4+Pj4+ICsgICAgICAgaWYgKHJldCkgewo+Pj4+PiArICAgICAgICAg
ICAgICAgY2xrX2Rpc2FibGVfdW5wcmVwYXJlKHByaXZhdGVfZGF0YS0+cGNsayk7Cj4+Pj4+ICsg
ICAgICAgICAgICAgICByZXR1cm4gcmV0Owo+Pj4+PiArICAgICAgIH0KPj4+PiBUaGlzIGNvZGUg
aXMgZnJvbSBteSBvcmlnaW5hbCBzdWdnZXN0aW9uIC0gYW5kIEkgaGFkIGEgZG91YnQgdGhlcmUK
Pj4+PiB3aGljaCBJIGZvcmdvdCB0byBhZGQgYXMgYSBjb21tZW50IG9yaWdpbmFsbHk6Cj4+Pj4g
Q2FuIHlvdSBjb25maXJtIHRoYXQgYWNjZXNzaW5nIHRoZSBVQVJUIGNvbnRyb2xsZXIgcmVnaXN0
ZXJzIHdvcmtzCj4+Pj4gZXZlbiB3aGVuICJwY2xrIiBpcyB0dXJuZWQgb2ZmPwo+Pj4+IEkgYW0g
YXNraW5nIHRoaXMgYmVjYXVzZSB0aGUgY29tbW9uIGNsb2NrIGZyYW1ld29yayBjYW4gYWNjZXNz
IHRoZQo+Pj4+IGNsb2NrcyBhdCBhbnkgdGltZS4KPj4+PiBBbmQgSSBoYXZlIHNlZW4gU29DcyB3
aGljaCB3b3VsZCBoYW5nIHdoZW4gdHJ5aW5nIHRvIGFjY2VzcyBhIG1vZHVsZSdzCj4+Pj4gcmVn
aXN0ZXJzIHdoaWxlIHRoZSBtb2R1bGUncyBwY2xrIGlzIHR1cm5lZCBvZmYuCj4+PiBPbiBhbGwg
bWVzb24gcGxhdGZvcm1zLCB0aGUgZGVmYXVsdCBwY2xrIGZvciBhbGwgVUFSVCBpcyB0dXJuZWQg
b24KPj4+IGR1cmluZyB0aGUgdS1ib290IHBoYXNlLiBXaGVuIHJlZ2lzdGVyaW5nIHVhcnQgcGNs
ayBpbiB0aGUga2VybmVsIHBoYXNlLAo+Pj4gdGhlIENMS19JR05PUkVfVU5VU0VEIGZsYWcgaXMg
YWRkZWQuIFNvIHRoZSByZWFsIHNodXRkb3duIGlzIHdoZW4gdGhlCj4+PiBzdGFuZGJ5IGdvZXMg
ZG93biwgdGhlIHBhcmVudCBjbGsgc2h1dHMgZG93bi4KPj4gSW50ZXJlc3RpbmcsIHRoYW5rcyBm
b3Igc2hhcmluZyB0aGF0IHUtYm9vdCB0dXJucyB0aGVzZSBjbG9ja3Mgb24uCj4+IExldCdzIHNh
eSBzb21lb25lIHdhbnRlZCB0byBtYWtlIHUtYm9vdCBzYXZlIHBvd2VyIGFuZCB0dXJuIG9mZiBh
bGwKPj4gVUFSVCBjbG9ja3MgZXhjZXB0IHRoZSBvbmUgZm9yIHVhcnRfQU8gKHdoZXJlIHdlIHR5
cGljYWxseSBjb25uZWN0IHRoZQo+PiBzZXJpYWwgY29uc29sZSkuCj4+IEluIHRoYXQgY2FzZSB0
aGUgcGNsayBvZiB1YXJ0X0MgKGp1c3QgdG8gY2hvb3NlIGFuIGV4YW1wbGUgaGVyZSkgaXMKPj4g
dHVybmVkIG9mZi4gV291bGQgdGhlcmUgYmUgYSBwcm9ibGVtIHRoZW4gYWNjZXNzaW5nIHRoZSBy
ZWdpc3RlcnMgb2YKPj4gdWFydF9DIGJlZm9yZSBjbGtfcHJlcGFyZV9lbmFibGUgaXMgY2FsbGVk
Pwo+IFRoZSB3YXkgeW91IGRlc2NyaWJlIGl0LCBpdCBkb2VzIGhhbmcuIFRoaXMgd291bGQgbm90
IGJlIHJlY29tbWVuZGVkIG9uCj4gYWN0dWFsIHByb2plY3RzLgo+Cj4gQXQgcHJlc2VudCwgQW1M
b2dpYyBjaGlwcyBhcmUgb2xkZXIgdGhhbiBTNCBTb2MsIGFuZCB3ZSBoYXZlIG5vIHdheSB0byBk
ZWFsCj4gd2l0aCB0aGlzIHByb2JsZW0uIFdlIGhhdmUgdG8gdGVsbCBjdXN0b21lcnMgbm90IHRv
IHVzZSBpdCBpbiB0aGlzIHdheeOAggo+IEN1c3RvbWVycyByYXJlbHkgdXNlIGl0IGluIHJlYWwg
cHJvamVjdHMuT24gdGhlIFM0IFNPQyB3ZSB3aWxsIHVzZSBhIGNsb2NrCj4gbGlrZSB0aGUgVUFS
VCBwY2xrIHRvIGNvbnRyb2wgdGhlIHNodXRkb3duIHVzaW5nIHR3byByZWdpc3RlcnMsIG9uZSBz
YWZlCj4gKG5lZWQgdG8gb3BlcmF0ZSBpbiBFTDMpIGFuZCBvbmUgbm9ybWFsIChFTDEpLiBJdCB3
aWxsIG9ubHkgYmUgY2xvc2VkIGlmCj4gYm90aCByZWdpc3RlcnMgYXJlIGNsb3NlZC4gVGhpcyBt
YWlubHkgcHJldmVudHMgbWlzb3BlcmF0aW9uLgo+Cj4gV2l0aCB5b3VyIGV4cGVyaWVuY2UsIEkn
ZCBsaWtlIHRvIGtub3cgaG93IHlvdSBkZWFsIHdpdGggdGhpcyBraW5kIG9mCj4gcHJvYmxlbS4K
ClJlbHlpbmcgb24gdGhlIENMS19JR05PUkVfVU5VU0VEIGFuZCB0aGUgYm9vdCBsb2FkZXIgaXMg
dW5zYWZlLgpBcyBNYXJ0aW4gaXMgc3VnZ2VzdGluZywgdGhlIGRyaXZlciBtdXN0IGVuc3VyZSBw
Y2xrIGlzIG9uIGJlZm9yZQp0b3VjaGluZyBhbnkgcmVnaXN0ZXIuCgpUaGlzIHdhcyBkb25lIGlu
IHRoZSBwcm9iZSBiZWZvcmUgaW4gcHJvYmUgYmVmb3JlIHlvdXIgY2hhbmdlIHdoaWNoCnNlZW1z
IHNhZmUgYnV0IG1heWJlIG5vdCBvcHRpbWFsLgoKQWdhaW4sIElmIHlvdSB3aXNoIHRvIG9wdGlt
aXplIHRoYXQsIHBsZWFzZSBkbyBzbyBpbiBhbm90aGVyIGRlZGljYXRlZApjaGFuZ2Ugc28gd2Ug
Y2FuIGRpc2N1c3MgaXQgYW5kIG1ha2Ugc3VyZSBpdCBpcyBzdGlsbCBzYWZlCgo+PiBbLi4uXQo+
Pj4+PiAgICAgICAgICAgcG9ydC0+Zmlmb3NpemUgPSA2NDsKPj4+PiBjb21taXQgMjdkNDRlMDVk
N2I4NWQgKCJ0dHk6IHNlcmlhbDogbWVzb246IHJldHJpZXZlIHBvcnQgRklGTyBzaXplCj4+Pj4g
ZnJvbSBEVCIpIFswXSBmcm9tIE1heSAyMDIxIGhhcyBjaGFuZ2VkIHRoaXMgbGluZSB0bzoKPj4+
PiAgICAgcG9ydC0+Zmlmb3NpemUgPSBmaWZvc2l6ZTsKPj4+PiBTbyB5b3VyIHBhdGNoIGN1cnJl
bnRseSBkb2VzIG5vdCBhcHBseSB0byBsaW51eC1uZXh0IChvciBldmVuIExpbnVzJwo+Pj4+IG1h
aW5saW5lIHRyZWUpLgo+Pj4+Cj4+PiBTbyBkbyBJIG5lZWQgdG8gd2FpdCBmb3IgWzBdIHBhdGNo
IG1lcmdlZCBiZWZvcmUgSSBjYW4gY29udGludWUgdG8gbWFrZQo+Pj4gY2hhbmdlcyA/Cj4+IFRo
ZXNlIGNoYW5nZXMgYXJlIGFscmVhZHkgbWVyZ2VkLgo+PiAKPj4+IFdoYXQgY2FuIEkgZG8gYmVm
b3JlPwo+PiBZb3Ugc2hvdWxkIGJhc2UgeW91ciBjaGFuZ2VzIG9uIHRvcCBvZiB0aGUgdHR5Lmdp
dC90dHktbmV4dCBicmFuY2ggWzFdCj4+IHdoZXJlIEdyZWcgKHRoZSBtYWludGFpbmVyIG9mIHRo
aXMgdHJlZSkgd2lsbCBwaWNrIHVwIHRoZSBwYXRjaGVzIG9uY2UKPj4gdGhleSBhcmUgZ29vZCAo
Z290IGVub3VnaCBBY2tlZC1ieS9SZXZpZXdlZC1ieSwgZXRjLikuCj4+IEkgc3VzcGVjdCB0aGF0
IHlvdSBiYXNlZCB5b3VyIGNoYW5nZXMgb24gYW4gb2xkZXIgb3Igc3RhYmxlIGtlcm5lbAo+PiB2
ZXJzaW9uIChsZXQncyBzYXkgNS4xMCkuIE5ldyBmdW5jdGlvbmFsaXR5IHNob3VsZCBhbHdheXMg
Z2V0IGludG8gdGhlCj4+IC1uZXh0IHRyZWUgd2hlcmUgdmFyaW91cyBhdXRvLWJ1aWxkIHJvYm90
cyB3aWxsIGNvbXBpbGUtdGVzdCB0aGUKPj4gY2hhbmdlcyBhbmQgd2UgZXZlbiBoYXZlIEtlcm5l
bCBDSSB3aGVyZSBjaGFuZ2VzIGFyZSB0ZXN0ZWQgb24gcmVhbAo+PiBoYXJkd2FyZSAoQmF5TGli
cmUgZXZlbiBtYWludGFpbnMgQW1sb2dpYyBib2FyZHMgaW4gdGhlaXIgS2VybmVsIENJCj4+IGxh
YnMpLiBMZXQncyBzYXkgQW1sb2dpYyB1cGRhdGVzIHRvIExpbnV4IDUuMTcgbmV4dCB5ZWFyIHRo
ZW4gdGhlCj4+IHBhdGNoZXMgYXJlIGFscmVhZHkgaW5jbHVkZWQgaW4gdGhhdCBrZXJuZWwgdmVy
c2lvbiAtIGluc3RlYWQgb2YgYmVpbmcKPj4gb25seSBhdmFpbGFibGUgaW4gTGludXggNS4xMC4K
Pj4gCj4gSSdtIHNvcnJ5LCBJIGRpZCBicmFuY2ggY29uZmlybSB0aGVyZSB3YXMgYSBtaXN0YWtl
LCBJIGhhdmUgY29ycmVjdGVkLgo+PiBCZXN0IHJlZ2FyZHMsCj4+IE1hcnRpbgo+PiAKPj4gWzFd
IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2dyZWdraC90
dHkuZ2l0L2xvZy8/aD10dHktbmV4dAo+PiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxv
Z2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
