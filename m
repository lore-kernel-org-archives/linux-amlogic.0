Return-Path: <SRS0=PsYD=QE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67FA0C282C8
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Jan 2019 10:09:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 143EA2148E
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Jan 2019 10:09:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nbjaaSj0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="XsPof6+t"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 143EA2148E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=t3aYdMy9EmX3LFclgXCSMBB0wLM8tC8I3JR3pNTal9E=; b=nbjaaSj0hpci2UGOkVZB6vkl8V
	8b8PMqgRt0BamJDuPJkT1GmnGMp/y86qyM++lsGvs6DU4F6J1vNeKNDzfvTnjcNB35IHT7B3ThXOu
	7efNiCex0AvjGF6sKXa+PsEix+40hBfAQ00ynRarcjsX+9CJ/2vhglXKhFydDv5iTLA1tGDbYNoh6
	Kylw5aLJsxSPNJLmnn2WkG3FpGBNJQpO5iA7+dni4QJv+jwMGLUM3sXh//UEzJV/pARaImXSqqU7b
	X+oqaq5E841e/pdcK3dqUNMU7nYBTDL7vmdEKKIBTZu/UNiG4yx0ay0d6kSL1q2uOcm0HTQFxx8YO
	iR8bLChg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1go3qf-0007ja-MJ; Mon, 28 Jan 2019 10:09:01 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1go3qc-0007j4-9Q
 for linux-amlogic@lists.infradead.org; Mon, 28 Jan 2019 10:09:00 +0000
Received: by mail-wm1-x343.google.com with SMTP id f188so13134393wmf.5
 for <linux-amlogic@lists.infradead.org>; Mon, 28 Jan 2019 02:08:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=em0GnEijPJTtpGUpNkQzPVaAGdU3YXiw+3o/5IZSo0I=;
 b=XsPof6+tLHaowDfSxOTlEHVn5/0uOpnzCriFSc7BjDBDv3r7zcuuHnUVLfVLU8+wc9
 oQUGL0npdVIb4BU09+cZmbMDYw4ly2bZSAsmspmzJvXncSxt5TOq+tTC1nyvRGjY5f9Z
 lppiNeuSIrDDTjSrAOJ1hBSnfX9ZiQsqgJh6RQHwxvzD11ouTF39lbZ9g8HcckQDKh6I
 lmjmm0E/lCLeLXGjgLLLvJ2UjLTA6USyi11J0cST1hPwUQF4U7d+inoyzB8j7HQhGmhh
 4jy8XfIPD/OGAMuhyhLr3T8fze8bLVQHLuTfatQD2BL7gYod1WG7Sd4wsSKaktt8oxCd
 +kvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=em0GnEijPJTtpGUpNkQzPVaAGdU3YXiw+3o/5IZSo0I=;
 b=X1WnJy5nrMerrSkozk0RHgk5VmeFukkPk8kzSfjmweqW1DPzqDPBmp6jRx2jOUJDoB
 /67s4nY6uqlPuWHDwYpAbnVJHuEhF/wprNbh9E3Y5oYaLk0Du6jylyWTRyhKtO8DTiM9
 imx1l5PiaS9TV6Va8A5E6klvXENisAyb7KxmWLA35VbW2rGrt1VoHCJBSEa4wv3PFA+P
 xCDx7SB+Og62E22xiSQUd5+M4fN9IoiFlL9cUrhf2XAD/znMvgdFR2+ly4T4uE6946w4
 JsuKMayYRDTdz0td+wvJW0bFwcB1ra5x7pdInyI5y3IPuonGLuOQWoFffzXUUnUEWk/C
 aNzg==
X-Gm-Message-State: AJcUukdeiTTFFpKi40P4uI56lkLQHT8YZuZO6bPxfRIC78/rCApDNReO
 azfDmVEUoEDkAOtcSGY62dfQGEnqo3vigA==
X-Google-Smtp-Source: ALg8bN6Qhzy4jNd6+gtt2VE3MNwgeAKkyUAJC2p1KW+PomYkqfdVyK00g1RZxidDRhDpNroisev77A==
X-Received: by 2002:a1c:96ce:: with SMTP id y197mr17017563wmd.36.1548670135625; 
 Mon, 28 Jan 2019 02:08:55 -0800 (PST)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id h16sm231907307wrb.62.2019.01.28.02.08.54
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 28 Jan 2019 02:08:54 -0800 (PST)
Subject: Re: odroidc1 eth0 problem with 250HZ
To: Piero <ottuzzi@gmail.com>, linux-amlogic@lists.infradead.org
References: <CAPo5REEKkqctyS2+X8xjn8YgH93RrtAqBu4nELxzgSo0TCgeAQ@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <d017efc7-e5ba-ea5f-4218-0f05ed86bbec@baylibre.com>
Date: Mon, 28 Jan 2019 11:08:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CAPo5REEKkqctyS2+X8xjn8YgH93RrtAqBu4nELxzgSo0TCgeAQ@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190128_020858_332904_869671FC 
X-CRM114-Status: GOOD (  15.17  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

On 24/01/2019 15:22, Piero wrote:
> Hi,
> 
>     I tested armbian distribution on my odroid C1+ using kernel
> 4.19.17 and later.
> I observed that with 250HZ kernel eth0 is non-functional giving the
> following error:
> 
> [   14.853086] IPv6: ADDRCONF(NETDEV_UP): eth0: link is not ready
> [   14.853367] meson8b-dwmac c9410000.ethernet eth0: device MAC
> address b6:e8:26:b6:da:4a
> [   14.853378] meson8b-dwmac c9410000.ethernet eth0: Could not attach to PHY
> [   14.853386] meson8b-dwmac c9410000.ethernet eth0: stmmac_open:
> Cannot attach to PHY (error: -19)
> [   15.064433] IPv6: ADDRCONF(NETDEV_UP): eth0: link is not ready
> [   15.084471] meson8b-dwmac c9410000.ethernet eth0: Could not attach to PHY
> [   15.084486] meson8b-dwmac c9410000.ethernet eth0: stmmac_open:
> Cannot attach to PHY (error: -19)
> [   15.193033] IPv6: ADDRCONF(NETDEV_UP): eth0: link is not ready
> [   15.225926] meson8b-dwmac c9410000.ethernet eth0: Could not attach to PHY
> [   15.225958] meson8b-dwmac c9410000.ethernet eth0: stmmac_open:
> Cannot attach to PHY (error: -19)
> [   15.239227] IPv6: ADDRCONF(NETDEV_UP): eth0: link is not ready
> [   15.293190] meson8b-dwmac c9410000.ethernet eth0: Could not attach to PHY
> [   15.293213] meson8b-dwmac c9410000.ethernet eth0: stmmac_open:
> Cannot attach to PHY (error: -19)
> [   15.306038] IPv6: ADDRCONF(NETDEV_UP): eth0: link is not ready
> [   15.352091] meson8b-dwmac c9410000.ethernet eth0: Could not attach to PHY
> [   15.352111] meson8b-dwmac c9410000.ethernet eth0: stmmac_open:
> Cannot attach to PHY (error: -19)
> [   15.370056] IPv6: ADDRCONF(NETDEV_UP): eth0: link is not ready
> 
> Only changing 250HZ to 100HZ is enough to fix this problem.
> Some more details on armbian forum[1].
> Can you check it please?
> I can provide more logs and details if requested. If needed I can test fixes.

This is weird, it could be a sleep not long enough with the changed HZ, can you test other values ?

Do you have other failures ?

Neil

> 
> Thanks in advance
> **Bye
> Piero
> [1]https://forum.armbian.com/topic/9138-odroid-c0c1c1-please-update-the-mainline-kernel-version/
> 
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic
> 



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
