Return-Path: <SRS0=pKyR=WT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64F83C3A589
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 Aug 2019 05:00:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 385DA233FD
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 Aug 2019 05:00:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="thVw7fOQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 385DA233FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2tQ3W0FoCu0c/2/nwGH8QLngLqyQgTONQv9sv7zTbLc=; b=thVw7fOQcTU/zG
	0t6FxiGl1gM8jBr0U/5CiDlNfh2Bg9caHayyo7X2j5U2ZaH+uDN8cXc2znN+Ayq71EcIbs5bbHVAI
	fMKFp8rTcr+pe9vi2WZeG5ylMSjtN9Vbv2vYQlOems5bCWpMPt9SuYqiKiz1/+IOjM+Rkeq347qtz
	Gj6wuvQcQdVjT+ttTBKZEKDLGpuCW4SPSbRQAE9AYUpAHL/GzZFU39Fo/y846xj6fYJtM/4ypDhEp
	QJbXK2a0DtpoMJDVWrhJdKA6u9yIX4+lx7iHkIEny2h7uJizina7UopYTTHm+Oe+wE1r81Ci/yy5Y
	N71tGOT6cqC2GJO8Q7qw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i11gM-0004ef-IT; Fri, 23 Aug 2019 05:00:14 +0000
Received: from smtprelay0118.hostedemail.com ([216.40.44.118]
 helo=smtprelay.hostedemail.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i11gK-00043x-82; Fri, 23 Aug 2019 05:00:13 +0000
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay03.hostedemail.com (Postfix) with ESMTP id 73D998368F05;
 Fri, 23 Aug 2019 04:59:53 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: farm80_39106449b3b1d
X-Filterd-Recvd-Size: 2482
Received: from XPS-9350.home (cpe-23-242-196-136.socal.res.rr.com
 [23.242.196.136]) (Authenticated sender: joe@perches.com)
 by omf18.hostedemail.com (Postfix) with ESMTPA;
 Fri, 23 Aug 2019 04:59:52 +0000 (UTC)
Message-ID: <59c7ff8f2306069095503b72824714e369a378f8.camel@perches.com>
Subject: Re: [PATCH 10/12] phy: amlogic: G12A: Fix misuse of GENMASK macro
From: Joe Perches <joe@perches.com>
To: Kishon Vijay Abraham I <kishon@ti.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Andrew Morton <akpm@linux-foundation.org>, Kevin
 Hilman <khilman@baylibre.com>
Date: Thu, 22 Aug 2019 21:59:49 -0700
In-Reply-To: <6d7abb4d-fe68-8d02-d985-7214118be126@ti.com>
References: <cover.1562734889.git.joe@perches.com>
 <d149d2851f9aa2425c927cb8e311e20c4b83e186.1562734889.git.joe@perches.com>
 <c6cabf9c-7edd-eea8-3388-df781163cddd@baylibre.com>
 <6d7abb4d-fe68-8d02-d985-7214118be126@ti.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190822_220012_358291_087EBF84 
X-CRM114-Status: GOOD (  11.99  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, 2019-08-23 at 08:11 +0530, Kishon Vijay Abraham I wrote:
> 
> On 22/07/19 12:53 PM, Neil Armstrong wrote:
> > On 10/07/2019 07:04, Joe Perches wrote:
> > > Arguments are supposed to be ordered high then low.
> > > 
> > > Signed-off-by: Joe Perches <joe@perches.com>
> > > ---
> > >  drivers/phy/amlogic/phy-meson-g12a-usb2.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/phy/amlogic/phy-meson-g12a-usb2.c b/drivers/phy/amlogic/phy-meson-g12a-usb2.c
> > > index 9065ffc85eb4..cd7eccab2649 100644
> > > --- a/drivers/phy/amlogic/phy-meson-g12a-usb2.c
> > > +++ b/drivers/phy/amlogic/phy-meson-g12a-usb2.c
> > > @@ -66,7 +66,7 @@
> > >  #define PHY_CTRL_R14						0x38
> > >  	#define PHY_CTRL_R14_I_RDP_EN				BIT(0)
> > >  	#define PHY_CTRL_R14_I_RPU_SW1_EN			BIT(1)
> > > -	#define PHY_CTRL_R14_I_RPU_SW2_EN			GENMASK(2, 3)
> > > +	#define PHY_CTRL_R14_I_RPU_SW2_EN			GENMASK(3, 2)
> > >  	#define PHY_CTRL_R14_PG_RSTN				BIT(4)
> > >  	#define PHY_CTRL_R14_I_C2L_DATA_16_8			BIT(5)
> > >  	#define PHY_CTRL_R14_I_C2L_ASSERT_SINGLE_EN_ZERO	BIT(6)
> > > 
> > 
> > Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
> 
> Shouldn't this go to stable trees as well?

The macro define is unused so it doesn't have to go into stable.

> -Kishon


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
