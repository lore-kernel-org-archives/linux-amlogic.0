Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00DA2ECAAD3
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Sep 2022 11:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ROsja+Kw0Wc9CsAv8Bp8OyJp/aFTS9Txd32HCsw7d0k=; b=GZMlNtumXs2EVl
	4thoMcuF43e4+I99sPFngCXHf/R6i2AgBLZUYgY2+MwfBKNnyFJ50TTC+q8QZ0Lc3wSOfOOZiQajC
	OBrM6TRFCFMVA5GFuNZAP+FheEcGX7lPtO/Gvzj6MuDblakhL+thf2aXgx1fDGxgZydJe83/vGCCt
	CrtrugIylhA8F3Eo3g8ToP1+z8CD/A4FxMliWEf+l7zwbx3LGyKhefNcilMw7d6D9lFrdIeAMyaoP
	sDCfhhvKoaQmz0IKka/MCMz/dbZJsNHSc/0cLmEB+ogvhqIy6DwLXAnUjPfcHgi8Yd6HrKuvLK2wJ
	4NqK8e+VF8T5B3+Ny6ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYQR5-00Fv3j-Dz; Wed, 14 Sep 2022 11:20:07 +0000
Received: from new3-smtp.messagingengine.com ([66.111.4.229])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYQR2-00FuqQ-En; Wed, 14 Sep 2022 11:20:06 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailnew.nyi.internal (Postfix) with ESMTP id 147325804BC;
	Wed, 14 Sep 2022 07:19:57 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute3.internal (MEProxy); Wed, 14 Sep 2022 07:19:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1663154397; x=1663157997; bh=WPw+PiU5QR
	c8NpKWmsOZ9H1kA5iPdmxgIhIPlzrL/x4=; b=ZY2JOEQ+ocn2h4YTLt9zNsISZd
	QoP8PvOsqSoSWWs46Yb6AKVhTiSt1E+K84Dyfxco3T2OxfhoZ8TIZNaqvA5CKFSA
	N2BrpkcuKSPWfWwSwjH9Rr8Edwtk+u3FC0YW0iFBB6Aq3MYMBQU2SZ19t87KOwnv
	9rRjg0Ol/l19GgasLe1MSAz0jD0U0X/X+XzhgVsJM7zw2GkPOe2rA+QDN/s7Mk5A
	RMycQW2cMekE4Qqx2e9RHxqiiAiulZHLkSioVgFR1M4fz2TseQgV4WdrXLBDYz7O
	VCvMXK1N05s7SXP1089knVxSKRxoBqxjBx2r6Rfp9iTHmWXCP4853J1/T51g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1663154397; x=1663157997; bh=WPw+PiU5QRc8NpKWmsOZ9H1kA5iP
	dmxgIhIPlzrL/x4=; b=D4xmSKhYamtg12c4QJxVfGEtsKaUzGYqWObXsIhI0IVP
	qPOs/2vAJGY/x61C+EEag/kS0nwVcuAnjHt59NHkodIrN2M+jfEJTVy/kOLRb+Ub
	PIPeVR6VUcskx4z1owCIikR9Pe1VjzKp08BXRhGSTXRVRwuOoiGs6BTr5Zes8hhE
	gcD/hSUzfk4IcEukBrVxefD7My9FlndiZR6dw7ggbNX65OX0gzDblslTkL0tnqI8
	PYFhUf+45eVCe69RgJ+/phkxS5PuKEAETuIJhbnAD9qT0seDQmFqMDJ7qzV7dCU2
	qz6dgEoJ3kw6JII/X103g2Fs4Q/NOW94gGrcsl+k/g==
X-ME-Sender: <xms:3LghY3N_U3sfIXArf24PyBSaSWJ94H5txe5rG_7W8wYQCVrjZ6lCBA>
    <xme:3LghYx-yCAfhqVFM3k5vdjTxWqtA9qCw3-o8bAoi2Odwd9ixmZ22RWrHarPAy0AHu
    XuCvO9s5dZOKVmmc-0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeduiedgfeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:3LghY2QJsNymS90o28QEi_V--Z7QEczBj06ZzJRIkUTGjT0IkvMInw>
    <xmx:3LghY7tDd8R4-7cB0qRIrpGabxjwdiadj3OVcvabyLBiMoob2kuEAw>
    <xmx:3LghY_ecSaQ7-Qdf6FC9Ui1lv8yscjgRDqet72orsvwlLFTaX_kSsw>
    <xmx:3LghY77Tjx73JpkHvdmXZ3LVLRcz-vfJlTNLTKP_tSbdA_e65smpkw>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 9260EB60086; Wed, 14 Sep 2022 07:19:56 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-934-g6274855a4c-fm-20220913.002-g6274855a
Mime-Version: 1.0
Message-Id: <667da463-1edc-4a99-9ac1-85303d9187c6@www.fastmail.com>
In-Reply-To: <20220913140303.437994-1-narmstrong@baylibre.com>
References: <20220913140303.437994-1-narmstrong@baylibre.com>
Date: Wed, 14 Sep 2022 13:19:31 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Neil Armstrong" <narmstrong@baylibre.com>,
 "Mark Brown" <broonie@kernel.org>
Cc: linux-spi@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] spi: meson-spicc: add support for DMA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_042004_829448_6D6861F2 
X-CRM114-Status: GOOD (  14.52  )
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

On Tue, Sep 13, 2022, at 4:03 PM, Neil Armstrong wrote:

> +static void meson_spicc_setup_dma_burst(struct meson_spicc_device *spicc)
> +{
...
> +	/* Setup burst length */
> +	writel_relaxed(ld_ctr1, spicc->base + SPICC_LD_CNTL1);
> +
> +	writel_relaxed(SPICC_DMA_ENABLE | SPICC_DMA_URGENT |
> +		       FIELD_PREP(SPICC_TXFIFO_THRESHOLD_MASK, txfifo_thres) |
> +		       FIELD_PREP(SPICC_READ_BURST_MASK, read_req) |
> +		       FIELD_PREP(SPICC_RXFIFO_THRESHOLD_MASK, rxfifo_thres) |
> +		       FIELD_PREP(SPICC_WRITE_BURST_MASK, write_req),
> +		       spicc->base + SPICC_DMAREG);
> +}

It looks like this last writel_relaxed() starts the DMA, but I don't
see any barrier that serializes it against the memory access, which
could still be in a store buffer.

> + /* Sometimes, TC gets triggered while the RX fifo isn't fully flushed *
> + if (spicc->using_dma) {
> +          unsigned int rxfifo_count = FIELD_GET(SPICC_RXCNT_MASK,
> +                       readl_relaxed(spicc->base + SPICC_TESTREG));

Same here in the interrupt controller, I don't see anything enforcing
the DMA to actually complete before the readl_relaxed().

At the very minimum, I think these two have to use non-relaxed
accessors when adding DMA support, but an easier approach would
be to use those consistently throughout the driver.

     Arnd

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
