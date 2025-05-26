Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2787DC54FB3
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 May 2025 08:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kgzaOg9WapNTLWIYeHUIINijbHvRf1TFDWQ4OqSYWwQ=; b=LQHN1XWClvRru1
	drWRK7UCKI2jO8diYuZmagdJz2D8aUTWbvRZc0AcgzhlDhR+0vMTA6P6NmTkI0xmyOT1Il4Mv9dyl
	RTQwinwOOzPMlvYydA0yuoUG4hRyhLQKDts5W9YH4GhOAWDV0NjuoxftrmzlYKn8l44dfgTJI2TDL
	c/9tFhSHSuhG8zRSMKEQPBdgBOVa+EcvWha45e3OyAiFUp6sDhTE61tpf+tNSWkq6ivObrGWopabo
	k4hpKoW6nw6zNyGvkSqqjQCC/mDdWDErHzB8gskHj8d/CZYAA+HJ35w82gaB9TJ5B1Ezt5m+JEz/5
	hranvwIp3Gx9fHquvBaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJTaj-00000008RE9-1ZBX;
	Mon, 26 May 2025 08:53:53 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJTah-00000008RDV-1Nbi;
	Mon, 26 May 2025 08:53:52 +0000
X-UUID: ef5a1a7a3a0e11f0b29709d653e92f7d-20250526
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:2a582296-71b1-4427-aff1-0d66ba2e24a6,IP:10,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:-3,FILE:0,BULK:30,RULE:Release_Ham,ACTI
	ON:release,TS:37
X-CID-INFO: VERSION:1.1.45,REQID:2a582296-71b1-4427-aff1-0d66ba2e24a6,IP:10,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:-3,FILE:0,BULK:30,RULE:Release_Ham,ACTION
	:release,TS:37
X-CID-META: VersionHash:6493067,CLOUDID:01155e3f26d2f9f964f0833965c5c673,BulkI
	D:250522180435BN613KC0,BulkQuantity:7,Recheck:0,SF:19|24|38|45|64|66|72|78
	|80|81|82|83|102|841,TC:nil,Content:0|50,EDM:-3,IP:-2,URL:0,File:nil,RT:ni
	l,Bulk:40|23,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:
	0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 1,FCT
X-CID-BAS: 1,FCT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FSD,TF_CID_SPAM_FSI
X-UUID: ef5a1a7a3a0e11f0b29709d653e92f7d-20250526
X-User: aichao@kylinos.cn
Received: from [172.25.120.86] [(112.64.161.44)] by mailgw.kylinos.cn
	(envelope-from <aichao@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 2088584585; Mon, 26 May 2025 16:53:46 +0800
Message-ID: <3869e6fc-1cbf-4113-9b34-0cbb5d4b5176@kylinos.cn>
Date: Mon, 26 May 2025 16:53:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] ASoC: aoa: Use helper function
 for_each_child_of_node_scoped()
To: Christophe Leroy <christophe.leroy@csgroup.eu>, perex@perex.cz,
 tiwai@suse.com, johannes@sipsolutions.net, kuninori.morimoto.gx@renesas.com,
 lgirdwood@gmail.com, broonie@kernel.org, jbrunet@baylibre.com,
 neil.armstrong@linaro.org, khilman@baylibre.com,
 martin.blumenstingl@googlemail.com, shengjiu.wang@gmail.com,
 Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, srinivas.kandagatla@linaro.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-renesas-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 imx@lists.linux.dev, kernel@pengutronix.de, linux-arm-msm@vger.kernel.org
References: <20250522050300.519244-1-aichao@kylinos.cn>
 <20250522050300.519244-3-aichao@kylinos.cn>
 <8ad901c3-3fcb-4643-ac5a-c1f30f93d07f@csgroup.eu>
Content-Language: en-US
From: Ai Chao <aichao@kylinos.cn>
In-Reply-To: <8ad901c3-3fcb-4643-ac5a-c1f30f93d07f@csgroup.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_015351_666959_5015E277 
X-CRM114-Status: GOOD (  12.41  )
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

SGkgQ2hyaXN0b3BoZToKCj4+IFRoZSBmb3JfZWFjaF9jaGlsZF9vZl9ub2RlX3Njb3BlZCgpIGhl
bHBlciBwcm92aWRlcyBhIHNjb3BlLWJhc2VkCj4+IGNsZWFuLXVwIGZ1bmN0aW9uYWxpdHkgdG8g
cHV0IHRoZSBkZXZpY2Vfbm9kZSBhdXRvbWF0aWNhbGx5LCBhbmQKPj4gYXMgc3VjaCwgdGhlcmUg
aXMgbm8gbmVlZCB0byBjYWxsIG9mX25vZGVfcHV0KCkgZGlyZWN0bHkuCj4KPiBJIGRvbid0IHVu
ZGVyc3RhbmQgdGhpcyBleHBsYW5hdGlvbi4KPgo+IFlvdSBzYXkgIm5vIG5lZWQgdG8gY2FsbCBv
Zl9ub2RlX3B1dCgpIiBhbmQgdGhlIG9ubHkgdGhpbmcgeW91IGRvIGluIAo+IGFkZGl0aW9uIHRv
IGNoYW5naW5nIGZyb20gZm9yX2VhY2hfY2hpbGRfb2Zfbm9kZSgpIHRvIAo+IGZvcl9lYWNoX2No
aWxkX29mX25vZGVfc2NvcGVkKCkgaXMgdG8gX2FkZF8gYSBuZXcgY2FsbCB0byBvZl9ub2RlX3B1
dCgpLgo+Cj4gSSB3b3VsZCBleHBlY3QgdG8gc2VlIGEgX3JlbW92YWxfIG9mIHNvbWUgb2Zfbm9k
ZV9wdXQoKSB3aGVuIEkgcmVhZCAKPiB5b3VyIGRlc2NyaXB0aW9uLgo+Cj4+IMKgwqDCoMKgwqAg
fQo+PiArwqDCoMKgIG9mX25vZGVfcHV0KHNvdW5kKTsKPj4gKwoKVGhlIGZvcl9lYWNoX2NoaWxk
X29mX25vZGUoKSBmdW5jdGlvbiBpcyB1c2VkIHRvIGl0ZXJhdGUgb3ZlciBhbGwgY2hpbGQgCm5v
ZGVzIG9mIGEgZGV2aWNlIHRyZWUgbm9kZS7CoCBEdXJpbmcgZWFjaCBpdGVyYXRpb24sIGl0IHJl
dHJpZXZlcyBhIApwb2ludGVyIHRvIHRoZSBjaGlsZCBub2RlIHZpYSBvZl9nZXRfbmV4dF9jaGls
ZCgpIGFuZCBhdXRvbWF0aWNhbGx5IAppbmNyZW1lbnRzIHRoZSBub2RlJ3MgcmVmZXJlbmNlIGNv
dW50IChvZl9ub2RlX2dldCgpKS4gRWFjaCBjYWxsIHRvIApvZl9nZXRfbmV4dF9jaGlsZCgpIGlu
Y3JlYXNlcyB0aGUgcmVmZXJlbmNlIGNvdW50IChyZWZjb3VudCkgb2YgdGhlIApyZXR1cm5lZCBj
aGlsZCBub2RlLCBlbnN1cmluZyB0aGF0IHRoZSBub2RlIGlzIG5vdCBmcmVlZCB3aGlsZSBpbiB1
c2UuCmZvcl9lYWNoX2NoaWxkX29mX25vZGUoKSBpbmNyZW1lbnRzIHRoZSBjaGlsZCBub2RlJ3Mg
cmVmZXJlbmNlIGNvdW50IGluIAplYWNoIGl0ZXJhdGlvbiBidXQgZG9lcyBub3QgZGVjcmVtZW50
IGl0IGF1dG9tYXRpY2FsbHkuCklmIG9mX25vZGVfcHV0KCkgaXMgbm90IGNhbGxlZCBtYW51YWxs
eSwgdGhlIHJlZmVyZW5jZSBjb3VudCB3aWxsIG5ldmVyIApyZWFjaCB6ZXJvLCByZXN1bHRpbmcg
aW4gYSBtZW1vcnkgbGVhayBvZiB0aGUgbm9kZS4KCkluIGZ1bmN0aW9uIGkyc2J1c19hZGRfZGV2
LCBpdCB1c2VkIGRldmljZV9ub2RlIG91dCBvZiAKZm9yX2VhY2hfY2hpbGRfb2Zfbm9kZSgpe30s
wqAgaXQgbmVlZCB0byBhZGQgYSBuZXcgY2FsbCB0byAKb2Zfbm9kZV9wdXQoc291bmQpIHRvIHJl
ZmVyZW5jZSBjb3VudC4KCkluIGZ1bmN0aW9uIGkyY2J1c19wcm9iZSwgaXQgdXNlZCBkZXZpY2Vf
bm9kZSBpbiAKZm9yX2VhY2hfY2hpbGRfb2Zfbm9kZSgpe30sIHVzZWQgZm9yX2VhY2hfY2hpbGRf
b2Zfbm9kZV9zY29wZWQoKSBpcyAKYmV0dGVyIHRoYW4gZm9yX2VhY2hfY2hpbGRfb2Zfbm9kZSgp
LgoKQmVzdCByZWdhcmRzLApBaSBDaGFvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2lj
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1hbWxvZ2ljCg==
