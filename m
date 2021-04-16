Return-Path: <SRS0=6m2Z=JN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 254D5C433B4
	for <linux-amlogic@archiver.kernel.org>; Fri, 16 Apr 2021 10:01:31 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B62146115B
	for <linux-amlogic@archiver.kernel.org>; Fri, 16 Apr 2021 10:01:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B62146115B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FMS9SU/f02fdF2m6PbtuaxdJZnaKk77ZAOl9D7tddbc=; b=I8ffNm2VNP2KnJeZxzV03cA/P
	/SUkvMI44MzoxZ7y9Rl/0SM/G2xa3EWrLw5RVN+6SVBrKmaqqMfa1f/UdLXBuv746XSm4xVUfcs52
	mG08fEGF6sMOAN/PiKlvhl9/WvVZ0KNJA9ib3rm69q9KvOVXcNElI17j+f0OcJHp/DLZ2Vud2zR7H
	PG8eLTrhKeIRAZTHKkiKucPikDloHs0pydsv/XQtFQAL5mrNTVsVmcCptXTvDfRLN1bAUURbQ8R8t
	9LLwbKCPUbDQbtznvkyjFv+iTp8m7wrU5/5EmVIGlqMyluBBFwabaBs3ZF9/RExVeIQHvjfU4/wLc
	Hj3oiFF1Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXLHw-001fPW-UE; Fri, 16 Apr 2021 10:01:25 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXLEn-001eM8-PQ; Fri, 16 Apr 2021 09:58:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=8Z0+3TCnQsBGm8KIovOPASdmcq77fxqvK/EusCN+jnA=; b=4/3/i2uszflWzumJ9shNqXrxqM
 DKL5f+hMDR5Inenk8zo1r/f7KIQoKxyYn9PcXykjcHaoTY55q/7jZAoOuyrUAH79AX+qYld5cHCES
 2hSU2oGpA56j5lyIBFShfyhubkUPY3M98rIe1+4OmIuUUAZ8z9RBN+fB8Y5/hplJUHVYLg6j2ApC2
 cU3bcjgdWzXVJCSosiQiM9KRYsCmGixz5FydrEQoiAanwXei49YhD58COjtL57gRqhidCdnvceMon
 xy1O6MXNmUjZv7Pa/b2e0PYya6nJqu88T3bZSUMt9WynbGGl8gISOeyn55xmYwt/j2RHtlBFKW1O2
 PzrRe1Kw==;
Received: from perceval.ideasonboard.com
 ([2001:4b98:dc2:55:216:3eff:fef7:d647])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXLEl-009GHM-78; Fri, 16 Apr 2021 09:58:08 +0000
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4A3935A5;
 Fri, 16 Apr 2021 11:58:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1618567082;
 bh=xSo6PytDu5Cq4mnyjhpzVYDwWNwyPGmVgHOT/48h4nU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MZOdxX5ofISyaTc31LDkhK/plA7k0+HS91ESbp1PMm16M18wsilwkkSaOsQ2Cug4w
 G+DmizAgRLLcii1bDbmZ9zJe7k4kt5/6nT340AKnyGUJfLTSluhMP+PjX7UM9aUsVf
 2TjmDMBTbT9JF4vbcSaaMTNZn0LW25TvON5CZO34=
Date: Fri, 16 Apr 2021 12:58:00 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: jonas@kwiboo.se, jernej.skrabec@siol.net, robert.foss@linaro.org,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] drm/bridge: dw-hdmi: disable loading of DW-HDMI CEC
 sub-driver
Message-ID: <YHlfqJIlUh7eytty@pendragon.ideasonboard.com>
References: <20210416092737.1971876-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210416092737.1971876-1-narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_025807_423765_C533C89B 
X-CRM114-Status: GOOD (  15.18  )
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

Hi Neil,

On Fri, Apr 16, 2021 at 11:27:35AM +0200, Neil Armstrong wrote:
> This adds DW-HDMI driver a glue option to disable loading of the CEC sub-driver.
> 
> On some SoCs, the CEC functionality is enabled in the IP config bits, but the
> CEC bus is non-functional like on Amlogic SoCs, where the CEC config bit is set
> but the DW-HDMI CEC signal is not connected to a physical pin, leading to some
> confusion when the DW-HDMI CEC controller can't communicate on the bus.

If we can't trust the CEC config bit, would it be better to not use it
at all, and instead let each platform glue logic tell whether to enable
CEC or not ?

> Jernej Skrabec (1):
>   drm/bridge/synopsys: dw-hdmi: Add an option to suppress loading CEC
>     driver
> 
> Neil Armstrong (1):
>   drm/meson: dw-hdmi: disable DW-HDMI CEC sub-driver
> 
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 2 +-
>  drivers/gpu/drm/meson/meson_dw_hdmi.c     | 1 +
>  include/drm/bridge/dw_hdmi.h              | 2 ++
>  3 files changed, 4 insertions(+), 1 deletion(-)
> 

-- 
Regards,

Laurent Pinchart

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
