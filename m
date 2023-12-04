Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5549C4167B
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Dec 2023 12:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k6xIsII/Q4bFfZx1hYYcWQ12XOTSb23DK/PdytRBfWA=; b=wYyeByaXnhfZC2
	DuE3Bfd969SblYyjXwRH9Pw86ycGwAscM74gkt3Dvhmsiwc6dc81NlzfDxcvEH1F3VbG/crj982hy
	IW64o8tMKoSTcuP0h5Wa04pf7fs+3AzzS0PF+j0eyNTjN1ghYCUOeixZuhjGStBq9ei73VKbJ81VQ
	plsuCRAGD+pJEKBjtr15G2bKuuzJV/wsdhqOGOvu/vNVrwchJFoI8UoPY/DMkSAwL6BDcb8iwxPty
	yb++NZbdsxZ7SBgv8XbzsvdJmPHlTv9eeH04xVin3U3LGo9AhhQoaoK+UR5ar/J1FXvt0m71tci0B
	luHV+ImfBIXAXKLG/bMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rA7p3-003qsD-2o;
	Mon, 04 Dec 2023 12:13:13 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rA7p0-003qpF-1w;
	Mon, 04 Dec 2023 12:13:12 +0000
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C0E1766022D1;
	Mon,  4 Dec 2023 12:13:06 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701691988;
	bh=tYd+006RlkhE3PTruMujBJkOUxyMROXE4vAkt2e6WD4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=An6NqerwwhgGfO8PGeiYcMYDkkuGon45hnJi/L5mKU/QUdg8fXvHweDyu5ouS377l
	 MKZ6u1N7V2WC5ff3OfmXddClu7wle9xb4uwQ0yBIGJ/TuJs2rZBRt5Vs3yvhbwLVll
	 K6x+zpiw3JjZkGiFIt82WgE3fbPpLsR2oN+Wzna4S+YOr805gK0P8Ky6C8jdfl3x9n
	 r+oyS8WKSetKFh7uLlkoA2V/I8OEmpjA1T7RDXZiNd+khnQDR43UO15PtIPpI4f9hy
	 7d2YQy5e/pSWd35k0m8RC2l2iw2xccJQkAGzfcDK9oNhacXJFDNCfkDdvvd3ZiSj8D
	 RDMhW/jizj9EA==
Message-ID: <d03bf5b8-d4d7-4080-9af4-17b31ef6c72b@collabora.com>
Date: Mon, 4 Dec 2023 13:13:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] docs: dt-bindings: add DTS Coding Style document
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: Andrew Davis <afd@ti.com>, Andrew Lunn <andrew@lunn.ch>,
 Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <andersson@kernel.org>,
 Chen-Yu Tsai <wens@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>, Michal Simek <michal.simek@amd.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Nishanth Menon <nm@ti.com>,
 Olof Johansson <olof@lixom.net>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <zajec5@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org
References: <20231203174622.18402-1-krzysztof.kozlowski@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231203174622.18402-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_041310_844130_41ED4346 
X-CRM114-Status: UNSURE (   7.53  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SWwgMDMvMTIvMjMgMTg6NDYsIEtyenlzenRvZiBLb3psb3dza2kgaGEgc2NyaXR0bzoKPiBEb2N1
bWVudCBwcmVmZXJyZWQgY29kaW5nIHN0eWxlIGZvciBEZXZpY2V0cmVlIHNvdXJjZXMgKERUUyBh
bmQgRFRTSSksCj4gdG8gYnJpbmcgY29uc2lzdGVuY3kgYW1vbmcgYWxsIChzdWIpYXJjaGl0ZWN0
dXJlcyBhbmQgZWFzZSBpbiByZXZpZXdzLgo+IAo+IENjOiBBbmRyZXcgRGF2aXMgPGFmZEB0aS5j
b20+Cj4gY2M6IEFuZHJldyBMdW5uIDxhbmRyZXdAbHVubi5jaD4KPiBDYzogQW5nZWxvR2lvYWNj
aGlubyBEZWwgUmVnbm8gPGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNvbT4K
PiBDYzogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KPiBDYzogQmpvcm4gQW5kZXJzc29u
IDxhbmRlcnNzb25Aa2VybmVsLm9yZz4KPiBDYzogQ2hlbi1ZdSBUc2FpIDx3ZW5zQGtlcm5lbC5v
cmc+Cj4gQ2M6IERtaXRyeSBCYXJ5c2hrb3YgPGRtaXRyeS5iYXJ5c2hrb3ZAbGluYXJvLm9yZz4K
PiBDYzogSm9uYXRoYW4gQ29yYmV0IDxjb3JiZXRAbHduLm5ldD4KPiBDYzogTWF0dGhpYXMgQnJ1
Z2dlciA8bWF0dGhpYXMuYmdnQGdtYWlsLmNvbT4KPiBDYzogTWljaGFsIFNpbWVrIDxtaWNoYWwu
c2ltZWtAYW1kLmNvbT4KPiBDYzogTmVpbCBBcm1zdHJvbmcgPG5laWwuYXJtc3Ryb25nQGxpbmFy
by5vcmc+Cj4gQ2M6IE5pc2hhbnRoIE1lbm9uIDxubUB0aS5jb20+Cj4gQ2M6IE9sb2YgSm9oYW5z
c29uIDxvbG9mQGxpeG9tLm5ldD4KPiBDYzogUmFmYcWCIE1pxYJlY2tpIDx6YWplYzVAZ21haWwu
Y29tPgo+IEFja2VkLWJ5OiBOZWlsIEFybXN0cm9uZyA8bmVpbC5hcm1zdHJvbmdAbGluYXJvLm9y
Zz4KPiBBY2tlZC1ieTogSGVpa28gU3R1ZWJuZXIgPGhlaWtvQHNudGVjaC5kZT4KPiBSZXZpZXdl
ZC1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29t
Pgo+IEFja2VkLWJ5OiBLb25yYWQgRHliY2lvIDxrb25yYWR5YmNpb0BrZXJuZWwub3JnPgo+IFJl
dmlld2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPgo+
IFNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lA
bGluYXJvLm9yZz4KPiAKClJldmlld2VkLWJ5OiBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyA8
YW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29tPgoKVGh1bWJzIHVwIQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dp
YyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
