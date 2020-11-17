Return-Path: <SRS0=6jDt=EX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86A35C388F9
	for <linux-amlogic@archiver.kernel.org>; Tue, 17 Nov 2020 02:07:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A15224698
	for <linux-amlogic@archiver.kernel.org>; Tue, 17 Nov 2020 02:07:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Nlalw30o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A15224698
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mQI2XrNJzT57MnsIFzRms//Xu+CAnc4SyZyhXI8bKig=; b=Nlalw30oXeyUiCcLCVyX7H+k0
	3OWE8x+FDnuhUcgghhcdKDOkaOfPtnUQ+Z13Fv3aGdm91y9aQIodE8+rbSsKO+tcPuhwAx7cn+/0+
	n1WYlmz0MujCfibZpKmIID08hMwMwJ+Ex4yPhaxN0ZbggKlSa4yIrxR9WEZd/6SGo4jy657vxe33l
	EGNNa/y0NQczJwFh9ykWAXImmtm/MDrMMqELTnc04EA/p261HBGhLPGvjiGE6OXS5x3JjJ/Qbcvdc
	1F9Vny958UA6c7KYkztNS1vHkRSctRmjjmOrlFqvtp6qNt8DHmeFDXxvtDuxeD8pP65At/rFFduY9
	adYWZr4zQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1keqOj-000056-GW; Tue, 17 Nov 2020 02:07:09 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keqOh-0008Vt-5t; Tue, 17 Nov 2020 02:07:07 +0000
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
 (envelope-from <andrew@lunn.ch>)
 id 1keqOZ-007S9C-4V; Tue, 17 Nov 2020 03:06:59 +0100
Date: Tue, 17 Nov 2020 03:06:59 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH RFC v2 5/5] net: stmmac: dwmac-meson8b: add support for
 the RGMII RX delay on G12A
Message-ID: <20201117020659.GE1752213@lunn.ch>
References: <20201115185210.573739-1-martin.blumenstingl@googlemail.com>
 <20201115185210.573739-6-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201115185210.573739-6-martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_210707_256384_0A7DD91F 
X-CRM114-Status: GOOD (  10.46  )
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
Cc: devicetree@vger.kernel.org, f.fainelli@gmail.com, jianxin.pan@amlogic.com,
 narmstrong@baylibre.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, khilman@baylibre.com, linux-amlogic@lists.infradead.org,
 kuba@kernel.org, davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sun, Nov 15, 2020 at 07:52:10PM +0100, Martin Blumenstingl wrote:
> Amlogic Meson G12A (and newer: G12B, SM1) SoCs have a more advanced RX
> delay logic. Instead of fine-tuning the delay in the nanoseconds range
> it now allows tuning in 200 picosecond steps. This support comes with
> new bits in the PRG_ETH1[19:16] register.
> 
> Add support for validating the RGMII RX delay as well as configuring the
> register accordingly on these platforms.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
