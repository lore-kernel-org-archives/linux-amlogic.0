Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2281AC02198
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Feb 2025 16:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EJshjm4zjxuYd7LBc+7lPlpQQb71nA9vsxkoA8W22w0=; b=uzV9Tv++rjHJ1cj4cvkR3JJ+zC
	urFXEIovBr8MVuvwCGvBh1Scw9H7ynmbz+YQzbTRCr/TUwFWi6jojF3lqKp6ZI3MsHO5YdxWdaySw
	fxSmEo3iFbB+Ap5FWURxPI0v7VnKxOmkq8PIxWdvn0WNg/RU+bdTRfuUw0WVQybweQHJtGCFfJClv
	z5yIRYnKMR99kkuCrUkk+J+l6ciOvyglbUkokkOOjk3emLZHWF/+r2vEMIol/ui6Nk3V4gEy6jM/e
	L0J/vmbb6RMr5P1vq68pul8bdqQ3sOpDzMXm4bTQRgdAwb22gl+NvcyZ35V9uTH9KP8n/VAhyCp+u
	oZO84qSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg4aj-00000006pYI-1Bxs;
	Thu, 06 Feb 2025 16:19:01 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg4Xv-00000006owV-1Rpl;
	Thu, 06 Feb 2025 16:16:11 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 7229C25BAE;
	Thu,  6 Feb 2025 17:16:02 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hyL6I1G5C-bU; Thu,  6 Feb 2025 17:15:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=getgoogleoff.me;
	s=mail; t=1738858540;
	bh=Art8KyjybfoeMsnHABrcEmWzkyDUcEOdHCbqDbJH+iQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=WoPMQMphaWzP9CeiXeEat/xaNv13qpR57gZ4ZZv4MlMnvrnMPnN3kO4QIpqjFu6gE
	 S1ELpMzJHCILHrn+eLo1BM8n7WHjRtX6khq0Dq3vG+Z76Yx0AbppnNSq+vEFTaq4+g
	 GhixIAbTP5K1DtQrb2jWzPvZF9jj68vjpyREtL2vcM2o+d4G5vm0ciP6NupzKyLlrz
	 fy0XdClOAdGjnbpC5/FUfD4ZSF9Sd6VfS2IuGdSVCXezMIDEf9gKk1gmE40uNU4YlW
	 DbjjlD7efyOQ5KAf5SWPlu2Nq0PZIbxTSEuMScAN0uFTYgTomNtGs78bU/Q0vdiS12
	 MWz8hdrqZDl0Q==
Message-ID: <19c8e021-d2c8-44b4-968b-153d798c140d@getgoogleoff.me>
Date: Fri, 7 Feb 2025 00:14:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arm64: dts: amlogic: add support for
 xiaomi-aquaman/Mi TV Stick
To: Ferass El Hafidi <funderscore@postmarketos.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-amlogic@lists.infradead.org
References: <20250203174346.13737-1-funderscore@postmarketos.org>
 <20250203174346.13737-3-funderscore@postmarketos.org>
Content-Language: en-US
From: exxxxkc <exxxxkc@getgoogleoff.me>
In-Reply-To: <20250203174346.13737-3-funderscore@postmarketos.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_081607_795592_1FE7093B 
X-CRM114-Status: UNSURE (   9.91  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

PiArCj4gKy8qIFdpcmVsZXNzIFNESU8gTW9kdWxlICovCj4gKyZzZF9lbW1jX2Egewo+ICsJc3Rh
dHVzID0gImRpc2FibGVkIjsKPiArCXBpbmN0cmwtMCA9IDwmc2Rpb19waW5zPjsKPiArCXBpbmN0
cmwtMSA9IDwmc2Rpb19jbGtfZ2F0ZV9waW5zPjsKPiArCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVs
dCIsICJjbGstZ2F0ZSI7Cj4gKwkjYWRkcmVzcy1jZWxscyA9IDwxPjsKPiArCSNzaXplLWNlbGxz
ID0gPDA+Owo+ICsKPiArCWJ1cy13aWR0aCA9IDw0PjsKPiArCWNhcC1zZC1oaWdoc3BlZWQ7Cj4g
KwltYXgtZnJlcXVlbmN5ID0gPDUwMDAwMDAwPjsKPiArCj4gKwlub24tcmVtb3ZhYmxlOwo+ICsJ
ZGlzYWJsZS13cDsKPiArCj4gKwkvKiBXaUZpIGZpcm13YXJlIHJlcXVpcmVzIHBvd2VyIHRvIGJl
IGtlcHQgd2hpbGUgaW4gc3VzcGVuZCAqLwo+ICsJa2VlcC1wb3dlci1pbi1zdXNwZW5kOwo+ICsK
PiArCW1tYy1wd3JzZXEgPSA8JnNkaW9fcHdyc2VxPjsKPiArCj4gKwl2bW1jLXN1cHBseSA9IDwm
dmRkYW9fM3YzPjsKPiArCXZxbW1jLXN1cHBseSA9IDwmdmRkaW9fYm9vdD47Cj4gK307Cj4gKwo+
CiDCoHVtIGl0IHNlZW0gdGhlIHNkaW8gd2lmaSBtb2R1bGUvY2hpcCBjb25uZWN0ZWQgdG8gc2Rf
ZW1tY19hIGl0IGlzIAphY3R1YWxseSBjb25uZWN0ZWQgdG8gc2RfZW1tY19iCgppIHRyaWVkIHRv
IGVuYWJsZSBzZF9lbW1jX2EgYnV0IG5vdGhpbmcgc2hvd2VkIHVwIGluIHRoZSBrZXJuZWwgdGh1
cyBpIAp0cmllZCB0byBlbmFibGVkIHNkZF9lbW1jX2IgYW5kIHRoZXJlIGFyZSBhIHNkaW8gZGV2
aWNlIHNob3dlZCBpbiB0aGUgCmtlcm5lbCAoc2RpbzpjMDd2ODg4OGQ4ODg4KQoKPGh0dHBzOi8v
bWF0cml4LnRvLyMvIWJEREFjYmFERFlZd3NWZ2VsajpwaXhpZS50b3duLyRZVVNRSVotcEYyMmo5
LUVsckNzdDhYQ1VnMXBhYzdDeldiVWluTlpMOUhJP3ZpYT1waXhpZS50b3duJnZpYT1tYXRyaXgu
b3JnJnZpYT1kaXNzb25hbnQuZGV2PgoKYWNjIHRvIGh0dHBzOi8vcGFzdGUuY29yZWVsZWMub3Jn
L0Nvb2xlcnNIdXJyeSAKPGh0dHBzOi8vcGFzdGUuY29yZWVsZWMub3JnL0Nvb2xlcnNIdXJyeT4g
aXQgc2VlbSBpdCBpcyBhbWxvZ2ljIHcxIGNoaXAgPwoKKHdlbGwgb24gbXkgYm9hcmQgaXQgaXMg
YW1sb2dpYyB3MS4gdGhlcmUgYXJlIHNvbWUgdmFyaWFudCB0aGF0IHVzZSAKb3RoZXIgd2lmaSBj
aGlwICkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9n
aWMK
