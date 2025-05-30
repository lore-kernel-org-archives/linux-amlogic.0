Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03E21C5B552
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 May 2025 09:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zv5PlCLxfjihmSexGaHqm7KyJOw+DBM6zKhUUAfqyBM=; b=O40Dnet5P49IC1
	eELOOMhLKIGJWiTMhNFfQl3KjLQg6Zro5IYyHXTtYIihLAqLiLIjewlSlRG5u5tmO2ekYTV2t2Ts/
	FvNNBqSP5xaY9Aac4cw7kflQ9ptcSp7BG1Ga9E0B7IGlQ/a7gDyb0UZnuOvRQOKX2NB0EtJ5CR+pj
	QXEKRhogS8KhJ40epa/wyBamkDJoj9WMVP/TcxUstVy4f9/PbLm1AWJXcYB+H7iEASHXcb5fGSwgc
	GjrZ7jjrsJumlTprEWYgUU5oKpyqlC03YXG1MwMeLJSjaWQSbcctEK+n8yCeI9FCQUwnbtVEgFO2L
	Kj4uaZAZZYzTW5vmMdBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKwBe-00000000ALj-1YGO;
	Fri, 30 May 2025 09:38:02 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKw56-000000008Cy-1PKC;
	Fri, 30 May 2025 09:31:18 +0000
X-UUID: ce23f0383d3811f0b29709d653e92f7d-20250530
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:9901f846-04db-40fa-9f89-284431738858,IP:10,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:-9,FILE:0,BULK:30,RULE:Release_Ham,ACTI
	ON:release,TS:31
X-CID-INFO: VERSION:1.1.45,REQID:9901f846-04db-40fa-9f89-284431738858,IP:10,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:-9,FILE:0,BULK:30,RULE:Release_Ham,ACTION
	:release,TS:31
X-CID-META: VersionHash:6493067,CLOUDID:9a3853ec8758490979c83e53ed79c393,BulkI
	D:250522180435BN613KC0,BulkQuantity:9,Recheck:0,SF:17|19|24|38|45|64|66|78
	|80|81|82|83|102|841,TC:nil,Content:0|50,EDM:-3,IP:-2,URL:0,File:nil,RT:ni
	l,Bulk:40|23,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:
	0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_FSI,TF_CID_SPAM_SNR
X-UUID: ce23f0383d3811f0b29709d653e92f7d-20250530
X-User: aichao@kylinos.cn
Received: from [172.25.120.86] [(112.64.161.44)] by mailgw.kylinos.cn
	(envelope-from <aichao@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 1724392610; Fri, 30 May 2025 17:31:03 +0800
Message-ID: <22dfeb0b-c3ff-4a7a-8471-1bb89dccdc17@kylinos.cn>
Date: Fri, 30 May 2025 17:30:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] ASoC: aoa: Use helper function
 for_each_child_of_node_scoped()
To: Johannes Berg <johannes@sipsolutions.net>, perex <perex@perex.cz>,
 tiwai <tiwai@suse.com>,
 "kuninori.morimoto.gx" <kuninori.morimoto.gx@renesas.com>,
 lgirdwood <lgirdwood@gmail.com>, broonie <broonie@kernel.org>,
 jbrunet <jbrunet@baylibre.com>, "neil.armstrong"
 <neil.armstrong@linaro.org>, khilman <khilman@baylibre.com>,
 "martin.blumenstingl" <martin.blumenstingl@googlemail.com>,
 "shengjiu.wang" <shengjiu.wang@gmail.com>, "Xiubo.Lee"
 <Xiubo.Lee@gmail.com>, festevam <festevam@gmail.com>,
 nicoleotsuka <nicoleotsuka@gmail.com>, shawnguo <shawnguo@kernel.org>,
 "s.hauer" <s.hauer@pengutronix.de>,
 "srinivas.kandagatla" <srinivas.kandagatla@linaro.org>
Cc: linux-sound <linux-sound@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-renesas-soc <linux-renesas-soc@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-amlogic <linux-amlogic@lists.infradead.org>, imx
 <imx@lists.linux.dev>, kernel <kernel@pengutronix.de>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>
References: <2aq0nyvyf7t-2aq4hsc7kp6@nsmail7.0.0--kylin--1>
 <7e708dcc98c6f0f615b1b87d190464cfe78be668.camel@sipsolutions.net>
 <eb1ddeb3-06b6-4ac5-b20a-06b92c7f1363@kylinos.cn>
 <23aadbd78d3585c900c579c26f360011cf1ca830.camel@sipsolutions.net>
 <9ec008a8-b569-4ad1-9206-fe241fb1712d@kylinos.cn>
 <b36908bf35a20f7196bec4fe22e392a015d9b7d1.camel@sipsolutions.net>
Content-Language: en-US
From: Ai Chao <aichao@kylinos.cn>
In-Reply-To: <b36908bf35a20f7196bec4fe22e392a015d9b7d1.camel@sipsolutions.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_023116_670478_803B9F43 
X-CRM114-Status: UNSURE (   9.63  )
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

SGkgSm9oYW5uZXM6CiDCoMKgwqAgVGhhbmtzIGZvciB5b3VyIGZlZWRiYWNrLsKgIEkgd2lsbCBk
cm9wIGl0LgoKPiBPbiBNb24sIDIwMjUtMDUtMjYgYXQgMTY6MjAgKzA4MDAsIEFpIENoYW8gd3Jv
dGU6Cj4+IEhpIEpvaGFubmVzOgo+Pj4+IGZvcl9lYWNoX2NoaWxkX29mX25vZGUuCj4+PiBZb3Ug
c3RpbGwgaGF2ZW4ndCBleHBsYWluZWQgd2h5IGl0J3MgZXZlbiBjb3JyZWN0Lgo+Pj4KPj4+IGpv
aGFubmVzCj4+IFRoZSBmb3JfZWFjaF9jaGlsZF9vZl9ub2RlKCkgZnVuY3Rpb24gaXMgdXNlZCB0
byBpdGVyYXRlIG92ZXIgYWxsIGNoaWxkCj4+IG5vZGVzIG9mIGEgZGV2aWNlIHRyZWUgbm9kZS4K
Pj4gRHVyaW5nIGVhY2ggaXRlcmF0aW9uLCBpdCByZXRyaWV2ZXMgYSBwb2ludGVyIHRvIHRoZSBj
aGlsZCBub2RlIHZpYQo+PiBvZl9nZXRfbmV4dF9jaGlsZCgpIGFuZCBhdXRvbWF0aWNhbGx5IGlu
Y3JlbWVudHMgdGhlIG5vZGUncyByZWZlcmVuY2UKPj4gY291bnQgKG9mX25vZGVfZ2V0KCkpLgo+
PiBFYWNoIGNhbGwgdG8gb2ZfZ2V0X25leHRfY2hpbGQoKSBpbmNyZWFzZXMgdGhlIHJlZmVyZW5j
ZSBjb3VudAo+PiAocmVmY291bnQpIG9mIHRoZSByZXR1cm5lZCBjaGlsZCBub2RlLCBlbnN1cmlu
ZyB0aGF0IHRoZSBub2RlIGlzIG5vdAo+PiBmcmVlZCB3aGlsZSBpbiB1c2UuCj4+IGZvcl9lYWNo
X2NoaWxkX29mX25vZGUoKSBpbmNyZW1lbnRzIHRoZSBjaGlsZCBub2RlJ3MgcmVmZXJlbmNlIGNv
dW50IGluCj4+IGVhY2ggaXRlcmF0aW9uIGJ1dCBkb2VzIG5vdCBkZWNyZW1lbnQgaXQgYXV0b21h
dGljYWxseS4KPj4gSWYgb2Zfbm9kZV9wdXQoKSBpcyBub3QgY2FsbGVkIG1hbnVhbGx5LCB0aGUg
cmVmZXJlbmNlIGNvdW50IHdpbGwgbmV2ZXIKPj4gcmVhY2ggemVybywgcmVzdWx0aW5nIGluIGEg
bWVtb3J5IGxlYWsgb2YgdGhlIG5vZGUuCj4gWWVzLCBnb29kISBOb3cgc2hvdyB0aGF0IHlvdSBj
YW4gYXBwbHkgd2hhdCB5b3UndmUgbGVhcm5lZCB0byB0aGUKPiBzcGVjaWZpYyBjb2RlIChhbmQg
Y2hhbmdlcykgYXQgaGFuZC4KPgo+IGpvaGFubmVzCgotLSAKQmVzdCByZWdhcmRzLApBaSBDaGFv
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
YW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
