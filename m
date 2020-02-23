Return-Path: <SRS0=CzRW=4L=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99D0FC35669
	for <linux-amlogic@archiver.kernel.org>; Sun, 23 Feb 2020 02:17:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6AB1D20707
	for <linux-amlogic@archiver.kernel.org>; Sun, 23 Feb 2020 02:17:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IoEukIE8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6AB1D20707
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FvOe/G0WC3+Gh1xiFZsGzKJNbHk4n5wx3cIdjUd28SM=; b=IoEukIE8pb6yc8
	pGP526F5Oh0rYxKqb0mSZSw7BEt0LlB5jGXHVr/NnEaIp9cqsFnQQamNfFjb8Jxmym+pJyBoV8m32
	FgPAnBzbVpswVSifr/10g/t8DDQrjKaglPvUfXyCf9h30qpgen1p1BuwJv8Mg391S+IUP4SEPpE7S
	1stdQn+Vhw5pO0ljQolHj4/DTKWnoImwCISDznLCLgq4d2xQCMUnvlC2O6oUlB+4aIshqVP2hdLpr
	puy6WtHnD/YbbKe47E8SKUe9MOogBB3Vuzmm+SVfPsnHsyFw+1v6RjddN2I7fJ8SL2dws4CCJ9KVi
	IZ+GQdw+uUMV++qNpI4w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j5gp3-0007wc-SJ; Sun, 23 Feb 2020 02:16:45 +0000
Received: from smtprelay0147.hostedemail.com ([216.40.44.147]
 helo=smtprelay.hostedemail.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j5gp0-0007w9-Vh; Sun, 23 Feb 2020 02:16:44 +0000
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay03.hostedemail.com (Postfix) with ESMTP id D6704837F24D;
 Sun, 23 Feb 2020 02:16:39 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: tank92_1ce31dc6cfa4f
X-Filterd-Recvd-Size: 2400
Received: from XPS-9350.home (unknown [47.151.143.254])
 (Authenticated sender: joe@perches.com)
 by omf08.hostedemail.com (Postfix) with ESMTPA;
 Sun, 23 Feb 2020 02:16:38 +0000 (UTC)
Message-ID: <7792266dfede1df5742e527dc304b610fcfbd025.camel@perches.com>
Subject: Re: [PATCH] phy: phy-meson-g12a-usb2: Fix GENMASK misuse
From: Joe Perches <joe@perches.com>
To: Ondrej Jirman <megous@megous.com>, linux-kernel@vger.kernel.org
Date: Sat, 22 Feb 2020 18:15:12 -0800
In-Reply-To: <20200222235142.242732-1-megous@megous.com>
References: <20200222235142.242732-1-megous@megous.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200222_181643_083003_47C7486F 
X-CRM114-Status: GOOD (  11.56  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Kishon Vijay Abraham I <kishon@ti.com>,
 "open list:ARM/Amlogic Meson SoC support" <linux-amlogic@lists.infradead.org>,
 "moderated
 list:ARM/Amlogic Meson SoC support" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sun, 2020-02-23 at 00:51 +0100, Ondrej Jirman wrote:
> Arguments to GENMASK should be msb >= lsb.
> 
> Signed-off-by: Ondrej Jirman <megous@megous.com>
> ---
> I just grepped the whole kernel tree for GENMASK argument order issues,
> and this is one of the three that popped up. No testing was done.

Both of these were submitted last year.
https://lkml.org/lkml/2019/7/10/20

I hope they get applied one day.

Neither patch has an affect today as none of the
#defines are used.

Perhaps deleting the #defines is better.

>  drivers/phy/amlogic/phy-meson-g12a-usb2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/amlogic/phy-meson-g12a-usb2.c b/drivers/phy/amlogic/phy-meson-g12a-usb2.c
> index 9065ffc85eb47..cd7eccab26490 100644
> --- a/drivers/phy/amlogic/phy-meson-g12a-usb2.c
> +++ b/drivers/phy/amlogic/phy-meson-g12a-usb2.c
> @@ -66,7 +66,7 @@
>  #define PHY_CTRL_R14						0x38
>  	#define PHY_CTRL_R14_I_RDP_EN				BIT(0)
>  	#define PHY_CTRL_R14_I_RPU_SW1_EN			BIT(1)
> -	#define PHY_CTRL_R14_I_RPU_SW2_EN			GENMASK(2, 3)
> +	#define PHY_CTRL_R14_I_RPU_SW2_EN			GENMASK(3, 2)
>  	#define PHY_CTRL_R14_PG_RSTN				BIT(4)
>  	#define PHY_CTRL_R14_I_C2L_DATA_16_8			BIT(5)
>  	#define PHY_CTRL_R14_I_C2L_ASSERT_SINGLE_EN_ZERO	BIT(6)


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
