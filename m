Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAFFF606A327
	for <linux-amlogic@archiver.kernel.org>; Sat, 14 Nov 2026 09:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yabzCVtQ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=et4hn7GR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:Subject:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Pk29zNZNpNFvbgPCRj8S/daslTgiYoSpsR5wlmFeUSE=; b=yabzCVtQUWP8XMCrgd+J9JwSmt
	1IEkDn8lQV1chUEf8H4LE1B11ZR07Xk/dA/ZlhlPGD6SqFCz3rY9DYWbzJNXbh/0Td5UZcDM9CKJ4
	3eJWTSizbGMbLy7Gxzej+OFz1qo17sadzn7i2+3Ln1EdFfiYV93HHfg61L61yPyhQQVS7HIm586DO
	fK19oSllAqdXIGeqhLo6FulAsoWhXzfx6ZIE20aaYNJqUKC5N6e932VG2gJv4ctybOPampzSlmym5
	izepz1nWwUaWJPVGt5uYtpfD9jo10+HkqHXGKn4K1Ekua6UzdilabcToFdHw61MBlzBCE2Apmq68S
	mtBaMQLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS9mv-0000000FdfI-1g3h;
	Sat, 14 Nov 2026 09:11:09 +0000
Received: from mout.web.de ([212.227.15.3])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS9ms-0000000Fddn-3Zpf
	for linux-amlogic@lists.infradead.org;
	Sat, 14 Nov 2026 09:11:08 +0000
DKIM2-Signature: i=1; m=1; t=1794647461;
 mf=PE1hcmt1cy5FbGZyaW5nQHdlYi5kZT4=;
 rt=PGxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
 d=web.de;
 s=s29768273:rsa-sha256:oIMd8/pjEfOGAG14OGBfy+Ai60rG
   jad6WdB47QKtpd5hqIYiPRSR8JJVUr2/bgr/cmw2AJb5APZv64wSz3Qr7Q6r4KYPG9q64jqQByr
   i1qa2jmYrXZZkAmZcNzeqOx3x/k7d7GDUOLdkXS42dilYjMxZCoHvUEF+3bgPc4gQnu9RYoGIUy
   eEqVF4jn3mIHj6DIDSbQWhmofuRZfftkeRNCdswUSP+Qtf4Bpt3kxGbpNqUXihbdDX1LOKxWstG
   7vH6sMpbwdqHRE7m4fjcn/lEaGUIqcd9Vs0qzLE5ZJ/orV7r8ClN9Fa2yYAwzUXewprDsEDB2Gg
   /mP7Aqnn6gtWNQ==;
Message-Instance: m=1;
 h=sha256:
   zCgGOO46jbEx7tHixHD1B/wiAcFKW9YGy6fpLA4gVu0=:
   srJchHbhFIM00WY0OUPcWUvdjsj8qJknYDvV+oECsnA=,
  sha512:
   AiYlbsKy9Rk2b47dc4pYMTtT8ftYllGiP6IcnRGdbWBv6zE7yymZNBQ9XTFiYyJwppRBtlpC17pdbwWa2sgdyA==:
   yyCIOEFfPsjH7sBC8+dn7B7FhZAOmDKUgHvdI0FfDR6wO8Jfa13fujo9ATKRvMJfTQCBvGAK5r3+MTlbLpeoOw==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1794647438; x=1795252238; i=markus.elfring@web.de;
	bh=f9t86iKgY/RA+c+/FaB5GFCHep1CCR2UihSVVBNfavM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=et4hn7GR62ZVZ8zIcPn5+JhifpooeSKXPB0txUdnIlRfkkS/ib+MPIgv5+6kebK4
	 xww0lAbCY/l4TlE/APakl0GHjCtPYIbNipgcDP4lj6k9B8V7B11rWGD2Tr8/ITikh
	 NRZJbucDb4XfxaGLRQ2Ae9eM+M0Hn4HmmoqyOZ7i8Yc1qHPQR4Mw4ITDtflHAZGDJ
	 4QIZxzyU37kMcAOmCdBYmLT/b5dNTwovVmLTn3js7Jqm3fHCx8rOrwYZu0d8nPj9J
	 LNH/+onDM2QPItk0wkB1ElnlC35OKVlVLbk2W074NtP0b4sab+cm3FLu+4emB9Qtu
	 QLaPAl8R+2hMk6o4GA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N2SPD-1wSSkj2oDH-00vn5Q; Sat, 14
 Nov 2026 10:10:38 +0100
Message-ID: <c879e1a7-8e5e-4bde-9742-5384ffaa13fd@web.de>
Date: Sat, 14 Nov 2026 10:10:26 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Junyi Zhao <junyi.zhao@amlogic.com>,
 Xianwei Zhao <xianwei.zhao@amlogic.com>, linux-amlogic@lists.infradead.org,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 Andi Shyti <andi.shyti@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20261110-a9-i2c-v8-2-1e9d2682f86b@amlogic.com>
Subject: Re: [PATCH v8 2/2] i2c: amlogic: Add Amlogic A9 I2C controller driver
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20261110-a9-i2c-v8-2-1e9d2682f86b@amlogic.com>
X-Provags-ID: V03:K1:PGlWamaXRSV9ETjRHbx4oaj+rDS9VzYqFmfDjgNQyipWoROWEyu
 QOoVfGtR442ROSMPFBClWp2LzU41mdNsX0GGHb4vhM35dTm0v9f/yMv0/P6ZhhpNqM5dniS
 GQKXs7N+IL0hQKTVXM8omZvQapa9605+2ptaSWISqnCEz75rvhdXWH5R4qPIR2VSolkCrMH
 Ui/QUj3L607YQ3odsAhTA==
UI-OutboundReport: notjunk:1;M01:P0:bZB6lC22pII=;Cg6wmmOPLGpADUZr4vaTWj0JUKe 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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_011107_189729_B064747F 
X-CRM114-Status: UNSURE (   5.93  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

4oCmCj4gKysrIGIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1hbWxvZ2ljLWE5LmMKPiBAQCAtMCww
ICsxLDQzMCBAQArigKYKPiArc3RhdGljIGlycXJldHVybl90IGFtbF9pMmNfaXJxKGludCBpcnFu
bywgdm9pZCAqZGV2X2lkKQo+ICt7CuKApgo+ICsJc3Bpbl9sb2NrKCZpMmMtPmxvY2spOwo+ICsJ
aXJxX3N0YXRlID0gcmVhZGwoaTJjLT5yZWdzICsgUkVHX0NGR19JUlFfU1RBVEUpOwrigKYKPiAr
CWNsZWFyX2lycV9zdGF0dXMoaTJjLCBJUlFfQUxMX01BU0spOwo+ICsJc3Bpbl91bmxvY2soJmky
Yy0+bG9jayk7Cj4gKwo+ICsJcmV0dXJuIElSUV9IQU5ETEVEOwo+ICt9CuKApgoKV2hhdCBkaWQg
aGluZGVyIHlvdSB0byBhdm9pZCBkdXBsaWNhdGUgc291cmNlIGNvZGUgYSBiaXQgbW9yZSBmb3Ig
c3VjaCBhIGZ1bmN0aW9uIGltcGxlbWVudGF0aW9uPwpodHRwczovL2xvcmUua2VybmVsLm9yZy9s
aW51eC1pMmMvODQ1NjVhNTAtMGM1Mi00NWZmLWI0M2EtM2QzMDkwMjY5MGRmQGFtbG9naWMuY29t
LwoKQ2FuIGFub3RoZXIgbG9jayBndWFyZCBiZWNvbWUgaGVscGZ1bCBoZXJlPwoKUmVnYXJkcywK
TWFya3VzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxv
Z2ljCg==
