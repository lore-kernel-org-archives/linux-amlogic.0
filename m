Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 718D2EB64DC
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Jun 2023 19:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=APPSiRecWN1XcPnuKPumBqrboFgd24hnjirGRAJjgAM=; b=OMPI02HWlltkh5
	9tuZ81U/naeP5iWOiqyOhSNd37Ij3hRPAFA3/bo3zMD+hp/ziXHp5YER23CZIny58ZxsHlPXQMZNG
	cIUjjiCLCwy2FA3Q5hZ/Tg2UUgIhy8Vrhz2+79lPTb4Ob1pVNfr6ROGv0oD6B1wPSzKHJ5pJjmUsL
	VwNDxT/7hMgwZdbR8kECD3OT0HaCaeJawSNuGlDE601hP2m7dsB6RUDKnaMhOe6cMHkYsKr2WD0Ux
	vu6HQs4RWWCQwUeOLANkB10ya3ecswkj6ar3Rb1i+rCuXkapvXhw/Drp+AsoZKULaZnlGVdGA6FDB
	d+mpRwGaN+9t92c23l3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCPZU-001WBu-0W;
	Thu, 22 Jun 2023 19:02:20 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCPZR-001WBA-0G
	for linux-amlogic@lists.infradead.org;
	Thu, 22 Jun 2023 19:02:18 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id D9D685FD1D;
	Thu, 22 Jun 2023 22:02:14 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1687460534;
	bh=yqwFHUHVsnfkRLDg+tlWSM2fF7T9GBR3AoTi2RuucbA=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	b=ZyVUu9sawIlSc80T3PPczeJ9nWjxgxUWCED7U529qtl0aj8cLCC7m30XV7U6iMHl1
	 wXtBYpQyxgY1Y5SVcH2n2dbxnvcyGAbwTk9NEQ0lVgQEca1j9nQ0UjbWVCGX7e16P4
	 gZ0XogXRbbnywqxRgWNGR94SRieGsZNLzqwAICbQEzMXkLBADT66hQpqLKfe0ZknII
	 z1mfiOOGfTqKH08ZqJ+EAZ64cxX3BsQF6l9TRkXbMncjq1eZZJJ7oXHxMSZ/Mv5c7F
	 FEWOuOeuHwqR10DsB9GG/14iu2z1A9bNHsoOg3ttHhTa7e/WtvCoDCyLqB4hyqUecB
	 TKpcl7W51551w==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Thu, 22 Jun 2023 22:02:13 +0300 (MSK)
Date: Thu, 22 Jun 2023 22:02:13 +0300
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
CC: Jian Hu <jian.hu@amlogic.com>, Jerome Brunet <jbrunet@baylibre.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, <linux-amlogic@lists.infradead.org>,
	<kernel-janitors@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] MAINTAINERS: repair pattern in ARM/Amlogic Meson SoC
 CLOCK FRAMEWORK
Message-ID: <20230622190213.r3ru44ghucxnk7rc@CAB-WSD-L081021>
References: <20230614084212.1359-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230614084212.1359-1-lukas.bulwahn@gmail.com>
User-Agent: NeoMutt/20220415
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/06/22 14:26:00 #21556046
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230622_120217_295272_C6734F7D 
X-CRM114-Status: GOOD (  18.02  )
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

Dear Lukas,

I want to express my sincere gratitude for promptly correcting my
mistake. Your help is truly appreciated. Thank you very much!

On Wed, Jun 14, 2023 at 10:42:12AM +0200, Lukas Bulwahn wrote:
> Commit e6c6ddb397e2 ("dt-bindings: clock: meson: add A1 PLL clock
> controller bindings") adds a file entry with pattern
> "include/dt-bindings/clock/a1*" to the ARM/Amlogic Meson SoC CLOCK
> FRAMEWORK section. However, all header files added in the patch series to
> add Amlogic A1 clock controller drivers carry the prefix "amlogic,a1", and
> there are not header files matching "a1*".
> 
> Hence, ./scripts/get_maintainer.pl --self-test=patterns complains about a
> broken reference.
> 
> Adjust the pattern of this file entry to match the headers actually added.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 08c7efe271c3..08f7c69c67c4 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1887,7 +1887,7 @@ L:	linux-amlogic@lists.infradead.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/clock/amlogic*
>  F:	drivers/clk/meson/
> -F:	include/dt-bindings/clock/a1*
> +F:	include/dt-bindings/clock/amlogic,a1*
>  F:	include/dt-bindings/clock/gxbb*
>  F:	include/dt-bindings/clock/meson*
>  

Reviewed-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>

> -- 
> 2.17.1
> 

-- 
Thank you,
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
