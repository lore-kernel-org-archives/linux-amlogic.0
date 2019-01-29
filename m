Return-Path: <SRS0=Lc8Q=QF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 525A6C169C4
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Jan 2019 10:15:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E65721473
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Jan 2019 10:15:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fO9ZVx2v"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E65721473
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xS4NLrXk3uRPKl0VDaNQIkb+8dlxTbG9y6zEOwk/MYI=; b=fO9ZVx2voDhx2p
	iVepDQ1Cp8DlKEkOHOBu/yQeb/BsulSYpg+0Iil414Bgi4QiM9pTRA9W/249oCHutbxhFMz2jWius
	8bi8zHGO+uLQEFsnOcF46d0fpGzcuP7IOiIfGlQmZ2pTHqn2OTPILq/3OIabZPR6zYwtwymyVhdfi
	C/moF3fWKqKX/X05cBuAS/MUtJ9YnaF/jQQm73iOZfgtEB4OF2edWkL+4OqsSzk+1VfM8PO/8Ds3y
	/bJr8yuZ20XoHtEsWTUkXbzAVozFQvRjXIkb40d/r67YHifpfoB8Wr5ZGKNSCRpsRHivjxvKmyH7i
	2D+KebunbooJaLtOa3fg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1goQPt-0004Kk-RY; Tue, 29 Jan 2019 10:14:53 +0000
Received: from mail-out.m-online.net ([212.18.0.10])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1goQPq-0004Jx-BW
 for linux-amlogic@lists.infradead.org; Tue, 29 Jan 2019 10:14:52 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 43pj6J1RLgz1rhxT;
 Tue, 29 Jan 2019 11:14:48 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 43pj6J0tScz1r2HQ;
 Tue, 29 Jan 2019 11:14:48 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id Nrep6uhq0wQD; Tue, 29 Jan 2019 11:14:46 +0100 (CET)
X-Auth-Info: V3kKoQOQfna/1iYlEi+7y/s/uiM4irXX49bAWhPd/YE=
Received: from crub (p508DEA88.dip0.t-ipconnect.de [80.141.234.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Tue, 29 Jan 2019 11:14:46 +0100 (CET)
Date: Tue, 29 Jan 2019 11:14:41 +0100
From: Anatolij Gustschin <agust@denx.de>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [U-Boot] [PULL u-boot] Please pull u-boot-amlogic-20190128
Message-ID: <20190129111441.23a51645@crub>
In-Reply-To: <e2aa97d7-bd82-ba11-c881-5eb6861a12cc@baylibre.com>
References: <e2aa97d7-bd82-ba11-c881-5eb6861a12cc@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190129_021450_543808_2C697491 
X-CRM114-Status: UNSURE (   7.80  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: U-Boot Mailing List <u-boot@lists.denx.de>, trini@konsulko.com,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Neil,

On Mon, 28 Jan 2019 14:09:13 +0100
Neil Armstrong narmstrong@baylibre.com wrote:
...
> ----------------------------------------------------------------
> Adds pinconf support for the Amlogic pinctrl driver
> 
> ----------------------------------------------------------------
> Jerome Brunet (1):
>       pinctrl: meson: add pinconf support
> 
>  drivers/pinctrl/meson/Kconfig                 |   1 +
>  drivers/pinctrl/meson/pinctrl-meson-axg-pmx.c |  10 +++

This change breaks building, please see error log here [1].
I think, a comma is missing after

 .pinconf_params = meson_axg_pinconf_params

Please fix.

[1] https://travis-ci.org/trini/u-boot/jobs/485695412#L1033

--
Anatolij

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
