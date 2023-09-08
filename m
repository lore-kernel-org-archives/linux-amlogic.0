Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBF3EEE57E1
	for <linux-amlogic@archiver.kernel.org>; Fri,  8 Sep 2023 07:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XpIyvFJH/jCoznt5OzCzc/7VipF5/SRCLG1EAx3HGfY=; b=IuwQThJVSomaNO
	Z54TMUH9oNSoH+QpWgpbCN/GV6w4GYNmexUvtAQRp66tDCFj56SQAODWycX5xDapll2Q7scGeRuvw
	3omoDpdWy5PCb7XUq1tYPqrADAzjEMxrj3ZNC+mmcF/b+CSDcJ66VUMUwL2Os6sKcGO61Kh0KctPq
	ljFLdHh8TEaw/RrVICARPB0jMR8ChFZHVXtYOIhlZm05xxUz+HkQn4FJjzaZqsRnMsZYkYVc7zSOc
	P5JvBDxD0VifkqR+CBuoN0cWj9eJuaAMYowUjv9m/lrMvxKsh+FIf3tUKHxxNPG20v+9MTNUnugPy
	acE1v9PH49DDKF5U3U6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeWJ0-00DGnS-2a;
	Fri, 08 Sep 2023 07:53:30 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeWIx-00DGmZ-1x;
	Fri, 08 Sep 2023 07:53:28 +0000
Received: from [192.168.1.23] (unknown [171.76.82.102])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id DEF3566072A2;
	Fri,  8 Sep 2023 08:53:17 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694159603;
	bh=1Be9Ga17gksJsOil0d5EZoQWNEzJGykPqruhkf331P8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AZ8K5q+HuIaaU6/G04eKJSX0xrkxKxQB3FT9sj7Ftu3/eZFbcjcUuN0wZDB1Uru/+
	 SRRAaZZY9CpqexRRTVJwqqy2gLir7pE2gZVNT1DV4X/m0nKY7UEX8kzAk1oZgSXQdL
	 Lmq3zfkiEKO5O28VvgFGJu7mu2A9LXIHs4XR/1wUMTNnQo25S7RIs7xdl152ZM7Lwk
	 lZi/4cDySYL16Pemg1Mc/OnqIxALgeq5SLlrMVZt/Gj/AY3Xl27NJXEHwaFZnjvpyL
	 DFbNN+wBQgmXV+uLAfoCeQfeyyzzPlysSiOmAuLvMu3+DuB7yAYXGyUnQUfJlUSQrX
	 Oj81GmCXY/TKg==
Message-ID: <ff99380a-cb0d-dc6c-0442-7aa60d14cec2@collabora.com>
Date: Fri, 8 Sep 2023 13:23:12 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 4/6] drm: ci: Enable configs to fix mt8173 boot hang issue
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, Matthias Brugger <matthias.bgg@gmail.com>
Cc: helen.koike@collabora.com, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, david.heidelberg@collabora.com,
 daniels@collabora.com, emma@anholt.net, robclark@freedesktop.org,
 gustavo.padovan@collabora.com, robdclark@google.com, anholt@google.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, corbet@lwn.net,
 neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, heiko@sntech.de,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org
References: <20230825122435.316272-1-vignesh.raman@collabora.com>
 <20230825122435.316272-5-vignesh.raman@collabora.com>
 <6da8136b-be1f-6867-b2af-c636877ef189@collabora.com>
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <6da8136b-be1f-6867-b2af-c636877ef189@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230908_005327_802487_4598ED9A 
X-CRM114-Status: GOOD (  11.63  )
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

SGkgQW5nZWxvLAoKT24gMDcvMDkvMjMgMTY6MTYsIEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25v
IHdyb3RlOgo+IElsIDI1LzA4LzIzIDE0OjI0LCBWaWduZXNoIFJhbWFuIGhhIHNjcml0dG86Cj4+
IEVuYWJsZSByZWd1bGF0b3IKPj4gRW5hYmxlIE1UNjM5NyBSVEMgZHJpdmVyCj4+Cj4+IFNpZ25l
ZC1vZmYtYnk6IFZpZ25lc2ggUmFtYW4gPHZpZ25lc2gucmFtYW5AY29sbGFib3JhLmNvbT4KPj4g
LS0tCj4+IMKgIGRyaXZlcnMvZ3B1L2RybS9jaS9hcm02NC5jb25maWcgfCAyICsrCj4+IMKgIDEg
ZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9jaS9hcm02NC5jb25maWcgCj4+IGIvZHJpdmVycy9ncHUvZHJtL2NpL2FybTY0LmNv
bmZpZwo+PiBpbmRleCA4MTdlMThkZGZkNGYuLmVhN2E2Y2NlZmY0MCAxMDA2NDQKPj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2NpL2FybTY0LmNvbmZpZwo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
Y2kvYXJtNjQuY29uZmlnCj4+IEBAIC0xODQsNiArMTg0LDggQEAgQ09ORklHX0hXX1JBTkRPTV9N
VEs9eQo+PiDCoCBDT05GSUdfTVRLX0RFVkFQQz15Cj4+IMKgIENPTkZJR19QV01fTVRLX0RJU1A9
eQo+PiDCoCBDT05GSUdfTVRLX0NNRFE9eQo+PiArQ09ORklHX1JFR1VMQVRPUl9EQTkyMTE9eQo+
PiArQ09ORklHX1JUQ19EUlZfTVQ2Mzk3PXkKPiAKPiBJIHdvbmRlciBpZiBpdCdkIGJlIGEgYmV0
dGVyIGlkZWEgdG8gc2ltcGx5IGFkZCB0aG9zZSB0byB0aGUgZGVmY29uZmlnIAo+IGluc3RlYWQg
YXMKPiAKPiBDT05GSUdfUkVHVUxBVE9SX0RBOTIxMT1tCj4gQ09ORklHX1JUQ19EUlZfTVQ2Mzk3
PW0KPiAKPiBBbnkgb3BpbmlvbiBvbiB0aGlzPyBNYXR0aGlhcz8gQW55b25lIGVsc2U/CgpDT05G
SUdfUlRDX0RSVl9NVDYzOTc9bSBpcyBhbHJlYWR5IHByZXNlbnQgaW4gZGVmY29uZmlnLgpXZSBj
YW4gYWxzbyBhZGQgQ09ORklHX1JFR1VMQVRPUl9EQTkyMTE9bSB0byBkZWZjb25maWcuCgpSZWdh
cmRzLApWaWduZXNoCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1hbWxvZ2ljCg==
