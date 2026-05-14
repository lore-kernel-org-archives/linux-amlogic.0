Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F972CD4F3E
	for <linux-amlogic@archiver.kernel.org>; Thu, 14 May 2026 12:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=apmwW9uiuJeZlR6RO8kAXDV4EqIRWrK8dKc8hg1BOC4=; b=EmaY9FsFay5P11
	oBB8/rodDX/GgHaSY3NhYmYUQnAcpiQ1aMjAznE5XMvOc234UTE0Tu7QI3vcivmrsaRlJX58B425v
	yG7zXEupy3qOKm+DfkFjcW9yh/tRb59SxxgtJSEfxBo5bjArd+/vNTPqNGKhEYjSeyufAc/5FCsYn
	5tnr9qdvHfwB/d+aq2uBMoIU121jILi99EfStIE+qOC+7tL7J5cnlodLQONtTu4W74GbqvdJICgUq
	2HV+vJeKwMwgVlEAJxIFY8NRwvIvwmCM0N6k/iXak875lAlYAIVNm8/Kd2ZYW5tC+LB3vUIjoMIDS
	k6eGJ3OIOYXKKuc7wDAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNVHt-00000005TES-2FxX;
	Thu, 14 May 2026 12:35:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNVHs-00000005TE1-2Irn
	for linux-amlogic@lists.infradead.org;
	Thu, 14 May 2026 12:35:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 980946013B;
	Thu, 14 May 2026 12:35:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31AE7C2BCB3;
	Thu, 14 May 2026 12:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778762135;
	bh=ue0XnE9SvQVuCGe1TZZL3sutQ2TrRfF8XisyxaCg3+4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=B12K8BZe1QW1gaWlTdxhjYG06cGDSHxEJbzZ2kLWxPIT04g9xXyDbrNBFi70WkJxx
	 VUxNMisX1MOUFRgkPHejfBDC///CzSaah3nFxThVHl9bRm5pIaZuofjCxV4SUnoV8h
	 QD3LtrPwYxCQJ3U+pk/Eh/t7KXd/AZhqPy2DE9tnhAwIWbho2yp/OW+hOUI9C5vVqg
	 I01DkpbTl/NlT2WtaI3QpgDT4TsMgbIHU+39X4s1kJ+aaw1vFPiMDICIrHXaDzPUTr
	 Y/OtepAE/nocOCz+Td63YYBK/b8WhYBXa018/uA1XU7aDp3OrmstJlD6NznrAqKyAN
	 +pt2nj9bSj/Zw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v3 5/6] soc: qcom: pmic-glink-altmode: pass down
 HPD_IRQ events
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260513-hpd-irq-events-v3-5-086857017f16@oss.qualcomm.com>
References: <20260513-hpd-irq-events-v3-5-086857017f16@oss.qualcomm.com>
Date: Thu, 14 May 2026 12:35:34 +0000
Message-Id: <20260514123535.31AE7C2BCB3@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIFVzZS1BZnRlci1GcmVl
IG9uIGRldmljZSB1bmJpbmQgZHVlIHRvIHVuY2FuY2VsbGVkIHdvcmtxdWV1ZSBpdGVtcy4KLS0K
CmNvbW1pdCBjOWEwNWZkYjdhZTk1YzU2NTBjY2ZiYmQxMjE5NmM0MTY5ZDJkMWM0CkF1dGhvcjog
RG1pdHJ5IEJhcnlzaGtvdiA8ZG1pdHJ5LmJhcnlzaGtvdkBvc3MucXVhbGNvbW0uY29tPgoKc29j
OiBxY29tOiBwbWljLWdsaW5rLWFsdG1vZGU6IHBhc3MgZG93biBIUERfSVJRIGV2ZW50cwogICAg
ClRoaXMgY29tbWl0IHVwZGF0ZXMgdGhlIFBNSUMgR0xJTksgYWx0bW9kZSBkcml2ZXIgdG8gcGFz
cyBJUlFfSFBEIGV2ZW50cwp0byB0aGUgSFBEIGJyaWRnZS4gVGhpcyBhbGxvd3MgdGhlIGV2ZW50
cyB0byBiZSBkZWxpdmVyZWQgdG8gdGhlIERpc3BsYXlQb3J0CmRyaXZlci4KCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvc29jL3Fjb20vcG1pY19nbGlua19hbHRtb2RlLmMgYi9kcml2ZXJzL3NvYy9x
Y29tL3BtaWNfZ2xpbmtfYWx0bW9kZS5jCj4gLS0tIGEvZHJpdmVycy9zb2MvcWNvbS9wbWljX2ds
aW5rX2FsdG1vZGUuYwo+ICsrKyBiL2RyaXZlcnMvc29jL3Fjb20vcG1pY19nbGlua19hbHRtb2Rl
LmMKPiBAQCAtMzczLDcgKzM3MywxMSBAQCBzdGF0aWMgdm9pZCBwbWljX2dsaW5rX2FsdG1vZGVf
d29ya2VyKHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yaykKPiAgCQllbHNlCj4gIAkJCWNvbm5fc3Rh
dHVzID0gY29ubmVjdG9yX3N0YXR1c19kaXNjb25uZWN0ZWQ7Cj4gIAo+IC0JCWRybV9hdXhfaHBk
X2JyaWRnZV9ub3RpZnkoJmFsdF9wb3J0LT5icmlkZ2UtPmRldiwgY29ubl9zdGF0dXMpOwo+ICsJ
CWRybV9hdXhfaHBkX2JyaWRnZV9ub3RpZnlfZXh0cmEoJmFsdF9wb3J0LT5icmlkZ2UtPmRldiwK
PiArCQkJCQkJY29ubl9zdGF0dXMsCj4gKwkJCQkJCWFsdF9wb3J0LT5ocGRfaXJxID8KPiArCQkJ
CQkJRFJNX0NPTk5FQ1RPUl9EUF9JUlFfSFBEIDoKPiArCQkJCQkJRFJNX0NPTk5FQ1RPUl9OT19F
WFRSQV9TVEFUVVMpOwoKV2hpbGUgcmV2aWV3aW5nIHRoaXMgY2hhbmdlLCBJIG5vdGljZWQgYSBw
cmUtZXhpc3RpbmcgaXNzdWUgd2l0aCB0aGUgbGlmZWN5Y2xlCm9mIHRoaXMgd29yayBpdGVtLgoK
VGhlIGFsdG1vZGUgc3RydWN0dXJlIGlzIGFsbG9jYXRlZCB1c2luZyBkZXZtX2t6YWxsb2MsIGFu
ZCBtdWx0aXBsZSB3b3JrCml0ZW1zIGxpa2UgYWx0X3BvcnQtPndvcmsgYW5kIGFsdG1vZGUtPmVu
YWJsZV93b3JrIGFyZSBpbml0aWFsaXplZCwgYnV0IHRoZXkKYXJlIG5ldmVyIGV4cGxpY2l0bHkg
Y2FuY2VsZWQgZHVyaW5nIGRldmljZSB0ZWFyZG93bi4KCldoZW4gdGhlIGRldmljZSBpcyB1bmJv
dW5kLCBkZXZyZXMgYXV0b21hdGljYWxseSBmcmVlcyB0aGUgYWx0bW9kZSBzdHJ1Y3R1cmUuCklm
IHRoaXMgd29yayBpdGVtIGlzIHBlbmRpbmcgb3IgZXhlY3V0aW5nIGNvbmN1cnJlbnRseSBvbiB0
aGUgc3lzdGVtIHdvcmtxdWV1ZQpkdXJpbmcgdW5iaW5kLCBjb3VsZCBpdCBkZXJlZmVyZW5jZSB0
aGUgZnJlZWQgYWx0bW9kZSBvciBhbHRfcG9ydCBzdHJ1Y3R1cmVzCmFuZCBjYXVzZSBhIHVzZS1h
ZnRlci1mcmVlPwoKU2hvdWxkIGEgY2FuY2VsX3dvcmtfc3luYyBhY3Rpb24gYmUgcmVnaXN0ZXJl
ZCB2aWEgZGV2bV9hZGRfYWN0aW9uX29yX3Jlc2V0CnRvIGVuc3VyZSB0aGVzZSB3b3JrIGl0ZW1z
IGFyZSBmbHVzaGVkIGJlZm9yZSB0aGUgbWVtb3J5IGlzIGZyZWVkPwoKLS0gClNhc2hpa28gQUkg
cmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDUxMy1ocGQtaXJx
LWV2ZW50cy12My0wLTA4Njg1NzAxN2YxNkBvc3MucXVhbGNvbW0uY29tP3BhcnQ9NQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBt
YWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
