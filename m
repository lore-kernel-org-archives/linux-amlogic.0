Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E225CC001DC
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Jul 2023 19:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uK1woO8h+XyELBCHt0s05IQstNecmSh3ti05XgHjPhE=; b=ZZIp0RSjB3kAPi
	fOlEt21Y5dXv8RwlEpq0qvAVaukgr3jVD0AxJA57S2PUUkeZymGOgsJzuoyXVJUxdAdpb0R/MoFH3
	NCHZsySCFwQxbsWN5KtHt8ZSZyZ8XYll6gF7Xry9rIBIufzpb9bRkb5teztQSV5a0cgGrg0uoUF4W
	9SkIEXzclFKN6m69r2fRaQ5f92qWUH3mgoTR80nVEC3QdVirx00OkW4c1ZVRFPbLBo0R2vJpuL8XG
	FXAv+7U8Yygmy00Zc0xg+TuIG4u3LkqPRJ5aTF0UOMgf6fPWqiEs593vctRvEkNbwiB1NgS3/7e4A
	1mlBjOMvYhzbWVMCQ/2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMD63-008jc7-0g;
	Wed, 19 Jul 2023 19:44:27 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMD5z-008ja6-11;
	Wed, 19 Jul 2023 19:44:26 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id C3827100015;
	Wed, 19 Jul 2023 22:44:18 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru C3827100015
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1689795858;
	bh=kUDvjqDNQNz1pNg7L/BrcdK38VwKX7/0pQHaXlKqgl4=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:From;
	b=O96gQ0O7FLkrRpu8YQxNKft8u2UIlT1/gEF24uLIAjlyKkGppVZPNClZrIA2eFkqr
	 Ih1oAtxYFB4v24D7/3Blg368obJnkXkoKv4fHsUpw+etpBsNu42obTm8RmitAP3qbW
	 tYisGoO+jR9f2ckjoKIHsVNpiBAJWHIT+fUe9egig/ukR9LIoETXypf0TsZksJWanw
	 pNorMle5Jr1CMmDNIGLskaBXUlTo8BnnKElkBI49qY9JZCCLzxqJlTijLEW7nHAlmw
	 rf3e2PhgIkAmGqu60ymWzBp7FVzGWZQQvQcx6OhqJWfoE0Q4e+N92PmD5oVfSpTEQ1
	 pxURzQqkZN6pg==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Wed, 19 Jul 2023 22:44:18 +0300 (MSK)
Received: from localhost (100.64.160.123) by p-i-exch-sc-m01.sberdevices.ru
 (172.16.192.107) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Wed, 19 Jul
 2023 22:44:18 +0300
Date: Wed, 19 Jul 2023 22:44:13 +0300
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Neil
 Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH V2 1/4] soc: amlogic: use name instead of index as
 criterion
Message-ID: <20230719194413.ssxxzwo3jkbsj2lb@CAB-WSD-L081021>
References: <20230707003710.2667989-1-xianwei.zhao@amlogic.com>
 <20230707003710.2667989-2-xianwei.zhao@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230707003710.2667989-2-xianwei.zhao@amlogic.com>
User-Agent: NeoMutt/20220415
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 178730 [Jul 19 2023]
X-KSMG-AntiSpam-Version: 5.9.59.0
X-KSMG-AntiSpam-Envelope-From: DDRokosov@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 524 524 9753033d6953787301affc41bead8ed49c47b39d, {Tracking_uf_ne_domains}, {Track_E25351}, {Tracking_from_domain_doesnt_match_to}, lists.infradead.org:7.1.1;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;sberdevices.ru:7.1.1,5.0.1;p-i-exch-sc-m01.sberdevices.ru:7.1.1,5.0.1;100.64.160.123:7.1.2, FromAlignment: s, {Tracking_white_helo}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2023/07/19 15:51:00
X-KSMG-LinksScanning: Clean, bases: 2023/07/19 15:51:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/07/19 15:29:00 #21641898
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_124424_047307_128F1E5E 
X-CRM114-Status: GOOD (  22.86  )
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

On Fri, Jul 07, 2023 at 08:37:07AM +0800, Xianwei Zhao wrote:
> The  variate 'index' could be equal to zero in some SoCs. Such as C3 SoC,
> PWRC_C3_NNA_ID be defined zero. Use 'name' instead of 'index' as criterion.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>

Reviewed-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>

> ---
> V1 -> V2: add a new patch for change.
> ---
>  drivers/soc/amlogic/meson-secure-pwrc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/amlogic/meson-secure-pwrc.c b/drivers/soc/amlogic/meson-secure-pwrc.c
> index 25b4b71df9b8..c11d65a3e3d9 100644
> --- a/drivers/soc/amlogic/meson-secure-pwrc.c
> +++ b/drivers/soc/amlogic/meson-secure-pwrc.c
> @@ -179,7 +179,7 @@ static int meson_secure_pwrc_probe(struct platform_device *pdev)
>  	for (i = 0 ; i < match->count ; ++i) {
>  		struct meson_secure_pwrc_domain *dom = &pwrc->domains[i];
>  
> -		if (!match->domains[i].index)
> +		if (!match->domains[i].name)
>  			continue;
>  
>  		dom->pwrc = pwrc;
> -- 
> 2.37.1
> 
> 
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

-- 
Thank you,
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
