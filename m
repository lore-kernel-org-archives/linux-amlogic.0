Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D73FC43334
	for <linux-amlogic@archiver.kernel.org>; Sat, 11 Jun 2022 14:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+4+HFRaD+/tuC8MfFlulZLxV2Zv9LWoxX+Xr1lw0/rg=; b=W6AZx6GFjuq9t9
	XhqCfzmhk+hNY6N4NwmeOAHtnUUhSMFCTmzun4LVNZCowsV/1b4DWEdPT9Lvm7JhxjzY7mtGVUrKD
	dgwzgkIDOzbExC9c9CQx/G/UtxtjBG/BdCKd3kZ6eWcxOlM4Yjz0VN8sNlCvyJGTwoSUL0fS6yk7l
	UoWo3z6vFZO1JMBcMOnUAHMw8b2PpgplJbE1BXe9c/W5WrySJcQeWD3SgROHJi3zDPoZVUyDCBTdr
	iOV7uhVVy9b5f/OrQCR9ry0yMlJR1ozHEtfRKPRzP0qyu4ftSQjNL132b+7fhFANOPmHjjTG0OFNH
	lkLIq+yE6fngwwzDlPKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o01wQ-00DGbB-FK; Sat, 11 Jun 2022 14:18:18 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o01wO-00DGZg-85
	for linux-amlogic@lists.infradead.org; Sat, 11 Jun 2022 14:18:17 +0000
Received: by mail-wr1-x432.google.com with SMTP id x17so1903075wrg.6
        for <linux-amlogic@lists.infradead.org>; Sat, 11 Jun 2022 07:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=ITBoLYA2N5MuLO3gqnXnaF4OTMmFSVYBYZ7MPGfv98c=;
        b=CosyK9y8uyI6z7UiVBwQHZ7V3roQMVGBnGiDI6XrD6rMEuNsI+GrkViig8YkorsqzZ
         QxDTaPI+4iI+RkhZn2rzNMOhkCOGKOlHkYj9FAs1e69xXRdX4ygHFGY9w5CenwRMj/hR
         sDAkPzYyyC6bYt3JnAxdhMvSIWqpR1us/VzYgDiC1HFp8ktKRGxhELxaEMrU16bJHsoW
         vgL73GIquT3Jhq7gRhkLPNSVxD93f+/NVGrnHOCaotdU5wyBAYX4PR9MKzd70JrBIw0t
         PowbThrSchM5vvtRRdFQCNlX3muycViiIM7199UbU/wJtNn2S+rwA27nqh3UncKHJ6Be
         HHdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=ITBoLYA2N5MuLO3gqnXnaF4OTMmFSVYBYZ7MPGfv98c=;
        b=DUbW+p9wzbRu9nenlZKkzC7XPkI3XJvutZEp8MwVin7fhohN5EYvzEBjyO5QoIh5Sh
         89OLH0tLtCRYsDrbcoSg5qiPT5lWEZO5WyW1YPxBZ20H3k74NLIJVc/WyVh0cAcQLlQT
         sRkQuYLqTR2hsAo5SkiqHlsGDjZvSleSwGoyZGLbwCRRxwBvFpHQjW5eSrkhJZKfgBqS
         hFyDjccysaiEQarEQX7btnXl8dsdJslRDfpWaObRdY59eWSB04USJ1w7JpOI61YXS2O/
         DQ2eGpUD8EoyASaTMikdR4BXRcaGCh0tBYZVuU4F38a5m5uhXoXOGm/i1u0vp4M6Xult
         SjBw==
X-Gm-Message-State: AOAM5307U4kXw3dwzDPgUmqkvFwoeEnSjCErIzxf0D6GxwYltXgs8SdR
	iWCzvsJ1nMu+XR9nW/QI4j0=
X-Google-Smtp-Source: ABdhPJzhksldhSpuMrQXGmaC+i4KujXhjL1ZD15ZkzgePaXPsBUiLjWfbR0ZYRlvgT7qv3JhL0MNrQ==
X-Received: by 2002:a5d:4c49:0:b0:210:353c:1c91 with SMTP id n9-20020a5d4c49000000b00210353c1c91mr49318338wrt.159.1654957093371;
        Sat, 11 Jun 2022 07:18:13 -0700 (PDT)
Received: from smtpclient.apple ([167.99.200.149])
        by smtp.gmail.com with ESMTPSA id i7-20020a1c3b07000000b0039744bd664esm6950127wma.13.2022.06.11.07.18.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 11 Jun 2022 07:18:12 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.100.31\))
Subject: Re: Regression in 5.18.3 from "xhci: Set HCD flag to defer primary
 roothub registration"
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <YqRFH2i3s/jL28ZG@kroah.com>
Date: Sat, 11 Jun 2022 18:18:08 +0400
Cc: Kishon Vijay Abraham I <kishon@ti.com>,
 Mathias Nyman <mathias.nyman@linux.intel.com>,
 Chris Chiu <chris.chiu@canonical.com>,
 linux-usb@vger.kernel.org,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 stable@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>
Message-Id: <AF1EDC5C-7304-48F4-A981-CD8DDBFAB5EE@gmail.com>
References: <743F7369-2794-4189-8891-5DA62E4B62DA@gmail.com>
 <YqRFH2i3s/jL28ZG@kroah.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Mailer: Apple Mail (2.3696.100.31)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220611_071816_359475_8B2EEB31 
X-CRM114-Status: UNSURE (   9.82  )
X-CRM114-Notice: Please train this message.
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

Cj4gT24gMTEgSnVuIDIwMjIsIGF0IDExOjMyIGFtLCBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdr
aEBsaW51eGZvdW5kYXRpb24ub3JnPiB3cm90ZToKPiAKPiBPbiBTYXQsIEp1biAxMSwgMjAyMiBh
dCAxMDo0OToyM0FNICswNDAwLCBDaHJpc3RpYW4gSGV3aXR0IHdyb3RlOgo+PiBDb21taXQgNmM2
NGE2NjRlMWNmZjMzOWVjNjk4ZDgwM2ZhOGNiYjlhZjVkOTVjZSDigJx4aGNpOiBTZXQgSENEIGZs
YWcgdG8gZGVmZXIKPj4gcHJpbWFyeSByb290aHViIHJlZ2lzdHJhdGlvbuKAnSBhZGRlZCBmb3Ig
TGludXggNS4xOC4zIGNhdXNlZCBhIHJlZ3Jlc3Npb24gb24KPj4gc29tZSBBbWxvZ2ljIFM5MTIg
ZGV2aWNlcyAob3JpZ2luYWwgdXNlciBmb3J1bSByZXBvcnQgd2l0aCBhbiBBbmRyb2lkIFRWIGJv
eAo+PiBhbmQgY29uZmlybWVkIHdpdGggYSBLaGFkYXMgVklNMiBib2FyZCkuIEkgZG8gbm90IHNl
ZSBpc3N1ZXMgd2l0aCBvbGRlciBTOTA1Cj4+IChXZVRlSyBQbGF5Mikgb3IgbmV3ZXIgUzkyMlgg
KE9kcm9pZCBOMispIGRldmljZXMgcnVubmluZyB0aGUgc2FtZSBrZXJuZWwuCj4+IFRoZXJlIGFy
ZSBubyBrZXJuZWwgc3BsYXRzIG9yIGVycm9yIG1lc3NhZ2VzIGJ1dCBsc3VzYiBzaG93cyBubyBv
dXRwdXQgYW5kCj4+IG5vdGhpbmcgd29ya3MuIFNpbXBsZSByZXZlcnQgcmVzdG9yZXMgdGhlIHBy
ZXZpb3VzIGdvb2Qgd29ya2luZyBiZWhhdmlvdXIuCj4+IAo+PiBkbWVzZyB3aXRoIGNvbW1pdCBo
dHRwOi8vaXguaW8vM1pUdgo+PiBkbWVzZyB3aXRoIHJldmVydCBodHRwOi8vaXguaW8vM1pUdwo+
PiAKPj4gSeKAmW0gbm90IGEgY29kZXIgc28gd2lsbCBuZWVkIHRvIGJlIGZlZCBpbnN0cnVjdGlv
bnMgdG8gYXNzaXN0IHdpdGggZGVidWdnaW5nCj4+IHRoZSBpc3N1ZSBmdXJ0aGVyIGlmIHlvdSBk
b24ndCBoYXZlIGFjY2VzcyB0byBhbiBBbWxvZ2ljIFM5MTIgZGV2aWNlLiBJIGNhbgo+PiBzaGFy
ZSBkZXZpY2VzIG9ubGluZSBmb3IgcmVtb3RlIHBva2luZyBhcm91bmQgaWYgbmVlZGVkLgo+IAo+
IERvZXMgNS4xOS1yYzEgYWxzbyBoYXZlIHRoaXMgcHJvYmxlbT8KCk5vLCBhbmQgaW4gdGhlIHBy
b2Nlc3Mgb2YgZml4aW5nIHVwIG15IG5vcm1hbCBwYXRjaHNldCB0byB0ZXN0IDUuMTktcmMxIEni
gJl2ZQpzcG90dGVkIHNvbWUgb3RoZXIgVVNCIHBhdGNoZXMgcGlja2VkIGZyb20gbGlzdHMuIE9u
Y2UgZHJvcHBlZCBmcm9tIDUuMTguMyB1c2IKd29ya3MgYWdhaW4uIFNvIG15IGJhZCwgc29ycnkg
Zm9yIHRoZSBub2lzZSEKCkNocmlzdGlhbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2lj
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1hbWxvZ2ljCg==
