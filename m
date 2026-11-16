Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B071606A32C
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Nov 2026 16:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CFP0gwNS;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=V/14gUF1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=JoUU/Dkl6ZeVeJw88SSYAF0/3M1AhcTBaMFU30AOQbk=; b=CFP0gwNSHZ5P5neIrEgbMKn+Zt
	9QWXQHqVEPedJ8doFZAljo83tVIynD7T/5rHNkyL7VydwM2edADlFZ55AKdLV+CboQMfQsqouedRX
	r2I5w1LAqh9nn6OGpimM5N+L6WBp2bhmZ5MC53rCr4Wd3vxfWJbHwN2kJYA+rQRCw6IoPcbvUx0GR
	N2tTRFuLHKTew1cU+eyVGaGp76XWqHTSFr0df4pAFDRUlEzCQ7SjTNcQPdjjtHPj6cjkt25UP0M9b
	VFxxQ9q3JJkl2akVUA98/9fVb/c7zAk9N2ea7fRyFmIfJC83Z+t9s5831vSnbYseASFRrc4jIjwEk
	HQtdRODA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSzle-00000003Hmd-1tFy;
	Mon, 16 Nov 2026 16:41:18 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSzlZ-00000003Hld-2e5F
	for linux-amlogic@lists.infradead.org;
	Mon, 16 Nov 2026 16:41:16 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so22734545e9.3
        for <linux-amlogic@lists.infradead.org>; Mon, 16 Nov 2026 08:41:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794847271; x=1795452071; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YA4HSjIeB4gPYXT/wWzHI76b1JmPd/ZJtbNmLZ/Ltrg=;
        b=V/14gUF1S69qn4p3CWCFBLWzd+mk8OFfsH5eUi7WdEqgeoKzNERAlRrV6GhthV4d7m
         9PNWhapUNZJD0GJjVrFhdjnQqSV/7IQS8L7hseLVTh2Kx15CLLXsBJnoPKgN9l9By/QS
         aQ1fw5eik5iW+FcnBYR81oLW5IJihsBL9fs5Mx15jaTNlPMcTb/Eyy2J64qz17/9le3r
         dQyMJ/z2cFCq9B9M/snrPA2AnJNazLZ2Zpt5MnK8FOP3CzQwrp89Gns4oMz4aZ8Mz64K
         zSQrub8/o6LtSU83D52u9bz+aKk3bGnw4xgocn6OeA8kflImxEWaLRKgJmlQinrma+Z0
         vzfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794847271; x=1795452071;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YA4HSjIeB4gPYXT/wWzHI76b1JmPd/ZJtbNmLZ/Ltrg=;
        b=cphporqlJ3MFTpc7D8kbvu3IqIFC5NyAY3i5p1KA55nCLTNTmKWvgc2SbKUnq1OrQf
         QYbkndeGZ47tnVhJ1W0onQ180+rPXBdzGme11patWi/ym8tFd0fRiO3fON6d190gDLdz
         QlFPAP61fcLJ8yeX+lkq8hQhen+I+gqiaPFT/vy6VsxemCwTNsi3nCmuzYlEKA5JGTFj
         PUPpPHLmTjUXryWv8syj3VQ/6Q3wRJxEAw3BthKKQSecTcZMCDNPtGjstO/ik7RDI8+J
         AQCMcsFKFMKkUW2xrfDfsj878zdTRw/2xtuFsmWqtHDJsQJMd4v1O6CLG2C+vncEeCJA
         Zqhg==
X-Forwarded-Encrypted: i=1; AL+hErFw4AU/QSs9DbDH+5BQS/eQP79205dXV54jyVKna/v+6P11k8ww69JIwHyhQMXRAtqXS2RQnGPFAv/tgx9r@lists.infradead.org
X-Gm-Message-State: APuU4Z+C9bux9qR3e6UBL7Y4uHsKzvcz5sOVgmEjTjDg+EDmjDskSujD
	6GdhDmxMVOu2ah9ah406dS1dCZQrafyZmfGdR+0oTbLmBgPmQ7wQrG6j7xLTr36HCOI=
X-Gm-Gg: AYBFou2/iPxJg4WgSVGAKMYuGTZ8lXazkVO0Sf4x9JABwn8y7AiC7oev+ob9eb1KKjj
	GbyVI4mV81yMi1Gz9eATHP7/PQHxTbAycL/E7MwSKW7JeYe931prQcLSeKow7BTHMjMiEL2B/RW
	2zKN2VjcOozAHPdHGSy2U3xynbfhYAY96awbZqB8QpeYWoDHe2x5jcMEtyp5KsVg05y+Wdaj/3Q
	fiWNDtqcpq1ntX8FadqWyrPx+O1SfaHja2UOQot9j7cdbKAvupZMhxsOy27YQLg7CB+oQlohzb6
	vMmn5DhC+3EKdbhL5R/k7fzsahqG5WtP0GX3fAMQr08nVE8SIUsHVMKuqUmPsi8nku+ZH0fM9L4
	E3EVkIMHvq1sf1nnEEs/hxPTgEZrql1Vunh5VAQ+VLaoIn13Ucm1LAKejrgOf2IEYwNACFYh3H2
	OV1OSAVi3LQhDgtHHU9kWPF6TRQg0Xmm1JgGyh2XpvRzu01Ru+xfmbg7vv/2bZkG3iB92ZvtRw/
	PJp/o6evCkcLgo60mWzjopTMezf88sR8bXuoso0qZ3rCfR9RgvPoPxCJZwcnLL27fNfRSY9Ur7Y
	IMy2qCpLI2eYMAzNPrPWcs9F6k83IyqS
X-Received: by 2002:a05:600c:34d2:b0:4a1:fa27:df7c with SMTP id 5b1f17b1804b1-4bb55ac6cabmr228383715e9.34.1794847271206;
        Mon, 16 Nov 2026 08:41:11 -0800 (PST)
Received: from [192.168.3.100] ([151.61.248.197])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5720f6basm154341245e9.4.2026.11.16.08.41.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 08:41:10 -0800 (PST)
Message-ID: <34e02f23-1ace-4a13-9353-b73a1464a592@baylibre.com>
Date: Mon, 16 Nov 2026 17:41:09 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: meson: aiu-fifo: prevent sleeping when spinlock is
 held
Content-Language: en-US
To: Manuel Ebner <manuelebner@mailbox.org>
References: <20261111-aiu-fifo-fix-sleep-on-spinlock-v1-1-dc9ee401a7cf@baylibre.com>
 <0140bc0b3d1078bf8851340e0cb893b2907e146a.camel@mailbox.org>
From: Valerio Setti <vsetti@baylibre.com>
In-Reply-To: <0140bc0b3d1078bf8851340e0cb893b2907e146a.camel@mailbox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_084113_680560_1A866048 
X-CRM114-Status: GOOD (  25.23  )
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Liam Girdwood <lgirdwood@gmail.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Kevin Hilman <khilman@baylibre.com>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>, Mark Brown <broonie@kernel.org>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgTWFudWVsCgo+IEkgaGF2ZSByZWFkIHlvdXIgcGF0Y2ggYW5kIGhhdmUgYSBxdWVzdGlvbi4K
Wy4uLl0KPj4gQEAgLTQ4LDE0ICs0OSwyMiBAQCBzdGF0aWMgaW50IGFpdV9maWZvX2kyc190cmln
Z2VyKHN0cnVjdCBzbmRfcGNtX3N1YnN0cmVhbSAqc3Vic3RyZWFtLCBpbnQgY21kLAo+PiAgwqAJ
CQkJc3RydWN0IHNuZF9zb2NfZGFpICpkYWkpCj4+ICDCoHsKPj4gIMKgCXN0cnVjdCBzbmRfc29j
X2NvbXBvbmVudCAqY29tcG9uZW50ID0gZGFpLT5jb21wb25lbnQ7Cj4+ICsJdW5zaWduZWQgaW50
IHZhbDsKPiAKPiBIZXJlIGlzIHZhbC4KPiAKPj4gKwlpbnQgcmV0Owo+PiAgIAo+PiAgwqAJc3dp
dGNoIChjbWQpIHsKPj4gIMKgCWNhc2UgU05EUlZfUENNX1RSSUdHRVJfU1RBUlQ6Cj4+ICDCoAlj
YXNlIFNORFJWX1BDTV9UUklHR0VSX1JFU1VNRToKPj4gIMKgCWNhc2UgU05EUlZfUENNX1RSSUdH
RVJfUEFVU0VfUkVMRUFTRToKPj4gLQkJc25kX3NvY19jb21wb25lbnRfd3JpdGUoY29tcG9uZW50
LCBBSVVfUlNUX1NPRlQsCj4+IC0JCQkJCUFJVV9SU1RfU09GVF9JMlNfRkFTVCk7Cj4+IC0JCXNu
ZF9zb2NfY29tcG9uZW50X3JlYWQoY29tcG9uZW50LCBBSVVfSTJTX1NZTkMpOwo+PiArCQlyZXQg
PSByZWdtYXBfd3JpdGUoY29tcG9uZW50LT5yZWdtYXAsIEFJVV9SU1RfU09GVCwgQUlVX1JTVF9T
T0ZUX0kyU19GQVNUKTsKPj4gKwkJaWYgKHJldCA8IDApCj4+ICsJCQlyZXR1cm4gc25kX3NvY19y
ZXQoY29tcG9uZW50LT5kZXYsIHJldCwKPj4gKwkJCQkJwqDCoCAiRmFpbGVkIHRvIHdyaXRlIHJl
Z2lzdGVyIG9uIHRyaWdnZXIiKTsKPj4gKwo+PiArCQlyZXQgPSByZWdtYXBfcmVhZChjb21wb25l
bnQtPnJlZ21hcCwgQUlVX0kyU19TWU5DLCAmdmFsKTsKPiAKPiBTbyBhcyBJIHVuZGVyc3RhbmQg
dmFsLyZ2YWwgaXMganVzdCB0aGVyZSB0byBsaXN0ZW4gYW5kIGZvcmdldCB3aGF0IGdldHMgcmV0
dXJuZWQuCj4gVGhhdCdzIGtpbmRhIHdlaXJkLCBidXQgbm90IGFuIGlzc3VlLgoKV2VsbCwgSSB1
bmRlcnN0YW5kIHRoYXQgaXQgbWlnaHQgYmUgd2VpcmQgZnJvbSBhIHNvZnR3YXJlIHBvaW50IG9m
IHZpZXcsIApidXQgaXQgbWFrZXMgc2Vuc2UgZnJvbSB0aGUgaGFyZHdhcmUgb25lLiBBY2NvcmRp
bmcgdG8gdGhlIG1hbnVhbDoKCiAgICAgQSByZWFkIGZyb20gdGhpcyByZWdpc3RlciBpbmRpY2F0
ZXMgdGhhdCB0aGUgbmV4dCBzYW1wbGUgdG8gYmUKICAgICBzZW50IG91dCBvZiB0aGUgaW50ZXJm
YWNlIHNob3VsZCBnbyBpbnRvIHRoZSBsZWZ0IGNoYW5uZWwgb2YKICAgICB0aGUgZGFjLgo+PiBA
QCAtMzcsOCArMzgsMTEgQEAgc25kX3BjbV91ZnJhbWVzX3QgYWl1X2ZpZm9fcG9pbnRlcihzdHJ1
Y3Qgc25kX3NvY19jb21wb25lbnQgKmNvbXBvbmVudCwKPj4gIMKgCXN0cnVjdCBhaXVfZmlmbyAq
ZmlmbyA9IHNuZF9zb2NfZGFpX2RtYV9kYXRhX2dldF9wbGF5YmFjayhkYWkpOwo+PiAgwqAJc3Ry
dWN0IHNuZF9wY21fcnVudGltZSAqcnVudGltZSA9IHN1YnN0cmVhbS0+cnVudGltZTsKPj4gIMKg
CXVuc2lnbmVkIGludCBhZGRyOwo+IAo+IEhlcmUgaXQncyBhZGRyLiBJdCdzIG5vdCB5b3Vycywg
eW91IGp1c3Qga2VwdCBpdC4KPiAKPj4gKwlpbnQgcmV0Owo+PiAgIAo+PiAtCWFkZHIgPSBzbmRf
c29jX2NvbXBvbmVudF9yZWFkKGNvbXBvbmVudCwgZmlmby0+bWVtX29mZnNldCArIEFJVV9NRU1f
UkQpOwo+PiArCXJldCA9IHJlZ21hcF9yZWFkKGNvbXBvbmVudC0+cmVnbWFwLCBmaWZvLT5tZW1f
b2Zmc2V0ICsgQUlVX01FTV9SRCwgJmFkZHIpOwo+IAo+IFNpbWlsYXIgYXMgYWJvdmUuIEJ1dCB3
aHkgaXMgYWRkciBoZXJlIGFuZCB2YWwgYWJvdmU/IEkgdGhpbmsgaXQncyB0aGUgc2FtZSByb2xl
IGluIHJlZ21hcF9yZWFkKCkuCj4gV291bGQgaXQgbWFrZSBzZW5zZSB0byBuYW1lIGJvdGggdGhl
IHNhbWU/IElmIGl0IGRvZXMsIEknbSBpbiBmYXZvciBvZiB2YWwsIGJlY2F1c2UgdGhhdCdzIGlu
IHRoZQo+IGtlcm5lbC1kb2Mgb2YgcmVnbWFwX3JlYWQoKS4KPiAKPj4gKwlpZiAocmV0IDwgMCkK
Pj4gKwkJcmV0dXJuIHNuZF9zb2NfcmV0KGNvbXBvbmVudC0+ZGV2LCByZXQsICJGYWlsZWQgdG8g
cmVhZCBGSUZPIHBvaW50ZXIiKTsKPj4gICAKPj4gIMKgCXJldHVybiBieXRlc190b19mcmFtZXMo
cnVudGltZSwgYWRkciAtICh1bnNpZ25lZCBpbnQpcnVudGltZS0+ZG1hX2FkZHIpOwo+IEhlcmUg
YWRkciBpcyB1c2VkLCBzbyBpdCdzIG5vdCBzYW1lIGFzIGFib3ZlLgo+IAo+IExvb2tpbmcgZm9y
d2FyZCB0byB5b3VyIFBPVi4KCkhlcmUgSSBsZWZ0ICdhZGRyJyB0byBtaW5pbWl6ZSB0aGUgbnVt
YmVyIG9mIGNoYW5nZXMgaW4gdGhlIHBhdGNoLgpMb29raW5nIGF0IGl0IGFnYWluIG5vdywgSSdt
IG1vcmUgaW4gZmF2b3Igb2Yga2VlcGluZyBpdCBhcyAnYWRkcicuIEkgCnVuZGVyc3RhbmQgdGhh
dCB0aGUgcmVnbWFwIGRvY3VtZW50YXRpb24gdXNlcyAndmFsJywgYnV0IGluIHRoaXMgY2FzZSB3
ZSAKa25vdyB0aGF0IHRoZSByZXR1cm5lZCB2YWx1ZSBpcyByZWFsbHkgYW4gYWRkcmVzcyBvZiBt
ZW1vcnksIG5vdCBqdXN0IGEgCmdlbmVyaWMgdmFsdWUuCkFsc28ga2VlcGluZyB0aGUgbmFtZSBh
cyBpdCBpcyBtYWtlcyB0aGUgbGFzdCBsaW5lIG9mIHRoYXQgZnVuY3Rpb24gCnJlYWRpbmcgc21v
b3RobHkuCgpIb3dldmVyIGlmIHlvdSBkZWVtIHRoaXMgdW5hY2NlcHRhYmxlIEkgY2FuIGNoYW5n
ZSBhcyB5b3UgcmVxdWVzdGVkLiAKSnVzdCBsZXQgbWUga25vdy4KCkJlc3QgcmVnYXJkcywKCi0t
IApWYWxlcmlvCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
YW1sb2dpYwo=
