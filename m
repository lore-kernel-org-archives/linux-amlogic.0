Return-Path: <SRS0=3IHZ=KU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93F41C2B9F7
	for <linux-amlogic@archiver.kernel.org>; Tue, 25 May 2021 02:59:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25ABF61415
	for <linux-amlogic@archiver.kernel.org>; Tue, 25 May 2021 02:59:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 25ABF61415
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4C41LIP7Hb9nDbBvpekHe4MUMuTcjbDTwWHYonnniYg=; b=tMBaiagqkDZjo3
	FvRcaWz7ENLBPsnjBBay//qkdNcnnwzDVfbQ5mrdu9iOr8FoUSlzb67cg7Qq2CaAVnG972HUbLGit
	GVVzM/wme5D5EbptS+H5Mbj3jAj77y4KmyxNu+PayhIjFPJEHcOOnnajgr4mypYCoqf8k7j82Nu2y
	PCWZrvmnnVEjkQ6zKYGaAKd3ZU3wK2SK0kEO+ev62OwruY2/EKI+6MIIthFk78QcsBOwtLrzx6teC
	s31UJ9AhctczTMfJynZtckT40PQ/HsFldrg91TUZY/Gn95iV4q0ouP+WC6xPKdXvjIg7b6ixnKQfo
	KzvBybfmjXmDtoGJWeSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1llNHV-00327d-Tk; Tue, 25 May 2021 02:58:57 +0000
Received: from smtprelay0150.hostedemail.com ([216.40.44.150]
 helo=smtprelay.hostedemail.com)
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1llKbU-002TIz-Dk
 for linux-amlogic@lists.infradead.org; Tue, 25 May 2021 00:07:25 +0000
Received: from omf04.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
 by smtprelay01.hostedemail.com (Postfix) with ESMTP id 5A1E9100E7B44;
 Tue, 25 May 2021 00:07:19 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf04.hostedemail.com (Postfix) with ESMTPA id 62630D1514; 
 Tue, 25 May 2021 00:07:18 +0000 (UTC)
Message-ID: <9f21272719a3983bda647147e8460615159875b1.camel@perches.com>
Subject: Re: [PATCH] ASoC: meson: use dev_err_probe
From: Joe Perches <joe@perches.com>
To: Jerome Brunet <jbrunet@baylibre.com>, Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org
Date: Mon, 24 May 2021 17:07:17 -0700
In-Reply-To: <20210524165136.400702-1-jbrunet@baylibre.com>
References: <20210524165136.400702-1-jbrunet@baylibre.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
X-Stat-Signature: k7h5guxk81qrouyfdntbrc3x63gk54mj
X-Rspamd-Server: rspamout02
X-Rspamd-Queue-Id: 62630D1514
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX19pOUzXC5Hogvmi/j0xkmzd9aHSBMxFLPU=
X-HE-Tag: 1621901238-781495
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210524_170724_557231_DAD63487 
X-CRM114-Status: UNSURE (   9.87  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, 2021-05-24 at 18:51 +0200, Jerome Brunet wrote:
> Use dev_err_probe() helper function to handle probe deferral.
> It removes the open coded test for -EPROBE_DEFER but more importantly, it
> sets the deferral reason in debugfs which is great for debugging.

trivia:

It seems that the use of %ld, PTR_ERR(<foo>) isn't particularly
useful now as dev_err_probe already uses %pe to emit descriptive
error messages.


> diff --git a/sound/soc/meson/axg-fifo.c b/sound/soc/meson/axg-fifo.c
[]
> @@ -352,17 +352,16 @@ int axg_fifo_probe(struct platform_device *pdev)
> =A0
> =

> =A0	fifo->pclk =3D devm_clk_get(dev, NULL);
> =A0	if (IS_ERR(fifo->pclk)) {
> -		if (PTR_ERR(fifo->pclk) !=3D -EPROBE_DEFER)
> -			dev_err(dev, "failed to get pclk: %ld\n",
> -				PTR_ERR(fifo->pclk));
> +		dev_err_probe(dev, PTR_ERR(fifo->pclk),
> +			      "failed to get pclk: %ld\n", PTR_ERR(fifo->pclk));

here.

> =A0		return PTR_ERR(fifo->pclk);
> =A0	}
> =A0
> =

> =A0	fifo->arb =3D devm_reset_control_get_exclusive(dev, NULL);
> =A0	if (IS_ERR(fifo->arb)) {
> -		if (PTR_ERR(fifo->arb) !=3D -EPROBE_DEFER)
> -			dev_err(dev, "failed to get arb reset: %ld\n",
> -				PTR_ERR(fifo->arb));
> +		dev_err_probe(dev, PTR_ERR(fifo->arb),
> +			      "failed to get arb reset: %ld\n",
> +			      PTR_ERR(fifo->arb));

etc...



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
