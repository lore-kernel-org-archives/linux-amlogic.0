Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DE6DC02194
	for <linux-amlogic@archiver.kernel.org>; Fri, 31 Jan 2025 20:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pOLNkdf5UWXpkEKBbSDWighqYZcyce+BEg4VPrPAXF0=; b=V356+OqPI3PYnj
	Qe8aaHrOILgwG3wyagqc0PWx/T3+xWJnZ1oUmQYj0zDrM+IXdR4GdhB6vSb4kXwmwKuMXyH23w/4Y
	whJf4gHhQxllfnmLtl9gEPcPT2GbPnel5QJSXSzZUAI51TZctOqXeDRMLcYpR2a4sz2DH/uHy6T4h
	HXJNQCB+ommmplSmrUbbAf3HItjkRjqJzhVUS+ORnhbBZZMhxnnin9/GOzu9yTPL5RSZ9MNreoy/s
	COzZ/kFDTkxqVxY6sBSX0Jca66RMecHVwL8ZYyJGGM+y/fUdToVSYipV7yLON9Hc09B09biX6UhWT
	ERPJcFD92+0BRewlzidw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdxGc-0000000BLP3-15He;
	Fri, 31 Jan 2025 20:05:30 +0000
Received: from out-176.mta0.migadu.com ([2001:41d0:1004:224b::b0])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdxGa-0000000BLNY-0nO0
	for linux-amlogic@lists.infradead.org;
	Fri, 31 Jan 2025 20:05:29 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1738353925;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oONFBN9kRWZhgPfaLK5ZjKIMG9MQ+h62PBu+80B8xeI=;
	b=GcDOkICOn3Tr7pKWUWR4rcuOIbez6/m23DvRRqkDFIw0kMTlLUrUabDF9UrH2uptTcU2Zi
	8qdakhRJV6dOrsdZ40nyTp7+k6GpfULfbfDFcW8gnPaj5RVZsQmFl6G9+J9F8exYEjE5mK
	P8lv/dsSinloQ4aucEtEGHr0kxQBUqrwRoidWkkgYZ74wK30JZV/e9lnjniLHpOfepX0Jp
	wHvRjEr0htCEz55GnLQazEjAw8VkRdNzuHfxgnWOuN50tXz0CKmmLVCHGaaSW1626RzLLY
	sP5rURjoSQ7mRqiF4LHvwe7bHlRo6Jxk3QoNSuB9p572d7AmQqU2CXb8CJ8CdA==
From: Ferass El Hafidi <funderscore@postmarketos.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	funderscore@postmarketos.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Artur Weber <aweber.kernel@gmail.com>,
	Karl Chan <exxxxkc@getgoogleoff.me>
Subject: [PATCH 1/2] dt-bindings: arm: amlogic: add Xiaomi Mi TV Stick
Date: Fri, 31 Jan 2025 20:03:18 +0000
Message-ID: <20250131200319.19996-2-funderscore@postmarketos.org>
In-Reply-To: <20250131200319.19996-1-funderscore@postmarketos.org>
References: <20250131200319.19996-1-funderscore@postmarketos.org>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_120528_370413_30C20DAF 
X-CRM114-Status: UNSURE (   6.77  )
X-CRM114-Notice: Please train this message.
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

RnJvbTogRmVyYXNzIEVswqBIYWZpZGkgPGZ1bmRlcnNjb3JlQHBvc3RtYXJrZXRvcy5vcmc+CgpB
ZGQgc3VwcG9ydCBmb3IgeGlhb21pLWFxdWFtYW4uCgpTaWduZWQtb2ZmLWJ5OiBGZXJhc3MgRWzC
oEhhZmlkaSA8ZnVuZGVyc2NvcmVAcG9zdG1hcmtldG9zLm9yZz4KLS0tCiBEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2FtbG9naWMueWFtbCB8IDEgKwogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2FybS9hbWxvZ2ljLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvYXJtL2FtbG9naWMueWFtbAppbmRleCAwNjQ3ODUxYWUuLjBkYjcwMzhiOSAxMDA2NDQK
LS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9hbWxvZ2ljLnlhbWwK
KysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9hbWxvZ2ljLnlhbWwK
QEAgLTcwLDYgKzcwLDcgQEAgcHJvcGVydGllczoKICAgICAgICAgICAtIGVudW06CiAgICAgICAg
ICAgICAgIC0gYW1sb2dpYyxwMjQxCiAgICAgICAgICAgICAgIC0gbGlicmV0ZWNoLGFtbC1zODA1
eC1hYworICAgICAgICAgICAgICAtIHhpYW9taSxhcXVhbWFuCiAgICAgICAgICAgLSBjb25zdDog
YW1sb2dpYyxzODA1eAogICAgICAgICAgIC0gY29uc3Q6IGFtbG9naWMsbWVzb24tZ3hsCiAKLS0g
CjIuNDcuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFt
bG9naWMK
