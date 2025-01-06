Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2725E77199
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Jan 2025 14:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M3LsVk6xgQgxpBUFrQQhLegy1z9WWtkXIft1Mm2dyUw=; b=Umr4xXc13fSHL0
	NOSjLzytXrUzOu404OEK8OaUmKwViHs8eYstxLOPe87Kbx+VjQsh7Mtnv8u5uTa1IP5rPoAtf7NwT
	86kTIH0bwn6wqNZl2w/fUmx5M3ZyRSxAGdZSGDD2Q9g7UEbkBH6INB1LT+IsZYjFAI7lCKTHxdSxq
	jtZvQ/fHVjRPNcSj0ns3OVSbMn6s+jVZOYn/70KFMPyOaEGCLZueljYKNo4UnNdAXllm3f3LN/+y1
	aMQRi2bI67pbu/Qtn5dSysO3Ed9zNwn9ho5c1gUfeTOJszuDP6S4jY+G+0UJdpvV7L/FMdVF1Xh8+
	Q7obUGMsldeJ0WPBhm7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUoSO-00000001ebQ-2w7U;
	Mon, 06 Jan 2025 14:51:52 +0000
Received: from mail-wm1-f42.google.com ([209.85.128.42])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUnPu-00000001Rqg-1gte;
	Mon, 06 Jan 2025 13:45:15 +0000
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43690d4605dso62344515e9.0;
        Mon, 06 Jan 2025 05:45:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736171112; x=1736775912; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ItfAlhegRqUnAayH03vNTd/Xo24KQrqpjT4xjTRai64=;
        b=IF7QCQRtoIS1DCg5ifXPAXcEpQy9eC4iVOVR/SvepKSE4vTUai+QcK77aLoo33868U
         AriuVDQ5X5zbX5F8u7xJYWVB4ud6CuAdok0O8Q5v0Xncu1TLnzGWJTt9EcQBJ2hgmOO0
         MduUF0Gw2TClyqKGX453Q9stAHueGKAHUtyj4a8+67rEnmyZFpv/3rh0Btc2mLEEICI4
         Fls3PytRuGRNE+fmvxKsGcVvyjXuVK7YztuPpI/LnmDBm7iLpeHXWkgvoHEQ/TrHH3QP
         5U46n9KDdOZkU+Z5c7DXm2xiCfuXz6E1MnP5DztaewP3ivC7OXJkswhsHKyyk6XBsAbo
         aYJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736171112; x=1736775912;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ItfAlhegRqUnAayH03vNTd/Xo24KQrqpjT4xjTRai64=;
        b=s0i3V4Wk6VLEcPDr/aVCKRtDMzmhLz+YsPJauuCu8VCPCnbc0TWA2GEBs/TOyAT7tG
         A7KQLtQ6e54E8R3+ixqn51HyXt5DG0H76SM+R74pYfNUa7p09r9aawy1fHMbke7TLypN
         pxMKqVhr4Hykpfa8pDlc9MzDnUTEwOvwxze7LdOLT+WKLM0JLTGd46mzfuCsUM4nx5kt
         Q2POwzjQh9PTxahGysIfshl1lZBeqV36v1FCjrbiAv+q8LJqsB4xQfWw3/k++8qmcXjH
         SVE7OBDgRz/WnqceNdvlbDYEAzjTlMBJFUuDwf+5BAYhWQmAI+ZDICsfYN571/Q9EXVq
         RFlg==
X-Forwarded-Encrypted: i=1; AJvYcCURhnUubYcs5Cf9LIFi5Woab4CZt4KYj5EsAtmJMYDMlUWjOCs5hjJWz3CDZ4UwSiFs1MLwxL1OxL+LlnxGe2KJrA==@lists.infradead.org, AJvYcCXV1udzgH663o1WcrRZA9qwl+QAOSwwpuUSUS0QuprgMLfiKXkJsukN2hONnK/g1iJNE+OBcjDXdomb0oQ8@lists.infradead.org
X-Gm-Message-State: AOJu0YzZWMQB54EtpGPAoiefAiBKXn1L4jyxV9UlWka6Dzh69KADoH8m
	Hh7hZWyOq4dbcahyyOIQgfAz/VfZ9DFAbP/M9D9Etr0DKSPZSXYW
X-Gm-Gg: ASbGnctm1LnleO9N/xrNKgWpGQnaerPt3wuYr0CgJKI1551YMKmYptxkx1ITsec59m2
	G3gaT6rN87K2GzxCsQWGNe78CVqVegDEFElAEgtBy9+TwPd1yFtiIUT0GIGlR/HGtYqOnWsZEPg
	77aP+7SO1ZcR0C9TKQD66vv+IA70UAaJQFuiRyFuKQ6irH3iWAwWvZ0P9erOkl6DeNR/3W4SLjA
	duEBtHZQaTGyYvOvHXoqz/lDfeNTY9B52wULb0tLvBcYM9k6CyRzif2e8ZHiQ7kpbX8fipQ6JUv
	FGQ=
X-Google-Smtp-Source: AGHT+IFpYq7jObg5i1HWdwSt3YUPjDcKdkOSTUzwLSeVbBRKvKflO+nH3UXeFLKIJPIauB4ckmahgA==
X-Received: by 2002:a05:600c:4510:b0:436:5fc9:30ba with SMTP id 5b1f17b1804b1-43668b783d0mr462344865e9.29.1736171111550;
        Mon, 06 Jan 2025 05:45:11 -0800 (PST)
Received: from smtpclient.apple ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8474c2sm47324663f8f.55.2025.01.06.05.45.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Jan 2025 05:45:11 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.200.121\))
Subject: Re: [RFC PATCH v1 2/2] iio: adc: meson: add support for the GXLX SoC
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <CAFBinCBxaVet9HxW98uCSDnv1XVXV6r4V9Z3BRmZJypTcxDZ0Q@mail.gmail.com>
Date: Mon, 6 Jan 2025 17:44:56 +0400
Cc: Jonathan Cameron <jic23@kernel.org>,
 linux-amlogic@lists.infradead.org,
 linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 gnstark@salutedevices.com,
 lars@metafoo.de,
 robh@kernel.org,
 krzk+dt@kernel.org,
 conor+dt@kernel.org
Message-Id: <5CEDC847-2653-42F3-A85E-A06D6E5DB135@gmail.com>
References: <20241231194207.2772750-1-martin.blumenstingl@googlemail.com>
 <20241231194207.2772750-3-martin.blumenstingl@googlemail.com>
 <20250104135912.390ec87c@jic23-huawei>
 <CAFBinCBxaVet9HxW98uCSDnv1XVXV6r4V9Z3BRmZJypTcxDZ0Q@mail.gmail.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-Mailer: Apple Mail (2.3826.200.121)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_054514_438506_E9DE6726 
X-CRM114-Status: GOOD (  25.01  )
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

PiBPbiA1IEphbiAyMDI1LCBhdCA3OjQ54oCvcG0sIE1hcnRpbiBCbHVtZW5zdGluZ2wgPG1hcnRp
bi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+IHdyb3RlOgo+IAo+IEhpIEpvbmF0aGFuLAo+
IAo+IE9uIFNhdCwgSmFuIDQsIDIwMjUgYXQgMjo1OeKAr1BNIEpvbmF0aGFuIENhbWVyb24gPGpp
YzIzQGtlcm5lbC5vcmc+IHdyb3RlOgo+PiAKPj4gT24gVHVlLCAzMSBEZWMgMjAyNCAyMDo0Mjow
NyArMDEwMAo+PiBNYXJ0aW4gQmx1bWVuc3RpbmdsIDxtYXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2ds
ZW1haWwuY29tPiB3cm90ZToKPj4gCj4+PiBUaGUgU0FSQURDIElQIG9uIHRoZSBHWExYIFNvQyBp
dHNlbGYgaXMgaWRlbnRpY2FsIHRvIHRoZSBvbmUgZm91bmQgb24KPj4+IEdYTCBTb0NzLiBIb3dl
dmVyLCBHWExYIFNvQ3MgcmVxdWlyZSBwb2tpbmcgdGhlIGZpcnN0IHRocmVlIGJpdHMgaW4gdGhl
Cj4+PiBNRVNPTl9TQVJfQURDX1JFRzEyIHJlZ2lzdGVyIHRvIGdldCB0aGUgdGhyZWUgTVBMTCBj
bG9ja3MgKHVzZWQgYXMgY2xvY2sKPj4+IGdlbmVyYXRvcnMgZm9yIHRoZSBhdWRpbyBmcmVxdWVu
Y2llcykgdG8gd29yay4KPj4+IAo+Pj4gVGhlIHJlYXNvbiB3aHkgdGhlcmUgYXJlIE1QTEwgY2xv
Y2sgYml0cyBpbiB0aGUgQURDIHJlZ2lzdGVyIHNwYWNlIGlzCj4+PiBlbnRpcmVseSB1bmtub3du
IGFuZCBpdCBzZWVtcyB0aGF0IG5vYm9keSBpcyBhYmxlIHRvIGNvbW1lbnQgb24gdGhpcy4KPj4+
IFNvIGNsZWFybHkgbWFyayB0aGlzIGFzIGEgd29ya2Fyb3VuZCBhbmQgYWRkIGEgd2FybmluZyBz
byB1c2VycyBhcmUKPj4+IG5vdGlmaWVkIHRoYXQgdGhpcyB3b3JrYXJvdW5kIGNhbiBjaGFuZ2Ug
KG9uY2Ugd2Uga25vdyB3aGF0IHRoZXNlIGJpdHMKPj4+IGFjdHVhbGx5IGRvKS4KPj4gCj4+IFNv
IElJVUMgdGhpcyBpcyB0byBtYWtlIHNvbWUgbm9uIEFEQyBjb21wb25lbnQgd29yay4KPiBUaGF0
J3MgY29ycmVjdAo+IAo+PiBIb3cgYXJlIHlvdSBoYW5kbGluZyBkZXBlbmRlbmNpZXM/ICBUaGUg
QURDIGRyaXZlciBtaWdodCBub3QgYmUgbG9hZGVkIG9yCj4+IGlzIHRoZXJlIHNvbWUgcmVhc29u
IGl0IGRlZmluaXRlbHkgaXMgYXQgdGhlIHBvaW50IHdoZXJlIHRoZSBhdWRpbyBkcml2ZXIKPj4g
bG9hZHM/Cj4gVW5mb3J0dW5hdGVseSB0aGVyZSBhcmUgbm8gZGVwZW5kZW5jaWVzIGF0IHRoZSBt
b21lbnQuCj4gVG8gbWUgaXQncyBub3QgZXZlbiAxMDAlIGNsZWFyIGlmIHRob3NlIGJpdHMgYXJl
IGEgZGVwZW5kZW5jeSBmb3IgdGhlCj4gYXVkaW8gSVAgb3IgaWYgdGhleSBhcmUgaW5zdGVhZCBs
aW5rZWQgd2l0aCB0aGUgY2xvY2sgY29udHJvbGxlciAobW9yZQo+IGJhY2tncm91bmQgaW5mbzog
c29tZSBvZiB0aGUgTVBMTCBjbG9ja3MgYXJlIC0gYXQgbGVhc3QgaW4gdGhlb3J5LCBpbgo+IHBy
YWN0aWNlIHdlIGRvbid0IHVzZSB0aGF0IC0gYXJlIGFsc28gdXNlZCBhcyBpbnB1dCBmb3IgdGhl
IE1hbGkgR1BVCj4gYW5kIHZpZGVvIHN1YnN5c3RlbS4gVGhlIG9ubHkgcHJhY3RpY2FsIHVzYWdl
IHRoYXQgSSdtIGF3YXJlIG9mIGlzIHRoZQo+IGF1ZGlvIGNvbnRyb2xsZXIpLgoKSW4gbXkgdGVz
dGluZyBpdCBtYWtlcyBubyBkaWZmZXJlbmNlIHRvIHRoZSBhdWRpbyBkcml2ZXIgd2hlbiB0aGUg
YWRjCmJpdCBwb2tlIGlzIGRvbmUuIFRoZSBhdWRpbyBkcml2ZXIgcHJvYmVzIGFuZCBsb2FkcyBh
bmQgeW91IGNhbiBwbGF5Cm1lZGlhIHdpdGhvdXQgZ2VuZXJhdGluZyBhbnkgdmlzaWJsZSBlcnJv
cnMuIFRoZXJl4oCZcyBqdXN0IG5vIGF1ZGlibGUKb3V0cHV0IG9uIEdYTFggdW50aWwgdGhlIHBv
a2UgLSBpdOKAmXMgbGlrZSBoaXR0aW5nIGFuIHVuLW11dGUgYnV0dG9uLgoKRm9yIHRoZSBzZXJp
ZXM6CgpUZXN0ZWQtYnk6IENocmlzdGlhbiBIZXdpdHQgPGNocmlzdGlhbnNoZXdpdHRAZ21haWwu
Y29tPgoKQ2hyaXN0aWFuCgo+IENocmlzdGlhbiBhbmQgSSBoYXZlIGJvdGggdHJpZWQgd2l0aCBh
bGwgb2Ygb3VyIGNvbnRhY3RzIGF0IEFtbG9naWMKPiBidXQgZGlkIG5vdCBnZXQgYW55IGFuc3dl
cnMuCj4gSWYgSSBrbmV3IHRoZSBwdXJwb3NlIG9mIHRoZXNlIGJpdHMgSSdkIG1vZGVsIHRoZW0g
YXMgd2hhdGV2ZXIgdGhleQo+IGFyZSAocmVzZXRzLCBjbG9jayBnYXRlcywgLi4uKSBhbmQgcHJv
dmlkZSBwcm9wZXIgZHQtYmluZGluZ3MuCj4gCj4gCj4gQmVzdCByZWdhcmRzLAo+IE1hcnRpbgoK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1h
bWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
