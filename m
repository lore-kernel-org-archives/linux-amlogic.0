Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBC7EC7EE2A
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Jun 2023 07:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GDG9QpHnHdLmn1J1BRC47veOG0IJVlCrfOHvunQqcyM=; b=LRGe7geOwXn7+4
	2pzw7e1OWdiApPymSOPxheAcfDHM5yO/3FaKjz/hjP7shyjTOQFOzQXOH54vhJDcWK35aQnWnx17p
	J5dVCPXA6Y3Otj9+fpOmdGLapKh4QY74HqvbTeglRyAPwEBYMNaL1orO/NDa2VBuuDzxNPZyHXvoZ
	ITgC23H0WQI5kLXyuiu3/IKMStklmRh5DvnNgbKIkJZuJfFRwCItbO25LsZ9VukUsg3Sk7wl1W6PM
	8At4abZZO25U5NEsqgyI67PvSl3owYefixratt04eB4MCKS41aMwFA8DzL9GpOaztPxmcKQ1MXRZ4
	9XzWxAzQcuMP3GZrruMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q64HP-00EUUR-2E;
	Mon, 05 Jun 2023 07:05:27 +0000
Received: from out1-smtp.messagingengine.com ([66.111.4.25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q64HN-00EUT3-0e;
	Mon, 05 Jun 2023 07:05:26 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 2DCD45C0657;
	Mon,  5 Jun 2023 03:05:22 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Mon, 05 Jun 2023 03:05:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1685948722; x=1686035122; bh=gs
	KN8dIcfggLrGiSRwQVvzTjCP6B3J5Ixb0bZBrlg+0=; b=MPaEU2cKz91/xCyCUT
	sM+QSVlQJOSE7vBaGjzNvFGY3SJTsXotuLd/3MIKxfI5ORmaxlWwgJc7Trrj9Rtx
	QM8bQguiUIt9K2yDhd8hxY8ult49MTYG2PfAEhtghBdFBdth3GFZHc70Lw5x9u9v
	Eq5VLOfe9u0+lAaiVGAZwaOEN/4Hvum5OD+c0FfQfTbjVoOQoTCQCZ/kizUhjHl5
	Y2ISX2zhbgPHwzIIgje8dLXxoV/EEz4jXpfsLhFq66Uhc2dMIVMpudVU/u/9RUnc
	3OZWub2Gh45QTbUEOCRl49zPHRO0pArT0JnRI4C2eDhUHemKIAIyrtg8tkAGSmJW
	ncXQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1685948722; x=1686035122; bh=gsKN8dIcfggLr
	GiSRwQVvzTjCP6B3J5Ixb0bZBrlg+0=; b=df1wPh9bY/YVM/75YiQ5JJFe8Cv1q
	4bV/lL7S18+aIE1EAcx6FUCIOpsJGn1i0RxoyiWHJ5IEBi5o6qtq6rWVGxqiE9cS
	AvrSyKp0bI3EsejQshoILUlmvckyt4oW6hCAa942fDGJtCH0mmTz5HXMRT7y9gjf
	CBfAdB5SD1MZDeaEE7ganhcuq4d0+rD5RFpFf25AFbVZQAoc+w3NSa72D8Gd2bD4
	wpvuAaVaFcFAyerX0XR46GnoBgA4/ZvojIZoQphsQdkmsv5UI5+0qMUw0mwclO5D
	pXMjYR485Ey0BpX3zwEAhCdmoh0qG02mFQ1swkZuXubWZ/RkoRck5hXXA==
X-ME-Sender: <xms:MYl9ZCmvmOyWiCUy3GIRxw167ZbhhM-ZjEBX_x4Oa0EfaVXAciVslw>
    <xme:MYl9ZJ2GIzo7AzhqEuFkDSbt-IbBHqGM3ASk2erq6nGKQMKvYPoRuRfNLifmN7ML3
    Yu2B7oPy_p1rQ>
X-ME-Received: <xmr:MYl9ZAq3LeIyUWQUQQ0i5nW3ewvaZjvAHLrauVw_W4HGtctLjhrBdZw9q_6CEtZDTrfoAaIo2rjIYVrndugGdwAAD2ws609cbwvQTQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeelkedgudduhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgv
    ghcumffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeehge
    dvvedvleejuefgtdduudfhkeeltdeihfevjeekjeeuhfdtueefhffgheekteenucevlhhu
    shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhroh
    grhhdrtghomh
X-ME-Proxy: <xmx:MYl9ZGlXBQ4Q9kjJrSqzVVbwQe9a6LKIPjokpF_kQvG8pPNBcB4cNA>
    <xmx:MYl9ZA1S3qPQJlGRD6557P9Jb7OMXGjMULi82Sj-ThB3w6EcWxXD3w>
    <xmx:MYl9ZNs5Q-6OmrQEmHHoimNEKzmu34mnSHSYeBA45kQZCuwrhEmjTw>
    <xmx:Mol9ZLU5Hl1MOQ2CsyFxFg6HF9_nTw-fpx4gTukmQzBIdMqiieANzw>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 5 Jun 2023 03:05:20 -0400 (EDT)
Date: Mon, 5 Jun 2023 09:05:18 +0200
From: Greg KH <greg@kroah.com>
To: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
Cc: Liang Yang <liang.yang@amlogic.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Yixun Lan <yixun.lan@amlogic.com>,
	Jianxin Pan <jianxin.pan@amlogic.com>, oxffffaa@gmail.com,
	kernel@sberdevices.ru, stable@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] mtd: rawnand: meson: fix ready/busy command
Message-ID: <2023060556-monetary-browsing-536b@gregkh>
References: <20230605061048.485622-1-AVKrasnov@sberdevices.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230605061048.485622-1-AVKrasnov@sberdevices.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_000525_577783_DBE076AC 
X-CRM114-Status: UNSURE (   5.28  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Jun 05, 2023 at 09:10:48AM +0300, Arseniy Krasnov wrote:
> Fix the ready/busy command value.

"Fix" it in what way?  Please provide more information, this does not
explain what is happening here at all.

greg k-h

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
