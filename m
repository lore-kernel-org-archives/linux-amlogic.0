Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62C01C43217
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Mar 2022 07:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L3VIYiK0gQoikd0Whlz8BEJi6uiiEuw4/4UaC3QlAeU=; b=ZHx5sD5+ZYXwXX
	jZwDD9UKujsPGpSoW7FxxxoilWOn0xBlhHjoarXXCvOQEZdOm9cGcVWfK/YHI/Tb3bL4vMI9/bgYJ
	je1t2MitX+x4NYnyeU6JM5kqg0d4RxEC6hJlPaYSbw2QWgCGffOMtGOy8vJjOyyClvtG/w6GrsOUK
	0r2Fp5OBvOezypQEs8pIoTdn39C8xZCsK8eF5X0je36hvq1nKIxHuy/slcTmJUrigkjAkLpkj33+w
	0V7AMavM47xHLJBZJD5k8CN0rpMScPfvqzxoHwBlNBFBv9s4NsjqXD76q1moE6Yr53bNfYgC6PlXG
	Rw9ysKyYiHNhyK31VNFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOwtU-00FIkK-3g; Tue, 01 Mar 2022 07:26:00 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOwtE-00FIbV-Q5
 for linux-amlogic@lists.infradead.org; Tue, 01 Mar 2022 07:25:46 +0000
Received: by mail-wm1-x335.google.com with SMTP id c192so6985741wma.4
 for <linux-amlogic@lists.infradead.org>; Mon, 28 Feb 2022 23:25:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=lgShEMbe7vRdrN6QBiEdN6/EREpU6sk6kDTuE/CbUr8=;
 b=6tCeTF8VnbDBKafChKUsHY1xHg3YBEdEWOhdMctYjjI4TLxZnqROGWyTQbcOk+GTHS
 05w/0hIuQfeh6ujJOyRC/82r/0+1CEi+/zjdijQCJIq13i/jHWzhcodRkdyKZiF1a8Kt
 FIEQ5i70fzLupBu2lzyp9oOeM9v30LofaIq+M4TgGjjaj7jcIiBz/jZ4SsfbGgFQ9Ypk
 9Y9VgLNWUOe30bOqyEyb71K3YREYy5i1KiCqYnbOrdSNaqMIU3GW7UjnDGWqdNa46R7i
 PDMl0orncBt6FGGVGqX0Ma0lw1vo6U1Bhqm1vclKj3kgVf6Tvu6yKaT4aJ/dD+PDE/jR
 p/Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lgShEMbe7vRdrN6QBiEdN6/EREpU6sk6kDTuE/CbUr8=;
 b=TwriakqAfZzqW5+99OISP6I5JEUGcd+5GEeKkrqWxD+S51n1FC/EFFPbsOrf6uUCtM
 ah/mjBD3IOeWw4jaPRbWGXM0L3zNhOJK8GIsq5RGnDz9M/Vzus0vBnbOJ9li5g0+7F4A
 2NKrPVAAomYjh6NhWo4PRc2uL4/18y2KgOFRhp+L2lUPaPWc1EvSIufDnVrksKbUKWmj
 Ff1dtuqzKRW3CzlifKqNZbRizfLw295kb+6DndvGtpa6iU8q4qSPtCwSTfVb80uEqJH7
 GvkLu2JNe/pJBYZ8My04k/znM0asI/W4lzbJIJ/Gs1f+VJytJ6dWtoENVbUta+0T569d
 POkw==
X-Gm-Message-State: AOAM530F9ZibZsBx/LqRvEblHsQ52F3qD42VkM9KR384woq+ugmQueEU
 /SpygjToEQGYvtSL2lNe5WD7puc7os0D7Ox8
X-Google-Smtp-Source: ABdhPJyNbAr8Cf69lwIdgo4F56uDduS8cdEXP5PZvZfdLySabeTKIbqqWZ+VviQg2Dl9lc2TQrfkDA==
X-Received: by 2002:a05:600c:a0a:b0:350:564b:d55e with SMTP id
 z10-20020a05600c0a0a00b00350564bd55emr15650054wmp.124.1646119543122; 
 Mon, 28 Feb 2022 23:25:43 -0800 (PST)
Received: from ?IPV6:2001:861:44c0:66c0:f9e4:b6da:2b53:5858?
 ([2001:861:44c0:66c0:f9e4:b6da:2b53:5858])
 by smtp.gmail.com with ESMTPSA id
 j7-20020a05600c1c0700b0037c2c6d2a91sm1793781wms.2.2022.02.28.23.25.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 23:25:42 -0800 (PST)
Message-ID: <849a95fd-ae81-9a3b-0c06-dd7826af9eb2@baylibre.com>
Date: Tue, 1 Mar 2022 08:25:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.1
Subject: Re: [PATCH V7 0/6] Use CCF to describe the UART baud rate clock
Content-Language: fr
To: Yu Tu <yu.tu@amlogic.com>, linux-serial@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20220225073922.3947-1-yu.tu@amlogic.com>
From: Neil Armstrong <narmstrong@baylibre.com>
In-Reply-To: <20220225073922.3947-1-yu.tu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_232544_886864_96F7FEF9 
X-CRM114-Status: GOOD (  19.50  )
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

SGksCgpMZSAyNS8wMi8yMDIyIMOgIDA4OjM5LCBZdSBUdSBhIMOpY3JpdMKgOgo+IFVzaW5nIHRo
ZSBjb21tb24gQ2xvY2sgY29kZSB0byBkZXNjcmliZSB0aGUgVUFSVCBiYXVkIHJhdGUKPiBjbG9j
ayBtYWtlcyBpdCBlYXNpZXIgZm9yIHRoZSBVQVJUIGRyaXZlciB0byBiZSBjb21wYXRpYmxlCj4g
d2l0aCB0aGUgYmF1ZCByYXRlIHJlcXVpcmVtZW50cyBvZiB0aGUgVUFSVCBJUCBvbiBkaWZmZXJl
bnQKPiBtZXNvbiBjaGlwcy4gQWRkIE1lc29uIFM0IFNvQyBjb21wYXRpYmxlLgo+IAo+IFRoZSB0
ZXN0IG1ldGhvZDoKPiBTdGFydCB0aGUgY29uc29sZSBhbmQgcnVuIHRoZSBmb2xsb3dpbmcgY29t
bWFuZHMgaW4gdHVybjoKPiBzdHR5IC1GIC9kZXYvdHR5QU1MMCAxMTUyMDAgYW5kIHN0dHkgLUYg
L2Rldi90dHlBTUwwIDkyMTYwMC4KPiAKPiBTaW5jZSBtb3N0IFNvQ3MgYXJlIHRvbyBvbGQsIEkg
d2FzIGFibGUgdG8gZmluZCBhbGwgdGhlIHBsYXRmb3JtcyBteXNlbGYKPiBzdWNoIGFzIE1lc29u
NiwgTWVzb244LCBNZXNvbjhiLCBHWEwgYW5kIHNvIG9uLiBJIG9ubHkgdGVzdGVkIGl0IHdpdGgK
PiBHMTJBIGFuZCBTNC4KPiAKPiBZdSBUdSAoNik6Cj4gICAgdHR5OiBzZXJpYWw6IG1lc29uOiBN
b3ZlIHJlcXVlc3QgdGhlIHJlZ2lzdGVyIHJlZ2lvbiB0byBwcm9iZQo+ICAgIHR0eTogc2VyaWFs
OiBtZXNvbjogVXNlIGRldm1faW9yZW1hcF9yZXNvdXJjZSB0byBnZXQgcmVnaXN0ZXIgbWFwcGVk
Cj4gICAgICBtZW1vcnkKPiAgICB0dHk6IHNlcmlhbDogbWVzb246IERlc2NyaWJlcyB0aGUgY2Fs
Y3VsYXRpb24gb2YgdGhlIFVBUlQgYmF1ZCByYXRlCj4gICAgICBjbG9jayB1c2luZyBhIGNsb2Nr
IGZyYW1lCj4gICAgdHR5OiBzZXJpYWw6IG1lc29uOiBNYWtlIHNvbWUgYml0IG9mIHRoZSBSRUc1
IHJlZ2lzdGVyIHdyaXRhYmxlCj4gICAgdHR5OiBzZXJpYWw6IG1lc29uOiBUaGUgc3lzdGVtIHN0
dWNrIHdoZW4geW91IHJ1biB0aGUgc3R0eSBjb21tYW5kIG9uCj4gICAgICB0aGUgY29uc29sZSB0
byBjaGFuZ2UgdGhlIGJhdWQgcmF0ZQo+ICAgIHR0eTogc2VyaWFsOiBtZXNvbjogQWRkZWQgUzQg
U09DIGNvbXBhdGliaWxpdHkKPiAKPiBWNiAtPiBWNzogVG8gc29sdmUgdGhlIHN5c3RlbSBzdHVj
ayB3aGVuIHlvdSBydW4gdGhlIHN0dHkgY29tbWFuZCBvbgo+IHRoZSBjb25zb2xlIHRvIGNoYW5n
ZSB0aGUgYmF1ZCByYXRlLgo+IFY1IC0+IFY2OiBDaGFuZ2UgZXJyb3IgZm9ybWF0IGFzIGRpc2N1
c3NlZCBpbiB0aGUgZW1haWwuCj4gVjQgLT4gVjU6IENoYW5nZSBlcnJvciBmb3JtYXQuCj4gVjMg
LT4gVjQ6IENoYW5nZSBDQ0YgdG8gZGVzY3JpYmUgdGhlIFVBUlQgYmF1ZCByYXRlIGNsb2NrIGFz
IGRpc2N1c3NlZAo+IGluIHRoZSBlbWFpbC4KPiBWMiAtPiBWMzogYWRkIGNvbXBhdGlibGUgPSAi
YW1sb2dpYyxtZXNvbi1neC11YXJ0Ii4gQmVjYXVzZSBpdCBtdXN0IGNoYW5nZQo+IHRoZSBEVFMg
YmVmb3JlIGl0IGNhbiBiZSBkZWxldGVkCj4gVjEgLT4gVjI6IFVzZSBDQ0YgdG8gZGVzY3JpYmUg
dGhlIFVBUlQgYmF1ZCByYXRlIGNsb2NrLk1ha2Ugc29tZSBjaGFuZ2VzIGFzCj4gZGlzY3Vzc2Vk
IGluIHRoZSBlbWFpbAo+IAo+IExpbms6aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtYW1s
b2dpYy8yMDIyMDExODAzMDkxMS4xMjgxNS00LXl1LnR1QGFtbG9naWMuY29tLwo+IAo+ICAgZHJp
dmVycy90dHkvc2VyaWFsL21lc29uX3VhcnQuYyB8IDIyMSArKysrKysrKysrKysrKysrKysrKysr
LS0tLS0tLS0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDE1NCBpbnNlcnRpb25zKCspLCA2NyBkZWxl
dGlvbnMoLSkKPiAKPiAKPiBiYXNlLWNvbW1pdDogYTYwM2NhNjBjZWJmZjg1ODk4ODI0MjdhNjdm
ODcwZWQ5NDZiM2ZjOAoKQ291bGQgeW91IHNlbmQgdGhlIGVtYWlscyBUbyBLZXZpbiwgSmVyb21l
LCBNYXJ0aW4gJiBtZSwgYW5kIHB1dCB0aGUgdmFyaW91cyBsaXN0cyBpbiBDQyBpbnN0ZWFkID8g
b3RoZXJ3aXNlIHdlIGFyZSBub3Qgbm90aWZpZWQgd2hlbiB0aGUgcGF0Y2ggaXMgYWNjZXB0ZWQg
YnkgdGhlIHR0eSBtYWludGFpbmVyLgoKVGhhbmtzLApOZWlsCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QK
bGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
