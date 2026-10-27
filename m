Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857F2606A31A
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Oct 2026 10:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GX1PrMPa;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CXza558X
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ILwttxsMMBZcrx8Fc0vp58nxH9fHip+2yEc8brCL9hg=; b=GX1PrMPaSpH4RAf8iE8qknWtip
	NOdUtOhYsuWFAbzy91m4LB51OQIVVv8oHUZWsLn17La0ZPODalyJueIkEN6AKRzTHKbgSuwbMFzsp
	0+2WPRC3jXjjIsRzhGcJ41NBg3Q7dLyxH6LhOFz3NWYsAquB3ASu9XqLL9AgEj/JkRiruus9FnBP/
	SyvcuTNMFU75OkKxy8uiYpGUeJCU+hnDn3EE76KyHjIK+c8kzs7TCPK9OOPo1LmvYzS9bR5qylgKm
	BwBaaMHqt3G4qc1IIKYMeBgEUArTUZEffWjBRFvmvfKTCQwB7jB8EOYusEb/5CflyExMUQMXu/BYD
	BCAx6VnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLeK9-00000004I1Z-1wwJ;
	Tue, 27 Oct 2026 10:22:33 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLeK5-00000004I0E-32n7
	for linux-amlogic@lists.infradead.org;
	Tue, 27 Oct 2026 10:22:32 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so26897385e9.1
        for <linux-amlogic@lists.infradead.org>; Tue, 27 Oct 2026 03:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793096547; x=1793701347; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Txz3OjJcCusHpkz1mnsFRsjrPbuP5hB0e5979S9csEw=;
        b=CXza558XwHaD6oFW1tyte4+cdnwvJ5nSXl6pGDvaxuvcO8/DQLdjRc7KNB38awFnAx
         2TVJmoIjfngrC5DpRF7v1/cKYs3BNcytLfSu8loo91ZkYWvjc3Z4IwE967ZW/amyGfI4
         dWzyTaYH7aEDcQGva1bML3VXRXlRiuJccJfHn5ChFhSgpnYMPy5DGVTM7dBpSHPucHVu
         kc3quf3fnDFc9Ln99MacqymXifI+2EgVs3Xtu+XTQ200cBq/OsKE4uK32zTyr5M9qFZH
         LABuJ8tNPNO2Hr+EHUneOk3prWhaRtvejego7KQX3hna3scoGr/814qYWhxaphZ34eSw
         Qh0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793096547; x=1793701347;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Txz3OjJcCusHpkz1mnsFRsjrPbuP5hB0e5979S9csEw=;
        b=bAY2F7VmWp3JDRzIAA3m90EVap453KqjRBoLUWkEXssVX6lLg5Nr45nj2OMV6AH/fm
         h0PEdQsI8r2yz7sCMjwNnBmzmr9M9Ygv3iux/kWmMJ78383LJIsh8GtcqGswOP0fBEoJ
         agDE9NzmwsYPwwirnltlAjowLcoYRF26pINcP7wSJXXzlU4iRhB7iPdpHIliDlGTYYbs
         l18K+AJba0eUMPORPajNhPQLWf+9Ou4XjUy81awX5bH1FrPFIEvYrYFOFwDEokqRibJB
         PxGIoQITxzJGeN4sXuiuiQKfxcqHk/mckQkjwDVyOhn7aoltFhS2xbljIraTtUNAh67k
         ZmNA==
X-Forwarded-Encrypted: i=1; AKwUvBwBdiGrcwiY7+SY+M5hrHH2Z+rVp/vzsCuKbx8SdgcPvxhLyhWHo+zUopX55I8ku3n09PPX95G+k57sWQ05@lists.infradead.org
X-Gm-Message-State: AFq9FYLqgR3m8S8gJD5NSRuy/vzJZToe6HBOAjK2gozFAZE7WviUhfZI
	Gmkng7R9v9b1svwZqcd4KTdeyuzv8gEAAHGAycPGzLxodS6Q5rfL/mjd
X-Gm-Gg: AYBFou0ScALVS6wqq6a3E4M+r/OugJrlZkWWZm+xkEhRHd1S1OhY7/mEORQ/Gf6bMvb
	LwdG+PzDBySsgYn3QBiXIHsZWqtQrSIArtxYUR36oIlwP5EoJtFn2zJo/lGYuo/I/bb7PdEC+aq
	eiDxjZRShnaOfoXaSoi1xC/8UMvGH2VyZMytEcbQrIyQjHISNuDYjHICRkbURU/wFAtxRVvv1SG
	iqqszKugn+H0gqS0gTDHcnaFecIYk9c+HQWFG/y4qlwkjO7qeauf2Sf/I5Gj4AikrMqYjipSFxI
	rFckd3o+KWaKHvCnrlVblqN2Q1SWtXtrmt9JPOaktgpUxhPTbeR3BJch+rVEZCVIkMtYvQoEIAS
	cs7Z1CfWv+A+aviEOx+XRLcj5hVW06J0ZJHJuApU7kBZ7Kw27YWyAsx0o+zGFZ7yTfPWj2G4H4e
	57T6ysVSyP31um7OgOdhLFzmaYg7Q5b29rR+HvGEMVJUIMgQx5SVCzfoI8JjS9F+yZwh7dr6SPI
	aMGx6hernnqU6gJ1E7vWBPWCkFSzUy5ZlcZb+iVUE0z0kWqlPrFlk3cE3br09Jo8QlETBGwbaZ9
	f9YP8QetiQ==
X-Received: by 2002:a05:600c:4e12:b0:4a1:702f:c736 with SMTP id 5b1f17b1804b1-4a35ac3f7bdmr182539685e9.3.1793096547086;
        Tue, 27 Oct 2026 03:22:27 -0700 (PDT)
Received: from smtpclient.apple ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd4be6sm20023565f8f.37.2026.10.27.03.22.22
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Oct 2026 03:22:25 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.700.51.1.3\))
Subject: Re: [PATCH 4/4] cpufreq: add an Amlogic speed-bin driver
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <9556e959-daf3-4c85-8794-9613e7e7a9ae@gmail.com>
Date: Tue, 27 Oct 2026 14:22:09 +0400
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>,
 christian.koever-draxl@student.uibk.ac.at,
 neil.armstrong@linaro.org,
 sboyd@kernel.org,
 bmasney+clk@redhat.com,
 khilman@baylibre.com,
 martin.blumenstingl@googlemail.com,
 rafael@kernel.org,
 robh@kernel.org,
 krzk+dt@kernel.org,
 conor+dt@kernel.org,
 linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org,
 =?utf-8?Q?Christian_Stefan_K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Message-Id: <A45EC676-5B14-4932-A4CF-87ED3B71108D@gmail.com>
References: <20261025192219.209137-1-christian.koever-draxl@student.uibk.ac.at>
 <20261025192219.209137-5-christian.koever-draxl@student.uibk.ac.at>
 <at7lXEqds7ukoR2V@vireshk-B250M-D3H>
 <1jbj8gkff1.fsf@starbuckisacylon.baylibre.com>
 <at8WfX_G0tfTlFrm@vireshk-B250M-D3H>
 <9556e959-daf3-4c85-8794-9613e7e7a9ae@gmail.com>
To: Chuan Liu <chuan.liu686@gmail.com>
X-Mailer: Apple Mail (2.3864.700.51.1.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_032229_798066_83D394C9 
X-CRM114-Status: GOOD (  21.34  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

PiBPbiAyNyBPY3QgMjAyNiwgYXQgMToyNuKAr3BtLCBDaHVhbiBMaXUgPGNodWFuLmxpdTY4NkBn
bWFpbC5jb20+IHdyb3RlOgo+IAo+IEhpIFZpcmVzaCwgQ2hyaXN0aWFuLAo+ICAgIENvdWxkIHlv
dSBwbGVhc2UgaG9sZCBvZmYgZm9yIG5vdyBvbiB0aGUgcGF0Y2hlcyBhZGRpbmcgY3B1ZnJlcSBk
cml2ZXIgc3VwcG9ydCBvbiBTND8gVGhlcmUgYXJlIHN0aWxsIHR3byBpc3N1ZXMgdGhhdCBuZWVk
IHRvIGJlIHJlc29sdmVkIGZpcnN0Ogo+ICAtIFRoZSBjbG9jayBkcml2ZXIgY3VycmVudGx5IGRv
ZXMgbm90IHN1cHBvcnQgc2V0dGluZyB0aGUgQ1BVIGNsb2NrLgo+ICAtIFRoZSBDUFUgcmVndWxh
dG9yIG5lZWRzIHNvbWUgdGltZSB0byBzdGFiaWxpemUgYWZ0ZXIgdGhlIHZvbHRhZ2UgaXMgY2hh
bmdlZC4gV2l0aG91dCBhIHByb3BlciBkZWxheSwgdGhlIENQVSBjbG9jayBmcmVxdWVuY3kgbWF5
IGJlIHJhaXNlZCBiZWZvcmUgdGhlIHJlZ3VsYXRvciB2b2x0YWdlIGhhcyBhY3R1YWxseSByZWFj
aGVkIHRoZSB0YXJnZXQgdmFsdWUsIHdoaWNoIGNhbiBoYW5nIHRoZSBzeXN0ZW0uIFRoZSBTNCBD
UFUgcmVndWxhdG9yIGhhbmRsaW5nIGN1cnJlbnRseSBsYWNrcyB0aGUgbG9naWMgdG8gd2FpdCBm
b3IgdGhlIHJlZ3VsYXRvciB2b2x0YWdlIHRvIHNldHRsZSwgc28gdGhpcyBwYXJ0IG5lZWRzIHRv
IGJlIGNvbXBsZXRlZCBmaXJzdC4KPiAKPiBXZSBhcmUgY3VycmVudGx5IHdvcmtpbmcgb24gc3Vi
bWl0dGluZyBvdXIgb3duIGNwdWZyZXEgZHJpdmVyLiBXZSBhcmUgY29uc2lkZXJpbmcgaG93IHRv
IGFkZHJlc3MgdGhlIGlzc3VlcyBhYm92ZSwgdGFraW5nIGludG8gYWNjb3VudCB0aGUgaGFyZHdh
cmUgY2hhcmFjdGVyaXN0aWNzIG9mIHByZXZpb3VzIFNvQ3MgYW5kIGV2YWx1YXRpbmcgZmFjdG9y
cyBzdWNoIGFzIHRoZSB0cmFuc2l0aW9uIGxhdGVuY3kuIFM0IHdpbGwgYmUgY292ZXJlZCBieSB0
aGF0IHdvcmsgKGFzIHdlbGwgYXMgU29DcyBmcm9tIFM0IG9ud2FyZCwgc3VjaCBhcyBDMywgVDcs
IC4uLiwgQTkpLiBTbyBwbGVhc2UgZ2l2ZSB1cyBzb21lIHRpbWUuCgpQbGVhc2UgZG9u4oCZdCB0
b3AtcG9zdCwga2VlcCBpbmxpbmUgdGhyZWFkaW5nIQoKRldJVywgdGhlIHJlY2VudCBiaW5kaW5n
cy9jbG9jay9kcml2ZXIgd29yayBJ4oCZdmUgZG9uZSBmb3IgUzQgaXMgaGVyZToKCmh0dHBzOi8v
Z2l0aHViLmNvbS9jaGV3aXR0L2xpbnV4L2NvbW1pdHMvYW1sb2dpYy03LjMueQoKTXkgc3BlZWQt
YmluIGRyaXZlciBpcyBiYXNlZCBvbiBlYXJsaWVyIHdvcmsgZnJvbSBNYXJ0aW4gQmx1bWVuc3Rp
bmdsOgoKaHR0cHM6Ly9naXRodWIuY29tL2NoZXdpdHQvbGludXgvY29tbWl0Lzc3ZTEyZDRkNTg0
ZDZhOGJiZDkzMzA0YmJkNGU5YmJiYjZlZTE1OWEKClNldHRpbmcgYSByYW1wLWRlbGF5IHdhcyB0
aGUga2V5IHRvIG9wcCB0cmFuc2l0aW9uIHN0YWJpbGl0eToKCmh0dHBzOi8vZ2l0aHViLmNvbS9j
aGV3aXR0L2xpbnV4L2NvbW1pdC9jYTdhOTllODZlMjM2NzdjN2I1YWY4ODdlNmYzYjNjOGNlMzQ3
MGQyCgpDSC4KYWxzbyBhIENocmlzdGlhbiwgdG8gY29uZnVzZSBwZW9wbGUgOikKCj4gT24gMTAv
MjYvMjAyNiA0OjU5IFBNLCBWaXJlc2ggS3VtYXIgd3JvdGU6Cj4+IE9uIDI2LTEwLTI2LCAwOTo1
NywgSmVyb21lIEJydW5ldCB3cm90ZToKPj4+IE9uIGx1bi4gMjYgb2N0LiAyMDI2IGF0IDExOjAw
LCBWaXJlc2ggS3VtYXIgPHZpcmVzaC5rdW1hckBsaW5hcm8ub3JnPiB3cm90ZToKPj4+IAo+Pj4+
IE9uIDI1LTEwLTI2LCAyMDoyMiwgY2hyaXN0aWFuLmtvZXZlci1kcmF4bEBzdHVkZW50LnVpYmsu
YWMuYXQgd3JvdGU6Cj4+Pj4+IEZyb206IENocmlzdGlhbiBTdGVmYW4gS8O2dsOpci1EcmF4bCA8
Y2tvZXZlckBvdXRsb29rLmRlPgo+Pj4+PiAKPj4+Pj4gRXZlcnkgUzQgc3BlZWQgYmluIHJ1bnMg
dGhlIHNhbWUgQ1BVIGZyZXF1ZW5jaWVzIGJ1dCBuZWVkcyBpdHMgb3duCj4+Pj4+IHZvbHRhZ2Ug
Y3VydmUsIGFuZCB0aGUgYmluIGNhbiBvbmx5IGJlIHJlYWQgdGhyb3VnaCB0aGUgc2VjdXJlIG1v
bml0b3IuCj4+Pj4+IAo+Pj4+PiBSZWFkIHRoZSBiaW4gZnJvbSB0aGUgZmlybXdhcmUsIHNlbGVj
dCB0aGUgbWF0Y2hpbmcKPj4+Pj4gIm9wcC1taWNyb3ZvbHQtc3BlZWQ8YmluPiIgcHJvcGVydHkg
Zm9yIGFsbCBDUFVzLCB0aGVuIHJlZ2lzdGVyCj4+Pj4+IGNwdWZyZXEtZHQuIEJpbnMgb3V0c2lk
ZSB0aGUga25vd24gcmFuZ2UgZmFsbCBiYWNrIHRvIGJpbiAwLCB3aGljaAo+Pj4+PiBoYXMgdGhl
IGhpZ2hlc3Qgdm9sdGFnZXMuIExpa2Ugc3VuNTBpLWNwdWZyZXEtbnZtZW0sIHRoZSBkcml2ZXIg
YmluZHMKPj4+Pj4gb24gdGhlIFNvQyBjb21wYXRpYmxlIGFuZCBuZWVkcyBubyBub2RlIG9mIGl0
cyBvd24sIGFuZCBTNCBpcyBhZGRlZCB0bwo+Pj4+PiB0aGUgY3B1ZnJlcS1kdC1wbGF0ZGV2IGJs
b2NrbGlzdCBzbyBjcHVmcmVxLWR0IGlzIG9ubHkgY3JlYXRlZCBhZnRlcgo+Pj4+PiB0aGUgYmlu
IGhhcyBiZWVuIGFwcGxpZWQuCj4+Pj4+IAo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4g
U3RlZmFuIEvDtnbDqXItRHJheGwgPGNrb2V2ZXJAb3V0bG9vay5kZT4KPj4+Pj4gLS0tCj4+Pj4+
ICBNQUlOVEFJTkVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDEgKwo+Pj4+PiAgZHJp
dmVycy9jcHVmcmVxL0tjb25maWcuYXJtICAgICAgICAgIHwgIDE0ICsrCj4+Pj4+ICBkcml2ZXJz
L2NwdWZyZXEvTWFrZWZpbGUgICAgICAgICAgICAgfCAgIDEgKwo+Pj4+PiAgZHJpdmVycy9jcHVm
cmVxL2FtbG9naWMtY3B1ZnJlcS5jICAgIHwgMTg0ICsrKysrKysrKysrKysrKysrKysrKysrKysr
Kwo+Pj4+PiAgZHJpdmVycy9jcHVmcmVxL2NwdWZyZXEtZHQtcGxhdGRldi5jIHwgICAyICsKPj4+
Pj4gIDUgZmlsZXMgY2hhbmdlZCwgMjAyIGluc2VydGlvbnMoKykKPj4+Pj4gIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBkcml2ZXJzL2NwdWZyZXEvYW1sb2dpYy1jcHVmcmVxLmMKPj4+PiAKPj4+PiBJcyBp
dCBzYWZlIHRvIGFwcGx5IGp1c3QgdGhpcyBvbmUgPyBJIGNhbiB0YWtlIHRoaXMgdmlhIHRoZSBQ
TSB0cmVlIHRoZW4uCj4+PiAKPj4+IEkgd291bGQgYWR2aXNlIHRvIHdhaXQgYSBsaXR0bGUgZm9y
IEFtbG9naWMgdG8gY2hpbWUgaW4uCj4+IFN1cmUsIEkgd2Fzbid0IGdvaW5nIHRvIHdhaXQgZm9y
IHRoZSBtYWludGFpbmVycyB0byByZXNwb25kIGFueXdheS4KPiAKPiAtLSAKPiBCZXN0IHJlZ2Fy
ZHMsCj4gQ2h1YW4KPiAKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwo+IGxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0Cj4gbGludXgtYW1sb2dpY0Bs
aXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1hbWxvZ2ljCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LWFtbG9naWMK
