Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9259EF557F2
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Apr 2026 09:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SoiQBirBrg317UMLt9EkMsW3WgnJATzShB+1VrvIvwo=; b=QzhWdC1MSYBB5V
	BcVMFg6tdlNYyx3hFbSqDGdyGsFvMlrnUCz6hZ3Wau3hPv3jPfOiBOR78zZvQBqeQ1D1XUow3iO9g
	V02Fa/VxOk/7VmVsZea89oK5nI4EEpmoqtm9YTj0cZK4kyDP8dZg1vvBJz9GanvrVXTF9HYJNqJcT
	FuE/Z1zq0RxjrlygBZDBs5ag6iQ4o6AtKwXKY57+zgIAIHBTMXngTQaObxR+qvdTVBhqbTTBCa9/D
	+4XCu7GW83pJwaNLD88RGfkzsCC/6LhZWngzk9iU740YxcUXq6sVj8RBgzQGmlDcFl9WbSoTZsxmw
	nKgObwAPProf/pWzYY+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEktX-00000006fos-48HI;
	Mon, 20 Apr 2026 09:26:20 +0000
Received: from courrier.aliel.fr ([2a01:4f9:c011:1c83::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEktV-00000006fnt-2syE;
	Mon, 20 Apr 2026 09:26:19 +0000
Message-ID: <491eb101-0b4c-42e8-abe5-55ce6a50ea36@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1776677173;
	bh=oiwQ/JNg7RdhRLU0hLjyT7kxMO4nyPSt86GjWiTFxkA=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=MyCqpUsGeKdkAwkQQ35XlGPy+eBYAaIbH/NY2/CJ95Yy/oeco6w20eW6edgX6d1q+
	 An7FFMlzPHBZOEn/Ut0SiukmVPjLn60IPilL6mxxmD6Uh5GyKyEuONB2+xpcoqynxT
	 NvFyBx10UPE8STGpV3dvkHADfag7cuvuMT7lRvwE=
Date: Mon, 20 Apr 2026 11:26:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Subject: Re: [PATCH v2 3/3] arm64: dts: amlogic: t7: khadas-vim4: Enable
 Bluetooth
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260416-add-bluetooth-t7-vim4-v2-0-9a57098fd055@aliel.fr>
 <20260416-add-bluetooth-t7-vim4-v2-3-9a57098fd055@aliel.fr>
 <c9c3227f-2a46-47b5-963f-e784184f7f31@linaro.org>
Content-Language: en-US
In-Reply-To: <c9c3227f-2a46-47b5-963f-e784184f7f31@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_022618_023361_1B253B13 
X-CRM114-Status: UNSURE (   6.58  )
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

T24gNC8yMC8yNiAxMDo0NyBBTSwgTmVpbCBBcm1zdHJvbmcgd3JvdGU6Cj4+IEVuYWJsZSBVQVJU
IEMgb24gdGhlIEtoYWRhcyBWSU00IGJvYXJkIGFuZCBhdHRhY2ggdGhlIEJDTTQzNDM4Cj4+IMKg
IGNvbXBhdGlibGUgQmx1ZXRvb3RoIGNvbnRyb2xsZXIgdG8gaXQuIFRoZSBub2RlIGNvbmZpZ3Vy
ZXMgdGhlIFJUUy9DVFMKPj4gaGFyZHdhcmUgZmxvdyBjb250cm9sLCB0aGUgYXNzb2NpYXRlZCBw
aW5tdXgsIHRoZSBwb3dlciBzdXBwbGllcwo+PiAodmRkYW9fM3YzCj4+IGFuZCB2ZGRhb18xdjgp
LCB0aGUgMzIga0h6IExQTyBjbG9jayBzaGFyZWQgd2l0aCB0aGUgd2lmaTMyayBmaXhlZAo+PiBj
bG9jaywgYW5kIHRoZSBHUElPIGxpbmVzIHVzZWQgZm9yIGhvc3Qgd2FrZXVwLCBkZXZpY2Ugd2Fr
ZXVwIGFuZAo+PiBzaHV0ZG93bi4KPj4KPj4gUmVtb3ZlIGNsb2NrcyBhbmQgY2xvY2stbmFtZXMg
Zm9yIFVBUlQgQSwgYXMgdGhleSBhcmUgZGVmaW5lZCBpbiBEVFNJLgo+IAo+IFRoaXMgc2hvdWxk
IGJlIGEgc2VwYXJhdGUgcGF0Y2guCgpUaGFua3MgZm9yIHlvdXIgZmVlZGJhY2suCkkgd2lsbCB0
aGVuIGFkZCB0aGUgcmVtb3ZlIHJlZHVuZGFudCBjbG9ja3MgYmVmb3JlIHRoYXQgb25lLgoKLS0g
CkJlc3QgcmVnYXJkcywKUm9uYWxkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1hbWxvZ2ljCg==
