Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63DACC48260
	for <linux-amlogic@archiver.kernel.org>; Fri, 16 Feb 2024 21:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3t9XBq6FfwXwTYdml6rj5SkCMM0zhkrB0coa8OhjlQI=; b=wyDBnRxU/0ev1i
	Em+avUeLNFUao5mJiWX5NT0JKvhLfUQrECB8qbwhBS2TO3ozTxZwpF/WClDGF6jGYHzw2UxwqnJuf
	AoLLOJaW8t0Qi4GS2BixjKsKQkR19NsEB8w92YvSbOzHKQJSEy0CTt9tv7ZaIH7htJmsAl0P0STWr
	GM0e7jOPGMDGJZ0U5H/861ojag5g4xaHtVxO5hZqFCYXjvVjMIlDIeNLLsbb9/HJVQEBv/+q7i667
	v+V6Q/5f8ez9NrTreIJo9ocsy2zv4ROs6v8apvCVc4Nk4Ktdx+av/WvorbpaW7T/BFxfhcwTWjDcG
	VsnFJxgTmk7CEpx6pa3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rb5Zv-00000003miz-0WR6;
	Fri, 16 Feb 2024 21:17:03 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rb5Zq-00000003mfn-3qrR;
	Fri, 16 Feb 2024 21:17:01 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id C4BCF120005;
	Sat, 17 Feb 2024 00:16:39 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru C4BCF120005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1708118199;
	bh=GEWIYujsIGK1qBJth7fHLRLKuwS+uxfDCkWZ+vejPIE=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:From;
	b=g1kLTSFU/u0PFhAK9lpAHIYHQ6fCHKPgC64MEZ5lIh/EsphXaQCQnFtUVl4TtrH9H
	 92t13h7IEbtsOhr6Z0iIbjLy8fgLW6JOXC4CWxodvLsZOFIUkeUSf/ot8vkJW6CAZv
	 oOZGN1v0byMaOabycadNHweKo95a0pbmK/3VdjbAImaEtx7suu3fd36DC08NGALWT0
	 b2hVCjKiX9XjUQeZo9FGY/LJdEJ4wzEu9qYAUhjsu7UpgHxlRT2q/70NO7XWmlOtiM
	 /2fSTVC/znuEqLELw+r00EExbmhM5f/ZTLu8snobgRRxEmuwDDPWGVSwUZ/9PMmbvN
	 noWr4Ki9EN3UQ==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Sat, 17 Feb 2024 00:16:39 +0300 (MSK)
Received: from localhost (100.64.160.123) by p-i-exch-sc-m01.sberdevices.ru
 (172.16.192.107) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Sat, 17 Feb
 2024 00:16:39 +0300
Date: Sat, 17 Feb 2024 00:16:39 +0300
From: Evgeny Bachinin <eabachinin@salutedevices.com>
To: Viacheslav Bocharov <adeep@lexina.in>
CC: Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet
	<jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
	<linux-amlogic@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH 3/5] firmware: meson_sm: move common definitions to
 header file
Message-ID: <7zhsafmokydl3fxtfsjjnhizq6tidxsuefqcemsqqwqdje6m4p@gxfz3ajr76mv>
References: <20231122125643.1717160-1-adeep@lexina.in>
 <20231122125643.1717160-4-adeep@lexina.in>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231122125643.1717160-4-adeep@lexina.in>
User-Agent: NeoMutt/20231006
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 183517 [Feb 16 2024]
X-KSMG-AntiSpam-Version: 6.1.0.3
X-KSMG-AntiSpam-Envelope-From: eabachinin@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 7 0.3.7 6d6bf5bd8eea7373134f756a2fd73e9456bb7d1a, {Track_E25351}, {Tracking_from_domain_doesnt_match_to}, salutedevices.com:7.1.1;smtp.sberdevices.ru:5.0.1,7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;100.64.160.123:7.1.2;127.0.0.199:7.1.2, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/02/16 20:10:00 #23642199
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240216_131659_670387_F8CC59E9 
X-CRM114-Status: GOOD (  18.51  )
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

On Wed, Nov 22, 2023 at 03:56:41PM +0300, Viacheslav Bocharov wrote:
> Move SM_CHIPID_* constants from firmware meson sm driver to
> header file.
> 
> Signed-off-by: Viacheslav Bocharov <adeep@lexina.in>
> ---
>  drivers/firmware/meson/meson_sm.c       | 4 ----
>  include/linux/firmware/meson/meson_sm.h | 4 ++++
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/firmware/meson/meson_sm.c b/drivers/firmware/meson/meson_sm.c
> index 402851ed4ac0..96e50811336f 100644
> --- a/drivers/firmware/meson/meson_sm.c
> +++ b/drivers/firmware/meson/meson_sm.c
> @@ -240,10 +240,6 @@ struct meson_sm_firmware *meson_sm_get(struct device_node *sm_node)
>  }
>  EXPORT_SYMBOL_GPL(meson_sm_get);
>  
> -#define SM_CHIP_ID_LENGTH	119
> -#define SM_CHIP_ID_OFFSET	4
> -#define SM_CHIP_ID_SIZE		12
> -
>  static ssize_t serial_show(struct device *dev, struct device_attribute *attr,
>  			 char *buf)
>  {
> diff --git a/include/linux/firmware/meson/meson_sm.h b/include/linux/firmware/meson/meson_sm.h
> index 8eaf8922ab02..f62acd2bf52a 100644
> --- a/include/linux/firmware/meson/meson_sm.h
> +++ b/include/linux/firmware/meson/meson_sm.h
> @@ -7,6 +7,10 @@
>  #ifndef _MESON_SM_FW_H_
>  #define _MESON_SM_FW_H_
>  
> +#define SM_CHIP_ID_LENGTH	119

Does anybody know why this value is 119 bytes?
if in-shmem data, arrived from BL31, contains only up to 20 bytes
(in case of chipID v2):
+-----------+---------+---------------------------------+
| chipID ver|  cpu_id |        12b-serial               |
|  4 bytes  | 4 bytes |(per particular die unique data) |
+-----------+---------+---------------------------------+

> +#define SM_CHIP_ID_OFFSET	4
> +#define SM_CHIP_ID_SIZE		12

It seems that either the value (12) is incorrect or the current naming
is misleading. This is because the chipID is 16 bytes. Of course,
likely the SoC serial was meant here...

Furthermore, it appears that SM_CHIP_ID_SIZE is an unused symbol. It
has been unused since its creation in
0789724f86a5 ('firmware: meson_sm: Add serial number sysfs entry')

> +
>  enum {
>  	SM_EFUSE_READ,
>  	SM_EFUSE_WRITE,
> -- 
> 2.34.1
> 
> 

-- 
Best Regards,
Evgeny Bachinin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
