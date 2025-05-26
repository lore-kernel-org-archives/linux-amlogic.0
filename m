Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC08DC54FB3
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 May 2025 08:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F4+8BF5lP34mUQrweieHmEJ95Q5HhNDazlfflPjVmX8=; b=GiDaBOjQD7WKJ6
	Fy5Suww+LqIlLJHt6oGnQBfiSPMD2e1Lu6y4KOiYpxCZTMXbk5o+yHLc2v1QNXJpetjnCLlh00xwd
	MVKWOd7s0xNWlXjw6ziagaLiZE14CMnGAOkk4ggDtf+JKXsIIGNsWy6BVfUreqzNen+8sTblUqRvG
	sOFj+12TzU4Kk3XH4eeL6La+ZEcRAI6DACThcCDShhk0Z3s9jtR2LqBueNIngBzB7EwkvFd7cc/KL
	ZRCPqw/5VsUkd5HeiSfz+7uh27vA8OVNmPnU4hRbOI+2I/flEUGcjR26kr0stwCX6b6IAmBHB+LRt
	cLwBpD7HsXgj5Y6h+DJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJT99-00000008Nqh-04zc;
	Mon, 26 May 2025 08:25:23 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJT5f-00000008NSf-2eeh;
	Mon, 26 May 2025 08:21:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=kQpQyzSLFXzcV+bV7PWjdFj0k9dCEFAnIJ2CmkjTnDY=;
	t=1748247707; x=1749457307; b=bZJtLdu9wdlzfes1P4tf1N8zB0Y0OdW1LkOkqsFNKtJgXeN
	PPT9Ih/o7Y7Qc5CyXlAEdSyUX6Nvqqh8YvRjUkSkXYJbZCDXbXnCZB/g0KacQegi5qsDwXRYM1VYq
	gW8MsXVojQv2MkYLECSr2afTUkMcuH5VZHo49dtbNRv8VaeUcaZW5GDvRwUGO9bAVV8BNmfem1rnF
	tczJP/ahY+V9QzmBgOmWFxb/YUWVJzJgv9uUqp+MB9A4t0EwpO9T5cqqifM5ozlFNQPhP318xNIsN
	WqOgKwInJfbsghF2AX1e64+kMnhv8Gk2TroFLYdXmRO6sq9F0BuNFY//ZIOcqyJQ==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1uJT5X-0000000DQMg-1YY7;
	Mon, 26 May 2025 10:21:39 +0200
Message-ID: <b36908bf35a20f7196bec4fe22e392a015d9b7d1.camel@sipsolutions.net>
Subject: Re: [PATCH v2 2/6] ASoC: aoa: Use helper function
 for_each_child_of_node_scoped()
From: Johannes Berg <johannes@sipsolutions.net>
To: Ai Chao <aichao@kylinos.cn>, perex <perex@perex.cz>, tiwai
 <tiwai@suse.com>,  "kuninori.morimoto.gx"
 <kuninori.morimoto.gx@renesas.com>, lgirdwood <lgirdwood@gmail.com>,
 broonie <broonie@kernel.org>, jbrunet	 <jbrunet@baylibre.com>,
 "neil.armstrong" <neil.armstrong@linaro.org>, khilman	
 <khilman@baylibre.com>, "martin.blumenstingl"	
 <martin.blumenstingl@googlemail.com>, "shengjiu.wang"
 <shengjiu.wang@gmail.com>,  "Xiubo.Lee" <Xiubo.Lee@gmail.com>, festevam
 <festevam@gmail.com>, nicoleotsuka <nicoleotsuka@gmail.com>,  shawnguo
 <shawnguo@kernel.org>, "s.hauer" <s.hauer@pengutronix.de>,
 "srinivas.kandagatla"	 <srinivas.kandagatla@linaro.org>
Cc: linux-sound <linux-sound@vger.kernel.org>, linux-kernel	
 <linux-kernel@vger.kernel.org>, linuxppc-dev
 <linuxppc-dev@lists.ozlabs.org>,  linux-renesas-soc
 <linux-renesas-soc@vger.kernel.org>, linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>,  linux-amlogic
 <linux-amlogic@lists.infradead.org>, imx <imx@lists.linux.dev>, kernel
 <kernel@pengutronix.de>,  linux-arm-msm <linux-arm-msm@vger.kernel.org>
Date: Mon, 26 May 2025 10:21:37 +0200
In-Reply-To: <9ec008a8-b569-4ad1-9206-fe241fb1712d@kylinos.cn>
References: <2aq0nyvyf7t-2aq4hsc7kp6@nsmail7.0.0--kylin--1>
	 <7e708dcc98c6f0f615b1b87d190464cfe78be668.camel@sipsolutions.net>
	 <eb1ddeb3-06b6-4ac5-b20a-06b92c7f1363@kylinos.cn>
	 <23aadbd78d3585c900c579c26f360011cf1ca830.camel@sipsolutions.net>
	 <9ec008a8-b569-4ad1-9206-fe241fb1712d@kylinos.cn>
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_012147_803014_4221D91B 
X-CRM114-Status: GOOD (  15.14  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, 2025-05-26 at 16:20 +0800, Ai Chao wrote:
> Hi Johannes:
> > > Hi Johannes:
> > > 
> > > > > "simplifies the code" is no need to callof_node_put() .
> > > > Fair. Except that's not what you _actually_ changed here. Like I said,
> > > > either it's buggy before or after.
> > > > 
> > > In the function i2sbus_probe, it not return a struct device_node, so , I
> > > think function for_each_child_of_node_scoped is better than
> > > for_each_child_of_node.
> > You still haven't explained why it's even correct.
> > 
> > johannes
> 
> The for_each_child_of_node() function is used to iterate over all child 
> nodes of a device tree node.
> During each iteration, it retrieves a pointer to the child node via 
> of_get_next_child() and automatically increments the node's reference 
> count (of_node_get()).
> Each call to of_get_next_child() increases the reference count 
> (refcount) of the returned child node, ensuring that the node is not 
> freed while in use.
> for_each_child_of_node() increments the child node's reference count in 
> each iteration but does not decrement it automatically.
> If of_node_put() is not called manually, the reference count will never 
> reach zero, resulting in a memory leak of the node.

Yes, good! Now show that you can apply what you've learned to the
specific code (and changes) at hand.

johannes

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
