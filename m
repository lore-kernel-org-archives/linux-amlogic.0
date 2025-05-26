Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3E09C5AD49
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 May 2025 08:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZgNyEOQPKNk0nlOmfIlWBkQ0XrRWzMLsxAKDKauOiMA=; b=Iusz/fa/mHqiJ8
	Sudk2QUMIZlifhFZZDZh7jJ1WAtIYUw546pkjs5HcbsUHn6+I3nkKu4S1wWzPOljEnG45heqG8nzl
	Mt+wWdUbI+FWcB/ciBB8GA9yZ7kUjMxrwN2bb/Ze/aQhVSyhZZWSOFTFZr8RYrMjFX9pg/EuPciQD
	A8mWOXpBQXYv6z3KfqjXAffs4F2sP6ZvDNXo4pnSuD6SfiSKAeM3wRaB8txHouJ5NYTlOqyTr+SGF
	WMD8Yv6TByw3CPzeCk7du/fnie+qv9qAzPf1v3JQ+oh0bHh8BwfNDIujwjarPPs7Aw+7tQKS2ga1a
	BNU6GX+ZBx2VIa7vxgfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJT4v-00000008NLf-04Oh;
	Mon, 26 May 2025 08:21:01 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJT4h-00000008NIb-2ZDQ;
	Mon, 26 May 2025 08:20:49 +0000
X-UUID: 50581bc43a0a11f0b29709d653e92f7d-20250526
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:c8cffb3b-ca75-422b-af48-838dfab09a5d,IP:10,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:-3,FILE:0,BULK:15,RULE:Release_Ham,ACTI
	ON:release,TS:22
X-CID-INFO: VERSION:1.1.45,REQID:c8cffb3b-ca75-422b-af48-838dfab09a5d,IP:10,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:-3,FILE:0,BULK:15,RULE:Release_Ham,ACTION
	:release,TS:22
X-CID-META: VersionHash:6493067,CLOUDID:3b493ef02f725a96f0d2e58473886bae,BulkI
	D:250522180435BN613KC0,BulkQuantity:5,Recheck:0,SF:19|24|38|45|64|66|72|78
	|80|81|82|83|102|841,TC:nil,Content:0|50,EDM:-3,IP:-2,URL:0,File:nil,RT:ni
	l,Bulk:40|23,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:
	0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 1,FCT
X-CID-BAS: 1,FCT,0,_
X-CID-FACTOR: TF_CID_SPAM_FSI,TF_CID_SPAM_SNR,TF_CID_SPAM_FSD
X-UUID: 50581bc43a0a11f0b29709d653e92f7d-20250526
X-User: aichao@kylinos.cn
Received: from [172.25.120.86] [(112.64.161.44)] by mailgw.kylinos.cn
	(envelope-from <aichao@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 784335124; Mon, 26 May 2025 16:20:42 +0800
Message-ID: <9ec008a8-b569-4ad1-9206-fe241fb1712d@kylinos.cn>
Date: Mon, 26 May 2025 16:20:37 +0800
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
Content-Language: en-US
From: Ai Chao <aichao@kylinos.cn>
In-Reply-To: <23aadbd78d3585c900c579c26f360011cf1ca830.camel@sipsolutions.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_012047_950963_735EDA97 
X-CRM114-Status: UNSURE (   7.21  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


Hi Johannes:
>> Hi Johannes:
>>
>>>> "simplifies the code" is no need to callof_node_put() .
>>> Fair. Except that's not what you _actually_ changed here. Like I said,
>>> either it's buggy before or after.
>>>
>> In the function i2sbus_probe, it not return a struct device_node, so , I
>> think function for_each_child_of_node_scoped is better than
>> for_each_child_of_node.
> You still haven't explained why it's even correct.
>
> johannes

The for_each_child_of_node() function is used to iterate over all child 
nodes of a device tree node.
During each iteration, it retrieves a pointer to the child node via 
of_get_next_child() and automatically increments the node's reference 
count (of_node_get()).
Each call to of_get_next_child() increases the reference count 
(refcount) of the returned child node, ensuring that the node is not 
freed while in use.
for_each_child_of_node() increments the child node's reference count in 
each iteration but does not decrement it automatically.
If of_node_put() is not called manually, the reference count will never 
reach zero, resulting in a memory leak of the node.

Best regards,
Ai Chao

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
