Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851DF606A320
	for <linux-amlogic@archiver.kernel.org>; Sun, 22 Nov 2026 09:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bfdLmF9X;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=molgen.mpg.de header.i=@molgen.mpg.de header.a=rsa-sha256 header.s=20260906 header.b=iEIY9BMh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:From:To:MIME-Version:Date:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Qh9EfoBkZq5KPd1Pc1CCRHxsIWT0V+Qb3ioi8fvCn1c=; b=bfdLmF9XZkhvc6hdhn3X9sPXm2
	E2mrUuuXf6renifJooIZZzBdL1ehMWqVc2BUCv+4q7xoxEojJdfA7L9+lDkum2xlx0nOZV/i4VCni
	TAjC1m4RvPo54hlZe7YJIa0VwbAprCgg+BJ8uc1YtE6V/nBWDeYmiu87WHzpdd6K/B/EFzklW2MVz
	nO6mQ/KLROLoBYq8IpvZFcAcNfhnApLEjcEAe2sICmKBBged6fqwj5VieJo+ey1RcAISxPaSbBR75
	mSoEPbmQHLj2nNqOxw3QpfHpRwI9aluLjZqVnhcL3a2w/wSM6mKu9+qh8TTAtkANRACAksCyPMsnu
	bgLYoyUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV3ib-00000000u3B-0feT;
	Sun, 22 Nov 2026 09:18:41 +0000
Received: from mx3.molgen.mpg.de ([141.14.17.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV3iX-00000000u2j-2mQd
	for linux-amlogic@lists.infradead.org;
	Sun, 22 Nov 2026 09:18:39 +0000
Received: from [192.168.2.223] (p5b13a22d.dip0.t-ipconnect.de [91.19.162.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id BF8D44C442F7ED;
	Sun, 22 Nov 2026 10:18:07 +0100 (CET)
Message-ID: <cda06da6-e7e0-4522-b1ab-ec542d4703d2@molgen.mpg.de>
Date: Sun, 22 Nov 2026 10:18:06 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Xianwei Zhao <xianwei.zhao@amlogic.com>, Arden Jin <Arden.Jin@amlogic.com>
From: Paul Menzel <pmenzel@molgen.mpg.de>
Subject: Amlogic S4 (S805X2) video decoder firmware for linux-firmware
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=molgen.mpg.de; s=20260906; 
	t=1795339088; 
	h=from:from:subject:date:message-id:mime-version:content-type:content-transfer-encoding; 
	bh=wszx0tuFio6hCNaSqAlXHY7T6RitMSPrZ8oFzqziRJk=; 
	b=iEIY9BMhcn35ldV3kT0zSpxT6W2aeyQUEqzqOr5R+XqiBeny0LNfw19GuKempbBNhVXcc28Ew2A2
	Xyi8VYuQWd/Nj2ATmkYyQTcLsuXKkaa7jIL/dzLzvABNmGFGheZ42BZTsUW3mm4g4VTXwYkkcThMwP
	iTsmFM08uszJIJm7jBRFPsieyt4IA4UDah4DwBcYZz2yr6DvGpWj6ipmogKf9GZynyrOyMf1RjXW86
	w9a5Gak0M6doaLYQJ1wpxLZaVarHwZcuxVGsV22hXFmuSz1hwkg5HNU4ZIS0vlUL+gUB6C/8rHqiTl
	Ks7CgSpPBGOhJJZVD8gpIPEZQAiQFdhQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_011837_860395_1F04126A 
X-CRM114-Status: UNSURE (   7.90  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org, linux-media@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

RGVhciBYaWFud2VpLCBkZWFyIEFyZGVuLAoKCkJlZm9yZSBidXlpbmcgYSBDaHJvbWVjYXN0IHdp
dGggR29vZ2xlIFRWIEhEIChib3JlYWwsIEFtbG9naWMgClM4MDVYMi9TNCksIEkgd291bGQgbGlr
ZSB0byBzb3J0IG91dCB0aGUgZmlybXdhcmUgc2l0dWF0aW9uLgoKbGludXgtZmlybXdhcmUgaGFz
IG1lc29uL3ZkZWMvKi5iaW4gZm9yIEdYQkIgdXAgdG8gU00xIHVuZGVyIApMSUNFTlNFUy9MSUNF
TlNFLmFtbG9naWNfdmRlYywgZXh0cmFjdGVkIGZyb20gQW1sb2dpY+KAmXMgSnVseSAyMDE5IApy
ZWxlYXNlIChsaW51eC1maXJtd2FyZSBjb21taXRzIGUwNGNjNTZkIGFuZCBmYjUwNWE2OSwgd2l0
aCBBcmRlbiBpbiAKQ2MpLiBUaGVyZSBpcyBub3RoaW5nIGZvciBTNC4KCkluIHRoZSBtZWRpYV9t
b2R1bGVzIHNvdXJjZXMgR29vZ2xlIHB1Ymxpc2hlZCBmb3IgYm9yZWFsIFsxXSAocGFja2FnZSAK
djAuNC42NiwgY29tbWl0IDE3NTIzNTcsIGJ1aWx0IDIwMjQtMTItMjcpLCBJIGZvdW5kOgoKMS4g
IGZpcm13YXJlL1M4MDVYMi92aWRlb191Y29kZS5iaW4gYW5kIGZpcm13YXJlL1M4MDVYMkcvdmlk
ZW9fdWNvZGUuYmluIAphcmUgTkVXUCBwYWNrYWdlczogb25seSB0aGUgaGVhZGVycyBhcmUgaW4g
cGxhaW50ZXh0LCBhbmQgdGhlIG1pY3JvY29kZSAKaXMgZW5jcnlwdGVkIGFuZCBsb2FkZWQgdGhy
b3VnaCBPUC1URUUgKFRFRV9TTUNfTE9BRF9WSURFT19GVykuCgoyLiAgVGhlIGhlYWRlcnMgcmVj
b3JkIHRoZSBDUkMzMiBvZiB0aGUgcGxhaW50ZXh0LiBFYWNoIG9mIHRoZSAxNCBTNCAKZW50cmll
cyBoYXMgdGhlIENSQzMyIGFuZCBzaXplIG9mIGFuIGVudHJ5IGluIHRoZSBnZW5lcmljIHBsYWlu
dGV4dCAKcGFja2FnZSBmaXJtd2FyZS92aWRlb191Y29kZS5iaW46CgogICAgIC0gU00xIGJ1aWxk
czogaDI2NF9tdWx0aSwgbXBlZzEyX211bHRpLCB2YzEsIHh2aWRfbXVsdGksIGF2c19tdWx0aSwg
CmgyNjRfbXZjCiAgICAgLSBHMTJBIGJ1aWxkczogaGV2YywgaDI2NF9tdWx0aV9tbXUKICAgICAt
IFQ1RCBidWlsZHM6IHZwOV9tbXUsIGhldmNfbW11LCBoZXZjX21tdV9zd2FwCiAgICAgLSBTQzIg
YXYxX21tdSwgVDcgYXZzMl9tbXUsIEcxMkIgbWpwZWdfbXVsdGkKCjMuICBOb25lIG9mIHRoZW0g
aXMgYnl0ZS1pZGVudGljYWwgdG8gYSBmaWxlIGluIGxpbnV4LWZpcm13YXJlLCBhbmQgdGhlIApj
dXJyZW50IHBhY2thZ2Ugbm8gbG9uZ2VyIGNvbnRhaW5zIHRoZSBzaW5nbGUtaW5zdGFuY2UgSC4y
NjQgYW5kIApNUEVHLTEvMiBtaWNyb2NvZGUgdGhhdCB0aGUgbWFpbmxpbmUgZHJpdmVyIGxvYWRz
IChnMTJhX2gyNjQuYmluLCAKZ3hsX21wZWcxMi5iaW4pLgoKVGhlIGZpbGVzIGNhcnJ5IG5vIGxp
Y2Vuc2UsIHNvIEkgY2Fubm90IHN1Ym1pdCB0aGVtIG15c2VsZi4gTXkgcXVlc3Rpb25zOgoKMS4g
IERvZXMgQW1sb2dpYyBhZ3JlZSB0byBkaXN0cmlidXRpbmcgdGhlIFM0IHZpZGVvIGRlY29kZXIg
ZmlybXdhcmUgaW4gCmxpbnV4LWZpcm13YXJlIHVuZGVyIExJQ0VOU0UuYW1sb2dpY192ZGVjPyBD
b25jcmV0ZWx5LCB0aGUgcGxhaW50ZXh0IApidWlsZHMgUzQgdXNlcywgYXMgbWVzb24vdmRlYy9z
NF8qLmJpbi4gV291bGQgeW91IHByZWZlciB0byBzdWJtaXQgdGhlbSAKeW91cnNlbGYsIG9yIHRv
IGFjayBhIHN1Ym1pc3Npb24gZnJvbSBtZT8KCjIuICBUaGUgbWFpbmxpbmUgZHJpdmVyIGxvYWRz
IHRoZSBtaWNyb2NvZGUgZnJvbSB0aGUgbm9uLXNlY3VyZSB3b3JsZCwgCmJ5IHBvaW50aW5nIChI
RVZDXylJTUVNX0RNQV9BRFIgYXQgYSBjb2hlcmVudCBidWZmZXIuIERvZXMgdGhpcyB3b3JrIG9u
IApTNCwgb3IgZG9lcyB0aGUgRE9TIGJsb2NrIG9ubHkgYWNjZXB0IG1pY3JvY29kZSBsb2FkZWQg
YnkgQkwzMj8gSWYgdGhlIApsYXR0ZXIsIGlzIHRoZSBTTUMgaW50ZXJmYWNlIGRvY3VtZW50ZWQs
IGFuZCBkb2VzIHRoZSBCTDMyIG9uIHByb2R1Y3Rpb24gClM0IGRldmljZXMgaW5jbHVkZSB0aGUg
bWljcm9jb2RlPwoKMy4gIERvZXMgZzEyYV9oMjY0LmJpbiB3b3JrIG9uIFM0LCBvciBpcyB0aGVy
ZSBhbiBTNCBidWlsZCBvZiB0aGUgCnNpbmdsZS1pbnN0YW5jZSBILjI2NCBtaWNyb2NvZGU/IE9y
IHNob3VsZCB0aGUgbWFpbmxpbmUgZHJpdmVyIHVzZSAKaDI2NF9tdWx0aSBvbiBuZXdlciBTb0Nz
PwoKCktpbmQgcmVnYXJkcywKClBhdWwKCgpbMV06IGh0dHBzOi8vbmVzdC1vcGVuLXNvdXJjZS5n
b29nbGVzb3VyY2UuY29tL21hbmlmZXN0X3JlcG9zL21lZGlhX21vZHVsZXMKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGlu
ZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
