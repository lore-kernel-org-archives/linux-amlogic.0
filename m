Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4505BC77B61
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Apr 2023 09:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nbu7xpc2oik2iKB5PPKvCFUkqL7fOjaojoaymyuIqB4=; b=0VqOHT+7yxX/Tu
	f0YRmjsNV5ehzB7g6WeOqMNK+5DbWUqJRIr+RuvyJPhPgr/Sk0oYW3bKpVNp8E7Kc9oZtn9sJ46dX
	AkK/5n5NQ3e1KQ08RonTCVcXpLUJ4N3s1VaoSRMTYVeFHHVU1FW6lr47eTjU+2vu6VFzf6gRzXQ7/
	LD45/z13MN5ZV9kPr6JLlAKBTW3E72lck4kH8nI8wnKpzQFWEV9pYeHQGY3Pbn/RTApOhGGlLP4x8
	OOEwG7Jb6Rw+jk+sWWhIV1zxvA5As6rOGqYR+LaHWeMi44zBwNPEBS8lXGi7ddns5UqWhQTrNyhZ8
	gyeYHaPtB7lyEqOPYNww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prxvL-005zvk-2Y;
	Thu, 27 Apr 2023 09:28:23 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prxvH-005ztX-1v;
	Thu, 27 Apr 2023 09:28:21 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3f086770a50so55342745e9.2;
        Thu, 27 Apr 2023 02:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682587695; x=1685179695;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3gRyv9/c3hiQ7r5QJojLuvI4Uzi5JVoUb74Y2iMoY+Y=;
        b=oewTNZabFK2Yqd114dg9u/afFL6NUGghYQtxENi4k3ZewcX+4in5J9Pqwy0xUt2I/+
         I93f4pDsiTVklaCqOoZunN2RUOPSbAeiShQq9NHzBGMKR1ejDjdE47CvyjxC5vhwIDeG
         jex9eV7R1aoVmJBZxuYkacJy6OEUSFgvqfyVakIrrgSBlGbtfzHTfdk9xsvy175jTLHq
         IpupsZopztl9zZNy3Xh331rtYJV4kujP+nZKJU7/Nt4TOPE+xP01FwlpDVL8Rca1xd2K
         QL++E/00cnmQ7x9+DpvnDxPwaLcEPfneghoqlYS3oCtpZuCkkxlRz/kZ6Nm9IT/mOZxL
         qFLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682587695; x=1685179695;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3gRyv9/c3hiQ7r5QJojLuvI4Uzi5JVoUb74Y2iMoY+Y=;
        b=Eh8GWKDI4kB4PGEiOSsm7sv7AdzZPr+AeizOfZs7r06W/xWEnhg6H5oUvW7E0vPJTP
         TJx4MPhJONR6BcdLkyb59aEaReCVuAHjztrAHYVRRTcz081HnwbJ/bbTrd6socITjZFe
         trw/oIv90cmbAqATVOJ/8wXfTtZhlNtOFq/sxC8bTsDxjc/d7uzBqzxhWIcdPEzh1rmR
         sdwMLKFSUBkaJM8zCyNobTqjJdrrtA4P4hKaqUdYzzj92kSZlaW4nuNe1hedG+VALhCv
         JgGnVdiBTvsg6vr2QbNTrcfNoCdOCD6kKtiMSEAl4zukcVm4p0pqo4erZElehtZTlgBM
         TlHg==
X-Gm-Message-State: AC+VfDxCeGNTYEij2DFtLdjjQeimFHXo3LhKu7MIekEM1q1zOOOKa/3k
	arcqTZUYG+0s5Noli0vTm0Y=
X-Google-Smtp-Source: ACHHUZ65pFzJpzljmfjsh3vnqlyNuO+P+qMyYfCpjWhtjLe/uJ8pKsdXDuff/McAilSu3ppiZPeL3g==
X-Received: by 2002:a05:600c:b49:b0:3f1:82d8:8fde with SMTP id k9-20020a05600c0b4900b003f182d88fdemr1052490wmr.24.1682587695334;
        Thu, 27 Apr 2023 02:28:15 -0700 (PDT)
Received: from smtpclient.apple ([94.57.164.107])
        by smtp.gmail.com with ESMTPSA id p10-20020a1c544a000000b003f03d483966sm23976695wmi.44.2023.04.27.02.28.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Apr 2023 02:28:14 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.2\))
Subject: Re: [PATCH V2] arm64: dts: add support for C3 based Amlogic AW409
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <20230427085859.793802-1-xianwei.zhao@amlogic.com>
Date: Thu, 27 Apr 2023 10:28:06 +0100
Cc: linux-arm-kernel@lists.infradead.org,
 LKML <linux-kernel@vger.kernel.org>,
 AML <linux-amlogic@lists.infradead.org>,
 devicetree <devicetree@vger.kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Message-Id: <1C87B1C1-122F-491C-9D3A-1FE1EF6F2B87@gmail.com>
References: <20230427085859.793802-1-xianwei.zhao@amlogic.com>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: Apple Mail (2.3696.120.41.1.2)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230427_022819_635399_E9204F68 
X-CRM114-Status: GOOD (  22.72  )
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

Cj4gT24gMjcgQXByIDIwMjMsIGF0IDk6NTggYW0sIFhpYW53ZWkgWmhhbyA8eGlhbndlaS56aGFv
QGFtbG9naWMuY29tPiB3cm90ZToKPiAKPiBBbWxvZ2ljIEMzIGlzIGFuIGFkdmFuY2VkIGVkZ2Ug
QUkgcHJvY2Vzc29yIGRlc2lnbmVkIGZvciBzbWFydCBJUCBjYW1lcmEKPiBhcHBsaWNhdGlvbnMu
Cj4gCj4gQWRkIGJhc2ljIHN1cHBvcnQgZm9yIHRoZSBDMyBiYXNlZCBBbWxvZ2ljIEFXNDA5IGJv
YXJkLCB3aGljaCBkZXNjcmliZXMKPiB0aGUgZm9sbG93aW5nIGNvbXBvbmVudHM6IENQVSwgR0lD
LCBJUlEsIFRpbWVyLCBVQVJULiBJdCdzIGNhcGFibGUgb2YKPiBib290aW5nIHVwIGludG8gdGhl
IHNlcmlhbCBjb25zb2xlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFhpYW53ZWkgWmhhbyA8eGlhbndl
aS56aGFvQGFtbG9naWMuY29tPgo+IAo+IC0tLQo+IFYxIC0+IFYyOiBSZW1vdmUgbmV3IGFyY2gs
IGFuZCB1c2UgQVJDSF9NRVNPTjsKPiAgICAgICAgIE1vZGlmeSBub2RlIG5hbWUsIGFuZCBkZWxl
dGUgc3VwZXJmbHVvdXMgYmxhbmsgbGluZXMuCj4gLS0tCj4gYXJjaC9hcm02NC9ib290L2R0cy9h
bWxvZ2ljL01ha2VmaWxlICAgICAgICAgIHwgIDEgKwo+IC4uLi9hbWxvZ2ljL2FtbG9naWMtYzMt
YzMwMngtYXc0MDktMjU2bS5kdHMgICB8IDI5ICsrKysrKysKPiBhcmNoL2FybTY0L2Jvb3QvZHRz
L2FtbG9naWMvYW1sb2dpYy1jMy5kdHNpICAgfCA4NiArKysrKysrKysrKysrKysrKysrCj4gMyBm
aWxlcyBjaGFuZ2VkLCAxMTYgaW5zZXJ0aW9ucygrKQo+IGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNo
L2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvYW1sb2dpYy1jMy1jMzAyeC1hdzQwOS0yNTZtLmR0cwo+
IGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvYW1sb2dpYy1j
My5kdHNpCj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9NYWtl
ZmlsZSBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9NYWtlZmlsZQo+IGluZGV4IGNkMWM1
YjA0ODkwYS4uYmNlYzg3MmMyNDQ0IDEwMDY0NAo+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMv
YW1sb2dpYy9NYWtlZmlsZQo+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9NYWtl
ZmlsZQo+IEBAIC03NCwzICs3NCw0IEBAIGR0Yi0kKENPTkZJR19BUkNIX01FU09OKSArPSBtZXNv
bi1zbTEtb2Ryb2lkLWhjNC5kdGIKPiBkdGItJChDT05GSUdfQVJDSF9NRVNPTikgKz0gbWVzb24t
c20xLXNlaTYxMC5kdGIKPiBkdGItJChDT05GSUdfQVJDSF9NRVNPTikgKz0gbWVzb24tc20xLXg5
Ni1haXItZ2JpdC5kdGIKPiBkdGItJChDT05GSUdfQVJDSF9NRVNPTikgKz0gbWVzb24tc20xLXg5
Ni1haXIuZHRiCj4gK2R0Yi0kKENPTkZJR19BUkNIX01FU09OKSArPSBhbWxvZ2ljLWMzLWMzMDJ4
LWF3NDA5LTI1Nm0uZHRiCgpeIHBsZWFzZSBrZWVwIHRoZSBsaXN0IGFscGhhLXNvcnRlZCwgYW5k
IDI1Nm0gaXMgZGVzY3JpYmVkIGluIHRoZSBkdHMKc28gdGhlcmUgaXMgbm8gbmVlZCB0byBpbmNs
dWRlIGl0IGluIHRoZSBib2FyZCBmaWxlbmFtZS4gSSB3b3VsZCBhbHNvCmV4cGVjdCBtZXNvbi1j
MyogdG8gYWxpZ24gd2l0aCBleGlzdGluZyBmaWxlbmFtZXMsIGJ1dCBJ4oCZbGwgbGV0IG90aGVy
cwpjb21tZW50IG9uIG5hbWluZyBydWxlcy4KCkNocmlzdGlhbgoKPiBkaWZmIC0tZ2l0IGEvYXJj
aC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL2FtbG9naWMtYzMtYzMwMngtYXc0MDktMjU2bS5kdHMg
Yi9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvYW1sb2dpYy1jMy1jMzAyeC1hdzQwOS0yNTZt
LmR0cwo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwLi5lZGNlODg1
MGIzMzgKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2lj
L2FtbG9naWMtYzMtYzMwMngtYXc0MDktMjU2bS5kdHMKPiBAQCAtMCwwICsxLDI5IEBACj4gKy8v
IFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMCsgT1IgTUlUKQo+ICsvKgo+ICsgKiBD
b3B5cmlnaHQgKGMpIDIwMjEgQW1sb2dpYywgSW5jLiBBbGwgcmlnaHRzIHJlc2VydmVkLgo+ICsg
Ki8KPiArCj4gKy9kdHMtdjEvOwo+ICsKPiArI2luY2x1ZGUgImFtbG9naWMtYzMuZHRzaSIKPiAr
Cj4gKy8gewo+ICsJbW9kZWwgPSAiQW1sb2dpYyBDMzAyIGF3NDA5IERldmVsb3BtZW50IEJvYXJk
IjsKPiArCWNvbXBhdGlibGUgPSAiYW1sb2dpYyxhdzQwOSIsICJhbWxvZ2ljLGMzIjsKPiArCWlu
dGVycnVwdC1wYXJlbnQgPSA8JmdpYz47Cj4gKwkjYWRkcmVzcy1jZWxscyA9IDwyPjsKPiArCSNz
aXplLWNlbGxzID0gPDI+Owo+ICsKPiArCWFsaWFzZXMgewo+ICsJCXNlcmlhbDAgPSAmdWFydF9i
Owo+ICsJfTsKPiArCj4gKwltZW1vcnlAMCB7Cj4gKwkJZGV2aWNlX3R5cGUgPSAibWVtb3J5IjsK
PiArCQlyZWcgPSA8MHgwIDB4MCAweDAgMHgxMDAwMDAwMD47Cj4gKwl9Owo+ICt9Owo+ICsKPiAr
JnVhcnRfYiB7Cj4gKwlzdGF0dXMgPSAib2theSI7Cj4gK307Cj4gZGlmZiAtLWdpdCBhL2FyY2gv
YXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9hbWxvZ2ljLWMzLmR0c2kgYi9hcmNoL2FybTY0L2Jvb3Qv
ZHRzL2FtbG9naWMvYW1sb2dpYy1jMy5kdHNpCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRl
eCAwMDAwMDAwMDAwMDAuLjkzYjMzNWFlZjYwNQo+IC0tLSAvZGV2L251bGwKPiArKysgYi9hcmNo
L2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvYW1sb2dpYy1jMy5kdHNpCj4gQEAgLTAsMCArMSw4NiBA
QAo+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjArIE9SIE1JVCkKPiArLyoK
PiArICogQ29weXJpZ2h0IChjKSAyMDIxIEFtbG9naWMsIEluYy4gQWxsIHJpZ2h0cyByZXNlcnZl
ZC4KPiArICovCj4gKwo+ICsjaW5jbHVkZSA8ZHQtYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xs
ZXIvaXJxLmg+Cj4gKyNpbmNsdWRlIDxkdC1iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9h
cm0tZ2ljLmg+Cj4gKyNpbmNsdWRlIDxkdC1iaW5kaW5ncy9ncGlvL2dwaW8uaD4KPiArCj4gKy8g
ewo+ICsJY3B1cyB7Cj4gKwkJI2FkZHJlc3MtY2VsbHMgPSA8Mj47Cj4gKwkJI3NpemUtY2VsbHMg
PSA8MD47Cj4gKwo+ICsJCWNwdTA6IGNwdUAwIHsKPiArCQkJZGV2aWNlX3R5cGUgPSAiY3B1IjsK
PiArCQkJY29tcGF0aWJsZSA9ICJhcm0sY29ydGV4LWEzNSI7Cj4gKwkJCXJlZyA9IDwweDAgMHgw
PjsKPiArCQkJZW5hYmxlLW1ldGhvZCA9ICJwc2NpIjsKPiArCQl9Owo+ICsKPiArCQljcHUxOiBj
cHVAMSB7Cj4gKwkJCWRldmljZV90eXBlID0gImNwdSI7Cj4gKwkJCWNvbXBhdGlibGUgPSAiYXJt
LGNvcnRleC1hMzUiOwo+ICsJCQlyZWcgPSA8MHgwIDB4MT47Cj4gKwkJCWVuYWJsZS1tZXRob2Qg
PSAicHNjaSI7Cj4gKwkJfTsKPiArCX07Cj4gKwo+ICsJdGltZXIgewo+ICsJCWNvbXBhdGlibGUg
PSAiYXJtLGFybXY4LXRpbWVyIjsKPiArCQlpbnRlcnJ1cHRzID0gPEdJQ19QUEkgMTMgKEdJQ19D
UFVfTUFTS19TSU1QTEUoNCkgfCBJUlFfVFlQRV9MRVZFTF9MT1cpPiwKPiArCQkJICAgICA8R0lD
X1BQSSAxNCAoR0lDX0NQVV9NQVNLX1NJTVBMRSg0KSB8IElSUV9UWVBFX0xFVkVMX0xPVyk+LAo+
ICsJCQkgICAgIDxHSUNfUFBJIDExIChHSUNfQ1BVX01BU0tfU0lNUExFKDQpIHwgSVJRX1RZUEVf
TEVWRUxfTE9XKT4sCj4gKwkJCSAgICAgPEdJQ19QUEkgMTAgKEdJQ19DUFVfTUFTS19TSU1QTEUo
NCkgfCBJUlFfVFlQRV9MRVZFTF9MT1cpPjsKPiArCX07Cj4gKwo+ICsJcHNjaSB7Cj4gKwkJY29t
cGF0aWJsZSA9ICJhcm0scHNjaS0xLjAiOwo+ICsJCW1ldGhvZCA9ICJzbWMiOwo+ICsJfTsKPiAr
Cj4gKwl4dGFsOiB4dGFsLWNsayB7Cj4gKwkJY29tcGF0aWJsZSA9ICJmaXhlZC1jbG9jayI7Cj4g
KwkJY2xvY2stZnJlcXVlbmN5ID0gPDI0MDAwMDAwPjsKPiArCQljbG9jay1vdXRwdXQtbmFtZXMg
PSAieHRhbCI7Cj4gKwkJI2Nsb2NrLWNlbGxzID0gPDA+Owo+ICsJfTsKPiArCj4gKwlzb2Mgewo+
ICsJCWNvbXBhdGlibGUgPSAic2ltcGxlLWJ1cyI7Cj4gKwkJI2FkZHJlc3MtY2VsbHMgPSA8Mj47
Cj4gKwkJI3NpemUtY2VsbHMgPSA8Mj47Cj4gKwkJcmFuZ2VzOwo+ICsKPiArCQlnaWM6IGludGVy
cnVwdC1jb250cm9sbGVyQGZmZjAxMDAwIHsKPiArCQkJY29tcGF0aWJsZSA9ICJhcm0sZ2ljLTQw
MCI7Cj4gKwkJCSNpbnRlcnJ1cHQtY2VsbHMgPSA8Mz47Cj4gKwkJCSNhZGRyZXNzLWNlbGxzID0g
PDA+Owo+ICsJCQlpbnRlcnJ1cHQtY29udHJvbGxlcjsKPiArCQkJcmVnID0gPDB4MCAweGZmZjAx
MDAwIDAgMHgxMDAwPiwKPiArCQkJICAgICAgPDB4MCAweGZmZjAyMDAwIDAgMHgyMDAwPiwKPiAr
CQkJICAgICAgPDB4MCAweGZmZjA0MDAwIDAgMHgyMDAwPiwKPiArCQkJICAgICAgPDB4MCAweGZm
ZjA2MDAwIDAgMHgyMDAwPjsKPiArCQkJaW50ZXJydXB0cyA9IDxHSUNfUFBJIDkgKEdJQ19DUFVf
TUFTS19TSU1QTEUoNCkgfCBJUlFfVFlQRV9MRVZFTF9ISUdIKT47Cj4gKwkJfTsKPiArCj4gKwkJ
YXBiNDogYnVzQGZlMDAwMDAwIHsKPiArCQkJY29tcGF0aWJsZSA9ICJzaW1wbGUtYnVzIjsKPiAr
CQkJcmVnID0gPDB4MCAweGZlMDAwMDAwIDB4MCAweDQ4MDAwMD47Cj4gKwkJCSNhZGRyZXNzLWNl
bGxzID0gPDI+Owo+ICsJCQkjc2l6ZS1jZWxscyA9IDwyPjsKPiArCQkJcmFuZ2VzID0gPDB4MCAw
eDAgMHgwIDB4ZmUwMDAwMDAgMHgwIDB4NDgwMDAwPjsKPiArCj4gKwkJCXVhcnRfYjogc2VyaWFs
QDdhMDAwIHsKPiArCQkJCWNvbXBhdGlibGUgPSAiYW1sb2dpYyxtZXNvbi1nMTJhLXVhcnQiOwo+
ICsJCQkJcmVnID0gPDB4MCAweDdhMDAwIDB4MCAweDE4PjsKPiArCQkJCWludGVycnVwdHMgPSA8
R0lDX1NQSSAxNjkgSVJRX1RZUEVfRURHRV9SSVNJTkc+Owo+ICsJCQkJc3RhdHVzID0gImRpc2Fi
bGVkIjsKPiArCQkJCWNsb2NrcyA9IDwmeHRhbD4sIDwmeHRhbD4sIDwmeHRhbD47Cj4gKwkJCQlj
bG9jay1uYW1lcyA9ICJ4dGFsIiwgInBjbGsiLCAiYmF1ZCI7Cj4gKwkJCX07Cj4gKwo+ICsJCX07
Cj4gKwl9Owo+ICt9Owo+IAo+IGJhc2UtY29tbWl0OiBhZTY4ZmIxODdiNTliYzg2NDU5NzQzMjA4
MDhhYjJkN2M0MWIxODMzCj4gLS0gCj4gMi4zNy4xCj4gCj4gCj4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlz
dAo+IGxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBs
aXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
