Return-Path: <SRS0=E6Yr=GA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA392C433E0
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Dec 2020 20:38:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BA2E223C8
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Dec 2020 20:38:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9BA2E223C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1oDsOd27TKYuFzqRoVHJEWrb2n0TFHOz2U6gM9v/79Q=; b=Tc3FHQf14AVg/3WhVEytUfMiJ
	I6JwocO5mYvsjsaCtwLTOKovrQybuVKKHFltLMGVSbM8Mk0DKrm+GJb7wsLN41ASkA1VgGE9HNQYI
	QrsBYKzRizvHHOSlyCTqYL4o1wslRN2y5W3FOC/xQePZ4InhU1PawbZuKnuuBqqyf3O749zLr707M
	lcxdcHTssn+OxEksbl7qy2pRnbprzUQ05CmqxCVKgJbgNYOpd3B7BRX9Tg+Lx66uo4w4rZWzYfmUw
	AlVCugIWJezuoHYphjlOGpGjXclY9B4Sx8J4QvwBWT7i/BT3Ic3zfPy7BiGmNFHwsTMey4Fqk64o0
	RzLQjVIFg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ktzH3-0000MS-U3; Mon, 28 Dec 2020 20:37:50 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ktzH1-0000Ld-HL; Mon, 28 Dec 2020 20:37:48 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 41794222B3;
 Mon, 28 Dec 2020 20:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609187865;
 bh=jKsuQqJ9tD8ix6GIefAnDlAfbWqdefgsaGPxPfxb7JA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=KmgS6pTUFXJgv3bPAxBSOf/ocpXNDqomPoD21MQX7n4RKxTEZzqT+43Iif/jNE5cj
 dEUPa26psd04wwyrR9ynaVkcXpp0jL3itOaUNyffgpcpRGtBx6VAg6XtVwPJu8jFNH
 8bUK//+r/GLj92Ok8AIzqBo3fyS3Q3T+MemfHwYuD/qQk5ELaKzLs2tGjjaFs5BdEq
 H9ZRuuzaNNgkNGaYrIK9sGAxizIzSlRwuSagL2lijxXVTXALpX/Ka4xauVjX3JDaCv
 Kga1rxs05/qJudhxIHoT6RcyYEvyVFKg+2X6wJ4XIcIcfFxFcSCDje3WxZ6UEBaIGc
 10ulu1Chb7jcQ==
Date: Mon, 28 Dec 2020 12:37:44 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v3 0/5] dwmac-meson8b: picosecond precision RX delay
 support
Message-ID: <20201228123744.551d1364@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20201223232905.2958651-1-martin.blumenstingl@googlemail.com>
References: <20201223232905.2958651-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201228_153747_648799_33A1B337 
X-CRM114-Status: UNSURE (   8.20  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: andrew@lunn.ch, f.fainelli@gmail.com, jianxin.pan@amlogic.com,
 devicetree@vger.kernel.org, netdev@vger.kernel.org, narmstrong@baylibre.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, khilman@baylibre.com,
 linux-amlogic@lists.infradead.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, 24 Dec 2020 00:29:00 +0100 Martin Blumenstingl wrote:
> Hello,
> 
> with the help of Jianxin Pan (many thanks!) the meaning of the "new"
> PRG_ETH1[19:16] register bits on Amlogic Meson G12A, G12B and SM1 SoCs
> are finally known. These SoCs allow fine-tuning the RGMII RX delay in
> 200ps steps (contrary to what I have thought in the past [0] these are
> not some "calibration" values).

Could you repost in a few days? Net-next is still closed:

http://vger.kernel.org/~davem/net-next.html

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
