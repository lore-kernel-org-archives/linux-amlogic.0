Return-Path: <SRS0=nSb1=BA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7AA6C433F2
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Jul 2020 11:07:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4BF320709
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Jul 2020 11:07:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="o0NWD8H9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fc5wXVio"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4BF320709
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:References:Message-Id:Date:In-Reply-To:From:
	Subject:Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Bw4owudmY2DXsVgGaSiwHCiXufaxobCIBnx6XFFHj04=; b=o0NWD8H9YufkMQeZhHqHHDAnr
	hz1yUhvptB3dJ+nP4Fuw/e4Gufj0iw1LKKI9cbX+2EKwxlAG+A/Ch7+CxGVsFZ7Cvqjb/++GDnfzm
	QDV+j/QvLp/9hW6EdylSsqL0fQMFBUPaZGpnKQABJO4n6rpL6EpMLEaHxfMdwP7VViNAwJrXA6Pa8
	FnydUAagOa1gKwU4+OFJZCRq65Qbyx9ImO/78O7drQJno6pax9OBUU1kuIEyRiH08qsSFqtR3Rc0F
	M25r4M7vXhpEKf1Jz2jkVo7YKkEqtjP/bn+xGTTYCXeIGG1tvRa0l5YOh2kA/9U/mDGSuTFYhUvh3
	RlHe8qYJg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxq7f-0006sM-FA; Tue, 21 Jul 2020 11:07:47 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxq7b-0006qv-G5; Tue, 21 Jul 2020 11:07:44 +0000
Received: by mail-wm1-x341.google.com with SMTP id 17so2456129wmo.1;
 Tue, 21 Jul 2020 04:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=nZyLTGBYU80P+U/XLzVkUfsWKWDdFrBlDOcpYxYd4js=;
 b=Fc5wXVio5CFidsuzIit664RMMlbc2J2nvQux3ajoC6p28t1TpOOcmHED4cmf2RXpyg
 DsUwIVOI3Hc5/PRwk+fJCiOIOfJKlgXHcBabNjndCMJWXOQ60hrGkYK6H1wFOyfkMom5
 jIEJuC32xo2W46/6X2y97BvGdn+V/2El6qD+GyHUcrrVvOwxjNPngcReHd5S8wUgE82X
 u9RVDCmHC2ZMdVKfACprAsN/ctCN+kQqJ6nawf7fMc2ZfVICH7qEa2+PQrqHqmMb7BdP
 /rGLEJJvtsNKJMHJD9CQ7qlRuFSaiJQ9Ky6vgQ6z7sqwdXWj/oc2L4umEtBsqjFFrous
 HBew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=nZyLTGBYU80P+U/XLzVkUfsWKWDdFrBlDOcpYxYd4js=;
 b=QWuuK1D582Nz3idZQG9T2s3at0nQK8U/tTXX/E5MeJMG2Lvzu2s2ZT8mLunGoKRDFX
 l6/5rse/oq0VjxNhLB+AMfCSRjPhKu56zUOwqLX22zF69dxpckcqRCoBtY2bPMudYMpZ
 ucY/6snrMuwrC4XCp2dUTeWKg4izhaXC3qt6tUk31zHeiC7Zd6K6eob8pqROd/yjnAiF
 Jk+xj7qKyNiF2Rnk6N4ysMn7ClCaB/jghajSDi7f7VhKqJqgpNS5UIZHkwZ2x+KRbETt
 /D+jbhBPRqs9U2LlGtcaB1aEDC5ngGKoQnPLjbcDrb/AGI8N6eFN4bz4kGHYOIx9sq5q
 rhUA==
X-Gm-Message-State: AOAM530u1hTrcfx37GF8b7G+upzyqrETOh7w3ejuLpCW8NlkgCFx5UBB
 gpvsHava+E0ue+hLrAMOS0s=
X-Google-Smtp-Source: ABdhPJxB+A27RbNwhEx0EiDOdGaGmkY0YOdfq/izYyLF7dN3XEsn2dEsqMEYjzhWc+gJSIcljKq78w==
X-Received: by 2002:a1c:2d0c:: with SMTP id t12mr3460106wmt.43.1595329662026; 
 Tue, 21 Jul 2020 04:07:42 -0700 (PDT)
Received: from [10.182.202.153] ([87.201.30.26])
 by smtp.gmail.com with ESMTPSA id c24sm12095941wrb.11.2020.07.21.04.07.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 21 Jul 2020 04:07:41 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.14\))
Subject: Re: [PATCH 3/3] arm64: dts: meson: add support for the ODROID-N2+
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <1jo8o98c2c.fsf@starbuckisacylon.baylibre.com>
Date: Tue, 21 Jul 2020 15:07:38 +0400
Message-Id: <BA492513-A6EF-4938-ACB5-EA836379A968@gmail.com>
References: <20200719141034.8403-1-christianshewitt@gmail.com>
 <20200719141034.8403-4-christianshewitt@gmail.com>
 <1jo8o98c2c.fsf@starbuckisacylon.baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: Apple Mail (2.3445.104.14)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_070743_608940_282511AF 
X-CRM114-Status: GOOD (  16.39  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Dongjin Kim <tobetter@hardkernel.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Cj4gT24gMjEgSnVsIDIwMjAsIGF0IDE6MTQgcG0sIEplcm9tZSBCcnVuZXQgPGpicnVuZXRAYmF5
bGlicmUuY29tPiB3cm90ZToKPiAKPiBPbiBTdW4gMTkgSnVsIDIwMjAgYXQgMTY6MTAsIENocmlz
dGlhbiBIZXdpdHQgPGNocmlzdGlhbnNoZXdpdHRAZ21haWwuY29tPiB3cm90ZToKPiAKPj4gSGFy
ZEtlcm5lbCBPRFJPSUQtTjIrIHVzZXMgYW4gQW1sb2dpYyBTOTIyWCByZXYuIEMgY2hpcCBjYXBh
YmxlIG9mIGhpZ2hlcgo+PiBjbG9jayBzcGVlZHMgdGhhbiB0aGUgb3JpZ2luYWwgT0RST0lELU4y
LiBIYXJka2VybmVsIHN1cHBvcnRzIHRoZSBiaWcgY3B1Cj4+IGNsdXN0ZXIgYXQgMi40R0h6IGFu
ZCB0aGUgbGl0dGxlIGNwdSBjbHVzdGVyIGF0IDIuMEdIei4gT3BwIHBvaW50cyBhbmQKPj4gcmVn
dWxhdG9yIGNoYW5nZXNzIGFyZSBmcm9tIHRoZSBIYXJkS2VybmVsIExpbnV4IGtlcm5lbCBzb3Vy
Y2VzLgo+PiAKPj4gU3VnZ2VzdGVkLWJ5OiBEb25namluIEtpbSA8dG9iZXR0ZXJAaGFyZGtlcm5l
bC5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBIZXdpdHQgPGNocmlzdGlhbnNoZXdp
dHRAZ21haWwuY29tPgo+PiAtLS0KPj4gYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL01ha2Vm
aWxlICAgICAgICAgIHwgIDEgKwo+PiAuLi4vZHRzL2FtbG9naWMvbWVzb24tZzEyYi1vZHJvaWQt
bjItcGx1cy5kdHMgfCA1MyArKysrKysrKysrKysrKysrKysrCj4+IDIgZmlsZXMgY2hhbmdlZCwg
NTQgaW5zZXJ0aW9ucygrKQo+PiBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9hcm02NC9ib290L2R0
cy9hbWxvZ2ljL21lc29uLWcxMmItb2Ryb2lkLW4yLXBsdXMuZHRzCj4+IAo+PiBkaWZmIC0tZ2l0
IGEvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL01ha2VmaWxlIGIvYXJjaC9hcm02NC9ib290
L2R0cy9hbWxvZ2ljL01ha2VmaWxlCj4+IGluZGV4IDVjYWM0ZDFkNDg3ZC4uNmRjNTA4YjgwMTMz
IDEwMDY0NAo+PiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvTWFrZWZpbGUKPj4g
KysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL01ha2VmaWxlCj4+IEBAIC04LDYgKzgs
NyBAQCBkdGItJChDT05GSUdfQVJDSF9NRVNPTikgKz0gbWVzb24tZzEyYi1ndGtpbmctcHJvLmR0
Ygo+PiBkdGItJChDT05GSUdfQVJDSF9NRVNPTikgKz0gbWVzb24tZzEyYi1hMzExZC1raGFkYXMt
dmltMy5kdGIKPj4gZHRiLSQoQ09ORklHX0FSQ0hfTUVTT04pICs9IG1lc29uLWcxMmItczkyMngt
a2hhZGFzLXZpbTMuZHRiCj4+IGR0Yi0kKENPTkZJR19BUkNIX01FU09OKSArPSBtZXNvbi1nMTJi
LW9kcm9pZC1uMi5kdGIKPj4gK2R0Yi0kKENPTkZJR19BUkNIX01FU09OKSArPSBtZXNvbi1nMTJi
LW9kcm9pZC1uMi1wbHVzLmR0Ygo+PiBkdGItJChDT05GSUdfQVJDSF9NRVNPTikgKz0gbWVzb24t
ZzEyYi11Z29vcy1hbTYuZHRiCj4+IGR0Yi0kKENPTkZJR19BUkNIX01FU09OKSArPSBtZXNvbi1n
eGJiLWtpaS1wcm8uZHRiCj4+IGR0Yi0kKENPTkZJR19BUkNIX01FU09OKSArPSBtZXNvbi1neGJi
LW5hbm9waS1rMi5kdGIKPj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dp
Yy9tZXNvbi1nMTJiLW9kcm9pZC1uMi1wbHVzLmR0cyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1s
b2dpYy9tZXNvbi1nMTJiLW9kcm9pZC1uMi1wbHVzLmR0cwo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0
NAo+PiBpbmRleCAwMDAwMDAwMDAwMDAuLjk5ZTk2YmU1MDlmOAo+PiAtLS0gL2Rldi9udWxsCj4+
ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1nMTJiLW9kcm9pZC1uMi1w
bHVzLmR0cwo+PiBAQCAtMCwwICsxLDUzIEBACj4+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmll
cjogKEdQTC0yLjArIE9SIE1JVCkKPj4gKy8qCj4+ICsgKiBDb3B5cmlnaHQgKGMpIDIwMTkgQmF5
TGlicmUsIFNBUwo+PiArICogQXV0aG9yOiBOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZ0BiYXls
aWJyZS5jb20+Cj4+ICsgKi8KPj4gKwo+PiArL2R0cy12MS87Cj4+ICsKPj4gKyNpbmNsdWRlICJt
ZXNvbi1nMTJiLW9kcm9pZC1uMi5kdHNpIgo+PiArCj4+ICsvIHsKPj4gKwljb21wYXRpYmxlID0g
ImhhcmRrZXJuZWwsb2Ryb2lkLW4yLXBsdXMiLCAiYW1sb2dpYyxzOTIyeCIsICJhbWxvZ2ljLGcx
MmIiOwo+PiArCW1vZGVsID0gIkhhcmRrZXJuZWwgT0RST0lELU4yKyI7Cj4+ICsKPj4gKwl2ZGRj
cHVfYTogcmVndWxhdG9yLXZkZGNwdS1hIHsKPj4gKwkJcmVndWxhdG9yLW1pbi1taWNyb3ZvbHQg
PSA8NjgwMDAwPjsKPj4gKwkJcmVndWxhdG9yLW1heC1taWNyb3ZvbHQgPSA8MTA0MDAwMD47Cj4+
ICsKPj4gKwkJcHdtcyA9IDwmcHdtX2FiIDAgMTUwMCAwPjsKPj4gKwl9Owo+PiArCj4+ICsJdmRk
Y3B1X2I6IHJlZ3VsYXRvci12ZGRjcHUtYiB7Cj4+ICsJCXJlZ3VsYXRvci1taW4tbWljcm92b2x0
ID0gPDY4MDAwMD47Cj4+ICsJCXJlZ3VsYXRvci1tYXgtbWljcm92b2x0ID0gPDEwNDAwMDA+Owo+
PiArCj4+ICsJCXB3bXMgPSA8JnB3bV9BT19jZCAxIDE1MDAgMD47Cj4+ICsJfTsKPj4gKwo+PiAr
CWNwdV9vcHBfdGFibGVfMDogb3BwLXRhYmxlLTAgewo+PiArCQlvcHAtMTkwODAwMDAwMCB7Cj4+
ICsJCQlvcHAtaHogPSAvYml0cy8gNjQgPDE5MDgwMDAwMDA+Owo+PiArCQkJb3BwLW1pY3Jvdm9s
dCA9IDwxMDMwMDAwPjsKPj4gKwkJfTsKPj4gKwo+PiArCQlvcHAtMjAxNjAwMDAwMCB7Cj4+ICsJ
CQlvcHAtaHogPSAvYml0cy8gNjQgPDIwMTYwMDAwMDA+Owo+PiArCQkJb3BwLW1pY3Jvdm9sdCA9
IDwxMDQwMDAwPjsKPj4gKwkJfTsKPj4gKwl9Owo+PiArCj4+ICsJY3B1Yl9vcHBfdGFibGVfMTog
b3BwLXRhYmxlLTEgewo+PiArCQlvcHAtMjMwNDAwMDAwMCB7Cj4+ICsJCQlvcHAtaHogPSAvYml0
cy8gNjQgPDIzMDQwMDAwMDA+Owo+PiArCQkJb3BwLW1pY3Jvdm9sdCA9IDwxMDMwMDAwPjsKPj4g
KwkJfTsKPj4gKwo+PiArCQlvcHAtMjQwMDAwMDAwMCB7Cj4+ICsJCQlvcHAtaHogPSAvYml0cy8g
NjQgPDI0MDAwMDAwMDA+Owo+PiArCQkJb3BwLW1pY3Jvdm9sdCA9IDwxMDQwMDAwPjsKPj4gKwkJ
fTsKPj4gKwl9Owo+IAo+IEFyZSB0aGlzIG9wcCBzcGVjaWZpYyB0byB0aGUgTjIrIG9yIFM5MjJ4
IHJldiBDID8KPiBJZiBpdCBpcyB0aGUgbGF0dGVyLCBzaG91bGRuJ3QgdGhlc2UgYmUgaW4gczky
MngtcmV2QyBkdHNpID8KCk4yKyBpcyBjdXJyZW50bHkgdGhlIG9ubHkga25vd24gZGV2aWNlIHdp
dGggUmV2QyBjaGlwIChhbmQgc2hpcHBpbmcgd2l0aAphIGh1Z2UgaGVhdHNpbmspIHNvIHdlIGRv
buKAmXQga25vdy4gSSBwcmVmZXIgdG8gdG8gcHV0IHRoZW0gaW4gdGhlIGJvYXJkCmR0cyBmb3Ig
bm93IGFuZCBtb3ZlIHRvIGEgY29tbW9uIGR0c2kgaW4gdGhlIGZ1dHVyZSBvbmNlIHdl4oCZdmUg
c2VlbiBtb3JlCmRldmljZXMgaW4gdGhlIHdpbGQgYW5kIHByb3ZlbiB0aGV5IGNhbiBoYW5kbGUg
dGhlIG92ZXJjbG9jay4KCkNocmlzdGlhbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9n
aWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
