Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C513C4167B
	for <linux-amlogic@archiver.kernel.org>; Sun,  3 Dec 2023 18:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eNE9ctTSvG2aWVXmGj9OMLYHSQIG8AitrXgVxN2YoW4=; b=rSSnZE2V+PpmvQ
	sp13cggTqWvadBwA8wSWw5KCVSmHM97E85jgnsgTCHaaGpmZ395oPDAKHX9jmiAIOebX1vlv/Y/kJ
	xPsOztWzpzJkd1ZsMgnUSi9LBky3cTFGvVcZvOY7YEzxesxDifMavhVF61OSmCWYemSWImNFFc+eS
	RQQU2Xvz/RmNJqhqDAA+DJ+inMLuyH3Rd7t8Tb4wq/oYVtSVqTF0veLEDtc81zjwy1WB4ywJ4t8L3
	46k/TakzJaEExQ5Uvfghdpl0Y3rCj0Ef8NRgSXdRBkXonakyjPcHSfrK1GFFE8bayps1MsXRMa0K9
	HAvwGuVf1hjR02CFD4sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r9rOZ-002RuN-0Z;
	Sun, 03 Dec 2023 18:40:47 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r9rOT-002RmK-3B;
	Sun, 03 Dec 2023 18:40:44 +0000
Received: from gaggiata.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 5DE06201D4;
	Sun,  3 Dec 2023 19:40:31 +0100 (CET)
Received: from livingston (unknown [192.168.42.11])
	by gaggiata.pivistrello.it (Postfix) with ESMTP id 0C5E67F9C0;
	Sun,  3 Dec 2023 19:40:31 +0100 (CET)
Received: from pivi by livingston with local (Exim 4.96)
	(envelope-from <francesco@dolcini.it>)
	id 1r9rOI-0000pW-2v;
	Sun, 03 Dec 2023 19:40:30 +0100
Date: Sun, 3 Dec 2023 19:40:30 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, Andrew Davis <afd@ti.com>,
	Andrew Lunn <andrew@lunn.ch>, Arnd Bergmann <arnd@arndb.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Michal Simek <michal.simek@amd.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Nishanth Menon <nm@ti.com>, Olof Johansson <olof@lixom.net>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v4] docs: dt-bindings: add DTS Coding Style document
Message-ID: <ZWzLns9CPK3xeTzG@livingston.pivistrello.it>
References: <20231203174622.18402-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231203174622.18402-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231203_104042_233374_DEFFABE8 
X-CRM114-Status: UNSURE (   7.64  )
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

SGVsbG8gS3J6eXN6dG9mLAoKT24gU3VuLCBEZWMgMDMsIDIwMjMgYXQgMDY6NDY6MjJQTSArMDEw
MCwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiBEb2N1bWVudCBwcmVmZXJyZWQgY29kaW5n
IHN0eWxlIGZvciBEZXZpY2V0cmVlIHNvdXJjZXMgKERUUyBhbmQgRFRTSSksCj4gdG8gYnJpbmcg
Y29uc2lzdGVuY3kgYW1vbmcgYWxsIChzdWIpYXJjaGl0ZWN0dXJlcyBhbmQgZWFzZSBpbiByZXZp
ZXdzLgo+IAo+IENjOiBBbmRyZXcgRGF2aXMgPGFmZEB0aS5jb20+Cj4gY2M6IEFuZHJldyBMdW5u
IDxhbmRyZXdAbHVubi5jaD4KPiBDYzogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPGFuZ2Vs
b2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNvbT4KPiBDYzogQXJuZCBCZXJnbWFubiA8
YXJuZEBhcm5kYi5kZT4KPiBDYzogQmpvcm4gQW5kZXJzc29uIDxhbmRlcnNzb25Aa2VybmVsLm9y
Zz4KPiBDYzogQ2hlbi1ZdSBUc2FpIDx3ZW5zQGtlcm5lbC5vcmc+Cj4gQ2M6IERtaXRyeSBCYXJ5
c2hrb3YgPGRtaXRyeS5iYXJ5c2hrb3ZAbGluYXJvLm9yZz4KPiBDYzogSm9uYXRoYW4gQ29yYmV0
IDxjb3JiZXRAbHduLm5ldD4KPiBDYzogTWF0dGhpYXMgQnJ1Z2dlciA8bWF0dGhpYXMuYmdnQGdt
YWlsLmNvbT4KPiBDYzogTWljaGFsIFNpbWVrIDxtaWNoYWwuc2ltZWtAYW1kLmNvbT4KPiBDYzog
TmVpbCBBcm1zdHJvbmcgPG5laWwuYXJtc3Ryb25nQGxpbmFyby5vcmc+Cj4gQ2M6IE5pc2hhbnRo
IE1lbm9uIDxubUB0aS5jb20+Cj4gQ2M6IE9sb2YgSm9oYW5zc29uIDxvbG9mQGxpeG9tLm5ldD4K
PiBDYzogUmFmYcWCIE1pxYJlY2tpIDx6YWplYzVAZ21haWwuY29tPgo+IEFja2VkLWJ5OiBOZWls
IEFybXN0cm9uZyA8bmVpbC5hcm1zdHJvbmdAbGluYXJvLm9yZz4KPiBBY2tlZC1ieTogSGVpa28g
U3R1ZWJuZXIgPGhlaWtvQHNudGVjaC5kZT4KPiBSZXZpZXdlZC1ieTogTGF1cmVudCBQaW5jaGFy
dCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgo+IEFja2VkLWJ5OiBLb25yYWQg
RHliY2lvIDxrb25yYWR5YmNpb0BrZXJuZWwub3JnPgo+IFJldmlld2VkLWJ5OiBHZWVydCBVeXR0
ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPgo+IFNpZ25lZC1vZmYtYnk6IEtyenlz
enRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4KClJldmlld2Vk
LWJ5OiBGcmFuY2VzY28gRG9sY2luaSA8ZnJhbmNlc2NvLmRvbGNpbmlAdG9yYWRleC5jb20+CgpG
cmFuY2VzY28KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1h
bWxvZ2ljCg==
