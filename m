Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0481CD5BA4
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 May 2026 12:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6PM4MEZ7MM3767xBgSy++meOrYVW45zRIMdzFi8qidY=; b=GOuCMnW2G+nOt4
	3cVnNbNf/fmbzh96Wzx7xvVktWoEsKUfEGxBKS5GvzmiVQKBABCKhmPOuYaQoBqw+J/ojHm+d53om
	h9HzjTqj8LQJLBxT+IdbzTiZkUsSd48LB9od9dAHOOKpNXV9pmwWttRBDAF0TgRCh8PQUclyHfvIa
	fxewsjqqbdKH1coHlhoDDKYrCNmaRrmzc40nJq701MBY0aln3I6JCwHcR4MeJ09MRAf+pLrdUySRH
	vy6ejeCs4u4V40/BQryYBWT1Ti/WCzn4OkHTyPzegE09BfTIyXHiFEnHrJhJW9Glm3IvotL7ntHGy
	ZLnYaZbI80ASH1vuBXMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPJvq-00000001Xjd-1GIV;
	Tue, 19 May 2026 12:52:22 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPJvn-00000001Xi8-2GCS
	for linux-amlogic@lists.infradead.org;
	Tue, 19 May 2026 12:52:20 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-bcceb394417so437678566b.0
        for <linux-amlogic@lists.infradead.org>; Tue, 19 May 2026 05:52:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779195137; cv=none;
        d=google.com; s=arc-20240605;
        b=CImRpMU0FGUKIb1UGV17xsUm+gWw4lTjBr2NX0+gOrJ8NQaNskz/Aqto3V4BXDsHJG
         tCnQSQMRdIxPwnbm2ZUIuhtpumFjD9RCQ+ehc3TS7lkMcxEPUy6iaX6wfupbVUjgxF2j
         M6gUMTyd4MFQeupU8HFGXWp3UNbxwTJgUQ9/MUcqYG163Zh+ob3rOGLFwZqMkPD0ARr+
         3Pzh8dlrZAKzNTC30zvSXorPWZt6032A/sPp4FsYMJw6m+vf5tupJMYkHFktXPn0IU3K
         9RiqNmDGBxWSBOBebHlvnlI7DIBLZT4YVmluVCXAfpod1cO1KyWuMazXrsL+J33t9QM3
         0aqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PNhrOfvUs4Ys3+1Z3tMpWGGrhZ7sbxpwpvvFyMvDqg0=;
        fh=iVx3xexaPVhWADfnHQs624QZJWAKPJPKEsHXSbdGuzY=;
        b=NJJWDwu8uNsaNQ+mwY4+3lof8KBGz9shGfj5NlRWJxz8CAIsNyokV5+/UXLbtM9kyi
         KatS2VQKrdw29m+EwlCrs+VcNmOzavyqtmG1FaL53mqm672u+3N0+WvR5a9q6UtRwAAb
         7PuiCrKFy+/q1h0ikhYpbeEEcBnhMTuKUl7z2/MVBBMDoHjwiS70eIW3IUCRZJEQPSUs
         ntsLIaJgGCUmQSgaq92u8yxWGV63B9aWC5q6uGKzVkGpGOs/J4uOqlumsOsn+Khw0Pu2
         DnLVwIZyjnhAEEEUVjRlxaKh79g/NblQpZi6S57MuhrTKxBF/mY/W+7AFshkl5Dz0Ze+
         9Zjw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779195137; x=1779799937; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PNhrOfvUs4Ys3+1Z3tMpWGGrhZ7sbxpwpvvFyMvDqg0=;
        b=MSCzsuhix0bX/rczClB5NCAP/8rj6RmhYrKJKSH3fwVJ9fpzWKCAKDXSbhA0x61cQA
         S9O57t9qodtG4QpG5/vY8d+8w+lSa63PxskEEMUWyujeaIXVtSO1Rwy+nuIMTMT5ps/q
         vUSZk7nTZwB4Bc4SF2oQP0YNX+nB4dFE+7GuEAM3uSlZHN4oilKdYNWR4pOc1+UlQnpi
         aohw4dSR2So0tG1kAKJuGNpPpU7QVBa7C+fiZ+raDE3vsi46StOm7hmrX/r1oS+dVThc
         N8uhBU2jN6HS73lqOpo1jAY4vH5UY9E0VoohnTQ01mIh57odTth6t1Cpbg3zqbzEPg/W
         QZfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779195137; x=1779799937;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PNhrOfvUs4Ys3+1Z3tMpWGGrhZ7sbxpwpvvFyMvDqg0=;
        b=Wwq6se7AzRlaVuicYeLCJJymAoTclplXtAz4H7P09qKEA2eAuLvHDvIb5E2Pgfb8yx
         Ajo770bHEkxiTJHogtCsgMocd+4VtJXhczSEzie/FjBG0VHHP3UhPRnimEGkvVGWelOW
         CBGt0jw4zHjUgkKSXxo7RzS5ThGHd25HJOd34+HDp9Vv5MIcpWa9gzEcKMzolF6aLRIA
         1R8/5+CHyA3cw5j4KS13j16h/hErCecEN8Dc7k3/LMSzdaD2vJJej+sakrVGWsuN/Zev
         tLdOJEtFj4G3dgwg4kjIwwditgXMmxW5G+S63ssyP4gJgwvyRQmIgiPRGhcIxpofEzhK
         OMkw==
X-Forwarded-Encrypted: i=1; AFNElJ8JcC3t/IGtToXwJYLHmVooRZSlELg0kV9FbXeU4mrQ5enGbQnnAwV6SCmLold2jOE05X8arR/imDMIjC5/@lists.infradead.org
X-Gm-Message-State: AOJu0Yw39KCk9yrak1cSRJCOQuyanZdl2TzpMYr72SPE6S3JBxV0LKHW
	Q4irBX2nzPvlZgO17BvJnHXtDk8nt9sXAdxgeOeALhZEFE+aEMOpvi8UzHetOHzdONDlA0CjnN3
	q7+CiJWAYyUIvl4hK086D/bMZzFyQtMA=
X-Gm-Gg: Acq92OHO5MZjW354FjNdqh99kGNSL52OWZ9CJdNaqbTKPrtruaNPVawCfbFPoJ6SO2F
	h8yMtDqrxFbZBJz+OUB166bCkqH14tFNvR0PAo7N2vOyVKkFj0mYInz6QwNqRnp8dZ7rl5jmBwn
	YiRxq+GwXLlOWHAJlrWa/80hRh0blguZKWz343IJmSi0ahcmDxMNlKfDSw1BrFmnH0M8favOs4e
	W5YRLoUTEaSOJiF0lMpLv/kdUH/9q3KcwvwfaQmoo7ssGWUStEa7B/nm6Mj9wVX+zVnasoNxTSJ
	AyRwIw==
X-Received: by 2002:a17:907:971b:b0:bd8:61ff:f916 with SMTP id
 a640c23a62f3a-bd86200058amr420267566b.44.1779195136644; Tue, 19 May 2026
 05:52:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260321065408.209723-1-linux.amoon@gmail.com> <49260ed9ce09b0684ed72787b5635e2c26059297.camel@ndufresne.ca>
In-Reply-To: <49260ed9ce09b0684ed72787b5635e2c26059297.camel@ndufresne.ca>
From: Anand Moon <linux.amoon@gmail.com>
Date: Tue, 19 May 2026 18:21:58 +0530
X-Gm-Features: AVHnY4JJCSZj_mhTfm6UH5xrsKXtX_jQr95CpJqy1MIGyRQBSz4PwDNhz0eVEgg
Message-ID: <CANAwSgRf-pPwsqfXTALrnYV2e7K9bkbOzNrrFjB5pA0QjT1hhg@mail.gmail.com>
Subject: Re: [PATCH v2] media: meson: vdec: Fix memory leak in error path of vdec_open
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Maxime Jourdan <mjourdan@baylibre.com>, 
	Hans Verkuil <hverkuil@kernel.org>, 
	"open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS" <linux-media@vger.kernel.org>, 
	"open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS" <linux-amlogic@lists.infradead.org>, 
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>, 
	"moderated list:ARM/Amlogic Meson SoC support" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_055219_596997_E69CA32A 
X-CRM114-Status: GOOD (  26.52  )
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

SGkgTmljb2xhcy4KClRoYW5rcyBmb3IgeW91ciByZXZpZXcgY29tbWVudHMKT24gRnJpLCA4IE1h
eSAyMDI2IGF0IDIzOjI4LCBOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzQG5kdWZyZXNuZS5jYT4g
d3JvdGU6Cj4KPiBIaSwKPgo+IHNvcnJ5IEkgbWlzc2VkIHlvdXIgcGF0Y2gsIGNhdGNoaW5nIHVw
IG5vdy4KPgo+Cj4gTGUgc2FtZWRpIDIxIG1hcnMgMjAyNiDDoCAxMjoyNCArMDUzMCwgQW5hbmQg
TW9vbiBhIMOpY3JpdCA6Cj4gPiBUaGUgdmRlY19vcGVuIGFuZCB2ZGVjX2Nsb3NlIGZ1bmN0aW9u
cyBpbiB0aGUgTWVzb24gVkRFQyBkcml2ZXIgZmFpbGVkCj4gPiB0byByZWxlYXNlIHNldmVyYWwg
cmVzb3VyY2VzLCBsZWFkaW5nIHRvIG1lbW9yeSBsZWFrcyBhbmQgcG90ZW50aWFsCj4gPiB1c2Ut
YWZ0ZXItZnJlZSBzY2VuYXJpb3MuCj4gPgo+ID4gVGhpcyBwYXRjaCBhZGRyZXNzZXM6Cj4gPiAt
IE1pc3NpbmcgdjRsMl9jdHJsX2hhbmRsZXJfZnJlZSgpIGluIGJvdGggdGhlIGNsb3NlIHBhdGgg
YW5kIGVycm9yCj4gPiAgIGV4aXQgb2YgdGhlIG9wZW4gcGF0aCwgcHJldmVudGluZyBjb250cm9s
IG1lbW9yeSBsZWFrcy4KPiA+IC0gQSBsZWFrIG9mIHRoZSBNMk0gY29udGV4dCBpZiB2ZGVjX2lu
aXRfY3RybHMoKSBmYWlsZWQuCj4gPgo+ID4gVGhlIGVycm9yIGxhYmVscyBpbiB2ZGVjX29wZW4o
KSBoYXZlIGJlZW4gcmVvcmRlcmVkIHRvIGVuc3VyZSBhIHByb3Blcgo+ID4gTGFzdC1Jbi1GaXJz
dC1PdXQgKExJRk8pIHRlYXJkb3duIG9mIGFsbCBpbml0aWFsaXplZCByZXNvdXJjZXMuCj4gPgo+
ID4gVGhpcyB3YXMgaWRlbnRpZmllZCB2aWEga21lbWxlYWs6Cj4gPiB1bnJlZmVyZW5jZWQgb2Jq
ZWN0IDB4ZmZmZjAwMDAyMDVkNjg3OCAoc2l6ZSA4KToKPiA+ICAgY29tbSAidjRsX2lkIiwgcGlk
IDUyODksIGppZmZpZXMgNDI5NDkzODU4MAo+ID4gICBoZXggZHVtcCAoZmlyc3QgOCBieXRlcyk6
Cj4gPiAgICAgNDAgZDIgNDkgMTggMDAgMDAgZmYgZmYgICAgICAgICAgICAgICAgICAgICAgICAg
IEAuSS4uLi4uCj4gPiAgIGJhY2t0cmFjZSAoY3JjIGQzMjA0NTk5KToKPiA+ICAgICBrbWVtbGVh
a19hbGxvYysweGM4LzB4ZjAKPiA+ICAgICBfX2t2bWFsbG9jX25vZGVfbm9wcm9mKzB4NjBjLzB4
ODUwCj4gPiAgICAgdjRsMl9jdHJsX2hhbmRsZXJfaW5pdF9jbGFzcysweDFiNC8weDJlOCBbdmlk
ZW9kZXZdCj4gPiAgICAgdmRlY19vcGVuKzB4MWY0LzB4Nzg4IFttZXNvbl92ZGVjXQo+ID4gICAg
IHY0bDJfb3BlbisweDE0NC8weDQ2MCBbdmlkZW9kZXZdCj4gPiAgICAgY2hyZGV2X29wZW4rMHgx
YWMvMHg1MDAKPiA+ICAgICBkb19kZW50cnlfb3BlbisweDNmMC8weGZlOAo+ID4gICAgIHZmc19v
cGVuKzB4NjgvMHgzMjAKPiA+ICAgICBkb19vcGVuKzB4MmQ4LzB4OWE4Cj4gPiAgICAgcGF0aF9v
cGVuYXQrMHgxZDAvMHg0ZjAKPiA+ICAgICBkb19maWxwX29wZW4rMHgxOTAvMHgzODAKPiA+ICAg
ICBkb19zeXNfb3BlbmF0MisweGY4LzB4MWIwCj4gPiAgICAgX19hcm02NF9zeXNfb3BlbmF0KzB4
MTNjLzB4MWU4Cj4gPiAgICAgaW52b2tlX3N5c2NhbGwrMHhkYy8weDI2OAo+ID4gICAgIGVsMF9z
dmNfY29tbW9uLmNvbnN0cHJvcC4wKzB4MTc4LzB4MjU4Cj4gPiAgICAgZG9fZWwwX3N2YysweDRj
LzB4NzAKPiA+Cj4gPiBDYzogTmljb2xhcyBEdWZyZXNuZSA8bmljb2xhc0BuZHVmcmVzbmUuY2E+
Cj4gPiBGaXhlczogM2U3ZjUxYmQ5NjA3ICgibWVkaWE6IG1lc29uOiBhZGQgdjRsMiBtMm0gdmlk
ZW8gZGVjb2RlciBkcml2ZXIiKQo+ID4gU2lnbmVkLW9mZi1ieTogQW5hbmQgTW9vbiA8bGludXgu
YW1vb25AZ21haWwuY29tPgo+ID4gLS0tCj4gPiB2MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
YWxsLzIwMjYwMzA0MTAwNTU3LjEyNjQ4OC0xLWxpbnV4LmFtb29uQGdtYWlsLmNvbS8KPiA+ICAg
IHRyaWVkIHRvIGFkZHJlc3MgdGhlIGlzc3VlIHJlcG9ydGVkIGJ5IE5pY29sYXMKPiA+ICAgIGlt
cHJvdmUgdGhlIGNvbW1pdCBtZXNzYWdlLgo+ID4gLS0tCj4gPiAgZHJpdmVycy9zdGFnaW5nL21l
ZGlhL21lc29uL3ZkZWMvdmRlYy5jIHwgOSArKysrKystLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwg
NiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL3N0YWdpbmcvbWVkaWEvbWVzb24vdmRlYy92ZGVjLmMKPiA+IGIvZHJpdmVycy9zdGFnaW5n
L21lZGlhL21lc29uL3ZkZWMvdmRlYy5jCj4gPiBpbmRleCA0Yjc3ZWMxYWY1YTc2Li4zYTVlNGVi
ZTBiMzRjIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9zdGFnaW5nL21lZGlhL21lc29uL3ZkZWMv
dmRlYy5jCj4gPiArKysgYi9kcml2ZXJzL3N0YWdpbmcvbWVkaWEvbWVzb24vdmRlYy92ZGVjLmMK
PiA+IEBAIC04NzcsNyArODc3LDcgQEAgc3RhdGljIGludCB2ZGVjX29wZW4oc3RydWN0IGZpbGUg
KmZpbGUpCj4gPiAgICAgICBpZiAoSVNfRVJSKHNlc3MtPm0ybV9kZXYpKSB7Cj4gPiAgICAgICAg
ICAgICAgIGRldl9lcnIoZGV2LCAiRmFpbCB0byB2NGwyX20ybV9pbml0XG4iKTsKPiA+ICAgICAg
ICAgICAgICAgcmV0ID0gUFRSX0VSUihzZXNzLT5tMm1fZGV2KTsKPiA+IC0gICAgICAgICAgICAg
Z290byBlcnJfZnJlZV9zZXNzOwo+ID4gKyAgICAgICAgICAgICBnb3RvIGVycl9tMm1fcmVsZWFz
ZTsKPgo+IElmIG0ybV9kZXYgY3JlYXRpb24gZmFpbGVkLCB3aHkgZG8geW91IHdhbnQgdG8gY2Fs
bCB2NGwyX20ybV9yZWxlYXNlKCkgPwo+CkkgZG9u4oCZdCByZWNhbGwgdGhlIGV4YWN0IGRldGFp
bHMsIGJ1dCB0aGUgY3VycmVudCBoYW5kbGluZyBhcHBlYXJzIGluY29ycmVjdC4KSeKAmXZlIHBy
ZXBhcmVkIHRoZSBmb2xsb3dpbmcgZml4IHRvIHJlc29sdmUgdGhlIGlzc3VlLCBiYXNlZCBvbgpz
YXNoaWtv4oCZcyBzdWdnZXN0aW9uLgoKWzFdIGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNl
dC8yMDI2MDMyMTA2NTQwOC4yMDk3MjMtMS1saW51eC5hbW9vbiU0MGdtYWlsLmNvbQoKLS0tLS04
PC0tLS0tLS0tLS04PC0tLS0tLS0tCiQgZ2l0IGRpZmYgZHJpdmVycy9zdGFnaW5nL21lZGlhL21l
c29uL3ZkZWMvdmRlYy5jCmRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvbWVkaWEvbWVzb24v
dmRlYy92ZGVjLmMKYi9kcml2ZXJzL3N0YWdpbmcvbWVkaWEvbWVzb24vdmRlYy92ZGVjLmMKaW5k
ZXggNGI3N2VjMWFmNWE3Li5hMDM5ZDkyNWMwZmUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvc3RhZ2lu
Zy9tZWRpYS9tZXNvbi92ZGVjL3ZkZWMuYworKysgYi9kcml2ZXJzL3N0YWdpbmcvbWVkaWEvbWVz
b24vdmRlYy92ZGVjLmMKQEAgLTg4OSw3ICs4ODksNyBAQCBzdGF0aWMgaW50IHZkZWNfb3Blbihz
dHJ1Y3QgZmlsZSAqZmlsZSkKCiAgICAgICAgcmV0ID0gdmRlY19pbml0X2N0cmxzKHNlc3MpOwog
ICAgICAgIGlmIChyZXQpCi0gICAgICAgICAgICAgICBnb3RvIGVycl9tMm1fcmVsZWFzZTsKKyAg
ICAgICAgICAgICAgIGdvdG8gZXJyX20ybV9jdHhfcmVsZWFzZTsKCiAgICAgICAgc2Vzcy0+cGl4
Zm10X2NhcCA9IGZvcm1hdHNbMF0ucGl4Zm10c19jYXBbMF07CiAgICAgICAgc2Vzcy0+Zm10X291
dCA9ICZmb3JtYXRzWzBdOwpAQCAtOTEzLDYgKzkxMyw4IEBAIHN0YXRpYyBpbnQgdmRlY19vcGVu
KHN0cnVjdCBmaWxlICpmaWxlKQoKICAgICAgICByZXR1cm4gMDsKCitlcnJfbTJtX2N0eF9yZWxl
YXNlOgorICAgICAgIHY0bDJfbTJtX2N0eF9yZWxlYXNlKHNlc3MtPm0ybV9jdHgpOwogZXJyX20y
bV9yZWxlYXNlOgogICAgICAgIHY0bDJfbTJtX3JlbGVhc2Uoc2Vzcy0+bTJtX2Rldik7CiBlcnJf
ZnJlZV9zZXNzOgotLS0tLTg8LS0tLS0tLS0tLTg8LS0tLS0tLS0KClRoYW5rcwotQW5hbmQKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9n
aWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
