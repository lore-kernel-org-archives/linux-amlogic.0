Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D0D2CD4F3C
	for <linux-amlogic@archiver.kernel.org>; Sat, 16 May 2026 19:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CJpwgPMvWmDJGQPCx780cdY/gc6D4s9h7kHCO1CmlFM=; b=OCtCB8CpuPr2E4
	2qANwQ2GuWYpWD/vCBjxfwjY3mprgM2nOYu54Je3KG2ZC6pwoVsJxn/sIFtt0fsL7FmYxdqVXP6BI
	M0ApXYiecJBW0vs6UO4Fa4G7eYZDN3s3zIFh8MaUZxkMK4+Yym5cQx7HpmjtlDJVj4mwt2bZuJw7D
	IMONFUzBcWG+VCnwaAvfe8/qQV4QQtIhIqC1+LtNQ3pcb8tcI+ZU32cKL22OnFWzIUiEW4toDn6Ja
	48RAuH0wx3V/eKQ/FkRZzVsVyiYVA/zEpI0Cg+hXFfRYffaXR2LRR7OrvGRgcwnMGaF17cT9vQL0m
	8lqxb7nNP6XrmRRsdO9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOL3j-0000000BPZV-2dFS;
	Sat, 16 May 2026 19:52:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOL3h-0000000BPZ7-3h9d
	for linux-amlogic@lists.infradead.org;
	Sat, 16 May 2026 19:52:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3685E60141;
	Sat, 16 May 2026 19:52:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E2CBC19425;
	Sat, 16 May 2026 19:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778961144;
	bh=fAsWNGwQAqu+EJ+8N3R741IrNe5Q1D1pfyWbyfS013c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=jkD+Pp0mnYYfYMurlZ0SylntRAn6adUMDneQodqK2Yynhiiqww3xyg206Mlm3OCmO
	 Nx8Tca0M4muyaUFAKOzJ26mQsfG9ixOI5NQBxWGQsIy9uadf66v3Sf6vOgZwERq6ss
	 iAnA1b4nyw1MOXw+DFw1j3BE76yIj1faGc+uFYDae1WRFeHvOs6ej4OHVkZVM/l2XJ
	 U2IYcgAal+X+CjB2B1o1YOva8k0BdmDpyr+7dCWakTlrznZhLhb7zpwOdSbmxdQzNY
	 P/jXi1/GzsDXfqYdR/1hhR5ckBnWXZt54xMDKn10YWfXgqdrrrqo0xoe1zQTtWUdgs
	 aI6WaxiO6UAAQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 17/22] drm: bridge: dw_hdmi: Drop call to
 drm_bridge_hpd_notify()
To: "Jonas Karlman" <jonas@kwiboo.se>
Cc: neil.armstrong@linaro.org, linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org, Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260516183838.2024991-18-jonas@kwiboo.se>
References: <20260516183838.2024991-18-jonas@kwiboo.se>
Date: Sat, 16 May 2026 19:52:24 +0000
Message-Id: <20260516195224.9E2CBC19425@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIFJlbW92aW5nIGRybV9i
cmlkZ2VfaHBkX25vdGlmeSgpIHZpb2xhdGVzIHRoZSBEUk0gYnJpZGdlIEFQSSBjb250cmFjdCBh
bmQgY2F1c2VzIGhvdHBsdWcgZXZlbnRzIHRvIGJlIHBlcm1hbmVudGx5IGxvc3QgZHVyaW5nIHN5
c3RlbSBzdXNwZW5kLgotLQoKY29tbWl0IDZiMzQ5MWUzOTA4MjAxNWFiNjI0MzFlYTBjOTNjNzRj
OTM0NGI5OTUKQXV0aG9yOiBKb25hcyBLYXJsbWFuIDxqb25hc0Brd2lib28uc2U+Cgpkcm06IGJy
aWRnZTogZHdfaGRtaTogRHJvcCBjYWxsIHRvIGRybV9icmlkZ2VfaHBkX25vdGlmeSgpCgpUaGlz
IGNvbW1pdCByZW1vdmVzIHRoZSBkcm1fYnJpZGdlX2hwZF9ub3RpZnkoKSBjYWxsIGZyb20gdGhl
IGR3X2hkbWkgSVJRCmhhbmRsZXIsIHJlbHlpbmcgaW5zdGVhZCBvbmx5IG9uIGRybV9oZWxwZXJf
aHBkX2lycV9ldmVudCgpIHRvIGF2b2lkIHNlbmRpbmcKZHVwbGljYXRlIGhvdHBsdWcgdWV2ZW50
cyB0byB1c2Vyc3BhY2UuCgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5
bm9wc3lzL2R3LWhkbWkuYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRt
aS5jCj4gaW5kZXggZTljNGUyNGMwOTBjYS4uNmNjN2IyYTg2MGJkOCAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYwo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jCj4gQEAgLTMxMDEsMTAgKzMxMDEsOCBA
QCBzdGF0aWMgaXJxcmV0dXJuX3QgZHdfaGRtaV9pcnEoaW50IGlycSwgdm9pZCAqZGV2X2lkKQo+
ICAJCQlzdGF0dXMgPT0gY29ubmVjdG9yX3N0YXR1c19jb25uZWN0ZWQgPwo+ICAJCQkicGx1Z2lu
IiA6ICJwbHVnb3V0Iik7Cj4gIAo+IC0JCWlmIChoZG1pLT5icmlkZ2UuZGV2KSB7Cj4gKwkJaWYg
KGhkbWktPmJyaWRnZS5kZXYpCj4gIAkJCWRybV9oZWxwZXJfaHBkX2lycV9ldmVudChoZG1pLT5i
cmlkZ2UuZGV2KTsKPiAtCQkJZHJtX2JyaWRnZV9ocGRfbm90aWZ5KCZoZG1pLT5icmlkZ2UsIHN0
YXR1cyk7Cj4gLQkJfQo+ICAJfQoKV2lsbCByZW1vdmluZyBkcm1fYnJpZGdlX2hwZF9ub3RpZnko
KSBjYXVzZSBob3RwbHVnIGV2ZW50cyB0byBiZSBwZXJtYW5lbnRseQpsb3N0IGlmIHRoZXkgb2Nj
dXIgZHVyaW5nIHN5c3RlbSBzdXNwZW5kPwoKU2luY2UgdGhlIGRyaXZlciBhZHZlcnRpc2VzIERS
TV9CUklER0VfT1BfSFBELCBkb2VzIHRoZSBEUk0gYnJpZGdlIEFQSQpjb250cmFjdCBzdGlsbCBy
ZXF1aXJlIGl0IHRvIGNhbGwgZHJtX2JyaWRnZV9ocGRfbm90aWZ5KCkgdG8gcHJvcGVybHkKcHJv
cGFnYXRlIGhvdHBsdWcgZXZlbnRzIHRvIHRoZSByZXN0IG9mIHRoZSBicmlkZ2UgY2hhaW4/CgpM
b29raW5nIGF0IGRybV9oZWxwZXJfaHBkX2lycV9ldmVudCgpLCBpdCBhYm9ydHMgZWFybHkgaWYg
cG9sbGluZyBpcwpkaXNhYmxlZDoKCmRyaXZlcnMvZ3B1L2RybS9kcm1fcHJvYmVfaGVscGVyLmM6
ZHJtX2hlbHBlcl9ocGRfaXJxX2V2ZW50KCkgewoJc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5l
Y3RvciwgKmZpcnN0X2NoYW5nZWRfY29ubmVjdG9yID0gTlVMTDsKCXN0cnVjdCBkcm1fY29ubmVj
dG9yX2xpc3RfaXRlciBjb25uX2l0ZXI7CglpbnQgY2hhbmdlZCA9IDA7CgoJaWYgKCFkZXYtPm1v
ZGVfY29uZmlnLnBvbGxfZW5hYmxlZCkKCQlyZXR1cm4gZmFsc2U7Ci4uLgp9CgpEdXJpbmcgc3lz
dGVtIHN1c3BlbmQsIGRybV9rbXNfaGVscGVyX3BvbGxfZGlzYWJsZSgpIHNldHMgcG9sbF9lbmFi
bGVkCnRvIGZhbHNlLiBJZiBhbiBIUEQgaW50ZXJydXB0IGZpcmVzIHdoaWxlIHRoZSBzeXN0ZW0g
aXMgc3VzcGVuZGVkLCB3b24ndApkcm1faGVscGVyX2hwZF9pcnFfZXZlbnQoKSBzaWxlbnRseSBk
cm9wIHRoZSBldmVudCB3aXRob3V0IHVwZGF0aW5nIHRoZQpjb25uZWN0b3Igc3RhdHVzIG9yIHNj
aGVkdWxpbmcgYW55IGRlZmVycmVkIHdvcms/CgpGdXJ0aGVybW9yZSwgd2hlbiB0aGUgc3lzdGVt
IHJlc3VtZXMsIG91dHB1dF9wb2xsX2V4ZWN1dGUoKSBleHBsaWNpdGx5IHNraXBzCmNvbm5lY3Rv
cnMgdGhhdCB1c2UgdGhlIERSTV9DT05ORUNUT1JfUE9MTF9IUEQgZmxhZywgYW5kIHRoZSBkd19o
ZG1pIHJlc3VtZQpoYW5kbGVyIGRvZXMgbm90IGFwcGVhciB0byBtYW51YWxseSB0cmlnZ2VyIGEg
aG90cGx1ZyBldmVudCBjaGVjay4KCkNvdWxkIHRoaXMgcmVzdWx0IGluIHRoZSBzeXN0ZW0gYmVp
bmcgY29tcGxldGVseSB1bmF3YXJlIG9mIGFueSBkaXNwbGF5CmNvbm5lY3Rpb25zIG9yIGRpc2Nv
bm5lY3Rpb25zIHRoYXQgaGFwcGVuZWQgd2hpbGUgc3VzcGVuZGVkLCBhdCBsZWFzdCB1bnRpbAph
IG1hbnVhbCByZXByb2JlIGlzIGZvcmNlZCBieSB1c2Vyc3BhY2U/CgotLSAKU2FzaGlrbyBBSSBy
ZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwNTE2MTgzODM4LjIw
MjQ5OTEtMS1qb25hc0Brd2lib28uc2U/cGFydD0xNwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgt
YW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
