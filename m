Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031EE606A327
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Oct 2026 08:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hnSW7ZtH;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=aXiMSi7I
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=31G2d5GSaZEswkGJYopR/pdZTLMOOG9iH3JMmrGXsVQ=; b=hnSW7ZtHENlxSkBOWUnh0WKFSs
	tYfHigw1l+QgY5b4Oix8WZUe0ZrBaTRzVwSvcaYnWTNkIb3UV/cRigCc9e1rTyibotqerXMkeHPoF
	dTzmlXzPiKKaXE9R6qlS8dybHo5UrOIJdKZe8qivhRlkLuVIatZRpAXB9XvQ4fDzrhPD1OfcEwobY
	h2PXA5yKpfmEk1u5B37xLeJU8HshqolQX3w9l93iMnq6wD5ouwXbQqe0u2XaOh6AG2Z9If7yAM4l4
	JRH5YQdtN82DHxhzqwYXWxLvQTCNiqMm5owTOV/jL5lhwYPldu8m3tk7oXbu+tXABU8smsU0zLyPs
	AoI/Jo1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLG7x-00000001xLn-0y4R;
	Mon, 26 Oct 2026 08:32:21 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLG7t-00000001xKW-2xkA
	for linux-amlogic@lists.infradead.org;
	Mon, 26 Oct 2026 08:32:19 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-48df54150dfso1412728f8f.0
        for <linux-amlogic@lists.infradead.org>; Mon, 26 Oct 2026 01:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793003535; x=1793608335; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FTBCK/49FHYyjT64MBODQZDYUzxg0z0ieIJxPQn3hTo=;
        b=aXiMSi7I6QCdmHa2+gj60QU+xPc+njNgrEqIqBubKF+eq2f+doRmmm97UoXwS9ZsYS
         XKcUf/xtiAZD1pbTG9mBRNommFUh54aabqgcU5tpnvkJCptkJZp9nVVVo5yeKBZ7dKRU
         F7OqXx9gRM2yS4PgUrjVUEDfmhvq+h7Cg1V+o3gQIXCSkQpXLq1mYyPi/xPouYbgqWcw
         ktdO751XMFWDztuFzcRnkWl6VeNi/QZpywHEcRTHGDHb6z7zfNAUCy3MNghLj2ISdB0Y
         LmzUCstHGVNnQu5ooLmfCkJWQWiGszJT4gyMrF0+RdckMALPI5v80l6d/LbngRCqcTMk
         YxuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793003535; x=1793608335;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FTBCK/49FHYyjT64MBODQZDYUzxg0z0ieIJxPQn3hTo=;
        b=BBkTrHukIVmWCLcix0p28gQEp4Ul2dQCFScHLvRfSE0xzAEgBemO5u/CbyLVdLIKMB
         7YLLdb0lqcvxTpjgPR+2QZuPQk4f7GJNk8AWN2XoPmkCdwZDSThUu/096+AI1OoJ4w95
         1EzOWdU2D+0v8pdS6ExG/SjBhQ6yAQaiNjW6R2GK0BrQnv3qwduaasNWs5Nm7w9Ghk+v
         Vc611ovjTCEZBnkODA2SypGd1nXvfpKmqtAd3GEtSF31ePBU0YHplJv5+wZ4+ud6H6n8
         mtHSgYCZuWpc1QQMj4gkJRXXATyw88bniWgLJ8ZgYq0CMpB9oa5q7JGrNAxjv8EO+hfw
         uzJQ==
X-Gm-Message-State: AFq9FYLms0n2KsRHjsbZMB/2i8d/E3UvdjBjasvL60ROse18R2A1S1VA
	SkYpYSnFMC1uUNsTIpOfkeegejfFce8HjmbsNbukS42dAWU/OGHGUF0ln7g3e/PKm5I=
X-Gm-Gg: AYBFou0Dqq7mKKuNzm9ZRnb8UNB8lFEJ9ZxKQxI+KLFmNXD+xYoL/6E5saFEZJvMuqa
	U4gKGjvno2zjmiMvKhSbw648YrWm4FRlkybr0BDCdnvEIdlEj3xLgARQ5lO3aObInEjmqvjKn05
	FdWyeNQzenAPnqXHjbX4vXhGb229ATBkyjc6t2B1vAhLmW2oPcOFwePgYCmLy/xyBGZ2Rx4IqXK
	QO2fq58HQfYd34JhhRZgPuZK12wXMUTY+fshPAkR0k2TCQsPmVo4uZ6CSGUwmjL96ZcGoaNn6ct
	W3Q+xzsgjzx+jzkKgPELza5sWZpivMZWzQ62nIJfolx15o4x2sUU9oRwa7wnLlOr5baPm915eK2
	LdOHpEnjeixD3YQ+1qeUmPbauwxJ257bor2VSuoXNwrpjD5/tEHCXXwLQV/ThHgK0aVTDb98207
	nGbLbYNh41EBAYklGL6JZT8hLZd0BQyQNxjmTGHEMZsjFZ/J62ST+uLaR5A2t5SKwkSlq4KbXXJ
	zZ8VELsm1qLqG1x6pMBp58n7MMlE3l+l13T8f3cXVZUoSKNvdnhexdqdwCllq8h9rrhOZvmqz+C
	0/z/KghPgu23CNTgr5vq
X-Received: by 2002:a5d:4fd0:0:b0:48a:f59f:8b70 with SMTP id ffacd0b85a97d-48e3eb9fc55mr7018739f8f.46.1793003535324;
        Mon, 26 Oct 2026 01:32:15 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3a1csm15026669f8f.16.2026.10.26.01.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 01:32:14 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: christian.koever-draxl@student.uibk.ac.at, neil.armstrong@linaro.org,
 sboyd@kernel.org, bmasney+clk@redhat.com, khilman@baylibre.com,
 martin.blumenstingl@googlemail.com, yu.tu@amlogic.com
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Christian Stefan =?utf-8?B?S8O2dsOpci1EcmF4bA==?= <ckoever@outlook.de>
Subject: Re: [PATCH 1/2] clk: meson: s4: keep the PWM clocks off vid_pll
In-Reply-To: <20261025191852.208226-2-christian.koever-draxl@student.uibk.ac.at>
References: <20261025191852.208226-1-christian.koever-draxl@student.uibk.ac.at>
 <20261025191852.208226-2-christian.koever-draxl@student.uibk.ac.at>
Date: Mon, 26 Oct 2026 09:32:13 +0100
Message-ID: <1jpkwwkgky.fsf@starbuckisacylon.baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_013217_784724_97EBF500 
X-CRM114-Status: GOOD (  26.41  )
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
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gZGltLiAyNSBvY3QuIDIwMjYgYXQgMjA6MTgsIGNocmlzdGlhbi5rb2V2ZXItZHJheGxAc3R1
ZGVudC51aWJrLmFjLmF0IHdyb3RlOgoKPiBGcm9tOiBDaHJpc3RpYW4gU3RlZmFuIEvDtnbDqXIt
RHJheGwgPGNrb2V2ZXJAb3V0bG9vay5kZT4KPgo+IFRoZSBQV00gZHJpdmVyIGFza3MgdGhlIGNs
b2NrIGZyYW1ld29yayBmb3IgdGhlIGZhc3Rlc3QgaW5wdXQgaXQgY2FuCj4gZ2V0IChjbGtfcm91
bmRfcmF0ZSgpIHdpdGggcm91Z2hseSAweGZmZmYvcGVyaW9kKSwgc28gb24gUzQgZXZlcnkgUFdN
Cj4gY2hhbm5lbCBlbmRzIHVwIHBhcmVudGVkIHRvIHZpZF9wbGwsIHRoZSBmYXN0ZXN0IGlucHV0
IG9mIHRoZSBQV00gbXV4Lgo+IHZpZF9wbGwgaXMgZGVyaXZlZCBmcm9tIHRoZSBIRE1JIFBMTCBh
bmQgaXMgcmVwcm9ncmFtbWVkIG9uIGV2ZXJ5Cj4gZGlzcGxheSBtb2RlIHNldCwgd2hpY2ggc2ls
ZW50bHkgY2hhbmdlcyB0aGUgcGVyaW9kIGFuZCBkdXR5IGN5Y2xlIG9mCj4gd2hhdGV2ZXIgUFdN
IHJ1bnMgZnJvbSBpdC4KCldoaWxlIEkgYWdyZWUgd2l0aCB0aGUgZ2VuZXJhbCBwcmluY2lwbGUg
b2YgdGhlIGNoYW5nZSwKIlRoZSBQV00gZHJpdmVyIGFza3MgdGhlIGNsb2NrIGZyYW1ld29yayBm
b3IgdGhlIGZhc3Rlc3QgaW5wdXQiIGlzIGEKZmFpcmx5IGluYWNjdXJhdGUgcmVwcmVzZW50YXRp
b24gb2Ygd2hhdCB0aGUgUFdNIGRyaXZlciBkb2VzIGFuZCBpdCBnZXRzCnJlcGVhdGVkLiBQbGVh
c2UgZml4IHRoaXMuCgpZb3UndmUgZGlzY2xvc2UgdGhlIHVzYWdlIEFJLCBpdCBpcyBncmVhdC4g
SXQgd291bGQgYmUgZXZlbiBiZXR0ZXIgaWYKeW91IGNvdWxkIHN1bW1hcml6ZSBpdHMgb3V0cHV0
IGEgbGl0dGxlIGJpdC4gVGhpcyBpcyB2ZXJ5IHZlcmJvc2UKZm9yIGEgc2ltcGxlIHByb2JsZW06
IHZpZF9wbGwgaXMgZGVkaWNhdGVkIHRvIGFub3RoZXIgdXNhZ2UgaW4gZ2VuZXJhbAphbmQgc2hv
dWxkIGFjdHVhbGx5IG5vdCBiZSBwcm92aWRlZCB0byBQV00gZGV2aWNlcywgZXZlbnRob3VnaCB0
aGUgSFcKYWxsb3dzIGl0Cgo+Cj4gT24gYm9hcmRzIHRoYXQgdXNlIGEgUFdNIHJlZ3VsYXRvciBm
b3IgdGhlIENQVSBzdXBwbHkgdGhpcyBjb3JydXB0cwo+IHRoZSBDUFUgdm9sdGFnZTogb24gYW4g
UzkwNVcyIGJvYXJkIHZkZGNwdSByZWFkIDY5OSBtViBhdCAxIEdIeiBhbmQKPiB0aGUgZmlyc3Qg
Y3B1ZnJlcSB0cmFuc2l0aW9uIGh1bmcgdGhlIFNvQy4gQm9hcmRzIHRoYXQgZmVlZCB0aGUKPiAz
Mi43Njgga0h6IGxvdyBwb3dlciBjbG9jayBvZiBhbiBTRElPIHdpZmkgY2hpcCBmcm9tIGEgUFdN
IHNlZSB0aGUgY2hpcAo+IGludGVybWl0dGVudGx5IGZhaWwgdG8gZW51bWVyYXRlICgiRmFpbGVk
IHRvIGluaXRpYWxpemUgYQo+IG5vbi1yZW1vdmFibGUgY2FyZCIpLgo+Cj4gRHJvcCB2aWRfcGxs
IGZyb20gdGhlIFBXTSBwYXJlbnRzIGFuZCBrZWVwIHRoZSByZW1haW5pbmcgaW5wdXRzIG9uCj4g
dGhlaXIgcmVnaXN0ZXIgdmFsdWVzIHdpdGggYSBtdXggdGFibGUuIHh0YWwsIGZjbGtfZGl2NCBh
bmQgZmNsa19kaXYzCj4gY292ZXIgZXZlcnkgUFdNIHJhdGUgaW4gdXNlLgo+Cj4gRml4ZXM6IDU3
YjU1Yzc2YWFmMSAoImNsazogbWVzb246IFM0OiBhZGQgc3VwcG9ydCBmb3IgQW1sb2dpYyBTNCBT
b0MgcGVyaXBoZXJhbCBjbG9jayBjb250cm9sbGVyIikKPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3Rp
YW4gU3RlZmFuIEvDtnbDqXItRHJheGwgPGNrb2V2ZXJAb3V0bG9vay5kZT4KPiAtLS0KPiAgZHJp
dmVycy9jbGsvbWVzb24vczQtcGVyaXBoZXJhbHMuYyB8IDM4ICsrKysrKysrKysrKysrKysrKysr
LS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRp
b25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsvbWVzb24vczQtcGVyaXBoZXJhbHMu
YyBiL2RyaXZlcnMvY2xrL21lc29uL3M0LXBlcmlwaGVyYWxzLmMKPiBpbmRleCBiYTQxZmNkOTA1
ODguLjMyOWNkNTI2NzQ5ZSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2Nsay9tZXNvbi9zNC1wZXJp
cGhlcmFscy5jCj4gKysrIGIvZHJpdmVycy9jbGsvbWVzb24vczQtcGVyaXBoZXJhbHMuYwo+IEBA
IC0yNTg4LDUxICsyNTg4LDY1IEBAIHN0YXRpYyBzdHJ1Y3QgY2xrX3JlZ21hcCBzNF9zcGljYzBf
ZW4gPSB7Cj4gIAl9LAo+ICB9Owo+ICAKPiAtLyogUFdNIENsb2NrICovCj4gKy8qCj4gKyAqIFBX
TSBDbG9jawo+ICsgKgo+ICsgKiB2aWRfcGxsIChtdXggaW5wdXQgMSkgaXMgbGVmdCBvdXQgb24g
cHVycG9zZS4gVGhlIFBXTSBkcml2ZXIgYXNrcyBmb3IgdGhlCj4gKyAqIGZhc3Rlc3QgY2xvY2sg
aXQgY2FuIGdldCwgd2hpY2ggbWFkZSBldmVyeSBQV00gcGljayB2aWRfcGxsIC0gYW5kIHZpZF9w
bGwKPiArICogaXMgdGhlIEhETUkgUExMLCByZXByb2dyYW1tZWQgb24gZXZlcnkgZGlzcGxheSBt
b2RlIHNldC4gVGhhdCBzaWxlbnRseQo+ICsgKiBjaGFuZ2VkIHRoZSBwZXJpb2QgYW5kIGR1dHkg
b2Ygd2hhdGV2ZXIgcmFuIGZyb20gaXQ6IHRoZSBQV00gQ1BVIHN1cHBseQo+ICsgKiAoYSBjcHVm
cmVxIHZvbHRhZ2UgY2hhbmdlIHRoZW4gaHVuZyB0aGUgU29DKSBhbmQgdGhlIDMyLjc2OGtIeiBj
bG9jayBvZiBhbgo+ICsgKiBTRElPIHdpZmkgY2hpcCAod2hpY2ggdGhlbiBmYWlsZWQgdG8gZW51
bWVyYXRlKS4KPiArICovCj4gK3N0YXRpYyB1MzIgczRfcHdtX3BhcmVudHNfdGFibGVbXSA9IHsg
MCwgMiwgMyB9Owo+ICsKPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBjbGtfcGFyZW50X2RhdGEgczRf
cHdtX3BhcmVudHNbXSA9IHsKPiAgCXsgLmZ3X25hbWUgPSAieHRhbCIsIH0sCj4gLQl7IC5odyA9
ICZzNF92aWRfcGxsLmh3IH0sCj4gIAl7IC5md19uYW1lID0gImZjbGtfZGl2NCIsIH0sCj4gIAl7
IC5md19uYW1lID0gImZjbGtfZGl2MyIsIH0sCj4gIH07Cj4gIAo+IC1zdGF0aWMgUzRfQ09NUF9T
RUwocHdtX2EsIENMS0NUUkxfUFdNX0NMS19BQl9DVFJMLCA5LCAweDMsIHM0X3B3bV9wYXJlbnRz
KTsKPiArI2RlZmluZSBTNF9QV01fU0VMKF9uYW1lLCBfcmVnLCBfc2hpZnQpIFwKPiArCU1FU09O
X0NPTVBfU0VMKHM0XywgX25hbWUsIF9yZWcsIF9zaGlmdCwgMHgzLCBzNF9wd21fcGFyZW50cywg
XAo+ICsJCSAgICAgICBzNF9wd21fcGFyZW50c190YWJsZSwgMCwgMCkKPiArCj4gK3N0YXRpYyBT
NF9QV01fU0VMKHB3bV9hLCBDTEtDVFJMX1BXTV9DTEtfQUJfQ1RSTCwgOSk7Cj4gIHN0YXRpYyBT
NF9DT01QX0RJVihwd21fYSwgQ0xLQ1RSTF9QV01fQ0xLX0FCX0NUUkwsIDAsIDgpOwo+ICBzdGF0
aWMgUzRfQ09NUF9HQVRFKHB3bV9hLCBDTEtDVFJMX1BXTV9DTEtfQUJfQ1RSTCwgOCk7Cj4gIAo+
IC1zdGF0aWMgUzRfQ09NUF9TRUwocHdtX2IsIENMS0NUUkxfUFdNX0NMS19BQl9DVFJMLCAyNSwg
MHgzLCBzNF9wd21fcGFyZW50cyk7Cj4gK3N0YXRpYyBTNF9QV01fU0VMKHB3bV9iLCBDTEtDVFJM
X1BXTV9DTEtfQUJfQ1RSTCwgMjUpOwo+ICBzdGF0aWMgUzRfQ09NUF9ESVYocHdtX2IsIENMS0NU
UkxfUFdNX0NMS19BQl9DVFJMLCAxNiwgOCk7Cj4gIHN0YXRpYyBTNF9DT01QX0dBVEUocHdtX2Is
IENMS0NUUkxfUFdNX0NMS19BQl9DVFJMLCAyNCk7Cj4gIAo+IC1zdGF0aWMgUzRfQ09NUF9TRUwo
cHdtX2MsIENMS0NUUkxfUFdNX0NMS19DRF9DVFJMLCA5LCAweDMsIHM0X3B3bV9wYXJlbnRzKTsK
PiArc3RhdGljIFM0X1BXTV9TRUwocHdtX2MsIENMS0NUUkxfUFdNX0NMS19DRF9DVFJMLCA5KTsK
PiAgc3RhdGljIFM0X0NPTVBfRElWKHB3bV9jLCBDTEtDVFJMX1BXTV9DTEtfQ0RfQ1RSTCwgMCwg
OCk7Cj4gIHN0YXRpYyBTNF9DT01QX0dBVEUocHdtX2MsIENMS0NUUkxfUFdNX0NMS19DRF9DVFJM
LCA4KTsKPiAgCj4gLXN0YXRpYyBTNF9DT01QX1NFTChwd21fZCwgQ0xLQ1RSTF9QV01fQ0xLX0NE
X0NUUkwsIDI1LCAweDMsIHM0X3B3bV9wYXJlbnRzKTsKPiArc3RhdGljIFM0X1BXTV9TRUwocHdt
X2QsIENMS0NUUkxfUFdNX0NMS19DRF9DVFJMLCAyNSk7Cj4gIHN0YXRpYyBTNF9DT01QX0RJVihw
d21fZCwgQ0xLQ1RSTF9QV01fQ0xLX0NEX0NUUkwsIDE2LCA4KTsKPiAgc3RhdGljIFM0X0NPTVBf
R0FURShwd21fZCwgQ0xLQ1RSTF9QV01fQ0xLX0NEX0NUUkwsIDI0KTsKPiAgCj4gLXN0YXRpYyBT
NF9DT01QX1NFTChwd21fZSwgQ0xLQ1RSTF9QV01fQ0xLX0VGX0NUUkwsIDksIDB4MywgczRfcHdt
X3BhcmVudHMpOwo+ICtzdGF0aWMgUzRfUFdNX1NFTChwd21fZSwgQ0xLQ1RSTF9QV01fQ0xLX0VG
X0NUUkwsIDkpOwo+ICBzdGF0aWMgUzRfQ09NUF9ESVYocHdtX2UsIENMS0NUUkxfUFdNX0NMS19F
Rl9DVFJMLCAwLCA4KTsKPiAgc3RhdGljIFM0X0NPTVBfR0FURShwd21fZSwgQ0xLQ1RSTF9QV01f
Q0xLX0VGX0NUUkwsIDgpOwo+ICAKPiAtc3RhdGljIFM0X0NPTVBfU0VMKHB3bV9mLCBDTEtDVFJM
X1BXTV9DTEtfRUZfQ1RSTCwgMjUsIDB4MywgczRfcHdtX3BhcmVudHMpOwo+ICtzdGF0aWMgUzRf
UFdNX1NFTChwd21fZiwgQ0xLQ1RSTF9QV01fQ0xLX0VGX0NUUkwsIDI1KTsKPiAgc3RhdGljIFM0
X0NPTVBfRElWKHB3bV9mLCBDTEtDVFJMX1BXTV9DTEtfRUZfQ1RSTCwgMTYsIDgpOwo+ICBzdGF0
aWMgUzRfQ09NUF9HQVRFKHB3bV9mLCBDTEtDVFJMX1BXTV9DTEtfRUZfQ1RSTCwgMjQpOwo+ICAK
PiAtc3RhdGljIFM0X0NPTVBfU0VMKHB3bV9nLCBDTEtDVFJMX1BXTV9DTEtfR0hfQ1RSTCwgOSwg
MHgzLCBzNF9wd21fcGFyZW50cyk7Cj4gK3N0YXRpYyBTNF9QV01fU0VMKHB3bV9nLCBDTEtDVFJM
X1BXTV9DTEtfR0hfQ1RSTCwgOSk7Cj4gIHN0YXRpYyBTNF9DT01QX0RJVihwd21fZywgQ0xLQ1RS
TF9QV01fQ0xLX0dIX0NUUkwsIDAsIDgpOwo+ICBzdGF0aWMgUzRfQ09NUF9HQVRFKHB3bV9nLCBD
TEtDVFJMX1BXTV9DTEtfR0hfQ1RSTCwgOCk7Cj4gIAo+IC1zdGF0aWMgUzRfQ09NUF9TRUwocHdt
X2gsIENMS0NUUkxfUFdNX0NMS19HSF9DVFJMLCAyNSwgMHgzLCBzNF9wd21fcGFyZW50cyk7Cj4g
K3N0YXRpYyBTNF9QV01fU0VMKHB3bV9oLCBDTEtDVFJMX1BXTV9DTEtfR0hfQ1RSTCwgMjUpOwo+
ICBzdGF0aWMgUzRfQ09NUF9ESVYocHdtX2gsIENMS0NUUkxfUFdNX0NMS19HSF9DVFJMLCAxNiwg
OCk7Cj4gIHN0YXRpYyBTNF9DT01QX0dBVEUocHdtX2gsIENMS0NUUkxfUFdNX0NMS19HSF9DVFJM
LCAyNCk7Cj4gIAo+IC1zdGF0aWMgUzRfQ09NUF9TRUwocHdtX2ksIENMS0NUUkxfUFdNX0NMS19J
Sl9DVFJMLCA5LCAweDMsIHM0X3B3bV9wYXJlbnRzKTsKPiArc3RhdGljIFM0X1BXTV9TRUwocHdt
X2ksIENMS0NUUkxfUFdNX0NMS19JSl9DVFJMLCA5KTsKPiAgc3RhdGljIFM0X0NPTVBfRElWKHB3
bV9pLCBDTEtDVFJMX1BXTV9DTEtfSUpfQ1RSTCwgMCwgOCk7Cj4gIHN0YXRpYyBTNF9DT01QX0dB
VEUocHdtX2ksIENMS0NUUkxfUFdNX0NMS19JSl9DVFJMLCA4KTsKPiAgCj4gLXN0YXRpYyBTNF9D
T01QX1NFTChwd21faiwgQ0xLQ1RSTF9QV01fQ0xLX0lKX0NUUkwsIDI1LCAweDMsIHM0X3B3bV9w
YXJlbnRzKTsKPiArc3RhdGljIFM0X1BXTV9TRUwocHdtX2osIENMS0NUUkxfUFdNX0NMS19JSl9D
VFJMLCAyNSk7Cj4gIHN0YXRpYyBTNF9DT01QX0RJVihwd21faiwgQ0xLQ1RSTF9QV01fQ0xLX0lK
X0NUUkwsIDE2LCA4KTsKPiAgc3RhdGljIFM0X0NPTVBfR0FURShwd21faiwgQ0xLQ1RSTF9QV01f
Q0xLX0lKX0NUUkwsIDI0KTsKPiAgCj4gLS0gCj4gMi41Ni4wCj4KCi0tIApKZXJvbWUKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMg
bWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
