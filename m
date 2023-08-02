Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A90B3C001DF
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Aug 2023 07:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wfpYYl8ay4VTJaY3p02vifGFqS3AlIlvBGTwMV0rsV4=; b=k+hc5XDT4HIE1j
	sDqWK2RRdUt3YEbDVxy3+wHDmwGPlctGSmU4pyBtPBzwqs4E5thkdlUNDShAEo/yNj7WEp98IWTGN
	QcIGWa0tpDisvVgjZDqun9wBRY9gwD9zKGVuj8/oNceubAjdX4RnwYWfgBgo0BVAQzB7zmVFyElSZ
	G8NtKslATRd5h3VzP2zLzgTfGjYCPl+h/ZuVjb+l27vIg77cf6chRWU9OW3T6eY57qSCSAKkbRmTb
	hoPXyQFRhbOVcfP3mRTAIzgmF8p4mOzxPAZcRXdEORLxp1+XElwv9maO3212c8KkTR816oU/JQLlH
	ZbhnjXtWjlLYmZRPxeaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qR6PU-004GLe-00;
	Wed, 02 Aug 2023 07:36:44 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qR6PQ-004GKr-2X;
	Wed, 02 Aug 2023 07:36:42 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 9CB3E100020;
	Wed,  2 Aug 2023 10:36:37 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 9CB3E100020
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1690961797;
	bh=b/D/LJ/JEmhps4l5xrKdBZ4JUoOucTGmiH6sdU6vmSw=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:From;
	b=asQkXlnrZwtQb8EjKdJdbn87doPjxw8ZkcF0jXGFDNEUolgpT3dW/UJ9/NaMxNmth
	 z+0OtccyG9yCK9ivH1JtmahlrBpXc6LtQLbZbJNMkoq683PhRHPlaFDiR5NfFKn/6S
	 IHGBHsPy2W5bNkQKx74WyYde6Iiqge71INBwIr5x9FAd5qdxqQnVM7T9KsT9EMNX52
	 68cBxdyEWA+cLb7KqrHodbxxBx4LraFGnzyOpjqCyGKyyOmLAUnb5zH1WCXTWvyqz6
	 WbA5XPj8IswtfpSzyOkxHEnyP1bKVUKnB60m6IN3V3Hk9IQcOGT/iForslYKU26KQv
	 zkLBgQ8FY03pw==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Wed,  2 Aug 2023 10:36:37 +0300 (MSK)
Received: from localhost (100.64.160.123) by p-i-exch-sc-m01.sberdevices.ru
 (172.16.192.107) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Wed, 2 Aug
 2023 10:36:37 +0300
Date: Wed, 2 Aug 2023 10:36:37 +0300
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: Huqiang Qin <huqiang.qin@amlogic.com>
CC: <wim@linux-watchdog.org>, <linux@roeck-us.net>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
	<neil.armstrong@linaro.org>, <khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <linux-watchdog@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Conor
 Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH V2 1/4] dt-bindings: watchdog: Add support for Amlogic-T7
 SoCs
Message-ID: <20230802073637.4dy22fdh5kxukylo@CAB-WSD-L081021>
References: <20230802033222.4024946-1-huqiang.qin@amlogic.com>
 <20230802033222.4024946-2-huqiang.qin@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230802033222.4024946-2-huqiang.qin@amlogic.com>
User-Agent: NeoMutt/20220415
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 178796 [Jul 22 2023]
X-KSMG-AntiSpam-Version: 5.9.59.0
X-KSMG-AntiSpam-Envelope-From: DDRokosov@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 525 525 723604743bfbdb7e16728748c3fa45e9eba05f7d, {Tracking_uf_ne_domains}, {Track_E25351}, {Tracking_from_domain_doesnt_match_to}, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2023/07/23 10:45:00
X-KSMG-LinksScanning: Clean, bases: 2023/07/23 10:46:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/07/23 08:49:00 #21663637
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_003641_215984_02B990C3 
X-CRM114-Status: GOOD (  16.59  )
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

On Wed, Aug 02, 2023 at 11:32:19AM +0800, Huqiang Qin wrote:
> Update dt-binding document for watchdog of Amlogic-T7 SoCs.
> 
> Signed-off-by: Huqiang Qin <huqiang.qin@amlogic.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>

> ---
> 
> V1 -> V2: Unchanged.
> 
>  .../devicetree/bindings/watchdog/amlogic,meson-gxbb-wdt.yaml     | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/amlogic,meson-gxbb-wdt.yaml b/Documentation/devicetree/bindings/watchdog/amlogic,meson-gxbb-wdt.yaml
> index f5cc7aa1b93b..443e2e7ab467 100644
> --- a/Documentation/devicetree/bindings/watchdog/amlogic,meson-gxbb-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/amlogic,meson-gxbb-wdt.yaml
> @@ -17,6 +17,7 @@ properties:
>    compatible:
>      enum:
>        - amlogic,meson-gxbb-wdt
> +      - amlogic,t7-wdt
>  
>    reg:
>      maxItems: 1
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
