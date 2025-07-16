Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12A75C83F22
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Jul 2025 16:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WwRaQkfZCVH1+4tQ3j11EJDMXioZWTBKjk2wlcAUmo8=; b=AbwNiy3COrqJ34
	J+gbqoJQhayTCDFl7UiA/XnhA/kwoa4zHhgVKbyqLyceED2vd7zuSQi+9fKHwnoaiBI5D1fFI/Lk5
	3K9CS7dloimqNr/2VFtvESNsJnV2aRcthnUX2M1h3bK5junp5hnAzpEcGhh0A4KIHb/K3mXLeIbjo
	iyUl5wV+hdTk4B7yomalhfMacbQHPuOInb57z+hxFxvPtQkxyOyu4Ph5o7ApoiCmRQVYj5IVMXxO/
	wzCD7mfO7/xJ16uoues55mkw4qHG2TOqZ8NFs/RJPJvKv0h+pf5lTa4+4RFoO0BvTUjd9Js3/TwRA
	c2rGR5FaXhP1rmUEIfWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc4yZ-00000008BbN-2TXd;
	Wed, 16 Jul 2025 16:27:23 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc4xP-00000008BQG-3H0B
	for linux-amlogic@lists.infradead.org;
	Wed, 16 Jul 2025 16:26:13 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-313154270bbso100748a91.2
        for <linux-amlogic@lists.infradead.org>; Wed, 16 Jul 2025 09:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lessconfused.com; s=lessconfused; t=1752683170; x=1753287970; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L/zdp78iLIc3P2fVZKQ4uEJjSCWzim0zw7IS4uVdvyY=;
        b=S2ngHXiwvn7nsCO5WWA5PanDxq2CsI7xJsZgW9I/25R6pow/bKBWiOuVE1MhLXiwF5
         cFHVf254+bumHSI2odKdVqOrg9XkNDpYI+4mEbNGaBKn/+xE94J+VqwK5RVdbXqI6imk
         vt1QWS2lDpQ/01F6kICsNeI+E95PQWSvi5gRQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752683170; x=1753287970;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L/zdp78iLIc3P2fVZKQ4uEJjSCWzim0zw7IS4uVdvyY=;
        b=sc0JOagq4amACWnmgCqATvieWkh2cP/vsdCP7VOqQTIYOKHZ/p01vsHxnYEBK2olf5
         EVcmw42IsSvIu3s75S3P+2cYTZtZ43i83ASxW1AslRx5e2HELUNZVMRLAjfEN8hoVVKh
         4hZJgzrSNByLgnKaNyLOHMTEHdaJw9q7+fMPqzz4ku1LR+9DCMiL3611mqDRyP9popyM
         GwhnEhawwIkayYlo3ntikb+t6JAv/6YUpl2N88eG1UjpKJXHdS/69v/y+OHYqnkSqeje
         nTbdeqgUtB6cIo+qfZtKsgQVnaM0jcvumN93SJNCNJZnlBFG7RLYA5Mm0v7HVNzYr60H
         qt+A==
X-Forwarded-Encrypted: i=1; AJvYcCVdAICOM+md0O1ImjFSpYkmv93LQ5RHcqB+JabO6VLwog08r1r1HmHBAIO5O+mheUEaD7Qki9/lIS4epwKh@lists.infradead.org
X-Gm-Message-State: AOJu0Ywil5LaMdHkbqVSBSDrgMwgH9THPFMOIhjF6uq0FyfFYfGY2dsF
	DZiecWX4A7dTbHxZhKvndSWnwRJTklZpvpZbFwhSTh3ZB92fxCzW/j6CkvNPq7ZTRQshUDAIw0m
	EO7OzkzVYTVhyEUneNKYWfc3pDedUGqEWIf7IrmsrwANEGgG5GkXXsag=
X-Gm-Gg: ASbGncs0lgTjBg9GB2JH0rEg4XlIQ5uZ0iBi3o7CexRvENFlN8E+ZoBvXsUPPRTlGSz
	B0F5pkfAisSkkUBga6CbeYBS8leP3qZKcyZsVxxSo+p6zYLaCivz5/LmQqWRtH+rkqRuZMUYgYw
	hSLy0xfgbp4wDfo7J0Rmg2F8ORXXLyx/RBXhhiPKk0Yx2cEH8nnu+XHXZ879uGzM5t9fwyWY8C4
	UOVnKiHElOlaTYd2C60FCPEj4FtYRvTaQaJuA==
X-Google-Smtp-Source: AGHT+IEXLTYLB8rxtv+DljzVrxvv6tPAbP6Q0A+w+KsPDRks8QKJ/HUbgCCkgyjvEFxKjNAw8BAVT3MjLvLHwtKFsLo=
X-Received: by 2002:a17:90b:5485:b0:311:b0ec:135b with SMTP id
 98e67ed59e1d1-31c9f47c799mr4745522a91.24.1752683170555; Wed, 16 Jul 2025
 09:26:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250704-spisg-v4-0-6b731dfbe610@amlogic.com> <20250704-spisg-v4-2-6b731dfbe610@amlogic.com>
 <3ac88119-9980-42df-9e1c-c0ec30bbaadd@sirena.org.uk> <55ecc836-7fed-44d5-aa4b-94bc17894ef0@amlogic.com>
 <aG0hU5nbjLjTWS6p@finisterre.sirena.org.uk> <03b7abe4-95d5-44f4-96ec-989c736e58b0@amlogic.com>
 <b42995ed-d1d5-4624-88ab-4ba1b6f54ebe@amlogic.com>
In-Reply-To: <b42995ed-d1d5-4624-88ab-4ba1b6f54ebe@amlogic.com>
From: Da Xue <da@lessconfused.com>
Date: Wed, 16 Jul 2025 12:25:58 -0400
X-Gm-Features: Ac12FXxfJqnSMbzdrh4O-b8M583ttxspC2CCEaICBQtOJYZg7EeSoZLGxlH_yFM
Message-ID: <CACdvmAizF9OcdBi=Qw38NH+YHT=4edQzJGuQNvxm+m5xqZE0nQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] spi: Add Amlogic SPISG driver
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Mark Brown <broonie@kernel.org>, Sunny Luo <sunny.luo@amlogic.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-amlogic@lists.infradead.org, linux-spi@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_092611_830668_D69BD7AD 
X-CRM114-Status: GOOD (  31.85  )
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

T24gV2VkLCBKdWwgMTYsIDIwMjUgYXQgNTozMOKAr0FNIFhpYW53ZWkgWmhhbyA8eGlhbndlaS56
aGFvQGFtbG9naWMuY29tPiB3cm90ZToKPgo+IEhpIE1hcmssCj4KPiBPbiAyMDI1LzcvOSAxNTow
MiwgWGlhbndlaSBaaGFvIHdyb3RlOgo+ID4gSGkgTWFyaywKPiA+ICAgICBUaGFua3MgZm9yIHlv
dXIgYWR2aWNlLgo+ID4KPiA+IE9uIDIwMjUvNy84IDIxOjUwLCBNYXJrIEJyb3duIHdyb3RlOgo+
ID4+IFN1YmplY3Q6Cj4gPj4gUmU6IFtQQVRDSCB2NCAyLzNdIHNwaTogQWRkIEFtbG9naWMgU1BJ
U0cgZHJpdmVyCj4gPj4gRnJvbToKPiA+PiBNYXJrIEJyb3duIDxicm9vbmllQGtlcm5lbC5vcmc+
Cj4gPj4gRGF0ZToKPiA+PiAyMDI1LzcvOCAyMTo1MAo+ID4+Cj4gPj4gVG86Cj4gPj4gWGlhbndl
aSBaaGFvIDx4aWFud2VpLnpoYW9AYW1sb2dpYy5jb20+Cj4gPj4gQ0M6Cj4gPj4gU3VubnkgTHVv
IDxzdW5ueS5sdW9AYW1sb2dpYy5jb20+LCBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPiwK
PiA+PiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprK2R0QGtlcm5lbC5vcmc+LCBDb25vciBEb29s
ZXkKPiA+PiA8Y29ub3IrZHRAa2VybmVsLm9yZz4sIGxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFk
ZWFkLm9yZywKPiA+PiBsaW51eC1zcGlAdmdlci5rZXJuZWwub3JnLCBkZXZpY2V0cmVlQHZnZXIu
a2VybmVsLm9yZywKPiA+PiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnCj4gPj4KPiA+Pgo+
ID4+Cj4gPj4gT24gVHVlLCBKdWwgMDgsIDIwMjUgYXQgMDY6MzQ6MDJQTSArMDgwMCwgWGlhbndl
aSBaaGFvIHdyb3RlOgo+ID4+PiBPbiAyMDI1LzcvNyAyMTowNSwgTWFyayBCcm93biB3cm90ZToK
PiA+Pj4+IElzIGl0IHdvcnRoIGhhdmluZyBhIGNvcHlicmVhayBzdWNoIHRoYXQgc21hbGxlciB0
cmFuc2ZlcnMgYXJlIGRvbmUKPiA+Pj4+IHVzaW5nIFBJTz8gIFdpdGggYSBsb3Qgb2YgY29udHJv
bGxlcnMgdGhhdCBpbmNyZWFzZXMgcGVyZm9ybWFuY2UgZHVlIHRvCj4gPj4+PiB0aGUgZXh0cmEg
b3ZlcmhlYWQgb2Ygc2V0dGluZyB1cCBETUEsIHRhbGtpbmcgdG8gdGhlIERNQSBhbmQgaW50ZXJy
dXB0Cj4gPj4+PiBjb250cm9sbGVycyBjYW4gYmUgYXMgZXhwZW5zaXZlIGFzIGRpcmVjdGx5IGFj
Y2Vzc2luZyB0aGUgRklGT3MuCj4gPj4+IElmIHRoZSBkYXRhIHZvbHVtZSBvZiBhIHNpbmdsZSB0
cmFuc2ZlciAoeGZlcikgaXMgc21hbGwsIFBJTyBtb2RlCj4gPj4+IGRvZXMgb2ZmZXIKPiA+Pj4g
c29tZSBhZHZhbnRhZ2VzLiBIb3dldmVyLCBzaW5jZSBQSU8gcmVxdWlyZXMgdGhlIENQVSB0byB3
YWl0IGluIGEKPiA+Pj4gYnVzeSBsb29wCj4gPj4+IGZvciB0aGUgdHJhbnNmZXIgdG8gY29tcGxl
dGUsIGl0IGNvbnRpbnVvdXNseSBvY2N1cGllcyBDUFUgcmVzb3VyY2VzLgo+ID4+PiBBcyBhCj4g
Pj4+IHJlc3VsdCwgaXRzIGFkdmFudGFnZXMgYXJlIG5vdCBwYXJ0aWN1bGFybHkgc2lnbmlmaWNh
bnQuCj4gPj4gVGhlIENQVSBvdmVyaGVhZCB0ZW5kcyB0byBiZSBoaWdoZXIgKHlvdSBjYW4gYXZv
aWQgc29tZSBvZiBpdCB3aXRoIGEKPiA+PiBkZWFkIHJlY2tvbmluZyBzbGVlcCksIGJ1dCB0aGUg
bGF0ZW5jeSB2YXN0bHkgaW1wcm92ZWQgd2hpY2ggZm9yIG1hbnkKPiA+PiBhcHBsaWNhdGlvbnMg
aXMgYSB3b3J0aHdoaWxlIGFkdmFudGFnZS4gIEl0IHRlbmRzIHRvIGJlIHRoaW5ncyBsaWtlCj4g
Pj4gYWNjZXNzZXMgdG8gb25lIG9yIHR3byByZWdpc3RlcnMgb24gYSBkZXZpY2Ugd2l0aCByZWdp
c3RlcnMgd2hlcmUgdGhpcwo+ID4+IHdpbnMsIDE2IGJ5dGVzIG9yIGxvd2VyIHdvdWxkIGJlIGEg
Y29tbW9uIG51bWJlciBvZmYgdGhlIHRvcCBvZiBteSBoZWFkLgo+ID4+Cj4gPj4+IElmIFBJTyBp
cyB0byBiZSBpbXBsZW1lbnRlZCwgaXQgY2FuIG9ubHkgaGFuZGxlIG9uZSB0cmFuc2ZlciBhdCBh
Cj4gPj4+IHRpbWUgKHZpYQo+ID4+PiB0cmFuc2Zlcl9vbmUpLCBhbmQgbm90IGVudGlyZSBtZXNz
YWdlcyAod2hpY2ggY29uc2lzdCBvZiBtdWx0aXBsZQo+ID4+PiB0cmFuc2ZlcnMpLiBJbiBjb250
cmFzdCwgd2hlbiBwcm9jZXNzaW5nIG1lc3NhZ2VzLCB0aGUgU1BJIGNvbnRyb2xsZXIKPiA+Pj4g
Y2FuCj4gPj4+IGhhbmRsZSB0aGUgZW50aXJlIHNlcXVlbmNlIGluIG9uZSBnbywgd2hpY2ggYWxz
byBwcm92aWRlcyBjZXJ0YWluCj4gPj4+IGJlbmVmaXRzLgo+ID4+IEl0J3MgcHJvYmFibHkgd29y
dGggYWRkaW5nIHNvbWV0aGluZyB0byB0aGUgZnJhbWV3b3JrIHRvIGJlIGFibGUgdG8gdGFrZQo+
ID4+IGEgZGVjaXNpb24gYXQgdGhlIG1lc3NhZ2UgbGV2ZWwsIGZvciB3cml0ZXMgdGhpcyB0ZW5k
cyB0byBhbGwgZmFsbCBvdXQKPiA+PiBuYXR1cmFsbHkgc2luY2UgdGhlIHdyaXRlIHdpbGwgdGVu
ZCB0byBiZSBhIHNpbmdsZSB0cmFuc2ZlciBhbnl3YXkuCj4gPgo+ID4gSSB3aWxsIHRyeSB0byBh
ZGQgbmV3IEFQSSBtZXNzYWdlX2Nhbl9kbWEgZm9yIGZyYW1ld29yaywgYW5kIGltcGxlbWVudAo+
ID4gUElPIGZvciBtZXNzYWdlLgo+ID4KPgo+IEkgdHJpZWQgdG8gaW1wbGVtZW50IFBJTyBtb2Rl
IGluIHRoZSBkcml2ZXIsIGJ1dCBpdCB0dXJuZWQgb3V0IHRvIGJlIHRvbwo+IHNsb3cuIER1ZSB0
byB0aGUgbGFjayBvZiBhbiBpbnRlcm5hbCBGSUZPLCBkYXRhIGNvdWxkIG9ubHkgYmUKPiB0cmFu
c21pdHRlZCBvbmUgd29yZCBhdCBhIHRpbWUsIGFuZCBlYWNoIHRyYW5zbWlzc2lvbiByZXF1aXJl
ZAo+IHJlY29uZmlndXJpbmcgdGhlIGNvcnJlc3BvbmRpbmcgcmVnaXN0ZXJzLiBBcyBhIHJlc3Vs
dCwgdGhlIGVmZmljaWVuY3kKPiB3YXMgcXVpdGUgbG93LgoKT25lIG9mIHRoZSB1c2UgY2FzZXMg
aXMgZm9yIFNQSS1iYXNlZCBkaXNwbGF5cyBhbmQgaXQgdHJhbnNmZXJzIG9uZQp3b3JkIHZpYSBQ
SU8gYW5kIHRoZW4gYSBsb3Qgb2Ygd29yZHMgdmlhIERNQS4gSSBzZWUgUElPIGFzIGJlbmVmaWNp
YWwKZm9yIHRoaXMgY29tbW9uIHVzZSBjYXNlIGZvciBTUEkuClRoZSBlZmZpY2llbmN5IGRvZXMg
bm90IG5lZWQgdG8gYmUgaGlnaCBmb3IgdGhpcyBvbmUgd29yZCBidXQgcmVkdWNpbmcKdGhlIGxh
dGVuY3kgZm9yIERNQSBzZXR1cCBpcyBhIHNpZ25pZmljYW50IGdhaW4uCgo+Cj4gVGhlIG9ubHkg
c2ltcGxpZmljYXRpb25zIHByb3ZpZGVkIGJ5IFBJTyBtb2RlIHdlcmUgaW4gdHdvIGFyZWFzOgo+
Cj4gMS4gVGhlIGFsbG9jYXRpb24gYW5kIHJlbGVhc2Ugb2YgdGhlIHRyYW5zZmVyIGRlc2NyaXB0
b3IKPiAyLiBUaGUgRE1BIG1hcHBpbmcgYW5kIHVubWFwcGluZyBwcm9jZXNzCj4KPiBUaGVyZWZv
cmUsIEkgc3VnZ2VzdCBub3QgaW1wbGVtZW50aW5nIFBJTyBtb2RlIGluIHRoaXMgZHJpdmVyLiBJ
IHdpbGwKPiBkb2N1bWVudCBjbGVhcmx5IGluIHRoZSBjb2RlIHRoYXQgUElPIG1vZGUgaXMgbm90
IHN1cHBvcnRlZCBhbmQgZXhwbGFpbgo+IHRoZSByZWFzb25zIGJlaGluZCB0aGlzIGRlY2lzaW9u
Lgo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBs
aW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdAo+IGxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFk
Lm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
YW1sb2dpYwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1s
b2dpYwo=
