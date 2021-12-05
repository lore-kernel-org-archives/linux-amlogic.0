Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7527C433F5
	for <linux-amlogic@archiver.kernel.org>; Sun,  5 Dec 2021 21:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vjZSGlhV0mAlfSp68rMC5B2sqbYQV0McAWs4EjZ/OhY=; b=QYY2i4HX9NfZe3Qj6MkPUJMWf4
	Lg2Hn/Tk+rtSxSOE0nZTPYDMh5fh9A2AKjI8ka0QLxdzdUScc5J3TeLVEZ504df1HgEIW3wB1JBuc
	PHhJEY3cqKxUZ9OqPO8h4FnBsy9UtUmLWBAisNEORHWDYiZmQnM9BoPX7qI3mQDd/txhx8xsLRBo8
	Hyq7LObSW6NpqT+B5LYoidARLP6EhUKj5osqMnJl/HPJrfC/uZcc2dFYTf22elL7+pedM2TYYYYdu
	Na5ckYQE/DKS3jpIAd7sR7K8KlFjKhMU18OWoZNOgYmaoLXM2BwYrlwhtDMnXsEZirEr8VCkSE/IH
	+K6SSOhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mtypP-001zqf-Io; Sun, 05 Dec 2021 21:13:47 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mtypN-001zq2-3F
 for linux-amlogic@lists.infradead.org; Sun, 05 Dec 2021 21:13:47 +0000
Received: by mail-wr1-x430.google.com with SMTP id j3so18322468wrp.1
 for <linux-amlogic@lists.infradead.org>; Sun, 05 Dec 2021 13:13:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=K1Vdn/JoxogZaRppK4S12+mosVtDg1jUSJHdGkKbW1Q=;
 b=m7maktx/a8S/6CrAWbajBZKS9o4+MbLvIMWsTlt2UiMnOBTuscnXGZstAl1nQsc/AZ
 yeOzW8iw6OALCFcpN3fFWpJsah55MQqpeltmcUe0deKIun9WKUEQsWPVRunHkuz3dvQW
 +RqviILL8skyYqXHfWwJ7gAICFIXdmydtAEKlVfqmObDhLrDwqfSgNrypym/Ghj+Dfbj
 3tr7K6ZgE9fQxShLtP18Ocdlilx4BR1JOhHbQzobZn/8Qv2h7GO0rNs8KVB1B/LGaYyl
 bpy4Wi6RUBFoBndx+yk1DBL7nYFQZiHCQcW5Lhy82wgODE/1qpCksek0omPLAz6lVJ8Y
 9g9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=K1Vdn/JoxogZaRppK4S12+mosVtDg1jUSJHdGkKbW1Q=;
 b=5RXPJciSSlxLDGGNj1EYGDzgEcV5tfHkp/wXN0IsORszQFOlDrWxPy1h70IT3A8Wb8
 jr+OZkWTPv0x5fmQfmsTg8BXY5VezCjBBtdLl0OmNnRcymq8et6giPhNDjQISHFCyhKU
 GAx4lF+gr7t20VenuwUozRQ2+X6qKpI+8Z5lZ08ae5J3cepH1RpB05IMNL4KjWpFqahp
 14TNf4IaH6VCIXRKO7XG/6Xx5MaenVGNni37y7nYl40I45dXGuYhdxIGsL5OKigDeek8
 JHwcKNM9mbXtdYKcg1I68LTh6hhYaK7ogbdHEbH/gyb2VTQNTQyhI4m2EKh7wd9fXWEx
 tIag==
X-Gm-Message-State: AOAM533+7/PzSvYyPNncQQmmfNRq6uerC3YKgKmalfeX+K/tKdKowXtY
 0A/nWg/zNxiSq49aeqPn4NhBxA==
X-Google-Smtp-Source: ABdhPJxspRmpduQJv6xAihNQgqfTSKCpcGVgTRrsONSQ32mxBrBC0x0YeXNm9icFhIALyIjXz+DB3A==
X-Received: by 2002:adf:a285:: with SMTP id s5mr39395128wra.468.1638738822494; 
 Sun, 05 Dec 2021 13:13:42 -0800 (PST)
Received: from [192.168.1.24] (203.247.120.78.rev.sfr.net. [78.120.247.203])
 by smtp.gmail.com with ESMTPSA id r7sm9211892wrq.29.2021.12.05.13.13.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Dec 2021 13:13:42 -0800 (PST)
Subject: Re: [PATCH v3 1/3] phy: amlogic: phy-meson-gxl-usb2: fix shared reset
 controller use
To: Philipp Zabel <p.zabel@pengutronix.de>, khilman@baylibre.com
Cc: balbi@kernel.org, jbrunet@baylibre.com,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20211112162827.128319-1-aouledameur@baylibre.com>
 <20211112162827.128319-2-aouledameur@baylibre.com>
 <44f6cc1f52e75cbbb8aebb0d4648c94ae479ef43.camel@pengutronix.de>
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Message-ID: <76927781-c420-b6f6-78e9-c6e91dec6ef4@baylibre.com>
Date: Sun, 5 Dec 2021 22:13:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <44f6cc1f52e75cbbb8aebb0d4648c94ae479ef43.camel@pengutronix.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211205_131345_224998_D785A47C 
X-CRM114-Status: GOOD (  19.01  )
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

SGkgUGhpbGlwcCwKClRoYW5rIHlvdSBmb3IgdGhlIHJldmlldy4KCk9uIDIyLzExLzIwMjEgMTA6
MDMsIFBoaWxpcHAgWmFiZWwgd3JvdGU6Cj4gSGkgQW1qYWQsCj4KPiBPbiBGcmksIDIwMjEtMTEt
MTIgYXQgMTc6MjggKzAxMDAsIEFtamFkIE91bGVkLUFtZXVyIHdyb3RlOgo+PiBVc2UgcmVzZXRf
Y29udHJvbF9yZWFybSgpIGNhbGwgaWYgYW4gZXJyb3Igb2NjdXJzIGluIGNhc2UKPj4gcGh5X21l
c29uX2d4bF91c2IyX2luaXQoKSBmYWlscyBhZnRlciByZXNldCgpIGhhcyBiZWVuIGNhbGxlZCA7
IG9yIGluIGNhc2UKPj4gcGh5X21lc29uX2d4bF91c2IyX2V4aXQoKSBpcyBjYWxsZWQgaS5lIHRo
ZSByZXNvdXJjZSBpcyBubyBsb25nZXIgdXNlZAo+PiBhbmQgdGhlIHJlc2V0IGxpbmUgbWF5IGJl
IHRyaWdnZXJlZCBhZ2FpbiBieSBvdGhlciBkZXZpY2VzLgo+Pgo+PiByZXNldF9jb250cm9sX3Jl
YXJtKCkga2VlcHMgdXNlIG9mIHRyaWdnZXJlZF9jb3VudCBzYW5lIGluIHRoZSByZXNldAo+PiBm
cmFtZXdvcmsuIFRoZXJlZm9yZSwgdXNlIG9mIHJlc2V0X2NvbnRyb2xfcmVzZXQoKSBvbiBzaGFy
ZWQgcmVzZXQgbGluZQo+PiBzaG91bGQgYmUgYmFsYW5jZWQgd2l0aCByZXNldF9jb250cm9sX3Jl
YXJtKCkuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEFtamFkIE91bGVkLUFtZXVyIDxhb3VsZWRhbWV1
ckBiYXlsaWJyZS5jb20+Cj4+IFJlcG9ydGVkLWJ5OiBKZXJvbWUgQnJ1bmV0IDxqYnJ1bmV0QGJh
eWxpYnJlLmNvbT4KPj4gLS0tCj4+ICDCoGRyaXZlcnMvcGh5L2FtbG9naWMvcGh5LW1lc29uLWd4
bC11c2IyLmMgfCA1ICsrKystCj4+ICDCoDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGh5L2FtbG9naWMvcGh5
LW1lc29uLWd4bC11c2IyLmMgYi9kcml2ZXJzL3BoeS9hbWxvZ2ljL3BoeS1tZXNvbi1neGwtdXNi
Mi5jCj4+IGluZGV4IDJiM2MwZDczMGYyMC4uOWE5Yzc2OWVjYWJjIDEwMDY0NAo+PiAtLS0gYS9k
cml2ZXJzL3BoeS9hbWxvZ2ljL3BoeS1tZXNvbi1neGwtdXNiMi5jCj4+ICsrKyBiL2RyaXZlcnMv
cGh5L2FtbG9naWMvcGh5LW1lc29uLWd4bC11c2IyLmMKPj4gQEAgLTExMCw4ICsxMTAsMTAgQEAg
c3RhdGljIGludCBwaHlfbWVzb25fZ3hsX3VzYjJfaW5pdChzdHJ1Y3QgcGh5ICpwaHkpCj4+ICDC
oAlpbnQgcmV0Owo+Pgo+PiAgwqAJcmV0ID0gcmVzZXRfY29udHJvbF9yZXNldChwcml2LT5yZXNl
dCk7Cj4+IC0JaWYgKHJldCkKPj4gKwlpZiAocmV0KSB7Cj4+ICsJCXJlc2V0X2NvbnRyb2xfcmVh
cm0ocHJpdi0+cmVzZXQpOwo+IEkgZG9uJ3QgdW5kZXJzdGFuZCB0aGlzLiBJZiByZXNldF9jb250
cm9sX3Jlc2V0KCkgcmV0dXJucyBhbiBlcnJvciBmb3IgYQo+IHNoYXJlZCByZXNldCwgaXQgc2hv
dWxkIGhhdmUgZWl0aGVyCj4gLSByZXR1cm5lZCBiZWZvcmUgaW5jcmVtZW50aW5nIHRyaWdnZXJl
ZF9jb3VudCwgb3IKPiAtIGluY3JlbWVudGVkIHRyaWdnZXJlZF9jb3VudCwgZ290IGEgZmFpbGVk
IHJlc2V0IG9wLCBkZWNyZW1lbnRlZAo+ICAgIHRyaWdnZXJlZF9jb3VudCBhZ2Fpbgo+Cj4gSW4g
Ym90aCBjYXNlcyB0aGVyZSBzaG91bGQgYmUgbm8gbmVlZCB0byByZWFybS4KPgpJIGhhdmUgY2hl
Y2tlZCB0aGlzIG91dCBhbmQgSSBhZ3JlZSB3aXRoIHlvdSwgd2lsbCByZW1vdmUgdGhpcyBpbiBu
ZXh0IAp2ZXJzaW9uLgoKVGhhbmsgeW91IGZvciBzcG90dGluZyB0aGlzLgoKClJlZ2FyZHMsCgpB
bWphZAoKPiByZWdhcmRzCj4gUGhpbGlwcAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dp
Y0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtYW1sb2dpYwo=
