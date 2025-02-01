Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A23E9C0218A
	for <linux-amlogic@archiver.kernel.org>; Sat,  1 Feb 2025 19:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=61mQToWYWjp8cFlHC1pjiVg/XBWWrE2VeTkEgEcjTcQ=; b=oBCgamoIT4AO0Z
	kb1HXprqVnBq0/FCq0h8k2qVhCO1fxNjijSFcXuJDR/CTDcri4EG1bxM7otw2pWDZkBZ4SHHvWHqA
	wRRJD2uPMGIeKSMfR2OHllv4W9jWm/yCGUDtT9/o+IjkUqXdHPJNlarn5iyWSp7pfdr2Fns5m5uRE
	6Jac36oc9e/biXY6tXkr8puTW2nwCQF83cJziLS5j7kwx+GNzIIUAM2hzZy8EgAPxnW6fzMdb2XJV
	wotoKGk4VtGbYF+ARBPJoUeL0M7iNqespQFnV56OhrwcYmU23t4LFOLsU9wNgNOpoC2A8lJauc17c
	Ng/YPyDHnYEYepXqA3VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teJEr-0000000D3fq-2hPk;
	Sat, 01 Feb 2025 19:33:09 +0000
Received: from out-176.mta0.migadu.com ([91.218.175.176])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teJDX-0000000D3WU-1hf4
	for linux-amlogic@lists.infradead.org;
	Sat, 01 Feb 2025 19:31:48 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1738438304;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GezYrVzu+YD7bTihqKHBeWrBY4Y7kTGdsfDTKSVrcYw=;
	b=QsQ+wdcQIP4WYeJg2m4RJE1msXtINK9SDawNFkugGg5x7nY5AAH2vOzB/fFV/jX0GkHNP4
	xeZ09ZiJupGf6XYLiBra6ydyUtRjqj5t9wr9S1pbo2WcIJy3CpolAmQYS6hLQPREImQfaO
	k5EakChRlKVmilag9erNiBwLtAUOnZTcv+5tfzU2yEsikCerhjlpYA/5L7owizQs11KWyI
	mn/2GwU6rDV4wQIoF8p5gMtPteu2fmI5PgPEGglI3oVZo9cIBGE/WDP/5mDWoAengOU6pK
	YoKFZCMNTdbczwdzs0mmZ89ofmSjWMmx/btqFlOQdSPsf2MQZkieWkxlCSn5Bw==
From: Ferass El Hafidi <funderscore@postmarketos.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-amlogic@lists.infradead.org
Subject: [PATCH v2 1/2] dt-bindings: arm: amlogic: add S805Y and Mi TV Stick
Date: Sat,  1 Feb 2025 19:30:43 +0000
Message-ID: <20250201193044.28856-2-funderscore@postmarketos.org>
In-Reply-To: <20250201193044.28856-1-funderscore@postmarketos.org>
References: <20250201193044.28856-1-funderscore@postmarketos.org>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250201_113147_590588_6ECD1542 
X-CRM114-Status: UNSURE (   6.36  )
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
Cc: devicetree@vger.kernel.org, Artur Weber <aweber.kernel@gmail.com>, Karl Chan <exxxxkc@getgoogleoff.me>, linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, funderscore@postmarketos.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

RnJvbTogRmVyYXNzIEVswqBIYWZpZGkgPGZ1bmRlcnNjb3JlQHBvc3RtYXJrZXRvcy5vcmc+CgpB
ZGQgc3VwcG9ydCBmb3IgdGhlIEFtbG9naWMgUzgwNVkgU29DIGFuZCB0aGUgWGlhb21pIE1pIFRW
IFN0aWNrIChha2EuCnhpYW9taS1hcXVhbWFuKS4gIFRoZSBTODA1WSBpcyB2ZXJ5IHNpbWlsYXIg
dG8gdGhlIFM4MDVYLCB3aXRoIGp1c3QgYQpmZXcgbWlub3IgZGlmZmVyZW5jZXMuCgpTaWduZWQt
b2ZmLWJ5OiBGZXJhc3MgRWzCoEhhZmlkaSA8ZnVuZGVyc2NvcmVAcG9zdG1hcmtldG9zLm9yZz4K
LS0tCiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2FtbG9naWMueWFtbCB8
IDcgKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vYW1sb2dpYy55YW1sIGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9hbWxvZ2ljLnlhbWwKaW5kZXggMDY0
Nzg1MWFlLi4zNDAzMzYyZTAgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9hcm0vYW1sb2dpYy55YW1sCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9hcm0vYW1sb2dpYy55YW1sCkBAIC03Myw2ICs3MywxMyBAQCBwcm9wZXJ0aWVzOgog
ICAgICAgICAgIC0gY29uc3Q6IGFtbG9naWMsczgwNXgKICAgICAgICAgICAtIGNvbnN0OiBhbWxv
Z2ljLG1lc29uLWd4bAogCisgICAgICAtIGRlc2NyaXB0aW9uOiBCb2FyZHMgd2l0aCB0aGUgQW1s
b2dpYyBNZXNvbiBHWEwgUzgwNVkgU29DCisgICAgICAgIGl0ZW1zOgorICAgICAgICAgIC0gZW51
bToKKyAgICAgICAgICAgICAgLSB4aWFvbWksYXF1YW1hbgorICAgICAgICAgIC0gY29uc3Q6IGFt
bG9naWMsczgwNXkKKyAgICAgICAgICAtIGNvbnN0OiBhbWxvZ2ljLG1lc29uLWd4bAorCiAgICAg
ICAtIGRlc2NyaXB0aW9uOiBCb2FyZHMgd2l0aCB0aGUgQW1sb2dpYyBNZXNvbiBHWEwgUzkwNVcg
U29DCiAgICAgICAgIGl0ZW1zOgogICAgICAgICAgIC0gZW51bToKLS0gCjIuNDcuMQoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMg
bWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
