Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80F8AE8FDB1
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Dec 2025 11:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nkFMldVc0tdtpm1e+hg/V8a+d+nz2i8wheoYcgcQMN0=; b=Ee42SDP3Zk+M4n
	TFm50RN8ZtNzXhSpnUoMch0oHroTQDVLpGEXwEoxjfocO2Z3CdkYQQZUpSZBPdt6/0uYjcQFefqC5
	vhPpuGR1b+nBtxtCet2UTZW/khdGdVPrVGC5hDsItygjqCkaJYB4lbXvtrCCfC+CajvH1865HEu75
	fmVVLJsfdQ8MtBv279jBvS7t1R7LN1/KO0Smh4ispY0KX4o8cW7zXCSN8GqxD85WWV/rkuL1iyXu8
	h6PloQ/wSC0U4mWFiq1p04W+vH3f1WvoUXJoUQlpb2QSXj1A5frsf1AsgV1zwxw86iVW5oE5TlVdt
	ANVtdcJ+luUR2CdrlwyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaBDu-00000003c0d-0Fu6;
	Mon, 29 Dec 2025 11:15:38 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaBDp-00000003bzg-2YzG
	for linux-amlogic@lists.infradead.org;
	Mon, 29 Dec 2025 11:15:37 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-4308d81fdf6so4176317f8f.2
        for <linux-amlogic@lists.infradead.org>; Mon, 29 Dec 2025 03:15:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767006929; x=1767611729; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gpnL12+10WMDZ/zLbFzfXl87AByZQny2Cqko/Ftm7i8=;
        b=bNiDQ7G08aAj6j1fGE7jnbyjcf0t5J2RpNm8qcHJaRG1/KTXGmizWZO7lHFsL5qbwR
         tS/yQM0xPrS9MrgpMW1QaDhqAR5Sr4ICnLwyrczfr8uWlFRSjzpdtcTet8BjseSDTRgR
         NDsZq/lwwCurTi0h5IjXYrPDXh1gm7EfasK8j0+m8xWApPfOrAjnd68oMhDeDbzxyDIb
         X7f3o0QVmICdF1lRwj0mF1I62j1ZIjt1MmccCRlhKdEJleAg6ITHCEcburw6iUhD7wgQ
         gF9rCqb1lv29NvRe7+Q2tnWLd+MR+rWBREeQF4TK/wi/GrsE2tFECgdqgEsAAYbh2//Q
         TxYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767006929; x=1767611729;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gpnL12+10WMDZ/zLbFzfXl87AByZQny2Cqko/Ftm7i8=;
        b=T9K2PizEy/ipWdGY0TDx/EmhV9i4VobvnaNAQ9o6++sL0Y6SEwA2fHDjXHduma6io8
         SpZuP8G+EimTLqOHwTn/7YDPEZmiIflP4dMmnzWKsoN25QO1+BNBMXUMqvkjsJp26bFX
         SXcq03IIMeR2n0rf4oCH9Kfv/USQu3WFZKclh1aP76s6R98BuMXI0z2DKcIwNdRR1W4M
         qs7V5TTfLxtY9BxgDFXnbRhgUvMqR6SEmlkrz5nhjTfIur4QGow7sgAriIyZ8M6pBmtt
         Ez1c8spdPTSDOEF9rpPQKV+plNSzl30ml0TNqJ9JHMUOgBkxKzrTi2FNMvzjvDUaUDH7
         XSkg==
X-Gm-Message-State: AOJu0YxnrJJeedw35ZHRf4xes4FB99GJZvaJD6HY3Sboi4Prc19GKXph
	xAgZSW57wduiiIpOZ5hfJ4GS6BRbTveEg8Mum/k8yz93NjAg7q1YEC6/
X-Gm-Gg: AY/fxX5KykHlN/1g6IfEGmbJXWpvApQ1HVhICb421LyFG5h+8fomiFqg406lKytynAr
	4s7oKGB0mrT4Ch3Pb54Wud2xDRu5CM+hBuo4aOu3j67PIaBlY1oI86lqWdfTjzKl31XC+nPKhVU
	6X1G/4ndHFtgmGTm+OX6hoYbZEWkwEDHSRa7ZVJ5n3PmJic7bDBewOBkXVGBTh+kT2FiO/j0fKC
	svDTWHgjN4DyHFfkzwzDNIfP/ixwkvGvQQZyBl49KEkWW+d2ySaKT/cDhffJc0hTmniQFw5nHG1
	ZSaSC16FPaZw/zCn8ClVdRtS6WC13bvYuly+Yh2gSzo7LcpBrH62nNnIvG3eiYdgBnIO3xuSzyD
	V5M7iH4RRThrQrIQUI4ml0H+JSRtefa5SywHp3ihw8OlfpzCIhJrkgGZ2mysiRrOpaetBg79u1L
	jB/d9OUZlJilggbVx1IaWgkRePxZynCTzsUd1DRSOkZmJ2PPTeULmj5MRRuKS6CE2nuVwMYKO+f
	VYdXEiPMyZJ/pJ9zBWD
X-Google-Smtp-Source: AGHT+IE40zrhw3F6xmyWQeMWTwedY3Ymb2iFUauvsMIwQ1EpFshoVSZdHlAb9Q9oq8B4HsHTN7T4mA==
X-Received: by 2002:a05:6000:430a:b0:427:854:770 with SMTP id ffacd0b85a97d-4324e50a1c1mr34072551f8f.43.1767006928605;
        Mon, 29 Dec 2025 03:15:28 -0800 (PST)
Received: from smtpclient.apple (static.253.36.98.91.clients.your-server.de. [91.98.36.253])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa4749sm62515969f8f.37.2025.12.29.03.15.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Dec 2025 03:15:28 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.3\))
Subject: Re: [PATCH RFC v1] drm/meson: venc: add support for HDMI DMT modes up
 to 3840x2160
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <20251108134236.1299630-1-martin.blumenstingl@googlemail.com>
Date: Mon, 29 Dec 2025 15:15:14 +0400
Cc: linux-amlogic@lists.infradead.org,
 dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 neil.armstrong@linaro.org,
 maarten.lankhorst@linux.intel.com,
 mripard@kernel.org,
 tzimmermann@suse.de,
 tobetter@gmail.com
Message-Id: <A9CFD913-A6AD-4078-90C2-C1E46EF5E74D@gmail.com>
References: <20251108134236.1299630-1-martin.blumenstingl@googlemail.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-Mailer: Apple Mail (2.3826.700.81.1.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_031535_185538_2A8AF07E 
X-CRM114-Status: GOOD (  23.67  )
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

PiBPbiA4IE5vdiAyMDI1LCBhdCA1OjQy4oCvcG0sIE1hcnRpbiBCbHVtZW5zdGluZ2wgPG1hcnRp
bi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+IHdyb3RlOgo+IAo+IENvbW1pdCA1ZDBiZmU0
NDg0ODEgKCJkcm0vbWVzb246IEFkZCBIRE1JIDEuNCA0ayBtb2RlcyIpIGFkZGVkIHN1cHBvcnQK
PiBmb3IgSERNSSAxLjQgNGsgbW9kZXMsIHdoaWNoIGlzIHdoYXQgVFZzIG5lZWQuIEZvciBjb21w
dXRlciBtb25pdG9ycwo+IHRoZSBjb2RlIGlzIHVzaW5nIHRoZSBETVQgY29kZS1wYXRoLCB3aGlj
aCBlbmRzIHVwIGluCj4gbWVzb25fdmVuY19oZG1pX3N1cHBvcnRlZF9tb2RlKCksIHdoaWNoIGRv
ZXMgbm90IGFsbG93IHRoZSA0ayBtb2RlcyB5ZXQuCj4gCj4gVGhlIGRhdGFzaGVldCBmb3IgYWxs
IHN1cHBvcnRlZCBTb0NzIG1lbnRpb25zICI0S3gyS0A2MCIuIEl0J3Mgbm90Cj4gY2xlYXIgd2hl
dGhlciAiNEsiIGhlcmUgbWVhbnMgMzg0MCBvciA0MDk2IHBpeGVscy4KPiAKPiBBbGxvdyByZXNv
bHV0aW9ucyB1cCB0byAzODQweDIxNjAgcGl4ZWxzIChpbmNsdWRpbmcgbWlkZGxlIHN0ZXBzLCBz
dWNoCj4gYXMgV1FIRCBhdCAyNTYweDE0NDAgcGl4ZWxzKSBzbyB0aGV5IGNhbiBiZSB1c2VkIHdp
dGggY29tcHV0ZXIgbW9uaXRvcnMKPiAodXNpbmcgdGhlIERNVCBjb2RlLXBhdGggaW4gdGhlIGRy
aXZlcikuCj4gCj4gU2lnbmVkLW9mZi1ieTogTWFydGluIEJsdW1lbnN0aW5nbCA8bWFydGluLmJs
dW1lbnN0aW5nbEBnb29nbGVtYWlsLmNvbT4KClRoaXMgaXMgbm90IGEgVEIgdG8ga2VybmVsIHN0
YW5kYXJkcywgYnV0IGl0IHNlZW1zIG5vdCBtYW55IGZvbGsKaGF2ZSB1bHRyYS13aWRlIG1vbml0
b3JzIHNvIHRoaXMgaXMgYXMgZ29vZCBhcyBpdCBnZXRzOgoKVGVzdGVkLWJ5OiBLaGFkYXMgZm9y
dW0gdXNlciB3aXRoIGEgVklNMyBydW5uaW5nIHBhdGNoZWQgNi4xOCA6KQoKaHR0cHM6Ly9mb3J1
bS5raGFkYXMuY29tL3QvY2FuLW5vdC1zZXQtZGlzcGxheS1yZXNvbHV0aW9uLXRvLTM0NDB4MTQ0
MC1mb3ItZGVsbC1tb25pdG9yLzI2MjcxLzgKCkNocmlzdGlhbgoKPiAtLS0KPiBJJ20gc2VuZGlu
ZyB0aGlzIGFzIFJGQyBhcyBJJ20gaG9waW5nIHRvIGdldCBzb21lIGNvbW1lbnRzIG9uIHRoZQo+
ICI0S3gyS0A2MCIgbm90ZSBmcm9tIHRoZSBkYXRhc2hlZXRzLgo+IAo+IEkgaGF2ZSB0ZXN0ZWQg
aXQgbXlzZWxmIG9uIGEgR1hMIExlIFBvdGF0byBib2FyZCB1c2luZyBhIGNvbXB1dGVyCj4gbW9u
aXRvciBhdCAyNTYweDE0NDAgcGl4ZWxzLgo+IAo+IFRoaXMgaXMgdGhlIHNwaXJpdHVhbCBzdWNj
ZXNzb3Igb2YgYSBwYXRjaCB0aXRsZWQgImRybS9tZXNvbjogYWRkCj4gc3VwcG9ydCBmb3IgMjU2
MHgxNDQwIHJlc29sdXRpb24gb3V0cHV0IiBmcm9tIFswXQo+IAo+IFswXSBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9saW51eC1hbWxvZ2ljLzIwMjUwOTI3MTMwMjM5LjgyNTA2MC0xLWNocmlzdGlh
bnNoZXdpdHRAZ21haWwuY29tLwo+IAo+IAo+IGRyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl92
ZW5jLmMgfCA0ICsrLS0KPiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fdmVu
Yy5jIGIvZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX3ZlbmMuYwo+IGluZGV4IDNiZjBkNmU0
ZmMzMC4uNGFiZDBjMDliNDQyIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9t
ZXNvbl92ZW5jLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fdmVuYy5jCj4g
QEAgLTg2OCwxMCArODY4LDEwIEBAIG1lc29uX3ZlbmNfaGRtaV9zdXBwb3J0ZWRfbW9kZShjb25z
dCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqbW9kZSkKPiAgICBEUk1fTU9ERV9GTEFHX1BWU1lO
QyB8IERSTV9NT0RFX0ZMQUdfTlZTWU5DKSkKPiByZXR1cm4gTU9ERV9CQUQ7Cj4gCj4gLSBpZiAo
bW9kZS0+aGRpc3BsYXkgPCA0MDAgfHwgbW9kZS0+aGRpc3BsYXkgPiAxOTIwKQo+ICsgaWYgKG1v
ZGUtPmhkaXNwbGF5IDwgNDAwIHx8IG1vZGUtPmhkaXNwbGF5ID4gMzg0MCkKPiByZXR1cm4gTU9E
RV9CQURfSFZBTFVFOwo+IAo+IC0gaWYgKG1vZGUtPnZkaXNwbGF5IDwgNDgwIHx8IG1vZGUtPnZk
aXNwbGF5ID4gMTkyMCkKPiArIGlmIChtb2RlLT52ZGlzcGxheSA8IDQ4MCB8fCBtb2RlLT52ZGlz
cGxheSA+IDIxNjApCj4gcmV0dXJuIE1PREVfQkFEX1ZWQUxVRTsKPiAKPiByZXR1cm4gTU9ERV9P
SzsKPiAtLSAKPiAyLjUxLjIKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1hbWxvZ2ljCg==
