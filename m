Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA1FDE77188
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 Jan 2025 09:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=59bR3sOcSav50tACm4fea9d7neeuOITiq5wmv1ze+PA=; b=xTBl9g9TklVeyH
	31E3QqT1dhgOkr8t4/ZUCSwhJdiFMHsQFICZO5kkc13A1LqsO8tB/607soj3P2/AV6iO/m58QkNxI
	crrI1Lz9qAVxohhUOaaNuWJ1LuRgFY8ykXWUq+Tvd5oTxUS/YTkpmD7xXTctAUxFtrJbQCBuFD0sR
	qmqqCheOvKDbWpSGM57EOwhVkFLjsK3vnH1cNbruc2oCGml3viLTXUD4YNJ7iKyHMxmZj6pph0RAe
	m2UjzST04qTHOB7kR5WKqrtlQhkBeUJukOw6ajg6/pLFk/dN494rYe8RRS/yn7FXVOlZosYtjambo
	2kCqXo6HL/P1oFo8+O5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWBRs-0000000EkxT-36mx;
	Fri, 10 Jan 2025 09:37:00 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWBQh-0000000Ekhj-0tuP;
	Fri, 10 Jan 2025 09:35:48 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4362bae4d7dso13446695e9.1;
        Fri, 10 Jan 2025 01:35:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736501745; x=1737106545; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t9g79eEr03zcR3C0me3t/ZaJgbQfeT6rUS/5evYzFcY=;
        b=bDuKpZbqv7LjysyVYWY0tZxB4dO2AS2b0TKJuhejFN9yiykvh8NyY4JPT7brVfXtPD
         w91g8puy7k1kxw9F6CrWwPu3LfAfobYXBDu+tT6MObr6CqMYiY1vYqEz+Wwda7VnM5i9
         0moqntd/4wf26xHV8pAOVaqvDn6JeSqxbrrNowXh3QCcX+5+gtyNfyaqXnbYJMdVCP7G
         +KKlyrsgkXemk7f1ageMKx4BspmEMBpP1hiMHqjcBQYfEyUjDK2EdchvN2V6cAUJEyf2
         raxZ/2d+O0c9BiuGNuP7KGSjtWh7ilUAllQKwYtWKL+U74Z78vHB8+hN9a9oMjAXoPiY
         rl0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736501745; x=1737106545;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t9g79eEr03zcR3C0me3t/ZaJgbQfeT6rUS/5evYzFcY=;
        b=atW6leymLlcXUjWb4hWO+M68IKqc6vR1Ft44ryaciMBhY7JQoCnaNmJVi/3EYoy//w
         mDe9zLAxfo3mLXfgj8wMR9m37KJP2G+Po1IzqWgxb9dobW1BrVR60pndROIZqXbw+fC4
         wskBLrdRi7QB3NmjB/HbRbXDzy9InYSqpg331GNDR8LeH+itzI/CFOU+mHHtuQ8oiQV/
         nwXpWrGwfOJN6yg7uxDNr/7NLlzmslkUc5eCKeZxuNXyY5T3z7b3PqfED6WOyf9nBJm5
         WG6dM0brsZcFS6pT6VSWMTRzPHonsQJ0eP1DtM6A8/GqRXuvJg9w+617qGGlf3OB/u1f
         3gew==
X-Forwarded-Encrypted: i=1; AJvYcCVtjzS0CkRShWPRRnNBsun/6W+DhtQfyEoXUzF/Jc104wI9baTHV2KrZz8trUEpuK00J2h9mC6y6cmgQNuk@lists.infradead.org, AJvYcCXWhw5b1It/U2e00Rwcm9yIU1pyXdPZw1HEnajj85GupQ+Yof18Oy07rDUhtW8TBKwBNDdLehCp6QkGFzTKiyqkpQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxQuEoPbH+3ypmIMRliF4opVjZv89YZrZcQ9M3V+0DodMK8Lrp2
	qjl16QU/XuB0bLZ51bJwrDsMb4FhgsYq08mRBioSjS8S9mBlknHW
X-Gm-Gg: ASbGncs7nxRpyk+FuDzVOgiRUWKdw5BcAj0hEF8Kcxg9/B7y+x1lhAVXDBBz42fyrAZ
	ejwq6qzXlb2pfbNmuDjMGrsT+Lx7/KRxaD+FpB/irMzqJR+N/+raCvg9xGF4rtSI+ywW9O9Ftzg
	M0jXusJrvJRiGBjD/XOSihL7i74e+EbmNBDaNWgtmLutkJ3xOLB5ZZeBXcuAqN2L42GPTq3X9BJ
	TEu+pF9UE6OGipncip3qFCPTlhed7J2qZH3zqkekbQ5FjqmyfzrtCJSWy8tb2DEybSTNg1eZaNF
	AJM=
X-Google-Smtp-Source: AGHT+IHwl7RTDk7XCHgavjvPYzyw0+x62aQxSFel0BV13NUnPSIe70GA9HfWuDf9a/COfDkzjSeDxQ==
X-Received: by 2002:a5d:6c66:0:b0:38a:4184:151a with SMTP id ffacd0b85a97d-38a87336d7emr8612113f8f.37.1736501745179;
        Fri, 10 Jan 2025 01:35:45 -0800 (PST)
Received: from smtpclient.apple ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e38c990sm4084563f8f.56.2025.01.10.01.35.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 10 Jan 2025 01:35:44 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.200.121\))
Subject: Re: [PATCH 2/2] drm/meson: vclk: fix precision in vclk calculations
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <20250110-flat-quantum-frigatebird-2432f1@houat>
Date: Fri, 10 Jan 2025 13:35:30 +0400
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <048FF805-BF7E-4D1B-B522-E783415057BD@gmail.com>
References: <20250110074458.3624094-1-christianshewitt@gmail.com>
 <20250110074458.3624094-3-christianshewitt@gmail.com>
 <20250110-flat-quantum-frigatebird-2432f1@houat>
To: Maxime Ripard <mripard@kernel.org>
X-Mailer: Apple Mail (2.3826.200.121)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_013547_254738_AC055FE8 
X-CRM114-Status: GOOD (  20.90  )
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

PiBPbiAxMCBKYW4gMjAyNSwgYXQgMTI6MzbigK9wbSwgTWF4aW1lIFJpcGFyZCA8bXJpcGFyZEBr
ZXJuZWwub3JnPiB3cm90ZToKPiAKPiBIaSwKPiAKPiBPbiBGcmksIEphbiAxMCwgMjAyNSBhdCAw
Nzo0NDo1OEFNICswMDAwLCBDaHJpc3RpYW4gSGV3aXR0IHdyb3RlOgo+PiBQbGF5aW5nIFlVVjQy
MCBAIDU5Ljk0IG1lZGlhIGNhdXNlcyBIRE1JIG91dHB1dCB0byBsb3NlIHN5bmMKPj4gd2l0aCBh
IGZhdGFsIGVycm9yIHJlcG9ydGVkOgo+PiAKPj4gWyAgIDg5LjYxMDI4MF0gRmF0YWwgRXJyb3Is
IGludmFsaWQgSERNSSB2Y2xrIGZyZXEgNTkzNDA2Cj4+IAo+PiBJbiBtZXNvbl9lbmNvZGVyX2hk
bWlfc2V0X3ZjbGsgdGhlIGluaXRpYWwgdmNsa19mcmVxIHZhbHVlIGlzCj4+IDU5MzQwNyBidXQg
WVVWNDIwIG1vZGVzIGhhbHZlIHRoZSB2YWx1ZSB0byAyOTY3MDMuNSBhbmQgdGhpcwo+PiBpcyBz
dG9yZWQgYXMgaW50IHdoaWNoIGxvc2VzIHByZWNpc2lvbiBieSByb3VuZGluZyBkb3duIHRvCj4+
IDI5NjcwMy4gVGhlIHJvdW5kZWQgdmFsdWUgaXMgbGF0ZXIgZG91YmxlZCB0byA1OTM0MDYgYW5k
IHRoZW4KPj4gbWVzb25fZW5jb2Rlcl9oZG1pX3NldF92Y2xrIHNldHMgYW4gaW52YWxpZCB2Y2xr
X2ZyZXEgdmFsdWUKPj4gYW5kIHRoZSBlcnJvciB0cmlnZ2VycyBkdXJpbmcgbWVzb25fdmxrY19z
ZXR1cCB2YWxpZGF0aW9uLgo+PiAKPj4gRml4IHByZWNpc2lvbiBpbiBtZXNvbl9lbmNvZGVyX2hk
bWlfc2V0X3ZjbGsgYnkgc3dpdGNoaW5nIHRvCj4+IHVuc2lnbmVkIGxvbmcgbG9uZyBLSHogdmFs
dWVzIGluc3RlYWQgb2YgaW50IE1Iei4gQXMgdmFsdWVzCj4+IGZvciBwaHlfZnJlcSBhcmUgbm93
IG1vcmUgYWNjdXJhdGUgd2UgYWxzbyBuZWVkIHRvIGhhbmRsZSBhbgo+PiBhZGRpdGlvbmFsIG1h
dGNoIHNjZW5hcmlvIGluIG1lc29uX3ZjbGtfc2V0dXAuCj4+IAo+PiBGaXhlczogZTVmYWIyZWM5
Y2E0ICgiZHJtL21lc29uOiB2Y2xrOiBhZGQgc3VwcG9ydCBmb3IgWVVWNDIwIHNldHVwIikKPj4g
U2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEhld2l0dCA8Y2hyaXN0aWFuc2hld2l0dEBnbWFpbC5j
b20+Cj4+IC0tLQo+PiBkcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fZW5jb2Rlcl9oZG1pLmMg
fCA0MiArKysrKysrKysrKy0tLS0tLS0tLS0tCj4+IGRyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNv
bl92Y2xrLmMgICAgICAgICB8ICAzICstCj4+IDIgZmlsZXMgY2hhbmdlZCwgMjMgaW5zZXJ0aW9u
cygrKSwgMjIgZGVsZXRpb25zKC0pCj4+IAo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L21lc29uL21lc29uX2VuY29kZXJfaGRtaS5jIGIvZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29u
X2VuY29kZXJfaGRtaS5jCj4+IGluZGV4IDA1OTNhMWNkZTkwNi4uZmEzN2NmOTc1OTkyIDEwMDY0
NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fZW5jb2Rlcl9oZG1pLmMKPj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX2VuY29kZXJfaGRtaS5jCj4+IEBAIC03
MCwxMiArNzAsMTIgQEAgc3RhdGljIHZvaWQgbWVzb25fZW5jb2Rlcl9oZG1pX3NldF92Y2xrKHN0
cnVjdCBtZXNvbl9lbmNvZGVyX2hkbWkgKmVuY29kZXJfaGRtaSwKPj4gewo+PiBzdHJ1Y3QgbWVz
b25fZHJtICpwcml2ID0gZW5jb2Rlcl9oZG1pLT5wcml2Owo+PiBpbnQgdmljID0gZHJtX21hdGNo
X2NlYV9tb2RlKG1vZGUpOwo+PiAtIHVuc2lnbmVkIGludCBwaHlfZnJlcTsKPj4gLSB1bnNpZ25l
ZCBpbnQgdmNsa19mcmVxOwo+PiAtIHVuc2lnbmVkIGludCB2ZW5jX2ZyZXE7Cj4+IC0gdW5zaWdu
ZWQgaW50IGhkbWlfZnJlcTsKPj4gKyB1bnNpZ25lZCBsb25nIGxvbmcgdmNsa19mcmVxOwo+PiAr
IHVuc2lnbmVkIGxvbmcgbG9uZyBwaHlfZnJlcTsKPj4gKyB1bnNpZ25lZCBsb25nIGxvbmcgdmVu
Y19mcmVxOwo+PiArIHVuc2lnbmVkIGxvbmcgbG9uZyBoZG1pX2ZyZXE7Cj4+IAo+PiAtIHZjbGtf
ZnJlcSA9IG1vZGUtPmNsb2NrOwo+PiArIHZjbGtfZnJlcSA9IG1vZGUtPmNsb2NrICogMTAwMFVM
TDsKPiAKPiBZb3Ugc2hvdWxkIGJlIHVzaW5nIGRybV9oZG1pX2NvbXB1dGVfbW9kZV9jbG9jaygp
IGhlcmUKCkhlbGxvIE1heGltZSwKCklmIHdl4oCZcmUgdGFsa2luZyBhIG9uZS10d28gbGluZSBj
aGFuZ2UgdGhhbiBJ4oCZZCBsaWtlIHBvaW50ZXJzCmFuZCBndWlkYW5jZSBvbiBob3cgdG8gZ28g
YWJvdXQgdGhhdCAob2ZmbGluZSB0byBhdm9pZCBncm91cApub2lzZSkuIEkgaGF2ZSBvbmx5IHJ1
ZGltZW50YXJ5IGMgc2tpbGxzIHRob3VnaCwgc28gYW55dGhpbmcKdGhhdCBsb29rcyBsaWtlIHJl
cGx1bWJpbmcgYSBkcml2ZXIgYXJvdW5kIGRybV9jb25uZWN0b3IgaXMKd2F5IGJleW9uZCBteSBj
dXJyZW50IGRybSBjb2RlIGFuZCBnZW5lcmFsIGNvZGluZyBrbm93bGVkZ2U7CkkgY2FuIG9ubHkg
b2ZmZXIgYSBmaXggbm90IGEgcHJvcGVyIGltcHJvdmVtZW50IDooCgpDaHJpc3RpYW4KCj4gLyog
Rm9yIDQyMCwgcGl4ZWwgY2xvY2sgaXMgaGFsZiB1bmxpa2UgdmVuYyBjbG9jayAqLwo+PiBpZiAo
ZW5jb2Rlcl9oZG1pLT5vdXRwdXRfYnVzX2ZtdCA9PSBNRURJQV9CVVNfRk1UX1VZWVZZWThfMF81
WDI0KQo+PiBAQCAtODUsOCArODUsOSBAQCBzdGF0aWMgdm9pZCBtZXNvbl9lbmNvZGVyX2hkbWlf
c2V0X3ZjbGsoc3RydWN0IG1lc29uX2VuY29kZXJfaGRtaSAqZW5jb2Rlcl9oZG1pLAo+PiBwaHlf
ZnJlcSA9IHZjbGtfZnJlcSAqIDEwOwo+PiAKPj4gaWYgKCF2aWMpIHsKPj4gLSBtZXNvbl92Y2xr
X3NldHVwKHByaXYsIE1FU09OX1ZDTEtfVEFSR0VUX0RNVCwgcGh5X2ZyZXEsCj4+IC0gIHZjbGtf
ZnJlcSwgdmNsa19mcmVxLCB2Y2xrX2ZyZXEsIGZhbHNlKTsKPj4gKyBtZXNvbl92Y2xrX3NldHVw
KHByaXYsIE1FU09OX1ZDTEtfVEFSR0VUX0RNVCwgcGh5X2ZyZXEgLyAxMDAwVUxMLAo+PiArICB2
Y2xrX2ZyZXEgLyAxMDAwVUxMLCB2Y2xrX2ZyZXEgLyAxMDAwVUxMLAo+PiArICB2Y2xrX2ZyZXEg
LyAxMDAwVUxMLCBmYWxzZSk7Cj4+IHJldHVybjsKPj4gfQo+PiAKPj4gQEAgLTEwNywxMiArMTA4
LDkgQEAgc3RhdGljIHZvaWQgbWVzb25fZW5jb2Rlcl9oZG1pX3NldF92Y2xrKHN0cnVjdCBtZXNv
bl9lbmNvZGVyX2hkbWkgKmVuY29kZXJfaGRtaSwKPj4gaWYgKG1vZGUtPmZsYWdzICYgRFJNX01P
REVfRkxBR19EQkxDTEspCj4+IHZlbmNfZnJlcSAvPSAyOwo+PiAKPj4gLSBkZXZfZGJnKHByaXYt
PmRldiwgInZjbGs6JWQgcGh5PSVkIHZlbmM9JWQgaGRtaT0lZCBlbmNpPSVkXG4iLAo+PiAtIHBo
eV9mcmVxLCB2Y2xrX2ZyZXEsIHZlbmNfZnJlcSwgaGRtaV9mcmVxLAo+PiAtIHByaXYtPnZlbmMu
aGRtaV91c2VfZW5jaSk7Cj4+IC0KPj4gLSBtZXNvbl92Y2xrX3NldHVwKHByaXYsIE1FU09OX1ZD
TEtfVEFSR0VUX0hETUksIHBoeV9mcmVxLCB2Y2xrX2ZyZXEsCj4+IC0gIHZlbmNfZnJlcSwgaGRt
aV9mcmVxLCBwcml2LT52ZW5jLmhkbWlfdXNlX2VuY2kpOwo+PiArIG1lc29uX3ZjbGtfc2V0dXAo
cHJpdiwgTUVTT05fVkNMS19UQVJHRVRfSERNSSwgcGh5X2ZyZXEgLyAxMDAwVUxMLAo+PiArICB2
Y2xrX2ZyZXEgLyAxMDAwVUxMLCB2ZW5jX2ZyZXEgLyAxMDAwVUxMLCBoZG1pX2ZyZXEgLyAxMDAw
VUxMLAo+PiArICBwcml2LT52ZW5jLmhkbWlfdXNlX2VuY2kpOwo+PiB9Cj4+IAo+PiBzdGF0aWMg
ZW51bSBkcm1fbW9kZV9zdGF0dXMgbWVzb25fZW5jb2Rlcl9oZG1pX21vZGVfdmFsaWQoc3RydWN0
IGRybV9icmlkZ2UgKmJyaWRnZSwKPj4gQEAgLTEyMiwxMCArMTIwLDEwIEBAIHN0YXRpYyBlbnVt
IGRybV9tb2RlX3N0YXR1cyBtZXNvbl9lbmNvZGVyX2hkbWlfbW9kZV92YWxpZChzdHJ1Y3QgZHJt
X2JyaWRnZSAqYnJpCj4+IHN0cnVjdCBtZXNvbl9lbmNvZGVyX2hkbWkgKmVuY29kZXJfaGRtaSA9
IGJyaWRnZV90b19tZXNvbl9lbmNvZGVyX2hkbWkoYnJpZGdlKTsKPj4gc3RydWN0IG1lc29uX2Ry
bSAqcHJpdiA9IGVuY29kZXJfaGRtaS0+cHJpdjsKPj4gYm9vbCBpc19oZG1pMl9zaW5rID0gZGlz
cGxheV9pbmZvLT5oZG1pLnNjZGMuc3VwcG9ydGVkOwo+PiAtIHVuc2lnbmVkIGludCBwaHlfZnJl
cTsKPj4gLSB1bnNpZ25lZCBpbnQgdmNsa19mcmVxOwo+PiAtIHVuc2lnbmVkIGludCB2ZW5jX2Zy
ZXE7Cj4+IC0gdW5zaWduZWQgaW50IGhkbWlfZnJlcTsKPj4gKyB1bnNpZ25lZCBsb25nIGxvbmcg
dmNsa19mcmVxOwo+PiArIHVuc2lnbmVkIGxvbmcgbG9uZyBwaHlfZnJlcTsKPj4gKyB1bnNpZ25l
ZCBsb25nIGxvbmcgdmVuY19mcmVxOwo+PiArIHVuc2lnbmVkIGxvbmcgbG9uZyBoZG1pX2ZyZXE7
Cj4+IGludCB2aWMgPSBkcm1fbWF0Y2hfY2VhX21vZGUobW9kZSk7Cj4+IGVudW0gZHJtX21vZGVf
c3RhdHVzIHN0YXR1czsKPj4gCj4+IEBAIC0xNDksNyArMTQ3LDcgQEAgc3RhdGljIGVudW0gZHJt
X21vZGVfc3RhdHVzIG1lc29uX2VuY29kZXJfaGRtaV9tb2RlX3ZhbGlkKHN0cnVjdCBkcm1fYnJp
ZGdlICpicmkKPj4gfSBlbHNlIGlmICghbWVzb25fdmVuY19oZG1pX3N1cHBvcnRlZF92aWModmlj
KSkKPj4gcmV0dXJuIE1PREVfQkFEOwo+PiAKPj4gLSB2Y2xrX2ZyZXEgPSBtb2RlLT5jbG9jazsK
Pj4gKyB2Y2xrX2ZyZXEgPSBtb2RlLT5jbG9jayAqIDEwMDBVTEw7Cj4gCj4gQW5kIGhlcmUgdG9v
Lgo+IAo+IE1heGltZQoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1hbWxvZ2ljCg==
