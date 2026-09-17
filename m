Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA2B7C88E72
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Sep 2026 21:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MUzL+GACgfKEpdQnYm8qaT7JywxYqWlMhYtCmlhBHWg=; b=BSfPGxAjTPBpSL
	0jbDmAT7Q+sVhSvBKpWRCGIepFB7XMYveevNVDRq1kWm3b+FOjt3E+dzz2Nz+Bd8B/QeU0BpgH8Oo
	5lTtSxyv8CfqRq8pbsEvK7tzeA/0hmXL5eQG/u1kbw2TtaEIflIII3Efr5s/On0gacPCcW+l12/Zg
	ADlbC3Nl8OqJi7T+LvmMFOB0oFyqfZwYFVNtJDmmUqzVn/R6Kr/KU/oDHaArmhx7MJgBnj7YfNu8G
	idv6hQlNUFysuLV2E1WAT3/9wMdLLaI7JTIenz+pGipPwKohMdVghT0k6TbpVKBcZox8mcI+W+/PR
	/tq6oKj4LwT/gDtKhw0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7JKt-0000000CXBL-48aX;
	Thu, 17 Sep 2026 21:08:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7JKr-0000000CXB0-3pxn
	for linux-amlogic@lists.infradead.org;
	Thu, 17 Sep 2026 21:08:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A080F600AA;
	Thu, 17 Sep 2026 21:07:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AAFB1F000FF;
	Thu, 17 Sep 2026 21:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789679279;
	bh=NycZ8xxpD+szQ7fNi7KljyQrNuf5boM7D+dveD4mur4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NeV0RjzS52eehgjyzMGadUy/ACSYbYistaZ0vSbJ8o5cQfc5p1f2m2evBGODU8Gud
	 Pxxm56jzOpMlAazAPbT9fWVwK2cD5zYiYwyx6Vg7L0KS4wvnUtIU5ykNVBLPt3mqO1
	 5Ec4yNPCSPF7KBL4RN/JCJWG3xaOKvMBaedHppu0IEPRpyRaIYcXdmff1t1p+aI3x6
	 WNUgJv53fSjw6GtzwijWsWoibOG88tB0KaDLjASWvuSuYaGxbMYHKD5QSwTzNg+Ys9
	 n0/3YbuFE/v6hg1HhrbQQda3YF/P1B4sdsUHpXVXgeDqF96l4YgGvwAw/I5UfL/jBz
	 Zt9FEBfw4mFXw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/6] ASoC: dt-bindings: amlogic,gx-audin: add schema
To: "Valerio Setti" <vsetti@baylibre.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260917-audin-v2-1-38de4bc1de34@baylibre.com>
References: <20260917-audin-v2-0-38de4bc1de34@baylibre.com>
 <20260917-audin-v2-1-38de4bc1de34@baylibre.com>
Date: Thu, 17 Sep 2026 21:07:58 +0000
Message-Id: <20260917210759.0AAFB1F000FF@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0xvd10gZHQtYmluZGluZ3M6IGFt
bG9naWMsZ3gtYXVkaW46IG1pc3NpbmcgY29uc3QgY29uc3RyYWludCBmb3IgI3NvdW5kLWRhaS1j
ZWxscwotLQoKY29tbWl0IDE4MTNlZWM1ZWI0MmI2MjNlMmFhZTE2OTgyNWNhNmNiM2RjZDA5ZTgK
QXV0aG9yOiBWYWxlcmlvIFNldHRpIDx2c2V0dGlAYmF5bGlicmUuY29tPgoKQVNvQzogZHQtYmlu
ZGluZ3M6IGFtbG9naWMsZ3gtYXVkaW46IGFkZCBzY2hlbWEKCkFVRElOIHByb3ZpZGVzIEkyUyBh
dWRpbyBpbnB1dCBzdXBwb3J0IHRvIHRoZSBNZXNvbiBHWCBwbGF0Zm9ybXMKKEdYQkIvR1hMKS4K
Cj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb3VuZC9h
bWxvZ2ljLGd4LWF1ZGluLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
c291bmQvYW1sb2dpYyxneC1hdWRpbi55YW1sCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiAtLS0g
L2Rldi9udWxsCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvdW5k
L2FtbG9naWMsZ3gtYXVkaW4ueWFtbApbIC4uLiBdCj4gK2FsbE9mOgo+ICsgIC0gJHJlZjogZGFp
LWNvbW1vbi55YW1sIwo+ICsKPiArcHJvcGVydGllczoKPiArICBjb21wYXRpYmxlOgoKW1NldmVy
aXR5OiBMb3ddClNob3VsZCAjc291bmQtZGFpLWNlbGxzIGJlIGV4cGxpY2l0bHkgZGVmaW5lZCBo
ZXJlIHdpdGggYSBjb25zdCBjb25zdHJhaW50PwoKVGhlIGJpbmRpbmcgcmVxdWlyZXMgI3NvdW5k
LWRhaS1jZWxscyBiZWxvdywgYnV0IGZhaWxzIHRvIGRlZmluZSBpdCBpbiB0aGUKcHJvcGVydGll
cyBibG9jayB3aXRoIGEgY29uc3QgY29uc3RyYWludC4gUmVseWluZyBvbiBkYWktY29tbW9uLnlh
bWwsIHdoaWNoCm9ubHkgZGVmaW5lcyBpdCBhcyB0cnVlICh1bmNvbnN0cmFpbmVkKSwgYWxsb3dz
IGludmFsaWQgY29uZmlndXJhdGlvbnMgd2l0aAppbmNvcnJlY3QgY2VsbCBjb3VudHMgKGUuZy4s
IDwwPiBvciA8Mj4pIHRvIHNpbGVudGx5IHBhc3MgdmFsaWRhdGlvbi4KCj4gKyAgICBpdGVtczoK
PiArICAgICAgLSBlbnVtOgo+ICsgICAgICAgICAgLSBhbWxvZ2ljLGd4YmItYXVkaW4KPiArICAg
ICAgICAgIC0gYW1sb2dpYyxneGwtYXVkaW4KPiArICAgICAgLSBjb25zdDogYW1sb2dpYyxneC1h
dWRpbgpbIC4uLiBdCj4gK3JlcXVpcmVkOgo+ICsgIC0gY29tcGF0aWJsZQo+ICsgIC0gcmVnCj4g
KyAgLSByZXNldHMKPiArICAtIGludGVycnVwdHMKPiArICAtIGNsb2Nrcwo+ICsgIC0gIiNzb3Vu
ZC1kYWktY2VsbHMiCj4gKwoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlr
by5kZXYvIy9wYXRjaHNldC8yMDI2MDkxNy1hdWRpbi12Mi0wLTM4ZGU0YmMxZGUzNEBiYXlsaWJy
ZS5jb20/cGFydD0xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1hbWxvZ2ljCg==
