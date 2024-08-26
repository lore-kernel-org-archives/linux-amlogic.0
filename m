Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B72BFC5321E
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Aug 2024 12:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g/wb0poesP/gd/dZgD1wSRm6z9l/qvLC062cxEg5A0Y=; b=Xo86z7KQz3w3JQ
	nnVLlKZiiuJadLLYgIukbJ0tHoNxZEeiGnv9bPTywXnI5J5ySR1Unu9Rg6KjTb0WfhCNnXz9T+6pH
	q3TNleAiZ1MEXxaWPZcYMYMiE7XQ2wc0jk8pQ/Y/WAhcvzm856gmU5KodzydOuEMMI9ac9g9Y4qEw
	S51AZHvPnFZMmI8ZFSB39FkeFth7hzlQX4OOmVwy8hfH0I5PJ9ZpC/Th+6aVmyM3yRve0YVW8is/K
	vips4RV9cbdSomxAHaip4OFnoL9dDSIgmKtwij8vaQj56tbwSODR0uLOw5KEBa/XVyEJKVD4ypS4Y
	xGcapm4RFUYDRuEpnTkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siZGg-00000007QBE-1MEN;
	Mon, 26 Aug 2024 12:56:22 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siZGe-00000007Q8k-056X;
	Mon, 26 Aug 2024 12:56:21 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4WsrJ9268SzyR3h;
	Mon, 26 Aug 2024 20:55:37 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
	by mail.maildlp.com (Postfix) with ESMTPS id 79DC01800A5;
	Mon, 26 Aug 2024 20:56:05 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemh500013.china.huawei.com (7.202.181.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 26 Aug 2024 20:56:03 +0800
Message-ID: <061c39b9-c2fb-34e8-5848-dc2d2d9ca5eb@huawei.com>
Date: Mon, 26 Aug 2024 20:56:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH -next RESEND 00/10] mtd: Use
 for_each_child_of_node_scoped()
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>, Krzysztof Kozlowski
	<krzk@kernel.org>
CC: <michal.simek@amd.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<liang.yang@amlogic.com>, <neil.armstrong@linaro.org>,
	<khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <heiko@sntech.de>,
	<mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>, <wens@csie.org>,
	<jernej.skrabec@gmail.com>, <samuel@sholland.org>, <kees@kernel.org>,
	<gustavoars@kernel.org>, <linux@treblig.org>, <robh@kernel.org>,
	<u.kleine-koenig@pengutronix.de>, <erick.archer@gmx.com>,
	<christophe.jaillet@wanadoo.fr>, <val@packett.cool>,
	<christophe.kerello@foss.st.com>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-renesas-soc@vger.kernel.org>, <linux-rockchip@lists.infradead.org>,
	<linux-stm32@st-md-mailman.stormreply.com>, <jic23@kernel.org>
References: <20240826094328.2991664-1-ruanjinjie@huawei.com>
 <20240826115213.389acaef@xps-13>
 <f7430f87-88d2-4c08-bc1e-6bb3da4e332c@kernel.org>
 <20240826144917.2c4e202d@xps-13>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20240826144917.2c4e202d@xps-13>
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemh500013.china.huawei.com (7.202.181.146)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240826_055620_336705_9D65EE14 
X-CRM114-Status: UNSURE (   8.01  )
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

CgpPbiAyMDI0LzgvMjYgMjA6NDksIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gSGkgS3J6eXN6dG9m
LAo+IAo+IGtyemtAa2VybmVsLm9yZyB3cm90ZSBvbiBNb24sIDI2IEF1ZyAyMDI0IDEyOjE5OjA3
ICswMjAwOgo+IAo+PiBPbiAyNi8wOC8yMDI0IDExOjUyLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+
Pj4gSGkgSmluamllLAo+Pj4KPj4+IHJ1YW5qaW5qaWVAaHVhd2VpLmNvbSB3cm90ZSBvbiBNb24s
IDI2IEF1ZyAyMDI0IDE3OjQzOjE4ICswODAwOgo+Pj4gICAKPj4+PiBVc2Ugc2NvcGVkIGZvcl9l
YWNoX2F2YWlsYWJsZV9jaGlsZF9vZl9ub2RlX3Njb3BlZCgpIHdoZW4gaXRlcmF0aW5nIG92ZXIK
Pj4+PiBkZXZpY2Ugbm9kZXMgdG8gbWFrZSBjb2RlIGEgYml0IHNpbXBsZXIuICAKPj4+Cj4+PiBX
aHkgaXMgdGhpcyBhIHJlc2VuZCA/IERpZCBJIG1pc3MgYSBwcmV2aW91cyBpdGVyYXRpb24/ICAK
Pj4KPj4gWW91IHdlcmUgbm90IGNjLWVkIG9uIHByZXZpb3VzIGl0ZXJhdGlvbi4gSSBhc2tlZCBm
b3IgcHJvcGVyIHNwbGl0Cj4+IGJldHdlZW4gc3Vic3lzdGVtcyBhbmQgc2VuZGluZyB0byBtYWlu
dGFpbmVycywgdGh1cyB0aGlzIHJlc2VuZC4KPiAKPiBPay4gTWFrZXMgc2Vuc2UsIGFuZCB0aGUg
cGF0Y2hzZXQgbG9va3MgZmluZS4KPiAKPiBKaW5qaWUsIHBsZWFzZSBhbHdheXMgaW5jbHVkZSBh
IGNoYW5nZWxvZyB3aGVuIHlvdSBzZW5kIG5ldyB2ZXJzaW9ucywKPiBhbmQgZXhwbGFuYXRpb25z
IGZvciBhIFJFU0VORC4KCk9rLCB0aGFua3MgZm9yIHRoZSBhZHZpY2UuCgo+IAo+IFRoYW5rcywK
PiBNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1h
bWxvZ2ljCg==
