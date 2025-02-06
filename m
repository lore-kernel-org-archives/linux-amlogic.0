Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44117C02194
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Feb 2025 17:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O1jlJbNC9gO10lpKHq+kIv9UTBly7VDzqdzllafC620=; b=it2PwxxJm07xQX
	UTCASCkj+ahyKKZH7guetRpTSt0iijqFHXCBScxcVWL0g99Wjc/gHBYVUPeuoUJeowzGL2FgZ94Nx
	4AohO4zo3Zhwoj2Y0iO2Pbd9QVtt/ChM6Y5Mh9sSS4R39G6I4OXi2+xzHO17r97QJkPx6rg8798VW
	B1noFIahBaRu4OmfREoSqCg/cln6hFutxErjUdwyv8hFf/+S1+xCYTguuFaOBJU0DfFk2tFtDsdoZ
	jlrkznAutG8zEhF7t8EEBGCpcAYi4lwOBk27TH5j2+hBHBBPLNazmAaV4X+LJoknjOYmYaCLRJv/i
	5f8v8KKoDHxj/PTzqIrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg68o-000000074IA-26xJ;
	Thu, 06 Feb 2025 17:58:18 +0000
Received: from out-177.mta0.migadu.com ([2001:41d0:1004:224b::b1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg67W-00000007419-1LZC
	for linux-amlogic@lists.infradead.org;
	Thu, 06 Feb 2025 17:56:59 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1738864601;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w1Ia8rkI+1aqp/BE7ykJwCWC2yFoWhBOndDQb5udbXE=;
	b=Zcruyz62rIFMRV7nP0cqLglClrweMo/C1yT3rMF6lT888HLeDTO8Ll6t5GGgjgYHB+xdaj
	i9qilqbOok7wWndAewqrqlcDnfYzmFaiO7UGn6ficjBM+CnUiskqgvRMB1Edi4ZYk7O+Yb
	sup2AYZODDtaPUHwfseE3VyQy4o5plRhZF6duBEqrKKl0NN1sQ+K1MLGCyc6MwMk0SbVj+
	b3qT0cDf2urdQMZpVpJHjkqcFvulLIR1wpOvAZx+Q0/IrnVUtm9Mkz/yHOeBlxKpEd6t54
	6JPQEFBazVkvE9vfrzXZBdWwcuwt5Srtq3zlnaH5dlQKcrzVDiGrNe00fyX9vA==
Date: Thu, 06 Feb 2025 17:55:48 +0000
Message-Id: <D7LK1DPOAAG5.3EUG8X7DVSDO5@postmarketos.org>
Subject: Re: [PATCH v4 2/2] arm64: dts: amlogic: add support for
 xiaomi-aquaman/Mi TV Stick
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Ferass El Hafidi" <funderscore@postmarketos.org>
To: "exxxxkc" <exxxxkc@getgoogleoff.me>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Kevin Hilman" <khilman@baylibre.com>, "Jerome
 Brunet" <jbrunet@baylibre.com>, "Martin Blumenstingl"
 <martin.blumenstingl@googlemail.com>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, <linux-amlogic@lists.infradead.org>
References: <20250203174346.13737-1-funderscore@postmarketos.org>
 <20250203174346.13737-3-funderscore@postmarketos.org>
 <19c8e021-d2c8-44b4-968b-153d798c140d@getgoogleoff.me>
In-Reply-To: <19c8e021-d2c8-44b4-968b-153d798c140d@getgoogleoff.me>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_095658_490900_42A5A7FB 
X-CRM114-Status: UNSURE (   9.92  )
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
Cc: devicetree@vger.kernel.org, Artur Weber <aweber.kernel@gmail.com>, linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gVGh1IEZlYiA2LCAyMDI1IGF0IDQ6MTQgUE0gVVRDLCBleHh4eGtjIHdyb3RlOgo+ICDCoHVt
IGl0IHNlZW0gdGhlIHNkaW8gd2lmaSBtb2R1bGUvY2hpcCBjb25uZWN0ZWQgdG8gc2RfZW1tY19h
IGl0IGlzIAo+IGFjdHVhbGx5IGNvbm5lY3RlZCB0byBzZF9lbW1jX2IKPgo+IGkgdHJpZWQgdG8g
ZW5hYmxlIHNkX2VtbWNfYSBidXQgbm90aGluZyBzaG93ZWQgdXAgaW4gdGhlIGtlcm5lbCB0aHVz
IGkgCj4gdHJpZWQgdG8gZW5hYmxlZCBzZGRfZW1tY19iIGFuZCB0aGVyZSBhcmUgYSBzZGlvIGRl
dmljZSBzaG93ZWQgaW4gdGhlIAo+IGtlcm5lbCAoc2RpbzpjMDd2ODg4OGQ4ODg4KQo+Cj4gPGh0
dHBzOi8vbWF0cml4LnRvLyMvIWJEREFjYmFERFlZd3NWZ2VsajpwaXhpZS50b3duLyRZVVNRSVot
cEYyMmo5LUVsckNzdDhYQ1VnMXBhYzdDeldiVWluTlpMOUhJP3ZpYT1waXhpZS50b3duJnZpYT1t
YXRyaXgub3JnJnZpYT1kaXNzb25hbnQuZGV2Pgo+Cj4gYWNjIHRvIGh0dHBzOi8vcGFzdGUuY29y
ZWVsZWMub3JnL0Nvb2xlcnNIdXJyeSAKPiA8aHR0cHM6Ly9wYXN0ZS5jb3JlZWxlYy5vcmcvQ29v
bGVyc0h1cnJ5PiBpdCBzZWVtIGl0IGlzIGFtbG9naWMgdzEgY2hpcCA/Cj4KPiAod2VsbCBvbiBt
eSBib2FyZCBpdCBpcyBhbWxvZ2ljIHcxLiB0aGVyZSBhcmUgc29tZSB2YXJpYW50IHRoYXQgdXNl
IAo+IG90aGVyIHdpZmkgY2hpcCApCgpHb29kIGNhdGNoISAgSSdsbCBzZWUgaWYgSSBjYW4gbWVz
cyBhcm91bmQgd2l0aCB0aGF0IHN0dWZmIGEgYml0IG1vcmUgYXQKc29tZSBwb2ludC4KCkNoZWVy
cyEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
