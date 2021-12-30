Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD9BDC433EF
	for <linux-amlogic@archiver.kernel.org>; Thu, 30 Dec 2021 08:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F9mrYwAEy7fmsRch1p/LcvT7NMeGJya5/+fKq5aMNGU=; b=vU0FF4FlwdvMgn
	O6s8QU5dCcGc3HP1jA3sUQOcxAliVA55+qVuqQzCIeh2zEVJKjDkqnFWXkrH3BYCNdkdp4R+KLeUX
	bM44EwRMkuadbQHduGPqCrCGAfVWDZ++NMcaWmIOEHcVLFU5l/yK3/DzEzIh1sjNzyIi/iw/Llp42
	phmjL1Zn0f91YKLrCvZ/bkNI57ROLwnHZzXKlxEVm0U9p1pfjiRiuPrBrok7/oTffSm1yaXUTi3iC
	5ueAFUshNEz6P+qlovSV6OeGq8nAanrVaqy2iWnAudx374aLvZdy2YET27oOxpj2i0dF+GR723keE
	/+ivpXHrg3aMWY+pIXqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2qnD-0041SI-Pl; Thu, 30 Dec 2021 08:28:11 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2qnA-0041Ry-HJ
 for linux-amlogic@lists.infradead.org; Thu, 30 Dec 2021 08:28:10 +0000
Received: by mail-ed1-x52c.google.com with SMTP id j21so95228268edt.9
 for <linux-amlogic@lists.infradead.org>; Thu, 30 Dec 2021 00:28:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=5yvQhuYvXnvEeI7WZkUwrQY3AKPGSjoK0ne8pwJj6HY=;
 b=UYD1GfnWLkjCvwmL+tnTGmQj5QOSul2KartH/iRcaET8vhLQW6W8+EN2KCzmIKQsM9
 zidXGD7JQ3efyH9MuFGXZQt4tfyib+S0TINAkm2mtVbNVT9ZIrUKlQTS6oH4tYyqHz2i
 kdImc+VdV7c4E1Lutx1hHhV8WOzuRYjJ+M7FmjXw++7j+CaQsrkuR57kJe9D7qEyUxIv
 MUlIwcVHJFnHcmfL/weucff0A4P9nJfm0KVr9uUQcwAsPCjYULacDGGEbv8wVOOCJMTs
 QEwljsOjbAmPaqE4+fir+aukATd4Sn29TwMduPymeGo/D53OPp6lsPyDGI1Ubh5tWacR
 pDMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=5yvQhuYvXnvEeI7WZkUwrQY3AKPGSjoK0ne8pwJj6HY=;
 b=vPPpLTNQmmqH7vBvwaaJlx9qUEKk5rJFBNJJiccgXHUcOXxkQigCddLZe72WLdPqHl
 cLbmm2M/B7fw/Sp2zfmoVjPmS7ep5mLUC1IVQYNt5LT2mJsWB+fMYfc3bF6OzhieNMr3
 tei+KoTGWtFwHvaEZwPQn+eTzuXyZHDasxtsJsPSK9ULAa+8hFx7dNdBNQ+fVnuqTu4N
 fxp4lfoa/xLqgrn/wUIb0KfyTZxepx6CS3/Se00DX4hQ47iBZu80rYG1sfe/LbQyNPUB
 n3Hen2j2eLvg1f4WXakU4deB0x0GjQ05ue2qyfyyT0jcXL0WY8gemg5EwXde4xm9U48W
 HUYA==
X-Gm-Message-State: AOAM531IAYcGxQS3gsUd7MZqn1nFvJIpOb8GQywFFn96CIbK7oCRXGvP
 3GsdnoZU2k/oUCsxVdmvssHO6k6xRpU=
X-Google-Smtp-Source: ABdhPJzBcx1zb3V8UlpY4BmblRlGHidVLyNI+mgCtzsRjsJ2AheSV34OyZSZLQhNExpX2n2bko8jyg==
X-Received: by 2002:a17:907:a089:: with SMTP id
 hu9mr24864474ejc.448.1640852885746; 
 Thu, 30 Dec 2021 00:28:05 -0800 (PST)
Received: from [172.16.30.20] ([91.135.9.67])
 by smtp.gmail.com with ESMTPSA id r3sm7484756ejr.79.2021.12.30.00.28.04
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 30 Dec 2021 00:28:05 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.7\))
Subject: Re: [RESEND] Amlogic DPCM audio card(s) speaker placement issue
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <3cd96113-3272-1efe-aa81-39de952d1e68@perex.cz>
Date: Thu, 30 Dec 2021 08:28:04 +0000
Cc: alsa-devel@alsa-project.org, Matthias Reichl <hias@horus.com>,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Message-Id: <FF1307EB-5133-441A-B221-D5361B6F0AB2@gmail.com>
References: <ECC56215-1E02-4735-82F3-B68E73F56CB4@gmail.com>
 <3cd96113-3272-1efe-aa81-39de952d1e68@perex.cz>
To: Jaroslav Kysela <perex@perex.cz>
X-Mailer: Apple Mail (2.3608.120.23.2.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211230_002808_619226_39C8B726 
X-CRM114-Status: GOOD (  12.19  )
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

Cj4gT24gMjYgRGVjIDIwMjEsIGF0IDU6MzAgcG0sIEphcm9zbGF2IEt5c2VsYSA8cGVyZXhAcGVy
ZXguY3o+IHdyb3RlOgo+IAo+IE9uIDI2LiAxMi4gMjEgMTI6NDMsIENocmlzdGlhbiBIZXdpdHQg
d3JvdGU6Cj4gCj4+ICoqKiogTGlzdCBvZiBQTEFZQkFDSyBIYXJkd2FyZSBEZXZpY2VzICoqKioK
Pj4gY2FyZCAwOiBMSUJSRVRFQ0hDQyBbTElCUkVURUNILUNDXSwgZGV2aWNlIDA6IGZlLmRhaS1s
aW5rLTAgKCopIFtdCj4+ICBTdWJkZXZpY2VzOiAxLzEKPj4gIFN1YmRldmljZSAjMDogc3ViZGV2
aWNlICMwCj4gCj4+IG51bWlkPTEyLGlmYWNlPVBDTSxuYW1lPSdFTEQnLGRldmljZT0yCj4+IG51
bWlkPTExLGlmYWNlPVBDTSxuYW1lPSdJRUM5NTggUGxheWJhY2sgRGVmYXVsdCcsZGV2aWNlPTIK
Pj4gbnVtaWQ9MTAsaWZhY2U9UENNLG5hbWU9J0lFQzk1OCBQbGF5YmFjayBNYXNrJyxkZXZpY2U9
Mgo+PiBudW1pZD05LGlmYWNlPVBDTSxuYW1lPSdQbGF5YmFjayBDaGFubmVsIE1hcCcsZGV2aWNl
PTIKPj4gaHR0cHM6Ly9naXRodWIuY29tL3RvcnZhbGRzL2xpbnV4L2Jsb2IvbWFzdGVyL2FyY2gv
YXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1neGwtczkwNXgtbGlicmV0ZWNoLWNjLmR0cyNM
MTM2LUwxODgKPiAKPiBIYXZlIHlvdSB0cmllZCB0byByZW9yZGVyIHRoZSBkYWktbGluay0jIHNl
Y3Rpb25zIGluIERUPyBJdCBhcHBlYXJzIHRvIG1lIHRoYXQgc291bmQvc29jL2NvZGVjcy9oZG1p
LWNvZGVjLmMgLyBoZG1pX2NvZGVjX3BjbV9uZXcoKSBnZXRzIHRoZSBpbnRlcm5hbCBQQ00KPiBk
ZXZpY2UgcmF0aGVyIHRoYW4gdGhlIGV4cG9ydGVkIFBDTSBkZXZpY2UgZm9yIHRoZSB1c2VyIHNw
YWNlLgoKSSBkaWQgYSB0ZXN0IHJlb3JkZXJpbmcgdGhlIG5vZGVzIG9uIHRoZSBXUDIgYm94IGxp
a2UgdGhpczoKCiAgICAgICAgZGFpLWxpbmstMCB7CiAgICAgICAgICAgICAgICBzb3VuZC1kYWkg
PSA8JmFpdSBBSVVfSERNSSBDVFJMX09VVD47CgogICAgICAgICAgICAgICAgY29kZWMtMCB7CiAg
ICAgICAgICAgICAgICAgICAgICAgIHNvdW5kLWRhaSA9IDwmaGRtaV90eD47CiAgICAgICAgICAg
ICAgICB9OwogICAgICAgIH07CgogICAgICAgIGRhaS1saW5rLTEgewogICAgICAgICAgICAgICAg
c291bmQtZGFpID0gPCZhaXUgQUlVX0NQVSBDUFVfSTJTX0ZJRk8+OwogICAgICAgIH07CgogICAg
ICAgIGRhaS1saW5rLTIgewogICAgICAgICAgICAgICAgc291bmQtZGFpID0gPCZhaXUgQUlVX0NQ
VSBDUFVfU1BESUZfRklGTz47CiAgICAgICAgfTsKCiAgICAgICAgZGFpLWxpbmstMyB7CiAgICAg
ICAgICAgICAgICBzb3VuZC1kYWkgPSA8JmFpdSBBSVVfQ1BVIENQVV9JMlNfRU5DT0RFUj47CiAg
ICAgICAgICAgICAgICBkYWktZm9ybWF0ID0gImkycyI7CiAgICAgICAgICAgICAgICBtY2xrLWZz
ID0gPDI1Nj47CgogICAgICAgICAgICAgICAgY29kZWMtMCB7CiAgICAgICAgICAgICAgICAgICAg
ICAgIHNvdW5kLWRhaSA9IDwmYWl1IEFJVV9IRE1JIENUUkxfSTJTPjsKICAgICAgICAgICAgICAg
IH07CiAgICAgICAgfTsKCiAgICAgICAgZGFpLWxpbmstNCB7CiAgICAgICAgICAgICAgICBzb3Vu
ZC1kYWkgPSA8JmFpdSBBSVVfQ1BVIENQVV9TUERJRl9FTkNPREVSPjsKCiAgICAgICAgICAgICAg
ICBjb2RlYy0wIHsKICAgICAgICAgICAgICAgICAgICAgICAgc291bmQtZGFpID0gPCZzcGRpZl9k
aXQ+OwogICAgICAgICAgICAgICAgfTsKICAgICAgICB9OwoKVGhpcyBnaXZlcyBvdXRwdXQgbGlr
ZToKCldQMjp+ICMgYW1peGVyIGNvbnRyb2xzCm51bWlkPTUsaWZhY2U9TUlYRVIsbmFtZT0nQUlV
IEhETUkgQ1RSTCBTUkMnCm51bWlkPTYsaWZhY2U9TUlYRVIsbmFtZT0nQUlVIFNQRElGIFNSQyBT
RUwnCm51bWlkPTQsaWZhY2U9UENNLG5hbWU9J0VMRCcKbnVtaWQ9MyxpZmFjZT1QQ00sbmFtZT0n
SUVDOTU4IFBsYXliYWNrIERlZmF1bHQnCm51bWlkPTIsaWZhY2U9UENNLG5hbWU9J0lFQzk1OCBQ
bGF5YmFjayBNYXNrJwpudW1pZD0xLGlmYWNlPVBDTSxuYW1lPSdQbGF5YmFjayBDaGFubmVsIE1h
cOKAmQoKVGhlIOKAnGRldmljZT004oCdIGlzIGdvbmUsIGJ1dCBhbHNvIGdvbmUgaXMgdGhlIGRl
ZmF1bHQgUENNIGRldmljZToKCldQMjp+ICMgYXBsYXkgLUwKbnVsbAogICAgRGlzY2FyZCBhbGwg
c2FtcGxlcyAocGxheWJhY2spIG9yIGdlbmVyYXRlIHplcm8gc2FtcGxlcyAoY2FwdHVyZSkKaWVj
OTU4OkNBUkQ9V0VURUtQTEFZMixERVY9MAogICAgV0VURUstUExBWTIsIAogICAgSUVDOTU4IChT
L1BESUYpIERpZ2l0YWwgQXVkaW8gT3V0cHV0CgpBc3N1bWluZyBJIGRpZCB0aGUgY2hhbmdlcyBh
Ym92ZSBjb3JyZWN0bHk/IGl0IGxvb2tzIGxpa2UgREFJIG9yZGVyCm1hdHRlcnMgYW5kIGNhbm5v
dCBiZSBjaGFuZ2VkLgoKPiBJZiB0aGUgREFJIHJvdXRpbmcgY2Fubm90IGJlIGNoYW5nZWQsIHRo
ZW4gdGhlIGhkbWktY29kZWMuYyBzaG91bGQgYmUgbW9kaWZpZWQgdG8gZXhwb3J0IHRoZSBjb3Jy
ZWN0IGRldmljZSBudW1iZXIgZm9yIHRoZSB1c2VyIHNwYWNlOgo+IAo+IGh0dHBzOi8vZ2l0Lmtl
cm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC90cmVl
L3NvdW5kL3NvYy9jb2RlY3MvaGRtaS1jb2RlYy5jP2g9djUuMTYtcmM2I244MDUKCgpUaGF04oCZ
cyBzb21lIHdheSBiZXlvbmQgbXkgbGltaXRlZCBrZXJuZWwgc2tpbGxzLCBzbyBJIHdpbGwgbmVl
ZCB0bwpwaG9uZSBmcmllbmRzIGFuZCBhc2sgdGhlIGF1ZGllbmNlIGZvciBhc3Npc3RhbmNlIDop
CgpDaHJpc3RpYW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1hbWxvZ2ljCg==
