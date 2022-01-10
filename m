Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A5A4C433F5
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Jan 2022 09:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=rFUXjEdQM4x7OpL3Qb21xFo4erfiQFU6ljldiM0404c=; b=PRcOwC8keQPKWYsu0yeR8X31yv
	CFDqxrXhZIg13MTSzLmxtw1TrTbL6bW2lYb3qoDauxCSbujBi1g179oFLy7Bev6zdw2sEGISw6FhX
	+ZnVY5bybOwSstDiw72RVs56M7JpFkX2JnZr+1hYKC/eUItKOM1zCIHhpa5WnjaZIdSwUPyVMAggO
	mz9mQ3UjHGWpHBKciowFKfjJ6URhJyt8lHej6Sqh/ENOckAh3YEJoWv5F8MsrW2mH6fMrZhGCgGwn
	YTICNdc7/qD3KV49V5PaxZ6vrD+//lwidJgc+jIByXM1pn6rDcnD2O+LqkvaYluRIOJqQmtdWmgCB
	5fFXzjcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6rEw-00AX8R-Mc; Mon, 10 Jan 2022 09:45:22 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6rCi-00AVwV-Rx
 for linux-amlogic@lists.infradead.org; Mon, 10 Jan 2022 09:43:06 +0000
Received: by mail-wr1-x42e.google.com with SMTP id r9so23800137wrg.0
 for <linux-amlogic@lists.infradead.org>; Mon, 10 Jan 2022 01:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Rzhy6yEPJVlT7RLq5OS2aYkHYtU0ICRm0bniQL4KIpc=;
 b=gGJCnpebj8VuX8+ZFZDudraazK3ixsOrmItH9h/ZjnnxVHz4RBuyDwMhG80kB2gBSm
 YyaD7Dde6eXTnhBze161WX2Aw3Rcft7scBrj0AtOFwmbqhAjLNdIBbSVM/KhJkHFg4ua
 YyTIyZMAp5NzYSv3sEgki0yq+bQLS4IHiWplx0osb5Ih38TQPadm6wSZF+UEZfJPYPxk
 bvLoVDT/lxL4pna7BRn+ar7mbo+fNPO45xfa76D5jsk00IHp8FFdInVfrxtT9+v8zXE6
 lCzukCMUMaa5dOi2ID8+bMVC4wZBvaXngcovPX9ZdQkEXReIosSGnyIJ3VDB0IQgb/kd
 +tvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Rzhy6yEPJVlT7RLq5OS2aYkHYtU0ICRm0bniQL4KIpc=;
 b=ZsKnfTXHarFrOc8MVeURoZBdZByiv0jjM/BTfS7JcSFWgBTR8J87ARV0P9zT6E18XH
 ww0UovuJ7dPVT5geoqbL5kMNEBrYILvLcgeJd1pA/x0qzUiezfel1iSqW+PpwbeQljCN
 iFu1E9YH5GCpk+CsAXaCAQzI6ZKmiBLxyKRWyBmxeIHFCtzHQWVEZNsCmVCQilt5cWZj
 WBnhES6a7YDIyLto1u8XeXJoc0t23yCWjHndK19bfrCR/njQQe/6pvYHvnk26sNKLdPX
 A4KJ9UL1EFbkfHSdDnvKI9xuKb8krSU4Euzi/ZIt6w21nG0vV8h3S5QhAU87vig1zH0q
 DN7Q==
X-Gm-Message-State: AOAM531TRa9CbHCpLckSSSLwkuXpz6BpnVimMq0KnF4M+KJ/9a0IP6f2
 Gd4yt7UPCKhOxYcl6aEcHNVj3g==
X-Google-Smtp-Source: ABdhPJxNhr//nhb1+5lbwdo8C/T3TotD1T9N8DhX4EvRDmin16/DX9D97BInHHOT1C6UgTytdSAN5g==
X-Received: by 2002:adf:d0c2:: with SMTP id z2mr2788363wrh.335.1641807783340; 
 Mon, 10 Jan 2022 01:43:03 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:94e5:2e36:6bcc:a9f1?
 ([2001:861:44c0:66c0:94e5:2e36:6bcc:a9f1])
 by smtp.gmail.com with ESMTPSA id q14sm6373285wro.58.2022.01.10.01.43.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jan 2022 01:43:03 -0800 (PST)
Subject: Re: [PATCH V4 0/5] the UART driver compatible with
To: Yu Tu <yu.tu@amlogic.com>, linux-serial@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>, Jiri Slaby <jirislaby@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20220110085604.18042-1-yu.tu@amlogic.com>
 <1f4b9288-c7ff-c895-425c-187d058642b9@baylibre.com>
 <a19771e6-d1d4-d1ef-9819-21e2147aad16@amlogic.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <d14fdcd5-99c2-6aa0-085e-5355ecc0febf@baylibre.com>
Date: Mon, 10 Jan 2022 10:43:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <a19771e6-d1d4-d1ef-9819-21e2147aad16@amlogic.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_014304_958273_DC527286 
X-CRM114-Status: GOOD (  19.41  )
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

T24gMTAvMDEvMjAyMiAxMDozNSwgWXUgVHUgd3JvdGU6Cj4gSGkgTmVpbCwKPiDCoMKgwqDCoFRo
YW5rIHlvdSB2ZXJ5IG11Y2ggZm9yIHlvdXIgcmVwbHkuCj4gCj4gT24gMjAyMi8xLzEwIDE3OjI3
LCBOZWlsIEFybXN0cm9uZyB3cm90ZToKPj4gWyBFWFRFUk5BTCBFTUFJTCBdCj4+Cj4+IEhpLAo+
Pgo+PiBPbiAxMC8wMS8yMDIyIDA5OjU1LCBZdSBUdSB3cm90ZToKPj4+IFVzaW5nIHRoZSBjb21t
b24gQ2xvY2sgY29kZSB0byBkZXNjcmliZSB0aGUgVUFSVCBiYXVkIHJhdGUKPj4+IGNsb2NrIG1h
a2VzIGl0IGVhc2llciBmb3IgdGhlIFVBUlQgZHJpdmVyIHRvIGJlIGNvbXBhdGlibGUKPj4+IHdp
dGggdGhlIGJhdWQgcmF0ZSByZXF1aXJlbWVudHMgb2YgdGhlIFVBUlQgSVAgb24gZGlmZmVyZW50
Cj4+PiBtZXNvbiBjaGlwcy4gQWRkIE1lc29uIFM0IFNvQyBjb21wYXRpYmxlLgo+Pj4KPj4+IFl1
IFR1ICg1KToKPj4+IMKgwqAgZHQtYmluZGluZ3M6IHNlcmlhbDogbWVzb246IERyb3AgY29tcGF0
aWJsZSA9IGFtbG9naWMsbWVzb24tZ3gtdWFydC4KPj4+IMKgwqAgdHR5OiBzZXJpYWw6IG1lc29u
OiBSZXF1ZXN0IHRoZSByZWdpc3RlciByZWdpb24gaW4gbWVzb25fdWFydF9wcm9iZSgpCj4+PiDC
oMKgIHR0eTogc2VyaWFsOiBtZXNvbjogVGhlIFVBUlQgYmF1ZCByYXRlIGNhbGN1bGF0aW9uIGlz
IGRlc2NyaWJlZCB1c2luZwo+Pj4gwqDCoMKgwqAgdGhlIGNvbW1vbiBjbG9jayBjb2RlLgo+Pj4g
wqDCoCB0dHk6IHNlcmlhbDogbWVzb246IE1ha2UgdGhlIGJpdDI0IGFuZCBiaXQgWzI2LDI3XSBv
ZiB0aGUgVUFSVF9SRUc1Cj4+PiDCoMKgwqDCoCByZWdpc3RlciB3cml0YWJsZQo+Pj4gwqDCoCB0
dHk6IHNlcmlhbDogbWVzb246IEFkZGVkIFM0IFNPQyBjb21wYXRpYmlsaXR5Lgo+Pgo+PiBXZWly
ZCwgdGhlIHN1YmplY3RzIGFyZSBmaW5lIGluIHRoZSBjb3ZlciBsZXR0ZXIgYnV0IGFyZSBhbGwg
dHJ1bmNhdGVkIGluIHRoZSBlbWFpbCB0aHJlYWQ6Cj4+IFtQQVRDSCBWNCAwLzVdIHRoZSBVQVJU
IGRyaXZlciBjb21wYXRpYmxlIHdpdGgKPj4gW1BBVENIIFY0IDEvNV0gZHQtYmluZGluZ3M6IHNl
cmlhbDogbWVzb246IERyb3AKPj4gW1BBVENIIFY0IDIvNV0gdHR5OiBzZXJpYWw6IG1lc29uOiBS
ZXF1ZXN0IHRoZSByZWdpc3Rlcgo+PiAuLi4KPj4gT25seSB0aGUgbGFzdCBvbmUgaXMgT0suCj4+
Cj4gSSBzYXcgdGhlIHN1YmplY3Qgd2FzIGEgbGl0dGxlIGxvbmcsIEkgY2hhbmdlZCBpdCBtYW51
YWxseSwgZG8gSSBuZWVkIHRvIHJlZ2VuZXJhdGUgYW5kIHNlbmQ/Cgp5ZXMgcGxlYXNlLCB0aGUg
bWFpbCBzdWJqZWN0IHdpbGwgYmUgdGhlIGNvbW1pdCB0aXRsZSBzbyBpdCBtdXN0IGJlIHNob3J0
IGJ1dCBkZXNjcmlwdGl2ZSBlbm91Z2guCgoiZHQtYmluZGluZ3M6IHNlcmlhbDogbWVzb246IERy
b3AiIGlzIHRvbyBzaG9ydC4KCiJkdC1iaW5kaW5nczogc2VyaWFsOiBtZXNvbjogRHJvcCBjb21w
YXRpYmxlID0gYW1sb2dpYyxtZXNvbi1neC11YXJ0IiBpcyBvayBidXQgZm9ybXVsYXRpb24gaXMg
d3JvbmcsCmFuZCByZW1vdmUgc3BlY2lhbCBjaGFyYWN0ZXJzIGxpa2UgIj0iLCAiWyIsICJdIi4u
LgoKVGhlIGJlc3QgdGl0bGUgY291bGQgYmUgOgoiZHQtYmluZGluZ3M6IHNlcmlhbDogbWVzb246
IERyb3AgbGVnYWN5IGFtbG9naWMsbWVzb24tZ3gtdWFydCBjb21wYXRpYmxlIgoKSWYgdGhlIHN1
YmplY3QgaXQgdG9vIGxvbmcsIHJlZHVjZSBpdCBhbmQgZW5oYW5jZSB0aGUgY29tbWl0IG1lc3Nh
Z2Ugd2l0aCB0aGUgZGV0YWlscy4KCk5laWwKCj4+Cj4+Pgo+Pj4gVjEgLT4gVjI6IFVzZSBDQ0Yg
dG8gZGVzY3JpYmUgdGhlIFVBUlQgYmF1ZCByYXRlIGNsb2NrLk1ha2Ugc29tZSBjaGFuZ2VzIGFz
Cj4+PiBkaXNjdXNzZWQgaW4gdGhlIGVtYWlsCj4+PiBWMiAtPiBWMzogYWRkIGNvbXBhdGlibGUg
PSAiYW1sb2dpYyxtZXNvbi1neC11YXJ0Ii4gQmVjYXVzZSBpdCBtdXN0IGNoYW5nZQo+Pj4gdGhl
IERUUyBiZWZvcmUgaXQgY2FuIGJlIGRlbGV0ZWQKPj4+IFYzIC0+IFY0OiBDaGFuZ2UgQ0NGIHRv
IGRlc2NyaWJlIHRoZSBVQVJUIGJhdWQgcmF0ZSBjbG9jayBhcyBkaXNjdXNzZWQKPj4+IGluIHRo
ZSBlbWFpbC4KPj4+Cj4+PiBMaW5rOmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWFtbG9n
aWMvMjAyMTEyMzAxMDIxMTAuMzg2MS00LXl1LnR1QGFtbG9naWMuY29tLwo+Pj4KPj4+IMKgIC4u
Li9iaW5kaW5ncy9zZXJpYWwvYW1sb2dpYyxtZXNvbi11YXJ0LnlhbWzCoMKgIHzCoCAxMCArLQo+
Pj4gwqAgZHJpdmVycy90dHkvc2VyaWFsL21lc29uX3VhcnQuY8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgfCAyNDQgKysrKysrKysrKysrLS0tLS0tCj4+PiDCoCAyIGZpbGVzIGNoYW5nZWQs
IDE3NyBpbnNlcnRpb25zKCspLCA3NyBkZWxldGlvbnMoLSkKPj4+Cj4+CgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5n
IGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
