Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68D67C433EF
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Feb 2022 09:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/D6AxXZzCQ522SLtzH4g+zkZTKlp1pgTNowQGpK03kc=; b=O0txECaApI9zBQ
	PoEOi9nNM5d7rTXN/cSXOdcHbiJsiEroT1pYnybtadN/FfrHe3ocsk3wWNJAeHBl/XwXmh77O5bhL
	zJx20JF53o+HqULANbaV9a/+wPHhf2TGCtbQ/U0D0ru9a7GO4mkjGUCbLFxvEkct7eUjjZoC0lb8w
	D03wyZKthYnooB+BCDBwHTohKgOwA38MzYl3jmhgTC+8LhlP1RMf/Z+y8dRJHuKUhhivBEdMkXPcz
	hWQzPwmOmlGl7EFMNcgX6bk2YWg9fCIfzLuBzz/iUG1vxY7R3Sa+TFf3P8nkDCuUmSO1ejg7EJKml
	5TmZ61W9wuwH/dU8qnHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nISFy-006NSH-2b; Fri, 11 Feb 2022 09:30:22 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nISBX-006LLN-I4
 for linux-amlogic@lists.infradead.org; Fri, 11 Feb 2022 09:25:51 +0000
Received: by mail-wr1-x42d.google.com with SMTP id d27so14126858wrc.6
 for <linux-amlogic@lists.infradead.org>; Fri, 11 Feb 2022 01:25:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=4qiy8OktVHN84+DezGt6YRpvDHUjWHm3on5bxfkbXJc=;
 b=wULt7FnqXC/L4Gymc0ykI6+i6dld8vhiMJC6kasAgaVpr7g05GdtAQYYGnfgMit6u3
 UsUIV9yYXffSXYgnktHeR5hfAEE9UktvD41UwWzVJ4lzTFtjE9kTG3ff2raX6l5JTHKZ
 91THXqClC5iSMitmw+CC42Q5y26YGeLstWWVzusgJnXVivNQaiKRszSwXbdaZnexaj2T
 FsW/JwOpzaHfOJNoq5Yl/2yKJowJO9udUZ296Q0qzYgkteEKyByRo4vqgHtbX6z46ZsO
 kGPb99U4AFHUtIuN3Zk/LJK9EzuEN/sjUh2Eknw5b+duiYvsjZ1iMjjux3H+cgVshUzu
 CNCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=4qiy8OktVHN84+DezGt6YRpvDHUjWHm3on5bxfkbXJc=;
 b=aPiTtf+2PxpcASacb6tpm/DFlHhATfzov9rxxa0Yb0Q01u7ZZxG2QhYp5KTnyJpDJu
 8BuusBXVhN9UMpqWh+B1dSZgIztnVeKcREawvcJlcy4b3CbPUP1Qfuex1SB5HyyJlnhl
 vMmBylY+KvM+hK0p13pNKgzRdLcaAUbbj7bh4eaOKdToejt3FYtQn7JTVOE5rY0aRePj
 HI0mn/WibJwmtXkjVdmf3Km4+QjGXk3hwTRHonnul+HgbL/j5dEza1aqoe2uzBXdF5kR
 hsXPKYDLRLna9u/FdJTlVKh4qs48bnKGoVZq9pX+Q61dXo75i1I71jyfGQeXKyrfNbp5
 +E/A==
X-Gm-Message-State: AOAM533zxUqmEctAjI/rAexuukoqdD9K96NaQPr9qrr0WfYquDHGmILy
 mytsiYBjWNQP+0f+dkCetz089A==
X-Google-Smtp-Source: ABdhPJyJ2RPqgxI850laIYOe6nBW3XeOqT6BrIDWIDnkrILMP7eMkagxLXlCgFu9hgRup9F7qpWfmQ==
X-Received: by 2002:adf:f904:: with SMTP id b4mr597776wrr.183.1644571545371;
 Fri, 11 Feb 2022 01:25:45 -0800 (PST)
Received: from ?IPV6:2001:861:44c0:66c0:97e4:3830:c79:136e?
 ([2001:861:44c0:66c0:97e4:3830:c79:136e])
 by smtp.gmail.com with ESMTPSA id 2sm23666644wrz.59.2022.02.11.01.25.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Feb 2022 01:25:44 -0800 (PST)
Message-ID: <3a60384a-b26f-3591-fca9-b10764bd2b24@baylibre.com>
Date: Fri, 11 Feb 2022 10:25:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 2/2] arm64: dts: meson: remove CPU opps below 1GHz for
 SM1 boards
Content-Language: en-US
To: Marc Zyngier <maz@kernel.org>,
 Christian Hewitt <christianshewitt@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220210100638.19130-1-christianshewitt@gmail.com>
 <20220210100638.19130-3-christianshewitt@gmail.com>
 <8211344a481dd40f260106bdd3f03bfb@kernel.org>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <8211344a481dd40f260106bdd3f03bfb@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220211_012547_679903_04A86E6B 
X-CRM114-Status: GOOD (  18.23  )
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

SGkgTWFyYywKCk9uIDEwLzAyLzIwMjIgMTE6MzYsIE1hcmMgWnluZ2llciB3cm90ZToKPiBPbiAy
MDIyLTAyLTEwIDEwOjA2LCBDaHJpc3RpYW4gSGV3aXR0IHdyb3RlOgo+PiBBbWxvZ2ljIFNNMSBk
ZXZpY2VzIGV4cGVyaWVuY2UgQ1BVIHN0YWxscyBhbmQgcmFuZG9tIGJvYXJkIHdlZGdlcyB3aGVu
Cj4+IHRoZSBzeXN0ZW0gaWRsZXMgYW5kIENQVSBjb3JlcyBjbG9jayBkb3duIHRvIGxvd2VyIG9w
cCBwb2ludHMuIFJlY2VudAo+PiB2ZW5kb3Iga2VybmVscyBpbmNsdWRlIGEgY2hhbmdlIHRvIHJl
bW92ZSAxMDAtMjUwTUh6IGFuZCBvdGhlciBkaXN0cm8KPj4gc291cmNlcyBhbHNvIHJlbW92ZSB0
aGUgNTAwLzY2N01IeiBwb2ludHMuIFVubGVzcyBhbGwgMTAwLTY2N01oeiBvcHBzCj4+IGFyZSBy
ZW1vdmVkIG9yIHRoZSBDUFUgZ292ZXJub3IgZm9yY2VkIHRvIHBlcmZvcm1hbmNlIHN0YWxscyBh
cmUgc3RpbGwKPj4gb2JzZXJ2ZWQsIHNvIGxldCdzIHJlbW92ZSB0aGVtIHRvIGltcHJvdmUgc3Rh
YmlsaXR5IGFuZCB1cHRpbWUuCj4+Cj4+IEZpeGVzOiAzZDllNzY0ODMwNDkgKCJhcm02NDogZHRz
OiBtZXNvbi1zbTEtc2VpNjEwOiBlbmFibGUgRFZGUyIpCj4+IFNpZ25lZC1vZmYtYnk6IENocmlz
dGlhbiBIZXdpdHQgPGNocmlzdGlhbnNoZXdpdHRAZ21haWwuY29tPgo+PiAtLS0KPj4gwqBhcmNo
L2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tc20xLmR0c2kgfCAyMCAtLS0tLS0tLS0tLS0t
LS0tLS0tLQo+PiDCoDEgZmlsZSBjaGFuZ2VkLCAyMCBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAt
LWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1zbTEuZHRzaQo+PiBiL2Fy
Y2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1zbTEuZHRzaQo+PiBpbmRleCAzYzA3YTg5
YmZkMjcuLjgwNzM3NzMxYWYzZiAxMDA2NDQKPj4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9h
bWxvZ2ljL21lc29uLXNtMS5kdHNpCj4+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dp
Yy9tZXNvbi1zbTEuZHRzaQo+PiBAQCAtOTUsMjYgKzk1LDYgQEAKPj4gwqDCoMKgwqDCoMKgwqDC
oCBjb21wYXRpYmxlID0gIm9wZXJhdGluZy1wb2ludHMtdjIiOwo+PiDCoMKgwqDCoMKgwqDCoMKg
IG9wcC1zaGFyZWQ7Cj4+Cj4+IC3CoMKgwqDCoMKgwqDCoCBvcHAtMTAwMDAwMDAwIHsKPj4gLcKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgb3BwLWh6ID0gL2JpdHMvIDY0IDwxMDAwMDAwMDA+Owo+PiAt
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBvcHAtbWljcm92b2x0ID0gPDczMDAwMD47Cj4+IC3CoMKg
wqDCoMKgwqDCoCB9Owo+PiAtCj4+IC3CoMKgwqDCoMKgwqDCoCBvcHAtMjUwMDAwMDAwIHsKPj4g
LcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgb3BwLWh6ID0gL2JpdHMvIDY0IDwyNTAwMDAwMDA+Owo+
PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBvcHAtbWljcm92b2x0ID0gPDczMDAwMD47Cj4+IC3C
oMKgwqDCoMKgwqDCoCB9Owo+PiAtCj4+IC3CoMKgwqDCoMKgwqDCoCBvcHAtNTAwMDAwMDAwIHsK
Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgb3BwLWh6ID0gL2JpdHMvIDY0IDw1MDAwMDAwMDA+
Owo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBvcHAtbWljcm92b2x0ID0gPDczMDAwMD47Cj4+
IC3CoMKgwqDCoMKgwqDCoCB9Owo+PiAtCj4+IC3CoMKgwqDCoMKgwqDCoCBvcHAtNjY3MDAwMDAw
IHsKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgb3BwLWh6ID0gL2JpdHMvIDY0IDw2NjY2NjY2
NjY+Owo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBvcHAtbWljcm92b2x0ID0gPDc1MDAwMD47
Cj4+IC3CoMKgwqDCoMKgwqDCoCB9Owo+PiAtCj4+IMKgwqDCoMKgwqDCoMKgwqAgb3BwLTEwMDAw
MDAwMDAgewo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgb3BwLWh6ID0gL2JpdHMvIDY0IDwx
MDAwMDAwMDAwPjsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG9wcC1taWNyb3ZvbHQgPSA8
NzcwMDAwPjsKPiAKPiBUaGF0J3Mgbm90IG5lYXJseSBlbm91Z2guIElmIHRoYXQncyBhbiBhY3R1
YWwgaXNzdWUsIHRoZSBkcml2ZXIKPiBzaG91bGQgYmUgdXBkYXRlZCBub3QgdG8gdXNlIHRoZXNl
IE9QUHMsIGFuZCB5b3UgY2FuJ3QgYXNzdW1lCj4gdGhhdCBwZW9wbGUgd2lsbCBqdXN0IHVwZGF0
ZSB0aGVpciBEVCAobWluZSBjb21lcyBmcm9tIHUtYm9vdCwKPiBhbmQgaXQgaXMgdW5saWtlbHkg
SSB3aWxsIHVwZGF0ZSBpdCBhbnl0aW1lIHNvb24pLgoKVGhlIGRyaXZlciBpcyB0aGUgZ2VuZXJp
YyBjcHVmcmVxIGFuZCBhIGdlbmVyaWMgY2xvY2sgZHJpdmVyLCB3ZSBkbyBub3QKZmlsdGVyIG91
dCB0aGUgcG9zc2libGUgT1BQIGZyZXF1ZW5jaWVzIGJlY2F1c2UgdGhlIHBvc3NpYmxlIGZyZXEK
aXMgbGFyZ2UgYW5kIGRlcGVuZHMgb24gdGhlIGRpZSByZXZpc2lvbi4KCkkgZG9uJ3Qgc2VlIHdo
eSB3ZSBzaG91bGQgZmlsdGVyIG91dCB0aGVzZSBmcmVxdWVuY2llcyBzbyBmYXIuCgpOZWlsCgo+
IAo+IFRoYW5rcywKPiAKPiAgwqDCoMKgwqDCoMKgwqAgTS4KCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdAps
aW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
