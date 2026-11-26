Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A7EB606A321
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Nov 2026 06:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SIwURZ10;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=DyjyOo0U
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=QsjsmWqSb8l36Ey7m8X2FDOKKseXFFUimgUoCir8Wxc=; b=SIwURZ10fsgJXsphPr26Fpj63S
	x9zehAOl/1I6Il3MnrAO/x0kt3wuJ3QKwRvxT/EwfHP1OR7wVskYgZ4eVZHJOL4/kR2aH9UxmLIAM
	84iH2RQNuvoVpkp3x8AgTrj1Xl4GXR0/nublV5F6tLxpR1ehwc4QwbV7YGQARL5hf73uIT4PRq2u/
	Cx/jarJNA0JzP+cyHnonRT8kE2S6GgtsWZVok8ZlgzIx1au6ftmiTMu7DcHA9H4QW3IYhgV/AuXHb
	3u93B47NGTa6X5bdlWYf5yhUwavhZ4Ak+AVWNDeEcxVO/xD206dMBLHFwNRMLCI5z8Hv239f9rZDb
	BE00XmuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWTKl-0000000CEEo-371p;
	Thu, 26 Nov 2026 06:51:55 +0000
Received: from mout.web.de ([212.227.15.14])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWTKi-0000000CEDm-062k
	for linux-amlogic@lists.infradead.org;
	Thu, 26 Nov 2026 06:51:54 +0000
DKIM2-Signature: i=1; m=1; t=1795675909;
 mf=PE1hcmt1cy5FbGZyaW5nQHdlYi5kZT4=;
 rt=PGxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
 d=web.de;
 s=s29768273:rsa-sha256:ciKEnEj63qs6L+w0H9x2CG0ZiuIx
   TRv4mEczarbNDhxu2eO9ivHMVqWFC2UCY5w++35r/0et1u/XGZJON1uKow2KBO+UmqtjIdiIRmk
   9rMJKVvud1GS8NUya0+S/+fBImMkJ7ObiavsS7iMwFk1Nz7kDBgBBmuqIr79gdNKVrMxb/zvkiA
   Yc1elCvrxirhjt0czVNO2xMOWvOpLS8CEcbAtgQ2ykmr7gH6VCnuBXj+nLThW7sZDw/cf1Os6tw
   /+y1cZiXXVZLdjLbyjIabADkeX3LnHTARTpw1LrxTtA455SoTdLb3YJByrU+cP8Kgp4ocOTLf/S
   dfNsLC9ur5eHhg==;
Message-Instance: m=1;
 h=sha256:
   ovECSw/XZu6E19QAVSSSQ62IkUEmSjf/5JlWpdHCDPM=:
   rd9GyoY5N701DfycZ4LhG5ghpUk8uTOk/vLgb2pQwy4=,
  sha512:
   bN+g9v/KcV9G/yiYVPSNJoslBCPpzROJOkYr0Kxm+Gi3QN4VLMgTmYBN6tHCx4TjNJAf+dC1ozlroBIlofgWww==:
   r6jqTiSUXwf2ZnxjNDA5+Dqgg2aW5QlO3nxr5kPrav2Ls/uHtlb1ecRP9IwxIPx2YuVqnyb7bGpxHa4qPVw9RQ==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1795675909; x=1796280709; i=markus.elfring@web.de;
	bh=w+ytwK427nQPXkrURTx5WjRyiSqoE+ZcCfjZVbYYd8I=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=DyjyOo0UAd7l/yBaBlCuSlY1iRRAHAXLUoPo1GXX4QNyVIJVKrQYs5gtiGNH080v
	 3a3F/AynwxJbLRpRE0DGP5zbTa03IhgJWlxromySS35bKoDtAOtRoe7TKIQF6V8qf
	 6V4oXKyjxdpmRfTb7uJJR5X/ljbHt2HQmYAHT0LyxuJG9aipyq6YpEk5pKNfrmn6I
	 YZJ/n8NqKR9mxv5Lvn+gOO4cgL8TpxDSbvnbZCNtQCrQHL60RowGSOi33drV+1ZkI
	 l0dTriYPMqIhPkmDISRt3TdMN1OTZNCuOzsliwo0jK4g/+9nsXEXJv3+ynFLD+aCf
	 /LlfIr+IoF8Gs3GM6A==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N8Elg-1yaHPY4AG8-017VcX; Thu, 26
 Nov 2026 07:51:49 +0100
Message-ID: <5d75177b-a86b-4728-92f6-87f37a51d4da@web.de>
Date: Thu, 26 Nov 2026 07:51:47 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 2/2] i2c: amlogic: Add Amlogic A9 I2C controller
 driver
To: Junyi Zhao <junyi.zhao@amlogic.com>,
 Xianwei Zhao <xianwei.zhao@amlogic.com>, linux-amlogic@lists.infradead.org,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 Andi Shyti <andi.shyti@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20261126-a9-i2c-v13-0-926e2072cc4f@amlogic.com>
 <20261126-a9-i2c-v13-2-926e2072cc4f@amlogic.com>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20261126-a9-i2c-v13-2-926e2072cc4f@amlogic.com>
X-Provags-ID: V03:K1:coeYVQCvczOdUX1zW/dp5SW/ji9CBDsrtp9vc7yTzLHZNOLiOC3
 XVH7CBq/tEu54Fohf6Y6Q1MYojp/AvBF8vEMHjMTNmVqsxQEObN90spa8twVQTGK5AbPeWj
 +wC6OTEwc1VkxPUHbX68njAZXGVlFgCnU8dMq5waT7cT5Y58JH0hzS1Da0fM+wxrDcWu5Nv
 gNaaqSeFYwvUVyJkJNlbQ==
UI-OutboundReport: notjunk:1;M01:P0:ubFfV22+ESY=;vJiFvJ7XWK7P5cZ6Jccq2hABY3V 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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_225153_294937_672B4487 
X-CRM114-Status: UNSURE (   5.03  )
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
ICsxLDQyOCBAQArigKYKPiArLyogQW1sb2dpYyBJMkMgcmVnaXN0ZXIgbWFwICovCj4gKyNkZWZp
bmUgUkVHX0NGR19SRFkJCTB4MDAKPiArI2RlZmluZSBSRUdfQ0ZHX0kyQwkJMHgwNAo+ICsjZGVm
aW5lIFJFR19DRkdfU1RBUlQJCTB4MDjigKYKCkNhbiBhbm90aGVyIGVudW1lcmF0aW9uIGJlY29t
ZSBoZWxwZnVsIGZvciBzdWNoIGNvbnN0YW50IHZhbHVlcz8KClJlZ2FyZHMsCk1hcmt1cwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dp
YyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
