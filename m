Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8284CD4F54
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 May 2026 05:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NRodRHzkWSTyUihVgX2EUpogpBhTvPzBc9Vyz8hs1q4=; b=J6S3i+chbciKl8
	hy6dQ1tnXRrVwUdyZAcr6TrRw6aTUzY5TnCNG6zdXS3RTKd1JfG01iI6u1wmmZoqIdvXdlXJXWN2h
	IAZVSQgsqav9tXyHMFd94JuMbr+OoX6am+wZwXh4xTAG4LS0VZzWe2BB3ZDBwCeCIY2lTFleLPjW3
	Z95A7JZ5FqYbBMTR4F7BGDjgWRDTKSz+8O6AKkTB/n6qPbibdL7SNhPdjk+SDMy0pqcn17eDhrsyD
	FJ22gHh4B7DpD9N9cTlTD7+NQGeEVuE+B2MyOcQ7WjAzRQEoyeqDK079ftCtZsusslTNHEeknNPKG
	uLK7XcwVMtggVe9A1Pjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPZkl-00000003aiv-0A46;
	Wed, 20 May 2026 05:45:59 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPZkg-00000003aiJ-1l6W
	for linux-amlogic@lists.infradead.org;
	Wed, 20 May 2026 05:45:57 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-67929ff6dbfso7299421a12.2
        for <linux-amlogic@lists.infradead.org>; Tue, 19 May 2026 22:45:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779255952; cv=none;
        d=google.com; s=arc-20240605;
        b=Puo03HLhI31/KsUQ+2Kjcwnjfm9/FE2Wh9pv7Rys0mcpYOpB6A9HzGGmkJUTZV2oyB
         Qr9/1rlkadWRaUK9AZ46h6sz0pWTHBDg0t5DvqjmmyvXFsTf+pBlncWtLNpOWOH5H0Q0
         s9/+k/vRw2v5KZ9YdWCWMlg3pNA0uLLtACrJxTASTs7IXNjspqi+us6lWWIC0Os/fY8l
         o4X/3JYLZlmcu3YP789x538RaK28YEpD1tQePwM61/KLYVeor//oEXorlD5dqrfqFxck
         FONN5Yt2MtmO43bqZrGbeU4nkNoagkD0eSPJWOm/nbFf/r0yhw8HnxmG3/G24mzR3KLZ
         C8ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=L7xIz3gLUx337iHMZn9kR2NfXnQ7+wf5o2+izT401Pw=;
        fh=ouXvSjf5SmEmNeimx6xyG+CKjdQvC3UxbsGBNR8v92o=;
        b=TUAGjyKP/kKkcQOyt4z7wCxo1X9ux2E+F0+7p37e8fHLCw7FfKVrMpY8yPlyazl8cm
         CKtg+KaPVBx3BJKkYUMifMn1m7Botob1rH56Yh4aC8AVHAI85SK6fzu47mkAoRs+euOd
         sUdrh74koasTdamV4baRt/Wn3axiJ/dw6UtXFZRZgMjDb/WBv9VMVD0gJLBSrwd/lIsH
         U4cCwbsUyxYQdRTFxqT2ttvVgSiR4/jW/4Gs9BnqlJoidNQpiJOvKLRsJLfZX6Ve3MU0
         JG1T3eJiWlsAQLdpAURsne3rG2NKnRVp+K9teNkZccTD9lR51lIvND6LZNnF0MvL+oiG
         AOGQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779255952; x=1779860752; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L7xIz3gLUx337iHMZn9kR2NfXnQ7+wf5o2+izT401Pw=;
        b=pMFEys20NfTpIQVFMSFmU6Qn5bmT1DsSPWwnt+Zlw3TMlFGdd/M9lRRwmuC+GaiFw5
         TqA4HmdzJMpdSzCV+oVQP5wCZVnLaJYfEOmJyFLmcuEzHgeLnSCfoJg9XMs7V1j7eLtQ
         9FRui7YmZB17bXAt0fjopcr468P95uoSDHJvqCWz14k8+3HH32HPBrODK6iGVGFqSCzL
         LFHae64BDnPKOrsMGCGiGAVwpYKCTSYm+lRsQaaUAZGYOQMA7bKWtJ20RquC5UhHnRia
         yick/uSTEgHBZvTTJtdDSrxt5+JyYW9WwvVCIbzGyuffXc/dBlrtcH4f2hKL5l4lxFIM
         WV0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779255952; x=1779860752;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L7xIz3gLUx337iHMZn9kR2NfXnQ7+wf5o2+izT401Pw=;
        b=A2D5FuQHTx9Z8LzVmg2n0ogLe2oA4/MlQMnAdAAkEdtKB/6WhY93mQUDV+Vqwzp5Rw
         hdvhwlYtCgbXG/ctp83PvCIxQqcEcxkti7KevbIiBoZvaMFGcFtlcCjeecatuiFwO0uK
         wwOeSBTqnsDJvl6fl9Mm3WmXEOlENA8jreVcTYm9LcKpM1IjACROZhlNBjMtMAXBT2/G
         rp8tgwH/nT4Z4Epni8wj25g+u8eovF2tz7jnSRGasZ01HOSeiq2wHq6KQ3JW28eegwYy
         6fT2hSW48dQLQhCNZFNLkedInm4PI6tlvB5W76erlCM3HiD8TEkT4vJbEEl4u7zjwrod
         /CKg==
X-Gm-Message-State: AOJu0YwGScPTVVN6A5dby6fVoQWsMcNhjTt16i2d2D1WLxGTm79ciijg
	TlubA8GSOhfjzHBsTeKTACpWOT84/1JKxRYVyr8Vz4HmLRnzRLFZjBkAVlYHdf/lWvOXCT5q1P+
	CRm6D3wo8exBPWRs32xsVqDbMiUnkZg8qtzLf
X-Gm-Gg: Acq92OH2k7uA1Np4ihR4p3N2clsF3Km3qi7uOX3z2XlCGrz5SnoUa+OyvT4QhgjZUXj
	SvprGdAdxS/sKaonAjn9GEQzyRt0cc0QoCVCu0jGjcgBxUJkPyI9nta/d51zcaE5htgrZKO+gth
	cS7EK5XI9L5TD0ofu1GDV1wA/fOlwVjTK24U/GgCJOzZxVJurVWbR3h7DCeApNdhSIt49VC5t9p
	56xC1Ad68mjD02MUt4QkDr21O6y18aj63BgJNBMGRBcjMn6W9k3howGR2J5hvCxPUAbhha0dSdE
	iC+fDw==
X-Received: by 2002:a17:907:971b:b0:bd8:6cda:50b8 with SMTP id
 a640c23a62f3a-bd86cda67a5mr597450766b.43.1779255952194; Tue, 19 May 2026
 22:45:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260520044046.7553-1-linux.amoon@gmail.com> <20260520045905.6ACBA1F000E9@smtp.kernel.org>
In-Reply-To: <20260520045905.6ACBA1F000E9@smtp.kernel.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Wed, 20 May 2026 11:15:34 +0530
X-Gm-Features: AVHnY4LHH1gqrq6YciQlOU1NJ2KSNPs18Yau2V93ytKcb2CbD-Htq78PbA-CKBM
Message-ID: <CANAwSgScmdtObKtTr7A52y5rodPd6uCgVa1m5o+sD7omVDgKLw@mail.gmail.com>
Subject: Re: [PATCH v3] media: meson: vdec: Fix memory leak in error path of vdec_open
To: sashiko-reviews@lists.linux.dev
Cc: linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_224556_396030_FDABE9A1 
X-CRM114-Status: GOOD (  26.81  )
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

SGkgU2FzaGlrbywKCk9uIFdlZCwgMjAgTWF5IDIwMjYgYXQgMTA6MjksIDxzYXNoaWtvLWJvdEBr
ZXJuZWwub3JnPiB3cm90ZToKPgo+IFRoYW5rIHlvdSBmb3IgeW91ciBjb250cmlidXRpb24hIFNh
c2hpa28gQUkgcmV2aWV3IGZvdW5kIDMgcG90ZW50aWFsIGlzc3VlKHMpIHRvIGNvbnNpZGVyOgpU
aGFua3MgZm9yIHlvdXIgcmV2aWV3IGNvbW1lbnRzCj4KPiBQcmUtZXhpc3RpbmcgaXNzdWVzOgo+
IC0gW0NyaXRpY2FsXSBUaGUgYHNlc3MtPmVzcGFyc2VyX3F1ZXVlX3dvcmtgIHdvcmsgaXRlbSBp
cyBub3QgY2FuY2VsZWQgYmVmb3JlIGZyZWVpbmcgdGhlIHNlc3Npb24gY29udGV4dCwgbGVhZGlu
ZyB0byBhIHBvdGVudGlhbCBVc2UtQWZ0ZXItRnJlZSB2dWxuZXJhYmlsaXR5Lgo+IC0gW0hpZ2hd
IFRoZSBwYXRjaCBhdHRlbXB0cyB0byBmaXggYSBtZW1vcnkgbGVhayByZXBvcnRlZCBieSBrbWVt
bGVhaywgYnV0IG1pc2RpYWdub3NlcyB0aGUgcm9vdCBjYXVzZSBhbmQgbGVhdmVzIHRoZSBwcmlt
YXJ5IG1lbW9yeSBsZWFrICh0aGUgVjRMMiBjb250cm9sIGhhbmRsZXIpIHVucmVzb2x2ZWQuCj4g
LSBbSGlnaF0gVGhlIGRyaXZlciBkb2VzIG5vdCB2ZXJpZnkgaWYgYGt0aHJlYWRfcnVuKClgIHJl
dHVybnMgYW4gYEVSUl9QVFJgLCBsZWFkaW5nIHRvIGEga2VybmVsIHBhbmljIHdoZW4gYGt0aHJl
YWRfc3RvcCgpYCBpcyBjYWxsZWQuCj4gLS0KPgo+IGNvbW1pdCBhY2NjYzRmYzAyZmU1ZTFiZTBj
NTQ1ZDE3MjIxNzk2NjdjMDc4NDc1Cj4gQXV0aG9yOiBBbmFuZCBNb29uIDxsaW51eC5hbW9vbkBn
bWFpbC5jb20+Cj4KPiBtZWRpYTogbWVzb246IHZkZWM6IEZpeCBtZW1vcnkgbGVhayBpbiBlcnJv
ciBwYXRoIG9mIHZkZWNfb3Blbgo+Cj4gVGhpcyBjb21taXQgaW50cm9kdWNlcyBhIHByb3BlciBl
cnJfbTJtX2N0eF9yZWxlYXNlIGxhYmVsIGluIHRoZQo+IHZkZWNfb3BlbiBmdW5jdGlvbi4gSXQg
ZW5zdXJlcyB2NGwyX20ybV9jdHhfcmVsZWFzZSBpcyBjYWxsZWQgd2hlbgo+IHZkZWNfaW5pdF9j
dHJscyBmYWlscywgcHJldmVudGluZyBhIG1lbW9yeSBsZWFrIG9mIHRoZSBtMm0gY29udGV4dC4K
Pgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9tZWRpYS9tZXNvbi92ZGVjL3ZkZWMu
YyBiL2RyaXZlcnMvc3RhZ2luZy9tZWRpYS9tZXNvbi92ZGVjL3ZkZWMuYwo+ID4gaW5kZXggNGI3
N2VjMWFmNWE3Ni4uYTAzOWQ5MjVjMGZlNSAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvc3RhZ2lu
Zy9tZWRpYS9tZXNvbi92ZGVjL3ZkZWMuYwo+ID4gKysrIGIvZHJpdmVycy9zdGFnaW5nL21lZGlh
L21lc29uL3ZkZWMvdmRlYy5jCj4gPiBAQCAtODg5LDcgKzg4OSw3IEBAIHN0YXRpYyBpbnQgdmRl
Y19vcGVuKHN0cnVjdCBmaWxlICpmaWxlKQo+ID4KPiA+ICAgICAgIHJldCA9IHZkZWNfaW5pdF9j
dHJscyhzZXNzKTsKPiA+ICAgICAgIGlmIChyZXQpCj4gPiAtICAgICAgICAgICAgIGdvdG8gZXJy
X20ybV9yZWxlYXNlOwo+ID4gKyAgICAgICAgICAgICBnb3RvIGVycl9tMm1fY3R4X3JlbGVhc2U7
Cj4KPiBbU2V2ZXJpdHk6IEhpZ2hdCj4gVGhpcyBpc24ndCBhIGJ1ZyBpbnRyb2R1Y2VkIGJ5IHRo
aXMgcGF0Y2gsIGJ1dCBkb2VzIHZkZWNfY2xvc2UoKSBwcm9wZXJseQo+IGZyZWUgdGhlIHY0bDIg
Y29udHJvbCBoYW5kbGVyIG1lbW9yeSBhbGxvY2F0ZWQgYnkgdmRlY19pbml0X2N0cmxzKCkgaGVy
ZT8KPgo+IFdoaWxlIHRoaXMgcGF0Y2ggZml4ZXMgdGhlIG0ybSBjb250ZXh0IGxlYWsgb24gdGhl
IGVycm9yIHBhdGgsIGlmCj4gdmRlY19jbG9zZSgpIGZhaWxzIHRvIGNhbGwgdjRsMl9jdHJsX2hh
bmRsZXJfZnJlZSgmc2Vzcy0+Y3RybF9oYW5kbGVyKSwKPiBjb3VsZCB0aGlzIGNvbnRyb2wgaGFu
ZGxlciBtZW1vcnkgc3RpbGwgbGVhayBvbiBldmVyeSBzdWNjZXNzZnVsIG9wZW4gYW5kCj4gY2xv
c2UgY3ljbGU/Cj4KPiBbU2V2ZXJpdHk6IENyaXRpY2FsXQo+IFRoaXMgaXMgYSBwcmUtZXhpc3Rp
bmcgaXNzdWUsIGJ1dCBpcyB0aGUgc2Vzcy0+ZXNwYXJzZXJfcXVldWVfd29yayBpdGVtCj4gY2Fu
Y2VsZWQgYmVmb3JlIGZyZWVpbmcgdGhlIHNlc3Npb24gY29udGV4dD8KPgo+IFRoZSB3b3JrIGl0
ZW0gaXMgaW5pdGlhbGl6ZWQgaW4gdmRlY19vcGVuKCk6Cj4KPiB2ZGVjX29wZW4oKSB7Cj4gICAg
IC4uLgo+ICAgICBJTklUX1dPUksoJnNlc3MtPmVzcGFyc2VyX3F1ZXVlX3dvcmssIGVzcGFyc2Vy
X3F1ZXVlX2FsbF9zcmMpOwo+ICAgICAuLi4KPiB9Cj4KPiBJZiB2ZGVjX2Nsb3NlKCkgY2FsbHMg
a2ZyZWUoc2Vzcykgd2l0aG91dCBmaXJzdCBzdG9wcGluZyBvciBzeW5jaHJvbml6aW5nCj4gd2l0
aCB0aGlzIGJhY2tncm91bmQgd29yayB2aWEgY2FuY2VsX3dvcmtfc3luYygpLCBjb3VsZCBhIGNv
bmN1cnJlbnRseQo+IHJ1bm5pbmcgZXNwYXJzZXJfcXVldWVfYWxsX3NyYygpIGRlcmVmZXJlbmNl
IHRoZSBmcmVlZCBzZXNzIHN0cnVjdHVyZSBhbmQKPiB0cmlnZ2VyIGEgdXNlLWFmdGVyLWZyZWU/
Cj4KPiBbU2V2ZXJpdHk6IEhpZ2hdCj4gVGhpcyBpc24ndCBhIGJ1ZyBpbnRyb2R1Y2VkIGJ5IHRo
aXMgcGF0Y2gsIGJ1dCBkb2VzIHRoZSBkcml2ZXIgdmVyaWZ5IGlmCj4ga3RocmVhZF9ydW4oKSBy
ZXR1cm5zIGFuIEVSUl9QVFIgd2hlbiBzdGFydGluZyB0aGUgcmVjeWNsZSB0aHJlYWQ/Cj4KPiBJ
ZiB0aHJlYWQgY3JlYXRpb24gZmFpbHMgaW4gdmRlY19zdGFydF9zdHJlYW1pbmcoKSBhbmQgcmV0
dXJucyBhbiBFUlJfUFRSLAo+IGNvdWxkIGEgbGF0ZXIgY2FsbCB0byBrdGhyZWFkX3N0b3Aoc2Vz
cy0+cmVjeWNsZV90aHJlYWQpIGluCj4gdmRlY19zdG9wX3N0cmVhbWluZygpIGF0dGVtcHQgdG8g
ZGVyZWZlcmVuY2UgdGhhdCBFUlJfUFRSIGFuZCBjYXVzZSBhCj4ga2VybmVsIHBhbmljPwo+Ckkg
d2lsbCB0cnkgdG8gYWRkcmVzcyB0aGVzZSBpc3N1ZXMgaW4gdGhlIG5leHQgdmVyc2lvbi4KCj4g
LS0KPiBTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQv
MjAyNjA1MjAwNDQwNDYuNzU1My0xLWxpbnV4LmFtb29uQGdtYWlsLmNvbT9wYXJ0PTEKClRoYW5r
cwotQW5hbmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFt
bG9naWMK
