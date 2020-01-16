Return-Path: <SRS0=aHVS=3F=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2576BC33CAF
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Jan 2020 18:02:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1FED214AF
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Jan 2020 18:02:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oQ7BNS/B";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="U0Yzvyha"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F1FED214AF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8PgNJl4yIgI8n9tOvqB/osLHVVCm5G+6kzhHYWGxXNE=; b=oQ7BNS/B/4EcnJ
	+ufimVv3vnmrM7OuSzoIZpyalRwoMCfV3YuQbf+2EhwJAatZM5VmcaOYiGRvnQCxzJUfdX23N21sH
	pa8AaYc0zuCtZInbYhxv+jZaBLy6ibHrlNGK9+BMVNlV+Bx7OqXNhE8kHcWWKWZq7fHG4RtmMoCKT
	IvpiGMqAhWlx97TdeF7DQLoNQV5K577ZhtZoWrIwgmFn8AX6lxNLPRIYJ8ru2lfdpIbKsW4xZSvMP
	wC8AFe7eVxm8gCseiTeir8YyN1eEGym6IehA2p2ziwz6KYO8MX7358I0VsvYtR20YDNgadFugwGUx
	zBERsypDL6ATa8bqz/Og==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1is9T0-0007Ie-Gq; Thu, 16 Jan 2020 18:02:02 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1is8vH-0004pJ-61; Thu, 16 Jan 2020 17:27:15 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 14059246D3;
 Thu, 16 Jan 2020 17:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579195630;
 bh=PFQWB6yhTiykWY+nO5wBabV+FH2+zy+I/JKuaKCtjec=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=U0YzvyhaJFjLqtLm8YZrzczSOtjXijCMiyt/9T61eo0k39YLGB1YGOh7MVSru++Sw
 KsqW9SvIFVFoeotndmgtxdzodiTvqAHt9PtlOJSs2tHhRdQssT+VnFLSMEdvrcZHO/
 lBH+9+5CYmm+IxK+1wwy7Td7BrH5WEnMJRzbLi00=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 198/371] pwm: meson: Consider 128 a valid
 pre-divider
Date: Thu, 16 Jan 2020 12:21:10 -0500
Message-Id: <20200116172403.18149-141-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200116172403.18149-1-sashal@kernel.org>
References: <20200116172403.18149-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200116_092711_291836_E529DF30 
X-CRM114-Status: GOOD (  12.20  )
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
Cc: Sasha Levin <sashal@kernel.org>, linux-pwm@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

RnJvbTogTWFydGluIEJsdW1lbnN0aW5nbCA8bWFydGluLmJsdW1lbnN0aW5nbEBnb29nbGVtYWls
LmNvbT4KClsgVXBzdHJlYW0gY29tbWl0IDUxNDk2ZTQ0NDY4NzU3MjZkNTBhNTYxN2E2ZTBlMGRh
YmJjMmU2ZGEgXQoKVGhlIHByZS1kaXZpZGVyIGFsbG93cyBjb25maWd1cmluZyBsb25nZXIgUFdN
IHBlcmlvZHMgY29tcGFyZWQgdG8gdXNpbmcKdGhlIGlucHV0IGNsb2NrIGRpcmVjdGx5LiBUaGUg
cHJlLWRpdmlkZXIgaXMgNyBiaXQgd2lkZSwgbWVhbmluZyBpdCdzCm1heGltdW0gdmFsdWUgaXMg
MTI4ICh0aGUgcmVnaXN0ZXIgdmFsdWUgaXMgb2ZmLWJ5LW9uZTogMHg3ZiBvciAxMjcpLgoKQ2hh
bmdlIHRoZSBsb29wIHRvIGFsc28gYWxsb3cgZm9yIHRoZSBtYXhpbXVtIHBvc3NpYmxlIHZhbHVl
IHRvIGJlCmNvbnNpZGVyZWQgdmFsaWQuCgpGaXhlczogMjExZWQ2MzA3NTNkMmYgKCJwd206IEFk
ZCBzdXBwb3J0IGZvciBNZXNvbiBQV00gQ29udHJvbGxlciIpClNpZ25lZC1vZmYtYnk6IE1hcnRp
biBCbHVtZW5zdGluZ2wgPG1hcnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+CkFja2Vk
LWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgpS
ZXZpZXdlZC1ieTogTmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdAYmF5bGlicmUuY29tPgpTaWdu
ZWQtb2ZmLWJ5OiBUaGllcnJ5IFJlZGluZyA8dGhpZXJyeS5yZWRpbmdAZ21haWwuY29tPgpTaWdu
ZWQtb2ZmLWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+Ci0tLQogZHJpdmVycy9w
d20vcHdtLW1lc29uLmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9wd20vcHdtLW1lc29uLmMgYi9k
cml2ZXJzL3B3bS9wd20tbWVzb24uYwppbmRleCA5Yjc5Y2JjN2E3MTUuLjk1NTFmODk2ZGQ2ZiAx
MDA2NDQKLS0tIGEvZHJpdmVycy9wd20vcHdtLW1lc29uLmMKKysrIGIvZHJpdmVycy9wd20vcHdt
LW1lc29uLmMKQEAgLTE4OCw3ICsxODgsNyBAQCBzdGF0aWMgaW50IG1lc29uX3B3bV9jYWxjKHN0
cnVjdCBtZXNvbl9wd20gKm1lc29uLAogCWRvX2RpdihmaW5fcHMsIGZpbl9mcmVxKTsKIAogCS8q
IENhbGMgcHJlX2RpdiB3aXRoIHRoZSBwZXJpb2QgKi8KLQlmb3IgKHByZV9kaXYgPSAwOyBwcmVf
ZGl2IDwgTUlTQ19DTEtfRElWX01BU0s7IHByZV9kaXYrKykgeworCWZvciAocHJlX2RpdiA9IDA7
IHByZV9kaXYgPD0gTUlTQ19DTEtfRElWX01BU0s7IHByZV9kaXYrKykgewogCQljbnQgPSBESVZf
Uk9VTkRfQ0xPU0VTVF9VTEwoKHU2NClwZXJpb2QgKiAxMDAwLAogCQkJCQkgICAgZmluX3BzICog
KHByZV9kaXYgKyAxKSk7CiAJCWRldl9kYmcobWVzb24tPmNoaXAuZGV2LCAiZmluX3BzPSVsbHUg
cHJlX2Rpdj0ldSBjbnQ9JXVcbiIsCkBAIC0xOTcsNyArMTk3LDcgQEAgc3RhdGljIGludCBtZXNv
bl9wd21fY2FsYyhzdHJ1Y3QgbWVzb25fcHdtICptZXNvbiwKIAkJCWJyZWFrOwogCX0KIAotCWlm
IChwcmVfZGl2ID09IE1JU0NfQ0xLX0RJVl9NQVNLKSB7CisJaWYgKHByZV9kaXYgPiBNSVNDX0NM
S19ESVZfTUFTSykgewogCQlkZXZfZXJyKG1lc29uLT5jaGlwLmRldiwgInVuYWJsZSB0byBnZXQg
cGVyaW9kIHByZV9kaXZcbiIpOwogCQlyZXR1cm4gLUVJTlZBTDsKIAl9Ci0tIAoyLjIwLjEKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxv
Z2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
