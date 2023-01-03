Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8194C3DA7D
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Jan 2023 17:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=azSxmhvy57rll/cTJRNX+ztAOis6y1EHUJ2g0uMKIZE=; b=ZWYqRk3ssNBQ3+R1JCOcCKzpUs
	vfKdkyqV4oegwdI8q44GIfIw9jmv+AY55kFxuMM6Yra/CVu/8dCcjx1XsIxlYig34MwV9M8+p+lbn
	PjpQbSF3ehfMq4g6/b8D9ItVeJHCNOT5uhkssQkz4MPIQoMMGJzKkng9+N4P8YjhymnqsNsQ23pj3
	wtz/YdvDF+X1mei2SdmCQBlnS7Iuv+e/Vs2w6y/TDCRwenijRDiLIJIrWiDcHtaUksksEjUYY7kNq
	OZ5jlcAzpy9LJwr4OgMRFhLKgnHAS7qmxu4++5Q4+fqqQhkv9iDC67aIWT9YcXpEMsmJfAKO8myVJ
	HHaFV11Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCl4Q-003Ova-7A; Tue, 03 Jan 2023 17:27:26 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCiYK-0026dG-Fd
	for linux-amlogic@lists.infradead.org; Tue, 03 Jan 2023 14:46:12 +0000
Received: from [192.168.1.27] (cst-prg-44-69.cust.vodafone.cz [46.135.44.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: tomeu)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 95AEF6602CDE;
	Tue,  3 Jan 2023 14:46:02 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1672757162;
	bh=zzK/4X9HwMsb8vU6i7RiJAcbQSco76cw3wX9BR3S8rw=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=ikdqdwJAXTSAsS6NqQ/7bDCXXN/P8OEQ30sEio/4fVbND6oGE/7Gcm0ezDkLamSNL
	 1p0S0E1qrlh5uuf6G4ZzfJQA8Y9RSwZayUj2IHnpaTgbMpR/znggdDmthX1We0PFoW
	 vFxlexN+Mgky+8JTlz773AJPdsSxFqvHva4tJajcdEbZX/gPTG3jSEbD+KOpeyWwlN
	 yQ/AFZTaHtAmiQw4jed1rMSIkh7+cP4mRqqiyX6NMgWEvbd3tPNKFEmL/06MiV5Ifg
	 L3dv64XiRqUPBERotOjamn+qWjSV8elux+Jm1tVPMepdT4xnS+MKSf3PJGpneXZYUj
	 X+7mZ3MLbMg9g==
Message-ID: <c8322c28-656a-64cc-58fe-668026723821@collabora.com>
Date: Tue, 3 Jan 2023 15:46:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: failed to start gnome/gdm3 wayland session after apply NPU
 patches
Content-Language: en-US
To: Zhang Ning <zhangn1985@outlook.com>, linux-amlogic@lists.infradead.org
References: <OS0P286MB0641E5D5C1CF9D1E100EFFB6CDED9@OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM>
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
In-Reply-To: <OS0P286MB0641E5D5C1CF9D1E100EFFB6CDED9@OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_064609_847170_229091C8 
X-CRM114-Status: UNSURE (   8.21  )
X-CRM114-Notice: Please train this message.
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Ning,

On 12/27/22 05:21, Zhang Ning wrote:
> Hi, Tomeu
> 
> after apply your NPU patches:
> http://lists.infradead.org/pipermail/linux-amlogic/2022-December/014428.html
> 
> VIM3 failed to start gnome/gdm3 wayland session.
> 
> before:
> 
> VIM3:~$ ls /dev/dri/by-path/ -l
> total 0
> lrwxrwxrwx 1 root root  8 Dec 27 04:06 platform-ff900000.vpu-card -> ../card0
> lrwxrwxrwx 1 root root  8 Dec 27 04:06 platform-ffe40000.gpu-card -> ../card1
> lrwxrwxrwx 1 root root 13 Dec 27 04:06 platform-ffe40000.gpu-render -> ../renderD128
> 
> after:
> 
> VIM3:~$ ls /dev/dri/by-path/ -l
> total 0
> lrwxrwxrwx 1 root root  8 Dec 27 04:10 platform-etnaviv-card -> ../card0
> lrwxrwxrwx 1 root root 13 Dec 27 04:10 platform-etnaviv-render -> ../renderD128
> lrwxrwxrwx 1 root root  8 Dec 27 04:10 platform-ff900000.vpu-card -> ../card1
> lrwxrwxrwx 1 root root  8 Dec 27 04:10 platform-ffe40000.gpu-card -> ../card2
> lrwxrwxrwx 1 root root 13 Dec 27 04:10 platform-ffe40000.gpu-render -> ../renderD129
> 
> the fail log:
> Dec 27 04:10:42 VIM3 gnome-shell[673]: g_hash_table_destroy: assertion 'hash_table != NULL' failed
> Dec 27 04:10:42 VIM3 gnome-shell[673]: Failed to open gpu '/dev/dri/card0': No suitable mode setting backend found
> Dec 27 04:10:42 VIM3 gnome-shell[673]: Added device '/dev/dri/card1' (meson) using atomic mode setting.
> Dec 27 04:10:42 VIM3 gnome-shell[673]: g_hash_table_destroy: assertion 'hash_table != NULL' failed
> Dec 27 04:10:42 VIM3 gnome-shell[673]: Failed to open gpu '/dev/dri/card2': No suitable mode setting backend found
> Dec 27 04:10:42 VIM3 gnome-shell[673]: Failed to initialize accelerated iGPU/dGPU framebuffer sharing: No matching EGL configs
> Dec 27 04:10:42 VIM3 gnome-shell[673]: Created gbm renderer for '/dev/dri/card1'
> Dec 27 04:10:42 VIM3 gnome-shell[673]: Integrated GPU /dev/dri/card1 selected as primary
> 
> how to configure system to boot to gui with npu enabled?

Maybe you can do that by setting the "mutter-device-preferred-primary" 
udev tag for card2?

https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/1562

Regards,

Tomeu

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
