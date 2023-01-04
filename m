Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48F78C53210
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Jan 2023 20:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q8b9NMN08PFG9zI+Zx4g2PcqfVQYq49UbeR1OjCcWeM=; b=27IJMs+2F9nQhS
	hWG8sTow3UILFe3fIGr8FDCtukMPS78gF+s6lD4mK6uanB2XFIiz5n85h9yowJDXGeCmNnJt+awQE
	WPYUfKUfmAQ71yDJ23vzGwlzSDQsdlgqIiH50MwoIXlGEXTBPScpLDcfjdjcejJjvrvLEqg8BXxGh
	XRx64fzxAVTcbjc2gY2IOip47F4Mqm0O7/iFMlb8GxvTsUtn2FnoePyY6cbRSiJyLecYR7KIoBjm2
	BlI0ukqIN1ffpasj4tTYml4nYhO6Ei0OCVVf6kcxsalHhxpRuOn+7awVAyr6B/voJsFA+VX1Ijd3W
	DUY/lUU8WEN7oMjc2Qtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDAcJ-00BwVX-Sx; Wed, 04 Jan 2023 20:44:07 +0000
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDAcF-00BwKj-VG
	for linux-amlogic@lists.infradead.org; Wed, 04 Jan 2023 20:44:06 +0000
Received: by mail-io1-xd2d.google.com with SMTP id h6so18626561iof.9
        for <linux-amlogic@lists.infradead.org>; Wed, 04 Jan 2023 12:43:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zzDMmEXzxG1ULGv7Igwk/tcQs7OZBwuRSi/GCqX5tJs=;
        b=fG+SV3PTvqGzfsfjulBsw9IFbH1Lh7j5pqNuXgccsZGhTVPbJfwTasm8YyB9LIyF8Z
         Y5WDtdHWREt6o8qCGCPLXIZC1ZXCQco+VDuznsE4tAWvB4YaNdRhxXVSwRAA/mZFX4wf
         91WOlmBmoLKSoYqciyuB7OwpTJu+uX4Vr96+g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zzDMmEXzxG1ULGv7Igwk/tcQs7OZBwuRSi/GCqX5tJs=;
        b=5UixO1CljjllouEytoQU1mSj52E1/5BXzBDNnJseHgxsEfiPw/p3tc+b2E/VM5zKWh
         SM/AuGK/70L/XFMVv987aRRO0SD+Rofg7Mjx0Jrs71uJCZp6cyrspf81dGfJNP9/HshO
         hhtdJcXjWPtqyRxAfa30m3a5p/NSuX6FKjWnkDSnz4OfvhyfNdqQ6usKGRdfjQYiUYyl
         bUejNla1SuR8Ei8BLHg48EyjWgOE9Mzh1XpSLSV8dqtK+aG5muCCnOYNyWmfBuiFUHeb
         OIV3xiVBvbcnuaTsOw6PxMnDBlYlthZB4GUajFXRCsHdW/2+ZYx6TDd0kpqPLHd1Qjhe
         ttBQ==
X-Gm-Message-State: AFqh2kqAnr33cNV1KkWftXKSqQG6Ouaq6Tc+CZqsX6HR7J31q9rZeGeu
	cEWFRlpPeWZaRh2fbent3egiegbxKO6nVX+z
X-Google-Smtp-Source: AMrXdXup99VfDxMtR3gJF40y40n/4S592gYF9ybWoEKl0M7Zvaf9GDg5BI+SbXzMQkTbswSnryzeNQ==
X-Received: by 2002:a05:6602:154:b0:6e3:1cfe:4914 with SMTP id v20-20020a056602015400b006e31cfe4914mr28714496iot.21.1672865022723;
        Wed, 04 Jan 2023 12:43:42 -0800 (PST)
Received: from localhost (30.23.70.34.bc.googleusercontent.com. [34.70.23.30])
        by smtp.gmail.com with UTF8SMTPSA id o16-20020a02b810000000b0039decb5b452sm6431840jam.65.2023.01.04.12.43.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jan 2023 12:43:42 -0800 (PST)
Date: Wed, 4 Jan 2023 20:43:42 +0000
From: Matthias Kaehlcke <mka@chromium.org>
To: Anand Moon <linux.amoon@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 06/11] usb: misc: onboard_usb_hub: add Genesys Logic
 GL3523-QFN76 hub support
Message-ID: <Y7Xk/lPUshC+U8OQ@google.com>
References: <20221228100321.15949-1-linux.amoon@gmail.com>
 <20221228100321.15949-7-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221228100321.15949-7-linux.amoon@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230104_124404_034083_FB91CFE3 
X-CRM114-Status: GOOD (  23.09  )
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

SGkgQW5hbmQsCgpPbiBXZWQsIERlYyAyOCwgMjAyMiBhdCAxMDowMzoxNUFNICswMDAwLCBBbmFu
ZCBNb29uIHdyb3RlOgo+IEdlbmVzeXMgTG9naWMgR0wzNTIzLVFGTjc2IGlzIGEgNC1wb3J0IFVT
QiAzLjEgaHViIHRoYXQgaGFzIGEgcmVzZXQgcGluIHRvCj4gdG9nZ2xlIGFuZCBhIDUuMFYgY29y
ZSBzdXBwbHkgZXhwb3J0ZWQgdGhvdWdoIGFuIGludGVncmF0ZWQgTERPIGlzCj4gYXZhaWxhYmxl
IGZvciBwb3dlcmluZyBpdC4KPiAKPiBBZGQgdGhlIHN1cHBvcnQgZm9yIHRoaXMgaHViLCBmb3Ig
Y29udHJvbGxpbmcgdGhlIHJlc2V0IHBpbiBhbmQgdGhlIGNvcmUKPiBwb3dlciBzdXBwbHkuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogQW5hbmQgTW9vbiA8bGludXguYW1vb25AZ21haWwuY29tPgo+IC0t
LQo+ICBkcml2ZXJzL3VzYi9taXNjL29uYm9hcmRfdXNiX2h1Yi5jIHwgMSArCj4gIGRyaXZlcnMv
dXNiL21pc2Mvb25ib2FyZF91c2JfaHViLmggfCAxICsKPiAgMiBmaWxlcyBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvbWlzYy9vbmJvYXJkX3Vz
Yl9odWIuYyBiL2RyaXZlcnMvdXNiL21pc2Mvb25ib2FyZF91c2JfaHViLmMKPiBpbmRleCBjMGU4
ZTZmNGVjMGEuLjY5OTA1MGViM2YxNyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3VzYi9taXNjL29u
Ym9hcmRfdXNiX2h1Yi5jCj4gKysrIGIvZHJpdmVycy91c2IvbWlzYy9vbmJvYXJkX3VzYl9odWIu
Ywo+IEBAIC00MTAsNiArNDEwLDcgQEAgc3RhdGljIHZvaWQgb25ib2FyZF9odWJfdXNiZGV2X2Rp
c2Nvbm5lY3Qoc3RydWN0IHVzYl9kZXZpY2UgKnVkZXYpCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
dXNiX2RldmljZV9pZCBvbmJvYXJkX2h1Yl9pZF90YWJsZVtdID0gewo+ICAJeyBVU0JfREVWSUNF
KFZFTkRPUl9JRF9HRU5FU1lTLCAweDA2MDgpIH0sIC8qIEdlbmVzeXMgTG9naWMgR0w4NTBHIFVT
QiAyLjAgKi8KPiAgCXsgVVNCX0RFVklDRShWRU5ET1JfSURfR0VORVNZUywgMHgwNjEwKSB9LCAv
KiBHZW5lc3lzIExvZ2ljIEdMODUyRy1PSEcgVVNCIDIuMCAqLwo+ICsJeyBVU0JfREVWSUNFKFZF
TkRPUl9JRF9HRU5FU1lTLCAweDA2MjApIH0sIC8qIEdlbmVzeXMgTG9naWMgR0wzNTIzLVFGTjc2
IFVTQiAzLjEgKi8KClBsZWFzZSBkcm9wIHRoZSAnLVFGTjc2JyBzdWZmaXguIFRoZSBHTDM1MjMg
Y29tZXMgaW4gZGlmZmVyZW50IHBhY2thZ2VzLCAnUUZONzYnCmlzIG9uZSBvZiB0aGVtLCBJJ2Qg
ZXhwZWN0IHRoZSBvdGhlciBwYWNrYWdlcyB0byB1c2UgdGhlIHNhbWUgcHJvZHVjdCBpZC4KClRo
ZSBHTDM1MjMgaXMgYSBzaW5nbGUgSUMsIGhvd2V2ZXIgbGlrZSB0aGUgVEkgVVNCODA0MSBvciB0
aGUgUlRTNTQxNCBpdApwcm92aWRlcyBib3RoIGEgVVNCIDMuMSBhbmQgYSBVU0IgMi4wIGh1Yi4g
WW91IHNob3VsZCBhbHNvIGFkZCBhbiBlbnRyeSBmb3IKdGhlIFVTQiAyLjAgaHViIGhlcmUuCgo+
ICAJeyBVU0JfREVWSUNFKFZFTkRPUl9JRF9NSUNST0NISVAsIDB4MjUxNCkgfSwgLyogVVNCMjUx
NEIgVVNCIDIuMCAqLwo+ICAJeyBVU0JfREVWSUNFKFZFTkRPUl9JRF9SRUFMVEVLLCAweDA0MTEp
IH0sIC8qIFJUUzU0MTEgVVNCIDMuMSAqLwo+ICAJeyBVU0JfREVWSUNFKFZFTkRPUl9JRF9SRUFM
VEVLLCAweDU0MTEpIH0sIC8qIFJUUzU0MTEgVVNCIDIuMSAqLwo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL3VzYi9taXNjL29uYm9hcmRfdXNiX2h1Yi5oIGIvZHJpdmVycy91c2IvbWlzYy9vbmJvYXJk
X3VzYl9odWIuaAo+IGluZGV4IDJlZTFiMDAzMmQyMy4uYjMyZmFkM2E3MGY5IDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvdXNiL21pc2Mvb25ib2FyZF91c2JfaHViLmgKPiArKysgYi9kcml2ZXJzL3Vz
Yi9taXNjL29uYm9hcmRfdXNiX2h1Yi5oCj4gQEAgLTMyLDYgKzMyLDcgQEAgc3RhdGljIGNvbnN0
IHN0cnVjdCBvZl9kZXZpY2VfaWQgb25ib2FyZF9odWJfbWF0Y2hbXSA9IHsKPiAgCXsgLmNvbXBh
dGlibGUgPSAidXNiNDUxLDgxNDIiLCAuZGF0YSA9ICZ0aV90dXNiODA0MV9kYXRhLCB9LAo+ICAJ
eyAuY29tcGF0aWJsZSA9ICJ1c2I1ZTMsNjA4IiwgLmRhdGEgPSAmZ2VuZXN5c19nbDg1MGdfZGF0
YSwgfSwKPiAgCXsgLmNvbXBhdGlibGUgPSAiZ2VuZXN5cyx1c2I1ZTMsNjEwIiwgLmRhdGEgPSAm
Z2VuZXN5c19nbDg1MGdfZGF0YSwgfSwKPiArCXsgLmNvbXBhdGlibGUgPSAiZ2VuZXN5cyx1c2I1
ZTMsNjIwIiwgLmRhdGEgPSAmZ2VuZXN5c19nbDg1MGdfZGF0YSwgfSwKCnMvZ2VuZXN5cywvLwoK
VGhpcyByZXVzZXMgdGhlIHNldHRpbmdzIG9mIHRoZSBHTDg1MEcgaHViLCB3aGljaCBkb2Vzbid0
IHNlZW0gY29ycmVjdCBpbgp0aGlzIGNhc2UuIEZvciB0aGUgR0w4NTBHIGEgKG1pbmltdW0pIHJl
c2V0IHRpbWUgb2YgM3VzIGlzIGNvbmZpZ3VyZWQuIFRoZQpkYXRhIHNoZWV0IG9mIHRoZSBHTDM1
MjMgc2F5czoKCiAgIlRoZSAoaW50ZXJuYWwpIHJlc2V0IHdpbGwgYmUgcmVsZWFzZWQgYWZ0ZXIg
YXBwcm94aW1hdGVseSA0MCDOvFMgYWZ0ZXIKICAgcG93ZXIgZ29vZC4KCiAgIFRvIGZ1bGx5IGNv
bnRyb2wgdGhlIHJlc2V0IHByb2Nlc3Mgb2YgR0wzNTIzLCB3ZSBzdWdnZXN0IHRoZSByZXNldCB0
aW1lCiAgIGFwcGxpZWQgaW4gdGhlIGV4dGVybmFsIHJlc2V0IGNpcmN1aXQgc2hvdWxkIGxvbmdl
ciB0aGFuIHRoYXQgb2YgdGhlCiAgIGludGVybmFsIHJlc2V0IGNpcmN1aXQuIgoKU2luY2UgaXQg
aXMgJ2FwcHJveGltYXRlbHkgNDAgzrxTJyBJJ2Qgc2F5IG1ha2UgdGhlIGV4dGVybmFsIHJlc2V0
IDUwIM68Uwp0byBiZSBvbiB0aGUgc2FmZSBzaWRlLCBpdCdzIGEgdmVyeSBzaG9ydCB0aW1lIGlu
IGFueSBjYXNlLgoKUGxlYXNlIGFsc28gYWRkIGFuIGVudHJ5IGZvciB0aGUgVVNCIDIuMCBwYXJ0
IG9mIHRoZSBJQy4KCj4gIAl7IC5jb21wYXRpYmxlID0gInVzYmJkYSw0MTEiLCAuZGF0YSA9ICZy
ZWFsdGVrX3J0czU0MTFfZGF0YSwgfSwKPiAgCXsgLmNvbXBhdGlibGUgPSAidXNiYmRhLDU0MTEi
LCAuZGF0YSA9ICZyZWFsdGVrX3J0czU0MTFfZGF0YSwgfSwKPiAgCXsgLmNvbXBhdGlibGUgPSAi
dXNiYmRhLDQxNCIsIC5kYXRhID0gJnJlYWx0ZWtfcnRzNTQxMV9kYXRhLCB9LAo+IC0tIAo+IDIu
MzguMQo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1s
b2dpYwo=
